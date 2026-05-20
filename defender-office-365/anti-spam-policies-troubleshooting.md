---
title: Troubleshoot anti-spam policy issues in Microsoft Defender for Office 365
author: chrisda
ms.author: chrisda
ms.topic: troubleshooting
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom:
description: Diagnose and resolve common anti-spam policy issues including policy precedence conflicts, SCL override behavior, and false positives caused by Advanced Spam Filter (ASF) settings.
ms.service: defender-office-365
ms.date: 05/19/2026
ai-usage: ai-assisted
#customer intent: As an admin, I want to troubleshoot anti-spam policy issues so that I can resolve policy precedence conflicts, unexpected SCL overrides, and ASF false positives.
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Troubleshoot common anti-spam policy issues

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Administrators can use the information in this article to diagnose and resolve the most common issues related to anti-spam policy configuration, including policy precedence conflicts, unexpected SCL overrides, and false positives caused by Advanced Spam Filter (ASF) settings.

## Policy precedence issues

Anti-spam policies are evaluated in a specific order. Only the **first matching policy** (highest priority) applies to a recipient. Understanding this order is critical when multiple policies exist. Anti-spam policies are processed in the following order:

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

The spam confidence level (SCL) determines how messages are classified. Certain mechanisms can override the SCL value assigned by spam filtering, which affects whether messages are delivered to the Inbox, delivered to the Junk Email folder, or quarantined. For SCL values and their default actions, see [Spam confidence level (SCL)](anti-spam-spam-confidence-level-scl-about.md).

The following mechanisms can override the SCL value assigned by spam filtering. Understanding their behavior and limitations is essential for troubleshooting:

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

**Likely cause**: A mail flow rule sets SCL to -1 for too broad a scope (for example, all messages from a specific domain or IP range, or all messages routed through a connector).

**How to diagnose**:

1. On the **Rules** page in the Exchange admin center at <https://admin.exchange.microsoft.com/#/transportrules>, look for rules with the action **Set the spam confidence level (SCL)** to **Bypass spam filtering** or **-1**.
1. Review the conditions. Are they overly broad?

**Resolution**:

