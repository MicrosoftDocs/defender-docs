---
title: Quarantined email messages
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: overview
ms.localizationpriority: medium
search.appverid:
  - MOE150
  - MED150
  - MET150
ms.assetid: 4c234874-015e-4768-8495-98fcccfc639b
ms.collection:
  - m365-security
  - tier1
ms.custom:
  - seo-marvel-apr2020
description: Admins can learn about email quarantine in Microsoft 365 that holds potentially dangerous or unwanted messages.
ms.service: defender-office-365
ms.date: 07/08/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Quarantined email messages in cloud organizations

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In all organizations with cloud mailboxes, quarantine is available to hold potentially dangerous or unwanted messages.

> [!NOTE]
> In Microsoft 365 operated by 21Vianet in China, quarantine isn't currently available in the Microsoft Defender portal. Quarantine is available only in the classic Exchange admin center (classic EAC).

Whether a detected message is quarantined by default depends on the following factors:

- The protection feature that detected the message. For example, the following detections are always quarantined:
  - Malware detections by [anti-malware policies](anti-malware-policies-configure.md)<sup>\*</sup>.
  - Malware or phishing detections by [Safe Attachments policies](safe-attachments-policies-configure.md), including [Built-in protection](preset-security-policies.md) for Safe Attachments<sup>\*</sup>.
  - High confidence phishing detections by [anti-spam policies](anti-spam-policies-configure.md).
- Whether you're using the Standard and/or Strict [preset security policies](preset-security-policies.md). The Strict profile quarantines more types of detections than the Standard profile.

<sup>\*</sup> Malware filtering is skipped on SecOps mailboxes that are identified in the advanced delivery policy. For more information, see [Configure the advanced delivery policy for non-Microsoft phishing simulations and email delivery to SecOps mailboxes](advanced-delivery-policy-configure.md).

The default actions for email protection features in Microsoft 365, including preset security policies, are described in the feature tables in [Recommended email and collaboration threat policy settings for cloud organizations](recommended-settings-for-eop-and-office365.md).

For anti-spam and anti-phishing protection, admins can also modify the default threat policy or create custom threat policies to quarantine messages instead of delivering them to the Junk Email folder. For instructions, see the following articles:

