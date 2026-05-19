---
title: Set up DMARC to validate email in Microsoft 365
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.date: 06/25/2025
ms.custom: msecd-doc-authoring-1012
ms.localizationpriority: high
ms.assetid: 4a05898c-b8e4-4eab-bd70-ee912e349737
ms.collection:
  - m365-security
  - tier1
description: Learn how to configure Domain-based Message Authentication, Reporting, and Conformance (DMARC) to validate messages sent from your organization.
ai-usage: ai-assisted
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As an IT or security administrator, I want stepwise guidance to create and roll out DMARC TXT records (and associated monitoring) so I can validate the From address domain, reduce spoofing, and safely tighten policy over time.
---

# Set up DMARC to validate the From address domain for cloud senders

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Domain-based Message Authentication, Reporting, and Conformance (DMARC) is a method of [email authentication](email-authentication-about.md) to validate mail sent from your Microsoft 365 organization. This validation helps prevent spoofed senders that are used in business email compromise (BEC), ransomware, and other phishing attacks.

You enable DMARC for a domain by creating a TXT record in DNS. DMARC validation of an email message involves the following elements:

- **Verify the domains in the MAIL FROM and FROM addresses align**: [SPF](email-authentication-spf-configure.md) and [DKIM](email-authentication-dkim-configure.md) don't require the domains in the following email addresses to "align" (match):
  - **The MAIL FROM address**: The email address used in the transmission of the message between SMTP email servers. This address is also known as the `5321.MailFrom` address, P1 sender, or envelope sender.
  - **The From address**: The email address in the **From** header field shown as the message sender in email clients. This address is also known as the `5322.From` address or P2 sender.

   For more information about how these email addresses can be in different domains and used for spoofing, see [Why internet email needs authentication](email-authentication-about.md#why-internet-email-needs-authentication).

  - DMARC uses the result from SPF to verify both of the following conditions:
    - The message came from an authorized source for the domain used in the MAIL FROM address (the basic requirement of SPF).
    - The domains in the MAIL FROM and From addresses in the message are aligned. This result effectively requires that valid sources for the message must be in the From address domain.

  - DMARC uses the result from DKIM to verify the domain that signed the message (the **d=** value in a **DKIM-Signature** header field as validated by the **s=** selector value) aligns with the domain in the From address.

  A message passes DMARC if one or both of the described SPF or DKIM checks pass. A message fails DMARC if both of the described SPF and DKIM checks fail.

- **DMARC policy**: Specifies what to do with messages that fail DMARC (reject, quarantine, or no instruction).

- **DMARC reports**: Specifies where to send reports:
  - Aggregate reports (a periodic summary of positive and negative DMARC results).
  - Forensic reports (also known as _Failure reports_; nearly immediate DMARC failure results similar to a non-delivery report or bounce message).

Before you get started, here's what you need to know about DMARC in Microsoft 365 based on your email domain:

- **If you use only the Microsoft Online Email Routing Address (MOERA) domain for email (for example, contoso.onmicrosoft.com)**: Although SPF and DKIM are already configured for your \*.onmicrosoft.com domain, you need to create the DMARC TXT record for the \*.onmicrosoft.com domain in the Microsoft 365 admin center. For instructions, see [this section](#use-the-microsoft-365-admin-center-to-add-dmarc-txt-records-for-onmicrosoftcom-domains-in-microsoft-365) later in this article. For more information about \*.onmicrosoft.com domains, see [Why do I have an "onmicrosoft.com" domain?](/microsoft-365/admin/setup/domains-faq#why-do-i-have-an--onmicrosoft-com--domain).

- **If you use one or more custom domains for email (for example, contoso.com)**: If you haven't already, you need to configure SPF for all custom domains and subdomains that you use for email. You also need to configure DKIM signing using the custom domain or subdomain so the domain that's used to sign the message aligns with the domain in the From address. For instructions, see the following articles:
  - [Set up SPF to identify valid email sources for your custom cloud domains](email-authentication-spf-configure.md)
  - [Set up DKIM to sign mail from your cloud domain](email-authentication-dkim-configure.md)

  After that, you also need to configure the DMARC TXT records for your custom domains as described in this article. You also have the following considerations:

  - **Subdomains**:
    - For email services that aren't under your direct control (for example, bulk email services), use a subdomain (for example, marketing.contoso.com) instead of your main email domain (for example, contoso.com). You don't want issues with mail sent from those email services to affect the reputation of mail sent by users in your main email domain. For more information about adding subdomains, see [Can I add custom subdomains or multiple domains to Microsoft 365?](/microsoft-365/admin/setup/domains-faq#can-i-add-custom-subdomains-or-multiple-domains-to-microsoft-365).
    - Unlike SPF and DKIM, the DMARC TXT record for a domain automatically covers all subdomains (including nonexistent subdomains) that don't have their own DMARC TXT record. In other words, you can disrupt the inheritance of DMARC on a subdomain by creating a DMARC TXT record in that subdomain. But, each subdomain requires an SPF and DKIM record for DMARC.

  - **If you own registered but unused domains**: If you own registered domains that aren't used for email or anything at all (also known as _parked domains_), configure the DMARC TXT records in those domains to specify no email should ever come from those domains. **This directive includes the \*.onmicrosoft.com domain** if you aren't using it for email.

- **DMARC checks for _inbound_ mail might need help**: If you use an email service that modifies messages in transit before delivery into Microsoft 365, you might be able to identify the service as a trusted ARC sealer. Trusted ARC sealers prevent modified messages from automatically failing DMARC checks. For more information, see the [Next Steps](#next-steps) section at the end of this article.

The rest of this article covers DMARC TXT record creation, gradual rollout for custom domains, and inbound DMARC handling in Microsoft 365.

> [!TIP]
> To create the DMARC TXT record for your **\*.onmicrosoft.com domain** in the Microsoft 365 admin center, see [this section](#use-the-microsoft-365-admin-center-to-add-dmarc-txt-records-for-onmicrosoftcom-domains-in-microsoft-365) later in this article.
>
> There are no admin portals or PowerShell cmdlets in Microsoft 365 for you to manage DMARC TXT records in your **custom** domains. Instead, you create the DMARC TXT record at your domain registrar or DNS hosting service (often the same company).
>
> Instructions are provided to create the proof of domain ownership TXT record for Microsoft 365 at many domain registrars. You can use these instructions as a starting point to create DMARC TXT records. For more information, see [Add DNS records to connect your domain](/Microsoft-365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider).
>
> If you're unfamiliar with DNS configuration, contact your domain registrar and ask for help.

## Syntax for DMARC TXT records

DMARC TXT records are exhaustively described in [RFC 7489](https://datatracker.ietf.org/doc/html/rfc7489).

The basic syntax of the DMARC TXT record for a domain in Microsoft 365 is:

**Hostname**: `_dmarc`<br/>
**TXT value**: `v=DMARC1; <DMARC policy>; <Percentage of DMARC failed mail subject to DMARC policy>; <DMARC reports>`

or

**Hostname**: `_dmarc`<br/>
**TXT value**: `v=DMARC1; p=<reject | quarantine | none>; pct=<0-100>; rua=mailto:<DMARCAggregateReportURI>; ruf=mailto:<DMARCForensicReportURI>`

For example:

**Hostname**: `_dmarc`<br/>
**TXT value**: `v=DMARC1; p=reject; pct=100; rua=mailto:rua@contoso.com; ruf=mailto:ruf@contoso.com`

- The hostname value `_dmarc` is required.

- `v=DMARC1;` identifies the TXT record as a DMARC TXT record.

- **DMARC policy**: Tells the destination email system what to do with messages that fail DMARC as described earlier in this article:
  - `p=reject`: The messages should be rejected. What actually happens to the message depends on the destination email system, but the messages are typically discarded.
  - `p=quarantine`: The messages should be accepted but marked. What actually happens to the message depends on the destination email system. For example, the message might be quarantined as spam, delivered to the Junk Email folder, or delivered to the Inbox with an identifier added to the Subject or message body.
  - `p=none`: No suggested action for messages that fail DMARC. What happens to the message depends on the email protection features in the destination email system. You use this value for [testing and tuning of the DMARC policy](#set-up-dmarc-for-active-custom-domains-in-microsoft-365) as described later in this article.

  > [!TIP]
  > Outbound mail from domains in Microsoft 365 that fail DMARC checks by the destination email service is routed through the [High-risk delivery pool for outbound messages](outbound-spam-high-risk-delivery-pool-about.md) if the DMARC policy for the domain is `p=reject` or `p=quarantine`. There's no override for this behavior.

- **Percentage of failed DMARC mail subject to DMARC policy**: Tells the destination email system how many messages that fail DMARC (percentage) get the DMARC policy applied to them. For example, `pct=100` means all messages that fail DMARC get the DMARC policy applied to them. You use values less than 100 for [testing and tuning of the DMARC policy](#set-up-dmarc-for-active-custom-domains-in-microsoft-365) as described later in this article. If you don't use `pct=`, the default value is `pct=100`.

- **DMARC reports**:
  - **DMARC Aggregate report URI**: The `rua=mailto:` value identifies where to send the DMARC Aggregate report. The Aggregate report has the following properties:
    - The email messages that contain the Aggregate report are typically sent once per day (the report contains the DMARC results from the previous day). The Subject line contains the destination domain that sent the report (Submitter) and the source domain for the DMARC results (Report Domain).
    - The DMARC data is in an XML email attachment that's likely GZIP compressed. The XML schema is defined in [Appendix C of RFC 7489](https://datatracker.ietf.org/doc/html/rfc7489#appendix-C). The report contains the following information:
      - The IP addresses of servers or services that send mail using your domain.
      - Whether the servers or services pass or fail DMARC authentication.
      - The actions that DMARC takes on mail that fails DMARC authentication (based on the DMARC policy).

    > [!TIP]
    > The information in the Aggregate report can be vast and difficult to parse. To help make sense of the data, you can use the following options for DMARC reporting:
    >
    > - Create automation using PowerShell or Microsoft Power BI.
    > - Use an external service. For a list of services, search for DMARC in the Microsoft Intelligent Security Association (MISA) Catalog at <https://www.microsoft.com/misapartnercatalog>. The DMARC reporting services describe any custom values that are required in the DMARC TXT record.

  - **DMARC Forensic report URI**: The `ruf=mailto:` value identifies where to send the DMARC Forensic report (also known as the DMARC Failure report). The report is generated and sent immediately after a DMARC failure like a non-delivery report (also known as an NDR or bounce message).

  > [!TIP]
  > You should regularly review the DMARC Aggregate reports to monitor where email from your domains is coming from, and to check for unintentional DMARC failures (false positives).
  >
  > Individual destination email systems are responsible for sending DMARC reports back to you. The amount and variety of DMARC reports varies in the same way that the volume and variety of mail sent from your organization varies. For example, expect lower mail volume during holidays, and higher mail volume during organizational events. It's best to designate specific people to monitor DMARC reports, and to use a specific mailbox or Microsoft 365 Group to receive the DMARC reports (don't deliver the reports to a user's mailbox).

For more information about DMARC, use the following resources:

- The [DMARC Training Series](https://www.m3aawg.org/activities/training/dmarc-training-series) from M<sup>3</sup>AAWG (Messaging, Malware, Mobile Anti-Abuse Working Group).
- Information at [DMARC.org](https://dmarc.org).

## Use the Microsoft 365 admin center to add DMARC TXT records for \*.onmicrosoft.com domains in Microsoft 365

1. In the Microsoft 365 admin center at <https://admin.microsoft.com>, select **Show all** \> **Settings** \> **Domains**. Or, to go directly to the **Domains** page, use <https://admin.microsoft.com/Adminportal/Home#/Domains>.

2. On the **Domains** page, select the \*.onmicrosoft.com domain from the list by clicking anywhere in the row other than the check box next to the domain name.

3. On the domain details page that opens, select the **DNS records** tab.

4. On the **DNS records** tab, select :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Add record**.

5. On the **Add a custom DNS record** flyout that opens, configure the following settings:
   - **Type**: Verify that **TXT (Text)** is selected.
   - **TXT name**: Enter `_dmarc`.
   - **TXT value**: Enter `v=DMARC1; p=reject`.

     > [!TIP]
     > To specify destinations for the DMARC Aggregate and DMARC Forensic reports, use the syntax `v=DMARC1; p=reject; rua=mailto:<emailaddress>; ruf=mailto:<emailaddress>`. For example, `v=DMARC1; p=reject; rua=mailto:rua@contoso.onmicrosoft.com; ruf=mailto:ruf@contoso.onmicrosoft.com`.
     >
     > DMARC reporting vendors in the MISA Catalog at <https://www.microsoft.com/misapartnercatalog> make it easier to view and interpret DMARC results.

   - **TTL**: Verify that **1 hour** is selected.

   When you're finished on the **Add a custom DNS record** flyout, select **Save**.

## Set up DMARC for active custom domains in Microsoft 365

> [!TIP]
> As mentioned previously in this article, you need to [create SPF TXT records](email-authentication-spf-configure.md#spf-txt-records-for-custom-domains-in-microsoft-365) and [configure DKIM signing](email-authentication-dkim-configure.md#use-the-defender-portal-to-enable-dkim-signing-of-outbound-messages-using-a-custom-domain) for all custom domains and subdomains you use to send email in Microsoft 365 _before_ you configure DMARC for custom domains or subdomains.

A gradual approach to setting up DMARC for your Microsoft 365 domains is recommended. The goal is to get to a `p=reject` DMARC policy for all of your custom domains and subdomains, but you need to test and verify along the way to prevent destination email systems from rejecting good mail because of unintentional DMARC failures.

Your DMARC roll-out plan should use the following steps. Start with a domain or subdomain with low mail volume and/or fewer potential email sources (less chance of legitimate mail from unknown sources being blocked):

1. Start with a DMARC policy of `p=none` and monitor the results for the domain. For example:

   **DMARC TXT record for marketing.contoso.com**:

   **Hostname**: `_dmarc`<br/>
   **TXT value**: `v=DMARC1; p=none; pct=100; rua=mailto:rua@marketing.contoso.com; ruf=mailto:ruf@marketing.contoso.com`

   The DMARC Aggregate and DMARC Forensic reports give the numbers and sources of messages that pass and fail DMARC checks. You can see how much of your legitimate mail traffic is or isn't covered by DMARC, and troubleshoot any problems. You can also see how many fraudulent messages are being sent, and where they're sent from.

2. Increase the DMARC policy to `p=quarantine` and monitor the results for the domain.

   After enough time monitoring the effects of `p=none`, you can increase the DMARC policy to `p=quarantine` for the domain. For example:

   **DMARC TXT record for marketing.contoso.com**:

   **Hostname**: `_dmarc`<br/>
   **TXT value**: `v=DMARC1; p=quarantine; pct=100; rua=mailto:rua@marketing.contoso.com; ruf=mailto:ruf@marketing.contoso.com`

   You can also use the `pct=` value to gradually affect more messages and verify the results. For example, you can move in the following increments:

   - `pct=10`
   - `pct=25`
   - `pct=50`
   - `pct=75`
   - `pct=100`

3. Increase the DMARC policy to `p=reject` and monitor the results for the domain.

   After enough time monitoring the effects of `p=quarantine`, you can increase the DMARC policy to `p=reject` for the domain. For example:

   **DMARC TXT record for marketing.contoso.com**:

   **Hostname**: `_dmarc`<br/>
   **TXT value**: `v=DMARC1; p=reject; pct=100; rua=mailto:rua@marketing.contoso.com; ruf=mailto:ruf@marketing.contoso.com`

   You can also use the `pct=` value to gradually affect more messages and verify the results.

4. Repeat the previous three steps for the remaining subdomains of increasing volume and/or complexity, saving the parent domain for last.

   > [!TIP]
   > Blocking legitimate email in any significant volume is unacceptable to users, but it's almost inevitable that you're going to get some false positives. Go slowly and methodically deal with issues that are revealed in DMARC reporting. DMARC reporting vendors in the MISA Catalog at <https://www.microsoft.com/misapartnercatalog> make it easier to view and interpret the DMARC results.

5. As described earlier, subdomains inherit the DMARC TXT record settings of the parent domain, which you can override with a separate DMARC TXT record in the subdomain. When you're finished setting up DMARC in a domain and all subdomains, and the DMARC settings are effectively identical for the parent domain and all subdomains, you can eliminate the DMARC TXT records in the subdomains and rely on the single DMARC TXT record in the parent domain.

## DMARC TXT records for parked domains in Microsoft 365

> [!TIP]
> The recommended SPF TXT record for parked domains that don't send mail is described in [SPF TXT records for custom cloud domains](email-authentication-spf-configure.md#spf-txt-records-for-custom-domains-in-microsoft-365). As described in [Set up DKIM to sign mail from your cloud domain](email-authentication-dkim-configure.md), DKIM CNAME records aren't recommended for parked domains.

1. If you registered domains that no one on the internet should expect to receive mail from, create the following DMARC TXT record at the domain registrar for the domain:

   **Hostname**: `_dmarc`<br/>
   **TXT value**: `v=DMARC1; p=reject;`

   - The `pct=` value isn't included, because the default value is `pct=100`.
   - The `rua=mailto:` and `ruf=mailto:` values are arguably not needed in this scenario, because no valid mail should ever come from senders in the domain.

2. If you don't use the \*.onmicrosoft.com domain to send mail, you also need to [add the DMARC TXT record for your \*.onmicrosoft.com domain](#use-the-microsoft-365-admin-center-to-add-dmarc-txt-records-for-onmicrosoftcom-domains-in-microsoft-365).

## DMARC for inbound mail into Microsoft 365

- The following [built-in security features for all cloud mailboxes](eop-about.md) affect DMARC checks on incoming mail:
  - Whether [spoof intelligence](anti-phishing-policies-about.md#spoof-settings) is enabled or disabled in the anti-phishing policy that checked the message. Disabling spoof intelligence disables _implicit_ spoofing protection from [composite authentication](email-authentication-about.md#composite-authentication) checks only.
  - Whether the **Honor DMARC record policy when the message is detected as spoof** setting is enabled or disabled in the anti-phishing policy that checked the message, and the specified actions based on the DMARC policy of the source domain (`p=quarantine`, or `p=reject` in the DMARC TXT record).

  For complete information, see [Spoof protection and sender DMARC policies](anti-phishing-policies-about.md#spoof-protection-and-sender-dmarc-policies).

  To see the default values for these settings in anti-phishing policies, check the setting values in the table at [Anti-phishing policy settings for all cloud mailboxes](recommended-settings-for-eop-and-office365.md#anti-phishing-policy-settings-for-all-cloud-mailboxes).

- Microsoft 365 doesn't send DMARC Forensic reports (also known as DMARC Failure reports), even if a valid `ruf=mailto:` address exists in the DMARC TXT record of the source domain.

- Microsoft 365 sends DMARC Aggregate reports to all domains with a valid `rua=mailto:` address in the DMARC TXT records, as long as the MX record for the Microsoft 365 domain points directly to Microsoft 365.

  If you route internet mail through a non-Microsoft service or device before delivery to Microsoft 365 (the MX record points somewhere other than Microsoft 365), DMARC Aggregate reports aren't sent. This limitation includes hybrid scenarios where mail is delivered to the on-premises environment before being routed to Microsoft 365 using a connector.

  > [!TIP]
  > When a non-Microsoft service or device sits in front of mail flowing into Microsoft 365, [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) (also known as _skip listing_) correctly identifies the source of internet messages for SPF, DKIM (if the service modifies messages), and DMARC validation.

## DMARC troubleshooting

This section helps you diagnose and resolve common DMARC failures, understand how Microsoft 365 acts on different DMARC policies, and interpret DMARC aggregate and forensic reports.

:::image type="content" source="media/Tp_DMARCTroublehoot.png" alt-text="Diagram of the DMARC troubleshooting process" lightbox="media/Tp_DMARCTroublehoot.png":::

### Alignment failure diagnosis

As described in the [introduction to DMARC validation](#set-up-dmarc-to-validate-the-from-address-domain-for-cloud-senders), a message passes DMARC if **at least one** alignment check succeeds (SPF or DKIM). A message fails DMARC only if **both** alignment checks fail.

#### Alignment modes

The `aspf` (SPF) and `adkim` (DKIM) tags in the DMARC TXT record control how strictly the From domain must match the authenticated domain. Both are optional and default to `r` (relaxed), but `s` (strict) is also available. For example:

```text
Hostname: _dmarc
TXT value: v=DMARC1; p=reject; aspf=s; adkim=r; pct=100; rua=mailto:dmarc@contoso.com
```

- **Relaxed** (`r`, default): Organizational domains (root domains) must match. Subdomains are allowed.
- **Strict** (`s`): FQDNs must match exactly. No subdomain matching.

> [!NOTE]
> The `aspf` and `adkim` tags are independent. You can use different modes for each as shown in the example. A message passes DMARC if _either_ alignment check succeeds, so a strict failure on one check doesn't matter if the other check passes with relaxed alignment.

**Examples**:

|From address|MAIL FROM / DKIM-Signature d= address|Relaxed (`r`)|Strict (`s`)|
|---|---|---|---|
|`user@contoso.com`|`contoso.com`|✅ Pass|✅ Pass|
|`user@contoso.com`|`bounces.contoso.com`|✅ Pass|❌ Fail|
|`user@marketing.contoso.com`|`contoso.com`|✅ Pass|❌ Fail|
|`user@contoso.com`|`contoso.onmicrosoft.com`|❌ Fail|❌ Fail|
|`user@contoso.com`|`adatum.net`|❌ Fail|❌ Fail|

#### Common alignment failure scenarios

|Scenario|Symptom|Root cause|Resolution|
|---|---|---|---|
|Non-Microsoft service sends on your behalf|SPF passes for adatum.com but DMARC fails|MAIL FROM uses the service's domain (for example, `bounce.adatum.com`) and no DKIM signing with your domain|Configure DKIM signing with your domain at the service, **or** change MAIL FROM to your domain/subdomain|
|Microsoft 365 auto-forwarding|DMARC fails at destination|Forwarding changes envelope sender; DKIM signature might break|Use ARC trusted sealers at the destination, or use DKIM (survives forwarding if body isn't modified)|
|Subdomain sends with strict alignment|`aspf=s` causes failures for subdomain senders|MAIL FROM is `sub.contoso.com` but From is `contoso.com`|Change to `aspf=r` (relaxed), or ensure From address matches the subdomain|
|DKIM signing domain mismatch|DKIM passes but DMARC still fails|DKIM `d=` value (for example, `adatum.com`) doesn't align with From domain (`contoso.com`)|Configure custom DKIM signing at the service using your domain|
|Shared mailbox or distribution group|DMARC fails intermittently|Reply-from or redirect changes envelope addresses|Verify DKIM is intact; consider ARC for intermediary services|

#### Diagnose alignment failures from message headers

**Step 1**: Open the message headers and locate the **Authentication-Results** header from Microsoft 365:

```text
Authentication-Results: spf=pass (sender IP is 198.51.100.10)
  smtp.mailfrom=bounces.adatum.com; dkim=pass (signature was verified)
  header.d=adatum.com; dmarc=fail action=oreject
  header.from=contoso.com;compauth=fail reason=000
```

**Step 2**: Identify the alignment failure:

|Check|Header field|Value in example|Aligns with From (`contoso.com`)?|
|---|---|---|---|
|SPF alignment|`smtp.mailfrom=`|`bounces.adatum.com`|❌ No (different org domain)|
|DKIM alignment|`header.d=`|`adatum.com`|❌ No (different org domain)|
|DMARC result|`dmarc=`|`fail`|Both checks failed|

**Step 3**: Determine the fix:

```text
Is SPF alignment fixable?
├─ Can you change MAIL FROM to your domain? → Configure at service
│  (for example, bounces.contoso.com instead of bounces.adatum.com)
│
└─ No → Use DKIM alignment instead
   ├─ Can service sign with your domain (d=contoso.com)? → Configure custom DKIM
   └─ No → Consider subdomain strategy:
      - Send from sub.contoso.com
      - Publish separate DMARC for that subdomain
      - Have service sign DKIM with d=sub.contoso.com
```

#### Check alignment for recent messages in PowerShell

[Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following commands:

```powershell
# Get recent messages and check authentication results
$messages = Get-MessageTrace -StartDate (Get-Date).AddDays(-1) -EndDate (Get-Date) -PageSize 100

foreach ($msg in $messages) {
    $details = Get-MessageTraceDetail -MessageTraceId $msg.MessageTraceId -RecipientAddress $msg.RecipientAddress
    $authEvent = $details | Where-Object { $_.Event -eq "Receive" }
    if ($authEvent.Detail -match "dmarc=fail") {
        Write-Output "DMARC FAIL: From=$($msg.SenderAddress), Subject=$($msg.Subject)"
    }
}
```

### DMARC policy effect on Microsoft 365 behavior

As described in [DMARC for inbound mail](#dmarc-for-inbound-mail-into-microsoft-365), Microsoft 365 behavior depends on the **Honor DMARC record policy** setting. For complete details, see [Spoof protection and sender DMARC policies](anti-phishing-policies-about.md#spoof-protection-and-sender-dmarc-policies).

The following summary shows the general behavior for inbound messages that **fail DMARC** when **Honor DMARC record policy** is **On** (recommended):

|Sender's DMARC policy|Message disposition|Authentication-Results|CompAuth|
|---|---|---|---|
|`p=none`|No DMARC-specific action. Other filtering still applies.|`dmarc=fail action=none`|Based on composite auth (SPF, DKIM, spoof intelligence)|
|`p=quarantine`|Junk Email folder (configurable to quarantine)|`dmarc=fail action=quarantine`|`compauth=fail reason=100`|
|`p=reject`|Rejected during SMTP (`550 5.7.1`)|`dmarc=fail action=oreject`|`compauth=fail reason=100`|

> [!CAUTION]
> Be careful when overriding `p=reject` for legitimate senders. If your organization legitimately receives mail from a sender whose DMARC fails (for example, forwarded mail, mailing lists), use one of these approaches:
>
> - Configure the sender as a [trusted ARC sealer](email-authentication-arc-configure.md) (preferred).
> - Create a mail flow rule with specific conditions (sender IP + sender domain) to skip spam filtering.
> - Add an allow entry in the Tenant Allow/Block List (temporary, expires in 30 days).

#### DMARC action values in Authentication-Results

In the **Authentication-Results** header, you might see these DMARC action values:

|Action value|Meaning|
|---|---|
|`action=none`|Sender published `p=none`; no action taken|
|`action=quarantine`|Sender published `p=quarantine`; message quarantined or junked|
|`action=oreject`|Sender published `p=reject`; message rejected ("o" = origin)|
|`action=pct.quarantine`|Sender published `p=quarantine` with `pct=` less than 100; this message was in the sampled percentage|
|`action=pct.reject`|Sender published `p=reject` with `pct=` less than 100; this message was in the sampled percentage|

### DMARC report interpretation

This section helps you interpret the [DMARC aggregate and forensic reports](#syntax-for-dmarc-txt-records) that receivers send to your `rua` and `ruf` addresses.

#### Aggregate reports

The following example shows the XML structure of an aggregate report:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<feedback>
  <report_metadata>
    <org_name>microsoft.com</org_name>           <!-- Reporting organization -->
    <email>dmarceng@microsoft.com</email>
    <report_id>unique-report-id</report_id>
    <date_range>
      <begin>1700000000</begin>                   <!-- Unix timestamp: start -->
      <end>1700086400</end>                       <!-- Unix timestamp: end -->
    </date_range>
  </report_metadata>

  <policy_published>
    <domain>contoso.com</domain>                  <!-- Your domain -->
    <adkim>r</adkim>                              <!-- DKIM alignment mode -->
    <aspf>r</aspf>                                <!-- SPF alignment mode -->
    <p>reject</p>                                 <!-- Domain policy -->
    <sp>quarantine</sp>                           <!-- Subdomain policy -->
    <pct>100</pct>                                <!-- Percentage -->
  </policy_published>

  <record>
    <row>
      <source_ip>198.51.100.10</source_ip>        <!-- Sending IP -->
      <count>1523</count>                         <!-- Number of messages -->
      <policy_evaluated>
        <disposition>none</disposition>           <!-- What receiver did -->
        <dkim>pass</dkim>                         <!-- DKIM alignment result -->
        <spf>fail</spf>                           <!-- SPF alignment result -->
      </policy_evaluated>
    </row>
    <identifiers>
      <header_from>contoso.com</header_from>      <!-- From address domain -->
      <envelope_from>bounces.adatum.com</envelope_from>
    </identifiers>
    <auth_results>
      <dkim>
        <domain>contoso.com</domain>
        <result>pass</result>
        <selector>selector1</selector>
      </dkim>
      <spf>
        <domain>bounces.adatum.com</domain>
        <result>pass</result>                     <!-- SPF passed but... -->
      </spf>
    </auth_results>
  </record>
</feedback>
```

#### Read aggregate reports

|XML element|What it tells you|Troubleshooting action|
|---|---|---|
|`<source_ip>`|The IP address that sent the messages|Identify if this is a legitimate sender or unauthorized|
|`<count>`|Number of messages from this source|High count from unknown IP = potential spoofing|
|`<disposition>`|Action the receiver took (`none`, `quarantine`, `reject`)|Verify receiver is honoring your policy|
|`<dkim>` under `<policy_evaluated>`|Whether DKIM **aligned** (not just passed)|`fail` = DKIM domain doesn't match From domain|
|`<spf>` under `<policy_evaluated>`|Whether SPF **aligned** (not just passed)|`fail` = MAIL FROM domain doesn't match From domain|
|`<domain>` under `<auth_results><spf>`|Domain that SPF was checked against|If different from From domain = alignment issue|
|`<domain>` under `<auth_results><dkim>`|DKIM signing domain|Must match From domain for DMARC alignment|
|`<result>` under `<auth_results>`|Raw SPF/DKIM pass/fail (before alignment check)|`pass` + alignment `fail` = classic alignment problem|

> [!TIP]
> The most important insight from aggregate reports is identifying the gap between **authentication pass** and **alignment pass**:
>
> - `<auth_results><spf><result>pass</result>` + `<policy_evaluated><spf>fail</spf>` = SPF passed but domains don't align.
> - This combination means the sender is authorized (SPF pass) but isn't properly configured for DMARC (alignment fail).

#### Common aggregate report patterns and fixes

|Pattern in report|Interpretation|Fix|
|---|---|---|
|Known IP, SPF auth=pass, SPF aligned=fail|Legitimate service with wrong MAIL FROM domain|Configure service to use your domain in MAIL FROM, or set up DKIM signing with your domain|
|Known IP, DKIM auth=pass, DKIM aligned=fail|Service signs DKIM with their own domain|Configure custom DKIM at service with `d=contoso.com`|
|Unknown IP, high volume, all fails|Potential spoofing/phishing campaign|No action needed. Your DMARC policy is protecting recipients.|
|Known IP (Microsoft 365), SPF aligned=pass|Normal Microsoft 365 mail flow|Healthy. No action needed.|
|Low volume from legitimate service, SPF+DKIM fail|Service not included in SPF and not DKIM-signing|Add service to SPF record and/or configure DKIM|
|Forwarded mail (mailing list IPs), all fails|Mail forwarding breaks SPF; body modification breaks DKIM|Normal for forwarded mail. Use ARC or accept some failures.|

#### Forensic reports

As noted in the [DMARC for inbound mail](#dmarc-for-inbound-mail-into-microsoft-365) section, Microsoft 365 doesn't send forensic reports. However, you might receive them from other providers. The following table compares the two report types:

|Aspect|Aggregate reports (`rua`)|Forensic reports (`ruf`)|
|---|---|---|
|**Frequency**|Daily (typically)|Near real-time (per failure)|
|**Content**|Summary statistics by source IP|Individual message details|
|**Volume**|One report per day per reporter|One report per failure (can be high volume)|
|**Privacy**|IP addresses and counts only|Might include message headers/body (redacted)|
|**Support**|Widely supported by receivers|Limited support (many receivers don't send ruf)|
|**Use case**|Trend analysis, identifying unknown senders|Debugging specific failures, forensic investigation|

> [!NOTE]
> If you need per-message failure details from Microsoft 365, use message trace and message header analysis instead of forensic reports.

**Forensic report structure (AFRF/RFC 6591 format)**:

```text
From: noreply-dmarc-support@fabrikam.com
To: ruf@contoso.com
Subject: Report Domain: contoso.com Submitter: fabrikam.com

Feedback-Type: auth-failure
User-Agent: fabrikam.com/dmarc-reporter
Version: 1
Original-Mail-From: bounces@adatum.com
Arrival-Date: Mon, 15 Jan 2024 10:30:00 -0000
Source-IP: 198.51.100.10
Authentication-Results: fabrikam.com; dmarc=fail (p=reject)
  header.from=contoso.com
Reported-Domain: contoso.com
Original-Envelope-Id: <abc123@mail.adatum.com>
```

#### Best practices for DMARC reports

|Recommendation|Details|
|---|---|
|Use a dedicated mailbox for `rua`|Create a shared mailbox (for example, `dmarc-reports@contoso.com`). Don't use individual user mailboxes.|
|Use a Microsoft 365 Group|Groups provide better collaboration and shared access for the security team|
|Consider a DMARC reporting service|DMARC reporting services parse XML into dashboards. Search for DMARC in the [MISA Catalog](https://www.microsoft.com/misapartnercatalog).|
|Start with `rua` only|Add `ruf` later if needed. Forensic reports can generate high volume.|
|Monitor regularly|Review aggregate reports weekly during initial deployment; monthly once stable|
|Set realistic expectations|Not all receivers send reports. Coverage is typically 70-90% of total mail volume|

#### Cross-domain reporting

If your DMARC `rua` or `ruf` address is in a **different domain** than the domain being monitored, the receiving domain must publish a DNS TXT record authorizing the report delivery:

**Example**: DMARC for `contoso.com` sends reports to `dmarc@fabrikam.com`

**Required DNS record at `fabrikam.com`**:

```text
Hostname: contoso.com._report._dmarc
Type: TXT
Value: v=DMARC1;
```

Without this record, receivers don't deliver DMARC reports to the external address.

### DMARC troubleshooting quick-reference

|Symptom|Likely cause|Diagnostic step|Resolution|
|---|---|---|---|
|`dmarc=fail` but SPF and DKIM both pass individually|Alignment failure: domains don't match From|Check `smtp.mailfrom=` and `header.d=` vs `header.from=` in Authentication-Results|Configure SPF/DKIM with aligned domains|
|`dmarc=bestguesspass`|No DMARC record published for the From domain|Query `_dmarc.domain.com` TXT record|Microsoft infers a pass. Publish an explicit DMARC record.|
|`dmarc=fail action=oreject` but message delivered|**Honor DMARC** disabled, or allow list/override in place|Check anti-phishing policy settings and Tenant Allow/Block List|Enable **Honor DMARC record policy** if strict enforcement desired|
|`dmarc=fail` for forwarded messages|Forwarding breaks SPF alignment; body changes break DKIM|Check if message traversed intermediary (X-MS-Exchange headers)|Configure trusted ARC sealer for the forwarding service|
|`dmarc=fail` for non-Microsoft SaaS sender|Service uses its own domain in MAIL FROM and DKIM `d=`|Check aggregate reports for the service's IP|Configure custom DKIM signing at service + align MAIL FROM|
|`dmarc=temperror` or `dmarc=permerror`|DNS issues retrieving DMARC record (timeout, syntax error)|Validate DMARC record syntax with `nslookup -type=TXT _dmarc.domain.com`|Fix DNS syntax errors; ensure only one `_dmarc` TXT record exists|
|`compauth=fail reason=000`|Composite authentication failed (explicit fail)|Check all auth results (SPF, DKIM, DMARC, ARC)|Fix underlying SPF/DKIM/DMARC issues|
|`compauth=fail reason=100`|DMARC explicit fail with policy enforcement|Sender's DMARC policy caused the failure|Fix alignment at source, or configure ARC/override if legitimate|
|Aggregate reports not being received|`rua` address unreachable, or cross-domain auth missing|Verify mailbox exists and DNS authorization record for external domains|Fix mailbox routing; add `domain._report._dmarc` TXT record|

### DMARC diagnostic workflow

```text
Message received with dmarc=fail
│
├─ Step 1: Identify the From domain
│  └─ header.from= in Authentication-Results
│
├─ Step 2: Check SPF alignment
│  ├─ smtp.mailfrom= domain matches header.from= domain?
│  │  ├─ YES (same org domain with aspf=r) → SPF aligned ✓
│  │  └─ NO → SPF alignment fails
│  └─ Did SPF pass at all? (spf=pass vs spf=fail)
│     └─ If spf=fail → Fix SPF first (add sender to SPF record)
│
├─ Step 3: Check DKIM alignment
│  ├─ header.d= in DKIM-Signature matches header.from= domain?
│  │  ├─ YES (same org domain with adkim=r) → DKIM aligned ✓
│  │  └─ NO → DKIM alignment fails
│  └─ Did DKIM pass at all? (dkim=pass vs dkim=fail)
│     └─ If dkim=fail → Fix DKIM (publish key, verify signing)
│
├─ Step 4: If BOTH alignments fail → DMARC fails
│  └─ Resolution options:
│     ├─ Fix SPF alignment: Change MAIL FROM to your domain
│     ├─ Fix DKIM alignment: Sign with d=contoso.com
│     ├─ Use subdomain: Send from sub.domain.com with own DMARC
│     └─ If forwarding: Configure ARC trusted sealer
│
└─ Step 5: Check policy action
   ├─ p=none → No effect on delivery (monitor only)
   ├─ p=quarantine → Message goes to Junk (if Honor DMARC = On)
   └─ p=reject → Message rejected (if Honor DMARC = On)
       └─ If legitimate mail rejected → Use ARC, allow list, or
          fix authentication at source
```

### Useful PowerShell commands for DMARC troubleshooting

[Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following commands:

```powershell
# Check your organization's anti-phishing policy DMARC settings
Get-AntiPhishPolicy | Format-List Name, HonorDmarcPolicy, DmarcQuarantineAction, DmarcRejectAction

# Verify DMARC record for a domain
Resolve-DnsName -Name "_dmarc.contoso.com" -Type TXT | Select-Object -ExpandProperty Strings

# Check DKIM configuration (alignment prerequisite)
Get-DkimSigningConfig | Format-List Domain, Enabled, Selector1CNAME, Selector2CNAME

# Review messages that failed DMARC in the last 24 hours
Get-MailDetailSpamReport -StartDate (Get-Date).AddDays(-1) -EndDate (Get-Date) |
  Where-Object { $_.MessageTraceId } |
  Select-Object Date, SenderAddress, RecipientAddress, Subject, SpamScore

# Check ARC configuration (for forwarding scenarios)
Get-ArcConfig | Format-List ArcTrustedSealers

# View anti-phishing policy DMARC override actions
Get-AntiPhishPolicy -Identity "Office365 AntiPhish Default" |
  Select-Object HonorDmarcPolicy, DmarcQuarantineAction, DmarcRejectAction
```

> [!TIP]
> When troubleshooting DMARC failures for a specific sender:
>
> 1. Start with the **Authentication-Results** header to identify the failure type.
> 1. Cross-reference with your **DMARC aggregate reports** to see the volume and source IPs.
> 1. Use [Get-MessageTrace](/powershell/module/exchange/get-messagetrace) to find specific messages and [Get-MessageTraceDetail](/powershell/module/exchange/get-messagetracedetail) to examine delivery events.
> 1. If the sender is legitimate, work with them to fix SPF/DKIM alignment before creating overrides.

## Next steps

For mail coming _into_ Microsoft 365, you might also need to configure trusted ARC sealers if you use services that modify messages in transit before delivery to your organization. For more information, see [Configure trusted ARC sealers](email-authentication-arc-configure.md).
