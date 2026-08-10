---
title: Install a Microsoft Sentinel solution for SAP applications
description: Learn how to install a Microsoft Sentinel solution for SAP applications from the content hub to your Log Analytics workspace enabled for Microsoft Sentinel.
ms.author: monaberdugo
author: mberdugo
ms.topic: how-to
ms.date: 08/04/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted


#Customer intent: As a security administrator, I want to deploy and configure security monitoring for SAP applications using Microsoft Sentinel so that I can enhance the security posture and threat detection capabilities of my SAP environment.

---

# Install a Microsoft Sentinel solution for SAP applications

This article shows you how to install the Microsoft Sentinel solution for SAP applications from the content hub. The solution includes an SAP data connector, which collects logs from your SAP systems and sends them to your Microsoft Sentinel workspace, and out-of-the-box security content—including workbooks and analytics rules—that helps you gain insight into your organization's SAP environment and detect and respond to security threats. Installing your solution is a required step before you can configure your data connector. Before you start, make sure you meet the [prerequisites for deploying the Microsoft Sentinel solution for SAP applications](prerequisites-for-deploying-sap-continuous-threat-monitoring.md).



:::image type="content" source="media/deployment-steps/install-solution-agentless.png" alt-text="Diagram of the SAP solution deployment flow, highlighting the Install solution content step." border="false":::


Content in this article is relevant for your **security** team.



## Prerequisites

To deploy a Microsoft Sentinel solution for SAP applications from the content hub, you need:

- A Log Analytics workspace enabled for Microsoft Sentinel.
- Read and write permissions to the workspace. For more information, see [Roles and permissions in Microsoft Sentinel](../roles.md).

Make sure that you also review the [prerequisites for deploying Microsoft Sentinel solution for SAP applications](prerequisites-for-deploying-sap-continuous-threat-monitoring.md), especially [Azure prerequisites](prerequisites-for-deploying-sap-continuous-threat-monitoring.md#azure-prerequisites).


## Install the solution

Installing the **Microsoft Sentinel Solution for SAP** makes the agentless data connector available to you from the Microsoft Sentinel **Configuration > Data connectors** page. The solution also deploys security content, such as the **SAP -Audit Controls** workbook and SAP-related analytics rules.

1. In the Microsoft Sentinel **Content hub**, search for **SAP** to install the **SAP applications** solution.

1. On the **Microsoft Sentinel solution for SAP applications** page, select **Create** to define deployment settings. For example:

    :::image type="content" source="./media/deploy-sap-security-content/sap-solution.png" alt-text="Screenshot that shows the Microsoft Sentinel solution for SAP applications solution pane." lightbox="./media/deploy-sap-security-content/sap-solution.png":::

1. On the default **Basics** tab, scroll down to select where to install the solution.

1. Select **Review + create** or **Next** to browse through the solution components. When you're ready, select **Create**

    The deployment process can take a few minutes. After the deployment is finished, you can view the deployed content in Microsoft Sentinel.

For more information, see [Discover and manage Microsoft Sentinel out-of-the-box content](../sentinel-solutions-deploy.md).



## View deployed content

When the SAP applications solution deployment is finished, display your new content by browsing again to the Microsoft Sentinel for SAP applications solution from the **Content hub**. Alternatively, to view the deployed content without returning to the Content hub:

- For the [built-in SAP workbooks](sap-solution-security-content.md#built-in-workbooks), in Microsoft Sentinel, go to **Threat Management** > **Workbooks** > **Templates**.

- For a series of [SAP-related analytics rules](sap-solution-security-content.md#built-in-analytics-rules), go to **Configuration** > **Analytics** **Rule templates**.

Your data connector doesn't appear as connected until you [configure your data connector](deploy-data-connector-agentless.md) and complete the connection.

## Next step

> [!div class="nextstepaction"]
> [Configure your SAP system for the Microsoft Sentinel solution](preparing-sap.md)

## Related content

For more information, see [Microsoft Sentinel solution for SAP applications: security content reference](sap-solution-security-content.md).
