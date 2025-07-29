---
title: Zero-hour auto purge in Microsoft Defender for Office 365
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: article
ms.localizationpriority: medium
search.appverid:
  - MOE150
  - MED150
  - MBS150
  - MET150
ms.assetid: 96deb75f-64e8-4c10-b570-84c99c674e15
ms.collection:
  - m365-security
  - tier2
ms.custom:
  - seo-marvel-apr2020
description: Zero-hour auto purge (ZAP) in all organizations with cloud mailboxes handles messages in mailboxes retroactively identified as spam, phishing, or malware.
ms.service: defender-office-365
ms.date: 07/03/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
---

# Zero-hour auto purge (ZAP) in Microsoft Defender for Office 365

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In all organizations with cloud mailboxes, zero-hour auto purge (ZAP) retroactively detects and neutralizes malicious phishing, spam, or malware messages that were delivered to cloud mailboxes. ZAP doesn't work in on-premises mailboxes protected by Microsoft 365.

> [!NOTE]
> ZAP is also able to retroactively detect existing malicious chat messages in Microsoft Teams.

Spam and malware signatures in the service are updated in real-time on a daily basis. However, users can still receive malicious messages. For example:

- Zero-day malware that was undetectable during mail flow.
- Content weaponized after delivery to users.

ZAP addresses these issues by continually monitoring spam and malware signature updates in the service, and is seamless for users. ZAP finds and takes automated action on messages that are already in a user's mailbox. ZAP's search is limited to the last 48 hours of delivered email. Users aren't notified if ZAP detects and moves a message.

Watch this short video to learn how ZAP in Microsoft Defender for Office 365 automatically detects and neutralizes threats in email.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=20bb600a-363a-44ca-be1a-714fb9a82566]

## Zero-hour auto purge (ZAP) for email messages

### Zero-hour auto purge (ZAP) for malware

For _read or unread messages_ found to contain malware after delivery, ZAP quarantines the message that contains the malware attachment. By default, only admins can view and manage quarantined malware messages. But, admins can create and use _quarantine policies_ to define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

> [!NOTE]
> Users can't release their own messages quarantined as malware, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

ZAP for malware is enabled by default in anti-malware policies. For more information, see [Configure anti-malware policies](anti-malware-policies-configure.md).

### Zero-hour auto purge (ZAP) for phishing

For _read or unread messages_ identified as _phishing_ after delivery (not _high confidence phishing_), the ZAP outcome depends on the action configured for a **Phishing** verdict in the applicable anti-spam policy. The available actions and the possible ZAP outcomes are described in the following list:

- **Add X-Header**, **Prepend subject line with text**, **Redirect message to email address**, **Delete message**: ZAP takes no action on the message.
- **Move message to Junk Email**: ZAP moves the message to the Junk Email folder.

  This action is the default for a **Phishing** verdict in the default anti-spam policy and custom anti-spam policies that you create in PowerShell.

