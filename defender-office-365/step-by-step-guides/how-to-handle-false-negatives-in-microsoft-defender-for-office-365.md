---
title: (False negatives) How to use Microsoft Defender for Office 365 to handle malicious emails delivered to recipients.
description: Steps in Microsoft Defender for Office 365 to handle malicious emails delivered to end users (false negatives) to prevent the loss of business.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 05/21/2026
---

# How to handle malicious emails that are delivered to recipients (false negatives) using Microsoft Defender for Office 365

Microsoft Defender for Office 365 helps deal with undetected malicious email delivered to recipients (known as false negatives) that put your organizational productivity at risk.

Defender for Office 365 can help admins understand *why* malicious emails were delivered, how to quickly resolve the issue, and how to prevent similar issues from happening in the future.

## What you need

- Microsoft Defender for Office 365 Plan 1 or Plan 2. Microsoft 365 A5/E5/G5 includes Plan 2.
- Sufficient permissions. For example, membership in the **Security Administrator** role in [Microsoft Entra ID](/entra/identity/role-based-access-control/manage-roles-portal).
- 5-10 minutes to perform the following steps.

## Handling malicious emails in the Inbox folder of end users

1. Ask end users to report the email as **Phishing** or **Junk** using the [built-in **Report** button in supported versions of Outlook](../submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook).
2. End users can also add senders to their **[Blocked Senders List](https://support.microsoft.com/office/block-or-unblock-senders-in-outlook-9bf812d4-6995-4d19-901a-76d6e26939b0#picktab=classic_outlook)** in Outlook to prevent emails from this sender from being delivered to their inbox.
3. Admins can triage the user reported messages from [User reported tab on the Submissions page](../submissions-admin.md#view-user-reported-messages-to-microsoft).

   > [!TIP]
   > In organizations with Defender for Office 365 Plan 2 and Security Copilot, the [Phishing Triage Agent](/defender-xdr/phishing-triage-agent) can autonomously triage and classify user-reported phishing emails, reducing manual investigation work for security teams.

4. From those reported messages, admins can **submit to** [Microsoft for analysis](../submissions-admin-review-user-reported-messages.md#notify-users-from-within-the-portal) to learn why that email was allowed in the first place.
5. If needed, while submitting to Microsoft for analysis, admins can [create a block entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-domains-and-email-addresses) to mitigate the problem.
6. Once the results for submissions are available, read the verdict to understand why emails were allowed, and how your organization setup could be improved to prevent similar issues from happening in the future.

## Handling malicious emails in junk folder of end users

1. Ask end users to report the email as **phishing** using the [built-in **Report** button in supported versions of Outlook](../submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook).
2. Admins can triage the user reported messages from the [User reported tab on the Submissions page](../submissions-admin.md#view-user-reported-messages-to-microsoft).

   > [!TIP]
   > In organizations with Defender for Office 365 Plan 2 and Security Copilot, the [Phishing Triage Agent](/defender-xdr/phishing-triage-agent) can autonomously triage and classify user-reported phishing emails, reducing manual investigation work for security teams.

3. From those reported messages admins can **submit to** [Microsoft for analysis](../submissions-admin.md#notify-users-about-admin-submitted-messages-to-microsoft) and learn why that email was allowed in the first place.
4. If needed, while submitting to Microsoft for analysis, admins can [create a block entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-domains-and-email-addresses) to mitigate the problem.
5. Once the results for submissions are available, read the verdict to understand why emails were allowed, and how your organization setup could be improved to prevent similar issues from happening in the future.

## Handling malicious emails landing in the quarantine folder of end users

1. End users receive an [email digest](../quarantine-quarantine-notifications.md) about quarantined messages as per the settings enabled by admins.
2. End users can preview the messages in quarantine, block the sender, and submit those messages to Microsoft for analysis.

## Handling malicious emails landing in the quarantine folder of admins

1. Admins can view the quarantined emails (including the ones asking permission to request release) from the [review page](../quarantine-admin-manage-messages-files.md).
2. Admins can submit any malicious, or suspicious messages to Microsoft for analysis, and create a block to mitigate the issue while waiting for a verdict.
3. Once the results for submissions are available, read the verdict to learn why the emails were allowed, and how your organization setup could be improved to prevent similar issues from happening in the future.
