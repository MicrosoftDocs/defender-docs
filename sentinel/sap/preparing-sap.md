---
title: Configure your SAP system for the Microsoft Sentinel solution
titleSuffix: Microsoft Sentinel
description: Learn about extra preparations required in your SAP system to connect Microsoft Sentinel to your SAP system.
ms.author: monaberdugo
author: mberdugo
ms.topic: how-to
ms.date: 08/04/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
#Customer intent: As an SAP BASIS team member, I want to configure SAP authorizations and deploy optional SAP Change Requests so that I can ensure proper connectivity and log retrieval from SAP systems for security monitoring.

---

# Configure your SAP system for the Microsoft Sentinel solution

This article describes how to prepare your SAP environment for connecting to the SAP data connector. Before you begin, make sure you've reviewed the [prerequisites for deploying the Microsoft Sentinel solution for SAP applications](prerequisites-for-deploying-sap-continuous-threat-monitoring.md).


This article is part of the second step in deploying the Microsoft Sentinel solution for SAP applications. While steps that are performed in Microsoft Sentinel require that the solution be installed first, other preparations in the SAP environment can happen in parallel.

:::image type="content" source="media/deployment-steps/prepare-sap-environment-agentless.png" alt-text="Diagram of the deployment flow for the Microsoft Sentinel solution for SAP applications, with the preparing SAP step highlighted." border="false":::

Many of the procedures in this article are typically performed by your **SAP BASIS** team. Some steps include your **security** team too.

## Prerequisites

- Before you start, make sure to review the [prerequisites for deploying the Microsoft Sentinel solution for SAP applications](prerequisites-for-deploying-sap-continuous-threat-monitoring.md).
- Some steps are performed in Microsoft Sentinel and require that you [deploy the Microsoft Sentinel solution for SAP applications](deploy-sap-security-content.md) first.


## Configure the Microsoft Sentinel role

To allow the SAP data connector to connect to your SAP system, you must create an SAP system role specifically for this purpose.



Create a role using the [**MSFTSEN_SENTINEL_READER**](https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Solutions/SAP/Sample%20Authorizations%20Role%20File/MSFTSEN_SENTINEL_READER.SAP) template, which includes all the basic permissions for the data connector to operate.


