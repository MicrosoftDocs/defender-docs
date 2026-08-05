---
title: Prerequisites for deploying Microsoft Sentinel solution for SAP applications
description: This article lists the prerequisites required for deployment of the Microsoft Sentinel solution for SAP applications.
ms.author: monaberdugo
author: mberdugo
ms.topic: reference
ms.date: 08/04/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security

#Customer intent: As a security administrator, I want to understand the prerequisites for deploying a Microsoft Sentinel solution for SAP applications so that I can ensure a smooth and compliant deployment process.

ai-usage: ai-assisted
---

# Deployment prerequisites for the Microsoft Sentinel solutions for SAP applications

This article lists the prerequisites required for deployment of the Microsoft Sentinel solution for SAP applications with the agentless data connector and the SAP Cloud Connector.

Reviewing and ensuring that you have or understand all the prerequisites is the first step in deploying the Microsoft Sentinel solution for SAP applications. Select a connection type to list the prerequisites for your environment.



:::image type="content" source="media/deployment-steps/prerequisites-agentless.png" alt-text="Diagram of the steps included in deploying the Microsoft Sentinel solution for SAP applications, with the prerequisites step highlighted." border="false":::

Content in this article is relevant for your **security** and **SAP BASIS** teams.




## Azure prerequisites

Typically, Azure prerequisites are managed by your **security** teams.

| Prerequisite | Description |Required/optional |
| ---- | ----------- |----------- |
| **Permissions to create Azure resources** | You must have: <br><br>- The necessary permissions to deploy solutions from the Microsoft Sentinel content hub. For more information, see [Prerequisites for deploying Microsoft Sentinel solutions](../sentinel-solutions-deploy.md#prerequisites) and [Microsoft Entra built-in roles](/entra/identity/role-based-access-control/permissions-reference#application-administrator). <br>Owner on the Microsoft Sentinel resource group, required for:<br><br>- Creation of data collection rule and data collection endpoint.<br><br>- Monitoring Metrics Publisher role assignment on data collection rule. |Required |
| **Read permissions to shared keys for the workspace** | For more information, see [Install Log Analytics agent on Windows computers](/azure/azure-monitor/platform/agent-windows##workspace-id-and-key). | Required |
| **Permissions in Microsoft Entra**|You must have permissions in Microsoft Entra ID required to create app registrations. This permission can be obtained through membership of built-in Microsoft Entra ID role:<br><br>- Application Developer.|Required |

## SAP prerequisites for the agentless data connector

We recommend that your **SAP BASIS** team verify and ensure SAP system prerequisites. The SAP BASIS admin should review SAP notes 3390051 and 382318 to ensure that NetWeaver is set up for integration.

We strongly recommend that any management of your SAP system is carried out by an experienced SAP system administrator.

| Prerequisite | Description |
| ---- | ----------- |
| **Supported SAP versions** | The **Agentless** solution supports SAP NetWeaver systems with [SAP_BASIS versions 750](https://userapps.support.sap.com/sap(bD1kZSZjPTAwMQ==)/support/pam/pam.html?smpsrv=https%3a%2f%2fwebsmp201.sap-ag.de#ts=60&s=netweaver%207.5&o=most_viewed%7Cdesc&st=l&rpp=20&page=1&pvnr=73554900100900000414&pt=g%7Cd) and above. This includes SAP S/4HANA Cloud private edition systems operated by SAP ECS in RISE. For SAP S/4HANA Cloud public edition (SaaS) use [SAP's connector](https://azuremarketplace.microsoft.com/marketplace/apps/sap_jasondau.azure-sentinel-solution-s4hana-public?tab=Overview) instead. <br><br>Change Docs logs running on Sybase aren't supported. If you're using Sybase, we recommend that you customize your system to turn off ingestion for Change Docs logs. For more information, see [Customize data connector behavior (optional)](deploy-data-connector-agentless.md#customize-data-connector-behavior-optional).|
| **SAP environment** | Your SAP environment must have: <br><br> The **RSAU_API_GET_LOG_DATA** function module, remote enabled on your SAP System. For more information, see the [SAP documentation](https://me.sap.com/notes/3054326/E). <br>An SAP BTP Subaccount with following services enabled:  <br>    - SAP Integration Suite <br>- SAP Process Integration Runtime <br>- Cloud Foundry Runtime<br>    For more information, see the [SAP documentation](https://help.sap.com/docs/sap-hana-spatial-services/onboarding/creating-subaccount-on-sap-business-technology-platform-sap-btp ). [Trial accounts](https://developers.sap.com/tutorials/hcp-create-trial-account.html) are supported.<br><br>The [SAP Cloud Connector](https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/installation?locale=en-US) deployed <br><br>SAP NetWeaver version 7.5 or higher|
| **SAP roles and permissions** | You must have the following roles in your SAP systems: <br><br>**In SAP NetWeaver 7.5+**: SAP Netweaver Administrator <br><br>**In SAP BTP, all of the following roles**:<br>- Subaccount administrator <br>- Integration Provisioner <br>- PI_Administrator <br>- PI_Integration_Developer <br>- PI_Business_Expert| 



## Plan your ingestion

We recommend that you test your systems to determine the number of logs that each of your SAP systems sends to Microsoft Sentinel. Microsoft Sentinel billing depends on log ingestion size, which in turn depends on factors such as system usage, modules deployed, number of users, running use cases, network traffic, and log types.

For more information, see:

- [Solution pricing](solution-overview.md#solution-pricing)
- [Plan costs and understand Microsoft Sentinel pricing and billing](../billing.md)
- [Reduce costs for Microsoft Sentinel](../billing-reduce-costs.md)
- [Manage and monitor costs for Microsoft Sentinel](../billing-monitor-costs.md)

## Next step

> [!div class="nextstepaction"]
> [Install the Microsoft Sentinel solution for SAP applications](deploy-sap-security-content.md)
