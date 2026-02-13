---
title: (False positives) How to use Microsoft Defender for Office 365 to handle legitimate emails that were blocked from delivery to recipients.
description: Steps in  Microsoft Defender for Office 365 to handle legitimate emails getting blocked from delivery to end users (false positives) to prevent the loss of business.
ms.service: defender-office-365
f1.keywords: 
 - NOCSH
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
manager: jarogers
audience: ITPro
ms.collection: 
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
search.appverid: met150
ms.date: 12/08/2025
---

# How to handle legitimate emails getting blocked (false positives) using Microsoft Defender for Office 365

Microsoft Defender for Office 365 helps deal with legitimate business emails that are mistakenly blocked as threats (known as false positives).

Defender for Office 365 can help admins understand *why* legitimate emails were blocked, how to quickly resolve the issue, and how to prevent similar issues from happening in the future.

## What you need

- Microsoft Defender for Office 365 Plan 1 or Plan 2. Microsoft 365 A5/E5/G5 includes Plan 2.
- Sufficient permissions. For example, membership in the **Security Administrator** role in [Microsoft Entra ID](/entra/identity/role-based-access-control/manage-roles-portal).
- 5-10 minutes to perform the following steps.

## Handling legitimate emails in to Junk folder of end users

1. Ask end users to report the email as **Not junk** using the [built-in **Report** button in supported versions of Outlook](../submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook).
2. End users can also add senders to their **[Safe Sender List](https://support.microsoft.com/office/add-recipients-to-the-safe-senders-list-in-outlook-be1baea0-beab-4a30-b968-9004332336ce)** in Outlook to prevent messages from these senders landing in Junk folder.
3. Admins can triage the user-reported messages from [the User reported tab on the Submission page](../submissions-admin.md#view-user-reported-messages-to-microsoft).
4. From those reported messages admins can submit to [**Microsoft for analysis**](../submissions-admin.md#notify-users-about-admin-submitted-messages-to-microsoft) and understand why was that email blocked in the first place.
5. If needed, while submitting to Microsoft for analysis, admins can judiciously [create an allow entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses) to mitigate the problem.
6. Once the results from the admin submission are available, read it to understand why emails were blocked and how your organization setup could be improved to *prevent* similar issues from happening in the future.

## Handling legitimate emails that are in quarantine folder of end users

1. An end user receives an [email digest](../quarantine-quarantine-notifications.md) about quarantined messages as per the settings enabled by security admins.
2. End users can preview the messages in quarantine, block the sender, release the messages, submit those messages to Microsoft for analysis, and request release of those emails from admins.

## Handling legitimate emails in quarantine folder of an admin

1. Admins can view the quarantined emails (including the ones asking permission to request release) from the [review page](../quarantine-admin-manage-messages-files.md).
2. Admins can release the message from quarantine while submitting it to Microsoft for analysis. They can also create a temporary allow entry in the Tenant Allow/Block List during the submission to Microsoft to mitigate the issue.
3. Once the results for submissions are available, admins should read the verdict to understand the reason.
   - If false positives are due to organization configuration, admins can correct it to mitigate the issue.
   - If false positives are due to other factors, Microsoft learns from the submission and similar messages aren't quarantined anymore.

> [!NOTE]
> Admins need to manually release any similar quarantined messages. Quarantined messages aren't released automatically. To find and release quarantined messages in bulk, see [Can I release or report more than one quarantined message at a time?](../quarantine-faq.yml#can-i-release-or-report-more-than-one-quarantined-message-at-a-time-)
