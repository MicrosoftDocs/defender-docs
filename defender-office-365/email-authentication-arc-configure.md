---
title: Configure trusted ARC sealers
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.localizationpriority: high
ms.collection:
  - m365-security
  - tier2
ms.custom:
  - msecd-doc-authoring-1016
  - seo-marvel-apr2020
  - sfi-ga-nochange
  - sfi-image-nochange
description: Configure trusted ARC sealers in Microsoft 365 so messages modified by legitimate intermediary services retain original authentication results and avoid unnecessary SPF, DKIM, and DMARC failures.
ms.service: defender-office-365
ms.date: 07/03/2026
ai-usage: ai-assisted
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As an IT administrator responsible for Microsoft 365 email security, I want step-by-step instructions to configure trusted ARC sealers and troubleshoot ARC-related authentication failures so legitimate messages from intermediary email services aren't incorrectly rejected or sent to Junk Email.
---

# Configure trusted ARC sealers

[Email authentication](email-authentication-about.md) helps validate mail sent to and from your Microsoft 365 organization to prevent spoofed senders that are used in business email compromise (BEC), ransomware, and other phishing attacks.

But some legitimate email services might modify messages before they're delivered to your Microsoft 365 organization. Modifying inbound messages in transit can and likely will cause the following email authentication failures in Microsoft 365:

- SPF fails because of the new message source (IP address).
- DKIM fails because of content modification.
- DMARC fails because of the SPF and DKIM failures.

Authenticated Received Chain (ARC) helps reduce inbound email authentication failures from message modification by legitimate email services. ARC preserves the original email authentication information at the email service. You can configure your Microsoft 365 organization to trust the service that modified the message, and to use that original information in email authentication checks.

<a name="when-to-use-trusted-arc-sealers"></a>
## When to use trusted ARC sealers

A Microsoft 365 organization needs to identify trusted ARC sealers only when messages delivered to Microsoft 365 recipients are regularly affected in the following ways:

- The intermediary service modifies the message header or email content.
- The message modifications cause authentication to fail for other reasons (for example, by removing attachments).

After an admin adds a trusted ARC sealer in the Defender portal, Microsoft 365 uses the original email authentication information that the ARC sealer provides to validate the messages sent through the service into Microsoft 365.

> [!TIP]
> Add only legitimate, required services as trusted ARC sealers in your Microsoft 365 organization. Adding only legitimate services helps affected messages pass email authentication checks, and prevents legitimate messages from being delivered to the Junk Email folder, quarantined, or rejected due to email authentication failures.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>. To go directly to the **Email authentication settings** page, use <https://security.microsoft.com/authentication>.

- To connect to Exchange Online PowerShell, see [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell).

- You need to be assigned permissions before you can add or manage trusted ARC sealers. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/Security settings/Core Security settings (manage)** or **Authorization and settings/Security settings/Core Security settings (read)**.
  - [Exchange Online permissions](/exchange/permissions-exo/permissions-exo): Membership in the **Organization Management** or **Security Administrator** role groups.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>. Members of the Security Administrator role can't access email authentication settings in the Defender portal.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

## Use the Microsoft Defender portal to add trusted ARC sealers

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat policies** \> **Email Authentication Settings** in the **Rules** section \> **ARC** . Or, to go directly to the **Email authentication settings** page, use <https://security.microsoft.com/authentication>.

2. On the **Email authentication settings** page, verify that the **ARC** tab is selected, and then select :::image type="icon" source="media/defender-portal-icon-create.png" border="false"::: **Add**.

   > [!TIP]
   > If **Trusted sealers** are already listed on the **ARC** tab, select :::image type="icon" source="media/defender-portal-icon-edit.png" border="false"::: **Edit**.

