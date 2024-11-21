---
title: Merge incidents manually in the Microsoft Defender portal
description: Learn how to merge two or more incidents into a single incident in the Microsoft Defender portal, to help you investigate incidents more efficiently and effectively and resolve them more quickly and accurately.
ms.service: defender-xdr
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.collection: 
- m365-security
- tier2
- usx-security
- sentinel-only
ms.topic: how-to
ms.date: 11/21/2024
search.appverid: met150
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
---

# Merge incidents manually in the Microsoft Defender portal

Incidents are automatically created in the Microsoft Defender portal when suspicious activities are detected. When two incidents describe parts of the same attack story, Defender usually merges those incidents into a single incident automatically to help you investigate incidents more efficiently and effectively and resolve them more quickly and accurately.

Sometimes, however, the automatic merging doesn't happen, due to certain conditions that prevent it. To learn more about when incidents are or aren't merged, see [Incident correlation and merging](alerts-incidents-correlation.md#incident-correlation-and-merging). In these circumstances, or if you decide independently that two (unmerged) incidents are related and should be investigated as a single unit, you can merge them manually. This article explains how to do so.

## Prerequisites

- List required role and permissions here
- List required role and permissions here

## Merge incidents from the incident queue page

1. Open the incident queue. Select **Investigation & response > Incidents & alerts > Incidents** from the quick launch menu in the Microsoft Defender portal.

1. Select the two incidents you want to merge by marking the checkboxes at the beginning of their rows in the queue. When two incidents are marked, the **Merge incidents** button appears on the toolbar.

1. Select **Merge incidents** from the toolbar. The **Merge incidents** flyout opens.

1. In the **Reason for merging** text box, type a description of the reason why you want to merge the incidents.

1. Select **Merge incidents** at the bottom of the flyout to execute the merge.

1. In the confirmation dialog that appears, select **Merge**.

## Merge incidents from within the incident details page or panel

1. Select an incident from the incident queue. This is the incident you want to merge other incidents into.

1. The incident details panel appears. From the toolbar in the incident details panel, select **Merge incidents**.

    Alternatively, open the full incident page. There, from the **Actions** menu (the three dots in the upper right corner), select **Merge incidents**.

1. The **Merge incidents** flyout appears. In the **Other incident name or ID** field, begin typing the name or ID of the incident you want to merge with the open one. The list of available incidents is dynamically displayed and filtered as you type. When you see the one you want in the list, select it.

1. In the **Reason for merging** text box, type a description of the reason why you want to merge the incidents.

1. Select **Merge incidents** at the bottom of the flyout to execute the merge.

1. In the confirmation dialog that appears, select **Merge**.
