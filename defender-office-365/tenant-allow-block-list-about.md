---
title: Manage allows and blocks in the Tenant Allow/Block List
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
ms.date: 07/28/2025
search.appverid:
- MET150
ms.collection:
- m365-security
- tier1
ms.custom:
description: Learn about allow entries and block entries in the Tenant Allow/Block List in Microsoft 365.
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Manage allows and blocks in the Tenant Allow/Block List

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

> [!IMPORTANT]
> To allow phishing URLs that are part of non-Microsoft attack simulation training, use the [advanced delivery configuration](advanced-delivery-policy-configure.md) to specify the URLs. Don't use the Tenant Allow/Block List.

You might occasionally disagree with the Microsoft filtering verdict for email messages, Microsoft Teams messages, or Office apps. For example, a good message might be marked as bad (a false positive), or a bad message might be allowed through (a false negative), or a URL might be blocked when it shouldn't have.

The Tenant Allow/Block List in the Microsoft Defender portal gives you a way to manually override filtering verdicts. The list is used during mail flow (for email) or time of click (for email, Teams, or Office apps).

Entries for **Domains and email addresses** and **Spoofed senders** apply to messages from both internal and external senders. Special handling applies to internal spoofing scenarios. Block entries for **Domains and email addresses** also prevent users in the organization from *sending* email to those blocked domains and addresses.

The Tenant Allow/Block list is available in the Microsoft Defender portal at <https://security.microsoft.com> **Email & collaboration** \> **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

For usage and configuration instructions, see the following articles:

- **Domains and email addresses** and **spoofed senders**: [Allow or block emails using the Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md)
- **Files**: [Allow or block files using the Tenant Allow/Block List](tenant-allow-block-list-files-configure.md)
- **URLs**: [Allow or block URLs using the Tenant Allow/Block List](tenant-allow-block-list-urls-configure.md).
- **IP addresses**: [Allow or block IPv6 addresses using the Tenant Allow/Block List](tenant-allow-block-list-ip-addresses-configure.md).
- **Teams domains**: [Block domains in Microsoft Teams using the Tenant Allow/Block List](tenant-allow-block-list-teams-domains-configure.md).

These articles contain procedures in the Microsoft Defender portal and in PowerShell.

## Block entries in the Tenant Allow/Block List

> [!TIP]
> In the Tenant Allow/Block List, block entries take precedence over allow entries.

Use the **Submissions** page (also known as *admin submission*) at <https://security.microsoft.com/reportsubmission> to create block entries for the following types of items as you submit them as false negatives to Microsoft:

- **[Domains and email addresses](submissions-admin.md#report-questionable-email-to-microsoft)**:
  - Email messages from these senders are marked as *high confidence phishing* and then moved to quarantine.
  - Users in the organization can't send email to these blocked domains and addresses. They receive the following non-delivery report (also known as an NDR or bounce message): `550 5.7.703 Your message can't be delivered because messages to XXX, YYY are blocked by your organization using Tenant Allow Block List.` The entire message is blocked for all internal and external recipients of the message, even if only one recipient email address or domain is defined in a block entry.

  > [!TIP]
  > Blocking a specific sender or domain in the Tenant Allow/Block List treats those messages as high confidence phishing. To treat those messages as spam, add the sender to the blocked senders list or blocked domains list in [anti-spam policies](anti-spam-policies-configure.md).

- **[Files](submissions-admin.md#report-questionable-email-attachments-to-microsoft)**: Email messages that contain these blocked files are blocked as *malware*. Messages containing the blocked files are quarantined.

- **[URLs](submissions-admin.md#report-questionable-urls-to-microsoft)**: Email messages that contain these blocked URLs are blocked as *high confidence phishing*. Messages containing the blocked URLs are quarantined.

In the Tenant Allow/Block List, you can also directly create block entries for the following types of items:

- **[Domains and email addresses](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-domains-and-email-addresses)**, **[Files](tenant-allow-block-list-files-configure.md#create-block-entries-for-files)**, and **[URLs](tenant-allow-block-list-urls-configure.md#create-block-entries-for-urls)**.

- **[Spoofed senders](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-spoofed-senders)**: If you manually override an existing allow verdict from [spoof intelligence](anti-spoofing-spoof-intelligence.md), the blocked spoofed sender becomes a manual block entry that appears only on the **Spoofed senders** tab in the Tenant Allow/Block List.

- **[IP addresses](tenant-allow-block-list-ip-addresses-configure.md#create-block-entries-for-ipv6-addresses)**: If you manually create a block entry, all incoming email messages from that IP address are dropped at the edge of the service.

- **[Teams domains](tenant-allow-block-list-teams-domains-configure.md)**: If you manually create a block entry, all incoming communication over Teams from that domain will be blocked whereas existing communication will be deleted.

By default, the following types of block entries expire after 30 days, but you can set them to expire up 90 days or to never expire:

- [Domains and email addresses](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-domains-and-email-addresses)
- [Files](tenant-allow-block-list-files-configure.md#create-block-entries-for-files)
- [URLs](tenant-allow-block-list-urls-configure.md#create-block-entries-for-urls).

The following types of block entries never expire:

- [Spoofed senders](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-spoofed-senders)
- [IP addresses](tenant-allow-block-list-ip-addresses-configure.md#create-block-entries-for-ipv6-addresses)
- [Teams domains](tenant-allow-block-list-teams-domains-configure.md).

## Allow entries in the Tenant Allow/Block List

Unnecessary allow entries expose your organization to malicious email that the system would otherwise filter, so there are limitations for creating allow entries directly in the Tenant Allow/Block List:

- **Domains and email addresses** and **URLs**: You can create allow entries directly in the Tenant Allow/Block List to override the following verdicts:
  - Bulk
  - Spam
  - High confidence spam
  - Phishing (not high confidence phishing)

  For malware and high confidence phishing verdicts, you can't create allow entries directly in the Tenant Allow/Block List. Instead, use the **Submissions** page at <https://security.microsoft.com/reportsubmission> to submit the **[email](submissions-admin.md#report-good-email-to-microsoft)** or **[URL](submissions-admin.md#report-good-urls-to-microsoft)** to Microsoft. After you select **I've confirmed it's clean**, you can then select **Allow this message** or **Allow this URL** to create an allow entry for the domains and email addresses or URLs.

- **Files**: You can't create allow entries directly in the Tenant Allow/Block List. Instead, use the **Submissions** page at <https://security.microsoft.com/reportsubmission> to submit the **[email attachment](submissions-admin.md#report-good-email-attachments-to-microsoft)** to Microsoft. After you select **I've confirmed it's clean**, you can then select **Allow this file** to create an allow entry for the files.

- **Spoofed senders**:
  - If spoof intelligence already blocked the message as spoofing, use the **Submissions** page at <https://security.microsoft.com/reportsubmission> to [report the email to Microsoft](submissions-admin.md#report-good-email-to-microsoft) as **I've confirmed it's clean**, and then select **Allow this message**.
  - You can proactively create [an allow entry for a spoofed sender](tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-spoofed-senders) on the **Spoofed sender** tab in the Tenant Allow/Block List before [spoof intelligence](anti-spoofing-spoof-intelligence.md) identifies and blocks the message as spoofing.

- **IP Addresses**: You can proactively create an [an allow entry for an IP address](tenant-allow-block-list-ip-addresses-configure.md#create-block-entries-for-ipv6-addresses) on the **IP addresses** tab in the Tenant Allow/Block List to override the IP filters for incoming messages.

The following list describes what happens in the Tenant Allow/Block List when you submit something to Microsoft as a false positive on the **Submissions** page:

- **Email attachments** and **URLs**: An allow entry is created and the entry appears on the **Files** or **URLs** tab in the Tenant Allow/Block List respectively.

   For URLs reported as false positives, we allow subsequent messages that contain variations of the original URL. For example, you use the **Submissions** page to report the incorrectly blocked URL `www.contoso.com/abc`. If your organization later receives a message that contains the URL (for example but not limited to: `www.contoso.com/abc`, `www.contoso.com/abc?id=1`, `www.contoso.com/abc/def/gty/uyt?id=5`, or `www.contoso.com/abc/whatever`), the message isn't blocked based on the URL. In other words, you don't need to report multiple variations of the same URL as good to Microsoft.

- **Email**: If Microsoft 365 blocked a message, an allow entry might be created in the Tenant Allow/Block List:
  - If the message was blocked by [spoof intelligence](anti-spoofing-spoof-intelligence.md), an allow entry for the sender is created, and the entry appears on the **Spoofed senders** tab in the Tenant Allow/Block List.
  - If [user or mailbox intelligence impersonation protection in Defender for Office 365](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365) blocked a message, an allow entry isn't created in the Tenant Allow/Block List. Instead, the domain or sender is added to the **Trusted senders and domains section** in the [anti-phishing policy](anti-phishing-policies-mdo-configure.md#use-the-microsoft-defender-portal-to-modify-anti-phishing-policies) that detected the message.
  - If the message was blocked due to file-based filters, an allow entry for the file is created, and the entry appears on the **Files** tab in the Tenant Allow/Block List.
  - If the message was blocked due to URL-based filters, an allow entry for the URL is created, and the entry appears on the **URL** tab in the Tenant Allow/Block List.
  - If the message was blocked for any other reason, an allow entry for the sender email address or domain is created, and the entry appears on the **Domains & addresses** tab in the Tenant Allow/Block List.
  - If the message wasn't blocked due to filtering, no allow entries are created anywhere.

[!INCLUDE [Allow entry facts](../includes/allow-entry-facts.md)]

## What to expect after you add an allow or block entry

After you add an allow entry on the **Submissions** page or a block entry in the Tenant Allow/Block List, the entry should start working immediately (within 5 minutes).

If Microsoft learned from the allow entry, the built-in [alert policy](/defender-xdr/alert-policies#threat-management-alert-policies) named **Removed an entry in Tenant Allow/Block List** generates an alert when the (now unnecessary) allow entry is removed.