- **Quarantine message**: ZAP quarantines the message.

  This action is the default for a **Phishing** verdict in the [Standard and Strict preset security policies](preset-security-policies.md#profiles-in-preset-security-policies), and in custom anti-spam policies that you create in the Defender portal.

By default, ZAP for phishing is enabled in anti-spam policies.

For more information about configuring spam filtering verdicts, see [Configure anti-spam policies](anti-spam-policies-configure.md).

### Zero-hour auto purge (ZAP) for high confidence phishing

For _read or unread messages_ that are identified as _high confidence phishing_ after delivery, ZAP quarantines the message. By default, only admins can view and manage quarantined high confidence phishing messages. But, admins can create and use _quarantine policies_ to define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

> [!NOTE]
> Users can't release their own messages quarantined as high confidence phishing, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

ZAP for high confidence phishing is enabled by default. For more information, see [Secure by Default in Office 365](secure-by-default.md).

### Zero-hour auto purge (ZAP) for spam

For _unread messages_ identified as _spam_ or _high confidence spam_ after delivery, the ZAP outcome depends on the action configured for a **Spam** or **High confidence spam** verdict in the applicable anti-spam policy. The available actions and the possible ZAP outcomes are described in the following list:

- **Add X-Header**, **Prepend subject line with text**, **Redirect message to email address**, **Delete message**: ZAP takes no action on the message.
- **Move message to Junk Email**: ZAP moves the message to the Junk Email folder.

  For the **Spam** verdict, this action is the default in the default anti-spam policy, new custom anti-spam policies, and the [Standard preset security policy](preset-security-policies.md#profiles-in-preset-security-policies).

  For the **High confidence spam** verdict, this action is the default in the default anti-spam policy and new custom anti-spam policies.

- **Quarantine message**: ZAP quarantines the message.

  For the **Spam** verdict, this action is the default in the [Strict preset security policy](preset-security-policies.md#profiles-in-preset-security-policies).

  For the **High confidence spam** verdict, this action is the default in the [Standard and Strict preset security policies](preset-security-policies.md#profiles-in-preset-security-policies).

By default, users can view and manage messages that were quarantined as spam or high confidence spam where they're a recipient. But, admins can create and use _quarantine policies_ to define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

By default, ZAP for spam is enabled in anti-spam policies.

For more information about configuring spam filtering verdicts, see [Configure anti-spam policies](anti-spam-policies-configure.md).

### How to see if ZAP moved your message

To determine if ZAP moved your message, you have the following options:

- **Number of messages**: Use the [Mailflow view in the Mailflow status report](reports-email-security.md#mailflow-view-for-the-mailflow-status-report) to see the number of ZAP-affected messages for the specified date range.
- **Message details**: Use [Threat Explorer](threat-explorer-real-time-detections-about.md) to filter events on the **All email** tab by the value **ZAP** for the **Additional action** column.

> [!NOTE]
> ZAP isn't logged in the Exchange mailbox audit logs as a system action.

### Zero-hour auto purge (ZAP) considerations for Safe Attachments in Microsoft Defender for Office 365

ZAP doesn't quarantine messages that are in the process of [Dynamic Delivery](safe-attachments-about.md#dynamic-delivery-in-safe-attachments-policies) in Safe Attachments policy scanning. ZAP reverts to the **Move to Junk** action if both of the following statements are true:

- A phishing or spam signal is received during the process of Dynamic Delivery.
- The verdict in the anti-spam policy takes some action on the message (Move to Junk, Redirect, Delete, or Quarantine).

## Zero-hour auto purge (ZAP) in Microsoft Teams

> [!TIP]
> ZAP for Microsoft Teams is available only to customers with Microsoft 365 E5 or Microsoft Defender for Office 365 Plan 2 subscriptions. To configure ZAP for Teams protection, see [Microsoft Defender for Office 365 Plan 2 support for Microsoft Teams](mdo-support-teams-about.md).

### ZAP in Teams chats

ZAP is available for internal messages in Teams chats that are identified as malware or high confidence phishing. Currently, external messages aren't supported.

Teams is different than email, because everyone in a Teams chat receives the same copy of the message at the same time (there's no message bifurcation). When ZAP for Teams protection blocks a message, the message is blocked for everyone in the chat. The initial block happens right after delivery, but ZAP occurs up to 48 hours after delivery.

Exclusions for ZAP for Teams protection in Teams chats matter for message _recipients_, not message _senders_. To configure exceptions for Teams chats, see [Configure ZAP for Teams protection in Defender for Office 365 Plan 2](mdo-support-teams-about.md#configure-zap-for-teams-protection-in-defender-for-office-365-plan-2).

ZAP for Teams protection is able to take action on messages for _all_ recipients in a chat if _any_ recipients in the chat aren't excluded from ZAP for Teams protection. Only when _all_ recipients in a chat are excluded from ZAP for Teams protection does ZAP take no action on a message. These scenarios are illustrated in the following table:

|Scenario|Result|
|---|---|
|Group chat with Recipients A, B, C, and D. <br/><br/> Recipients A, B, C, and D are excluded from ZAP for Teams protection.|ZAP doesn't block messages sent to the group chat.|
|Group chat with Recipients A, B, C, and D. <br/><br/> Only recipients A, B, and C are excluded from ZAP for Teams protection.|ZAP is able to block messages sent to the group chat for all recipients.|
|Group chat with Recipients A, B, C, and D. <br/><br/> Recipients A, B, C, and D aren't excluded from ZAP for Teams protection. <br/><br/> Sender X is excluded from ZAP for Teams protection and sends a message to the group chat.|ZAP is able to block messages sent to the group chat for all recipients.|

**Sender view**:

:::image type="content" source="media/zero-hour-auto-purge-sender.png" alt-text="Image showing how ZAP for Teams protection works for the sender." lightbox="media/zero-hour-auto-purge-sender.png":::

**Recipient view**:

:::image type="content" source="media/zero-hour-auto-purge-recipient.png" alt-text="Image showing how ZAP for Teams protection works for the recipient." lightbox="media/zero-hour-auto-purge-recipient.png":::

### ZAP in Teams channels

ZAP for Teams protection supports the following types of Teams channels:

- **Standard channels**: ZAP is available for internal messages. Currently, external messages aren't supported.
- **Shared channels**: ZAP is available for internal and external messages.

Currently, ZAP isn't available in private channels.

To configure exceptions for ZAP protection for Teams channels, you need the recipient email address. This address is different than the channel email address in the Teams client.

To get the recipient email address to use for exceptions for Teams channel protection, use the **Name and email** value from the **Channel details** section of the Teams message entity panel. For more information, see [The Teams message entity panel in Microsoft Defender for Office 365](teams-message-entity-panel.md).

:::image type="content" source="media/teams-message-entity-panel-channel-address.png" alt-text="The correct Teams channel email address from the Teams message entity panel." lightbox="media/teams-message-entity-panel-channel-address.png":::

To configure exceptions for Teams channels, see [Configure ZAP for Teams protection in Defender for Office 365 Plan 2](mdo-support-teams-about.md#configure-zap-for-teams-protection-in-defender-for-office-365-plan-2).

### Zero-hour auto purge (ZAP) for high confidence phishing messages in Teams

For messages that are identified as high confidence phishing after delivery, ZAP for Teams protection blocks and quarantines the message. To set the quarantine policy that's used for high confidence phishing detections in ZAP for Teams, see [Microsoft Defender for Office 365 Plan 2 support for Microsoft Teams](mdo-support-teams-about.md).

### Zero-hour auto purge (ZAP) for malware in Teams messages

For messages that are identified as malware, ZAP for Teams protection blocks and quarantines the message. To set the quarantine policy that's used for malware detections in ZAP for Teams, see [Microsoft Defender for Office 365 Plan 2 support for Microsoft Teams](mdo-support-teams-about.md).

### How to see if ZAP blocked a Teams message

Currently, only admins can view and manage messages quarantined by ZAP for Teams protection. For more information, see [Use the Microsoft Defender portal to manage Microsoft Teams quarantined messages](quarantine-admin-manage-messages-files.md#use-the-microsoft-defender-portal-to-manage-microsoft-teams-quarantined-messages).

## Zero-hour auto purge (ZAP) FAQ

### What happens if ZAP moves legitimate messages to the Junk Email folder?

Follow the normal process for [reporting false positives to Microsoft](submissions-report-messages-files-to-microsoft.md). ZAP moves the message from the Inbox folder to the Junk Email folder only if the service determines that the message is spam or malicious.

### What if I use the Quarantine folder instead of the Junk Mail folder?

ZAP takes action on a message based on the configuration of anti-spam policies as described earlier in this article.

### How is ZAP affected by the exceptions to default email protections for cloud mailboxes and Defender for Office 365?

The following features might override ZAP actions:

- [Allowlists](create-safe-sender-lists-in-office-365.md)
- Exchange mail flow rules (transport rules)

For malware and high confidence phishing verdicts, there are few scenarios where ZAP doesn't act on messages:

- [Non-Microsoft phishing simulation URLs specified in the Advanced delivery policy](advanced-delivery-policy-configure.md#use-the-microsoft-defender-portal-to-configure-non-microsoft-phishing-simulations-in-the-advanced-delivery-policy) (high confidence phishing).
- [SecOps mailboxes specified in the Advanced delivery policy](advanced-delivery-policy-configure.md#use-the-microsoft-defender-portal-to-configure-secops-mailboxes-in-the-advanced-delivery-policy) (malware and high confidence phishing).
- The MX record for your Microsoft 365 domain points to another service or device, and you use a mail flow rule to [bypass spam filtering](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl) (high confidence phishing).
- [Admin submissions of false positives to Microsoft](submissions-admin.md#report-good-email-to-microsoft). By default, allow entries for domains and email addresses, files, and URLs exist for 30 days (malware and high confidence phishing).

It's important for you to carefully consider the implications of bypassing filtering, as it could compromise the security posture of your organization.

### What are the licensing requirements for ZAP?

There are no special licensing requirements for ZAP for malware, spam, and phishing. ZAP works on all mailboxes hosted in Exchange Online. ZAP doesn't work in on-premises mailboxes that are protected by Microsoft 365.

ZAP for Teams protection requires Microsoft 365 E5 or Microsoft Defender for Office 365 Plan 2 licenses.

### Does ZAP work on messages in other folders in the mailbox (for example, messages moved by Inbox rules)?

ZAP can act on messages in other folders in the following scenarios:

- The message wasn't deleted.
- The same or stronger action wasn't already applied. For example, the message is in the Junk Email folder, and the action is quarantine. ZAP quarantines the message.

### How does ZAP affect mailboxes on hold?

ZAP quarantines messages from mailboxes on hold. ZAP can move messages to the Junk Email folder based on the action for a spam or phishing verdict in anti-spam policies.

For more information about holds in Exchange Online, see [In-Place Hold and Litigation Hold in Exchange Online](/Exchange/security-and-compliance/in-place-and-litigation-holds).
