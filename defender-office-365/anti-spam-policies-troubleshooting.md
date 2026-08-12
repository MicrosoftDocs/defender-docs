---
title: Troubleshoot anti-spam policies in Microsoft Defender for Office 365
author: chrisda
ms.author: chrisda
ms.topic: troubleshooting
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom: msecd-doc-authoring-1015
description: Diagnose and resolve anti-spam policy issues including policy precedence conflicts, spam filtering override behavior, and false positives from ASF settings in Defender for Office 365.
ms.service: defender-office-365
ms.date: 08/03/2026
ai-usage: ai-assisted
#customer intent: As an admin, I want to troubleshoot anti-spam policy issues so that I can resolve policy precedence conflicts, unexpected spam verdict overrides, and ASF false positives.
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Troubleshoot common anti-spam policy issues

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Use the following information to diagnose and resolve common anti-spam policy issues:

- Policy precedence conflicts.
- Unexpected spam filtering overrides.
- False positives from Advanced Spam Filter (ASF) settings.

> [!TIP]
> **Email Threat Policies diagnostics for a recipient**
>
> List threat policies in [the built-in security features for all cloud mailboxes](eop-about.md) and in [Microsoft Defender for Office 365](mdo-about.md) that apply to a received message or a recipient, and identify the inbound connector used for the message.
>
> - [Run Tests: Email Threat Policies](https://aka.ms/mdopolicy)
> - [Order and precedence of email protection](how-policies-and-protections-are-combined.md)

## Policy precedence issues

Anti-spam policies are evaluated in a specific order. Only the **first matching policy** (highest priority) applies to a recipient. Anti-spam policies are processed in the following order:

|Priority|Policy|Notes|
|---|---|---|
|1 (highest)|**Strict preset security policy**|Applied first if enabled. Settings can't be modified.|
|2|**Standard preset security policy**|Applied next if enabled. Settings can't be modified.|
|3|**Custom anti-spam policies**|Applied in priority order (0 = highest priority).|
|4 (lowest)|**Default anti-spam policy**|Always has priority **Lowest**. Applies to recipients not covered by any other policy. Can't be deleted or renamed.|

> [!IMPORTANT]
> Anti-spam protection **stops** for a recipient after the first policy applies. If a user is covered by the Strict preset security policy, custom and default anti-spam policy settings are **ignored** for that user.

For the complete precedence model for all protection features, see [Order and precedence of email protection](how-policies-and-protections-are-combined.md).

### Problem: Custom policy settings aren't being applied

**Symptom**: You configured a custom anti-spam policy with specific settings (for example, a higher Bulk Complaint Level (BCL) threshold or a different spam action), but the settings aren't taking effect for some users.

**Likely cause**: The affected users are also included in a preset security policy (Standard or Strict), which takes precedence over custom policies.

**How to diagnose**:

1. On the **Preset security policies** page in the Microsoft Defender portal at <https://security.microsoft.com/presetSecurityPolicies>, check if the Standard or Strict preset security policies are enabled and which users, groups, or domains are included.
1. Compare the recipient scope of the preset policy with your custom policy.

**Resolution**:

- If you need custom settings for specific users, do either of the following steps:
  - Add those users as exclusions in [preset security policies](preset-security-policies.md#use-the-microsoft-defender-portal-to-modify-the-assignments-of-standard-and-strict-preset-security-policies).
  - Use specific user or group assignments for both preset security policies and [custom policies](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-modify-anti-spam-policies) to ensure the targeted users are assigned only to the custom policy.

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), run the following command to check which anti-spam policy applies to a specific user:

```powershell
Get-HostedContentFilterRule | Where-Object {$_.State -eq 'Enabled'} | Format-Table Name, Priority, SentTo, SentToMemberOf, RecipientDomainIs
```

### Problem: Two custom policies overlap and the wrong one applies

**Symptom**: A user matches the recipient conditions of two custom anti-spam policies, but the wrong policy settings apply.

**Likely cause**: The policy you want to apply has a **lower priority** (higher priority number) than the other policy.

**How to diagnose**:

1. On the **Anti-spam policies** page in the Defender portal at <https://security.microsoft.com/antispam>, review the **Priority** column for **Inbound** anti-spam policies.
1. Check the recipient conditions (users, groups, domains) of both policies.

**Resolution**:

Reorder the policies so the more specific policy has a **higher priority** (lower priority number). For instructions, see [Use the Microsoft Defender portal to set the priority of custom anti-spam policies](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-set-the-priority-of-custom-anti-spam-policies) or [Use PowerShell to set the priority of spam filter rules](anti-spam-policies-configure.md#use-powershell-to-set-the-priority-of-spam-filter-rules).

> [!TIP]
> Design your policies from most specific to least specific. Use narrow recipient scopes for specialized policies (specific users or groups) and broader scopes for general policies.

### Problem: Default policy has unexpected settings

**Symptom**: Users not covered by any other policy receive unexpected spam filtering behavior.

**Likely cause**: The default anti-spam policy was modified from its original settings, or you're expecting the default policy to behave like a custom policy.

**Resolution**:

- Review and reconfigure the [default anti-spam policy settings](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-modify-anti-spam-policies).
- The default anti-spam policy can't be scoped to specific users. It always applies last to **all recipients not covered by other policies**.
- Consider [creating a custom policy](anti-spam-policies-configure.md#use-the-microsoft-defender-portal-to-create-anti-spam-policies) for the affected users instead of relying on the default.

## Spam verdict override behavior

Certain mechanisms can override the spam verdict on a message, such as mail flow rules or connection filtering. These overrides can affect whether messages go to the Inbox, the Junk Email folder, or quarantine. In cloud organizations, spam filtering classifies messages and takes action using message categorization and other signals.

The following mechanisms can override the verdict assigned by spam filtering. Their behavior and limitations affect troubleshooting:

|Override mechanism|Effect|Limitations|Details|
|---|---|---|---|
|**Mail flow rules (transport rules)**|Set the spam confidence level (SCL) to -1 (bypass) or 0-9 (for action in on-premises Exchange environments)|**Can't bypass** malware or high confidence phishing filtering. SCL -1 overrides spam filtering only.|[Use mail flow rules to set the SCL](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl)|
|**IP Allow List** (connection filtering)|Bypass most filtering for messages from allowed IPs|Doesn't bypass malware or high confidence phishing scanning. Doesn't override DMARC failures.|[Configure connection filtering](connection-filter-policies-configure.md)|
|**Allowed senders/domains** (anti-spam policy)|Bypasses spam filtering for specified senders or domains|High risk: attackers can spoof allowed domains. Doesn't bypass malware or high confidence phishing.|[Create safe sender lists](create-safe-sender-lists-in-office-365.md)|
|**Tenant Allow/Block List**|Allows or blocks specific senders, domains, URLs, or files|Allow entries are temporary by default. Block entries override allow entries.|[Tenant Allow/Block List](tenant-allow-block-list-about.md)|
|**Outlook Safe Senders** (user-level)|Bypasses spam filtering for messages from senders in the user's Safe Senders list|Doesn't bypass malware or high confidence phishing. Creates risk of targeted spoofing.|[Safelist aggregation](/exchange/antispam-and-antimalware/antispam-protection/safelist-aggregation)|
|**Advanced delivery policy**|Bypasses filtering for SecOps mailboxes and phishing simulation messages|Purpose-built for specific scenarios. Don't use for general allow lists.|[Configure advanced delivery policy](advanced-delivery-policy-configure.md)|
|**Enhanced Filtering for Connectors** (skip listing)|Preserves original source IP for accurate SPF/authentication checks|Doesn't bypass filtering, but affects how filtering evaluates the message source.|[Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors)|

- An SCL of -1 is an _instruction_ to bypass spam filtering, not necessarily the SCL value that's stamped on the message. A message that skips spam filtering can still be scanned and stamped with an SCL of 0 or 1 to indicate it was evaluated and found not to be spam.
- Even when a message bypasses spam filtering, the following protections are **never** bypassed:
  - **Malware scanning**: Messages containing malware are always quarantined.
  - **High confidence phishing (HPHSH)**: Messages identified as high confidence phishing are always quarantined (unless the MX record doesn't point to Microsoft 365 and an SCL -1 rule is in place).

> [!CAUTION]
> Setting SCL to -1 via a mail flow rule creates **significant risk** if the conditions aren't carefully scoped. Always use the narrowest possible conditions.

### Problem: SCL -1 mail flow rule delivers spam to Inbox

**Symptom**: Users receive spam or phishing messages in their Inbox instead of Junk Email or quarantine.

**Likely cause**: A mail flow rule sets SCL to -1 for too broad a scope. For example, all messages from a specific domain or IP range, or all messages routed through a connector.

**How to diagnose**:

1. On the **Rules** page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/transportrules>, look for rules with the action **Set the spam confidence level (SCL)** to **Bypass spam filtering** or **-1**.
1. Review the conditions. Are they overly broad?

**Resolution**:

- **Narrow the conditions**: [Add more conditions to the rule](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules#view-or-modify-a-mail-flow-rule) (for example, sender address + specific header value).
- **Use Enhanced Filtering for Connectors instead**: If the rule exists because mail routes through a non-Microsoft service, configure [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) and remove the SCL -1 rule.
- **Use the advanced delivery policy**: For SecOps mailboxes or phishing simulations, use the [advanced delivery policy](advanced-delivery-policy-configure.md) instead of mail flow rules.

### Problem: Allow list entries aren't working

**Symptom**: You added a sender to the allowed senders list in the anti-spam policy, but messages from that sender are still being filtered.

**Likely cause**: A preset security policy covers the user and overrides the custom anti-spam policy settings. Or, malware or high confidence phishing filtering is catching the message, and allow lists can't override those verdicts.

**How to diagnose**:

1. Check [message headers](message-headers-eop-mdo.md) for the `X-Forefront-Antispam-Report` header and look for the `SFV` (spam filtering verdict) value:
   - `SFV:SKA` = Message was allowed (skipped filtering due to an allow list entry).
   - `SFV:SPM` = Message was marked as spam (allow list wasn't applied).
1. Check if malware or phishing filtering caught the message instead of spam filtering.

**Resolution**:

- If the user is in a preset security policy, allowed sender/domain lists in custom policies are ignored. Use the [Tenant Allow/Block List](tenant-allow-block-list-about.md) instead.
- If the message is flagged for malware or high confidence phishing, [report it as a false positive](submissions-admin.md) via **Submissions** in the Microsoft Defender portal at <https://security.microsoft.com/reportsubmission>.

## Determine which component filtered the message

When you troubleshoot unexpected spam filtering behavior, identify **which component** filtered the message or overrode filtering. Multiple components in the Exchange Online filtering pipeline can affect the outcome: spam filtering, mail flow rules, connection filtering, allowed/blocked sender lists, and Advanced Spam Filter (ASF) settings.

The following steps show how to use message X-headers to trace the filtering decision.

### Step 1: Get the message headers

To analyze how the message was filtered, you need the full internet message headers of the affected message:

- **Outlook (desktop)**: Open the message \> select **File** > **Properties**. The headers appear in the **Internet headers** box.
- **Outlook on the web**: Open the message \> select **...** (More actions) \> **View** \> **View message details**.
- **Admin (Message trace)**: On the **Message trace** page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/messagetrace>, find the message and view the header details.

> [!TIP]
> Copy and paste the full headers into the [Message Header Analyzer](https://mha.azurewebsites.net/) tool to parse them into a readable format.

### Step 2: Locate the key X-headers

The following X-headers contain the information you need to trace the filtering decision:

|Header|Purpose|
|---|---|
|`X-Forefront-Antispam-Report`|Contains the spam filtering verdict (SFV), IP verdict (IPV), threat category (CAT), and other filtering decisions.|
|`X-Microsoft-Antispam`|Contains the bulk complaint level (BCL) and other diagnostic fields.|
|`X-CustomSpam`|Present only when an ASF setting flagged the message. Identifies which ASF rule triggered.|
|`Authentication-Results`|Contains SPF, DKIM, DMARC, and composite authentication (compauth) results.|

For full details on all header fields, see [Anti-spam message headers in cloud organizations](message-headers-eop-mdo.md).

### Step 3: Read the Spam Filtering Verdict

The **SFV** (Spam Filtering Verdict) field in the `X-Forefront-Antispam-Report` header is the primary indicator of which component determined the message's fate:

|SFV value|Component|Meaning|
|---|---|---|
|`SFV:BLK`|**User Blocked Senders list**|The message was blocked because the sender is in the recipient's Outlook Blocked Senders list.|
|`SFV:NSPM`|**Spam filter (content filter)**|Spam filtering determined the message wasn't spam.|
|`SFV:SFE`|**User Safe Senders list**|Filtering was skipped because the sender is in the recipient's Outlook Safe Senders list.|
|`SFV:SKA`|**Anti-spam policy allowed sender/domain list**|The message skipped spam filtering because the sender or domain is in the allowed senders/domains list.|
|`SFV:SKB`|**Anti-spam policy blocked sender/domain list**|The message was marked as spam because the sender or domain is in the blocked senders/domains list.|
|`SFV:SKI`|**IP Allow/Block List (connection filtering)**|The message skipped spam filtering because the source IP was in the IP Allow List.|
|`SFV:SKN`|**Mail flow rule**|The system honored the request to skip spam filtering from a rule with the **Set the spam confidence level (SCL)** action set to **Bypass spam filtering** (`-SetSCL -1`).|
|`SFV:SKQ`|**Quarantine release**|The message was released from quarantine and delivered to the intended recipients.|
|`SFV:SKS`|**Mail flow rule or on-premises Exchange**|The message was marked as spam before spam filtering processed it, and [Secure by default](secure-by-default.md) honored the request. The source is either a mail flow rule that set the spam confidence level (SCL), or a spam decision passed from on-premises Exchange in a [hybrid deployment](/exchange/exchange-hybrid). The request to mark the message as spam is an input to filtering, not a final decision, so `SFV:SKS` appears only when the request is honored.|
|`SFV:SPM`|**Spam filter (content filter)**|Spam filtering marked the message as spam based on content analysis.|

### Step 4: Check the IPV field for connection-level decisions

The **IPV** (IP Verdict) field indicates whether the connection filter made a decision about the source IP:

|IPV value|Meaning|
|---|---|
|`IPV:CAL`|The source IP address is in the **IP Allow List** in the connection filter policy. Spam filtering was skipped.|
|`IPV:NLI`|The IP address wasn't found on any IP reputation list. No connection-level override occurred.|

### Step 5: Check for ASF overrides

If an ASF setting flagged the message, a separate `X-CustomSpam` header is added that identifies which ASF rule triggered. For example:

```text
X-CustomSpam: Web bug
```

For the complete list of ASF settings, `X-CustomSpam` values, and their spam filtering effects, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

> [!NOTE]
> ASF adds the `X-CustomSpam` header **after** mail flow rules process the message. You can't use mail flow rules to identify or act on messages that ASF flags.

### Step 6: Check for mail flow rule involvement

If `SFV:SKN` or `SFV:SKS` appears in the header, a **mail flow rule** affected the message before spam filtering processed it: `SFV:SKN` for a rule that bypasses spam filtering (SCL -1), or `SFV:SKS` for a rule that marks the message as spam (SCL 5-9). In a [hybrid deployment](/exchange/exchange-hybrid), `SFV:SKS` can also come from an on-premises Exchange spam decision. These actions are inputs to filtering, not final decisions, and [Secure by default](secure-by-default.md) might not honor them.

To identify which mail flow rule is responsible:

1. On the **Rules** page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/transportrules>, look for rules with the action **Set the spam confidence level (SCL)**.
1. Cross-reference the rule conditions with the affected message.

Alternatively, use **Message trace** in the Exchange admin center (EAC). The detailed message trace output shows an `AGENTINFO` event that identifies which rule fired.

#### Find all SCL-setting mail flow rules

To list all mail flow rules that set the SCL, [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and run the following command:

```powershell
Get-TransportRule | Where-Object {$_.SetSCL -ne $null} | Format-Table Name, State, Priority, @{N='SetSCL';E={$_.SetSCL};Alignment='Right'}, @{N='Conditions';E={($_.Conditions -join ', ') -replace 'Microsoft\.Exchange\.MessagingPolicies\.Rules\.Tasks\.','' -replace 'Predicate',''}} -AutoSize -Wrap
```

### Decision tree: Trace the filtering decision

Use the following workflow to systematically identify which component filtered the message. Start by reading the `X-Forefront-Antispam-Report` header:

1. **Check the SFV value**:
   - `SFV:BLK`: User's Blocked Senders list.
   - `SFV:NSPM`: Spam filter (content filter) marked as Not Spam.
   - `SFV:SFE`: User's Safe Senders list.
   - `SFV:SKA`: Anti-spam policy allowed sender/domain list.
   - `SFV:SKB`: Anti-spam policy blocked sender/domain list.
   - `SFV:SKI`: Connection filter (IP Allow List) bypassed filtering. Confirm that `IPV:CAL` is also present.
   - `SFV:SKN`: Mail flow rule bypassed filtering.
   - `SFV:SKS`: A mail flow rule or on-premises Exchange (in hybrid) marked the message as spam before filtering (honored by [Secure by default](secure-by-default.md)).
   - `SFV:SPM`: Spam filter (content filter) marked as Spam. Check the `CAT` value for threat type and the `X-CustomSpam` header for ASF triggers.

1. **Check the X-CustomSpam header** (if present): An ASF setting triggered. Identify which setting and disable it if the message is a false positive.

1. **Check Authentication-Results (compauth)**:
   - `compauth=fail reason=000`: DMARC explicit failure (can result in a spam verdict).
   - `compauth=fail reason=001`: Implicit authentication failure (spoof intelligence).

### Real-world header examples

The following examples show how to interpret message headers to identify which component filtered the message.

- **Message filtered by spam filtering**:

  ```text
  X-Forefront-Antispam-Report: CIP:198.51.100.50;CTRY:US;LANG:en;
    SFV:SPM;IPV:NLI;SRV:;H:mail.adatum.com;PTR:mail.adatum.com;
    CAT:SPM;SFTY:;DIR:INB;
  ```

  Spam filtering marked the message as **Spam** (SFV:SPM, CAT:SPM). No override occurred (IPV:NLI).

- **Filtering bypassed by a mail flow rule**:

  ```text
  X-Forefront-Antispam-Report: CIP:203.0.113.10;CTRY:GB;LANG:en;
    SFV:SKN;IPV:NLI;SRV:;H:partner-mail.contoso.com;
    CAT:NONE;DIR:INB;
  ```

  `SFV:SKN` indicates a mail flow rule skipped spam filtering for the message. Check your mail flow rules for the matching condition.

- **Filtering bypassed by the IP Allow List**:

  ```text
  X-Forefront-Antispam-Report: CIP:192.0.2.25;CTRY:DE;LANG:de;
    SFV:SKI;IPV:CAL;SRV:;H:smtp.fabrikam.de;
    CAT:NONE;DIR:INB;
  ```

  The source IP (192.0.2.25) is in the IP Allow List (SFV:SKI, IPV:CAL). Connection filtering bypassed spam filtering.

- **Message marked as spam by an ASF setting**:

  ```text
  X-Forefront-Antispam-Report: CIP:198.51.100.99;CTRY:US;LANG:en;
    SFV:SPM;IPV:NLI;SRV:;H:bulk.adatum.com;
    CAT:HSPM;DIR:INB;
  X-CustomSpam: Web bug
  ```

  The message matched the **Web bugs in HTML** ASF setting (X-CustomSpam: Web bug), which marked it as **High confidence spam** (CAT:HSPM). The message probably contains a 1x1 tracking pixel. If the message is a legitimate newsletter, disable the `MarkAsSpamWebBugsInHtml` ASF setting.

- **Message marked as spam by a DMARC failure**:

  ```text
  X-Forefront-Antispam-Report: CIP:198.51.100.77;CTRY:US;LANG:en;
    SFV:SPM;IPV:NLI;SRV:;CAT:SPOOF;DIR:INB;
  Authentication-Results: spf=fail (sender IP is 198.51.100.77)
    smtp.mailfrom=fabrikam.com; dkim=none;
    dmarc=fail action=quarantine header.from=fabrikam.com;
    compauth=fail reason=000
  ```

  The message failed DMARC (compauth=fail reason=000), and the sender's DMARC policy specified quarantine. Anti-spoofing (DMARC) enforcement marked the message as spam (CAT:SPOOF), not the spam filter (content filter).

- **Filtering bypassed by user Safe Senders**:

  ```text
  X-Forefront-Antispam-Report: CIP:203.0.113.55;CTRY:IN;LANG:en;
    SFV:SFE;IPV:NLI;SRV:;CAT:NONE;DIR:INB;
  ```

  The sender is in the recipient's Safe Senders list (SFV:SFE). Spam filtering was skipped. To verify, [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and check the user's junk email configuration:

  ```powershell
  Get-MailboxJunkEmailConfiguration -Identity "user@contoso.com" | Select-Object TrustedSendersAndDomains
  ```

### Filtering decision quick reference

|Header evidence|Component|Admin action|
|---|---|---|
|`CAT:HPHSH`|**High confidence phishing detection**|Allow lists can't override this verdict.|
|`compauth=fail reason=000` + `CAT:SPOOF`|**DMARC/anti-spoofing**|Review sender's DMARC policy; check Authenticated Received Chain (ARC) configuration.|
|`SFV:BLK`|**User Blocked Senders** (Outlook)|Check _BlockedSendersAndDomains_ from **Get-MailboxJunkEmailConfiguration**.|
|`SFV:SFE`|**User Safe Senders** (Outlook)|Check _TrustedSendersAndDomains_ from **Get-MailboxJunkEmailConfiguration**.|
|`SFV:SKA`|**Anti-spam policy** (allowed sender/domain list)|Review allowed senders in the anti-spam policy.|
|`SFV:SKB`|**Anti-spam policy** (blocked sender/domain list)|Review blocked senders in the anti-spam policy.|
|`SFV:SKI` + `IPV:CAL`|**Connection filter** (IP Allow List)|Check _IPAllowList_ from **Get-HostedConnectionFilterPolicy**.|
|`SFV:SKN` (bypass spam filtering)|**Mail flow rule**|[Find all SCL-setting mail flow rules](#find-all-scl-setting-mail-flow-rules)|
|`SFV:SKS` (marked as spam before spam filtering)|**Mail flow rule or on-premises Exchange**|[Find all SCL-setting mail flow rules](#find-all-scl-setting-mail-flow-rules). In [hybrid deployments](/exchange/exchange-hybrid), also check on-premises spam decisions.|
|`SFV:SPM` + `X-CustomSpam:` header present|**ASF setting**|Identify and disable the problematic [ASF setting](anti-spam-policies-asf-settings-about.md).|
|`SFV:SPM` or `SFV:NSPM`, no `X-CustomSpam`|**Spam filter (content filter)**|Review anti-spam policy actions; submit false positives.|
|`SRV:BULK` + BCL value in `X-Microsoft-Antispam`|**Bulk email detection** (BCL threshold)|Adjust the BCL threshold in the anti-spam policy.|

## ASF settings that cause false positives

[Advanced Spam Filter (ASF) settings](anti-spam-policies-asf-settings-about.md) mark messages as spam based on specific message properties. While these settings target characteristics commonly found in spam, they can cause **false positives** when legitimate messages contain the same properties.

> [!NOTE]
> Enabling one or more ASF settings is an **aggressive** approach to spam filtering. You can't report messages that ASF settings flag as false positives to Microsoft. Microsoft no longer recommends enabling ASF settings, since the capabilities are already covered by other layers of the filtering stack.

The following tables identify ASF settings that commonly cause false positives and provide guidance on when to disable them.

### Increase spam score settings

These settings increase the spam score of matching messages, which increases the chance that the message receives a **Spam** filter verdict and the corresponding action in anti-spam policies. Not every message that matches these conditions is marked as spam.

|ASF setting|PowerShell parameter|Why it causes false positives|Recommendation|
|---|---|---|---|
|**Image links to remote websites**|`IncreaseScoreWithImageLinks`|Flags messages containing `<Img>` HTML tag links to remote sites. Some legitimate HTML emails include remote images.|**Turn off** if you receive legitimate emails with remote image links.|
|**Numeric IP address in URL**|`IncreaseScoreWithNumericIps`|Flags messages containing URLs with numeric IP addresses (for example, `http://192.168.1.1/`). Some legitimate internal systems or partner applications use IP-based URLs.|**Turn off** if you have legitimate senders that use IP-based URLs.|
|**URL redirect to other port**|`IncreaseScoreWithRedirectToOtherPort`|Flags messages containing URLs that redirect to TCP ports other than 80 (HTTP), 8080 (alternate HTTP), or 443 (HTTPS). Some legitimate web applications use nonstandard ports.|**Turn off** if legitimate messages contain links to nonstandard ports.|
|**Links to .biz or .info websites**|`IncreaseScoreWithBizOrInfoUrls`|Flags messages containing `.biz` or `.info` URLs. Many legitimate businesses use these TLDs.|**Turn off** if you communicate with legitimate senders that use `.biz` or `.info` domains.|

### Mark as spam settings

The following **Mark as spam** settings mark detected messages with a **High confidence spam** filter verdict and the corresponding action in anti-spam policies:

|ASF setting|PowerShell parameter|Why it causes false positives|Recommendation|
|---|---|---|---|
|**Empty messages**|`MarkAsSpamEmptyMessages`|Flags messages with no subject, no body content, and no attachments. Some automated notifications or system alerts can be empty.|**Turn off** if you receive legitimate empty system notifications.|
|**Embedded tags in HTML**|`MarkAsSpamEmbedTagsInHtml`|Flags messages containing `<embed>` HTML tags. Some legitimate HTML emails use embed tags for media content.|**Turn off** if you receive legitimate HTML emails with embedded media.|
|**JavaScript or VBScript in HTML**|`MarkAsSpamJavaScriptInHtml`|Flags messages containing JavaScript or VBScript. Some legitimate email newsletters or marketing platforms include scripts.|**Turn off** unless your organization specifically requires blocking scripts in email.|
|**Form tags in HTML**|`MarkAsSpamFormTagsInHtml`|Flags messages with `<form>` HTML tags. Legitimate survey invitations or interactive emails might use form tags.|Evaluate on a case-by-case basis. Leave **on** for high-security environments.|
|**Frame or iframe tags in HTML**|`MarkAsSpamFramesInHtml`|Flags messages with `<frame>` or `<iframe>` HTML tags. Some legitimate emails from older systems use frames.|**Turn off** if you receive legitimate emails with frames.|
|**Web bugs in HTML**|`MarkAsSpamWebBugsInHtml`|Flags messages containing tracking pixels (1×1 images). Nearly all modern marketing emails and newsletters contain tracking pixels.|**Turn off**. This setting causes a **very high rate of false positives** because tracking pixels are standard in legitimate marketing email.|
|**Object tags in HTML**|`MarkAsSpamObjectTagsInHtml`|Flags messages with `<object>` HTML tags. Rare in legitimate email.|Can typically leave **on** unless you receive specific false positives.|
|**Sensitive words**|`MarkAsSpamSensitiveWordList`|Flags messages containing words from Microsoft's sensitive word list. Can flag legitimate HR, medical, or financial communications.|**Turn off** if you experience false positives in business communications involving medical, financial, or HR-related content.|
|**SPF record: hard fail**|`MarkAsSpamSpfRecordHardFail`|Flags messages where SPF returns a hard fail. Legitimate senders with misconfigured SPF records or forwarded messages trigger this setting. Test mode isn't available for this setting.|**Turn off** unless you verified all legitimate senders have correct SPF records. Use DMARC enforcement instead.|

The following **Mark as spam** settings mark detected messages with a **Spam** filter verdict and the corresponding action in anti-spam policies:

|ASF setting|PowerShell parameter|Why it causes false positives|Recommendation|
|---|---|---|---|
|**Sender ID filtering: hard fail**|`MarkAsSpamFromAddressAuthFail`|Flags messages that fail Sender ID checks. Sender ID is a deprecated protocol that many legitimate senders don't support. Test mode isn't available for this setting.|**Turn off**. Sender ID is obsolete. Use SPF/DKIM/DMARC instead.|
|**NDR backscatter**|`MarkAsSpamNdrBackscatter`|Flags nondelivery reports (NDRs) that appear to be backscatter (NDRs for messages the user didn't send). Can flag legitimate bounce messages. Test mode isn't available for this setting.|**Turn off** unless you experience significant backscatter. Legitimate NDRs from valid mail systems can be incorrectly flagged.|

### How to identify ASF-caused false positives

When an ASF setting flags a message, a `X-CustomSpam` X-header is added to the message. The header value identifies which ASF setting triggered. For the complete list of `X-CustomSpam` header values and their corresponding ASF settings, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

### How to disable ASF settings

You can disable ASF settings in the Microsoft Defender portal or in Exchange Online PowerShell. For detailed steps, see [Enable, disable, or test ASF settings](anti-spam-policies-asf-settings-about.md#enable-disable-or-test-asf-settings).

> [!TIP]
> Use **Test mode** (available for most Increase spam score and Mark as spam settings) before you enable ASF settings in production. In Test mode, the ASF setting adds the corresponding `X-CustomSpam` X-header to the message but takes no action. This approach lets you identify affected messages by using message trace or header analysis before committing to the setting.
>
> Test mode **isn't available** for the following ASF settings: **SPF record: hard fail** (`MarkAsSpamSpfRecordHardFail`), **Sender ID filtering: hard fail** (`MarkAsSpamFromAddressAuthFail`), and **NDR backscatter** (`MarkAsSpamNdrBackscatter`).

## Troubleshooting workflow

Use the following workflow to diagnose anti-spam policy issues:

1. **Identify which component filtered the message**: Use message headers to determine whether spam filtering, a mail flow rule, connection filtering, or another component filtered the message. For detailed steps, see [Determine which component filtered the message](#determine-which-component-filtered-the-message).

1. **Check for policy precedence issues**:
   - Is the user included in the [Standard or Strict preset security policies](preset-security-policies.md)? Strict is applied before Standard, which is applied before any custom policies.
   - Do multiple custom policies match? The highest priority policy (lowest priority number) wins.
   - No custom policy matches? The default policy applies.

1. **Check for ASF false positives**:
   - Look for an `X-CustomSpam` header in the message headers. The header value identifies which ASF setting triggered.
   - Disable the problematic ASF setting or use Test mode.

## Diagnostic PowerShell commands

[Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) and use the following commands to quickly diagnose anti-spam policy configuration issues.

```powershell
# List all anti-spam policies with their priority and state
Get-HostedContentFilterRule | Sort-Object Priority | Format-Table Name, Priority, State, SentTo, SentToMemberOf, RecipientDomainIs

# Check for SCL-setting mail flow rules
Get-TransportRule | Where-Object {$_.SetSCL -ne $null} | Format-Table Name, State, SetSCL, Priority

# Check connection filter (IP Allow/Block lists)
Get-HostedConnectionFilterPolicy | Format-List IPAllowList, IPBlockList

# View the full settings of a specific policy
Get-HostedContentFilterPolicy -Identity "Default" | Format-List

# Check if any ASF settings are enabled
Get-HostedContentFilterPolicy | Format-Table Identity, MarkAsSpam*, IncreaseScoreWith* -AutoSize

# Check allowed/blocked senders in anti-spam policies
Get-HostedContentFilterPolicy | Format-Table Identity, AllowedSenders, AllowedSenderDomains, BlockedSenders, BlockedSenderDomains
```

## Related content

- [Order and precedence of email protection](how-policies-and-protections-are-combined.md)
- [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md)
- [Spam confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md)
- [Use mail flow rules to set the SCL](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl)
- [Anti-spam message headers](message-headers-eop-mdo.md)
- [Message Header Analyzer tool](https://mha.azurewebsites.net/)
- [Message trace in the EAC](/exchange/monitoring/trace-an-email-message/message-trace-modern-eac)
- [How to handle legitimate emails getting blocked (false positives)](step-by-step-guides/how-to-handle-false-positives-in-microsoft-defender-for-office-365.md)
- [Report messages and files to Microsoft](submissions-report-messages-files-to-microsoft.md)
