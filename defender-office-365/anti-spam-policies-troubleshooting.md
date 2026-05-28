---
title: Troubleshoot anti-spam policy issues in Microsoft Defender for Office 365
author: chrisda
ms.author: chrisda
ms.topic: troubleshooting
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom: msecd-doc-authoring-1012
description: Diagnose and resolve anti-spam policy issues including policy precedence conflicts, SCL override behavior, and false positives from ASF settings in Defender for Office 365.
ms.service: defender-office-365
ms.date: 05/21/2026
ai-usage: ai-assisted
#customer intent: As an admin, I want to troubleshoot anti-spam policy issues so that I can resolve policy precedence conflicts, unexpected SCL overrides, and ASF false positives.
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Troubleshoot common anti-spam policy issues

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Use the following information to diagnose and resolve common anti-spam policy issues:

- Policy precedence conflicts.
- Unexpected SCL overrides.
- False positives from Advanced Spam Filter (ASF) settings.

## Policy precedence issues

Anti-spam policies are evaluated in a specific order. Only the **first matching policy** (highest priority) applies to a recipient. This order matters when multiple policies exist. Anti-spam policies are processed in the following order:

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

**Symptom**: You configured a custom anti-spam policy with specific settings (for example, a higher BCL threshold or a different spam action), but the settings aren't taking effect for some users.

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

## SCL override behavior

The spam confidence level (SCL) determines how messages are classified and acted on. Certain mechanisms can override the SCL value that spam filtering assigns, which affects whether messages go to the Inbox, the Junk Email folder, or quarantine. For SCL values and their default actions, see [Spam confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md).

The following mechanisms can override the SCL value that spam filtering assigns. Their behavior and limitations affect troubleshooting:

|Override mechanism|SCL effect|Limitations|Details|
|---|---|---|---|
|**Mail flow rules (transport rules)**|Can set SCL to -1 (bypass) or 0-9|**Can't bypass** malware or high confidence phishing filtering. SCL -1 overrides spam filtering only.|[Use mail flow rules to set the SCL](/exchange/security-and-compliance/mail-flow-rules/use-rules-to-set-scl)|
|**IP Allow List** (connection filtering)|Sets SCL to -1 for messages from allowed IPs|Doesn't bypass malware or high confidence phishing scanning. Doesn't override DMARC failures.|[Configure connection filtering](connection-filter-policies-configure.md)|
|**Allowed senders/domains** (anti-spam policy)|Bypasses spam filtering for specified senders or domains|High risk: attackers can spoof allowed domains. Doesn't bypass malware or high confidence phishing.|[Create safe sender lists](create-safe-sender-lists-in-office-365.md)|
|**Tenant Allow/Block List**|Allows or blocks specific senders, domains, URLs, or files|Allow entries are temporary by default. Block entries override allow entries.|[Tenant Allow/Block List](tenant-allow-block-list-about.md)|
|**Outlook Safe Senders** (user-level)|Sets SCL to -1 for messages from senders in the user's Safe Senders list|Doesn't bypass malware or high confidence phishing. Creates risk of targeted spoofing.|[Safelist aggregation](/exchange/antispam-and-antimalware/antispam-protection/safelist-aggregation)|
|**Advanced delivery policy**|Bypasses filtering for SecOps mailboxes and phishing simulation messages|Purpose-built for specific scenarios. Don't use for general allow lists.|[Configure advanced delivery policy](advanced-delivery-policy-configure.md)|
|**Enhanced Filtering for Connectors** (skip listing)|Preserves original source IP for accurate SPF/authentication checks|Doesn't directly set SCL but affects how filtering evaluates the message source.|[Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors)|

