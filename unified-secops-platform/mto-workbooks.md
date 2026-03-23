---
title: Microsoft Sentinel situational awareness workbooks multitenant management
description: Learn about multitenant management for Microsoft Sentinel situational awareness workbooks in the Microsoft Defender portal.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tbeerthuis
audience: ""
search.appverid: ""
audience: 
ms.collection: 
- m365-security
- highpri
- tier1
- usx-security
ms.topic: how-to
ms.date: 03/16/2026
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender for Office 365 P2

#customer intent: As a security administrator, I want to manage workbooks across multiple tenants to ensure consistent monitoring and reporting.
---

# Workbooks in multitenant management

The Workbooks feature in Microsoft Sentinel enables users to manage and view workbooks across multiple tenants from a single page in the multitenant Organization portal. ​This feature allows users to access an out-of-the-box multitenant workbook, Situational Awareness, which provides insights into tenant health, trends, and metrics. ​This document walks you through the steps to access and use this feature effectively. 

## Prerequisites

Before using Workbooks in multitenant management, ensure you have the following prerequisites:

* Access to Microsoft Sentinel on the Defender portal. ​
* Access to more than one tenant using B2B/GDAP.
* For the workbook aggregated view, at least one workbook must be available on one or more target tenants.
* For the Situational Awareness workbook, your home tenant (primary workspace) must have threat intelligence data. ​

## Access a workbook​

To navigate to the workbook page in the multitenant Organization portal in Microsoft Sentinel. ​

1. In the left-hand navigation pane, select **Microsoft Sentinel** > **Workbooks**. ​The Workbooks page displays an aggregated list of all workbooks across your tenants.

   :::image type="content" source="./media/mto-workbooks/access-workbook.png" alt-text="Screenshot of Workbooks homepage.":::

1. Use the search bar to find specific workbooks. Filter or browse through multiple pages of workbooks as needed.
1. Select the desired workbook from the list.
1. Select **View saved workbook** to open it in the Defender portal for the corresponding tenant.

    :::image type="content" source="./media/mto-workbooks/view-workbook.png" alt-text="Screenshot of View saved workbook option.":::

## Open the situational awareness workbook

Use the workbook to get insights across your tenants, including health status, trends, and metrics. This workbook is multi tenant supported, so you can select which tenants to include.

1. From the multitenant management portal, select the button below the Situational Awareness card

    :::image type="content" source="./media/mto-workbooks/situational-awareness-card.png" alt-text="Screenshot of Situational Awareness button.":::

1. To choose which tenants to include, use the tenant selector in the top-right corner. ​ 
Optionally, select **Edit selection** to select specific workspaces. ​
Ensure your home tenant is included in the scope and has threat intelligence data in the selected workspace, and select **Apply**.

    :::image type="content" source="./media/mto-workbooks/tenant-scope.png" alt-text="Screenshot of tenant selector.":::

## Explore the Workbook ​

* Use the global filters at the top of the workbook to refine the data displayed. ​
* Navigate through the subtabs to explore different categories of insights (for example, health status or threat insights).
* Review the charts and metrics provided to monitor trends and identify areas for investigation. ​

## Limitations

* The Situational Awareness workbook uses threat intelligence data exclusively from the home tenant, and this setting can't be changed.
* The Workbooks page doesn't currently support editing or creating workbooks. ​
* Workbook templates are currently not supported in the aggregated view.
