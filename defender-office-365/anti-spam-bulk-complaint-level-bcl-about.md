---
title: Bulk email detection
author: chrisda
ms.author: chrisda
ms.topic: concept-article
ms.localizationpriority: medium
ms.assetid: a5b03b3c-37dd-429e-8e9b-2c1b25031794
ms.collection:
  - m365-security
  - tier2
description: Admins can learn about bulk email detection, including the bulk complain level (BCL) values that are used in Microsoft 365.
ms.service: defender-office-365
ms.date: 07/31/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Bulk email detection and bulk complaint level (BCL) in cloud organizations

Microsoft 365 assigns a bulk complaint level (BCL) value to inbound messages from bulk senders. The BCL value is added to the message in an X-header and is similar to the [spam confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md) that identifies messages as spam. A higher BCL value indicates a bulk message is more likely to exhibit undesirable spam-like behavior. Microsoft uses both internal and external sources to identify bulk mail and determine the appropriate BCL value.

Bulk senders vary in their sending patterns, content creation, and recipient acquisition practices. Good bulk senders send desired messages with relevant content to their subscribers. These messages generate few complaints from recipients. Other bulk senders send unsolicited messages that closely resemble spam and generate many complaints from recipients. Messages from a bulk sender are known as _bulk mail_ or _gray mail_.

