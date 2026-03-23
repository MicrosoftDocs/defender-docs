---
title: Recommendations for Microsoft 365 security settings
keywords: Office 365 security recommendations, Sender Policy Framework, Domain-based Message Reporting and Conformance, DomainKeys Identified Mail, steps, how does it work, security baselines, baselines for default protections, baselines for Defender for Office 365, set up Defender for Office 365, configure Defender for Office 365, security configuration
f1.keywords:
  - NOCSH
author: chrisda
ms.author: chrisda
audience: ITPro
ms.topic: article
ms.localizationpriority: medium
search.appverid:
  - MET150
ms.assetid: 6f64f2de-d626-48ed-8084-03cc72301aa4
ms.collection:
  - m365-security
  - m365initiative-defender-office365
  - highpri
  - tier1
description: What are best practices for email and collaboration security settings in Microsoft 365? What are the current recommendations for standard protection? What should you use to be more strict? And what extras do you get if you also use Microsoft Defender for Office 365?
ai-usage: ai-assisted
ms.service: defender-office-365
ms.date: 03/23/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Recommended email and collaboration threat policy settings for cloud organizations

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Although all organizations with cloud mailboxes include [built-in security features](eop-about.md), Microsoft Defender for Office 365 is the primary email and collaboration security solution for Microsoft 365.

We recommend two security levels: **Standard** and **Strict**. Although customer environments and needs are different, these levels of filtering help keep unwanted email out of user mailboxes in most situations.

To automatically apply the Standard or Strict settings to users, use [Preset security policies](preset-security-policies.md).

This article describes the default threat policy settings, and also the recommended Standard and Strict settings to help protect users. The tables contain the settings in the Microsoft Defender portal and Exchange Online PowerShell.

