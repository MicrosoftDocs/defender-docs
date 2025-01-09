---
title: Submission result definitions
f1.keywords:
 - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: overview
ms.localizationpriority: medium
search.appverid:
 - MET150
ms.assetid:
ms.collection:
 - m365-security
 - tier1
description: Admins and end-users can learn about the results of submitting entities to Microsoft for analysis.
ms.service: defender-office-365
ms.date: 07/26/2024
appliesto:
 - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
 - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
 - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Submission result definitions in Exchange Online Protection and Defender for Office 365

In Microsoft 365 organizations with mailboxes in Exchange Online, [user reported settings](submissions-user-reported-messages-custom-mailbox.md) determine whether user reported email messages are sent to Microsoft for analysis. Even if the messages aren't initially sent to Microsoft, admins can manually send or resend email messages (including user reported email messages) from the **Submissions** page in, email attachments, URLs, and (in Microsoft Defender for Office 365 Plan 2 only) Microsoft Teams messages. For more information, see [How do I report a suspicious email or file to Microsoft?](submissions-report-messages-files-to-microsoft.md).

When admins or users submit items to Microsoft for analysis, we do the following checks:

- **Email authentication check** (email messages only): Whether the message passed or failed [email authentication](email-authentication-about.md) checks: [SPF](email-authentication-spf-configure.md), [DKIM](email-authentication-dkim-configure.md), [DMARC](email-authentication-dmarc-configure.md), and [composite authentication](email-authentication-about.md#composite-authentication).
- **Policy hits**: Information about any policies or overrides that might have allowed or blocked the incoming email into the organization, thus overriding our filtering verdicts.
- **Payload reputation/detonation**: Up-to-date examination of any URLs and attachments in the message.
- **Grader analysis**: Review done by human graders to confirm whether messages are malicious.

> [!NOTE]
> In U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD), admins can submit items to Microsoft for analysis, but the items are analyzed for email authentication and policy hits only. Payload reputation, detonation, and grader analysis aren't done for compliance reasons (data isn't allowed to leave the organization boundary).

The following table describes the results of submissions to Microsoft:

- **Status** indicates whether the previously described checks have been completed.
- **Result** indicates the details that were generated during the analysis using the previously described checks

