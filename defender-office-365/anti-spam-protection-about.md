---
title: Anti-spam protection
f1.keywords: 
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: overview
ms.localizationpriority: medium
search.appverid: 
  - MET150
  - MOE150
ms.assetid: 6a601501-a6a8-4559-b2e7-56b59c96a586
ms.collection: 
  - m365-security
  - tier2
ms.custom: 
  - seo-marvel-apr2020
description: Admins can learn about the anti-spam settings and filters that help prevent spam in Microsoft 365.
ms.service: defender-office-365
ms.date: 07/03/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Anti-spam protection in cloud organizations

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

> [!NOTE]
> This article is intended for admins. For end-user articles, see [Overview of the Junk Email Filter](https://support.microsoft.com/office/5ae3ea8e-cf41-4fa0-b02a-3b96e21de089) and [Learn about junk email and phishing](https://support.microsoft.com/office/86c1d76f-4d5a-4967-9647-35665dc17c31).

In all organizations with cloud mailboxes, email messages are automatically protected against spam (junk email).

To help reduce junk email, Microsoft 365 includes junk email protection using proprietary spam filtering (also known as _content filtering_) technologies to identify and separate junk email from legitimate email. Spam filtering learns from known spam and phishing threats and user feedback from our consumer platform, Outlook.com. Ongoing feedback from [admins](submissions-admin.md) and [users](submissions-outlook-report-messages.md) helps ensure our filtering technologies are continually trained and improved.

Microsoft 365 uses the following spam filtering verdicts to classify messages:

- **Spam**: The message received a [spam-confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md) of 5 or 6.
- **High confidence spam**: The message received an SCL of 7, 8, or 9.
- **Phishing**
- **High confidence phishing**: As part of [secure by default](secure-by-default.md), high confidence phishing messages are always quarantined. Users can't release their own quarantined high confidence phishing messages, regardless of any available settings configured by admins.
- **Bulk**: The message source met or exceeded the configured [bulk complaint level (BCL)](anti-spam-bulk-complaint-level-bcl-about.md) threshold.

For more information about anti-spam protection, see the [Frequently asked questions: Anti-spam protection for cloud mailboxes](anti-spam-protection-faq.yml)

In the default anti-spam policy and in custom anti-spam policies, you can configure the actions to take based on these verdicts. In the Standard and Strict [preset security policies](preset-security-policies.md), the actions are already configured and unmodifiable as described in [Anti-spam policy settings](recommended-settings-for-eop-and-office365.md#anti-spam-policy-settings).

To configure the default anti-spam policy, and to create, modify, and remove custom anti-spam policies, see [Configure anti-spam policies](anti-spam-policies-configure.md).

> [!TIP]
>
> - If you disagree with the spam filtering verdict, you can report the message to Microsoft as a false positive (good mail marked as bad) or a false negative (bad email allowed). For more information, see:
>   - [How do I report a suspicious email or file to Microsoft?](submissions-report-messages-files-to-microsoft.md).
>   - [How to handle legitimate emails getting blocked (false positive), using Microsoft Defender for Office 365](step-by-step-guides/how-to-handle-false-positives-in-microsoft-defender-for-office-365.md)
>   - [How to handle malicious emails that are delivered to recipients (false negatives), using Microsoft Defender for Office 365](step-by-step-guides/how-to-handle-false-negatives-in-microsoft-defender-for-office-365.md)
>
>   The anti-spam message headers can tell you why a message was marked as spam, or why it skipped spam filtering. For more information, see [Anti-spam message headers](message-headers-eop-mdo.md).
>
> - You can't completely turn off spam filtering in Microsoft 365, but you can use Exchange mail flow rules (also known as transport rules) to bypass most spam filtering on incoming messages. For example, if you route email through a non-Microsoft protection service or device before delivery to Microsoft 365. For more information, see [Use mail flow rules to set the spam confidence level (SCL) in messages](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl).
>   - High confidence phishing messages are still filtered. Other filters in Microsoft 365 aren't affected (for example, messages are always scanned for malware).
>   - If you need to bypass spam filtering for SecOps mailboxes or phishing simulations, don't use mail flow rules. For more information, see [Configure the delivery of non-Microsoft phishing simulations to users and unfiltered messages to SecOps mailboxes](advanced-delivery-policy-configure.md).
>
> - In hybrid environments where Exchange Online Protection (EOP) provides cloud protection of on-premises Exchange mailboxes, you need to configure Exchange mail flow rules (also known as transport rules) in your on-premises Exchange organization to recognize the spam filtering verdicts from the cloud. For details, see [Deliver cloud-detected spam to the Junk Email folder in on-premises mailboxes](/exchange/standalone-eop/configure-eop-spam-protection-hybrid).
>
>   After you manually create the rule in Microsoft 365 to match the rule in on-premises Exchange, the rule replicates in hybrid environments.

## Anti-spam policies

Anti-spam policies control the configurable settings for spam filtering. The important settings in anti-spam policies are described in the following subsections.

> [!TIP]
> The anti-spam policy settings in the default policy and in the Standard and Strict preset security policies are described in [Anti-spam policy settings](recommended-settings-for-eop-and-office365.md#anti-spam-policy-settings).

### Recipient filters in anti-spam policies

Recipient filters use conditions and exceptions to identify the internal recipients that the policy applies to. At least one condition is required in custom policies. Conditions and exceptions aren't available in the default policy (the default policy applies to all recipients). You can use the following recipient filters for conditions and exceptions:

- **Users**: One or more mailboxes, mail users, or mail contacts in the organization.
- **Groups**:
  - Members of the specified distribution groups or mail-enabled security groups (dynamic distribution groups aren't supported).
  - The specified Microsoft 365 Groups.
- **Domains**: One or more of the configured [accepted domains](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains) in Microsoft 365. The recipient's primary email address is in the specified domain.

You can use a condition or exception only once, but the condition or exception can contain multiple values:

- Multiple **values** of the **same condition or exception** use OR logic (for example, _\<recipient1\>_ or _\<recipient2\>_):
  - **Conditions**: If the recipient matches **any** of the specified values, the policy is applied to them.
  - **Exceptions**: If the recipient matches **any** of the specified values, the policy isn't applied to them.

- Different **types of exceptions** use OR logic (for example, _\<recipient1\>_ or _\<member of group1\>_ or _\<member of domain1\>_). If the recipient matches **any** of the specified exception values, the policy isn't applied to them.

- Different **types of conditions** use AND logic. The recipient must match **all** of the specified conditions for the policy to apply to them. For example, you configure a condition with the following values:
  - Users: `romain@contoso.com`
  - Groups: Executives

  The policy is applied to `romain@contoso.com` _only_ if he's also a member of the Executives group. Otherwise, the policy isn't applied to him.

### Bulk complaint threshold (BCL) in anti-spam policies

Microsoft 365 assigns a bulk complaint level (BCL) value to inbound messages from bulk senders. Messages from bulk senders are also known as _bulk mail_ or _gray mail_.

For more information about BCL, see [Bulk complaint level (BCL)](anti-spam-bulk-complaint-level-bcl-about.md).

> [!TIP]
> By default, the PowerShell only setting _MarkAsSpamBulkMail_ is `On` in anti-spam policies in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell). This setting dramatically affects the results of a **Bulk compliant level (BCL) met or exceeded** filtering verdict:
>
> - **_MarkAsSpamBulkMail_ is On**: A BCL that's greater than or equal to the threshold value is converted to an SCL 6 that corresponds to a filtering verdict of **Spam**, and the action for the **Bulk compliant level (BCL) met or exceeded** filtering verdict is taken on the message.
> - **_MarkAsSpamBulkMail_ is Off**: The message is stamped with the BCL, but _no action_ is taken for a **Bulk compliant level (BCL) met or exceeded** filtering verdict. In effect, the BCL threshold and **Bulk compliant level (BCL) met or exceeded** filtering verdict action are irrelevant.

### Spam properties in anti-spam policies

The **Test mode** settings, the **Increase spam score** settings, and most of the **Mark as spam** settings are part of Advanced Spam Filtering (ASF) in anti-spam policies.

These settings aren't configured in the default anti-spam policy by default, or in the Standard or Strict [preset security policies](preset-security-policies.md).

For complete information about ASF settings, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

The other settings that are available in this category are:

- **Contains specific languages**: Messages in the specified languages are automatically identified as spam.
- **From these countries**: Messages from the specified countries are automatically identified as spam.

These settings aren't configured in the default anti-spam policy by default, or in the Standard or Strict [preset security policies](preset-security-policies.md).

### Actions in anti-spam policies

- In custom anti-spam policies and the default anti-spam policy, the available actions for spam filtering verdicts are described in the following table.
  - A check mark (✔) indicates the action is available (not all actions are available for all verdicts).
  - An asterisk (<sup>\*</sup>) after the check mark indicates the default action for the spam filtering verdict.

  |Action|Spam|High<br>confidence<br>spam|Phishing|High<br>confidence<br>phishing|Bulk|
  |---|:---:|:---:|:---:|:---:|:---:|
  |**Move message to Junk Email folder**: The message is delivered to the Junk Email folder in the mailbox.¹|✔<sup>\*</sup>|✔<sup>\*</sup>|✔|²|✔<sup>\*</sup>|
  |**Add X-header**: Adds an X-header to the message header and delivers the message to the mailbox. <br/><br/> You enter the X-header field name (not the value) in the available **Add this X-header text** box. <br/><br/> For **Spam** and **High confidence spam** verdicts, the message is moved to the Junk Email folder.¹ ³|✔|✔|✔||✔|
  |**Prepend subject line with text**: Adds text to the beginning of the message's subject line. The message is delivered to the mailbox and moved to the Junk email folder.¹ ³ <br/><br/> You enter the text in the available **Prefix subject line with this text** box.|✔|✔|✔||✔|
  |**Redirect message to email address**: Sends the message to other recipients instead of the intended recipients. <br/><br/> You specify the recipients in the **Redirect to this email address** box.|✔|✔|✔|✔|✔|
  |**Delete message**: Silently deletes the entire message, including all attachments.|✔|✔|✔||✔|
  |**Quarantine message**: Sends the message to quarantine instead of the intended recipients. <br/><br/> You select or use the default _quarantine policy_ for the spam filtering verdict in the **Select quarantine policy** box that appears.⁴ Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy). <br/><br/> You specify how long the messages are held in quarantine in the available **Retain spam in quarantine for this many days** box.|✔|✔|✔<sup>\*</sup>|✔<sup>\*</sup> ⁵|✔|
  |**No action**|||||✔|

  ¹ Microsoft 365 uses a mail flow delivery agent to route messages to the Junk Email folder. It doesn't use the junk email rule in the mailbox. The _Enabled_ parameter on the **Set-MailboxJunkEmailConfiguration** cmdlet in Exchange Online PowerShell has no effect on mail flow in cloud mailboxes. For more information, see [Configure junk email settings on cloud mailboxes](configure-junk-email-settings-on-exo-mailboxes.md).

  ² For **High confidence phishing**, the **Move message to Junk Email folder** action is effectively deprecated. Although you might be able to select the **Move message to Junk Email folder** action, high confidence phishing messages are always quarantined (equivalent to selecting **Quarantine message**).

  ³ You can use this value as a condition in [mail flow rules](/exchange/policy-and-compliance/mail-flow-rules/mail-flow-rules) to filter or route messages for mailboxes in on-premises Exchange environments only (not in Exchange Online).

  ⁴ If the spam filtering verdict quarantines messages by default (**Quarantine message** is already selected when you get to the page), the default quarantine policy name is shown in the **Select quarantine policy** box. If you _change_ the action of a spam filtering verdict to **Quarantine message**, the **Select quarantine policy** box is blank by default. A blank value means the default quarantine policy for that verdict is used. When you later view or edit the anti-spam policy settings, the quarantine policy name is shown. For more information about the quarantine policies that are used by default for spam filter verdicts, see [Anti-spam policy settings](recommended-settings-for-eop-and-office365.md#anti-spam-policy-settings).

  ⁵ Users can't release their own messages that were quarantined as high confidence phishing, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

- **Intra-Organizational messages to take action on**: Controls whether spam filtering and the corresponding verdict actions are applied to internal messages (messages sent between users within the organization). The specified action for the spam filter verdict is taken on messages sent between internal users. The available values are:
  - **Default**: The default value. This value is the same as selecting **High confidence phishing messages**.
  - **None**
  - **High confidence phishing messages**
  - **Phishing and high confidence phishing messages**
  - **All phishing and high confidence spam messages**
  - **All phishing and spam messages**

  For the default values that are used in the default anti-spam policy and in the Standard and Strict preset security policies, see the **Intra-Organizational messages to take action on** entry in [Anti-spam policy settings](recommended-settings-for-eop-and-office365.md#anti-spam-policy-settings).

- **Retain spam in quarantine for this many days**: Specifies how long to keep the message in quarantine if you selected **Quarantine message** as the action for a spam filtering verdict. After the time period expires, the message is deleted, and isn't recoverable. A valid value is from 1 to 30 days.

  For the default values that are used in the default anti-spam policy and in the Standard and Strict preset security policies, see the **Retain spam in quarantine for this many days** entry in [Anti-spam policy settings](recommended-settings-for-eop-and-office365.md#anti-spam-policy-settings).

  > [!TIP]
  > This setting also controls how long messages that were quarantined by **anti-phishing** policies are retained. For more information, see [Quarantine retention](quarantine-about.md#quarantine-retention).

#### Zero-hour auto purge (ZAP) in anti-spam policies

ZAP for phishing and ZAP for spam are able to act on messages _after_ they're delivered to Exchange Online mailboxes. By default, ZAP for phishing and ZAP for spam are turned on, and we recommend that you leave them on. For more information, see:

- [Zero-hour auto purge (ZAP) for phishing](zero-hour-auto-purge.md#zero-hour-auto-purge-zap-for-phishing)
- [Zero-hour auto purge (ZAP) for high confidence phishing](zero-hour-auto-purge.md#zero-hour-auto-purge-zap-for-high-confidence-phishing)
- [Zero-hour auto purge (ZAP) for spam](zero-hour-auto-purge.md#zero-hour-auto-purge-zap-for-spam)

#### Quarantine policies in anti-spam policies

For quarantine verdicts in anti-spam policies, quarantine policies define what users are able to do to those quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

### Allow and block lists in anti-spam policies

Anti-spam policies contain the following lists to allow or block specific senders or domains:

- The allowed senders list
- The allowed domains list
- The blocked senders list
- The blocked domains list

By default, these lists aren't configured in the default anti-spam policy. You can't configure the lists in the Standard or Strict [preset security policies](preset-security-policies.md).

The following features mostly replace these lists:

- Block entries for domains and email addresses in the [Create block entries for domains and email addresses](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-domains-and-email-addresses).

  > [!TIP]
  > To allow users to _send_ email to the blocked email addresses or domains, use the blocked senders or blocked domains lists in anti-spam policies. Block entries for domains and email addresses in the Tenant Allow/Block List also prevent users from _sending_ email to blocked email addresses or domains.

- Reporting good email to Microsoft [from the Submissions page in the Microsoft Defender portal](submissions-admin.md#report-good-email-to-microsoft) (where you can elect to **Allow emails with similar attributes**, which creates the required temporary entries in the Tenant Allow/Block List).

  > [!IMPORTANT]
  > Messages from entries in the allowed senders list or the allowed domains list bypass most email protection (except malware and high confidence phishing) and [email authentication](email-authentication-about.md) checks (SPF, DKIM, and DMARC). Entries in the allowed senders list or the allowed domains list create a high risk of attackers successfully delivering email to the Inbox that would otherwise be filtered. These lists are best used for temporary testing only.
  >
  > Never add common domains (for example, microsoft.com or office.com) to the allowed domains list. Attackers can easily send spoofed messages from these common domains into your organization.
  >
  > As of September 2022, allowed senders, domains, or subdomains in your organization's [accepted domains](/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains) must pass email authentication checks to skip spam filtering.
  >
  > If you're going to keep an allowed domain entry in the list for an extended period of time, tell the sender to verify that their SPF record is up to date with email sources for their domain, and that the policy in their DMARC record is set to `p=reject`.

### Priority of anti-spam policies

If preset security policies are [turned on](preset-security-policies.md#use-the-microsoft-defender-portal-to-assign-standard-and-strict-preset-security-policies-to-users), the Standard and Strict preset security policies are applied before any custom anti-spam policies or the default policy. If you create multiple custom anti-spam policies, you can specify the order of policy application. Policy processing stops for eligible recipients after the application of the first eligible policy (the highest priority policy for that recipient).

For more information about the order of precedence and how multiple policies are evaluated, see [Order and precedence of email protection](how-policies-and-protections-are-combined.md) and [Order of precedence for preset security policies and other policies](preset-security-policies.md#order-of-precedence-for-preset-security-policies-and-other-threat-policies).

## Default anti-spam policy

Every organization has a built-in anti-spam policy named Default that has the following properties:

- The policy is the default policy (the **IsDefault** property has the value `True`), and you can't delete the default policy.
- The policy is automatically applied to all recipients in the organization, and you can't turn it off.
- The policy is always applied last (the **Priority** value is **Lowest** and you can't change it).
