---
title: Deploy the Microsoft Sentinel solution for SAP applications
description: Get an introduction to the process of deploying the Microsoft Sentinel solution for SAP applications.
ms.author: monaberdugo
author: mberdugo
ms.topic: overview
ms.date: 08/04/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
#Customer intent: As a security analyst, I want to deploy and configure a monitoring solution for SAP applications so that I can detect and respond to security threats within my SAP environment.

---

# Microsoft Sentinel solution for SAP applications: Deployment overview

Use the Microsoft Sentinel solution for SAP applications to monitor your SAP systems with Microsoft Sentinel, detecting sophisticated threats throughout the business logic and application layers of your SAP applications.

This article introduces you to the Microsoft Sentinel solution for SAP applications deployment.

## Solution components

The Microsoft Sentinel solution for SAP applications includes a data connector, which collects logs from your SAP systems and sends them to your Microsoft Sentinel workspace, and out-of-the-box security content, which helps you gain insight into your organization's SAP environment and detect and respond to security threats.

### Data connector

The Microsoft Sentinel solution for SAP applications uses the agentless data connector, which collects application logs for all your onboarded SAP SIDs from across the SAP system landscape, and then sends those logs to your Log Analytics workspace in Microsoft Sentinel.

[!INCLUDE [data-connector-agent-deprecation](../includes/data-connector-agent-deprecation.md)]

The Microsoft Sentinel agentless data connector for SAP uses the SAP Cloud Connector and SAP Integration Suite to connect to your SAP system and pull logs from it, as shown in the following image:

:::image type="content" source="media/deployment-overview/agentless-connector.png" alt-text="Diagram that shows the Microsoft Sentinel agentless data connector in an SAP environment." border="false" lightbox="media/deployment-overview/agentless-connector.png":::

By using the SAP Cloud Connector, the agentless data connector profits from already existing setups and established integration processes. This means you don't have to tackle network challenges again, as the people running your SAP Cloud Connector have already gone through that process.

For sizing, throughput tuning, and isolation guidance, see [Configure SAP Cloud Connector settings](preparing-sap.md#configure-sap-cloud-connector-settings) and [Optimize SAP Cloud Connector sizing, throughput, and isolation](preparing-sap.md#optimize-sap-cloud-connector-sizing-throughput-and-isolation).

The agentless data connector is compatible with [SAP NetWeaver based systems](https://help.sap.com/docs/SAP_NETWEAVER?state=PRODUCTION&version=ALL). Among them SAP S/4HANA Cloud, Private Edition (RISE with SAP), SAP S/4HANA on-premises, SAP ERP Central Component (ECC), SAP Business Warehouse (BW), and more, ensuring continued functionality of existing security content, including detections, workbooks, and playbooks.

The agentless data connector ingests critical security logs such as the security audit log, change docs logs and user master data including user roles and authorizations.

### Security content

The Microsoft Sentinel solutions for SAP applications include the following types of security content to help you gain insight into your organization's SAP environment and detect and respond to security threats:

- **Analytics rules** and **watchlists** for threat detection.
- **Functions** for easy data access.
- **Workbooks** to create interactive data visualization.
- **Watchlists** for customization of the built-in solution parameters.
- **Playbooks** that you can use to automate responses to threats.

For more information, see [Microsoft Sentinel solution for SAP applications: security content reference](sap-solution-security-content.md).

## Deployment flow and personas

Deploying the Microsoft Sentinel solution for SAP applications involves several steps and requires collaboration across your **security** and **SAP BASIS** teams. The following image shows the steps in deploying the Microsoft Sentinel solution for SAP applications, with relevant teams indicated:

:::image type="content" source="media/deployment-steps/full-flow-agentless.png" alt-text="Diagram showing the full steps in the deployment flow for the Microsoft Sentinel agentless data connector for SAP applications." border="false":::

We recommend that you involve both teams when planning your deployment to ensure that effort is allocated and the deployment can move smoothly.

**Deployment steps include**:

1. [Review the prerequisites for deploying the SAP agentless data connector](prerequisites-for-deploying-sap-continuous-threat-monitoring.md).

1. [Deploy the SAP applications solution from the content hub](deploy-sap-security-content.md). This step is handled by the security team on the Azure portal.

1. [Configure your SAP system for the Microsoft Sentinel solution](preparing-sap.md), including configuring SAP authorizations, configuring SAP auditing, and more. We recommend that these steps be done by your SAP BASIS team, and our documentation includes references to SAP documentation. Some of the procedures in this step can be done by the SAP BASIS team before installing the solution.

1. [Connect your SAP system](deploy-data-connector-agentless.md) using the agentless data connector with the SAP Cloud Connector. This step is handled by your security team on the Azure portal, using information provided by your SAP BASIS team.

1. [Enable SAP detections and threat protection](deployment-solution-configuration.md). This step is handled by the security team on the Azure portal.

**Extra options include:**

- [Collect SAP HANA audit logs](collect-sap-hana-audit-logs.md)
- [Deploy the Microsoft Sentinel solution for SAP BTP](deploy-sap-btp-solution.md)

## Stop SAP data collection

If you need to stop Microsoft Sentinel from collecting your SAP data, disable or remove the agentless data connector and then reverse the SAP-side preparation you applied.

For more information, see [Stop SAP data collection](stop-collection.md).

## Related content

For more information, see:

- [About Microsoft Sentinel content and solutions](../sentinel-solutions.md)
- [Microsoft Sentinel solution for SAP applications overview](sap-applications-overview.md)
- [Monitor the health and role of your SAP systems](../monitor-sap-system-health.md)

## Next step

Begin the deployment of the Microsoft Sentinel solution for SAP applications by reviewing the prerequisites:

> [!div class="nextstepaction"]
> [Prerequisites](prerequisites-for-deploying-sap-continuous-threat-monitoring.md)
