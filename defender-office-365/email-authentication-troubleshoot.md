---
title: Troubleshoot email authentication in Microsoft 365
description: Troubleshoot SPF, DKIM, and DMARC email authentication failures in Exchange Online and Microsoft 365 with quick-reference tables and detailed guidance.
author: chrisda
ms.author: chrisda
ms.date: 05/20/2026
ms.topic: troubleshooting
ms.service: defender-office-365
ms.localizationpriority: high
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
ai-usage: ai-assisted
---

# Troubleshoot email authentication in Microsoft 365

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Email authentication and the corresponding DNS records help protect your organization from spoofing, phishing, and spam. For an overview of email authentication, see [Email authentication in Microsoft 365](email-authentication-about.md). When authentication fails, legitimate messages can be quarantined, rejected, or routed to the Junk Email folder. Use the quick-reference troubleshooting tables to identify common symptoms and causes, followed by detailed guidance for each failure scenario.

## Quick-reference troubleshooting tables

Use the tables in the following sections to quickly identify the symptom, likely cause, and link to the relevant detailed guidance.

### SPF failures

To troubleshoot Sender Policy Framework (SPF) errors, use the information in the following table:

|Symptom|Likely cause|Detailed guidance|
|---|---|---|
|SPF check returns `none` (no record found)|No SPF TXT record is published for the sending domain in DNS.|[Set up SPF to identify valid email sources](email-authentication-spf-configure.md)|
|SPF check returns `permerror`|The SPF record exceeds the 10 DNS lookup limit, or multiple SPF records exist for the same domain.|[Set up SPF - Troubleshooting](email-authentication-spf-configure.md#troubleshooting-spf-txt-records)|
|SPF check returns `temperror`|A temporary DNS failure occurred when querying the SPF record (the authoritative DNS server was unreachable or timed out).|[Set up SPF - Troubleshooting](email-authentication-spf-configure.md#troubleshooting-spf-txt-records)|
|SPF check returns `softfail` or `fail`|The sending IP address isn't included in the domain's SPF record. This result is common after adding a new email service or non-Microsoft relay.|[Set up SPF to identify valid email sources](email-authentication-spf-configure.md)|
|SPF passes, but mail is still marked as spam|SPF alone doesn't prevent spoofing. DKIM and DMARC are also needed. Composite authentication might still fail.|[How SPF, DKIM, and DMARC work together](email-authentication-about.md#how-spf-dkim-and-dmarc-work-together-to-authenticate-email-message-senders)|
|Forwarded messages fail SPF|The forwarding server's IP isn't in the original sender's SPF record. This behavior is expected.|[Configure trusted ARC sealers](email-authentication-arc-configure.md)|

### DKIM failures

To troubleshoot DomainKeys Identified Mail (DKIM) errors, use the information in the following table:

|Symptom|Likely cause|Detailed guidance|
|---|---|---|
|`dkim=none` (no signature found)|DKIM signing isn't configured for the sending domain, or the message wasn't signed.|[Set up DKIM to sign mail from your domain](email-authentication-dkim-configure.md)|
|`dkim=fail` (signature verification failed)|The DKIM public key in DNS doesn't match the private key used to sign the message, or the selector record is missing.|[Set up DKIM to sign mail from your domain](email-authentication-dkim-configure.md)|
|`dkim=fail` (body hash didn't verify)|The message body was modified after signing (for example, by a mailing list, transport rule, or intermediary service).|[Configure trusted Authenticated Received Chain (ARC) sealers](email-authentication-arc-configure.md)|
|DKIM key lookup times out|The DKIM TXT record is too large or the authoritative DNS server is slow to respond, causing lookup timeouts.|[Set up DKIM to sign mail from your domain](email-authentication-dkim-configure.md)|
|DKIM toggle doesn't work in the Defender portal|The required Canonical Name (CNAME) records aren't created at the domain registrar, or DNS propagation isn't complete.|[Troubleshoot DKIM DNS configuration](email-authentication-dkim-configure.md#troubleshoot-dkim-dns-configuration)|

### DMARC failures

To troubleshoot Domain-based Message Authentication, Reporting, and Conformance (DMARC) errors, use the information in the following table:

|Symptom|Likely cause|Detailed guidance|
|---|---|---|
|`dmarc=fail action=quarantine` or `dmarc=fail action=oreject`|SPF and DKIM didn't pass with alignment to the From address domain. The sender's DMARC policy specifies quarantine or reject.|[Set up DMARC for your domain](email-authentication-dmarc-configure.md)|
|`dmarc=bestguesspass`|No DMARC record exists for the sender's domain. Microsoft 365 inferred a pass using heuristics.|[Composite authentication](email-authentication-about.md#composite-authentication)|
|DMARC fails due to domain misalignment|The MAIL FROM (envelope sender) domain differs from the From (header) address domain, and SPF or DKIM doesn't align with the From domain.|[How SPF, DKIM, and DMARC work together](email-authentication-about.md#how-spf-dkim-and-dmarc-work-together-to-authenticate-email-message-senders)|
|Legitimate forwarded mail rejected by DMARC|Forwarding breaks SPF alignment, and if DKIM also fails (body modified), DMARC fails. ARC sealing isn't configured.|[Configure trusted ARC sealers](email-authentication-arc-configure.md)|
|DMARC reports show unexpected failures|Non-Microsoft services sending on behalf of your domain aren't included in your SPF record or aren't DKIM-signing with your domain.|[Set up SPF](email-authentication-spf-configure.md) and [Set up DKIM](email-authentication-dkim-configure.md)|

### Composite authentication failures

To troubleshoot composite authentication (compauth) errors, use the information in the following table:

|Symptom|Likely cause|Detailed guidance|
|---|---|---|
|`compauth=fail` with reason `000`|The message failed explicit authentication. DMARC check failed and the DMARC policy is `p=quarantine` or `p=reject`.|[Authentication-Results message header](message-headers-eop-mdo.md#authentication-results-message-header)|
|`compauth=fail` with reason `001`|The message failed implicit authentication. The sending domain has no email authentication records, or has a weak failure policy (`~all` or `?all`).|[Authentication-Results message header](message-headers-eop-mdo.md#authentication-results-message-header)|
|`compauth=fail` with reason `002`|A sender/domain pair is explicitly blocked from sending spoofed email in the organization.|[Spoof intelligence insight](anti-spoofing-spoof-intelligence.md)|
|`compauth=fail` with reason `010`|The message failed DMARC with the sender's policy set to reject or quarantine, and the sending domain is one of your organization's accepted domains.|[Spoof settings in anti-phishing policies](anti-phishing-policies-about.md#spoof-settings)|

### NDRs for email authentication failures

Use the information in the following table to troubleshoot non-delivery reports (also known as NDRs or bounce messages) related to email authentication failures.

|Symptom|Likely cause|Detailed guidance|
|---|---|---|
|NDR with error code `550 5.7.23`|The SPF record for the sending domain is missing or misconfigured, causing the destination server to reject the message.|[Fix NDR error "550 5.7.23"](/troubleshoot/exchange/email-delivery/ndr/fix-error-code-5-7-23-in-exchange-online)|
|NDR with error code `5.7.367`|Forwarded or relayed messages from Microsoft 365 are rejected because DKIM/SPF fails after relay through a non-Microsoft gateway.|[Fix error code 5.7.367 in Exchange Online](/troubleshoot/exchange/email-delivery/ndr/forwarded-message-rejected-5-7-367-ndr)|
|NDR with error code `550 5.7.1`|The message was rejected as unauthorized. Common causes include an incomplete SPF record, incorrect connector configuration, or the destination server's security policies.|[Fix NDR error "550 5.7.1"](/troubleshoot/exchange/email-delivery/ndr/fix-error-code-550-5-7-1-in-exchange-online)|

## Detailed troubleshooting by protocol

### Troubleshoot SPF

SPF validates that the sending mail server is authorized to send on behalf of the domain in the MAIL FROM (envelope sender) address. Common issues include:

- **Multiple SPF records for the same domain**: Only one SPF TXT record is allowed per domain or subdomain. Multiple records cause SPF `permerror`.
- **Exceeding the 10 DNS lookup limit**: Each `include`, `a`, `mx`, `ptr`, and `redirect` mechanism counts as a DNS lookup. To reduce lookups, flatten your SPF record or use `ip4`/`ip6` mechanisms.
- **Missing authorized senders**: When you add a new email service (for example, a customer relationship management (CRM) platform or marketing tool), add its SPF include to your record.
- **TTL too low**: Set the TTL for your SPF TXT record to at least **3600 seconds** (one hour) to avoid DNS lookup timeouts.

> [!TIP]
> Use the [Microsoft Remote Connectivity Analyzer](https://testconnectivity.microsoft.com) to validate your SPF record.

For complete setup and troubleshooting instructions, see [Set up SPF to identify valid email sources for your Microsoft 365 domain](email-authentication-spf-configure.md).

### Troubleshoot DKIM

DKIM uses a cryptographic signature in the message header to verify the message wasn't tampered with in transit. Common issues include:

- **CNAME records not published**: After you enable DKIM in the Defender portal, create two CNAME records at your domain registrar. For common mistakes and provider-specific examples, see [Troubleshoot DKIM DNS configuration](email-authentication-dkim-configure.md#troubleshoot-dkim-dns-configuration).
- **Body hash failure after modification**: Intermediary services (for example, mailing lists or transport rules) that modify the message body after DKIM signing cause DKIM failure. Consider configuring the intermediary as a [trusted ARC sealer](email-authentication-arc-configure.md).
- **Key rotation**: Rotate DKIM signing keys regularly. Use the `Rotate-DkimSigningConfig` cmdlet in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell).

For complete setup instructions, see [Set up DKIM to sign mail from your Microsoft 365 domain](email-authentication-dkim-configure.md).

### Troubleshoot DMARC

DMARC builds on SPF and DKIM to verify domain alignment with the From address. Common issues include:

- **Domain misalignment**: DMARC requires that either SPF or DKIM passes **and** the authenticated domain aligns with the From address domain.
- **Non-Microsoft services failing DMARC**: Add the service to your SPF record, or configure the service to DKIM-sign with your domain (preferred). If those options aren't possible, use a subdomain for that service with a separate DMARC record.
- **Forwarding scenarios**: Forwarded messages commonly fail DMARC because forwarding breaks SPF. Configure [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) or [trusted ARC sealers](email-authentication-arc-configure.md) to preserve authentication results.

For complete setup instructions, see [Set up DMARC to validate the From address domain](email-authentication-dmarc-configure.md).

## Diagnostic tools

Use the following tools to diagnose email authentication issues:

|Tool|Purpose|
|---|---|
|**Message header analyzer**|Parse authentication results from message headers (SPF, DKIM, DMARC, composite authentication). Available at <https://mha.azurewebsites.net/>.|
|**Microsoft Remote Connectivity Analyzer**|Test SPF, DKIM, and DMARC configuration for your domain. Available at <https://testconnectivity.microsoft.com>.|
|**Message trace**|Track message delivery and view authentication results in the Exchange admin center (EAC). For more information, see [Message trace in the modern EAC](/exchange/monitoring/trace-an-email-message/message-trace-modern-eac).|
|**Spoof intelligence insight**|View senders that are spoofing your domain and allow or block them. For more information, see [Spoof intelligence insight](anti-spoofing-spoof-intelligence.md).|

## Read authentication results in message headers

To diagnose authentication failures, examine the `Authentication-Results` header in the affected message. For a complete description of all fields and reason codes, see [Authentication-Results message header](message-headers-eop-mdo.md#authentication-results-message-header).

### Example header

```text
Authentication-Results: spf=fail (sender IP is 203.0.113.50)
 smtp.mailfrom=contoso.com; dkim=pass (signature was verified)
 header.d=contoso.com; dmarc=fail action=quarantine
 header.from=contoso.com; compauth=fail reason=000
```

### Key fields

|Field|Possible values|Meaning|
|---|---|---|
|`spf`|`pass`, `fail`, `softfail`, `none`, `temperror`, `permerror`|Whether SPF validation passed for the sending IP.|
|`dkim`|`pass`, `fail`, `none`|Whether DKIM signature verification succeeded.|
|`dmarc`|`pass`, `fail`, `bestguesspass`, `none`|Whether DMARC validation passed (requires SPF or DKIM pass with alignment).|
|`compauth`|`pass`, `fail`, `softpass`, `none`|Whether the message passed Microsoft's composite authentication check (combines SPF, DKIM, and other signals).|
|`reason`|`000`, `001`, `002`, `010`, etc.|Reason code for the composite authentication result.|

## Related content

- [Email authentication in Microsoft 365](email-authentication-about.md)
- [Set up SPF](email-authentication-spf-configure.md)
- [Set up DKIM](email-authentication-dkim-configure.md)
- [Set up DMARC](email-authentication-dmarc-configure.md)
- [Configure trusted ARC sealers](email-authentication-arc-configure.md)
- [Anti-spam message headers](message-headers-eop-mdo.md)
- [Spoof settings in anti-phishing policies](anti-phishing-policies-about.md#spoof-settings)