> [!CAUTION]
> Even when an override sets SCL to -1 (bypass spam filtering), the following protections are **never** bypassed:
>
> - **Malware scanning**: Messages containing malware are always quarantined.
> - **High confidence phishing (HPHISH)**: Messages identified as high confidence phishing are always quarantined (unless the MX record doesn't point to Microsoft 365 and an SCL -1 rule is in place).
>
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

## Determine which component set the SCL

When you troubleshoot unexpected spam filtering behavior, identify **which component** assigned the SCL value to the message. Multiple components in the Exchange Online filtering pipeline can set or override the SCL: spam filtering, mail flow rules, connection filtering, allowed/blocked sender lists, and Advanced Spam Filter (ASF) settings.

The following steps show how to use message X-headers to trace the SCL source.

### Step 1: Get the message headers

To analyze how the SCL was set, you need the full internet message headers of the affected message:

- **Outlook (desktop)**: Open the message \> select **File** > **Properties**. The headers appear in the **Internet headers** box.
- **Outlook on the web**: Open the message \> select **...** (More actions) \> **View** \> **View message details**.
- **Admin (Message trace)**: On the **Message trace** page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/messagetrace>, find the message and view the header details.

> [!TIP]
> Copy and paste the full headers into the [Message Header Analyzer](https://mha.azurewebsites.net/) tool to parse them into a readable format.

### Step 2: Locate the key X-headers

The following X-headers contain the information you need to trace the SCL source:

|Header|Purpose|
|---|---|
|`X-Forefront-Antispam-Report`|Contains the SCL value, spam filtering verdict (SFV), IP verdict (IPV), threat category (CAT), and other filtering decisions.|
|`X-Microsoft-Antispam`|Contains the bulk complaint level (BCL) and other diagnostic fields.|
|`X-MS-Exchange-Organization-SCL`|Contains the final SCL value stamped on the message.|
|`X-CustomSpam`|Present only when an ASF setting flagged the message. Identifies which ASF rule triggered.|
|`Authentication-Results`|Contains SPF, DKIM, DMARC, and composite authentication (compauth) results.|

For full details on all header fields, see [Anti-spam message headers in cloud organizations](message-headers-eop-mdo.md).

### Step 3: Read the Spam Filtering Verdict

The **SFV** (Spam Filtering Verdict) field in the `X-Forefront-Antispam-Report` header is the primary indicator of which component determined the message's fate:

|SFV value|Component that set the SCL|Meaning|
|---|---|---|
|`SFV:SPM`|**Spam filtering (content filter)**|Spam filtering marked the message as spam based on content analysis.|
|`SFV:NSPM`|**Spam filtering (content filter)**|Spam filtering determined the message wasn't spam.|
|`SFV:SKN`|**Mail flow rule (transport rule)**|The SCL was set to -1 (bypass spam filtering) **before** spam filtering processed the message.|
|`SFV:SKS`|**Mail flow rule (transport rule)**|The SCL was set to 5–9 **before** spam filtering processed the message.|
|`SFV:SKI`|**IP Allow/Block List (connection filtering)**|The message skipped spam filtering because the source IP was in the IP Allow List.|
|`SFV:SKA`|**Anti-spam policy allowed sender/domain list**|The message skipped spam filtering because the sender or domain is in the allowed senders/domains list.|
|`SFV:SKB`|**Anti-spam policy blocked sender/domain list**|The message was marked as spam because the sender or domain is in the blocked senders/domains list.|
|`SFV:SFE`|**User Safe Senders list**|Filtering was skipped because the sender is in the recipient's Outlook Safe Senders list.|
|`SFV:BLK`|**User Blocked Senders list**|The message was blocked because the sender is in the recipient's Outlook Blocked Senders list.|
|`SFV:SKQ`|**Quarantine release**|The message was released from quarantine and delivered to the intended recipients.|

### Step 4: Check the IPV field for connection-level decisions

The **IPV** (IP Verdict) field indicates whether the connection filter made a decision about the source IP:

|IPV value|Meaning|
|---|---|
|`IPV:CAL`|The source IP address is in the **IP Allow List** in the connection filter policy. Spam filtering was skipped.|
|`IPV:NLI`|The IP address wasn't found on any IP reputation list. No connection-level override occurred.|

If you see `IPV:CAL` with `SCL:-1`, the **connection filter** (IP Allow List) is the component that bypassed spam filtering.

### Step 5: Check for ASF overrides

If an ASF setting flagged the message, a separate `X-CustomSpam` header is added that identifies which ASF rule triggered. For example:

```text
X-CustomSpam: Web bug
```

For the complete list of ASF settings, `X-CustomSpam` values, and their SCL effects, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

> [!NOTE]
> ASF adds the `X-CustomSpam` header **after** mail flow rules process the message. You can't use mail flow rules to identify or act on messages that ASF flags.

### Step 6: Check for mail flow rule involvement

If `SFV:SKN` or `SFV:SKS` appears in the header, a **mail flow rule** set the SCL before spam filtering processed the message.

To identify which mail flow rule is responsible:

1. On the **Rules** page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/transportrules>, look for rules with the action **Set the spam confidence level (SCL)**.
1. Cross-reference the rule conditions with the affected message.

Alternatively, use **Message trace** in the EAC. The detailed message trace output shows an `AGENTINFO` event that identifies which rule fired.

#### PowerShell: Find all SCL-setting mail flow rules

```powershell
# Connect to Exchange Online PowerShell
Connect-ExchangeOnline

# List all mail flow rules that set the SCL
Get-TransportRule | Where-Object {$_.SetSCL -ne $null} |
    Format-Table Name, State, Priority, SetSCL, @{N='Conditions';E={$_.Conditions | Out-String}} -AutoSize -Wrap
```

### Decision tree: Trace the SCL source

Use the following workflow to systematically identify which component set the SCL. Start by reading the `X-Forefront-Antispam-Report` header:

1. **Check the SFV value**:
   - `SFV:SKN`: Mail flow rule set SCL to -1 (bypassed filtering).
   - `SFV:SKS`: Mail flow rule set SCL to 5-9 (pre-marked as spam).
   - `SFV:SKI`: Connection filter (IP Allow List) bypassed filtering. Confirm that `IPV:CAL` is also present.
   - `SFV:SKA`: Anti-spam policy allowed sender/domain list.
   - `SFV:SKB`: Anti-spam policy blocked sender/domain list.
   - `SFV:SFE`: User's Safe Senders list.
   - `SFV:BLK`: User's Blocked Senders list.
   - `SFV:SPM`: Content filter marked as Spam. Check the `CAT` value for threat type and the `X-CustomSpam` header for ASF triggers.
   - `SFV:NSPM`: Content filter marked as Not Spam.

1. **Check the X-CustomSpam header** (if present): An ASF setting triggered. Identify which setting and disable it if the message is a false positive.

1. **Check Authentication-Results (compauth)**:
   - `compauth=fail reason=000`: DMARC explicit failure (might set SCL 7+).
   - `compauth=fail reason=001`: Implicit authentication failure (spoof intelligence).

1. **Check the SCL value**:
   - `SCL:-1`: Filtering was bypassed (source identified in the SFV value).
   - `SCL:0-1`: Not spam (content filter or override).
   - `SCL:5-6`: Spam (content filter, ASF, or mail flow rule).
   - `SCL:7-9`: High confidence spam (content filter, ASF, DMARC, or analyst).

### Real-world header examples

The following examples show how to interpret message headers to identify which component set the SCL.

- **SCL set by spam filtering**:

  ```text
  X-Forefront-Antispam-Report: CIP:198.51.100.50;CTRY:US;LANG:en;
    SCL:5;SFV:SPM;IPV:NLI;SRV:;H:mail.example.com;PTR:mail.example.com;
    CAT:SPM;SFTY:;DIR:INB;
  X-MS-Exchange-Organization-SCL: 5
  ```

  The content filter marked the message as **Spam** (SFV:SPM, CAT:SPM, SCL:5). No override occurred (IPV:NLI). The spam filtering engine assigned the SCL.

- **SCL set by a mail flow rule**:

  ```text
  X-Forefront-Antispam-Report: CIP:203.0.113.10;CTRY:GB;LANG:en;
    SCL:-1;SFV:SKN;IPV:NLI;SRV:;H:partner-mail.contoso.com;
    CAT:NONE;DIR:INB;
  X-MS-Exchange-Organization-SCL: -1
  ```

  A mail flow rule set SCL to -1 **before** spam filtering (SFV:SKN). The message bypassed spam filtering entirely. Check your transport rules for the matching condition.

- **SCL set by IP Allow List**:

  ```text
  X-Forefront-Antispam-Report: CIP:192.0.2.25;CTRY:DE;LANG:de;
    SCL:-1;SFV:SKI;IPV:CAL;SRV:;H:smtp.partner.de;
    CAT:NONE;DIR:INB;
  X-MS-Exchange-Organization-SCL: -1
  ```

  The source IP (192.0.2.25) is in the IP Allow List (SFV:SKI, IPV:CAL). Connection filtering bypassed spam filtering and set SCL to -1.

- **SCL set by ASF setting**:

  ```text
  X-Forefront-Antispam-Report: CIP:198.51.100.99;CTRY:US;LANG:en;
    SCL:9;SFV:SPM;IPV:NLI;SRV:;H:bulk.sender.com;
    CAT:HSPM;DIR:INB;
  X-CustomSpam: Web bug
  X-MS-Exchange-Organization-SCL: 9
  ```

  The message matched the **Web bugs in HTML** ASF setting (X-CustomSpam: Web bug), which set SCL to 9 (High confidence spam). The message probably contains a 1×1 tracking pixel. If the message is a legitimate newsletter, disable the `MarkAsSpamWebBugsInHtml` ASF setting.

- **SCL set by DMARC failure**:

  ```text
  X-Forefront-Antispam-Report: CIP:198.51.100.77;CTRY:US;LANG:en;
    SCL:7;SFV:SPM;IPV:NLI;SRV:;CAT:SPOOF;DIR:INB;
  Authentication-Results: spf=fail (sender IP is 198.51.100.77)
    smtp.mailfrom=example.com; dkim=none;
    dmarc=fail action=quarantine header.from=example.com;
    compauth=fail reason=000
  X-MS-Exchange-Organization-SCL: 7
  ```

  The message failed DMARC (compauth=fail reason=000), the sender's DMARC policy specified quarantine, and the SCL was elevated to 7 (CAT:SPOOF). Anti-spoofing/DMARC enforcement set this value, not the content filter.

- **SCL overridden by user Safe Senders**:

  ```text
  X-Forefront-Antispam-Report: CIP:203.0.113.55;CTRY:IN;LANG:en;
    SCL:-1;SFV:SFE;IPV:NLI;SRV:;CAT:NONE;DIR:INB;
  X-MS-Exchange-Organization-SCL: -1
  ```

  The sender is in the recipient's Safe Senders list (SFV:SFE). Spam filtering was skipped and SCL was set to -1. To verify, check the user's junk email configuration:

  ```powershell
  Get-MailboxJunkEmailConfiguration -Identity "user@contoso.com" |
      Select-Object TrustedSendersAndDomains
  ```

### SCL source identification quick reference

|Header evidence|SCL source component|Admin action|
|---|---|---|
|`SFV:SPM` or `SFV:NSPM`, no `X-CustomSpam`|**Content filter** (spam filtering engine)|Review anti-spam policy actions; submit false positives.|
|`SFV:SPM` + `X-CustomSpam:` header present|**ASF setting**|Identify and disable the problematic ASF setting.|
|`SFV:SKN` (SCL -1) or `SFV:SKS` (SCL 5–9)|**Mail flow rule** (transport rule)|Review `Get-TransportRule` for SCL-setting rules.|
|`SFV:SKI` + `IPV:CAL`|**Connection filter** (IP Allow List)|Review `Get-HostedConnectionFilterPolicy`.|
|`SFV:SKA`|**Anti-spam policy** (allowed sender/domain list)|Review allowed senders in anti-spam policy.|
|`SFV:SKB`|**Anti-spam policy** (blocked sender/domain list)|Review blocked senders in anti-spam policy.|
|`SFV:SFE`|**User Safe Senders** (Outlook)|Check `Get-MailboxJunkEmailConfiguration`.|
|`SFV:BLK`|**User Blocked Senders** (Outlook)|Check `Get-MailboxJunkEmailConfiguration`.|
|`compauth=fail reason=000` + `CAT:SPOOF`|**DMARC/anti-spoofing**|Review sender's DMARC policy; check ARC configuration.|
|`CAT:HPHSH`|**High confidence phishing detection**|Allow lists can't override this verdict.|
|`SRV:BULK` + BCL value in `X-Microsoft-Antispam`|**Bulk email detection** (BCL threshold)|Adjust BCL threshold in anti-spam policy.|

## ASF settings that cause false positives

[Advanced Spam Filter (ASF) settings](anti-spam-policies-asf-settings-about.md) mark messages as spam based on specific message properties. While these settings target characteristics commonly found in spam, they can cause **false positives** when legitimate messages contain the same properties.

> [!NOTE]
> Enabling one or more ASF settings is an **aggressive** approach to spam filtering. You can't report messages that ASF settings flag as false positives to Microsoft. Microsoft is deprecating ASF settings and incorporating the features into other parts of the filtering stack.

The following tables identify ASF settings that commonly cause false positives and provide guidance on when to disable them.

### Increase spam score settings

These settings **increase the SCL** of matching messages, giving them a higher chance of being marked as **Spam** (SCL 5 or 6):

|ASF setting|PowerShell parameter|Why it causes false positives|Recommendation|
|---|---|---|---|
|**Image links to remote websites**|`IncreaseScoreWithImageLinks`|Flags messages containing `<Img>` HTML tag links to remote sites. Some legitimate HTML emails include remote images.|**Turn off** if you receive legitimate emails with remote image links.|
|**Numeric IP address in URL**|`MarkAsSpamNumericIpLink`|Flags messages containing URLs with numeric IP addresses (for example, `http://192.168.1.1/`). Some legitimate internal systems or partner applications use IP-based URLs.|**Turn off** if you have legitimate senders that use IP-based URLs.|
|**URL redirect to other port**|`MarkAsSpamUrlRedirectsToOtherPort`|Flags messages containing URLs that redirect to TCP ports other than 80 (HTTP), 8080 (alternate HTTP), or 443 (HTTPS). Some legitimate web applications use nonstandard ports.|**Turn off** if legitimate messages contain links to nonstandard ports.|
|**Links to .biz or .info websites**|`MarkAsSpamBizOrInfoUrls`|Flags messages containing `.biz` or `.info` URLs. Many legitimate businesses use these TLDs.|**Turn off** if you communicate with legitimate senders that use `.biz` or `.info` domains.|

### Mark as spam settings

These settings set the SCL to **9** (High confidence spam), which is a more aggressive action:

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

The following Mark as spam settings set the SCL to **6** (Spam) instead of 9:

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

1. **Identify which component set the SCL**: Use message headers to determine whether spam filtering, a mail flow rule, connection filtering, or another component assigned the SCL value. For detailed steps, see [Determine which component set the SCL](#determine-which-component-set-the-scl).

1. **Check for policy precedence issues**:
   - Is the user in a Strict/Standard preset? The preset wins.
   - Do multiple custom policies match? The lowest priority number wins.
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