|Status|Result|Description|
|---|---|---|
|Being analyzed|Under investigation|The item is being analyzed as previously described. After the analysis is complete, the status is updated and the result shows details of the analysis.|
|Completed|Not submitted to Microsoft|The [user reported settings](submissions-user-reported-messages-custom-mailbox.md) are configured to deliver reported messages to the reporting mailbox only. Microsoft is unable to automatically receive the copy of the submitted item and act on it. You can update the user reported settings to deliver messages to the reporting mailbox and to Microsoft, or to Microsoft only.|
|Completed|Phishing simulation|The submitted item is part of your part of an internal anti-phishing education campaign. Check the [Advanced delivery policy](advanced-delivery-policy-configure.md) or (in Defender for Office 365 Plan 2) [Attack simulation training](attack-simulation-training-get-started.md).|
|Completed|Authentication failed|The message wasn't delivered because it failed email authentication. If you own this domain, review your domain authentication settings. Otherwise, contact the domain owner. For more information, see [Email authentication in Microsoft 365](email-authentication-about.md).|
|Completed|Spoofed message|The submitted item was sent by someone who is spoofing the sender. For more information, see [Spoof intelligence insight in EOP](anti-spoofing-spoof-intelligence.md).|
|Completed|Domain Impersonation|In Defender for Office 365, the submitted item came from a domain that resembles a domain identified for domain impersonation protection. We recommend that you review the item and (if necessary) add the sender domain to the list of trusted senders in the anti-phishing policy that detected the message. For more information, see [Domain impersonation protection](anti-phishing-policies-about.md#domain-impersonation-protection).|
|Completed|Brand Impersonation|In Defender for Office 365, the submitted item came from someone who is associated with a brand. We recommend that you review the item and (if necessary) [add the sender address as an allow entry in the Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses).|
|Completed|User Impersonation|In Defender for Office 365, the submitted item comes from a sender that resembles a user identified for user impersonation protection. We recommend that you review the item and (if necessary) add the sender to the list of trusted senders in the anti-phishing policy that detected the message. For more information, see [User impersonation protection](anti-phishing-policies-about.md#user-impersonation-protection).|
|Completed|Allowed due to organizational overrides|An entity associated with the submitted item was allowed in one of the following settings: <ul><li> The [Advanced delivery for a SecOps mailbox](advanced-delivery-policy-configure.md#use-the-microsoft-defender-portal-to-configure-secops-mailboxes-in-the-advanced-delivery-policy)</li><li>[Enhanced Filtering for Connectors](/Exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors)</li><li>The [connection filter policy](connection-filter-policies-configure.md)</li><li>The [Tenant Allow/Block List](tenant-allow-block-list-about.md#allow-entries-in-the-tenant-allowblock-list)</li><li>An Exchange mail flow rule (transport rule)</li><li>An action configured in your policy settings.</li></ul> <br/> Check the submission result for the exact cause and remove or fix the setting.|
|Completed|Allowed due to user overrides|The submitted item recipient has [Outlook configurable allow settings in their mailbox](configure-junk-email-settings-on-exo-mailboxes.md) (for example, a sender or domain in their Safe Senders List). Check the submission result for the exact cause and remove or fix the setting.|
|Completed|Blocked due to organizational overrides|An entity associated with the submitted item was blocked in one of the following settings: <ul><li>The [connection filter policy](connection-filter-policies-configure.md)</li><li>The [Tenant Allow/Block List](tenant-allow-block-list-about.md#block-entries-in-the-tenant-allowblock-list)</li><li>An Exchange mail flow rule (transport rule)</li><li>An action configured in your policy settings.</li></ul> <br/> Check the submission result for the exact cause and remove or fix the setting.|
|Completed|Blocked due to user overrides|The submitted item recipient has [Outlook configurable block settings in their mailbox](configure-junk-email-settings-on-exo-mailboxes.md) (for example, a sender or domain in the Blocked Senders list or **Safe Lists only** turned on). Check the submission result for the exact cause and remove or fix the setting.|
|Completed|Item was not found|The submitted item is unavailable because it was deleted or the submission is invalid. Only items from Exchange Online mailboxes can be submitted. Resubmit the .eml file or Network Message ID of a message from an Exchange Online mailbox.|
|Completed|The reason behind this verdict was lost in transit|The submitted item was routed via [Hybrid mail flow](/exchange/exchange-hybrid) between on-premises Exchange and Exchange Online, and the filtering verdict was lost. Check any similar messages that were delivered directly to your cloud mailbox and fix your routing.|
|Completed|We did not receive the submission, please fix the problem and resubmit|The submitted item did not reach the submission service. Verify that no policies or mail flow rules prevent items from reaching our service. For more information, see [Microsoft 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges).|
|Completed|Further analysis needed|In U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD) receive this result when nothing is found within the allowed checks for **Email authentication checks** and **Policy hits**. We recommend opening a support ticket to get the submitted item analyzed.|
|Completed|Unknown - We checked but can't make a decision right now|Microsoft could not reach a decision regarding the submitted item. Explanations include different interpretations by different analysts or the item being inaccessible. Microsoft continuously invests in the analysis process so this result is less common.|
|Completed|Bulk|The submitted item sender was classified as a bulk sender. In the future, similar items are blocked if they meet or exceed the bulk compliant level (BCL) threshold in anti-spam policies. For more information, see [Bulk complaint level (BCL) in EOP](anti-spam-bulk-complaint-level-bcl-about.md). To prevent similar items from being delivered, you can create block entries for domains or email addresses, files, or URLs in the Tenant Allow/Block List. For more information, see [Block entries in the Tenant Allow/Block List](tenant-allow-block-list-about.md#block-entries-in-the-tenant-allowblock-list).|
|Completed|Spam|The submitted item was classified as spam. In the future, similar items are blocked if they meet or exceed the spam confidence level (SCL) threshold in anti-spam policies. For more information, see [Spam confidence level (SCL) in EOP](anti-spam-spam-confidence-level-scl-about.md). To prevent similar items from being delivered, you can create block entries for domains or email addresses, files, or URLs in the Tenant Allow/Block List. For more information, see [Block entries in the Tenant Allow/Block List](tenant-allow-block-list-about.md#block-entries-in-the-tenant-allowblock-list).|
|Completed|No threats found|The submitted item was found to be clean. After a period of evaluation, the filters might be updated using the information from the submission. Until the filters learn about the submission, you can create block entries or allow entries for the item in the Tenant Allow/Block List.|
|Completed|Threats found|The submitted item was found to be malicious. After a period of evaluation, the filters might be updated using the information from the submission. Until the filters learn about the submission, you can create block entries or allow entries for the item in the Tenant Allow/Block List.|
