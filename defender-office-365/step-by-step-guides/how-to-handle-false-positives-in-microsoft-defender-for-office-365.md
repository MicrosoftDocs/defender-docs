---
title: Resolve email false positives in Microsoft Defender for Office 365
description: Learn how to resolve false positives in Microsoft Defender for Office 365 when legitimate emails are blocked, quarantined, or delivered to Junk Email.
ms.service: defender-office-365
ai-usage: ai-assisted
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.custom: msecd-doc-authoring-1012
ms.date: 05/19/2026
#customer intent: As a mail admin, I want to resolve false positives in Defender for Office 365 so that legitimate email isn't blocked or delivered to Junk.
---

# Resolve false positives for legitimate blocked emails in Microsoft Defender for Office 365

Microsoft Defender for Office 365 helps you identify and fix false positives — legitimate business emails that are mistakenly blocked as threats. Use this guide to understand _why_ legitimate emails were blocked, quickly resolve the issue, and prevent similar situations in the future.

## Prerequisites

- Microsoft Defender for Office 365 Plan 1 or Plan 2 (included in Microsoft 365 A5/E5/G5).
- Sufficient permissions (for example, membership in the **Security Administrator** role in [Microsoft Entra ID](/entra/identity/role-based-access-control/manage-roles-portal)).
- 5-10 minutes to complete the steps.

## Identify your false positive type

Before you begin troubleshooting, identify whether the false positive is spam-related or phishing/malware-related. The resolution steps differ based on the type of detection.

**Use the spam false positive steps in this article if**:

- Legitimate bulk email (newsletters, marketing) is marked as spam.
- Messages are delivered to the **Junk Email** folder instead of the Inbox.
- Messages are quarantined as spam (not phishing or malware).
- Message headers show a high Spam Confidence Level (SCL 5-9) or Bulk Complaint Level (BCL 7-9).
- Message headers show `SFV:SPM` (spam filter verdict).

**Use the phishing/malware false positive steps in this article if**:

- Messages are blocked by Safe Links or Safe Attachments.
- Impersonation protection triggers incorrectly.
- Messages are detected as phishing or malware.

## Handle spam false positives

Use the following steps when legitimate email is incorrectly classified as spam.

### Step 1: Check message headers for spam indicators

