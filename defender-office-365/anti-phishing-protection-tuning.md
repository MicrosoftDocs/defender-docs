---
title: Tune anti-phishing protection
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
search.appverid: 
ms.collection: 
  - m365-security
  - tier2
  - MET150
description: Admins can learn to identify the reasons why and how a phishing message what delivered in Microsoft 365, and what to do to prevent more phishing messages in the future.
ms.service: defender-office-365
ms.date: 07/02/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Tune anti-phishing protection

Although Microsoft 365 includes many anti-phishing features, some phishing messages can still be delivered to mailboxes in your organization. This article describes how to discover why a phishing message was delivered, and how to adjust anti-phishing settings _without accidentally making things worse_.

## First things first: deal with any compromised accounts and make sure you block any more phishing messages from getting through

If a recipient's account was compromised as a result of the phishing message, follow the steps in [Responding to a compromised cloud email account](responding-to-a-compromised-email-account.md).

If you have Microsoft Defender for Office 365 (included or in an add-on subscription), you can use [Office 365 Threat Intelligence](office-365-ti.md) to identify other users who also received the phishing message. Defender for Office 365 includes more ways to block phishing messages:

- [Safe Links in Microsoft Defender for Office 365](safe-links-policies-configure.md)
- [Safe Attachments in Microsoft Defender for Office 365](safe-attachments-policies-configure.md)
- [Configure anti-phishing policies in Microsoft Defender for Office 365](anti-phishing-policies-mdo-configure.md). You can temporarily increase the **Phishing email threshold** in the policy from **Standard** to **Aggressive**, **More aggressive**, or **Most aggressive**.

Verify these policies are working. Safe Links and Safe Attachments protection is turned on by default via Built-in protection in [preset security policies](preset-security-policies.md). Anti-phishing has a default policy that applies to all recipients where anti-spoofing protection is turned on by default. Impersonation protection isn't turned on in the policy, and therefore needs to be configured. For instructions, see [Configure anti-phishing policies in Microsoft Defender for Office 365](anti-phishing-policies-mdo-configure.md).

## Report the phishing message to Microsoft

Reporting phishing messages is helpful in tuning the filters that are used to protect all customers in Microsoft 365. For instructions, see [Use the Submissions page to submit suspected spam, phish, URLs, legitimate email getting blocked, and email attachments to Microsoft](submissions-admin.md).

## Inspect the message headers

You can examine the headers of the phishing message to see if there's anything that you can do yourself to prevent more phishing messages from coming through. In other words, examining the messages headers can help you identify any settings in your organization that were responsible for allowing the phishing messages in.

Specifically, you should check the **X-Forefront-Antispam-Report** header field in the message headers for indications of skipped filtering for spam or phishing in the Spam Filtering Verdict (SFV) value. Messages that skip filtering have an entry of `SCL:-1`, which means one of your settings overrode the phishing verdict and allowed delivery of the message. For more information on how to get message headers and the complete list of all available anti-spam and anti-phishing message headers, see [Anti-spam message headers](message-headers-eop-mdo.md).

