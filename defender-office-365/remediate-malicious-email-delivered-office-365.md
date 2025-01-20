---
title: Remediate malicious email that was delivered in Office 365
author: chrisda
ms.author: chrisda
manager: deniseb
ms.topic: conceptual
ms.collection:
- m365-security
- tier1
audience: admin
f1.keywords:
  - NOCSH
ms.localizationpriority: medium
search.appverid: MET150
description: Threat remediation
ms.service: defender-office-365
ms.date: 01/13/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
---

# Remediate malicious email delivered in Office 365

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Remediation means to take a prescribed action against a threat. Malicious email sent to your organization can be cleaned up by the system, through zero-hour auto purge (ZAP), or by security teams through remediation actions like *move to inbox*, *move to junk*, *move to deleted items*, *soft delete*, or *hard delete*. Microsoft Defender for Office 365 Plan 2/E5 enables security teams to remediate threats in email and collaboration functionality through manual and automated investigation.

## What you need to know before you begin

- There are throttling limits for large-scale remediations that help ensure stability and performance of the service:
  - **Organization limits**: The maximum number of active, concurrent email remediations is 50. Once the limit is reached, no new remediations are triggered until some actions are completed.
  - **Email message limits**: If an active remediation involves more than one million email messages, no new email remediations are allowed.
  - **Recipient requirements in remediations**:
    - The total percentage of selected recipients must be at least 40% of the total email message count in the remediation. For instance, if an email is sent to five recipients, Explorer (Threat Explorer) counts it as five email messages. If the remediation requires the deletion of 5,000 email messages, the remediation must target at least 2,000 recipients.
    - If the recipient count is less than 40% of the total email message count, the remediation can't be used to delete more than 1,000 messages that were sent to a single recipient.

