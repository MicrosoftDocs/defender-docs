---
title: "Report false positives or false negatives following automated investigation and response"
description: Was something missed or wrongly detected by AIR in Microsoft Defender for Office 365 Plan 2? Learn how to submit false positives or false negatives to Microsoft for analysis.
search.appverid: met150
f1.keywords: 
- NOCSH
author: chrisda
ms.author: chrisda
ms.service: defender-office-365
ms.date: 07/10/2024
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.custom: 
- autoir
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Report false positives or false negatives in automated investigation and response (AIR)

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2 includes powerful capabilities to detect and investigate threats. For more information, see [Automated investigation and response](air-about.md).

But what if AIR incorrectly identifies something as a threat (a false positive) or missed something that turned out to be a threat (a false negative)? This article explains the options that are available to security operations (SecOps) personnel to deal with false positives and false negatives from AIR.

## Submit false positives or false negatives to Microsoft

To submit or resubmit false positive and false negative email messages, email attachments, and URLs to Microsoft, see [Use the Submissions page to submit suspected spam, phish, URLs, legitimate email getting blocked, and email attachments to Microsoft](submissions-admin.md).

## Adjust alerts to prevent false positives from recurring

For instructions, see the following articles, based on the available subscriptions in your organization:

- **Defender XDR**: [Tune an alert](/defender-xdr/investigate-alerts#tune-an-alert)
- **Defender for Endpoint**: Create **Allow** actions for files, IP addresses URLs or domains that are misidentified as malware on devices. For instructions, see [Create indicators](/defender-endpoint/manage-indicators).

## Undo remediation actions

> [!TIP]
> For permission and licensing requirements, see [Required permissions and licensing for AIR](air-about.md#required-permissions-and-licensing-for-air).

SecOps personnel can often use :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **Take action** to undo the remediation action. For example:

- From Explorer (Threat Explorer). For details, see [Email remediation](threat-explorer-threat-hunting.md#email-remediation).
- From the Email entity page. For more information, see [Actions on the Email entity page](mdo-email-entity-page.md#actions-on-the-email-entity-page).
- From the details flyout of entries on the **History** tab of the Action center at <https://security.microsoft.com/action-center/history>.

For details about the available actions in :::image type="icon" source="media/m365-cc-sc-take-actions-icon.png" border="false"::: **Take action**, see the [Take action wizard](threat-explorer-threat-hunting.md#the-take-action-wizard).

- To take action on messages that were moved to the Junk Email folder in the mailbox, use **Take action** \> **Move to mailbox folder** and then select one of the following destinations:
  - **Inbox** for false positives.
  - **Deleted Items**, **Soft deleted items**, or **Hard deleted items** for false negatives.
- To take action on messages that were quarantined, do one of the following steps:
  - To release the message, use **Take action** \> **Move to mailbox folder** \> **Inbox** and then select **Release to one or more of the original recipients of the email** or **Release to all recipients**. Or, you can [release the message directly from quarantine](quarantine-admin-manage-messages-files.md#release-quarantined-email).
  - [Delete the message directly from quarantine](quarantine-admin-manage-messages-files.md#delete-email-from-quarantine) if the user has access to the quarantined message.
  - If the user doesn't have access to the quarantined message, you don't need to do anything (the message will [eventually expire from quarantine](quarantine-about.md#quarantine-retention)).
- To take action on files that were quarantined, do one of the following steps:
  - [Release the quarantined file from quarantine](quarantine-admin-manage-messages-files.md#release-quarantined-files-from-quarantine).
  - [Delete the quarantined file from quarantine](quarantine-admin-manage-messages-files.md#delete-quarantined-files-from-quarantine) if the user has access to the quarantined file.
  - If the user doesn't have access to the quarantined file, you don't need to do anything (the file will [eventually expire from quarantine](quarantine-about.md#quarantine-retention)).

## See also

- [Microsoft Defender for Office 365](mdo-about.md)
- [Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2](air-about.md)
