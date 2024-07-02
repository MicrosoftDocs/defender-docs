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

# Bulk sender insights in Exchange Online Protection

In Microsoft 365 organizations with mailboxes in Exchange Online or standalone Exchange Online Protection (EOP) organizations without Exchange Online mailboxes, EOP assigns a bulk complaint level (BCL) value to inbound messages from bulk senders. A higher BCL value indicates a bulk message is more likely to exhibit undesirable spam-like behavior. For more information about the BCL, see [Bulk complaint level (BCL) in EOP](anti-spam-bulk-complaint-level-bcl-about.md).

The **Bulk sender insights** page in the Microsoft Defender portal allows you to see how much email is being identified as simulate changes to the bulk complaint 

- View how much mail is identified as bulk at every BCL level (1 to 9) for the last 60 days.
- Simulate changes to the BCL and view the affect on the number of messages that would be delivered vs. identified as bulk and acted on by the default anti-spam or custom anti-spam policies where you can set the BCL threshold. You can't set the BCL threshold in the Standard or Strict [preset security policies](preset-security-policies.md).

This article describes how to use the **Bulk sender insights** page in the Microsoft Defender portal.

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

## View Bulk sender insights

To go directly to the **Bulk sender insights** page, use <https://security.microsoft.com/senderinsights>. Otherwise, do the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & Collaboration** \> **Policies & Rules** \> **Threat policies** \> **Anti-spam** in the **Policies** section. Or, to go directly to the **Anti-spam policies** page, use <https://security.microsoft.com/antispam>.

2. On the **Anti-spam policies** page, select a custom anti-spam policy (the **Type** value is **Custom anti-spam policy**) or the default anti-spam policy named **Anti-spam inbound policy (Default)** by clicking anywhere in the row other than the check box next to the first column.

3. In the details flyout that opens, select **Edit spam threshold and properties** at the bottom of the **Bulk email threshold & spam properties** section.

4. In the **Spam threshold and properties** flyout that opens, select **Bulk sender insights** at the bottom of the **Bulk email threshold** section.

The **Bulk sender insights** page contains the following information:

- The table in center of the page contains the following columns:
  - **Bulk complaint level**: The available values 1 to 9 are shown.
  - **All emails**: The total number of messages that were identified as bulk at the specified BCL level.
  - **Current level**: The number of messages that were identified as bulk
  - **New level**:

- **Current bulk email threshold**: The BCL threshold value:
  - If you go directly to the page using <https://security.microsoft.com/senderinsights>, the BCL threshold value is 7.
  - If you go to the page from the properties of a custom anti-spam policy or the default anti-spam policy, the BCL threshold value is the current value from the policy.
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