For more information, see the SAP documentation on [creating roles](https://help.sap.com/docs/ABAP_PLATFORM_NEW/ad77b44570314f6d8c3a8a807273084c/4c93141f5c153c91e10000000a42189c.html).

### Create a user

The Microsoft Sentinel solution for SAP applications requires a user account to connect to your SAP system. When creating your user:


- Make sure to create a system user.
- Assign the **MSFTSEN_SENTINEL_READER** role to the user, which you created when you [configured the Microsoft Sentinel role](#configure-the-microsoft-sentinel-role).

For more information, see the [SAP documentation](https://help.sap.com/docs/ABAP_PLATFORM_NEW/ad77b44570314f6d8c3a8a807273084c/4cb5f7ac9cb33c94e10000000a42189c.html?version=LATEST).

## Configure SAP auditing

Some installations of SAP systems might not have audit logging enabled by default. For best results in evaluating the performance and efficacy of the Microsoft Sentinel solution for SAP applications, enable auditing of your SAP system and configure the audit parameters.

We recommend that you configure auditing for *all* messages from the audit log, instead of only specific logs. Ingestion cost differences are generally minimal and the data is useful for Microsoft Sentinel detections and in post-compromise investigations and hunting.

> [!TIP]
> If you want to ingest SAP HANA DB logs, make sure to also enable auditing for SAP HANA DB. For more information, see [Collect SAP HANA audit logs in Microsoft Sentinel](collect-sap-hana-audit-logs.md)

> [!TIP]
> For SAP systems managed by SAP RISE/ECS, Security Audit Log enablement is part of the shared responsibility agreement. Verify with your SAP contact if auditing is already active by default or if any additional steps need to be taken. [SAP S/4HANA Cloud public edition](https://azuremarketplace.microsoft.com/marketplace/apps/sap_jasondau.azure-sentinel-solution-s4hana-public?tab=Overview) systems have auditing enabled by default.

For full monitoring coverage with the agentless data connector, we recommend that you enable monitoring on all client IDs of your monitored SAP systems, including clients 000 and 066.

For more information, see [Analysis and recommended settings of the Security Audit Log (SM19/RSAU)](https://community.sap.com/t5/application-development-blog-posts/analysis-and-recommended-settings-of-the-security-audit-log-sm19-rsau/ba-p/13297094).

## Configure your system to use SNC for secure connections

By default, the SAP data connectors use a remote function call (RFC) connection and a username and password to authenticate to the SAP system.

To encrypt the RFC connection or use certificate-based authentication, configure SAP Smart Network Communications (SNC). Work with your SAP administrators and your organization's public key infrastructure (PKI) team to plan the SNC configuration. Follow SAP guidance for the SAP components, certificates, and trust relationships in your environment.

Before you configure the Microsoft Sentinel connection:

- Configure SNC for SAP NetWeaver Application Server for ABAP (AS ABAP). For an example that uses CommonCryptoLib, see [SAP Note 2979858: Example SNC Configuration for AS ABAP with COMMONCRYPTOLIB](https://me.sap.com/notes/2979858/E).
- Decide whether to use certificates signed by your organization's certification authority (CA) or self-signed certificates. Establish trust between the SAP system and the component that initiates the RFC connection. For SAP certificate guidance, see [SAP Note 2970934: How to create the CSR and how to import the certificate response for ABAP system](https://me.sap.com/notes/2970934/E).
- Validate the SNC connection according to SAP guidance before you connect Microsoft Sentinel.


For the agentless data connector, configure SNC in SAP Cloud Connector. For more information, see [SAP KBA 3536285: SAP Cloud Connector - How to set up general SNC settings for SAP Cloud Connector](https://me.sap.com/notes/3536285/E).

If you use SAP Cloud Connector high availability, also validate SNC after switching to the shadow instance.

For more information, see the SAP documentation on [configuring SNC](https://help.sap.com/docs/ABAP_PLATFORM_NEW/e73bba71770e4c0ca5fb2a3c17e8e229/e656f466e99a11d1a5b00000e835363f.html) and [Getting started with SAP SNC for RFC integrations](https://community.sap.com/t5/enterprise-resource-planning-blogs-by-members/getting-started-with-sap-snc-for-rfc-integrations/ba-p/13983462).



## Configure SAP BTP settings

To prepare SAP Business Technology Platform (BTP) for the agentless data connector, configure the following services and roles in your SAP BTP subaccount.

1. In your SAP BTP subaccount, add entitlements for the following services:

    - SAP Integration Suite
    - SAP Process Integration Runtime
    - Cloud Foundry Runtime

    > [!NOTE]
    > This solution considers only SAP Cloud Integration in the Cloud Foundry environment.

1. Create an instance of Cloud Foundry Runtime, and then also create a Cloud Foundry space.

1. Create an instance of SAP Integration Suite.

1. Assign the SAP BTP **Integration_Provisioner** role to your SAP BTP subaccount user account.

1. In the SAP Integration Suite, add the cloud integration capability.

1. Assign the following process integration roles to your user account:

    - **PI_Administrator**
    - **PI_Integration_Developer**
    - **PI_Business_Expert**

    The **PI_Administrator**, **PI_Integration_Developer**, and **PI_Business_Expert** roles are available only after you activate the cloud integration capability.

1. Create an instance of the SAP Process Integration Runtime in your subaccount using service plan **integration-flow** (not API!).

1. Create a service key for the SAP Process Integration Runtime and save the JSON contents to a secure location. You must activate the cloud integration capability before creating a service key for SAP Process Integration Runtime.

For more information, see the SAP documentation on [Initial Setup of SAP Integration Suite](https://help.sap.com/docs/integration-suite/sap-integration-suite/initial-setup).

## Configure the connector in Microsoft Sentinel and in your SAP system

This procedure has steps both in Microsoft Sentinel and your SAP system, and requires coordination with the SAP administrator.

1. In Microsoft Sentinel, go to the **Configuration > Data connectors** page and locate the **Microsoft Sentinel for SAP - agentless** data connector.

1. In the **Configuration** section, expand and follow the instructions in the **Initial connector configuration - Run the steps below once:** section. These steps will require both your SecuritySOC engineer and the SAP admin.
    1. Trigger automatic deployment of Azure resources (SOC Engineer).
       If, after you deploy the Azure resources, the values in the steps 2 and 3 aren't automatically populated, close and re-expand step 1 to refresh the values in steps 2 and 3.
    1. Deploy an OAuth2 client credentials artifact in the SAP Integration (SAP Admin).

    1. Deploy the SAP agentless data connector package to the SAP Integration Suite (SAP Admin). This procedure is performed from  the SAP Integration Suite portal ([SAP Cloud Integration Web UI](https://help.sap.com/docs/cloud-integration/sap-cloud-integration/overview-of-sap-cloud-integration-web-ui)).

        1. Open the **Discover** section.
        1. Search for **Microsoft Sentinel Solution** and open it.
        1. Click on **Copy** to import the integration package into your Cloud Integration tenant.
        1. Open the package and go to the **Artifacts** tab. Then select the **Data Collector** configuration. For more information, see the SAP documentation on [importing integration packages](https://help.sap.com/docs/integration-suite/sap-integration-suite/importing-integration-packages).
        1. Configure the integration flow with the **LogIngestionURL** and the **DCRImmutableID**.
        1. Deploy the iflow using SAP Cloud Integration as the runtime service.

## Configure SAP Cloud Connector settings

Configure SAP Cloud Connector to enable communication between your SAP backend system and SAP BTP. Before you begin, make sure you have the credentials required to add your SAP BTP subaccount in SAP Cloud Connector.

1. Install the SAP Cloud Connector. For more information, see [Installation of SAP Cloud Connector](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/installation).

1. Sign in at the cloud connector interface, and add the subaccount using the relevant credentials. For more information, see the SAP documentation on [managing subaccounts in SAP Cloud Connector](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/managing-subaccounts).

1. In your cloud connector subaccount, add a new system mapping to the backend system to map the ABAP system to the RFC protocol.

1. Define load balancing options and enter your backend ABAP server details. Copy the name of the virtual host to a secure location to use when you create the SAP BTP destination.

1. Add new resources to the system mapping for each of the following function names:

   - **RSAU_API_GET_LOG_DATA**, to fetch SAP security audit log data

   - **BAPI_USER_GET_DETAIL**, to retrieve SAP user details

   - **RFC_READ_TABLE**, to read data from required tables

   - **SIAG_ROLE_GET_AUTH**, to retrieve security role authorizations

   - **/OSP/SYSTEM_TIMEZONE**, to retrieve SAP system timezone details

    > [!NOTE]
    > The **MSFTSEN_SENTINEL_READER** role described in [Configure the Microsoft Sentinel role](#configure-the-microsoft-sentinel-role) is configured for least privilege access. This ensures function modules such as RFC_READ_TABLE are used only as needed. Consider [SAP's best practices for RFC access](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/configure-access-control-rfc#loioca5868997e48468395cf0ca4882f5783__limit) and SAP Unified Connectivity (UCON) settings to control function module access beyond the controls of SAP Cloud Connector and the SAP role.

1. Add a new destination in SAP BTP that points the virtual host you'd created earlier. Use the following details to populate the new SAP BTP RFC destination for Microsoft Sentinel:

   - **Name**: Enter the name you want to use for the Microsoft Sentinel connection

   - **Type**: `RFC`

   - **Proxy Type**: `On-Premise`

   - **User**: Enter the [ABAP user account](#create-a-user) you created earlier for Microsoft Sentinel

   - **Authorization Type**: `CONFIGURED USER`

   - **Additional properties**:

      - `jco.client.ashost = <virtual host name>`

      - `jco.client.client = <client e.g. 001>`

      - `jco.client.sysnr = <system number = 00>`

      - `jco.client.lang = EN`

   - **Location**: Only required when you connect multiple Cloud Connectors to the same BTP subaccount. For more information, see the SAP documentation on [parameters influencing communication behavior](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/parameters-influencing-communication-behavior).

## Optimize SAP Cloud Connector sizing, throughput, and isolation

Default SAP Cloud Connector settings suit most environments. Tune it before you go live when Microsoft Sentinel ingestion is high volume, bursty, or shares an SAP Cloud Connector with other integrations.

1. Confirm sizing for the Cloud Connector master instance: [Sizing for master instance](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/sizing-for-master-instance).
1. If SAP Cloud Integration (CPI) reports `IOError on tunnel socket during connect attempt`, use SAP note [3403815](https://me.sap.com/notes/0003403815) to tune throughput and request limits.
1. Enable runtime monitoring: [Cloud Connector monitoring](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/cloud-connector-monitoring).
1. Recover stale or stuck SAP Cloud Connector sessions by following SAP note [2485510](https://me.sap.com/notes/0002485510).

> [!TIP]
> Dedicate an SAP Cloud Connector instance to Microsoft Sentinel traffic when the shared connector runs close to saturation, when other integrations cause volatile load patterns, or when security or regulatory requirements mandate isolation. A dedicated instance protects ingestion from noisy-neighbor incidents and simplifies capacity planning, change control, and audit scope.


## Run the prerequisite checker

Run the prerequisite checker to validate that your SAP system is ready for integration with Microsoft Sentinel.

1. The **Prerequisite checker** iflow is included in the Microsoft Sentinel Solution integration package. Configure and deploy this iflow before continuing to the next step, so your SAP system meets the system prerequisites before integration with Microsoft Sentinel. After deployment, the iflow runs on a schedule in SAP Cloud Integration; review the latest run status to confirm success.

    [!INCLUDE [sap-agentless-prerequisites](../includes/sap-agentless-prerequisites.md)]

1. On the Sentinel portal, scroll further down in the **Configuration** area, and expand and follow the instructions in the **Add monitored SAP Systems - Run the steps below for each monitored SAP system:** area for each SAP system you want to monitor.

    In the **Add monitored SAP Systems** wizard in Microsoft Sentinel, at the step named **Connect SAP System to Microsoft Sentinel / SOC Engineer**, continue with [Connect your SAP system to Microsoft Sentinel](deploy-data-connector-agentless.md).



<a name="next-step"></a>
## Next step

> [!div class="nextstepaction"]
> [Connect your SAP system to Microsoft Sentinel](deploy-data-connector-agentless.md)