3. In the **Add trusted ARC sealers** flyout that opens, enter the trusted signing domain in the box (for example, fabrikam.com).

   The domain name must match the domain that's shown in the **d** value in the **ARC-Seal** and **ARC-Message-Signature** headers in affected messages. Use the following methods to view the message header:

   - [View internet message headers in Outlook](https://support.microsoft.com/office/cd039382-dc6e-4264-ac74-c048563d212c).
   - Use the Message Header Analyzer at <https://mha.azurewebsites.net>.

   Repeat this step as many times as necessary. To remove an existing entry, select :::image type="icon" source="media/defender-portal-icon-remove-selection.png" border="false"::: next to the entry.

   When you're finished in the **Add trusted ARC sealers** flyout, select **Save**.

<a name="use-exchange-online-powershell-to-add-trusted-arc-sealers"></a>
## Use Exchange Online PowerShell to add trusted ARC sealers

If you'd rather use PowerShell to view, add, or remove trusted ARC sealers, connect to [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) to run the following commands.

- **View existing trusted ARC sealers**: Run the following command to check which trusted ARC sealers are currently configured in your organization:

  ```powershell
  Get-ArcConfig
  ```

  If no trusted ARC sealers are configured, the command returns no results.

- **Add or remove trusted ARC sealers**

  To _replace_ any existing ARC sealers with the values you specify, use the following syntax:

  ```powershell
  Set-ArcConfig -Identity [TenantId\]Default -ArcTrustedSealers "Domain1","Domain2",..."DomainN"
  ```

  The TenantId\ value isn't required in your own organization, only in delegated organizations. It's a GUID that's visible in many admin portal URLs in Microsoft 365 (the `tid=` value). For example, aaaabbbb-0000-cccc-1111-dddd2222eeee.

  This example configures "cohovineyard.com" and "tailspintoys.com" as the only trusted ARC sealers in the organization.

  ```powershell
  Set-ArcConfig -Identity Default -ArcTrustedSealers "cohovineyard.com","tailspintoys.com"
  ```

  To preserve existing values, be sure to include the ARC sealers that you want to keep along with the new ARC sealers that you want to add.

  To add or remove ARC sealers without affecting the other entries, see the examples in [Set-ArcConfig](/powershell/module/exchangepowershell/set-arcconfig#examples).

## Vendor-specific ARC sealer configuration

When you add a trusted ARC sealer in Microsoft 365, you enter the domain shown in the **d** value of the **ARC-Seal** header. The following table lists the ARC sealer domains for common email security vendors:

|Vendor|ARC sealer domain (`d=` value)|Typical selector (`s=` value)|Notes|
|---|---|---|---|
|**Proofpoint**|`pphosted.com`|`arcselector`|Used by Proofpoint Protection Server (PPS) and Proofpoint Essentials.|
|**Mimecast**|`mimecast.com`|`arc-2018`|Used by all Mimecast Email Security gateway deployments.|
|**Barracuda**|`barracudanetworks.com`|`arc1`|Used by Barracuda Email Gateway Defense and Email Security Gateway.|
|**Sophos**|`sophos.com`|`arc`|Used by Sophos Central Email Security.|

> [!IMPORTANT]
> The ARC sealer domain is **not** your organization's domain. It's the vendor's signing domain that appears in the `d=` field of the ARC-Seal header. Always verify the actual `d=` value from a message header before you configure the trusted sealer.

<a name="proofpoint"></a>
### Configure trusted ARC sealers for Proofpoint

Proofpoint Protection Server (PPS) adds ARC headers when messages are processed through the gateway. The ARC-Seal header uses `d=pphosted.com`.

1. **Verify the ARC sealer domain from a message header**: Locate the `d=` value in the `ARC-Seal` header to identify the ARC sealer domain. For Proofpoint, look for the following pattern in message headers:

   ```text
   ARC-Seal: i=1; a=rsa-sha256; d=pphosted.com; s=arcselector;
     t=1657920000; cv=none;
     b=<signature>
   ```

1. **Add the trusted ARC sealer in Microsoft 365**: [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

   ```powershell
   Set-ArcConfig -Identity Default -ArcTrustedSealers "pphosted.com"
   ```

   > [!NOTE]
   > Some Proofpoint deployments use a custom domain for ARC sealing (for example, `proofpoint.com` or a customer-specific domain). Always check actual message headers to confirm the `d=` value before you configure trusted sealers.

<a name="mimecast"></a>
### Configure trusted ARC sealers for Mimecast

Mimecast Email Security adds ARC headers when it processes inbound and outbound mail. The ARC-Seal header uses `d=mimecast.com`.

1. **Verify the ARC sealer domain from a message header**: Look for the following pattern in message headers:

   ```text
   ARC-Seal: i=1; a=rsa-sha256; t=1623745127; cv=none;
     d=mimecast.com; s=arc-2018;
     b=<signature>
   ```

1. **Add the trusted ARC sealer in Microsoft 365**: [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

   ```powershell
   Set-ArcConfig -Identity Default -ArcTrustedSealers "mimecast.com"
   ```

   > [!TIP]
   > If you're migrating from Mimecast to Microsoft 365 native protection, keep the Mimecast trusted ARC sealer configured until you fully cut over MX records and all queued messages are delivered.

<a name="barracuda"></a>
### Configure trusted ARC sealers for Barracuda

Barracuda Email Gateway Defense and Email Security Gateway add ARC headers using `d=barracudanetworks.com`.

1. **Verify the ARC sealer domain from a message header**: Locate the `d=` value in the `ARC-Seal` header to confirm the Barracuda sealing domain. Look for the following pattern in message headers:

   ```text
   ARC-Seal: i=1; a=rsa-sha256; d=barracudanetworks.com; s=arc1;
     t=1680000000; cv=none;
     b=<signature>
   ```

1. **Add the trusted ARC sealer in Microsoft 365**: [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

   ```powershell
   Set-ArcConfig -Identity Default -ArcTrustedSealers "barracudanetworks.com"
   ```

<a name="sophos"></a>
### Configure trusted ARC sealers for Sophos

Sophos Central Email Security adds ARC headers using `d=sophos.com`.

1. **Verify the ARC sealer domain from a message header**: Locate the `d=` value in the `ARC-Seal` header to confirm the Sophos sealing domain. Look for the following pattern in message headers:

   ```text
   ARC-Seal: i=1; a=rsa-sha256; t=1686324586; cv=none;
     d=sophos.com; s=arc;
     b=<signature>
   ```

1. **Add the trusted ARC sealer in Microsoft 365**: [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

   ```powershell
   Set-ArcConfig -Identity Default -ArcTrustedSealers "sophos.com"
   ```

<a name="multiple-vendors"></a>
### Configure trusted ARC sealers for multiple vendors

If your organization uses multiple email services that add ARC seals, [connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and add all vendor domains in a single command.

> [!IMPORTANT]
> The **-ArcTrustedSealers** parameter _replaces_ all existing entries. To preserve existing trusted sealers, include them in the command along with any new domains you want to add.

> [!CAUTION]
> Only add vendors that you actively use and trust. Adding unnecessary ARC sealers increases your attack surface because a compromised vendor could pass spoofed messages through your authentication checks.

```powershell
Set-ArcConfig -Identity Default -ArcTrustedSealers "pphosted.com","mimecast.com","barracudanetworks.com","sophos.com"
```

### Find your vendor's ARC sealer domain

If your vendor isn't listed in the vendor ARC sealer domain table, use the following steps to identify the correct ARC sealer domain:

1. Send a test email through the intermediary service to a Microsoft 365 mailbox.
1. Open the message headers (in Outlook: **File** \> **Properties** \> **Internet Headers**, or use the [Message Header Analyzer](https://mha.azurewebsites.net)).
1. Search for `ARC-Seal:` in the headers.
1. Note the `d=` value. This value is the domain to add as a trusted ARC sealer.

## Validate a trusted ARC sealer

If there's an ARC seal from a service before the message reaches Microsoft 365, check the message header for the latest ARC headers after the message is delivered.

In the last **ARC-Authentication-Results** header, look for `arc=pass` and `oda=1`. These values indicate:

- The previous ARC has been verified.
- The previous ARC sealer is trusted.
- The previous pass result can be used to override the current DMARC failure.

The following example shows an **ARC-Authentication-Results** header where `arc=pass` and `oda=1` confirm a trusted ARC sealer:

```text
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
172.17.17.17) smtp.rcpttodomain=microsoft.com
smtp.mailfrom=sampledoamin.onmicrosoft.com; dmarc=bestguesspass action=none
header.from=sampledoamin.onmicrosoft.com; dkim=none (message not signed);
arc=pass (0 oda=1 ltdi=1
spf=[1,1,smtp.mailfrom=sampledoamin.onmicrosoft.com]
dkim=[1,1,header.d=sampledoamin.onmicrosoft.com]
dmarc=[1,1,header.from=sampledoamin.onmicrosoft.com])
```

To check whether the ARC result was used to override a DMARC failure, look for `compauth=pass` and `reason=130` in the last **Authentication-Results** header. The following example shows an **Authentication-Results** header where composite authentication passed because of a trusted ARC sealer (`reason=130`):

```text
Authentication-Results: spf=fail (sender IP is 10.10.10.10)
smtp.mailfrom=contoso.com; dkim=fail (body hash did not verify)
header.d=contoso.com;dmarc=fail action=none
header.from=contoso.com;compauth=pass reason=130
```

> [!NOTE]
> The ARC result **pass** from a **trusted ARC sealer** can potentially override failures in SPF, DKIM, or DMARC caused by message modification during transit. However, the final spoofing determination is based on the [composite authentication](email-authentication-about.md#composite-authentication) (CompAuth) outcome. Messages that fail ARC might still be delivered if they pass SPF, DKIM, DMARC, and composite authentication evaluations.

## Trusted ARC sealer mail flow diagrams

The diagrams in this section contrast mail flow and the effect on email authentication results with and without a trusted ARC sealer. In both diagrams, the Microsoft 365 organization uses a legitimate email service that modifies inbound mail before it's delivered to Microsoft 365. This modification interrupts mail flow, which can cause email authentication failures by changing the source IP and updating the email message header.

The following mail-flow diagram shows the result _without_ a trusted ARC sealer:

:::image type="content" source="media/m365d-indirect-traffic-flow-without-trusted-arc-sealer.PNG" alt-text="Contoso publishes SPF, DKIM, and DMARC. A sender using SPF sends email from inside contoso.com to fabrikam.com, and this message passes through a legitimate non-Microsoft service that modifies the sending IP address in the email header. During the DNS check at Microsoft 365, the message fails SPF due to the altered IP, and fails DKIM because the content was modified. DMARC fails because of the SPF and DKIM failures. The message is delivered to the Junk Email folder, quarantined, or rejected.":::

The following mail-flow diagram shows the result _with_ a trusted ARC sealer:

:::image type="content" source="media/m365d-indirect-traffic-flow-with-trusted-arc-sealer.PNG" alt-text="Contoso publishes SPF, DKIM, and DMARC, but also configures the required trusted ARC sealers. A sender using SPF sends email from inside contoso.com to fabrikam.com, and this message passes through a legitimate non-Microsoft service that modifies the sending IP address in the email header. The service uses ARC sealing, and because the service is defined as a trusted ARC sealer in Microsoft 365, the modification is accepted. SPF fails for the new IP address. DKIM fails because of the content modification. DMARC fails because of the earlier failures. But ARC recognizes the modifications, issues a Pass, and accepts the changes. Spoof also receives a pass. The message is delivered to the Inbox.":::

## Common ARC failure scenarios

When ARC doesn't work as expected, use the following troubleshooting reference.

### Quick reference: ARC failure symptoms

The following table lists common ARC failure symptoms, their likely causes, and recommended resolutions.

|Symptom|Likely cause|Resolution|
|---|---|---|
|`arc=fail` in ARC-Authentication-Results|ARC sealer domain not added as trusted, or wrong domain configured.|Verify the `d=` value in the ARC-Seal header and add it to trusted sealers.|
|`arc=none` in ARC-Authentication-Results|Intermediary service isn't adding ARC headers.|Contact your vendor to enable ARC signing.|
|`oda=0` despite `arc=pass`|ARC sealer domain isn't in the trusted sealers list.|Add the correct domain using `Set-ArcConfig`.|
|`compauth=fail reason=000` despite trusted sealer|ARC chain validation failed (broken chain).|Check for chain integrity issues (see [Broken ARC chain](#broken-arc-chain-cvfail)).|
|`dmarc=fail` and no ARC headers present|Message didn't pass through an ARC-capable intermediary.|ARC can't help. Fix SPF/DKIM at the source.|
|Messages quarantined despite ARC pass|Anti-spam policy action overriding ARC result.|Review quarantine policy. ARC overrides DMARC only, not spam filtering.|

### Wrong ARC sealer domain configured

**Problem**: You added your own domain (for example, `contoso.com`) instead of the vendor's ARC sealing domain.

The message headers show the vendor's actual ARC sealing domain. Verify the `d=` value in the `ARC-Seal` header to identify the correct domain to configure as a trusted sealer:

```text
ARC-Seal: i=1; a=rsa-sha256; d=pphosted.com; s=arcselector;
  cv=none; b=<signature>
```

But when you run **Get-ArcConfig** in Exchange Online PowerShell, the output shows your own domain is configured instead of the vendor's ARC sealing domain:

```text
ArcTrustedSealers : {contoso.com}
```

**Resolution**: Use the vendor's ARC sealing domain. For example:

```powershell
Set-ArcConfig -Identity Default -ArcTrustedSealers "pphosted.com"
```

### Intermediary service not adding ARC headers

**Problem**: Messages pass through your gateway but contain no ARC headers. The intermediary service either doesn't support ARC or ARC isn't enabled.

**Diagnosis**: Search message headers for `ARC-Seal:`. If no ARC-Seal header exists, the intermediary isn't sealing.

**Resolution**: Enable ARC signing in your vendor's management console:

|Vendor|How to enable ARC|
|---|---|
|Proofpoint|Enable ARC in **Email Protection** \> **Email Routing** \> **Outbound** settings.|
|Mimecast|Enable via **Administration** \> **Gateway** \> **Policies** \> **Definitions** \> **ARC Signing**.|
|Barracuda|ARC is enabled by default in Email Gateway Defense. Verify in **Inbound Settings** \> **Anti-Phishing**.|
|Sophos|Enable in **Sophos Central** \> **Email Security** \> **Settings** \> **ARC**.|

> [!IMPORTANT]
> If your vendor doesn't support ARC, consider alternative solutions:
>
> - Configure an [Exchange mail flow rule (transport rule) to skip spam filtering](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl) for messages from the service's IP addresses.
> - Add the service's sending IPs to the [connection filter IP Allow List](connection-filter-policies-configure.md).
> - Use [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) (skip listing) to preserve original authentication.

### Broken ARC chain (cv=fail)

**Problem**: The ARC chain validation shows `cv=fail`, meaning a previous ARC seal in the chain couldn't be verified.

The following example shows an **ARC-Seal** header where `cv=fail` indicates a broken ARC chain:

```text
ARC-Seal: i=2; a=rsa-sha256; d=mimecast.com; s=arc-2018;
  cv=fail; b=<signature>
```

This failure typically has the following causes:

- A previous intermediary modified the message after adding its ARC seal (breaking the chain).
- DNS issues prevented lookup of the ARC sealer's public key.
- The ARC public key was rotated but cached DNS records haven't expired.

**Resolution**: Use the following steps to diagnose and fix the broken chain:

1. Check the `cv=` value at each ARC instance (`i=1`, `i=2`, etc.) to identify where the chain broke.
1. Verify that the ARC sealer's public key is published in DNS. For example, use `nslookup -type=TXT arcselector._domainkey.pphosted.com` to query the key record.
1. If DNS returns no result, contact the vendor about their ARC key publication.
1. If the chain breaks between two services you control, ensure message modifications happen before ARC sealing, not after.

### ARC passes but messages still go to Junk Email

**Problem**: ARC validation passes (`arc=pass`, `compauth=pass reason=130`), but messages are still delivered to the Junk Email folder.

**Explanation**: ARC overrides DMARC authentication failures only. It doesn't bypass:

- Content-based spam filtering (SCL values from content analysis).
- Bulk email filtering (BCL threshold).
- Anti-spam policy actions.
- Mail flow rule actions.
- Safe/Blocked sender lists.

**Diagnosis**: Review the `X-Forefront-Antispam-Report` header to determine whether content-based spam filtering caused the message to go to Junk Email independent of ARC:

```text
X-Forefront-Antispam-Report: CIP:10.10.10.10; CTRY:US; LANG:en; SCL:5;
  SFV:SPM; H:mail.fabrikam.com; PTR:mail.fabrikam.com; CAT:SPM;
```

If `CAT:SPM` or `SCL:5` or higher, the message was filtered as spam by content filtering, which is independent of ARC.

**Resolution**: Try the following options to resolve spam filtering:

- [Create a mail flow rule to set SCL to -1](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl) for messages from trusted senders or IP addresses.
- Add the sender domain to an [anti-spam policy allow list](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-modify-anti-spam-policies).
- [Submit the message as a false positive](submissions-admin.md#report-good-email-to-microsoft) via the Microsoft Defender portal.

### CompAuth reason codes reference

The following table summarizes the composite authentication (CompAuth) reason codes that appear in the **Authentication-Results** header.

|Reason code|Description|
|---|---|
|`000`|Message failed composite authentication (explicit fail).|
|`001`|Message failed composite authentication (implicit fail).|
|`002`|Message has an explicit SPF/DKIM bypass that prevents composite auth evaluation.|
|`010`|Message was excluded from DMARC filtering (for example, sent to self).|
|`1xx`|Message failed DMARC with the action determined by the DMARC policy.|
|`130`|**ARC override**: composite auth passed because of a trusted ARC sealer.|
|`2xx`|Message soft-passed composite authentication (source was suspicious).|
|`3xx`|Composite authentication not checked.|
|`4xx`|Message bypassed composite authentication.|

> [!TIP]
> After you add or modify trusted ARC sealers, allow up to 30 minutes for the configuration to take effect. Test with new messages sent after this period.

## Next steps

Check your ARC headers with Message Header Analyzer at <https://mha.azurewebsites.net>.

Set up [SPF](email-authentication-spf-configure.md), [DKIM](email-authentication-dkim-configure.md), and [DMARC](email-authentication-dmarc-configure.md) for your domain.

To diagnose and fix email authentication failures, see [Troubleshoot email authentication in Microsoft 365](email-authentication-troubleshoot.md).
