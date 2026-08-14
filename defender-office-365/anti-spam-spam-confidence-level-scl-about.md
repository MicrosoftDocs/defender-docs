---
title: Spam confidence level
author: chrisda
ms.author: chrisda
ms.topic: article
ms.localizationpriority: medium
ms.assetid: 34681000-0022-4b92-b38a-e32b3ed96bf6
ms.collection:
  - m365-security
  - tier2
ms.custom:
  - seo-marvel-apr2020
  - msecd-doc-authoring-1015
description: The spam confidence level (SCL) is a value that anti-spam filtering stamps on messages in Microsoft 365. Learn what SCL values mean in cloud organizations.
ms.service: defender-office-365
ms.date: 08/03/2026
ai-usage: ai-assisted
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As an admin, I want to understand the spam confidence level (SCL) so that I can interpret it correctly in cloud environments.
---

# Spam confidence level (SCL) in Microsoft 365

Historically, the spam confidence level (SCL) helped indicate whether spam filtering considered a message good or bad, or whether filtering was skipped on the message. Spam filtering stamps the SCL value (-1, or 0 to 9) on messages in the `X-Forefront-Antispam-Report` header. An SCL value of 5 or higher generally indicates the message is considered bad.

As the filtering stack evolved, particularly with the expansion into message categorization, the SCL value no longer holds the same meaning in cloud organizations. The value _doesn't_ determine whether spam filtering identifies a message as **Spam** or **High confidence spam**, and it _doesn't_ determine the action taken on the message. Spam filtering makes those decisions using categorization and other signals, so the same SCL value can appear on messages with different verdicts.

To understand how a message was handled, use other values in the message header. For example, `CAT` (category) identifies what filtered the message, and `DIR` (directionality) indicates whether the message was internal. For more information, see [Anti-spam message headers](message-headers-eop-mdo.md). For the actions that anti-spam policies take for each verdict, see [Actions in anti-spam policies](anti-spam-protection-about.md#actions-in-anti-spam-policies).

In the cloud, the primary use of SCL is mail flow rules (also known as transport rules) to [request a bypass from most spam filtering](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl) (SCL -1), treat messages as spam (SCL 5 or 6), or treat messages as high confidence spam (SCL 9) based on specific criteria. But even when a rule requests a bypass, the actual SCL value stamped on the message might not be -1 (for example, 0 or 1 to indicate it was evaluated and found not to be spam).

The main purpose of the SCL value is to support _on-premises_ Exchange servers, including hybrid environments where cloud-filtered messages are delivered to on-premises mailboxes. In on-premises Exchange, the SCL value is meaningful for the following anti-spam features:

- Delete, reject, and quarantine thresholds in the Content Filter agent on individual servers.
- The Junk Email threshold for the organization.
- The Junk Email threshold on individual mailboxes.
- SCL -1 handling in the Content Filter agent (the message is ignored).

For more information, see [Exchange spam confidence level (SCL) thresholds](/exchange/antispam-and-antimalware/antispam-protection/scl).

For troubleshooting information about spam filtering overrides, see [Spam verdict override behavior](anti-spam-policies-troubleshooting.md#spam-verdict-override-behavior). To identify which component filtered a specific message, see [Determine which component filtered the message](anti-spam-policies-troubleshooting.md#determine-which-component-filtered-the-message).

The bulk complaint level (BCL) identifies bad bulk email (also known as _gray mail_). A higher BCL value indicates the message is more likely to exhibit undesirable spam-like behavior. You configure the BCL threshold in anti-spam policies. For more information, see the following articles:

- [Configure anti-spam policies](anti-spam-policies-configure.md)
- [Bulk complaint level (BCL)](anti-spam-bulk-complaint-level-bcl-about.md)
- [What's the difference between junk email and bulk email?](anti-spam-spam-vs-bulk-about.md)

****

:::image type="content" source="media/eac8a413-9498-4220-8544-1e37d1aaea13.png" alt-text="The short icon for LinkedIn Learning."::: **New to Microsoft 365?** Discover free video courses for **Microsoft 365 admins and IT pros**, brought to you by LinkedIn Learning.
