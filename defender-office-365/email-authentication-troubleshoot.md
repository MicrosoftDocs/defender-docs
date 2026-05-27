---
title: Troubleshoot email authentication in Microsoft 365
description: Troubleshoot SPF, DKIM, and DMARC email authentication failures in Exchange Online and Microsoft 365 with quick-reference tables and detailed guidance.
author: chrisda
ms.author: chrisda
ms.date: 05/26/2026
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

## Combined failure scenarios

When multiple email authentication protocols fail simultaneously, troubleshooting requires a systematic approach. Use the following scenarios to diagnose and resolve combined failures.

### SPF and DKIM both fail

**Example header**:

```text
Authentication-Results: spf=fail smtp.mailfrom=contoso.com;
 dkim=fail header.d=contoso.com; dmarc=fail action=quarantine;
 compauth=fail reason=000
```

**Analysis**: Both SPF and DKIM authentication failed, so DMARC can't pass (DMARC needs at least one aligned pass). The message is likely quarantined or rejected.

**Troubleshooting steps**:

1. Identify the sending IP address in the [message headers](https://support.microsoft.com/office/cd039382-dc6e-4264-ac74-c048563d212c) or by using `Get-MessageTrace`.
1. Verify that the sending IP is included in the domain's SPF record.
1. Verify that DKIM signing is enabled and the DKIM DNS CNAME records exist.
1. Check whether an email gateway is modifying messages (which breaks DKIM) or sending from an IP that isn't in the SPF record.

**Fix priority**:

1. Fix SPF first (DNS change only; fastest fix). See [Set up SPF](email-authentication-spf-configure.md).
1. Fix DKIM second (might need Microsoft 365 and DNS changes). See [Set up DKIM](email-authentication-dkim-configure.md).
1. Verify DMARC alignment. See [Set up DMARC](email-authentication-dmarc-configure.md).
1. If a gateway is involved, implement [ARC](email-authentication-arc-configure.md).

### SPF passes but DMARC fails due to alignment

**Example header**:

```text
Authentication-Results: spf=pass smtp.mailfrom=service.contoso.com;
 dkim=fail header.d=contoso.com;
 dmarc=fail (SPF not aligned);
 compauth=fail reason=001
```

**Analysis**: SPF passes but the SPF domain doesn't align with the From address domain. DKIM also fails. DMARC needs at least one aligned pass, so it fails.

**Common cause**: Forwarding or relay scenario where the envelope sender domain differs from the From address domain.

**Fix**: Enable [DKIM signing](email-authentication-dkim-configure.md) for the From address domain. DKIM alignment provides the aligned pass that DMARC needs.

[Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

```powershell
Set-DkimSigningConfig -Identity contoso.com -Enabled $true
```

### Gateway or relay modifying messages

**Example header**:

```text
Authentication-Results: spf=pass smtp.mailfrom=gateway.fabrikam.com;
 dkim=fail (body hash did not verify) header.d=contoso.com;
 dmarc=fail (no aligned pass)
```

**Analysis**: The message passed through a gateway or security service that modified the message body (for example, by adding a disclaimer or scan notice). The modification invalidated the DKIM signature. SPF passes for the gateway domain but doesn't align with the From domain.

**Fix options (in priority order)**:

1. **Configure ARC on the gateway** (recommended): ARC preserves authentication results through message modification. See [Configure trusted ARC sealers](email-authentication-arc-configure.md).
1. **Configure the gateway to DKIM-sign after modification**: The gateway adds its own valid DKIM signature with your domain after any content changes.
1. **Add the gateway to Enhanced Filtering for Connectors**: Preserves the original sending IP for authentication evaluation. See [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors).

### Forwarding breaks authentication

**Example header**:

```text
Authentication-Results: spf=fail (sender IP is 10.0.1.x)
 smtp.mailfrom=woodgrovebank.com;
 dkim=pass header.d=woodgrovebank.com;
 dmarc=fail (SPF failed, DKIM not aligned)
```

**Analysis**: A forwarded message fails SPF because the forwarding server's IP isn't in the original sender's SPF record. DKIM might pass if the message wasn't modified, but alignment with the From domain might still fail.

**Fix**: Configure [trusted ARC sealers](email-authentication-arc-configure.md). Microsoft 365 already trusts ARC seals from major providers (for example, Google and Yahoo). If authentication still fails after ARC is in place, review your anti-phishing policy settings.

## Common real-world scenarios

### Send on behalf of in Outlook

**What the user sees**:

```text
From: user@contoso.com on behalf of user@contoso.com
```

**Root cause**: SPF `softfail` or `fail` because the sending IP isn't authorized in the [SPF record](email-authentication-spf-configure.md).

**Fix**: Add the sending IP or service include to the SPF record:

```text
v=spf1 ip4:<sending-IP> include:spf.protection.outlook.com ~all
```

### Marketing automation fails DMARC

**Example header**:

```text
Authentication-Results: spf=pass smtp.mailfrom=northwindtraders.com;
 dkim=pass header.d=northwindtraders.com;
 dmarc=fail (no aligned pass) header.from=contoso.com
```

**Root cause**: The marketing service (for example, Marketo or HubSpot) sends from its own infrastructure. SPF and DKIM both pass for the service domain, but neither aligns with the From address domain (`contoso.com`).

**Fix options**:

1. **Configure the service to [DKIM-sign with your domain](email-authentication-dkim-configure.md)** (preferred).
1. **Add the service's SPF include to your domain's SPF record** (provides aligned SPF pass).
1. **Use a subdomain for marketing mail** (for example, `marketing.contoso.com`):
   - Configure SPF and DKIM for the subdomain at the service.
   - Set relaxed alignment in your DMARC record: `aspf=r; adkim=r`.
   - Add a subdomain policy to DMARC: `v=DMARC1; p=quarantine; sp=none; rua=mailto:dmarc@contoso.com`.

### Cloud email security gateway breaks authentication

**Example header**:

```text
Authentication-Results: spf=pass smtp.mailfrom=tailspintoys.com;
 dkim=fail (body hash did not verify) header.d=contoso.com;
 dmarc=fail
```

**Root cause**: A non-Microsoft email security service (for example, Proofpoint or Mimecast) modifies the message, which breaks DKIM. The gateway's SPF passes for its own domain but doesn't align with the From domain.

**Fix options (in priority order)**:

1. **Configure the gateway for ARC** (recommended; requires gateway support).
1. **Configure Enhanced Filtering for Connectors** to skip the gateway's IP in authentication evaluation. See [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors).
1. **Configure the gateway to preserve or re-sign DKIM** after processing.

### Partner domain emails quarantined despite valid authentication

**Example header**:

```text
Authentication-Results: spf=pass smtp.mailfrom=wingtiptoys.com;
 dkim=pass header.d=wingtiptoys.com;
 dmarc=pass header.from=wingtiptoys.com;
 compauth=fail reason=001
```

**Root cause**: All standard authentication passes, but Microsoft's [composite authentication](email-authentication-about.md#composite-authentication) still fails. [Spoof intelligence](anti-spoofing-spoof-intelligence.md) is likely flagging the partner domain due to cross-tenant trust issues.

**Fix**: Add the partner domain to the spoof allow list by using the Tenant Allow/Block List. [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

```powershell
New-TenantAllowBlockListSpoofItems -SpoofedUser "*@wingtiptoys.com" -SendingInfrastructure wingtiptoys.com -SpoofType External -Action Allow
```

## Decision matrix

Use the following table to quickly identify the required action based on the authentication state:

|Authentication state|SPF|DKIM|DMARC|Required action|
|---|---|---|---|---|
|All pass|pass|pass|pass|No action needed.|
|SPF only fails|fail|pass|pass|Fix the SPF record. Add the sending IP or include.|
|DKIM only fails|pass|fail|pass|Enable DKIM and add DNS records.|
|DMARC fails (alignment)|pass|pass|fail|Fix domain alignment (SPF or DKIM domain must match From domain).|
|SPF + DKIM fail|fail|fail|fail|Fix both SPF and DKIM urgently.|
|No authentication|none|none|none|Set up all three protocols.|
|Gateway issue|varies|fail|fail|Implement ARC or fix gateway configuration.|

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
Authentication-Results: spf=fail (sender IP is 192.168.50.50)
 smtp.mailfrom=contoso.com; dkim=pass (signature was verified)
 header.d=contoso.com; dmarc=fail action=quarantine
 header.from=contoso.com; compauth=fail reason=000
```

### Key fields

|Field|Possible values|Meaning|
|---|---|---|
|`spf`|`pass`, `fail`, `softfail`, `neutral`, `none`, `temperror`, `permerror`|Whether SPF validation passed for the sending IP.|
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
