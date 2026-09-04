---
title: Troubleshoot the Microsoft Sentinel solution for SAP applications agentless data connector
description: Learn how to troubleshoot specific issues that might occur in your Microsoft Sentinel solution for SAP applications agentless data connector deployment.
ms.author: monaberdugo
author: mberdugo
ms.topic: troubleshooting
ms.date: 08/04/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted

#Customer intent: As an SAP BASIS team member, I want to troubleshoot issues with my Microsoft Sentinel for SAP applications agentless data connector so that I can ensure accurate and timely data ingestion and monitoring.

---

# Troubleshooting your Microsoft Sentinel solution for SAP applications deployment

This article includes troubleshooting steps to help you ensure accurate and timely data ingestion and monitoring for your SAP environment with Microsoft Sentinel.


When working with the agentless data connector, most troubleshooting is done directly in the SAP Integration Suite, where the message log displays errors indicating the nature of the issue encountered.


Start by examining the message processing logs. For more information, see the [SAP documentation](https://help.sap.com/docs/cloud-integration/sap-cloud-integration/monitor-message-processing-monitor). The error messages there can help you diagnose issues with missing permissions, connectivity errors, and other misconfigurations.

If you don't see a related error to your issue, turn on trace logging for more in-depth troubleshooting. For more information, see the [SAP documentation](https://help.sap.com/docs/cloud-integration/sap-cloud-integration/setting-log-levels).

## Check for prerequisites

The agentless data connector package, deployed while [performing the initial connector configuration](preparing-sap.md#configure-the-connector-in-microsoft-sentinel-and-in-your-sap-system), includes a tool to help SAP admins diagnose and fix issues related to the SAP environment configuration. 

[!INCLUDE [sap-agentless-prerequisites](../includes/sap-agentless-prerequisites.md)]

## Missing functionality in legacy SAP systems

Some legacy SAP systems may be missing required functionality for the **RFC_READ_TABLE** function module. Make sure that your SAP admin has reviewed SAP notes 3390051 and 382318, and has patched the system accordingly.

For more information, see [Configure SAP Cloud Connector settings](preparing-sap.md#configure-sap-cloud-connector-settings).

## "Deploy required Azure resources" error when setting up the data connector

When you set up the Microsoft Sentinel for SAP - agentless data connector, under the **Initial connector configuration > Step 1: Trigger automatic deployment of required Azure resources / SOC Engineer**, after you select **Deploy required resources**, you might see the "Deploy required Azure resources" error or similar (errors may vary). This error might indicate that you're missing the required permissions for the Entra ID app registration.

If you don't have the **Entra ID Application Developer** role or higher, you need to work with a colleague that has this permission to finish setting up the Azure resources. For more information, follow the procedure in the [agentless data connector connection](deploy-data-connector-agentless.md#connect-your-agentless-data-connector) step.

## Missing "Last address routed"

If you see an error in the security audit log that you're missing the last address routed (an IP address), follow the guidance in the SAP note 3566290.

## Incomplete SAP user master data

If you see an error that you have incomplete SAP user master data or no data in the **ABAPAuthorizationDetails** Microsoft Sentinel table, do the following:

1. Confirm that the **SIAG_ROLE_GET_AUTH** SAP function module exists in the SAP source system.
1. Follow the guidance in SAP note 3088309 for the relevant solution.  

## Status code 500 on SAP system connect on Sentinel

If you see an error with status code 500 during the connect process from Sentinel to SAP Cloud Integration, contact your SAP colleague monitoring the integration flow "Data Collector" on SAP Cloud Integration. By nature the error message details are only available on SAP's [Message Processing Log](https://help.sap.com/docs/cloud-integration/sap-cloud-integration/message-processing-log).

## Long message processing times or message volume anomalies on SAP Cloud Integration

If you see sudden spikes in message volumes and processing times on SAP Cloud Integration, consider filtering responsible sources on the NetWeaver side. There are two options available.

1. Use transaction [SM19 and SAP's best practices](https://community.sap.com/t5/application-development-and-automation-blog-posts/analysis-and-recommended-settings-of-the-security-audit-log-sm19-rsau/ba-p/13297094) to apply filter settings on Users and message classes causing the spike
1. Use the [filter capabilities](deploy-data-connector-agentless.md#customize-data-connector-behavior-optional) of the Sentinel package on SAP Cloud Integration to apply filtering on log read. The parameter max-rows are pre-populated to protect the integration flow from message flooding by design.

Note that log filters on NetWeaver impact what is written to the audit log on the source while a filter on SAP Cloud Integration only chooses not to read the problematic entries.

## Timeouts during connector registration or log polling

The Microsoft Sentinel agentless poller enforces two timeouts when calling the SAP Cloud Integration **Data Collector** iflow. Exceeding either limit causes incomplete ingestion or repeated retries. Error messages on SAP Cloud Integration may vary based on which part of the data extraction pipeline fails first.

### Initial connect (45-second limit) – partial data and failed connector registration

When you connect a new SAP system in Microsoft Sentinel, the initial handshake to the Data Collector iflow must complete within **45 seconds**. If the SAP integration takes longer to respond, the connector ingests partial data and the connector registration fails.

To remediate:

1. Run the [Prerequisite checker](preparing-sap.md#run-the-prerequisite-checker) iflow and review its runtime measurements to identify the slow downstream call (RFC destination, audit log read, user master read).
1. Tune the SAP integration downstream of SAP Cloud Integration to bring the response time below 45 seconds. Common levers include audit log filter settings ([SM19/RSAU best practices](https://community.sap.com/t5/application-development-and-automation-blog-posts/analysis-and-recommended-settings-of-the-security-audit-log-sm19-rsau/ba-p/13297094)), data connector parameter overrides such as `max-rows` and `offset-in-seconds` (see [Customize data connector behavior](deploy-data-connector-agentless.md#customize-data-connector-behavior-optional)), and SAP Cloud Connector / RFC sizing.
1. If the response time still can't be reduced, switch to the **SAP CPI–internal scheduler** approach by deploying the **Data Collector Scheduler** iflow from the [Microsoft Sentinel for SAP community repository](https://github.com/Azure-Samples/Sentinel-For-SAP-Community). With the scheduler iflow, Microsoft Sentinel doesn't poll or register the connector; it only receives data pushed by SAP Cloud Integration. This approach trades real-time threat protection for higher tolerance to long-running SAP responses.

For an end-to-end discussion of the tradeoffs, see the blog post [Run agentless SAP connector cost-efficiently](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/run-agentless-sap-connector-cost-efficiently/4464781).

### Long-running iflow (180-second limit) – PROCESSING/ABANDONED states and retry snowball

For ongoing log polling, the Data Collector iflow must complete a single message within **180 seconds**. When the iflow exceeds this limit, you typically see message processing log states such as **PROCESSING** or **ABANDONED** in SAP Cloud Integration. Because the Microsoft Sentinel poller doesn't receive a successful response, it retries the **same time slice** repeatedly, which can snowball into overlapping long-running iflow runs and further slow down the SAP system.

To recover and prevent recurrence:

1. Delete the connector from Microsoft Sentinel and wait for the scheduled Sentinel requests to calm down. This breaks the retry snowball.
1. Run the [Prerequisite checker](preparing-sap.md#run-the-prerequisite-checker) iflow to identify the root cause of the slow audit log read response times on SAP (for example, missing indexes, oversized audit log, expensive user master reads on legacy releases).
1. Apply the relevant remediation — audit log filter tuning ([SM19/RSAU best practices](https://community.sap.com/t5/application-development-and-automation-blog-posts/analysis-and-recommended-settings-of-the-security-audit-log-sm19-rsau/ba-p/13297094)), Data Collector parameter overrides such as `max-rows`, `offset-in-seconds`, and `force-sal-filesystem` (see [Customize data connector behavior](deploy-data-connector-agentless.md#customize-data-connector-behavior-optional)) — before reconnecting the data connector in Microsoft Sentinel.
1. If response times still can't be reduced below the 180-second limit, deploy the **Data Collector Scheduler** iflow from the [Microsoft Sentinel for SAP community repository](https://github.com/Azure-Samples/Sentinel-For-SAP-Community). Switching to the SAP CPI–internal scheduler compromises real-time threat protection but avoids the retry pattern enforced by the Microsoft Sentinel poller.

### Connection reset error

If the Data Collector iFlow fails with an error such as `java.lang.Exception: Connection reset`, the connection to the SAP backend was unexpectedly closed before processing completed. This is typically caused by network interruptions in the log extraction chain between SAP Cloud Integration <-> SAP Cloud Connector <-> SAP backend, connectivity issues, timeouts, or SAP backend issues.

Resolution:

- The Sentinel log poller handles small interruptions gracefully through limited retries - no action needed. Longer down times result in abandoned time slices in favor of stable operations.
- Confirm sizing for the SAP Cloud Connector master instance: [Sizing for master instance](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/sizing-for-master-instance).
- Be aware of SAP Cloud Connector connection limits. Use SAP note [3403815](https://me.sap.com/notes/0003403815) to tune limits.
- Use SAP's application health monitors to verify connectivity between SAP Cloud Integration, SAP Cloud Connector, and the SAP system in case investigation is needed. 
- Enable runtime monitoring: [Cloud Connector monitoring](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/cloud-connector-monitoring).
- Isolate the problematic SID log data flow and consult the other timeout related guidance in this section.

## "Memory Exhaustions" reported by SAP Cloud Integration

The **System** > **Memory** > **Usage** tile in SAP Cloud Integration may report memory exhaustions with the **Data collector** iflow as major contributor across several intervals. A considerable based-load allocation on its own is expected for a log-reading integration flow for multiple SIDs and isn't an error by default. Investigate when memory exhaustions are counted alongside it, when message processing times increase, a new system onboarding attempt, or recent SAP upgrade is happening.

Two patterns typically cause this:

- **Growing request backlog for a single SAP system (SID).** The SAP system responds more slowly than the requested log time slice, so requests accumulate and each subsequent poll adds load on top of the unfinished one. This is commonly a downstream effect of the retry pattern described in the [Timeouts during connector registration or log polling section](#timeouts-during-connector-registration-or-log-polling) or too large polling interval configurations. It is recommended to keep the 1 min default setting for heavily used SAP systems.
- **Resource saturation on a shared tenant.** High parallel loads from other integration flows or SAP systems on the same SAP Cloud Integration tenant reduce the resources available to the Data Collector iflow, extending processing times across all flows.

To recover, first apply the remediation in the timeouts section to break the retry pattern and reduce the volume returned per message. If memory exhaustions continue, use SAP Cloud Integration monitoring to determine whether the pressure originates from one SAP system or from overall tenant load. Sustained saturation may require additional SAP Cloud Integration capacity, or distributing SAP systems across multiple Cloud Integration instances.

## Timeouts when SAP security audit logs are filesystem-backed

If Microsoft Sentinel integration requests time out during connector onboarding or ongoing log reads, review how your SAP Security Audit Log is recorded and retrieved, especially when recording is configured as **Filesystem and database**.

Selecting audit logs from SAP HANA database often provides the best performance. Other databases and filesystem-backed selection might require tuning.

To remediate:

1. Confirm with your SAP administrator whether Security Audit Log recording targets include filesystem storage.
1. Implement following SAP notes by using **SNOTE** or by importing the referenced support package (applies to **SAP_BASIS 750+**):
    - **3726943 - RSAU_API_GET_LOG_DATA | Dataselection only from Filesystem details**
    - **3407647 - RSAU_READ_LOG | Optimization of reading audit log files**
1. After implementing the correction, use filesystem-only selection with required parameters `ID_FILESYSTEM_SEL_ONLY` and `ID_FILE_SEL_SIMPLE` for faster retrieval. For behavior details and explanation, see SAP note **3500090**.
1. Re-run connector validation.

Applying these SAP notes often improves retrieval performance significantly. If delays continue, they're typically related to SAP-side factors such as log shipping between application servers and network latency.

## SAP Cloud Connector sizing, throughput, and isolation guidance

If timeout or throughput issues persist, validate SAP Cloud Connector sizing and runtime health by using [Optimize SAP Cloud Connector sizing, throughput, and isolation](preparing-sap.md#optimize-sap-cloud-connector-sizing-throughput-and-isolation).

Use the following symptom-to-SAP-note mapping for incident triage:

| Symptom | Reference |
|---|---|
| CPI logs `IOError on tunnel socket during connect attempt`; ingestion stalls under parallel load | SAP note [3403815](https://me.sap.com/notes/0003403815) |
| SAP Cloud Connector sessions appear stale or unresponsive | SAP note [2485510](https://me.sap.com/notes/0002485510) |
| Repeated shared-connector saturation from other integrations | Isolate Microsoft Sentinel traffic on a dedicated SAP Cloud Connector instance |

## Invalid Credential or cannot get credential for example OAuth2 access token

Besides normal misconfigurations of credentials during registration of the SAP RFC destination on the data connector pane on Microsoft Sentinel, this could be a symptom of attempting integration with unsupported SAP Cloud Platform Integration in the NEO environment. See SAP note [3351844](https://me.sap.com/notes/3351844) for details the end-of-life of services in the NEO environment. Microsoft Sentinel Solution for SAP officially supports SAP Cloud Integration in the Cloud Foundry environment. See the reference on the [SAP preparation guide](preparing-sap.md#configure-sap-btp-settings).

Customers that want to protect their SAP landscape using Cloud Platform Integration in the NEO environment ahead of their migration to SAP Cloud Integration on the Cloud Foundry environment (Integration Suite), can do so by adopting the provided "Data Collector Scheduler" iflow.

It uses a simplified scheduler. The SAP threat protection scope remains the same. The Sentinel hosted Scheduler is dropped from the setup to avoid the mentioned handshake error with the downside of the Sentinel team having no insight on the healthiness of the Cloud Integration endpoints other than the SAP log data arrival. Often this is no concern, since the scope of monitoring resides with the SAP Cloud Platform Integration team anyways.

## CL_SAL_HELPER=>TT_R_CLIENT type not found

This error can occur for various reasons in a variety of SAP Support Package levels that require import of SAP notes to fix the underlying bugs in the SAP standard code. Ensure the function module RSAU_API_GET_LOG_DATA is **remote enabled**, trigger a [manual run from the SAP transaction code SE37](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/SAP/Tools/IntegrationSuite/AUDIT-LOG-SMOKE-TEST.md), and **inspect the output**. The response must show at least one entry in ET_LOG export parameters table.

The [connector prerequisites section](prerequisites-for-deploying-sap-continuous-threat-monitoring.md#sap-prerequisites-for-the-agentless-data-connector) lists typical SAP support notes that helped customers in such situations before. The list is not considered complete and only serves as entry point into a customer's individual path to fix SAP's standard functions, which may vary based on their current support package level and associated upgrade journey.

## Related content

Learn more about the Microsoft Sentinel solution for SAP applications:

- [Deploy Microsoft Sentinel solution for SAP applications](deployment-overview.md)
- [Prerequisites for deploying Microsoft Sentinel solution for SAP applications](prerequisites-for-deploying-sap-continuous-threat-monitoring.md)
- [Configure your SAP system for the Microsoft Sentinel solution](preparing-sap.md)
- [Deploy the solution content from the content hub](deploy-sap-security-content.md)

Reference files:

- [Microsoft Sentinel solution for SAP applications solution data reference](sap-solution-log-reference.md)
- [Microsoft Sentinel solution for SAP applications solution: security content reference](sap-solution-security-content.md)

For more information, see [Microsoft Sentinel solutions](../sentinel-solutions.md).