- You need to be assigned permissions before you can do the procedures in this article. Admins can take the required action on email messages, but the **Search and Purge** role is required to get those actions approved. To assign the **Search and Purge** role, you have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Security operations/Security data/Email & collaboration advanced actions (manage)**.
  - [Email & collaboration permissions in the Microsoft Defender portal](mdo-portal-permissions.md): Membership in the **Organization Management** or **Data Investigator** role groups. Or, you can [create a new role group](mdo-portal-permissions.md#create-email--collaboration-role-groups-in-the-microsoft-defender-portal) with the **Search and Purge** role assigned, and add the users to the custom role group.

- Verify **Automated Investigation** is turned on at <https://security.microsoft.com/securitysettings/endpoints/integration>.

## Manual and automated remediation

*Manual hunting* occurs when security teams identify threats manually by using the search and filtering capabilities in Explorer (Threat Explorer). Manual email remediation can be triggered through any email view (*Malware*, *Phish*, or *All email*) after you identify a set of emails that need to be remediated.

:::image type="content" source="media/microsoft-365-defender-threat-explorer-manual-remediation.png"  lightbox="media/microsoft-365-defender-threat-explorer-manual-remediation.png" alt-text="Screenshot of manual hunting in Explorer (Threat Explorer) by date.":::

Security teams can use Explorer to select emails in several ways:

- Choose emails by hand: Use filters in various views. Select up to 100 emails to remediate.

- Query selection: Select an entire query by using the top **select all** button. The same query is also shown in action center mail submission details. Customers can submit maximum 200,000 emails from Explorer.

- Query selection with exclusion: Sometimes security operations teams might want to remediate emails by selecting an entire query and excluding certain emails from the query manually. To do so, an admin can use the **Select all** check box and scroll down to exclude emails manually. The query can hold a maximum of 200,000 emails.

Once emails are selected through Explorer, you can start remediation by taking direct action or by queuing up emails for an action:

- Direct approval: When actions like *move to inbox*, *move to junk*, *move to deleted items*, *soft delete*, or *hard delete* are selected by security personnel who have appropriate permissions, and the next steps in remediation are followed, the remediation process begins to execute the selected action.

  > [!NOTE]
  > As the remediation gets kicked-off, it generates an alert and an investigation in parallel. Alert shows up in the alerts queue with the name "Administrative action submitted by an Administrator" suggesting that security personnel took the action of remediating an entity. It presents details like name of the person who performed the action, supporting investigation link, time, etc. It works really well to know every time a harsh action like remediation is performed on entities. All these actions can be tracked under the **Actions & Submissions** \> **Action center** \> **History tab** (public preview).

- Two-step approval: An "add to remediation" action can be taken by admins who don't have appropriate permissions or who need to wait to execute the action. In this case, the targeted emails are added to a remediation container. Approval is needed before the remediation is executed.

**Automated investigation and response** actions are triggered by alerts or by security operations teams from Explorer. These results might include recommended remediation actions that must be approved by a security operations team. These actions are included on the **Action** tab in the automated investigation.

:::image type="content" source="media/tp-RemediationArticle3.png" alt-text="Email with malware on the Zapped page showing the time of ZAP execution." lightbox="media/tp-RemediationArticle3.png":::

All remediation (direct approvals) created in Explorer, Advanced hunting, or through Automated investigation are displayed in the Action center at **Actions & Submissions** \> **Action center** \> **History** tab (<https://security.microsoft.com/action-center/history>).

Manual actions pending approval using the two-step approval process (added to the remediation by one security operation team member, and reviewed and approved by another security operation team member) are visible at **Actions & Submissions** \> **Action center** \> **Pending** tab (<https://security.microsoft.com/action-center/pending>). After approval, they're visible at **Actions & Submissions** \> **Action center** \> **History** tab (<https://security.microsoft.com/action-center/history>).

:::image type="content" source="media/microsoft-365-defender-action-center-history.png" lightbox="media/microsoft-365-defender-action-center-history.png" alt-text="The unified Action Center shows you 30 days of remediation actions.":::

Unified Action Center shows remediation actions for the past 30 days. Actions taken through Explorer are listed by the name that the security operations team provided when the remediation was created as well as approval ID, Investigation ID. Actions taken through automated investigations have titles that begin with the related alert that triggered the investigation, such as *Zap email cluster*.

Open any remediation item to view details about it, including its remediation name, approval ID, Investigation ID, creation date, description, status, action source, action type, decided by, status. It also opens a side pane with action details, email cluster details, alert, and Incident details.

- **Open Investigation page**: Opens an admin investigation that contains fewer details and tabs. It shows details like: related alert, entity selected for remediation, action taken, remediation status, entity count, logs, and approver of action. Tracks an investigation manually done by the admin manually and contains details to selections made by the admin. There's no need to act on the investigation and alert (it's already in the Approved state).
- **Email count**: Displays the number of email messages submitted through Explorer. These messages can be actionable or not actionable.
- **Action logs**: Shows the details of remediation status like successful, failed, and already in destination.

  :::image type="content" source="media/microsoft-365-defender-action-center-history-panel.png" lightbox="media/microsoft-365-defender-action-center-history-panel.png" alt-text="The Action Center with the Move to Inbox option open.":::

  - **Actionable**: Email in the following cloud mailbox locations can be acted on and moved:
    - Inbox
    - Junk<sup>*</sup>
    - Deleted Items folder<sup>*</sup>
    - Recoverable Items\Deletions folder (soft deleted items)<sup>*</sup>
    - Quarantine

    <sup>*</sup> Not available for quarantined items.

  - **Not actionable**: Email in the following locations can't be acted on or moved in remediation actions:
    - Hard-deleted folder
    - On-premises/external
    - Failed/dropped
    - Unknown

  - **Types of Move and Delete actions supported**:
    - **Move to junk folder**: Moves messages to the user's Junk Email folder.
    - **Move to inbox**: Moves messages to the users Inbox folder.
    - **Move to deleted items**: Moves messages to the user's Deleted Items folder.
    - **Soft delete**: Delete the message from the Deleted items folder (move to the Recoverable Items\Deletions folder). The message is recoverable by the user and admins.

      **Delete sender's copy**: Also try to soft delete the message from the sender's Sent Items folder if the sender is the organization.

    - **Hard delete**: Purge the deleted message. Admins can recover hard deleted items using single-item recovery. For more information about hard deleted and soft deleted items, see [Soft-deleted and hard-deleted items](/compliance/assurance/assurance-exchange-online-data-deletion#soft-deleted-and-hard-deleted-items).

  > [!NOTE]
  > In U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD) admins can take the actions **Soft delete**, **Move to junk folder**, **Move to deleted items**, **Hard delete**, and **Move to inbox**. The actions **Delete sender's copy** and **Move to inbox** from quarantine folder aren't available.
  
  Suspicious messages are categorized as either remediable or nonremediable. In most cases, the total of remediable and nonremediable messages equals the total number of messages submitted. But the totals might not match because of system delays, time-outs, or expired messages. Messages expire based on the Explorer retention period for your organization.

  Unless you're remediating old messages after your organization's Explorer retention period, it's advisable to retry remediating items if you see number inconsistencies. For system delays, remediation updates are typically refreshed within a few hours.

  If your organization's retention period for email in Explorer is 30 days and you're remediating emails going back 29-30 days, mail submission counts might not always add up. The emails might have started moving out of the retention period already.

  If remediations are stuck in the "In progress" state for a while, it's likely due to system delays. It could take up to a few hours to remediate. You might see variations in mail submission counts, as some of the emails might not have been included the query at the start of remediation due to system delays. It's a good idea to retry remediating in such cases.

  > [!TIP]
  > For best results, remediation should be done in batches of 50,000 or fewer.

  Only remediable email messages are acted on during remediation. Nonremediable emails can't be remediated by Microsoft 365, becayse they aren't stored in cloud mailboxes.

  Admins can take actions on emails in quarantine if necessary, but those emails expire out of quarantine if they're not manually purged. By default, emails quarantined because of malicious content aren't accessible by users, so security personnel don't have to take any action to get rid of threats in quarantine. If the emails are on-premises or external, the user can be contacted to address the suspicious email. Or the admins can use separate email server/security tools for removal. These emails can be identified by applying the *delivery location = on-premises* external filter in Explorer. For failed or dropped email, or email not accessible by users, there isn't any email to mitigate, since these mails don't reach the mailbox.

- **Action logs**: Shows the messages remediated, successful, failed, already in destination.

  Status can be:

  - **Started**: Remediation is triggered.
    - **Queued**: Remediation is queued up for mitigation of emails.
    - **In progress**: Mitigation is in progress.
    - **Completed**: Mitigation on all remediable emails either completed successfully or with some failures.
    - **Failed**: No remediations were successful.

  As only remediable emails can be acted on, each email's cleanup is shown as successful or failed. From the total remediable emails, successful and failed mitigations are reported.

  - **Success**: The desired action on remediable emails was accomplished. For example: An admin wants to remove emails from mailboxes, so the admin takes the action of soft-deleting emails. If a remediable email isn't found in the original folder after the action is taken, the status will show as successful.

  - **Failure**: The desired action on remediable emails failed. For example: An admin wants to remove emails from mailboxes, so the admin takes the action of soft-deleting emails. If a remediable email is still found in the mailbox after the action is taken, status will show as failed.

  - **Already in destination**: The desired action was already taken on the email OR the email already existed in the destination location. For example: An email was soft deleted by the admin through Explorer on day one. Then similar emails show up on day 2, which are again soft deleted by the admin. While selecting these emails, admin ends up picking some emails from day one that are already soft deleted. Now these messages aren't acted upon. Instead, they show as Already in destination, since no action was taken on them as they existed in the destination location.

  - **New**: An *Already in destination* column has been added in the Action Log. This feature uses the latest delivery location in Explorer to signal if the mail has already been remediated. *Already in destination* helps security teams understand the total number of messages that still need to be addressed.

Actions can only be taken on messages in the Inbox, Junk, Deleted, and Soft Deleted folders of Explorer. Here's an example of how the new column works. A *soft delete action* takes place on the message present in the Inbox, then the message is handled according to policies. The next time a soft delete is performed, this message will show under the column 'Already in destination' signaling it doesn't need to be addressed again.

Select any item in the action log to display remediation details. If the details show **Successful** or **Not found in mailbox**, that item was already removed from the mailbox. Sometimes there's a system error during remediation. In those cases, it's a good idea to retry the remediation action.

If you need to remediate large batches of email, export the messages sent for remediation via Mail Submission, and export messages that were remediated via Action Logs. The export limit is increased to 100,000 records.

 Admins can take remediation actions like moving email messages to Junk, Inbox, or Deleted items folder and delete actions like soft deleted or hard delete from Advanced Hunting pages.

:::image type="content" source="media/microsoft-365-defender-advanced-hunting-actions-pane.png" lightbox="media/microsoft-365-defender-advanced-hunting-actions-pane.png" alt-text="The Advanced Hunting, Take Actions panel with your choice of actions.":::

Remediation mitigates threats, addresses suspicious emails, and helps keep an organization secure.
