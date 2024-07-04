---
title: Bulk sender insights
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.localizationpriority: medium
search.appverid: 
  - MET150
ms.assetid:
ms.collection: 
  - m365-security
  - tier2
description: Admins can learn about the Bulk sender insights page in Exchange Online Protection (EOP) to simulate the effect of the bulk complaint level (BCL) on allowed or blocked messages..
ms.service: defender-office-365
ms.date: 07/01/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Bulk senders insight in Exchange Online Protection

In Microsoft 365 organizations with mailboxes in Exchange Online or standalone Exchange Online Protection (EOP) organizations without Exchange Online mailboxes, the bulk sender insight in the Microsoft Defender portal allow you to see how much email was identified as bulk at the current bulk threshold level in anti-spam policies, and to simulate identified vs. allowed bulk email based on changes in the bulk email threshold.

EOP assigns a bulk complaint level (BCL) value to inbound messages from bulk senders. A higher BCL value indicates a bulk message is more likely to be spam. The bulk email threshold in anti-spam policies use a specified BCL value to identify messages a bulk and take action on them. For more information about the BCL, see [Bulk complaint level (BCL) in EOP](anti-spam-bulk-complaint-level-bcl-about.md).

The bulk senders insight has the following capabilities:

- View how much mail is identified as bulk at every BCL level (1 to 9) for the last 60 days.
- Simulate changes to the bulk email threshold and view the affect on the number of messages that would be delivered vs. blocked as bulk by the default anti-spam or custom anti-spam policies where you can set the BCL threshold. You can't set the BCL threshold in the Standard or Strict [preset security policies](preset-security-policies.md).
- View information about message senders that were affected by the bulk email threshold, including filtering based on the trustworthiness of the sender.

This article describes how to use the bulk senders insight in the Microsoft Defender portal.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>. To go directly to the **Bulk sender insights** page, use <https://security.microsoft.com/senderinsights>.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/Security settings/Core Security settings (manage)** or **Authorization and settings/Security settings/Core Security settings (read)**.
  - [Exchange Online permissions](/exchange/permissions-exo/permissions-exo):
    - _Add, modify, and delete policies_: Membership in the **Organization Management** or **Security Administrator** role groups.
    - _Read-only access to policies_: Membership in the **Global Reader**, **Security Reader**, or **View-Only Organization Management** role groups.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the following roles gives users the required permissions _and_ permissions for other features in Microsoft 365:
    - _Add, modify, and delete policies_: Membership in the **Organization Management**<sup>\*</sup> or **Security Administrator** roles.
    - _Read-only access to policies_: Membership in the **Global Reader** or **Security Reader** roles.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

