---
title: Create blocked sender lists
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
ms.localizationpriority: medium
search.appverid: 
  - MET150s
description: Admins can learn about the available and preferred options to block inbound messages in Exchange Online Protection (EOP).
ms.service: defender-office-365
ms.date: 06/10/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Create blocked sender lists in EOP

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In Microsoft 365 organizations with mailboxes in Exchange Online or standalone Exchange Online Protection (EOP) organizations without Exchange Online mailboxes, EOP offers multiple ways of blocking email from unwanted senders. Collectively, you can think of these options as _blocked sender lists_.

The following list contains the available methods to block senders in EOP from most recommended to least recommended:

1. Block entries for domains and email addresses (including spoofed senders) in the Tenant Allow/Block List.
2. Outlook Blocked Senders (the Blocked Senders list in each mailbox that affects only that mailbox).
3. Blocked sender lists or blocked domain lists (anti-spam policies).
4. Exchange mail flow rules (also known as transport rules).
5. The IP Block List (connection filtering).

The rest of this article contains specifics about each method.

> [!TIP]
> Always submit messages in your blocked sender lists to Microsoft for analysis. For instructions, see [Report questionable email to Microsoft](submissions-admin.md#report-questionable-email-to-microsoft). If the messages or message sources are determined to be harmful, Microsoft can automatically block the messages, and you won't need to manually maintain the entry in blocked sender lists.
>
> Instead of blocking email, you also have several options to allow email from specific sources using _safe sender lists_. For more information, see [Create safe sender lists](create-safe-sender-lists-in-office-365.md).
>
> A standard SMTP email message can contain different sender email addresses as described in [Why internet email needs authentication](email-authentication-about.md#why-internet-email-needs-authentication). Frequently, the MAIL FROM address (also known as the `5321.MailFrom` address, P1 sender, or envelope sender) and From address (also known as the `5322.From` address or P2 sender) are the same. However, when email is sent on behalf of someone else, the addresses can be different. Blocked sender lists and blocked domain lists in anti-spam policies inspect the From address only. This behavior is similar to Outlook Blocked Senders that use the From address.

## Use block entries in the Tenant Allow/Block List

Our number one recommended option for blocking mail from specific senders or domains is the Tenant Allow/Block List. For instructions, see [Create block entries for domains and email addresses](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-domains-and-email-addresses) and [Create block entries for spoofed senders](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-spoofed-senders).

Email messages from these senders are marked as _high confidence spam_ (SCL = 9). What happens to the messages is determined by the [anti-spam policy](anti-spam-policies-configure.md) that detected the message for the recipient. In the [Standard and Strict preset security policies](preset-security-policies.md), high confidence spam messages are quarantined.

As an added benefit, users in the organization can't _send_ email to these blocked domains and addresses. The message is returned in the following non-delivery report (also known as an NDR or bounce message): `550 5.7.703 Your message can't be delivered because messages to XXX, YYY are blocked by your organization using Tenant Allow Block List.` The entire message is blocked for all internal and external recipients of the message, even if only one recipient email address or domain is defined in a block entry.

Only if you can't use the Tenant Allow/Block List for some reason should you consider using a different method to block senders.

## Use Outlook Blocked Senders

When only a few users received unwanted email, users or admins can add the sender email addresses to the Blocked Senders list in the mailbox. For instructions, see the following articles:

- **Users**: [Block or unblock senders in Outlook](https://support.microsoft.com/office/9bf812d4-6995-4d19-901a-76d6e26939b0).
- **Admins**: [Configure junk email settings on Exchange Online mailboxes in Microsoft 365](configure-junk-email-settings-on-exo-mailboxes.md).

When messages are successfully blocked due to a user's Blocked Senders list, the **X-Forefront-Antispam-Report** header field contains the value `SFV:BLK`.

> [!TIP]
> If the unwanted messages are newsletters from a reputable and recognizable source, unsubscribing from the email is another option to stop the user from receiving the messages.

## Use blocked sender lists or blocked domain lists

When multiple users are affected, the scope is wider, so the next best option is blocked sender lists or blocked domain lists in custom anti-spam policies or the default anti-spam policy. Messages from senders on the lists are marked as **High confidence spam**, and the action that you configured for the **High Confidence Spam** filter verdict is taken on the messages. For more information, see [Configure anti-spam policies](anti-spam-policies-configure.md).

The maximum limit for these lists is approximately 1,000 entries.

## Use mail flow rules

Mail flow rules can also look for keywords or other properties in the unwanted messages.

Regardless of the conditions or exceptions that you use to identify the messages, you configure the action to set the spam confidence level (SCL) of the message to 9, which marks the message as **High confidence spam**. For more information, see [Use mail flow rules to set the SCL in messages](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl).

> [!IMPORTANT]
> It's easy to create rules that are _overly_ aggressive, so it's important that you identify only the messages you want to block using very specific criteria. Also, be sure to [monitor the usage of the rule](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules#monitor-rule-usage) to ensure everything works as expected.

## Use the IP Block List

When it's not possible to use one of the other options to block a sender, _only then_ should you use the IP Block List in the connection filter policy. For more information, see [Configure the connection filter policy](connection-filter-policies-configure.md). It's important to keep the number of blocked IPs to a minimum, so we don't recommend blocking entire IP address ranges.

You should _especially_ avoid adding IP address ranges that belong to consumer services (for example, outlook.com) or shared infrastructures. You also need to review the list of blocked IP addresses as part of regular maintenance.