- [Configure anti-spam policies](anti-spam-policies-configure.md)
- [Configure anti-phishing policies if you don't have Microsoft Defender for Office 365](anti-phishing-policies-eop-configure.md)
- [Configure anti-phishing policies in Microsoft Defender for Office 365](anti-phishing-policies-mdo-configure.md)

Threat policies for [supported features](quarantine-policies.md#step-2-assign-a-quarantine-policy-to-supported-features) have one or more _quarantine policies_ assigned to them (each action within the threat policy has an associated quarantine policy assignment).

> [!TIP]
> All actions taken by admins or users on quarantined messages are audited. For more information about audited quarantine events, see [Quarantine schema in the Office 365 Management API](/office/office-365-management-api/office-365-management-activity-api-schema#quarantine-schema).

## Quarantine policies

_Quarantine policies_ define what users are able to do or not do to quarantined messages, and whether users receive quarantine notifications for those messages. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

> [!TIP]
> You can create customized [quarantine notifications for different languages](quarantine-policies.md#customize-quarantine-notifications-for-different-languages). You can also [use a custom logo in quarantine notifications](quarantine-policies.md#customize-all-quarantine-notifications).

The default quarantine policies assigned to protection feature verdicts enforce the historical capabilities that users get for their quarantined messages (messages where they're a recipient). For more information, see the table in [Find and release quarantined messages as a user](quarantine-end-user.md). For example, only admins can work with messages that were quarantined as malware or high confidence phishing. By default, users can work with their messages that were quarantined as spam, bulk, phishing, spoof, user impersonation, domain impersonation, or mailbox intelligence.

Admins can create and apply custom quarantine policies that define less restrictive or more restrictive capabilities for users, and also turn on quarantine notifications. For more information, see [Create quarantine policies](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

Both users and admins can work with quarantined messages:

- Admins can work with all types of quarantined messages for all users, including messages that were quarantined as malware, high confidence phishing, or as a result of mail flow rules (also known as transport rules). For more information, see [Manage quarantined messages and files as an admin](quarantine-admin-manage-messages-files.md).

  > [!TIP]
  > For the permissions required to download and release any messages from quarantine, see the permissions entry [here](quarantine-admin-manage-messages-files.md#what-do-you-need-to-know-before-you-begin).

- Users can work with their quarantined messages based on the protection feature that quarantined the message, and the setting in corresponding quarantine policy. For more information, see [Find and release quarantined messages as a user](quarantine-end-user.md).

  > [!NOTE]
  > Users can't release their own quarantined messages in the following scenarios, regardless of how the quarantine policy is configured:
  >
  > - Messages quarantined as malware by anti-malware policies.
  > - Messages quarantined as malware or phishing by Safe Attachments policies.
  > - Messages quarantined as high confidence phishing by anti-spam policies.
  >
  > If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

- Admins can report false positives to Microsoft from quarantine. For more information, see [Take action on quarantined email](quarantine-admin-manage-messages-files.md#take-action-on-quarantined-email) and [Take action on quarantined files](quarantine-admin-manage-messages-files.md#take-action-on-quarantined-files).

- Users can also report false positives to Microsoft from quarantine, depending on the value of the **Reporting from quarantine** setting in [user reported settings](submissions-user-reported-messages-custom-mailbox.md).

### Quarantine retention

How long quarantined messages or files are held in quarantine before they expire depends why the message or file was quarantined. Features and their corresponding retention periods are described in the following table:

|Quarantine reason|Default retention period|Customizable?|Comments|
|---|---|:---:|---|
|Messages quarantined by anti-spam policies as spam, high confidence spam, phishing, high confidence phishing, or bulk.|15 days <ul><li>The default anti-spam policy.</li><li>Anti-spam policies you create in PowerShell.</li></ul> <br/> 30 days <ul><li>Anti-spam policies you create in the Microsoft Defender portal.</li><li>Standard and Strict [preset security policies](preset-security-policies.md#appendix)</li></ul>|Yes<sup>\*</sup>|You can configure the value from 1 to 30 days in the default anti-spam policy and in custom anti-spam policies. For more information, see the **Retain spam in quarantine for this many days** (_QuarantineRetentionPeriod_) setting in [Configure anti-spam policies](anti-spam-policies-configure.md). <br/><br/> <sup>\*</sup>You can't change the value in the Standard or Strict preset security policies.|
|Messages quarantined by anti-phishing policies: <ul><li>**Anti-phishing policies for all cloud mailboxes**: Spoof intelligence.</li><li>**Anti-phishing policies in Defender for Office 365**: User impersonation protection, domain impersonation protection, and mailbox intelligence protection.</li></ul>|15 days or 30 days|Yes<sup>\*</sup>|This retention period is also controlled by the **Retain spam in quarantine for this many days** (_QuarantineRetentionPeriod_) setting in **anti-spam** policies. The retention period is the value from the first matching **anti-spam** policy that the recipient is defined in.|
|Messages quarantined by anti-malware policies (malware messages).|30 days|No|If you turn on the _common attachments filter_ in anti-malware policies (in the default policy or in custom policies), file attachments in email messages to the affected recipients are treated as malware based solely on the file extension using true type matching. A predefined list of mostly executable file types is used by default, but you can customize the list. For more information, see [Common attachments filter in anti-malware policies](anti-malware-protection-about.md#common-attachments-filter-in-anti-malware-policies).|
|Messages quarantined by mail flow rules where the action is **Deliver the message to the hosted quarantine** (_Quarantine_).|30 days|No||
|Messages quarantined by Safe Attachments policies in Defender for Office 365 (malware or phishing messages).|30 days|No||
|Files quarantined by Safe Attachments for SharePoint, OneDrive, and Microsoft Teams (malware files).|30 days|No|Files quarantined in SharePoint or OneDrive are removed from quarantine after 30 days, but the blocked files remain in SharePoint or OneDrive in the blocked state.|
|Messages in chats and channels quarantined by zero-hour auto protection (ZAP) for Microsoft Teams in Defender for Office 365|30 days|No|

When messages expire from quarantine after the retention period, the messages are permanently deleted and can't be recovered.

For more information about quarantine, see [Quarantine FAQ](quarantine-faq.yml).