- For our recommended settings for anti-spam policies, see [EOP anti-spam policy settings](recommended-settings-for-eop-and-office365.md#eop-anti-spam-policy-settings).

> [!TIP]
> Settings in the default or custom anti-spam policies are ignored if a recipient is also included in the [Standard or Strict preset security policies](preset-security-policies.md). For more information, see [Order and precedence of email protection](how-policies-and-protections-are-combined.md).
>
> The **Bulk threshold** value in an anti-spam policy determines the BCL threshold that's used to identify a message as bulk. For example, the **Bulk threshold** value 7 means that messages with the BCL value 7, 8, or 9 are identified as bulk. What happens to bulk messages is determined by the **Bulk compliant level (BCL) met or exceeded** action in the anti-spam policy (for example, **Move message to Junk Email folder**, **Quarantine**, or **Delete message**). For simplicity, identifying a message as bulk and taking action on it is called **blocked** in the bulk senders insight.

## Open the bulk senders insight in the Microsoft Defender portal

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & Collaboration** \> **Policies & Rules** \> **Threat policies** \> **Anti-spam** in the **Policies** section. Or, to go directly to the **Anti-spam policies** page, use <https://security.microsoft.com/antispam>.

2. On the **Anti-spam policies** page, select a custom anti-spam policy (the **Type** value is **Custom anti-spam policy**) or the default anti-spam policy named **Anti-spam inbound policy (Default)** by clicking anywhere in the row other than the check box next to the first column.

3. In the details flyout that opens, select **Edit spam threshold and properties** at the bottom of the **Bulk email threshold & spam properties** section.

4. In the **Spam threshold and properties** flyout that opens, bulk sender insights contains the following information for the last 60 days:

   - The number of messages that were identified as bulk at the current BCL level.
   - A table that shows the number messages that were identified as bulk at every possible BCL level (1-9).

   :::image type="content" source="media/m365-sc-bulk-sender-insights.png" alt-text="The bulk sender insights in the properties of the default anti-spam policy in the Microsoft Defender portal." lightbox="media/m365-sc-bulk-sender-insights.png":::

To view detailed information about bulk detections and senders, select **View bulk sender insights** or **Bulk sender insights** to open the **Bulk sender insights** page.

## View the Bulk senders insight page

The **Bulk sender insights** page at <https://security.microsoft.com/senderinsights> is available directly or when you select **View bulk sender insights** or **Bulk sender insights** from the **Spam threshold and properties** flyout in the details of a custom anti-spam policy or the default anti-spam policy.

:::image type="content" source="media/m365-sc-bulk-sender-insights page.png" alt-text="The Bulk sender insights page in the Microsoft Defender portal." lightbox="media/m365-sc-bulk-sender-insights page.png":::

Before you run a simulation, values in the table in the middle of the page indicate the following values:

- **Bulk complaint level**: The range of possible BCL values (1 to 9).
- **All emails**: The total number of messages that were identified at each BCL value (some of which might be 0).
- **Current level**: The number of messages that were delivered (not identified as bulk) for each BCL value:
  - If the BCL value is less that the **Current bulk email threshold** value, the message was delivered (wasn't identified as bulk):
    - The **Current level** and **All email** values are the same.
    - The **Current level** value matches the **Email delivered at current config** value.
  - If the BCL value is greater than or equal to the **Current bulk email threshold** value, the message was identified as bulk and blocked.
    - The **Current level** value for the BCL value is 0.
    - The **All emails** value matches the **Emails blocked at current config** value.
- **New level**: The number of messages that were identified as bulk after you run a simulation. This value is the same as **All emails** before you run any simulations.

To run a simulation, use the following elements on the page:

- The unmodifiable **Current bulk email threshold** slider shows the current BCL threshold value based on how you got to the **Bulk sender insights** page:
  - **Directly**: The BCL threshold value is 7.
  - **From the properties of an anti-spam policy**: The BCL threshold value is the current value in the anti-spam policy.
- The **New bulk email threshold** slider allows you to simulate the effect of increasing and decreasing the BCL threshold on delivered or blocked messages.
- The **Good coefficient** slider specifies a good/bad sender trustworthiness threshold to use in the BCL update simulation. A higher value indicates that you want simulated BCL threshold results based on more reliable senders. The **Good coefficient** value for senders is based on the following factors:
  - Past interactions with the sender.
  - Message frequency from the sender.
  - Admin or user feedback on messages from the sender.

After you select the **New bulk email threshold** and **Good coefficient** values, select **Simulate**:

- The page is updated with the number of blocked vs. allowed messages for the current and new simulated BCL threshold levels.
- The bottom of the page is updated with information about senders that would be identified as bulk.

### View information about bulk senders on the Bulk sender insights page

The details table contains sender data when you first open the page if the current bulk threshold value already resulted in messages being identified as bulk.

Sender data might be added or modify after you configure the **New bulk email threshold** and **Good coefficient** values and then select **Simulate**.

After you select the **New bulk email threshold** and **Good coefficient** values, select **Simulate**.

- The page is updated with the allowed vs. blocked senders for the current and new BCL threshold levels.
- The bottom of the page contains the senders 

The **Bulk sender insights** page contains the following information:

- The table in center of the page contains the following columns:
  - **Bulk complaint level**: The available values 1 to 9 are shown.
  - **All emails**: The total number of messages that were identified as bulk at the specified BCL level.
  - **Current level**: The number of messages that were identified as bulk
  - **New level**:


- **New bulk email threshold**: Use the slider to experiment with different BCL values and see the result on detected vs. delivered email messages.
- **Good coefficient**: The value from 0 to 100 indicates how trustworthy the message sender is, based on past interactions, message frequency, and admin or user feedback.
  - A higher value restricts the simulation results to more reliable and trusted senders.
  - Senders greater than or equal to the specified **Good coefficient** value are allowed. Senders less than the specified value are identified as bulk and acted upon.

The details table at the bottom of the page shows information about message senders based on the **New bulk email threshold** and **Good coefficient** values after you select **Simulate**. The following information is available:

- **Sender**: The sender's email address.
- **Bulk level**
- **Good coefficient**
- **New sender blocked**
- **Potential false positive**

To change the list of entries from normal to compact spacing, select :::image type="icon" source="media/m365-cc-sc-standard-icon.png" border="false"::: **Change list spacing to compact or normal**, and then select :::image type="icon" source="media/m365-cc-sc-compact-icon.png" border="false"::: **Compact list**.

Use the :::image type="icon" source="media/m365-cc-sc-search-icon.png" border="false"::: **Search** box and a corresponding value to find specific senders.

To filter the results, select **All senders** and then select one of the following values:

- **New sender blocked**: Only senders where **New sender blocked** is **True** are shown.
- **Potential false positive**: Only senders where **Potential false positive** is **True** are shown.

Use the :::image type="icon" source="media/m365-cc-sc-download-icon.png" border="false"::: **Export** to save the currently displayed list of senders to a CSV file. The default filename is Bulk sender insights - Microsoft Defender.csv, and the default location is the local Downloads folder. If an exported file already exists in that location, the filename is incremented (for example, Bulk sender insights - Microsoft Defender(1).csv).

To view details about a specific sender, click anywhere in the row other than the check box next to the first column. The **Sender details** flyout that opens contains the following information about the sender:

- **Sender**: The sender's email address.
- **Emails**: The number of messages from the sender.
- **Email in Inbox**: The number of messages from the sender that were delivered to user Inboxes.
- **Email in Junk/quarantine**: The number of messages from the sender that were delivered to user Junk Email folders or quarantined.
- **Admin control**: Whether the sender is allowed or blocked by the [Manage allows and blocks in the Tenant Allow/Block List](tenant-allow-block-list-about.md)Valid values are:
  - **Allow**: An allow entry exists for the message sender.
  - **Block**: A block entry exists for the message sender.
- **User allowed emails**: The number of messages from the sender that were added the Safe Senders list in user mailboxes.
- **User blocked emails**: The number of messages from the sender that were added the Blocked Senders list in user mailboxes.
- **False positive submissions**: The number of messages from the sender that were submitted as good mail accidentally blocked.
- **False negative submissions**: The number of messages from the sender that were submitted as bad mail accidentally delivered.
- **User moved from Junk to Inbox**
- **User moved from Inbox to Junk**
- **User deleted emails**
- **Admin quarantined emails**
- **Admin moved emails from Inbox to Junk**
- **Admin deleted emails**
