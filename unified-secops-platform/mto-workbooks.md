---
title: Use Microsoft Sentinel situational awareness workbooks in multitenant management
description: Access and use the out-of-the-box Situational Awareness workbook across multiple tenants in the Microsoft Defender portal. Monitor tenant health, trends, and metrics from a single multitenant view.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tbeerthuis
ms.collection: 
- m365-security
- highpri
- tier1
- usx-security
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender for Office 365 P2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#customer intent: As a security administrator, I want to manage workbooks across multiple tenants to ensure consistent monitoring and reporting.
---

# Use workbooks in multitenant management

Microsoft Sentinel lets you manage and view workbooks across multiple tenants from one page. You can use the built-in Situational Awareness workbook to track tenant health, trends, and key metrics. This article shows how to access and use workbooks in multitenant management. Before you begin, make sure you meet the [prerequisites for using workbooks in multitenant management](#prerequisites).

## Prerequisites

Before using Workbooks in multitenant management, ensure you have the following prerequisites:

* Access to Microsoft Sentinel on the Defender portal. ​
* Access to more than one tenant using B2B/GDAP.
* For the workbook aggregated view, at least one workbook must be available on one or more target tenants.
* For the Situational Awareness workbook, your home tenant (primary workspace) must have threat intelligence data. ​

## Access a workbook​

Follow these steps to open the Workbooks page in the multitenant portal.

1. In the left-hand navigation pane, select **Microsoft Sentinel** > **Workbooks**. This page shows a combined list of all workbooks across your tenants.

   :::image type="content" source="./media/mto-workbooks/access-workbook.png" alt-text="Screenshot of Workbooks homepage.":::

1. Use the search bar to find specific workbooks. Filter or browse through multiple pages of workbooks as needed.
1. Select the desired workbook from the list.
1. Select **View saved workbook** to open it in the Defender portal for the corresponding tenant.

    :::image type="content" source="./media/mto-workbooks/view-workbook.png" alt-text="Screenshot of View saved workbook option.":::

## Open the situational awareness workbook

The Situational Awareness workbook shows health status, trends, and metrics across your tenants. It supports multiple tenants, so you can pick which ones to include.

1. In the multitenant management portal, select the button on the Situational Awareness card.

    :::image type="content" source="./media/mto-workbooks/situational-awareness-card.png" alt-text="Screenshot of Situational Awareness button.":::

1. Use the tenant selector in the top-right corner to pick which tenants to include.
To pick specific workspaces, select **Edit selection**.
Make sure your home tenant is in scope and has threat intelligence data. Then select **Apply**.

    :::image type="content" source="./media/mto-workbooks/tenant-scope.png" alt-text="Screenshot of tenant selector.":::

<a name="explore-the-workbook"></a>
## Explore the situational awareness workbook

Use the following workbook features to analyze data across tenants:

* Use the global filters at the top of the workbook to refine the data displayed. ​
* Navigate through the subtabs to explore different categories of insights (for example, health status or threat insights).
* Review the charts and metrics provided to monitor trends and identify areas for investigation. ​

<a name="limitations"></a>
## Workbook limitations in multitenant management

Note the following limits for Workbooks in multitenant management:

* The Situational Awareness workbook only uses threat data from the home tenant. You can't change this setting.
* You can't edit or create workbooks from the Workbooks page. ​
* Workbook templates don't appear in the combined view.
