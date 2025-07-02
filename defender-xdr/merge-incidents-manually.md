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
ms.date: 04/09/2025
search.appverid: met150
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
---

# Merge incidents manually in the Microsoft Defender portal (Preview)

Incidents are automatically created in the Microsoft Defender portal when suspicious activities are detected. When two incidents describe parts of the same attack story, Defender usually merges those incidents into a single incident automatically to help you investigate incidents more efficiently and effectively and resolve them more quickly and accurately.

Sometimes, however, the automatic merging doesn't happen, due to certain conditions that prevent it. To learn more about when incidents are or aren't merged, see [Incident correlation and merging](alerts-incidents-correlation.md#incident-correlation-and-merging). In these circumstances, or if you decide independently that two (unmerged) incidents are related and should be investigated as a single unit, you can merge them manually. This article explains how to do so.

## Prerequisites

- Users must have permissions to view the incidents queue.
- Users must have read and write permissions on all the incidents they wish to merge. Incidents from different sources have different RBAC roles defined.
- Incidents that are candidates for merging must have either the same values as each other, or null values, for the **Assigned to**, **Classification**, and **Determination** fields.

## Merge incidents from the incident queue page

1. Open the incident queue. Select **Investigation & response > Incidents & alerts > Incidents** from the quick launch menu in the Microsoft Defender portal.

1. Select the two incidents you want to merge by marking the checkboxes at the beginning of their rows in the queue. When two incidents are marked, the **Merge incidents** button appears on the toolbar.

    :::image type="content" source="media/merge-incidents-manually/merge-incidents-from-queue.png" alt-text="Screenshot of selecting incidents from queue to merge them." lightbox="media/merge-incidents-manually/merge-incidents-from-queue.png":::

1. Select **Merge incidents** from the toolbar. The **Merge incidents** flyout opens.

1. In the **Reason for merging** text box, type a description of the reason why you want to merge the incidents.

1. Select **Merge incidents** at the bottom of the flyout to execute the merge.

    :::image type="content" source="media/merge-incidents-manually/merge-incidents-panel-from-queue.png" alt-text="Screenshot of merging incidents from queue.":::

1. In the confirmation dialog that appears, select **Merge**. When the merge is complete, a "Success" notification appears, with a link to follow to go to the merged (target) incident.

    If the merge fails, a dialog box appears with a message that the incidents failed to merge. Verify that both incidents have the same values, or that at least one of the incidents has a null value, for **Assigned to**, **Classification**, and **Determination**.

## Merge incidents from within the incident page

1. Select the name of one of the two incidents you want to merge from the incident queue. This could be either the source or the target incident, as Microsoft Defender decides which is which. For more information, see [Details of the merge process](alerts-incidents-correlation.md#details-of-the-merge-process).

1. The incident page appears. There, from the **Actions** menu (the three dots in the upper right corner), select **Merge incidents**.

    :::image type="content" source="media/merge-incidents-manually/merge-incident-from-incident-page.png" alt-text="Screenshot of merging incidents from incident page." lightbox="media/merge-incidents-manually/merge-incident-from-incident-page.png":::

1. The **Merge incidents** flyout appears. In the **Other incident name or ID** field, begin typing the name or ID of the incident you want to merge with the open one. The list of available incidents is dynamically displayed and filtered as you type. When you see the one you want in the list, select it.

    :::image type="content" source="media/merge-incidents-manually/merge-incidents-panel-from-incident-page.png" border = "false" alt-text="Screenshot of incident merge panel from incident page.":::

1. In the **Comment** text box, type a description of the reason why you want to merge the incidents.

1. Select **Merge incidents** at the bottom of the flyout to execute the merge.

1. In the confirmation dialog that appears, select **Merge**. When the merge is complete, a "Success" notification appears, the open incident is closed, and you are redirected to the merged (target) incident.

    If the merge fails, a dialog box appears with a message that the incidents failed to merge. For the merge to succeed, both incidents must have the same values&mdash;or at least one incident must have a null value&mdash;for **Assigned to**, **Classification**, and **Determination**.

## Notes

- When the incidents are in the process of merging, you can't display or make any changes to either incident.

- Incident merges are recorded in the target incident's activity log. The log messages show the names and IDs of the source incidents that were merged into the open (target) incident.

- Activity log entries from the source incident are copied into the target incident's activity log. The entries appear with an indication that they were merged from the source incident. You can filter the activity log to show entries from either the source or target incidents, or from both.

## See also

- [Alert correlation and incident merging in the Microsoft Defender portal](alerts-incidents-correlation.md)
- [Manage incidents in Microsoft Defender](manage-incidents.md)
