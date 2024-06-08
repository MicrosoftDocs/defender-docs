---
title: Review and manage remediation actions in Microsoft Defender for Office 365
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
ms.date: 06/04/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
---

# Review and manage remediation actions in automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In Microsoft 365 organizations with [Microsoft Defender for Office 365 Plan 2](mdo-about.md#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet), automated investigation and response (AIR) often results in pending remediation actions. For example:

- Soft deleting email messages or clusters.
- Turning off external mail forwarding.

These remediation actions aren't automatically done; they need to be approved by a member of your security operations (SecOps) team. The rest of this article explains how to approve or reject pending remediation actions.

> [!TIP]
> We recommend reviewing and approving or rejecting pending remediations actions as soon as possible so your automated investigations complete in a timely manner.
>
> The system checks for duplicate or overlapping investigations where the same clusters were approved multiple times. If the same investigation cluster was already approved within the previous hour, new duplicate remediations aren't processed again. This behavior doesn't remove duplicate investigations or investigation evidence, it simply de-duplicates approved actions to improve remediation processing speed. For duplicate approved cluster investigations, you don't see the action details the fly from the **History** tab on the **Action center** page in the Microsoft Defender portal at <https://security.microsoft.com/action-center/history>.

## What do you need to know before you begin?

To see the permissions and licensing requirement for AIR, see [Required permissions and licensing for AIR](air-about.md#required-permissions-and-licensing-for-air).

## Approve (or reject) pending actions

There are four different ways to find and take auto investigation actions:

- [Incident queue](https://security.microsoft.com/incidents)
- Investigation itself (accessed via Incident or from an alert)
- [Action center](https://security.microsoft.com/action-center/pending)
- [Investigation and remediation investigations queue](https://security.microsoft.com/airinvestigation)

## Approve or reject pending actions from the Incidents page

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Incidents** page at **Incidents & alerts** \> **Incidents**. Or, to go directly to the **Incidents** page, use <https://security.microsoft.com/incidents>.
2. If it helps, filter the results on the **Incidents** page by **Pending action**:
   1. Clear any existing unwanted filters on the **Incidents** page by selecting :::image type="icon" source="media/m365-cc-sc-remove-selection-icon.png" border="false"::: **Clear**.
   2. Select :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Add filter**.
   3. In the **Add filter** dialog that opens, select **Automated investigation state**, and then select **Add**.
   4. Select the **Automated investigation state: Any** filter on the **Incidents** page.
   5. In the drop down list that opens, select **Pending action**, and then select **Apply**.
3. In the **ID** column of the incident, select :::image type="icon" source="media/m365-cc-sc-open-icon.png" border="false"::: **Open in new window**.
4. On the incident details page that opens, select the **Evidence** tab.Select the **Evidence and Response** tab.
5. Select an item in the list to open its flyout pane.
6. Review the information, and then take one of the following steps:
   - Select the Approve pending action option to initiate a pending action.
   - Select the Reject pending action option to prevent a pending action from being taken.

## Action center

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Action center** page by selecting **Action center**. Or, to go directly to the **Action center** page, use <https://security.microsoft.com/action-center/pending>.
2. On the **Action center** page, verify that the **Pending** tab is selected, and then review the list of actions that are awaiting approval.
   - Select **Open investigation page** to view more details about the investigation.
   - Select **Approve** to initiate a pending action.
   - Select **Reject** to prevent a pending action from being taken.

> [!NOTE]
> Pending actions time out after awaiting approval for one week.

## Investigation and remediation investigations queue

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the **Threat investigation** page at **Email & collaboration** \> **Investigations**. To go directly to the **Threat investigation** page, use <https://security.microsoft.com/airinvestigation>.
2. On the **Threat investigation** page, find and an item from the list whose status is **Pending action**.
3. Click :::image type="icon" source="media/m365-cc-sc-open-icon.png" border="false"::: **Open in new window** on the list time (between **ID** and **Status**).
4. In the page that opens, take approve or reject actions.

## Change or undo one remediation action

There are two different ways to reconsider submitted actions:

- Through the [unified action center](https://security.microsoft.com/action-center).
- Though the [Office action center](https://security.microsoft.com/threatincidents).

## Change or undo through the unified action center

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the unified action center by selecting **Action center**. To go directly to the unified action center, use <https://security.microsoft.com/action-center/>.
2. On the **Action center** page, select the **History** tab, and then select the action that you want to change or undo.
3. In the pane on the right side of the screen, select the appropriate action (**move to inbox**, **move to junk**, **move to deleted items**, **soft delete**, or **hard delete**).

## Change or undo through the Office action center

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to the Office action center at **Email & collaboration** \> **Review** \> **Action center**. To go directly to the Office action center, use <https://security.microsoft.com/threatincidents>.
2. On the **Action center** page, select the appropriate remediation.
3. In the side panel, click on the mail submissions entry and wait for the list to load.
4. Wait for the Action button at the top to enable and select the Action button to change the action type.
5. This will create the appropriate actions.

## Next steps

- [Use Threat Explorer](threat-explorer-real-time-detections-about.md)
- [Admin /Manual Actions](remediate-malicious-email-delivered-office-365.md)
- [How to report false positives/negatives in automated investigation and response capabilities](air-report-false-positives-negatives.md)

## See also

- [View details and results of an automated investigation in Office 365](air-view-investigation-results.md)
