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
ms.date: 03/30/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Bulk email detection in cloud organizations

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

Select :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Filter**. In the **Filters** flyout that opens,  select only the **Detection** value **Bulk** in the **Filters** flyout that opens. Use the **Bulk complaint level** slider to increase or decrease the BCL threshold.

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

> [!NOTE]
> The features described in this section are currently in Preview, aren't available to all organizations, and are subject to change.

As previously described, the action for bulk mail that meets or exceeds the BCL threshold is defined in anti-spam policies. For example, deliver to the Junk Email folder or quarantine.

But you can configure anti-spam policies to deliver bulk mail below the BCL threshold to the **Promotions** folder in supported versions of Outlook by doing the following steps:

1. Create (or identify) two mail-enabled security groups for the following purposes:
   - **Opt-in**: Users who get bulk mail tagged as **Bulk** and delivered to the **Promotions** folder in supported Outlook clients.
   - **Opt-out**: Users who don't get bulk mail tagged as **Bulk** and don't get a **Promotions** folder.

   By leaving one group and joining the other, admins or the users themselves can control whether the **Promotions** folder is used.

   For group creation instructions, see [Manage mail-enabled security groups in Exchange Online](/exchange/recipients-in-exchange-online/manage-mail-enabled-security-groups).

2. [Create an Exchange mail flow rule](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules#create-a-mail-flow-rule) (also known as a transport rule) to apply the **Bulk** tag in supported versions of Outlook to all bulk mail sent to members of the **opt-in** mail-enabled security group. Create the rule with the following settings:
   - **Set rule conditions** page:
     - **Name**: For example, **Bulk mail ID**.
     - **Apply this rule if...**: Configure the following conditions:
       - **The recipient** \> **is a member of this group**: Select the **opt-in** mail-enabled security group.
       - **The sender** \> **is external/internal**: Select **Outside the organization**.
     - **Do the following...**: Select **Modify the message properties** \> **set a message header**.
       - **Set the message header**: Enter the value `X-MS-Exchange-Organization-BulkStamping`.
       - **to the value**: Enter the value `1`.
     - **Except if...**: Optionally, you can use exceptions to prevent specific bulk senders from being tagged as **Bulk**. For example:
        - **The sender** \> **is this person**
        - **The sender** \> **domain is**
   - **Set rule settings** page: Verify **Stop processing more rules** isn't selected.

3. Create new **opt-in** and **opt-out** anti-spam policies to identify users who should and shouldn't get all bulk mail below the BCL threshold delivered to the **Promotions** folder (members of the **opt-in** and **opt-out** mail-enabled security groups). For anti-spam policy creation instructions, see [Use the Microsoft Defender portal to create anti-spam policies](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-create-anti-spam-policies).
   - For **both** anti-spam policies, do the following steps:
     - Verify the members of both mail-enabled security groups aren't included in or are excluded from the [Standard and Strict preset security policies](preset-security-policies.md). For more information, see [Order of precedence for preset security policies and other threat policies](preset-security-policies.md#order-of-precedence-for-preset-security-policies-and-other-threat-policies)
     - Recreate the settings from the old anti-spam policy that the members of the mail-enabled security group left for the new custom policy. For example, the BCL threshold (although we recommend a minimum value of 5 for the opt-in policy) and bulk action, other detection actions and the corresponding quarantine policies, allow list settings, block list settings, etc.
   - For the **opt-out** anti-spam policy, configure the following settings:
     - **Users, groups, and domains** page:
       - **Include these users, groups and domains** section: Click in the **Groups** box to enter and select the **opt-out** mail-enabled security group you created or identified in Step 1.
       - **Exclude these users, groups and domains**: Optionally select the check box to find and enter **Users** or **Groups** (not both) to exclude from the policy.
   - For the **opt-in** anti-spam policy, configure the following settings:
     - **Users, groups, and domains** page:
       - **Include these users, groups and domains** section: Click in the **Groups** box to enter and select the **opt-in** mail-enabled security group you used in the previous steps.
       - **Exclude these users, groups and domains**: Optionally select the check box to find and enter **Users** or **Groups** (not both) to exclude from the policy.

     - **Actions** page: Move the **Bulk moves enabled** toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

       :::image type="content" source="media/anti-spam-policy-bulk-moves-enabled.png" alt-text="Screenshot of the Actions page of the new anti-spam policy wizard in the Microsoft Defender portal with Bulk moves enabled turned on." lightbox="media/anti-spam-policy-bulk-moves-enabled.png":::

     - Configure the **opt-in** anti-spam policy with [a high priority (low priority number)](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-set-the-priority-of-custom-anti-spam-policies) so it's applied before other custom anti-spam policies.

   > [!TIP]
   > For important information about why you shouldn't mix **Users** and **Groups** to include in or exclude from an anti-spam policy, see Step 4 in [Use the Microsoft Defender portal to create anti-spam policies](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-create-anti-spam-policies).

After you complete the previous steps, members of the **opt-in** mail-enabled security group (users who have the **opt-in** anti-spam policy applied) have the following experiences, based on their version of Outlook:

|Feature|Outlook on<br>the web|Outlook for Windows|Outlook for<br>iOS and Android|Classic Outlook|
|---|:---:|:---:|:---:|:---:|
|All messages identified as bulk have the **Bulk** tag applied, regardless of the message location in the mailbox.|✔|✔|||
|The **Bulk** tag is available as a condition in [Inbox rules](https://support.microsoft.com/office/8400435c-f14e-4272-9004-1548bb1848f2).|✔|✔|||
|Bulk mail below the BCL threshold that invokes the bulk action in the anti-spam policy is delivered to the **Promotions** folder.|✔|✔|✔|✔|

### About the Promotions folder

The **Promotions** folder in user mailboxes has the following characteristics:

- **Promotions** is a regular folder, not a system folder.
  - If you soft delete the folder (available in **Deleted items**), bulk messages are delivered to the folder in **Deleted items**.
  - If you hard delete the folder (available in Recoverable items), the folder is recreated and used within approximately 5 minutes.
  - If an unrelated **Promotions** folder already exists in the mailbox, a new folder named **Promotions(1)** is created and used.
  - If you rename or move the **Promotions** folder, it continues to work (the name or location of the folder isn't important).
- Bulk mail that would normally be delivered to the **Promotions** folder is delivered to the Inbox in the following scenarios:
  - The bulk sender is in the user's [Safe Senders list](create-safe-sender-lists-in-office-365.md#use-outlook-safe-senders).
  - The bulk sender is in an [accepted domain](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains) of the organization.