Message headers reveal why a message was classified as spam. You can extract headers from the [email entity page](../mdo-email-entity-page.md) in the Defender portal, or from message properties in [Outlook](https://support.microsoft.com/office/cd039382-dc6e-4264-ac74-c048563d212c). To parse raw headers into a readable format, use the [Message Header Analyzer](https://mha.azurewebsites.net/). For a complete list of header fields and values, see [Anti-spam message headers](../message-headers-eop-mdo.md).

Look for these key values in the **X-Forefront-Antispam-Report** header:

|Value|Description|Implication|
|---|---|---|
|`SCL:5` or `SCL:6`|Medium spam probability|Delivered to Junk Email folder|
|`SCL:7`, `SCL:8`, or `SCL:9`|High spam probability|Quarantined or rejected|
|`BCL:7` to `BCL:9`|High bulk complaint level|Likely blocked by bulk mail threshold|
|`SFV:SPM`|Spam filter verdict: spam|Message flagged as spam by content filters|
|`SFV:BLK`|Blocked sender|Sender is on the Tenant Allow/Block List|

### Step 2: Identify the source of the classification

Based on the header values, determine what caused the false positive:

- **Tenant Allow/Block List block entry**: Look for `SFV:BLK` or check for blocked sender entries.
- **Exchange mail flow rule (transport rule)**: Look for the `X-MS-Exchange-Organization-RuleID` header.
- **Anti-spam policy settings**: A high SCL score (5+) or BCL threshold exceeded.
- **Connection filter (IP block list)**: Look for IP filtering indicators like `IPV:SPM`.

### Step 3: Apply the appropriate fix

Based on the source you identified, apply the correct resolution:

|Source identified|Recommended fix|
|---|---|
|Tenant Allow/Block List block entry|Remove the block entry or [create an allow entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses).|
|IP block list|Add the sending IP to the [connection filter allow list](../connection-filter-policies-configure.md).|
|Anti-spam policy (high SCL)|[Tune the anti-spam policy](../anti-spam-policies-configure.md). For example, increase the BCL threshold or adjust the spam action.|
|Mail flow rule|Modify the [mail flow rule](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) conditions or add exceptions for the affected sender.|
|Spam filtering error (no organization configuration issue)|[Submit the message to Microsoft for analysis](../submissions-admin.md#report-good-email-to-microsoft) as a false positive.|

### Step 4: Validate the fix

After you apply the fix, confirm that the issue is resolved:

1. Ask the sender to send a test message with the same content type and sender domain.
1. Use [message trace](../message-trace-defender-portal.md) to verify the message was delivered to the Inbox.
1. Check the message headers to confirm the SCL value is lower or the spam verdict is no longer applied.

> [!TIP]
> Allow 15-30 minutes for policy changes to take effect. Mail flow rule changes might take up to one hour due to caching.

## Handle phishing and malware false positives

Use the following steps when legitimate email is incorrectly detected as phishing, malware, or another non-spam threat.

### Legitimate emails delivered to the Junk Email folder

Use these steps when messages are delivered but land in the wrong folder.

#### End user actions

1. Report the email as **Not junk** by using the [built-in **Report** button in supported versions of Outlook](../submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook).
1. Optionally, add the sender to the [Safe Senders list](https://support.microsoft.com/office/add-recipients-to-the-safe-senders-list-in-outlook-be1baea0-beab-4a30-b968-9004332336ce) in Outlook to prevent future messages from that sender from going to Junk Email.

#### Admin actions

1. Triage user-reported messages from [the User reported tab on the Submissions page](../submissions-admin.md#view-user-reported-messages-to-microsoft).
1. [Submit the messages to Microsoft for analysis](../submissions-admin.md#notify-users-about-admin-submitted-messages-to-microsoft) to understand why the email was blocked.
1. If needed, while submitting to Microsoft for analysis, [create an allow entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses) to mitigate the problem.
1. After the submission results are available, read the verdict on the **Submissions** page to understand why the emails were blocked. Use the results to improve your organization's configuration and _prevent_ similar false positives in the future.

### Legitimate emails in quarantine (end user view)

Use these steps when end users have messages held in quarantine:

1. Review [quarantine notifications](../quarantine-quarantine-notifications.md) about quarantined messages. The notifications are based on the settings that security admins configure.
1. [Preview messages in quarantine, block the sender, release messages, submit messages to Microsoft for analysis, or request release from admins](../quarantine-end-user.md).

### Legitimate emails in quarantine (admin view)

Use these steps when admins need to release quarantined messages:

1. Admins can view quarantined emails (including messages where users requested release) from the [quarantine review page](../quarantine-admin-manage-messages-files.md).
1. Admins can [release messages from quarantine while submitting them to Microsoft for analysis](../quarantine-admin-manage-messages-files.md#release-quarantined-email). They can also create a temporary allow entry in the Tenant Allow/Block List during the submission to mitigate the issue.
1. After submission results are available, admins should [read the verdict](../submissions-admin.md#results-from-microsoft) to understand the reason for the detection.
   - If false positives are due to organization configuration, admins can correct the configuration to mitigate the issue.
   - If false positives are due to other factors, Microsoft learns from the submission and similar messages aren't quarantined anymore.

> [!NOTE]
> Admins need to manually release any similar quarantined messages. Quarantined messages aren't released automatically. To find and release quarantined messages in bulk, see [Can I release or report more than one quarantined message at a time?](../quarantine-faq.yml#can-i-release-or-report-more-than-one-quarantined-message-at-a-time-).

### Forwarded or spoofed emails incorrectly blocked

Externally forwarded emails or legitimate cross-domain senders can trigger spoof detection because the sending infrastructure doesn't match the From address domain. If you see forwarded or non-Microsoft emails blocked as spoofing:

- Review the [spoof intelligence insight](../anti-spoofing-spoof-intelligence.md) and add an override for legitimate sender/infrastructure pairs.
- If your organization receives mail through an intermediary (mailing list, forwarding service, or email gateway), configure [ARC trusted sealers](../email-authentication-arc-configure.md) so messages preserve authentication through the relay.
- Ask the external sender to fix their SPF, DKIM, and DMARC records to align with their sending infrastructure.

## Related content

- [Anti-spam protection in EOP](../anti-spam-protection-about.md)
- [Manage quarantined messages and files as an admin](../quarantine-admin-manage-messages-files.md)
- [Report messages and files to Microsoft](../submissions-admin.md)
- [Manage the Tenant Allow/Block List](../tenant-allow-block-list-email-spoof-configure.md)