- **Narrow the conditions**: [Add more conditions to the rule](/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules#view-or-modify-a-mail-flow-rule) (for example, sender address + specific header value).
- **Use Enhanced Filtering for Connectors instead**: If the rule exists because mail routes through a non-Microsoft service, configure [Enhanced Filtering for Connectors](/exchange/mail-flow-best-practices/use-connectors-to-configure-mail-flow/enhanced-filtering-for-connectors) and remove the SCL -1 rule.
- **Use the advanced delivery policy**: For SecOps mailboxes or phishing simulations, use the [advanced delivery policy](advanced-delivery-policy-configure.md) instead of mail flow rules.

### Problem: Allow list entries aren't working

**Symptom**: You added a sender to the allowed senders list in the anti-spam policy, but messages from that sender are still being filtered.

**Likely cause**: The user is covered by a preset security policy that overrides the custom anti-spam policy settings. Or, the message is being caught by malware or high confidence phishing filtering, which can't be overridden by allow lists.

**How to diagnose**:

1. Check [message headers](message-headers-eop-mdo.md) for the `X-Forefront-Antispam-Report` header and look for the `SFV` (spam filtering verdict) value:
   - `SFV:SKA` = Message was allowed (skipped filtering due to an allow list entry).
   - `SFV:SPM` = Message was marked as spam (allow list wasn't applied).
1. Check if the message was caught by malware or phishing filtering, not spam filtering.

**Resolution**:

- If the user is in a preset security policy, allowed sender/domain lists in custom policies are ignored. Use the [Tenant Allow/Block List](tenant-allow-block-list-about.md) instead.
- If the message is flagged for malware or high confidence phishing, [report it as a false positive](submissions-admin.md) via **Submissions** in the Microsoft Defender portal at <https://security.microsoft.com/reportsubmission>.

## ASF settings that cause false positives

[Advanced Spam Filter (ASF) settings](anti-spam-policies-asf-settings-about.md) mark messages as spam based on specific message properties. While these settings target characteristics commonly found in spam, they can cause **false positives** when legitimate messages contain the same properties.

> [!NOTE]
> Enabling one or more ASF settings is an **aggressive** approach to spam filtering. You can't report messages that are flagged by ASF settings as false positives to Microsoft. ASF settings are being deprecated, and the features are being incorporated into other parts of the filtering stack.

The following tables identify ASF settings that commonly cause false positives and provide guidance on when to disable them.

### Increase spam score settings

These settings **increase the SCL** of matching messages, giving them a higher chance of being marked as **Spam** (SCL 5 or 6):

|ASF setting|PowerShell parameter|Why it causes false positives|Recommendation|
|---|---|---|---|
|**SPF record: hard fail**|`MarkAsSpamSpfRecordHardFail`|Flags messages where SPF returns a hard fail. Legitimate senders with misconfigured SPF records or forwarded messages trigger this setting.|**Turn off** unless you verified all legitimate senders have correct SPF records. Use DMARC enforcement instead.|
|**Sender ID filtering: hard fail**|`MarkAsSpamFromAddressAuthFail`|Flags messages that fail Sender ID checks. Sender ID is a deprecated protocol that many legitimate senders don't support. Test mode isn't available for this setting.|**Turn off**. Sender ID is obsolete. Use SPF/DKIM/DMARC instead.|
|**NDR backscatter**|`MarkAsSpamNdrBackscatter`|Flags nondelivery reports (NDRs) that appear to be backscatter (NDRs for messages the user didn't send). Can flag legitimate bounce messages.|**Turn off** unless you experience significant backscatter. Legitimate NDRs from valid mail systems can be incorrectly flagged.|
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

### How to identify ASF-caused false positives

When an ASF setting flags a message, a `X-CustomSpam` X-header is added to the message. The header value identifies which ASF setting triggered. For the complete list of `X-CustomSpam` header values and their corresponding ASF settings, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

### How to disable ASF settings

You can disable ASF settings in the Microsoft Defender portal or in Exchange Online PowerShell. For detailed steps, see [Enable, disable, or test ASF settings](anti-spam-policies-asf-settings-about.md#enable-disable-or-test-asf-settings).

> [!TIP]
> Use **Test mode** (available for most Increase spam score and Mark as spam settings) before you enable ASF settings in production. In Test mode, the ASF setting adds the corresponding `X-CustomSpam` X-header to the message but takes no action. This approach lets you identify affected messages by using message trace or header analysis before committing to the setting.
>
> Test mode **isn't available** for the following ASF settings: **Sender ID filtering: hard fail** (`MarkAsSpamFromAddressAuthFail`) and **NDR backscatter** (`MarkAsSpamNdrBackscatter`).

## Troubleshooting workflow

Use the following workflow to diagnose anti-spam policy issues:

1. **Identify which policy applied**: Check [message headers](message-headers-eop-mdo.md) for the `X-Forefront-Antispam-Report` header and look at the `SFV` value:
   - `SFV:SKN` = Skipped filtering (mail flow rule or other reason)
   - `SFV:SKI` = Skipped filtering (IP Allow List)
   - `SFV:SKA` = Skipped filtering (allowed sender/domain)
   - `SFV:SPM` = Marked as Spam
   - `SFV:SFE` = Filtering skipped (Safe Senders)
   - `SFV:BLK` = Blocked sender

1. **Check for policy precedence issues**:
   - Is the user in a Strict/Standard preset? The preset wins.
   - Do multiple custom policies match? The lowest priority number wins.
   - No custom policy matches? The default policy applies.

1. **Check for SCL overrides**:
   - Is there a mail flow rule setting SCL? Review the rule conditions.
   - Is the sender on an IP Allow List? Review connection filter settings.
   - Is the sender in an allowed list? Review the anti-spam policy.

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
- [How to handle legitimate emails getting blocked (false positives)](step-by-step-guides/how-to-handle-false-positives-in-microsoft-defender-for-office-365.md)
- [Report messages and files to Microsoft](submissions-report-messages-files-to-microsoft.md)