> [!TIP]
> You can copy and paste the contents of a message header into the [Message Header Analyzer](https://mha.azurewebsites.net/) tool. This tool helps parse headers and presents them in a human readable format.

You can also use the [configuration analyzer](configuration-analyzer-for-security-policies.md) to compare your threat policies to the Standard and Strict recommendations.

## Best practices to stay protected

- On a monthly basis, run [Secure Score](/defender-xdr/microsoft-secure-score) to assess your organization's security settings.

- Use [Threat Explorer and real-time detections](threat-explorer-real-time-detections-about.md) to search for good messages quarantined by mistake (false positives) or delivered bad messages (false negatives). You can search by sender, recipient, or message ID. For a quarantined message, use the **Detection technology** value to find an appropriate method to override. For an allowed message, view which policy allowed the message.

- Email from spoofed senders (the From address doesn't match the source of the message) is classified as _phishing_ in Defender for Office 365. Some spoofing is benign, and some users might want blocked messages from specific spoofed senders.

  Periodically review the following features to identify benign or desired messages identified as spoofing:

  - [Spoof intelligence insight](anti-spoofing-spoof-intelligence.md)
  - [Entries for spoofed senders in the Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#use-the-microsoft-defender-portal-to-view-entries-for-spoofed-senders-in-the-tenant-allowblock-list)
  - [Spoof detections report](reports-email-security.md#spoof-detections-report)

  After you configure any necessary overrides, you can confidently [configure spoof intelligence in anti-phishing policies](anti-phishing-policies-about.md#spoof-settings) to **Quarantine** suspicious messages instead of delivering them to the user's Junk Email folder.

- In Defender for Office 365, you can also use the **Impersonation insight** page at <https://security.microsoft.com/impersonationinsight> to track user impersonation or domain impersonation detections. For more information, see [Impersonation insight in Defender for Office 365](anti-phishing-mdo-impersonation-insight.md).

- Periodically review the [Threat Protection Status report](reports-defender-for-office-365.md#threat-protection-status-report) for phishing detections.

- Don't include your Microsoft 365 domains in the allowed senders list or the allowed domains list in anti-spam policies. Although this configuration prevents blocking some legitimate messages, it also results in the delivery of malicious messages normally blocked by the spam and/or phishing filters. Instead of allowing the domain, correct the underlying email delivery problem.

  If Microsoft 365 blocks legitimate messages from senders in your Microsoft 365 domain, completely configure the SPF, DKIM, and DMARC records in DNS for _all_ of your Microsoft 365 domains:

  - Verify your SPF record identifies _all_ sources of email for your domain (don't forget non-Microsoft services!).

  - To ensure destination email systems can reject messages from unauthorized sources for your domain, use hard fail (`-all`) in the SPF record. You can use the [spoof intelligence insight](anti-spoofing-spoof-intelligence.md) to help identify senders using your domain so you can include all authorized non-Microsoft senders in your SPF record.

  For configuration instructions, see:

  - [Set up SPF to identify valid email sources for your custom cloud domains](email-authentication-spf-configure.md)
  - [Set up DKIM to sign mail from your cloud domain](email-authentication-dkim-configure.md)
  - [Set up DMARC to validate the From address domain for cloud senders](email-authentication-dmarc-configure.md)

- We recommend that mail for your Microsoft 365 domain is delivered directly to Microsoft 365 (point the MX record of your Microsoft 365 domain to Microsoft 365). If you must use a non-Microsoft service in front of Microsoft 365, use Enhanced Filtering for Connectors. For instructions, see [Enhanced Filtering for Connectors in Exchange Online](/Exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors).

- Have users use the [built-in Report button in Outlook](submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook). Configure the [user reported settings](submissions-user-reported-messages-custom-mailbox.md) to send user reported messages to a reporting mailbox, to Microsoft, or both. User reported messages are then available to admins on the **User reported** tab on the **Submissions** page at <https://security.microsoft.com/reportsubmission?viewid=user>. Admin can report user reported messages or any messages to Microsoft as described in [Use the Submissions page to submit suspected spam, phish, URLs, legitimate email getting blocked, and email attachments to Microsoft](submissions-admin.md). User or admin reporting of false positives or false negatives to Microsoft is important, because it helps train our detection systems.

- Multifactor authentication (MFA) is a good way to prevent compromised accounts. You should strongly consider enabling MFA for all of your users. For a phased approach, start by enabling MFA for your most sensitive users (admins, executives, etc.) before you enable MFA for everyone. For instructions, see [Set up multifactor authentication](/microsoft-365/admin/security-and-compliance/set-up-multi-factor-authentication).

- Forwarding rules to external recipients are often used by attackers to extract data. Use the **Review mailbox forwarding rules** information in [Microsoft Secure Score](/defender-xdr/microsoft-secure-score) to find and even prevent forwarding rules to external recipients. For more information, see [Mitigating Client External Forwarding Rules with Secure Score](/archive/blogs/office365security/mitigating-client-external-forwarding-rules-with-secure-score).

  Use the [Autoforwarded messages report](/exchange/monitoring/mail-flow-reports/mfr-auto-forwarded-messages-report) to view specific details about forwarded email.
