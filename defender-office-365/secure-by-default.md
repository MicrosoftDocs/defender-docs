---
title: Secure by default in Office 365
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
ms.date: 07/09/2025
audience: ITPro
ms.topic: concept-article
ms.localizationpriority: medium
search.appverid:
  - MET150
  - MOE150
ms.collection:
  - m365-security
  - tier2
  - essentials-security
description: Learn more about the secure by default configuration in all organizations with cloud mailboxes.
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Secure by default in cloud organizations

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

"Secure by default" is a term used to define the default settings that are most secure as possible.

However, security needs to be balanced with productivity. This balance includes:

- **Usability**: Settings shouldn't get in the way of user productivity.
- **Risk**: Security might block important activities.
- **Legacy settings**: Some configurations for older products and features might need to be maintained for business reasons, even if new, modern settings are improved.

All organizations with cloud mailboxes automatically receive email protection. This protection includes:

- Email with suspected malware is automatically quarantined. The quarantine policy used by the anti-malware policy controls whether recipients are notified. For more information, see [Configure anti-malware policies](anti-malware-policies-configure.md).
- Email identified as high confidence phishing is handled according to the anti-spam policy action. See [Configure anti-spam policies](anti-spam-policies-configure.md).

For more information, see [Default email protections for cloud mailboxes](eop-about.md).

Because Microsoft wants to keep our customers secure by default, some organization overrides aren't applied for malware or high confidence phishing. These overrides include:

- Allowed sender lists or allowed domain lists in anti-spam policies.
- Outlook Safe Senders.
- The IP Allow List in the default connection filter policy.
- Exchange mail flow rules (also known as transport rules).

Use [admin submissions](submissions-admin.md#report-good-email-to-microsoft) to temporarily allow specific messages blocked by Microsoft 365.

More information on these overrides can be found in [Create sender allowlists](create-safe-sender-lists-in-office-365.md).

> [!NOTE]
> Anti-spam policies that use the **Move message to Junk Email folder** action for high confidence phishing messages are converted to the **Quarantine message** action. The **Redirect message to email address** action for high confidence phishing messages is unaffected.

Secure by default isn't a setting that you can turn on or off. It's how our filtering keeps potentially dangerous or unwanted messages out of your mailboxes. Malware and high confidence phishing messages should be quarantined. By default, only admins can manage messages quarantined as malware or high confidence phishing, and they can also report false positives to Microsoft from quarantine. For more information, see [Manage quarantined messages and files as an admin](quarantine-admin-manage-messages-files.md).

## More information

Secure by default means we take the same action on messages you would take if you knew the message was malicious, even if you configured exceptions that would otherwise allow delivery of the message. We always used this approach on malware, and now we're extending this approach to high confidence phishing messages.

Our data indicates a user is 30 times more likely to click a malicious link in messages in the Junk Email folder versus Quarantine. Our data also indicates the false positive rate (good messages marked as bad) for high confidence phishing messages is low. Admins can resolve any false positives with admin submissions.

We also determined the allowed sender and allowed domain lists in anti-spam policies and Safe Senders in Outlook were too broad and were causing more harm than good.

To put it another way: as a security service, we're acting on your behalf to prevent users from being compromised.

## Exceptions

You should only consider using overrides in the following scenarios:

- Phishing simulations: Simulated attacks can help you identify vulnerable users before a real attack impacts your organization. To prevent phishing simulation messages from being filtered, see [Configure non-Microsoft phishing simulations in the advanced delivery policy](advanced-delivery-policy-configure.md#use-the-microsoft-defender-portal-to-configure-non-microsoft-phishing-simulations-in-the-advanced-delivery-policy).
- Security/SecOps mailboxes: Dedicated mailboxes used by security teams to get unfiltered messages (both good and bad). Teams can then review to see if they contain malicious content. For more information, see [Configure SecOps mailboxes in the advanced delivery policy](advanced-delivery-policy-configure.md#use-the-microsoft-defender-portal-to-configure-secops-mailboxes-in-the-advanced-delivery-policy).
- Non-Microsoft filters: Secure by default applies only when the MX record for your domain points to Microsoft 365 (for example, contoso.mail.protection.outlook.com). If the MX record for your domain points to a non-Microsoft service or device, the following scenarios can result in the delivery of messages detected as high confidence phishing by anti-spam policies:
  - [Exchange mail flow rules to bypass spam filtering](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl).
  - Senders identified in the [Safe Senders list](configure-junk-email-settings-on-exo-mailboxes.md) in user mailboxes.
  - [Allow entries in the Tenant Allow/Block List](tenant-allow-block-list-about.md#allow-entries-in-the-tenant-allowblock-list).
  - Senders identified in the [allowed senders list and allowed domains list in anti-spam policies](anti-spam-protection-about.md#allow-and-block-lists-in-anti-spam-policies).
- False positives: To temporarily allow certain messages that Microsoft 365 blocked, use [admin submissions](submissions-admin.md#report-good-email-to-microsoft). By default, allow entries for domains and email addresses, files, and URLs exist for 30 days. During those 30 days, Microsoft learns from the allow entries and removes them or automatically extends them. By default, allow entries for spoofed senders never expire.
