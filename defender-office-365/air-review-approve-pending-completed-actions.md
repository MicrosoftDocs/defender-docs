---
title: Review and manage remediation actions in AIR
f1.keywords:
- NOCSH
author: chrisda
ms.author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
search.appverid:
- MET150
- MOE150
ms.collection:
- m365-security
- tier2
ms.custom:
description: Learn about remediation actions in automated investigation and response capabilities in Microsoft Defender for Office 365 Plan 2.
ms.service: defender-office-365
ms.date: 01/10/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
---

# Review and manage remediation actions in automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In Microsoft 365 organizations with [Microsoft Defender for Office 365 Plan 2](mdo-about.md#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet)  (included in Microsoft 365 licenses like E5 or as a standalone subscription), automated investigation and response (AIR) often results in pending remediation actions. For example:

- Soft deleting email messages or clusters.
- Turning off external mail forwarding.

These remediation actions aren't taken automatically. The remediation actions need approval by a member of the security operations (SecOps) team. The rest of this article explains how to approve or reject pending remediation actions.

> [!TIP]
> We recommend reviewing and approving or rejecting pending remediations actions as soon as possible so your automated investigations complete in a timely manner.
>
> The system checks for duplicate or overlapping investigations where the same clusters were approved multiple times. If the same investigation cluster was already approved within the previous hour, new duplicate remediations aren't processed again. This behavior doesn't remove duplicate investigations or investigation evidence, it simply deduplicates approved actions to improve remediation processing speed. For duplicate approved cluster investigations, you don't see the action details the flyout from the **History** tab on the **Action center** page in the Microsoft Defender portal at <https://security.microsoft.com/action-center/history>.

## What do you need to know before you begin?

- To see the permissions and licensing requirement for AIR, see [Required permissions and licensing for AIR](air-about.md#required-permissions-and-licensing-for-air).
- Pending actions time out after awaiting approval for one week.

## Approve or reject pending actions from the Investigations page in Defender for Office 365

For more information about the **Incidents** page in Defender for Office 365, see [Details and results of automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2](air-view-investigation-results.md).

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Investigations** page in Defender for Office 365 at **Email & collaboration** \> **Investigations**. Or, to go directly to the **Investigations** page in Defender for Office 365, use <https://security.microsoft.com/airinvestigation>.
2. On the **Investigations** page in Defender for Office 365, find and an item in the list where the **Status** value is **Pending approval**. Use :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Filter** to filter the results by the **Status** value **Pending action**.
3. On the **Investigations** page, select the **Pending action** item by clicking on :::image type="icon" source="media/m365-cc-sc-open-icon.png" border="false"::: **Open in new window** in the **ID** column (don't select the check box).
4. In the investigation details page that opens, select the **Pending actions** tab, and then select an entry from the list by clicking anywhere in the row other than the check box next to the first column.
5. In the details flyout that opens, review the information and then select one of the following actions from the top of the flyout:
   - :::image type="icon" source="media/m365-cc-sc-check-mark-icon.png" border="false"::: **Approve**: Initiate the pending action.
   - :::image type="icon" source="media/m365-cc-sc-close-icon.png" border="false"::: **Reject**: Prevent the pending action from being taken.

## Approve or reject pending actions from the Incidents page in Defender XDR

For more information about the **Incidents** page in Defender XDR, see [Investigate incidents in Microsoft Defender XDR](/defender-xdr/investigate-incidents).

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Incidents** page in Defender XDR at **Incidents & alerts** \> **Incidents**. Or, to go directly to the **Incidents** page in Defender XDR, use <https://security.microsoft.com/incidents>.
2. On the **Investigations** page in Defender XDR, find and an item in the list where the **Status** value is **Pending approval**. Use the following steps to filter the results:
   1. Clear any existing unwanted filters on the **Incidents** page by selecting :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: **Clear**.
   2. Select :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Add filter**.
   3. In the **Add filter** dialog that opens, select **Automated investigation state**, and then select **Add**.
   4. Select the **Automated investigation state: Any** filter on the **Incidents** page.
   5. In the drop down list that opens, select **Pending action**, and then select **Apply**.

   > [!TIP]
   > Filtering by **Automated investigation state: Pending action** might reveal parent incidents with the **Pending approval** value for **Investigation state**. In that case, you're interested in the parent **Pending approval** incident.

3. On the **Incidents** page, select the **Pending approval** incident by clicking on the **Incident name** value (don't select the check box).
4. On the incident details page that opens, select the **Evidence and response** tab, and find the entries with the **Remediation status** value **Pending approval**. For example:
   - Click on the **Remediation status** column header, and then select **Sort ascending**.
   - Select :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Filter** \> **Pending approval** in the **Remediation status** section \> **Apply**.
5. On the **Evidence and Response** tab, select the **Pending approval** entry by clicking anywhere in the row other than the check box next to the first column.
6. In the details flyout that opens, review the information and then select one of the following actions from the top of the flyout:
   - :::image type="icon" source="media/m365-cc-sc-approve-icon.png" border="false"::: **Approve**: Initiate the pending action.
   - :::image type="icon" source="media/m365-cc-sc-no-icon.png" border="false"::: **Reject**: Prevent the pending action from being taken.

## Approve or reject pending actions from the unified Action center

For more information about the unified Action center in Defender XDR, see [The Action center](/defender-xdr/m365d-action-center).

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Pending** tab on the **Action center** page at **Actions & submissions** \> **Action center** \> **Pending** tab. Or, to go directly to the **Pending** tab on the **Action center** page, use <https://security.microsoft.com/action-center/pending>.
2. On the **Pending** tab of the **Action center** page, select an entry from the list by clicking on the **Investigation ID** value (don't select the check box).
3. In the investigation details page that opens, select the **Pending actions** tab, and then select an entry from the list by clicking anywhere in the row other than the check box next to the first column.
4. In the details flyout that opens, review the information and then select one of the following actions from the top of the flyout:
   - :::image type="icon" source="media/m365-cc-sc-check-mark-icon.png" border="false"::: **Approve**: Initiate the pending action.
   - :::image type="icon" source="media/m365-cc-sc-close-icon.png" border="false"::: **Reject**: Prevent the pending action from being taken.

## Change or undo remediation actions

For instructions, see [Undo remediation actions](air-report-false-positives-negatives.md#undo-remediation-actions).

## See also

- [View details and results of an automated investigation in Office 365](air-view-investigation-results.md)
- [Remediate malicious email delivered in Office 365](remediate-malicious-email-delivered-office-365.md)
- [Report false positives or false negatives in automated investigation and response (AIR)](air-report-false-positives-negatives.md)