> [!NOTE]
>
> - Threat policies work best when the source email domains for your organization are correctly authenticated. Before tuning anti-phishing or other threat policies, verify the [email authentication](email-authentication-about.md) settings for outbound mail from each sending domains:
>   - [Sender Policy Framework (SPF)](email-authentication-spf-configure.md): Authorizes the services permitted to send mail on behalf of your domain.
>   - [DomainKeys Identified Mail (DKIM)](email-authentication-dkim-configure.md): Signs messages so recipients can verify the message wasn't altered and is authorized by the signing domain.
>   - [Domain-based Message Authentication, Reporting, and Conformance (DMARC)](email-authentication-dmarc-configure.md): Tells recipient systems how to handle messages that fail authentication and whether authentication aligns with the visible From: domain.
>
>   If SPF, DKIM, or DMARC are missing or misconfigured, legitimate messages might be delivered to the Junk Email folder or quarantine, even with the recommended threat policy settings. Fix authentication first, then review and tune policy settings.
>
> - You can use the configuration analyzer to compare the settings in custom threat policies to the recommended Standard or Strict values. For more information, see [Configuration analyzer for threat policies](configuration-analyzer-for-security-policies.md).
>
> - The Office 365 Advanced Threat Protection Recommended Configuration Analyzer (ORCA) module for PowerShell can help admins find the current values of these settings. Specifically, the **Get-ORCAReport** cmdlet generates an assessment of anti-spam, anti-phishing, and other message hygiene settings. You can download the ORCA module at <https://www.powershellgallery.com/packages/ORCA/>.
>
> - We recommend that you leave the Junk Email Filter in Outlook set to **No automatic filtering** to prevent unnecessary conflicts (both positive and negative) with the spam filtering verdicts from Microsoft 365. For more information, see the following articles:
>   - [Configure junk email settings on cloud mailboxes](configure-junk-email-settings-on-exo-mailboxes.md)
>   - [About junk email settings in Outlook](configure-junk-email-settings-on-exo-mailboxes.md#about-outlook-junk-email-settings)
>   - [Change the level of protection in the Junk Email Filter](https://support.microsoft.com/office/e89c12d8-9d61-4320-8c57-d982c8d52f6b)
>   - [Create sender allowlists](create-safe-sender-lists-in-office-365.md)
>   - [Create sender blocklists](create-block-sender-lists-in-office-365.md)
>


<a name='eop-anti-malware-policy-settings'></a>

<a name='default-email-protections-for-cloud-mailboxes'></a>

## Built-in security features for all cloud mailboxes

The [the built-in security features](eop-about.md) in this section are available in all organizations with cloud mailboxes. We recommend the Standard or Strict configurations as described in the tables in the following subsections.

### Anti-malware policy settings

To create and configure anti-malware policies, see [Configure anti-malware policies](anti-malware-policies-configure.md).

Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

The policy named AdminOnlyAccessPolicy enforces the historical capabilities of messages quarantined as malware as described in the table [in this article](quarantine-end-user.md).

Users can't release their own messages quarantined as malware, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.
> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Protection settings**||
> |**Enable the common attachments filter** (_EnableFileFilter_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<sup>\*</sup><br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: For the list of file types in the common attachments filter, see [Common attachments filter in anti-malware policies](anti-malware-protection-about.md#common-attachments-filter-in-anti-malware-policies).<br><br> <sup>\*</sup> The common attachments filter is **on** by default in new anti-malware policies that you create in the Defender portal or in PowerShell, and in the default anti-malware policy in organizations created after December 1, 2023.</details>|
> |Common attachment filter notifications: **When these file types are found** (_FileTypeAction_)|<details><summary>Show details</summary><br>**Default**: **Reject the message with a non-delivery report (NDR)** (`Reject`)<br>**Standard**: **Reject the message with a non-delivery report (NDR)** (`Reject`)<br>**Strict**: **Reject the message with a non-delivery report (NDR)** (`Reject`)</details>|
> |**Enable zero-hour auto purge for malware** (_ZapEnabled_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Quarantine policy** (_QuarantineTag_)|<details><summary>Show details</summary><br>**Default**: AdminOnlyAccessPolicy<br>**Standard**: AdminOnlyAccessPolicy<br>**Strict**: AdminOnlyAccessPolicy</details>|
> |**Admin notifications**||
> |**Notify an admin about undelivered messages from internal senders** (_EnableInternalSenderAdminNotifications_ and _InternalSenderAdminAddress_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false`)<br>**Standard**: Not selected (`$false`)<br>**Strict**: Not selected (`$false`)<br>**Comment**: We have no specific recommendation for this setting.</details>|
> |**Notify an admin about undelivered messages from external senders** (_EnableExternalSenderAdminNotifications_ and _ExternalSenderAdminAddress_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false`)<br>**Standard**: Not selected (`$false`)<br>**Strict**: Not selected (`$false`)<br>**Comment**: We have no specific recommendation for this setting.</details>|
> |**Customize notifications**|**Comment**: We have no specific recommendations for these settings.|
> |**Use customized notification text** (_CustomNotifications_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false`)<br>**Standard**: Not selected (`$false`)<br>**Strict**: Not selected (`$false`)</details>|
> |**From name** (_CustomFromName_)|<details><summary>Show details</summary><br>**Default**: Blank<br>**Standard**: Blank<br>**Strict**: Blank</details>|
> |**From address** (_CustomFromAddress_)|<details><summary>Show details</summary><br>**Default**: Blank<br>**Standard**: Blank<br>**Strict**: Blank</details>|
> |**Customize notifications for messages from internal senders**|<details><summary>Show details</summary><br>**Comment**: These settings are used only if **Notify an admin about undelivered messages from internal senders** is selected.</details>|
> |**Subject** (_CustomInternalSubject_)|<details><summary>Show details</summary><br>**Default**: Blank<br>**Standard**: Blank<br>**Strict**: Blank</details>|
> |**Message** (_CustomInternalBody_)|<details><summary>Show details</summary><br>**Default**: Blank<br>**Standard**: Blank<br>**Strict**: Blank</details>|
> |**Customize notifications for messages from external senders**|**Comment**: These settings are used only if **Notify an admin about undelivered messages from external senders** is selected.|
> |**Subject** (_CustomExternalSubject_)|<details><summary>Show details</summary><br>**Default**: Blank<br>**Standard**: Blank<br>**Strict**: Blank</details>|
> |**Message** (_CustomExternalBody_)|<details><summary>Show details</summary><br>**Default**: Blank<br>**Standard**: Blank<br>**Strict**: Blank</details>|

### Anti-spam policy settings

To create and configure anti-spam policies, see [Configure anti-spam policies](anti-spam-policies-configure.md).

Wherever you select **Quarantine message** as the action for a spam filter verdict, a **Select quarantine policy** box is available. Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

If you _change_ the action of a spam filtering verdict to **Quarantine message** as you create anti-spam policies in the Defender portal, the **Select quarantine policy** box is blank by default. A blank value means the default quarantine policy for that spam filtering verdict is used. These default quarantine policies enforce the historical capabilities of the spam filter verdict that quarantined the message as described in the table [in this article](quarantine-end-user.md). When you later view or edit the anti-spam policy settings, the quarantine policy name is shown.

Admins can create or use quarantine policies with more restrictive or less restrictive capabilities. For instructions, see [Create quarantine policies in the Microsoft Defender portal](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Bulk email threshold & spam properties**||
> |**Bulk email threshold** (_BulkThreshold_)|<details><summary>Show details</summary><br>**Default**: 7<br>**Standard**: 6<br>**Strict**: 5<br>**Comment**: For details, see [Bulk complaint level (BCL)](anti-spam-bulk-complaint-level-bcl-about.md).</details>|
> |**Bulk email spam** (_MarkAsSpamBulkMail_)|<details><summary>Show details</summary><br>**Default**: (`On`)<br>**Standard**: (`On`)<br>**Strict**: (`On`)<br>**Comment**: This setting is only available in PowerShell.</details>|
> |**Increase spam score** settings|<details><summary>Show details</summary><br>**Comment**: All of these settings are part of the Advanced Spam Filter (ASF). For more information, see the [ASF settings in anti-spam policies](#asf-settings-in-anti-spam-policies) section in this article.</details>|
> |**Mark as spam** settings|<details><summary>Show details</summary><br>**Comment**: Most of these settings are part of ASF. For more information, see the [ASF settings in anti-spam policies](#asf-settings-in-anti-spam-policies) section in this article.</details>|
> |**Contains specific languages** (_EnableLanguageBlockList_ and _LanguageBlockList_)|<details><summary>Show details</summary><br>**Default**: **Off** (`$false` and Blank)<br>**Standard**: **Off** (`$false` and Blank)<br>**Strict**: **Off** (`$false` and Blank)<br>**Comment**: We have no specific recommendation for this setting. You can block messages in specific languages based on your business needs.</details>|
> |**From these regions** (_EnableRegionBlockList_ and _RegionBlockList_)|<details><summary>Show details</summary><br>**Default**: **Off** (`$false` and Blank)<br>**Standard**: **Off** (`$false` and Blank)<br>**Strict**: **Off** (`$false` and Blank)<br>**Comment**: We have no specific recommendation for this setting. You can block messages from specific regions based on your business needs.</details>|
> |**Test mode** (_TestModeAction_)|<details><summary>Show details</summary><br>**Default**: **None**<br>**Standard**: **None**<br>**Strict**: **None**<br>**Comment**: This setting is part of ASF. For more information, see the [ASF settings in anti-spam policies](#asf-settings-in-anti-spam-policies) section in this article.</details>|
> |**Actions**||
> |**Spam** detection action (_SpamAction_)|<details><summary>Show details</summary><br>**Default**: **Move message to Junk Email folder** (`MoveToJmf`)<br>**Standard**: **Move message to Junk Email folder** (`MoveToJmf`)<br>**Strict**: **Quarantine message** (`Quarantine`)</details>|
> |**Quarantine policy** for **Spam** (_SpamQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if spam detections are quarantined.</details>|
> |**High confidence spam** detection action (_HighConfidenceSpamAction_)|<details><summary>Show details</summary><br>**Default**: **Move message to Junk Email folder** (`MoveToJmf`)<br>**Standard**: **Quarantine message** (`Quarantine`)<br>**Strict**: **Quarantine message** (`Quarantine`)</details>|
> |**Quarantine policy** for **High confidence spam** (_HighConfidenceSpamQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessWithNotificationPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if high confidence spam detections are quarantined.</details>|
> |**Phishing** detection action (_PhishSpamAction_)|<details><summary>Show details</summary><br>**Default**: **Move message to Junk Email folder** (`MoveToJmf`)<sup>\*</sup><br>**Standard**: **Quarantine message** (`Quarantine`)<br>**Strict**: **Quarantine message** (`Quarantine`)<br>**Comment**: <sup>\*</sup> The default value is **Move message to Junk Email folder** in the default anti-spam policy and in new anti-spam policies that you create in PowerShell. The default value is **Quarantine message** in new anti-spam policies that you create in the Defender portal.</details>|
> |**Quarantine policy** for **Phishing** (_PhishQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessWithNotificationPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if phishing detections are quarantined.</details>|
> |**High confidence phishing** detection action (_HighConfidencePhishAction_)|<details><summary>Show details</summary><br>**Default**: **Quarantine message** (`Quarantine`)<br>**Standard**: **Quarantine message** (`Quarantine`)<br>**Strict**: **Quarantine message** (`Quarantine`)<br>**Comment**: Users can't release their own messages quarantined as high confidence phishing, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.</details>|
> |**Quarantine policy** for **High confidence phishing** (_HighConfidencePhishQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: AdminOnlyAccessPolicy<br>**Standard**: AdminOnlyAccessPolicy<br>**Strict**: AdminOnlyAccessPolicy</details>|
> |**Bulk compliant level (BCL) met or exceeded** (_BulkSpamAction_)|<details><summary>Show details</summary><br>**Default**: **Move message to Junk Email folder** (`MoveToJmf`)<br>**Standard**: **Move message to Junk Email folder** (`MoveToJmf`)<br>**Strict**: **Quarantine message** (`Quarantine`)</details>|
> |**Quarantine policy** for **Bulk compliant level (BCL) met or exceeded** (_BulkQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if bulk detections are quarantined.</details>|
> |**Intra-Organizational messages to take action on** (_IntraOrgFilterState_)|<details><summary>Show details</summary><br>**Default**: **Default** (Default)<br>**Standard**: **Default** (Default)<br>**Strict**: **Default** (Default)<br>**Comment**: The value **Default** is the same as selecting **High confidence phishing messages**. Currently, in U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD), the value **Default** is the same as selecting **None**.</details>|
> |**Retain spam in quarantine for this many days** (_QuarantineRetentionPeriod_)|<details><summary>Show details</summary><br>**Default**: 15 days<br>**Standard**: 30 days<br>**Strict**: 30 days<br>**Comment**: This value also affects messages quarantined by anti-phishing policies. For more information, see [Quarantine retention](quarantine-about.md#quarantine-retention).</details>|
> |**Enable spam safety tips** (_InlineSafetyTipsEnabled_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |Enable zero-hour auto purge (ZAP) for phishing messages (_PhishZapEnabled_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |Enable ZAP for spam messages (_SpamZapEnabled_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Allow & block list**||
> |Allowed senders (_AllowedSenders_)|<details><summary>Show details</summary><br>**Default**: None<br>**Standard**: None<br>**Strict**: None</details>|
> |Allowed sender domains (_AllowedSenderDomains_)|<details><summary>Show details</summary><br>**Default**: None<br>**Standard**: None<br>**Strict**: None<br>**Comment**: Adding domains to the allowed domains list is a bad idea. Attackers would be able to send you email that would otherwise be filtered out.<br><br>Use the [spoof intelligence insight](anti-spoofing-spoof-intelligence.md) and the [Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#spoofed-senders-in-the-tenant-allowblock-list) to review who's spoofing sender email addresses in your domains or external domains.</details>|
> |Blocked senders (_BlockedSenders_)|<details><summary>Show details</summary><br>**Default**: None<br>**Standard**: None<br>**Strict**: None</details>|
> |Blocked sender domains (_BlockedSenderDomains_)|<details><summary>Show details</summary><br>**Default**: None<br>**Standard**: None<br>**Strict**: None</details>|

¹ As described in [Full access permissions and quarantine notifications](quarantine-policies.md#full-access-permissions-and-quarantine-notifications), your organization might use NotificationEnabledPolicy instead of DefaultFullAccessPolicy. Quarantine notifications are turned on in NotificationEnabledPolicy and turned off in DefaultFullAccessPolicy.

#### ASF settings in anti-spam policies

For more information about Advanced Spam Filter (ASF) settings in anti-spam policies, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Image links to remote sites** (_IncreaseScoreWithImageLinks_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Numeric IP address in URL** (_IncreaseScoreWithNumericIps_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**URL redirect to other port** (_IncreaseScoreWithRedirectToOtherPort_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Links to .biz or .info websites** (_IncreaseScoreWithBizOrInfoUrls_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Empty messages** (_MarkAsSpamEmptyMessages_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Embed tags in HTML** (_MarkAsSpamEmbedTagsInHtml_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**JavaScript or VBScript in HTML** (_MarkAsSpamJavaScriptInHtml_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Form tags in HTML** (_MarkAsSpamFormTagsInHtml_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Frame or iframe tags in HTML** (_MarkAsSpamFramesInHtml_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Web bugs in HTML** (_MarkAsSpamWebBugsInHtml_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Object tags in HTML** (_MarkAsSpamObjectTagsInHtml_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Sensitive words** (_MarkAsSpamSensitiveWordList_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**SPF record: hard fail** (_MarkAsSpamSpfRecordHardFail_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Sender ID filtering hard fail** (_MarkAsSpamFromAddressAuthFail_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Backscatter** (_MarkAsSpamNdrBackscatter_)|<details><summary>Show details</summary><br>**Default**: Off<br>**Recommended Standard**: Off<br>**Recommended Strict**: Off</details>|
> |**Test mode** (_TestModeAction_)|<details><summary>Show details</summary><br>**Default**: None<br>**Recommended Standard**: None<br>**Recommended Strict**: None<br>**Comment**: For ASF settings that support **Test** as an action, you can configure the test mode action to **None**, **Add default X-Header text**, or **Send Bcc message** (`None`, `AddXHeader`, or `BccMessage`). For more information, see [Enable, disable, or test ASF settings](anti-spam-policies-asf-settings-about.md#enable-disable-or-test-asf-settings).</details>|

> [!NOTE]
> ASF adds `X-CustomSpam:` X-header fields to messages _after_ Exchange mail flow rules (also known as transport rules) processes messages, so you can't use mail flow rules to identify and act on messages filtered by ASF.

#### Outbound spam policy settings

To create and configure outbound spam policies, see [Configure outbound spam filtering](outbound-spam-policies-configure.md).

For more information about the default sending limits in the service, see [Sending limits](/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits#sending-limits-1).

> [!NOTE]
> Outbound spam policies aren't part of Standard or Strict preset security policies. The **Standard** and **Strict** values indicate our **recommended** values in the default outbound spam policy or custom outbound spam policies that you create.

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Set an external message limit** (_RecipientLimitExternalPerHour_)|<details><summary>Show details</summary><br>**Default**: 0<br>**Recommended Standard**: 500<br>**Recommended Strict**: 400<br>**Comment**: The default value 0 means use the service defaults.</details>|
> |**Set an internal message limit** (_RecipientLimitInternalPerHour_)|<details><summary>Show details</summary><br>**Default**: 0<br>**Recommended Standard**: 1000<br>**Recommended Strict**: 800<br>**Comment**: The default value 0 means use the service defaults.</details>|
> |**Set a daily message limit** (_RecipientLimitPerDay_)|<details><summary>Show details</summary><br>**Default**: 0<br>**Recommended Standard**: 1000<br>**Recommended Strict**: 800<br>**Comment**: The default value 0 means use the service defaults.</details>|
> |**Restriction placed on users who reach the message limit** (_ActionWhenThresholdReached_)|<details><summary>Show details</summary><br>**Default**: **Restrict the user from sending mail until the following day** (`BlockUserForToday`)<br>**Recommended Standard**: **Restrict the user from sending mail** (`BlockUser`)<br>**Recommended Strict**: **Restrict the user from sending mail** (`BlockUser`)</details>|
> |**Automatic forwarding rules** (_AutoForwardingMode_)|<details><summary>Show details</summary><br>**Default**: **Automatic - System-controlled** (`Automatic`)<br>**Recommended Standard**: **Automatic - System-controlled** (`Automatic`)<br>**Recommended Strict**: **Automatic - System-controlled** (`Automatic`)<br>**Comment**: The value **Automatic - System-controlled** (`Automatic`) is equivalent to **Off - Forwarding is disabled** (`Off`). For more information, see [Control automatic external email forwarding](outbound-spam-policies-external-email-forwarding.md).</details>|
> |**Send a copy of outbound messages that exceed these limits to these users and groups** (_BccSuspiciousOutboundMail_ and _BccSuspiciousOutboundAdditionalRecipients_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false` and Blank)<br>**Recommended Standard**: Not selected (`$false` and Blank)<br>**Recommended Strict**: Not selected (`$false` and Blank)<br>**Comment**: This setting works only in the default outbound spam policy. It doesn't work in custom outbound spam policies that you create.<br><br>The Microsoft SecureScore recommendation **Ensure Exchange Online Spam Policies are set to notify administrators** suggests that you configure this value.</details>|
> |**Notify these users and groups if a sender is blocked due to sending outbound spam** (_NotifyOutboundSpam_ and _NotifyOutboundSpamRecipients_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false` and Blank)<br>**Recommended Standard**: Not selected (`$false` and Blank)<br>**Recommended Strict**: Not selected (`$false` and Blank)<br>**Comment**: The default [alert policy](/defender-xdr/alert-policies#threat-management-alert-policies) named **User restricted from sending email** already sends email notifications to members of the **TenantAdmins** group (**Global Administrator** members) when users are blocked due to exceeding the limits in the policy. For instructions, see [Verify the alert settings for restricted users](outbound-spam-restore-restricted-users.md#verify-the-alert-settings-for-restricted-users).<br><br>Although we recommend that you use the alert policy rather than this setting in the outbound spam policy to notify admins and other users, the Microsoft SecureScore recommendation **Ensure Exchange Online Spam Policies are set to notify administrators** suggests that you configure this value.</details>|

<a name='eop-anti-phishing-policy-settings'></a>

### Anti-phishing policy settings for all cloud mailboxes

The anti-phishing policy settings described in this section are part of [the built-in security features](eop-about.md) included in all organizations with cloud mailboxes. For more information about these settings, see [Spoof settings](anti-phishing-policies-about.md#spoof-settings). To configure these settings, see [Configure anti-phishing policies for all cloud mailboxes](anti-phishing-policies-eop-configure.md).

The spoof settings are inter-related, but the **Show first contact safety tip** setting has no dependency on spoof settings.

Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

Although the **Apply quarantine policy** value appears unselected when you create an anti-phishing policy in the Defender portal, the quarantine policy named DefaultFullAccessPolicy¹ is used if you don't select a quarantine policy. This policy enforces the historical capabilities of messages quarantined as spoof as described in the table [in this article](quarantine-end-user.md). When you later view or edit the anti-phishing policy settings, the quarantine policy name is shown.

Admins can create or use quarantine policies with more restrictive or less restrictive capabilities. For instructions, see [Create quarantine policies in the Microsoft Defender portal](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Spoof**||
> |**Enable spoof intelligence** (_EnableSpoofIntelligence_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Actions**||
> |**Honor DMARC record policy when the message is detected as spoof** (_HonorDmarcPolicy_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: When this setting is turned on, you control what happens to messages where the sender fails explicit [DMARC](email-authentication-dmarc-configure.md) checks when the policy action in the DMARC TXT record is set to `p=quarantine` or `p=reject`. For more information, see [Spoof protection and sender DMARC policies](anti-phishing-policies-about.md#spoof-protection-and-sender-dmarc-policies).</details>|
> |**If the message is detected as spoof and DMARC Policy is set as p=quarantine** (_DmarcQuarantineAction_)|<details><summary>Show details</summary><br>**Default**: **Quarantine the message** (`Quarantine`)<br>**Standard**: **Quarantine the message** (`Quarantine`)<br>**Strict**: **Quarantine the message** (`Quarantine`)<br>**Comment**: This action is meaningful only when **Honor DMARC record policy when the message is detected as spoof** is turned on.</details>|
> |**If the message is detected as spoof and DMARC Policy is set as p=reject** (_DmarcRejectAction_)|<details><summary>Show details</summary><br>**Default**: **Reject the message** (`Reject`)<br>**Standard**: **Reject the message** (`Reject`)<br>**Strict**: **Reject the message** (`Reject`)<br>**Comment**: This action is meaningful only when **Honor DMARC record policy when the message is detected as spoof** is turned on.</details>|
> |**If the message is detected as spoof by spoof intelligence** (_AuthenticationFailAction_)|<details><summary>Show details</summary><br>**Default**: **Move the message to the recipients' Junk Email folders** (`MoveToJmf`)<br>**Standard**: **Move the message to the recipients' Junk Email folders** (`MoveToJmf`)<br>**Strict**: **Quarantine the message** (`Quarantine`)<br>**Comment**: This setting applies to spoofed senders that were automatically blocked as shown in the [spoof intelligence insight](anti-spoofing-spoof-intelligence.md) or manually blocked in the [Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-spoofed-senders).<br><br>If you select **Quarantine the message** as the action for the spoof verdict, an **Apply quarantine policy** box is available.</details>|
> |**Quarantine policy** for **Spoof** (_SpoofQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if spoof detections are quarantined.</details>|
> |**Show first contact safety tip** (_EnableFirstContactSafetyTips_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: For more information, see [First contact safety tip](anti-phishing-policies-about.md#first-contact-safety-tip).</details>|
> |**Show (?) for unauthenticated senders for spoof** (_EnableUnauthenticatedSender_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: Adds a question mark (?) to the sender's photo in Outlook for unidentified spoofed senders. For more information, see [Unauthenticated sender indicators](anti-phishing-policies-about.md#unauthenticated-sender-indicators).</details>|
> |**Show "via" tag** (_EnableViaTag_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: Adds a via tag (`chris@contoso.com via fabrikam.com`) to the From address if it's different from the domain in the DKIM signature or the **MAIL FROM** address.<br><br>For more information, see [Unauthenticated sender indicators](anti-phishing-policies-about.md#unauthenticated-sender-indicators).</details>|

¹ As described in [Full access permissions and quarantine notifications](quarantine-policies.md#full-access-permissions-and-quarantine-notifications), your organization might use NotificationEnabledPolicy instead of DefaultFullAccessPolicy. Quarantine notifications are turned on in NotificationEnabledPolicy and turned off in DefaultFullAccessPolicy.

## Microsoft Defender for Office 365 security

If your Microsoft 365 subscription includes Defender for Office 365 or you purchased Defender for Office 365 as an add-on, you get the extra security features as described in the following subsections. For the latest news and information about Defender for Office 365 features, see [What's new in Defender for Office 365](defender-for-office-365-whats-new.md).

> [!IMPORTANT]
>
> - The default anti-phishing policy in Defender for Office 365 provides [spoof protection](anti-phishing-policies-about.md#spoof-settings) and mailbox intelligence for all recipients. However, the other available [impersonation protection](#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365) and [phishing email thresholds](#phishing-email-thresholds-in-anti-phishing-policies-in-microsoft-defender-for-office-365) settings aren't configured in the default policy. To enable all anti-phishing protection features, do one or more of the following steps:
>   - Turn on and use the Standard and/or Strict [preset security policies](preset-security-policies.md) and configure impersonation protection there.
>   - Modify the default anti-phishing policy.
>   - Create custom anti-phishing policies.
>
> - Although there's no default Safe Attachments policy or Safe Links policy, the **Built-in protection** preset security policy provides Safe Attachments protection and Safe Links protection to all recipients who aren't defined in the Standard preset security policy, the Strict preset security policy, or in custom Safe Attachments or Safe Links policies. For more information, see [Preset security policies](preset-security-policies.md).
>
> - [Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](safe-attachments-for-spo-odfb-teams-about.md) protection and [Safe Documents](safe-documents-in-e5-plus-security-about.md) protection have no dependencies on Safe Links policies.
>
> - [Microsoft Teams protection settings in Microsoft Defender for Office 365](#microsoft-teams-protection-settings-in-microsoft-defender-for-office-365) have no dependency on preset security policies, any custom threat policies, or the default threat policies.

We recommend the Standard or Strict configurations for Defender for Office 365 as described in the tables in the following subsections.

### Anti-phishing policy settings in Microsoft Defender for Office 365

All Microsoft 365 organizations with cloud mailboxes get anti-phishing protection [as previously described](#anti-phishing-policy-settings-for-all-cloud-mailboxes). But Defender for Office 365 includes more features and control to help prevent, detect, and remediate phishing attacks. To create and configure these anti-phishing policies, see [Configure anti-phishing policies in Defender for Office 365](anti-phishing-policies-mdo-configure.md).

<a name='advanced-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365'></a>

#### Phishing email thresholds in anti-phishing policies in Microsoft Defender for Office 365

For more information about this setting, see [Phishing email thresholds in anti-phishing policies in Microsoft Defender for Office 365](anti-phishing-policies-about.md#phishing-email-thresholds-in-anti-phishing-policies-in-microsoft-defender-for-office-365). To configure this setting, see [Configure anti-phishing policies in Defender for Office 365](anti-phishing-policies-mdo-configure.md).

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Phishing email threshold** (_PhishThresholdLevel_)|**Default**: **1 - Standard** (`1`)<br>**Standard**: **3 - More aggressive** (`3`)<br>**Strict**: **4 - Most aggressive** (`4`)|

#### Impersonation settings in anti-phishing policies in Microsoft Defender for Office 365

For more information about these settings, see [Impersonation settings in anti-phishing policies in Microsoft Defender for Office 365](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365). To configure these settings, see [Configure anti-phishing policies in Defender for Office 365](anti-phishing-policies-mdo-configure.md).

Wherever you select **Quarantine the message** as the action for an impersonation verdict, an **Apply quarantine policy** box is available. Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

Although the **Apply quarantine policy** value appears unselected when you create an anti-phishing policy in the Defender portal, the quarantine policy named DefaultFullAccessPolicy is used if you don't select a quarantine policy. This policy enforces the historical capabilities of messages quarantined as impersonation as described in the table [in this article](quarantine-end-user.md). When you later view or edit the anti-phishing policy settings, the quarantine policy name is shown.

Admins can create or use quarantine policies with more restrictive or less restrictive capabilities. For instructions, see [Create quarantine policies in the Microsoft Defender portal](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Impersonation**||
> |<u>User impersonation protection</u>: **Enable users to protect** (_EnableTargetedUserProtection_ and _TargetedUsersToProtect_)|<details><summary>Show details</summary><br>**Default**: Not selected (`$false` and none)<br>**Standard**: Selected (`$true` and \<list of users\>)<br>**Strict**: Selected (`$true` and \<list of users\>)<br>**Comment**: We recommend adding users (message senders) in key roles. Internally, protected senders might be your CEO, CFO, and other senior leaders. Externally, protected senders could include council members or your board of directors.</details>|
> |<u>Domain impersonation protection</u>: **Enable domains to protect**|<details><summary>Show details</summary><br>**Default**: Not selected<br>**Standard**: Selected<br>**Strict**: Selected</details>|
> |**Include domains I own** (_EnableOrganizationDomainsProtection_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Include custom domains** (_EnableTargetedDomainsProtection_ and _TargetedDomainsToProtect_)|<details><summary>Show details</summary><br>**Default**: Off (`$false` and none)<br>**Standard**: Selected (`$true` and \<list of domains\>)<br>**Strict**: Selected (`$true` and \<list of domains\>)<br>**Comment**: We recommend adding domains (sender domains) that you don't own, but you frequently interact with.</details>|
> |**Add trusted senders and domains** (_ExcludedSenders_ and _ExcludedDomains_)|<details><summary>Show details</summary><br>**Default**: None<br>**Standard**: None<br>**Strict**: None<br>**Comment**: Depending on your organization, we recommend adding senders or domains that are incorrectly identified as impersonation attempts.</details>|
> |**Enable mailbox intelligence** (_EnableMailboxIntelligence_)|<details><summary>Show details</summary><br>**Default**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Enable intelligence for impersonation protection** (_EnableMailboxIntelligenceProtection_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: This setting allows the specified action for impersonation detections by mailbox intelligence.</details>|
> |**Actions**||
> |**If a message is detected as user impersonation** (_TargetedUserProtectionAction_)|<details><summary>Show details</summary><br>**Default**: **Don't apply any action** (`NoAction`)<br>**Standard**: **Quarantine the message** (`Quarantine`)<br>**Strict**: **Quarantine the message** (`Quarantine`)</details>|
> |**Quarantine policy** for **user impersonation** (_TargetedUserQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessWithNotificationPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if user impersonation detections are quarantined.</details>|
> |**If a message is detected as domain impersonation** (_TargetedDomainProtectionAction_)|<details><summary>Show details</summary><br>**Default**: **Don't apply any action** (`NoAction`)<br>**Standard**: **Quarantine the message** (`Quarantine`)<br>**Strict**: **Quarantine the message** (`Quarantine`)</details>|
> |**Quarantine policy** for **domain impersonation** (_TargetedDomainQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessWithNotificationPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if domain impersonation detections are quarantined.</details>|
> |**If mailbox intelligence detects an impersonated user** (_MailboxIntelligenceProtectionAction_)|<details><summary>Show details</summary><br>**Default**: **Don't apply any action** (`NoAction`)<br>**Standard**: **Move the message to the recipients' Junk Email folders** (`MoveToJmf`)<br>**Strict**: **Quarantine the message** (`Quarantine`)</details>|
> |**Quarantine policy** for **mailbox intelligence impersonation** (_MailboxIntelligenceQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: DefaultFullAccessPolicy¹<br>**Standard**: DefaultFullAccessPolicy<br>**Strict**: DefaultFullAccessWithNotificationPolicy<br>**Comment**: The quarantine policy is meaningful only if mailbox intelligence detections are quarantined.</details>|
> |**Show user impersonation safety tip** (_EnableSimilarUsersSafetyTips_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Show domain impersonation safety tip** (_EnableSimilarDomainsSafetyTips_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Show user impersonation unusual characters safety tip** (_EnableUnusualCharactersSafetyTips_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|

¹ As described in [Full access permissions and quarantine notifications](quarantine-policies.md#full-access-permissions-and-quarantine-notifications), your organization might use NotificationEnabledPolicy instead of DefaultFullAccessPolicy. Quarantine notifications are turned on in NotificationEnabledPolicy and turned off in DefaultFullAccessPolicy.

#### Anti-phishing policy settings for all cloud mailboxes in Defender for Office 365

The previously described [anti-phishing policy settings for all cloud mailboxes](#anti-phishing-policy-settings-for-all-cloud-mailboxes) are also available in Defender for Office 365.

### Safe Attachments settings

Safe Attachments in Defender for Office 365 includes global settings that have no relationship to Safe Attachments policies, and settings that are specific to each Safe Attachments policy. For more information, see [Safe Attachments in Microsoft Defender for Office 365](safe-attachments-about.md).

Although there's no default Safe Attachments policy, the **Built-in protection** preset security policy provides Safe Attachments protection to all recipients who aren't defined in the Standard or Strict preset security policies or in custom Safe Attachments policies. For more information, see [Preset security policies](preset-security-policies.md).

#### Global settings for Safe Attachments

> [!NOTE]
> The global settings for Safe Attachments are set by the **Built-in protection** preset security policy, but not by the **Standard** or **Strict** preset security policies. Either way, admins can modify these global Safe Attachments settings at any time.
>
> The **Default** column in the following table shows the values before the existence of the **Built-in protection** preset security policy. The **Built-in protection** column shows the values that are set by the **Built-in protection** preset security policy, which are also our recommended values.

To configure these settings, see [Turn on Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](safe-attachments-for-spo-odfb-teams-configure.md) and [Safe Documents in Microsoft 365 E5](safe-documents-in-e5-plus-security-about.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [Set-AtpPolicyForO365](/powershell/module/exchangepowershell/set-atppolicyforo365) cmdlet for these settings.

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Turn on Defender for Office 365 for SharePoint, OneDrive, and Microsoft Teams** (_EnableATPForSPOTeamsODB_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Built-in protection**: On (`$true`)<br>**Comment**: To prevent users from downloading malicious files, see [Use SharePoint Online PowerShell to prevent users from downloading malicious files](safe-attachments-for-spo-odfb-teams-configure.md#step-2-recommended-use-sharepoint-online-powershell-to-prevent-users-from-downloading-malicious-files).</details>|
> |**Turn on Safe Documents for Office clients** (_EnableSafeDocs_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Built-in protection**: On (`$true`)<br>**Comment**: This feature is available and meaningful only with licenses that aren't included in Defender for Office 365 (for example, Microsoft 365 A5 or Microsoft Defender Suite). For more information, see [Safe Documents in Microsoft 365 A5 or E5 Security](safe-documents-in-e5-plus-security-about.md).</details>|
> |**Allow people to click through Protected View even if Safe Documents identified the file as malicious** (_AllowSafeDocsOpen_)|<details><summary>Show details</summary><br>**Default**: Off (`$false`)<br>**Built-in protection**: Off (`$false`)<br>**Comment**: This setting is related to Safe Documents.</details>|

#### Safe Attachments policy settings

To configure these settings, see [Set up Safe Attachments policies in Defender for Office 365](safe-attachments-policies-configure.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [New-SafeAttachmentPolicy](/powershell/module/exchangepowershell/new-safeattachmentpolicy) and [Set-SafeAttachmentPolicy](/powershell/module/exchangepowershell/set-safelinkspolicy) cmdlets for these settings.

> [!NOTE]
> As described earlier, although there's no default Safe Attachments policy, the **Built-in protection** preset security policy provides Safe Attachments protection to all recipients who aren't defined in the Standard preset security policy, the Strict preset security policy, or in custom Safe Attachments policies.
>
> The **Default in custom** column in the following table refers to the default values in new Safe Attachments policies that you create. The remaining columns indicate (unless otherwise noted) the values that are configured in the corresponding preset security policies.

Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

The policy named AdminOnlyAccessPolicy enforces the historical capabilities of messages quarantined as malware as described in the table [in this article](quarantine-end-user.md).

Users can't release their own messages quarantined as malware or phishing by Safe Attachments, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Safe Attachments unknown malware response** (_Enable_ and _Action_)|<details><summary>Show details</summary><br>**Default in custom**: **Off** (`-Enable $false` and `-Action Block`)<br>**Built-in protection**: **Block** (`-Enable $true` and `-Action Block`)<br>**Standard**: **Block** (`-Enable $true` and `-Action Block`)<br>**Strict**: **Block** (`-Enable $true` and `-Action Block`)<br>**Comment**: When the _Enable_ parameter is $false, the value of the _Action_ parameter doesn't matter.</details>|
> |**Quarantine policy** (_QuarantineTag_)|<details><summary>Show details</summary><br>**Default in custom**: AdminOnlyAccessPolicy<br>**Built-in protection**: AdminOnlyAccessPolicy<br>**Standard**: AdminOnlyAccessPolicy<br>**Strict**: AdminOnlyAccessPolicy</details>|
> |**Redirect attachment with detected attachments** : **Enable redirect** (_Redirect_ and _RedirectAddress_)|<details><summary>Show details</summary><br>**Default in custom**: Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)<br>**Built-in protection**: Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)<br>**Standard**: Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)<br>**Strict**: Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)<br>**Comment**: Redirection of messages is available only when the **Safe Attachments unknown malware response** value is **Monitor** (`-Enable $true` and `-Action Allow`).</details>|

### Safe Links policy settings

For more information about Safe Links protection, see [Safe Links in Defender for Office 365](safe-links-about.md).

Although there's no default Safe Links policy, the **Built-in protection** preset security policy provides Safe Links protection to all recipients who aren't defined in the Standard preset security policy, the Strict preset security policy or in custom Safe Links policies. For more information, see [Preset security policies](preset-security-policies.md).

To configure Safe Links policy settings, see [Set up Safe Links policies in Microsoft Defender for Office 365](safe-links-policies-configure.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [New-SafeLinksPolicy](/powershell/module/exchangepowershell/new-safelinkspolicy) and [Set-SafeLinksPolicy](/powershell/module/exchangepowershell/set-safelinkspolicy) cmdlets for Safe Links policy settings.

> [!NOTE]
> The **Default in custom** column refers to the default values in new Safe Links policies you create. The remaining columns indicate the values configured in the corresponding preset security policies.

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**URL & click protection settings**||
> |**Email**|**Comment**: The settings in this section affect URL rewriting and time of click protection in email messages.|
> |**On: Safe Links checks a list of known, malicious links when users click links in email. URLs are rewritten by default.** (_EnableSafeLinksForEmail_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Apply Safe Links to email messages sent within the organization** (_EnableForInternalSenders_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Not Selected (`$false`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Apply real-time URL scanning for suspicious links and links that point to files** (_ScanUrls_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Wait for URL scanning to complete before delivering the message** (_DeliverMessageAfterScan_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Do not rewrite URLs, do checks via Safe Links API only** (_DisableURLRewrite_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$false`)<sup>\*</sup><br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Not selected (`$false`)<br>**Strict**: Not selected (`$false`)<br>**Comment**: <sup>\*</sup> In new policies created in the Defender portal, this setting is selected by default. In new policies created in PowerShell, the default value is `$false`.</details>|
> |**Do not rewrite the following URLs in email** (_DoNotRewriteUrls_)|<details><summary>Show details</summary><br>**Default in custom**: Blank<br>**Built-in protection**: Blank<br>**Standard**: Blank<br>**Strict**: Blank<br>**Comment**: We have no specific recommendation for this setting.<br><br>**Note**: Safe Links doesn't scan or wrap entries in the "Don't rewrite the following URLs" list during mail flow. Report the URL as **I've confirmed it's clean** and then select **Allow this URL** to add an allow entry to the Tenant Allow/Block List so the URL isn't scanned or wrapped by Safe Links during mail flow _and_ at time of click. For instructions, see [Report good URLs to Microsoft](submissions-admin.md#report-good-urls-to-microsoft).</details>|
> |**Teams**|**Comment**: The setting in this section affects time of click protection in Microsoft Teams.|
> |**On: Safe Links checks a list of known, malicious links when users click links in Microsoft Teams. URLs are not rewritten.** (_EnableSafeLinksForTeams_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Office 365 apps**|**Comment**: The setting in this section affects time of click protection in Office apps.|
> |**On: Safe Links checks a list of known, malicious links when users click links in Microsoft Office apps. URLs are not rewritten.** (_EnableSafeLinksForOffice_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)<br>**Comment**: Use Safe Links in supported Office 365 desktop and mobile (iOS and Android) apps. For more information, see [Safe Links settings for Office apps](safe-links-about.md#safe-links-settings-for-office-apps).</details>|
> |**Click protection settings**||
> |**Track user clicks** (_TrackClicks_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$true`)<br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Selected (`$true`)<br>**Strict**: Selected (`$true`)</details>|
> |**Let users click through to the original URL** (_AllowClickThrough_)|<details><summary>Show details</summary><br>**Default in custom**: Selected (`$false`)<sup>\*</sup><br>**Built-in protection**: Selected (`$true`)<br>**Standard**: Not selected (`$false`)<br>**Strict**: Not selected (`$false`)<br>**Comment**: <sup>\*</sup> In new policies created in the Defender portal, this setting is selected by default. In new policies created in PowerShell, the default value is `$false`.</details>|
> |**Display the organization branding on notification and warning pages** (_EnableOrganizationBranding_)|<details><summary>Show details</summary><br>**Default in custom**: Not selected (`$false`)<br>**Built-in protection**: Not selected (`$false`)<br>**Standard**: Not selected (`$false`)<br>**Strict**: Not selected (`$false`)<br>**Comment**: We have no specific recommendation for this setting.<br><br>Before you turn on this setting, you need to follow the instructions in [Customize the Microsoft 365 theme for your organization](/microsoft-365/admin/setup/customize-your-organization-theme) to upload your company logo.</details>|
> |**Notification**||
> |**How would you like to notify your users?** (_CustomNotificationText_ and _UseTranslatedNotificationText_)|<details><summary>Show details</summary><br>**Default in custom**: **Use the default notification text** (Blank and `$false`)<br>**Built-in protection**: **Use the default notification text** (Blank and `$false`)<br>**Standard**: **Use the default notification text** (Blank and `$false`)<br>**Strict**: **Use the default notification text** (Blank and `$false`)<br>**Comment**: We have no specific recommendation for this setting.<br><br>You can select **Use custom notification text** (`-CustomNotificationText "<Custom text>"`) to enter and use customized notification text. If you specify custom text, you can also select **Use Microsoft Translator for automatic localization** (`-UseTranslatedNotificationText $true`) to automatically translate the text into the user's language.</details>|

### Microsoft Teams protection settings in Microsoft Defender for Office 365

For more information about Microsoft Teams protection, see [Microsoft Defender for Office 365 support for Microsoft Teams](mdo-support-teams-about.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [New-TeamsProtectionPolicy](/powershell/module/exchangepowershell/new-teamsprotectionpolicy) and [Set-TeamsProtectionPolicy](/powershell/module/exchangepowershell/set-teamsprotectionpolicy) cmdlets for Microsoft Teams protection settings.

> [!NOTE]
> Microsoft Teams protection isn't part of the Standard or Strict preset security policies, any custom threat policies, or the default threat policies. The **Standard** and **Strict** values indicate our **recommended** values.

> [!div class="mx-tableFixed"]
>
> |Security feature name|Details|
> |---|---|
> |**Zero-hour auto purge (ZAP)** (_ZapEnabled_)|<details><summary>Show details</summary><br>**Default**: **On** (`$true`)<br>**Standard**: **On** (`$true`)<br>**Strict**: **On** (`$true`)</details>|
> |**Quarantine policies**||
> |&nbsp;&nbsp;**Malware** (_MalwareQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: AdminOnlyAccessPolicy<br>**Standard**: AdminOnlyAccessPolicy<br>**Strict**: AdminOnlyAccessPolicy</details>|
> |&nbsp;&nbsp;**High confidence phishing** (_HighConfidencePhishQuarantineTag_)|<details><summary>Show details</summary><br>**Default**: AdminOnlyAccessPolicy<br>**Standard**: AdminOnlyAccessPolicy<br>**Strict**: AdminOnlyAccessPolicy</details>|

## Related articles

- Are you looking for best practices for **Exchange mail flow rules (also known as transport rules**)? See [Best practices for configuring mail flow rules in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/configuration-best-practices).

- Admins and users can submit false positives (good email marked as bad) and false negatives (bad email allowed) to Microsoft for analysis. For more information, see [Report messages and files to Microsoft](submissions-report-messages-files-to-microsoft.md).

- You can find **Security baselines for Windows** in the following articles:
  - **Group policy**: [Where can I get the security baselines?](/windows/security/operating-system-security/device-management/windows-security-configuration-framework/windows-security-baselines#where-can-i-get-the-security-baselines)
  - **Microsoft Intune***: [Use security baselines to configure Windows devices in Intune](/intune/intune-service/protect/security-baselines) for Intune-based security.
  - **Comparison of Microsoft Defender for Endpoint and Microsoft Intune security baselines**: [Compare the Microsoft Defender for Endpoint and the Windows Intune security baselines](/defender-endpoint/configure-machines-security-baseline#compare-the-microsoft-defender-for-endpoint-and-the-windows-intune-security-baselines).
