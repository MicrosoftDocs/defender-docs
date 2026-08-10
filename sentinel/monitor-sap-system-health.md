---
title: Monitor the health of the connection between Microsoft Sentinel and your SAP system
description: Use the SAP connector page and a dedicated alert rule template to keep track of your SAP systems' connectivity and performance.
ms.author: monaberdugo
author: mberdugo
ms.reviewer: mapankra
ms.topic: how-to
ms.date: 08/04/2026
ms.service: microsoft-sentinel
ai-usage: ai-assisted
#customerIntent: As a security engineer, I want to learn how to monitor the health and connectivity of our SAP system connection to Microsoft Sentinel.

ms.custom: msecd-doc-authoring-1016
---

# Monitor the health and role of your SAP systems

After you [deploy the SAP solution](sap/deployment-overview.md), you want to ensure proper functioning and performance of your SAP systems, and keep track of system role, connectivity, and log ingestion. This article describes how to look up system role and health from workspace tables and functions, and how to use a dedicated alert rule template to monitor the health of your SAP systems.

## Prerequisites

Before you can perform the procedures in this article, you need to have an SAP data connector connected to your SAP system. SAP logs aren't displayed in the Microsoft Sentinel **Logs** page until your SAP system is connected and data starts streaming into Microsoft Sentinel. For more information, see [Connect your SAP system to Microsoft Sentinel](sap/deploy-data-connector-agentless.md).

## Check your SAP data connector's health and connectivity

The agentless data connector page lists the SAP systems (SIDs) you configured, but system role and health are no longer surfaced there as a table. Query them from the workspace instead:

- **System role (production or nonproduction)**. Use the [SAPSystems](sap/sap-solution-function-reference.md#sapsystems) KQL function, which reads the *SAP - Systems* watchlist and returns the `SystemRole` value for each SID. Role also affects billing - see [Solution pricing](sap/solution-overview.md#solution-pricing). Typical values include:

    |Value  |Description  |
    |---------|---------|
    |**Production**     | The system is defined by the SAP admin as a production system.       |
    |**Non-production**     | Roles such as development, test, quality assurance, or training.        |
    |*(empty or missing)*     | The *SAP - Systems* watchlist isn't populated for the SID yet, or the ABAP user can't read the T000 table. Microsoft Sentinel treats an unknown SID as production for security and billing purposes. Populate the watchlist and validate the role permissions on `T000`.       |

- **Health**. Query the **SentinelHealth** table for the SAP data connector, or turn on the *SAP - Data collection health check* alert rule template (see the next sections). Typical signals include:

    |Value  |Description  |
    |---------|---------|
    | **Success** | Microsoft Sentinel identified both logs and a heartbeat from the system. |
    | **Success with warnings** | Connection succeeded, but some log streams returned errors or the ABAP user is missing authorizations. Check the Microsoft Sentinel role definitions on the SAP system, including read access to `T000`. |
    | **Failure** | Microsoft Sentinel can't reach the SAP system or the credentials are invalid. Review the [troubleshooting steps](sap/sap-deploy-troubleshoot.md). |

## View SAP logs streaming into Microsoft Sentinel

The agentless data connector streams SAP logs into standard Log Analytics tables such as `ABAPAuditLog`, `ABAPAuthorizationDetails`, `ABAPChangeDocsLog`, and `ABAPUserDetails`. Query them from Microsoft Sentinel **Logs** (Azure portal) or from **Advanced hunting** (Defender portal). For example, run `ABAPAuditLog | take 50` to confirm that data is arriving.

For the full list of tables and the recommended KQL functions to query them, see [Log and table reference for the Microsoft Sentinel solution for SAP applications](sap-solution-log-reference.md).

## Check the SentinelHealth table for health indicators

The **SentinelHealth** table in Microsoft Sentinel contains health indicators for the SAP data connector, among others. You can query this table to get a summary of the health of your SAP systems.

For more information, see:

- [Auditing and health monitoring in Microsoft Sentinel](health-audit.md)
- [Turn on auditing and health monitoring for Microsoft Sentinel (preview)](enable-monitoring.md)
- [Monitor the health of your data connectors](monitor-data-connector-health.md)
- [Microsoft Sentinel health tables reference](health-table-reference.md)

## Use an alert rule template to monitor the health of your SAP systems

The Microsoft Sentinel for SAP solution includes an alert rule template designed to give you insight into the health of the SAP data collection.

The rule needs at least seven days of loading history to detect the different seasonality patterns. We recommend a value of 14 days for the alert rule **Look back** parameter to allow detection of weekly activity profiles.

Once the alert rule is activated, it judges the recent telemetry and log volume observed on the workspace according to the history learned. The rule then alerts on potential issues, dynamically assigning severities according to the scope of the problem.

To turn on the analytics rule in Microsoft Sentinel, select **Analytics > Rule templates**, and locate the *SAP - Data collection health check* alert rule.

The analytics rule does the following:

- Evaluates the connector's health signals.
- Evaluates telemetry data.
- Evaluates alerts on log continuation and other system connectivity issues, if any are found.
- Learns the log ingestion history, and therefore works better with time.

The following screenshot shows an example of an alert generated by the *SAP - Data collection health check* alert rule:

:::image type="content" source="media/monitor-sap-system-health/alert-rule-example.png" alt-text="Screenshot of an alert triggered by the SAP - Data collection health check alert rule.":::

## Related content

- Learn about the [Microsoft Sentinel Solution for SAP](sap/solution-overview.md)
- Learn how to [deploy the Microsoft Sentinel Solution for SAP](sap/deployment-overview.md)
- Learn about [auditing and health monitoring](health-audit.md) in other areas of Microsoft Sentinel
