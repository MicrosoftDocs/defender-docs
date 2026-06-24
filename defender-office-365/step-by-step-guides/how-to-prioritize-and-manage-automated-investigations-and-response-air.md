---
title: Prioritize and manage Automated Investigations and Response (AIR)
description: Analyze investigations and approve Automated Investigation and Response (AIR) actions from the Action Center. Learn how AIR assesses threat scope and recommends remediation actions in Microsoft Defender for Office 365.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Prioritize and manage Automated Investigations and Response (AIR)

Automated Investigation and Response (AIR) saves your security operations team time and effort.

- When alerts are triggered, automated investigation will determine the scope of impact of a threat in your organization and provide recommended remediation actions.
- Security teams can save time by leveraging AIR automation to reduce the need for manual hunting.
- These investigations can identify emails that haven't been cleaned-up by Zero-hour Auto Purge (ZAP) or other remediation.
- AIR investigations also identify mailbox configurations that may be risky or indicate a compromised mailbox.

Investigation actions (and investigations) are accessible from several points in the Microsoft Security portal: via *Incidents*, via *Alerts*, or via *Action Center*. Which entry point an admin uses is based on the workflow the admin is pursuing.

## Why use the Action Center workflow

As automated investigations on *Email & collaboration* content results in verdicts, such as *Malicious* or *Suspicious*, certain remediation actions are created. The remediation actions suggested aren't carried out automatically. SecOps must navigate to each investigation to *approve* those suggested actions. In the *Action Center* all the pending actions are aggregated for quick approval.

<a name="what-youll-need"></a>
## Prerequisites

- Microsoft Defender for Office 365 Plan 2 or higher (Included with E5)
- Sufficient permissions (Security reader, security operations, or security administrator, plus [Search and purge](../mdo-portal-permissions.md) role)

## Steps to analyze and approve AIR actions directly from the Action Center

Perform the following steps to review and approve pending AIR actions in the Action Center:

1. Navigate to [Microsoft Defender portal](https://security.microsoft.com/action-center) and sign in.
2. When the Action center loads, filter and prioritize by clicking columns to sort the actions, or press **Filters** to apply a filter such as *entity type* (for a particular URL) or action type (such as soft delete email).
3. A flyout will open once an action is clicked. The flyout appears on the right-hand side of the screen for review.
4. For more information about why an action is requested, select **Open investigation page** in the flyout to learn more about the investigation or alerts linked to the selected action. (Admins can also approve actions seen on the investigation page by selecting the *Pending Actions* tab.)
5. Otherwise, select **Approve** to take the recommended action directly from the Action Center.
6. Reject the action, if you determine it's unnecessary.

## Check AIR history

Use the following steps to review the history of AIR actions in the Action Center:

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.
2. In the left-hand navigation pane, expand **Action & submissions** then click **Action Center**.
3. When the Action Center loads press the **History** tab.
4. View the history of AIR, including decisions made, source of action, and admin who made the decision, if appropriate.

<a name="more-information"></a>
## Related content

[View automated investigation results in Microsoft 365](../air-view-investigation-results.md)

[Approve or reject pending actions from the Investigation page](../air-review-approve-pending-completed-actions.md)
