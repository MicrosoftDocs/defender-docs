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
ms.date: 05/22/2026
#customer intent: As a mail admin, I want to resolve false positives in Defender for Office 365 so that legitimate email isn't blocked or delivered to Junk.
---

# Resolve false positives for legitimate blocked emails in Microsoft Defender for Office 365

Microsoft Defender for Office 365 helps you identify and fix false positives — legitimate business emails that are mistakenly blocked as threats. Use this guide to understand _why_ legitimate emails were blocked, resolve the issue, and prevent similar situations in the future.

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

Message headers reveal why a message was classified as spam. You can extract headers from the [email entity page](../mdo-email-entity-page.md) in the Defender portal or from message properties in [Outlook](https://support.microsoft.com/office/cd039382-dc6e-4264-ac74-c048563d212c). Use the [Message Header Analyzer](https://mha.azurewebsites.net/) to parse raw headers into a readable format. For a complete list of header fields and values, see [Anti-spam message headers](../message-headers-eop-mdo.md).

Look for these key values in the **X-Forefront-Antispam-Report** header:

|Value|Description|Implication|
|---|---|---|
|`SCL:5` or `SCL:6`|Medium spam probability|Delivered to Junk Email folder|
|`SCL:7`, `SCL:8`, or `SCL:9`|High confidence spam|Delivered to Junk Email folder (default) or quarantined (preset security policies)|
|`BCL:7` to `BCL:9`|High bulk complaint level|Likely blocked by bulk mail threshold|
|`SFV:SPM`|Spam filter verdict: spam|Message flagged as spam by content filters|
|`SFV:BLK`|Blocked sender|Sender is on the user's Blocked Senders list in Outlook|

<!-- Does SFV:BLK also appear for Tenant Allow/Block List block entries? The official anti-spam headers doc only associates SFV:BLK with the user's Blocked Senders list, but support case data may show otherwise. If TABL blocks also stamp SFV:BLK, update this table and Step 2 accordingly. -->

### Step 2: Identify the source of the classification

Based on the header values, determine what caused the false positive:

- **Tenant Allow/Block List block entry**: Check the [email entity page](../mdo-email-entity-page.md) overrides information, or check the Tenant Allow/Block List directly for block entries that match the sender.
- **User's Blocked Senders list**: Look for `SFV:BLK` in the message headers.
- **Exchange mail flow rule (transport rule)**: Look for the `X-MS-Exchange-Organization-RuleID` header.
- **Anti-spam policy settings**: A high SCL score (5+) or BCL threshold exceeded.
- **Connection filter (IP block list)**: Check the [connection filter policy](../connection-filter-policies-configure.md) for the sending IP address in the IP Block List.

### Step 3: Apply the appropriate fix

Based on the source you identified, apply the correct resolution:

|Source identified|Recommended fix|
|---|---|
|Tenant Allow/Block List block entry|Remove the block entry or [create an allow entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses).|
|User's Blocked Senders list|Remove the sender from the user's [Blocked Senders list](../configure-junk-email-settings-on-exo-mailboxes.md) or use an admin allow override.|
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

### Common spam false positive scenarios

The following table describes common scenarios and recommended approaches:

|Scenario|Key indicators|Recommended approach|
|---|---|---|
|Legitimate newsletter or marketing email consistently quarantined|High BCL (7-9), high SCL (5-9), `SFV:SPM`|Increase the [BCL threshold](../anti-spam-policies-configure.md) (the default value is 7). Or, [submit the messages to Microsoft for analysis](../submissions-admin.md#report-good-email-to-microsoft) and create an allow entry for the sender during the submission.|
|All email from a specific partner domain is blocked|Sender found in the Tenant Allow/Block List (check the [email entity page](../mdo-email-entity-page.md) or the Tenant Allow/Block List directly)|Remove the block entry or [create an allow entry for the domain](../tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses).|
|Marketing automation platform email blocked (Marketo, HubSpot, Mailchimp, etc.)|High BCL, possible email authentication failures|Verify the sender's SPF/DKIM/DMARC configuration. If authentication passes but filtering still triggers, increase the BCL threshold or add the sending domain to the allow list.|
|Forwarded emails quarantined as spoofing|DMARC failure, spoof detection triggered|Configure [ARC trusted sealers](../email-authentication-arc-configure.md) for the forwarding service, or add a [spoof intelligence override](../anti-spoofing-spoof-intelligence.md) for the sender/infrastructure pair.|

### Troubleshoot fixes that aren't working

If your fix doesn't resolve the issue, check for the following common causes:

- **Propagation delay**: Allow 15-30 minutes for anti-spam policy changes and up to one hour for mail flow rule changes.
- **Policy precedence conflict**: A higher-priority policy (preset security policy) might override your custom policy settings. For details, see [Troubleshoot anti-spam policy issues](../anti-spam-policies-troubleshooting.md).
- **Multiple detection reasons**: The message triggered more than one detection (for example, spam _and_ spoof detection). Resolving one cause might not be enough.
- **Allow entry expired or incorrect**: Verify the [Tenant Allow/Block List entry](../tenant-allow-block-list-email-spoof-configure.md) is active, not expired, and uses the correct format (email address vs. domain).
- **Mail flow rule override**: Mail flow rules are evaluated before anti-spam policies. A mail flow rule that sets the SCL overrides the anti-spam policy action. Check for rules that set SCL or delete messages.

## Handle phishing and malware false positives

Use the following steps when legitimate email is incorrectly detected as phishing, malware, or another non-spam threat.

### Legitimate emails delivered to the Junk Email folder

Follow these steps when messages are delivered but land in the wrong folder.

#### End user actions

1. Report the email as **Not junk** by using the [built-in **Report** button in supported versions of Outlook](../submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook).
1. Optionally, add the sender to the [Safe Senders list](https://support.microsoft.com/office/add-recipients-to-the-safe-senders-list-in-outlook-be1baea0-beab-4a30-b968-9004332336ce) in Outlook to prevent future messages from that sender from going to Junk Email.

#### Admin actions

1. Triage user-reported messages from [the User reported tab on the Submissions page](../submissions-admin.md#view-user-reported-messages-to-microsoft).

   > [!TIP]
   > In organizations with Defender for Office 365 Plan 2 and Security Copilot, the [Phishing Triage Agent](/defender-xdr/phishing-triage-agent) can autonomously triage and classify user-reported phishing emails, reducing manual investigation work for security teams.

1. [Submit the messages to Microsoft for analysis](../submissions-admin.md#notify-users-about-admin-submitted-messages-to-microsoft) to understand why the email was blocked.
1. If needed, while submitting to Microsoft for analysis, [create an allow entry for the sender](../tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses) to mitigate the problem.
1. After the submission results are available, read the verdict on the **Submissions** page to understand why the emails were blocked.
1. Use the results to improve your organization's configuration and _prevent_ similar false positives in the future.

### Legitimate emails in quarantine (end user view)

End users can take the following actions on quarantined messages:

1. Review [quarantine notifications](../quarantine-quarantine-notifications.md) about quarantined messages. The notifications are based on the settings that security admins configure.
1. Preview, release, or report quarantined messages by using the steps in [Find and release quarantined messages as a user](../quarantine-end-user.md).

### Legitimate emails in quarantine (admin view)

Admins can release quarantined messages and submit them to Microsoft for analysis:

1. View quarantined emails (including messages where users requested release) from the [quarantine review page](../quarantine-admin-manage-messages-files.md).
1. [Release messages from quarantine while submitting them to Microsoft for analysis](../quarantine-admin-manage-messages-files.md#release-quarantined-email). You can also create a temporary allow entry in the Tenant Allow/Block List during the submission to mitigate the issue.
1. After submission results are available, [read the verdict](../submissions-admin.md#results-from-microsoft) to understand the reason for the detection.
   - If false positives are due to organization configuration, correct the configuration to mitigate the issue.
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
- [Troubleshoot common anti-spam policy issues](../anti-spam-policies-troubleshooting.md)
- [Manage quarantined messages and files as an admin](../quarantine-admin-manage-messages-files.md)
- [Report messages and files to Microsoft](../submissions-admin.md)
- [Manage the Tenant Allow/Block List](../tenant-allow-block-list-email-spoof-configure.md)