Spam filtering marks messages as **Bulk email** based on the BCL threshold in anti-spam policies and takes the specified action on the message. For more information, see [Configure anti-spam policies](anti-spam-policies-configure.md) and [What's the difference between junk email and bulk email?](anti-spam-spam-vs-bulk-about.md).

The BCL thresholds are described in the following table:

|BCL|Description|
|:---:|---|
|0|The message isn't from a bulk sender.|
|1, 2, 3|The message is from a bulk sender that generates few complaints.|
|4, 5, 6, 7|The message is from a bulk sender that generates a mixed number of complaints.|
|8, 9|The message is from a bulk sender that generates a high number of complaints.|

The default BCL threshold that's used in anti-spam policies is described in the following list:

- **Default anti-spam policy and new anti-spam policies**: 7.
- **[Standard preset security policy](preset-security-policies.md)**: 6.
- **Strict preset security policy**: 5.

Messages that meet or exceed the configured BCL threshold have the following default actions taken on them:

- **Default anti-spam policy, new anti-spam policies, and Standard preset security policy**: Deliver the message to recipient Junk Email folders.
- **Strict preset security policy**: [Quarantine the message](quarantine-end-user.md).

## BCL threshold in the Threat protection status report

The filters in the [View data by Email \> Spam and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--spam-and-chart-breakdown-by-detection-technology) view of the **Threat protection status report** in the Microsoft Defender portal at <https://security.microsoft.com/reports/TPSEmailSpamReportATP> contain the **Bulk complaint level** slider.

Select :::image type="icon" source="media/defender-portal-icon-filter.png" border="false"::: **Filter**. In the **Filters** flyout that opens,  select only the **Detection** value **Bulk** in the **Filters** flyout that opens. Use the **Bulk complaint level** slider to increase or decrease the BCL threshold.

After you apply the filters and return to the main report page, you see that hanging the BCL threshold changes the data in the report:

- Increasing the BCL threshold identifies fewer messages as bulk.
- Decreasing the BCL threshold value identifies more messages as bulk.
- Set a minimum and maximum BCL threshold to see the effect on bulk detections.

:::image type="content" source="media/threat-protection-status-report-malware-detection-tech-view-bcl-slider.png" alt-text="Screenshot showing the Bulk complaint level slider in the filters of View data by Email \> Spam and Chart breakdown by Detection Technology in the Threat protection status report in the Microsoft Defender portal." lightbox="media/threat-protection-status-report-malware-detection-tech-view-bcl-slider.png":::

## Bulk senders insight

The bulk senders insight in the Defender portal allows you to see how much mail was identified as bulk at the current BCL threshold in anti-spam policies, and to simulate identified vs. allowed bulk mail based on changes in the BCL threshold.

The bulk senders insight is available in the following locations in the Defender portal:

- In the properties of the default anti-spam policy or custom anti-spam policies.
- On the **Email & collaboration reports and insights** page at <https://security.microsoft.com/emailandcollabreport>.

For more information, see [Bulk senders insight](anti-spam-bulk-senders-insight.md).

## Deliver bulk mail below the BCL threshold to the Promotions folder

As previously described, the action for bulk mail that meets or exceeds the BCL threshold is defined in anti-spam policies. For example, deliver to the Junk Email folder or quarantine.

But you can configure anti-spam policies to deliver bulk mail below the BCL threshold (even messages with the BCL value 0 identified as bulk) to a **Promotions** folder in supported versions of Outlook by using the **Bulk moves enabled** setting in anti-spam policies.

As of July 2026, all messages identified as bulk (regardless of BCL value) automatically receive the **Promotions** tag. When you turn on the **Bulk moves enabled** setting in anti-spam policies, bulk mail that would normally be delivered to the Inbox is delivered to the **Promotions** folder instead.

The system learns from user activity in the **Promotions** folder (moving messages in or out), and remembers the action for future messages.

> [!NOTE]
> To prevent mail _from specific senders_ or _to specific recipients_ from receiving the **Promotions** tag, you need to [create a mail flow rule (transport rule)](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules#create-a-mail-flow-rule) with the following settings:
>
> - **Set rule conditions** page:
>   - **Name**: For example, **Bulk mail ID**.
>   - **Apply this rule if...**: Prevent mail from the specified senders or to the specified recipients from being tagged as **Promotions**. For example:
>     - **The sender** \> **is external/internal**: Select **Outside the organization**.
>     - **The sender** \> **address includes any of these words**: Enter text from the sender's email address.
>     - **The recipient** \> **is this person**> select one or more recipients.
>
>     For more information, see [Sender conditions in mail flow rules](/exchange/security-and-compliance/mail-flow-rules/conditions-and-exceptions#senders).
>
>   - **Do the following...**: Select **Modify the message properties** \> **set a message header**.
>     - **Set the message header**: Enter the value `X-MS-Exchange-Organization-BulkStamping`.
>     - **to the value**: Enter the value `0`.
>   - **Except if...**: Optionally, you can use exceptions to tag specific messages from the senders or to the recipients as **Promotions**.
>   - **Set rule settings** page: Verify **Stop processing more rules** isn't selected.
>
> For Preview customers, the rule that set `X-MS-Exchange-Organization-BulkStamping` to the value`1` to tag messages as **Bulk** is no longer required.

To enable bulk mail delivery to the **Promotions** folder, do the following steps:

> [!TIP]
> The following procedures use different mail-enabled security groups to identify users who should and shouldn't get bulk mail delivered to the **Promotions** folder. Group membership is the only way for users to opt-in or opt-out of the feature _themselves_, provided the users are allowed join or leave the groups themselves.
>
> If you aren't interested in giving users opt-in or opt-out control, you can configure the feature using admin controls only. For example, turn on **Bulk moves enabled** in all your current anti-spam policies (no need to create new opt-in or opt-out anti-spam policies).
>
> The only scenario that requires an opt-in group is if all users are included in the [Standard and Strict preset security policies](preset-security-policies.md) only. _Currently_, the **Bulk moves enabled** setting is **Off** in the Standard and Strict preset security policies. The only way for users to get bulk mail moved to the **Promotions** folder is to exclude them from the Standard and Strict preset security policies, and an opt-in group is the easiest way to exclude them. You can then turn on the **Bulk moves enabled** setting in the default anti-spam policy (which effectively becomes the opt-in policy), or create a custom anti-spam policy that's assigned only to the opt-in group.

1. Create (or identify) two mail-enabled security groups for the following purposes:
   - **Opt-in**: Bulk mail tagged as **Promotions** that's below the BCL threshold is delivered to the **Promotions** folder in supported Outlook clients.
   - **Opt-out**: Users don't get a **Promotions** folder. Bulk mail tagged as **Promotions** that's below the BCL threshold is delivered to the Inbox.

   By leaving one group and joining the other, admins or the users themselves can control whether the **Promotions** folder is used.

   For group creation instructions, see [Manage mail-enabled security groups in Exchange Online](/exchange/recipients-in-exchange-online/manage-mail-enabled-security-groups).

2. Create new **opt-in** and **opt-out** anti-spam policies to identify users who should and shouldn't get bulk mail delivered to the **Promotions** folder (members of the **opt-in** and **opt-out** groups). For anti-spam policy creation instructions, see [Use the Microsoft Defender portal to create anti-spam policies](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-create-anti-spam-policies).
   - For **both** anti-spam policies, do the following steps:
     - Verify the members of both groups are excluded from the [Standard and Strict preset security policies](preset-security-policies.md). For more information, see [Order of precedence for preset security policies and other threat policies](preset-security-policies.md#order-of-precedence-for-preset-security-policies-and-other-threat-policies)
     - Recreate the settings from the old anti-spam policy that the members of the **opt-in** group left for the new opt-in policy. For example, the BCL threshold (although we recommend a minimum value of 5 for the opt-in policy) and bulk action, other detection actions and the corresponding quarantine policies, allow list settings, block list settings, etc.
   - For the **opt-out** anti-spam policy, configure the following settings:
     - **Users, groups, and domains** page:
       - **Include these users, groups and domains** section: Click in the **Groups** box to enter and select the **opt-out** group.
       - **Exclude these users, groups and domains**: Optionally select the check box to find and enter **Users** or **Groups** (not both) to exclude from the policy.
   - For the **opt-in** anti-spam policy, configure the following settings:
     - **Users, groups, and domains** page:
       - **Include these users, groups and domains** section: Click in the **Groups** box to enter and select the **opt-in** group.
       - **Exclude these users, groups and domains**: Optionally select the check box to find and enter **Users** or **Groups** (not both) to exclude from the policy.
     - **Actions** page: Move the **Bulk moves enabled** toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

       :::image type="content" source="media/anti-spam-policy-bulk-moves-enabled.png" alt-text="Screenshot of the Actions page of the new anti-spam policy wizard in the Microsoft Defender portal with Bulk moves enabled turned on." lightbox="media/anti-spam-policy-bulk-moves-enabled.png":::

     - Configure the **opt-in** anti-spam policy with [a high priority (low priority number)](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-set-the-priority-of-custom-anti-spam-policies) so it's applied before other custom anti-spam policies.

   > [!TIP]
   > For important information about why you shouldn't mix **Users** and **Groups** to include in or exclude from an anti-spam policy, see Step 4 in [Use the Microsoft Defender portal to create anti-spam policies](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-create-anti-spam-policies).

After you complete the previous steps, members of the **opt-in** group (users who have the **opt-in** anti-spam policy applied) _currently_ have the following experiences, based on their version of Outlook:

|Feature|Outlook on<br>the web|Outlook for Windows|Outlook for<br>iOS and Android|Classic Outlook|
|---|:---:|:---:|:---:|:---:|
|All messages identified as bulk have the **Promotions** tag applied, regardless of the message location.|✔|✔|||
|The **Promotions** tag is available as a condition in [Inbox rules](https://support.microsoft.com/office/8400435c-f14e-4272-9004-1548bb1848f2). For example: <br/> :::image type="content" source="media/promotions-folder-inbox-rules.png" alt-text="Screenshot of the Inbox rule creation steps in Outlook on the web to use the Bulk tag as a condition to move messages into the Promotions folder." lightbox="media/promotions-folder-inbox-rules.png":::|✔|✔|||
|Bulk mail below the BCL threshold that invokes the bulk action in the anti-spam policy is delivered to the **Promotions** folder, and the system learns as the users moves messages into and out of the folder.|✔|✔|✔|✔|

### About the Promotions folder

The **Promotions** folder in user mailboxes has the following characteristics:

- **Promotions** is a regular folder, not a system folder.
  - After the anti-spam policy is applied to a user, the **Promotions** folder is created in the mailbox when the first bulk message is delivered to the mailbox.
  - If you soft delete the folder (available in **Deleted items**), bulk messages are delivered to the folder in **Deleted items**.
  - Currently, if you hard delete the folder (available in **Recoverable items**), future bulk messages are delivered to the Inbox.
  - If an unrelated **Promotions** folder already exists in the mailbox, a new folder named **Promotions(1)** is created and used.
  - If you rename or move the **Promotions** folder, it continues to work (the name or location of the folder doesn't matter).
- Bulk mail that would normally be delivered to the **Promotions** folder is delivered to the Inbox in the following scenarios:
  - The bulk sender is in the user's [Safe Senders list](create-safe-sender-lists-in-office-365.md#use-outlook-safe-senders).
  - The bulk sender is in an [accepted domain](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains) of the organization.
- If you turn off **Bulk moves enabled** in an existing anti-spam policy, the affected users still have a **Promotions** folder in their mailboxes, but bulk mail is no longer delivered to the **Promotions** folder. You can use Inbox rules with the **Marked with** \> **Promotions** condition as shown in the previous table to move bulk messages to the **Promotions** folder.
- The system learns from user activity in the **Promotions** folder (moving messages in or out), and remembers the action for future messages.
- Existing user-defined Inbox rules that act on messages identified as bulk take precedence over **Promotions** folder placement by the **Bulk moves enabled** feature. User-defined rules are honored and not overridden.
