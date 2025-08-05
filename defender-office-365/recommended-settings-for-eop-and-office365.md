---
title: Recommendations for Microsoft 365 security settings
keywords: Office 365 security recommendations, Sender Policy Framework, Domain-based Message Reporting and Conformance, DomainKeys Identified Mail, steps, how does it work, security baselines, baselines for default protections, baselines for Defender for Office 365, set up Defender for Office 365, configure Defender for Office 365, security configuration
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
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
ms.service: defender-office-365
ms.date: 07/10/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Recommended email and collaboration threat policy settings for cloud organizations

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Although all organizations with cloud mailboxes include default email protections, Microsoft Defender for Office 365 is the primary email and collaboration security solution for Microsoft 365.

We recommend two security levels: **Standard** and **Strict**. Although customer environments and needs are different, these levels of filtering help keep unwanted email out of user mailboxes in most situations.

To automatically apply the Standard or Strict settings to users, use [Preset security policies](preset-security-policies.md).

This article describes the default threat policy settings, and also the recommended Standard and Strict settings to help protect users. The tables contain the settings in the Microsoft Defender portal and Exchange Online PowerShell.

> [!NOTE]
> You can use the configuration analyzer to compare the settings in custom threat policies to the recommended Standard or Strict values. For more information, see [Configuration analyzer for threat policies](configuration-analyzer-for-security-policies.md).
>
> The Office 365 Advanced Threat Protection Recommended Configuration Analyzer (ORCA) module for PowerShell can help admins find the current values of these settings. Specifically, the **Get-ORCAReport** cmdlet generates an assessment of anti-spam, anti-phishing, and other message hygiene settings. You can download the ORCA module at <https://www.powershellgallery.com/packages/ORCA/>.
>
> We recommend that you leave the Junk Email Filter in Outlook set to **No automatic filtering** to prevent unnecessary conflicts (both positive and negative) with the spam filtering verdicts from Microsoft 365. For more information, see the following articles:
>
> - [Configure junk email settings on cloud mailboxes](configure-junk-email-settings-on-exo-mailboxes.md)
> - [About junk email settings in Outlook](configure-junk-email-settings-on-exo-mailboxes.md#about-outlook-junk-email-settings)
> - [Change the level of protection in the Junk Email Filter](https://support.microsoft.com/office/e89c12d8-9d61-4320-8c57-d982c8d52f6b)
> - [Create sender allowlists](create-safe-sender-lists-in-office-365.md)
> - [Create sender blocklists](create-block-sender-lists-in-office-365.md)

<a name='eop-anti-malware-policy-settings'></a>

## Default email protections for cloud mailboxes

The default email protections described in this section are available in all organizations with cloud mailboxes. We recommend the Standard or Strict configurations as described in the tables in the following subsections.

### Anti-malware policy settings

To create and configure anti-malware policies, see [Configure anti-malware policies](anti-malware-policies-configure.md).

Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

The policy named AdminOnlyAccessPolicy enforces the historical capabilities of messages quarantined as malware as described in the table [in this article](quarantine-end-user.md).

Users can't release their own messages quarantined as malware, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

|Security feature name|Default|Standard|Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Protection settings**|||||
|**Enable the common attachments filter** (_EnableFileFilter_)|Selected (`$true`)<sup>\*</sup>|Selected (`$true`)|Selected (`$true`)|For the list of file types in the common attachments filter, see [Common attachments filter in anti-malware policies](anti-malware-protection-about.md#common-attachments-filter-in-anti-malware-policies). <br/><br/> <sup>\*</sup> The common attachments filter is **on** by default in new anti-malware policies that you create in the Defender portal or in PowerShell, and in the default anti-malware policy in organizations created after December 1, 2023.|
|Common attachment filter notifications: **When these file types are found** (_FileTypeAction_)|**Reject the message with a non-delivery report (NDR)** (`Reject`)|**Reject the message with a non-delivery report (NDR)** (`Reject`)|**Reject the message with a non-delivery report (NDR)** (`Reject`)||
|**Enable zero-hour auto purge for malware** (_ZapEnabled_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Quarantine policy** (_QuarantineTag_)|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy||
|**Admin notifications**|||||
|**Notify an admin about undelivered messages from internal senders** (_EnableInternalSenderAdminNotifications_ and _InternalSenderAdminAddress_)|Not selected (`$false`)|Not selected (`$false`)|Not selected (`$false`)|We have no specific recommendation for this setting.|
|**Notify an admin about undelivered messages from external senders** (_EnableExternalSenderAdminNotifications_ and _ExternalSenderAdminAddress_)|Not selected (`$false`)|Not selected (`$false`)|Not selected (`$false`)|We have no specific recommendation for this setting.|
|**Customize notifications**||||We have no specific recommendations for these settings.|
|**Use customized notification text** (_CustomNotifications_)|Not selected (`$false`)|Not selected (`$false`)|Not selected (`$false`)||
|**From name** (_CustomFromName_)|Blank|Blank|Blank||
|**From address** (_CustomFromAddress_)|Blank|Blank|Blank||
|**Customize notifications for messages from internal senders**||||These settings are used only if **Notify an admin about undelivered messages from internal senders** is selected.|
|**Subject** (_CustomInternalSubject_)|Blank|Blank|Blank||
|**Message** (_CustomInternalBody_)|Blank|Blank|Blank||
|**Customize notifications for messages from external senders**||||These settings are used only if **Notify an admin about undelivered messages from external senders** is selected.|
|**Subject** (_CustomExternalSubject_)|Blank|Blank|Blank||
|**Message** (_CustomExternalBody_)|Blank|Blank|Blank||

### Anti-spam policy settings

To create and configure anti-spam policies, see [Configure anti-spam policies](anti-spam-policies-configure.md).

Wherever you select **Quarantine message** as the action for a spam filter verdict, a **Select quarantine policy** box is available. Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

If you _change_ the action of a spam filtering verdict to **Quarantine message** as you create anti-spam policies in the Defender portal, the **Select quarantine policy** box is blank by default. A blank value means the default quarantine policy for that spam filtering verdict is used. These default quarantine policies enforce the historical capabilities of the spam filter verdict that quarantined the message as described in the table [in this article](quarantine-end-user.md). When you later view or edit the anti-spam policy settings, the quarantine policy name is shown.

Admins can create or use quarantine policies with more restrictive or less restrictive capabilities. For instructions, see [Create quarantine policies in the Microsoft Defender portal](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

|Security feature name|Default|Standard|Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Bulk email threshold & spam properties**|||||
|**Bulk email threshold** (_BulkThreshold_)|7|6|5|For details, see [Bulk complaint level (BCL)](anti-spam-bulk-complaint-level-bcl-about.md).|
|**Bulk email spam** (_MarkAsSpamBulkMail_)|(`On`)|(`On`)|(`On`)|This setting is only available in PowerShell.|
|**Increase spam score** settings||||All of these settings are part of the Advanced Spam Filter (ASF). For more information, see the [ASF settings in anti-spam policies](#asf-settings-in-anti-spam-policies) section in this article.|
|**Mark as spam** settings||||Most of these settings are part of ASF. For more information, see the [ASF settings in anti-spam policies](#asf-settings-in-anti-spam-policies) section in this article.|
|**Contains specific languages** (_EnableLanguageBlockList_ and _LanguageBlockList_)|**Off** (`$false` and Blank)|**Off** (`$false` and Blank)|**Off** (`$false` and Blank)|We have no specific recommendation for this setting. You can block messages in specific languages based on your business needs.|
|**From these countries** (_EnableRegionBlockList_ and _RegionBlockList_)|**Off** (`$false` and Blank)|**Off** (`$false` and Blank)|**Off** (`$false` and Blank)|We have no specific recommendation for this setting. You can block messages from specific countries/regions based on your business needs.|
|**Test mode** (_TestModeAction_)|**None**|**None**|**None**|This setting is part of ASF. For more information, see the [ASF settings in anti-spam policies](#asf-settings-in-anti-spam-policies) section in this article.|
|**Actions**|||||
|**Spam** detection action (_SpamAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)||
|**Quarantine policy** for **Spam** (_SpamQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if spam detections are quarantined.|
|**High confidence spam** detection action (_HighConfidenceSpamAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)|**Quarantine message** (`Quarantine`)||
|**Quarantine policy** for **High confidence spam** (_HighConfidenceSpamQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessWithNotificationPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if high confidence spam detections are quarantined.|
|**Phishing** detection action (_PhishSpamAction_)|**Move message to Junk Email folder** (`MoveToJmf`)<sup>\*</sup>|**Quarantine message** (`Quarantine`)|**Quarantine message** (`Quarantine`)|<sup>\*</sup> The default value is **Move message to Junk Email folder** in the default anti-spam policy and in new anti-spam policies that you create in PowerShell. The default value is **Quarantine message** in new anti-spam policies that you create in the Defender portal.|
|**Quarantine policy** for **Phishing** (_PhishQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessWithNotificationPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if phishing detections are quarantined.|
|**High confidence phishing** detection action (_HighConfidencePhishAction_)|**Quarantine message** (`Quarantine`)|**Quarantine message** (`Quarantine`)|**Quarantine message** (`Quarantine`)|Users can't release their own messages quarantined as high confidence phishing, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.|
|**Quarantine policy** for **High confidence phishing** (_HighConfidencePhishQuarantineTag_)|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy||
|**Bulk compliant level (BCL) met or exceeded** (_BulkSpamAction_)|**Move message to Junk Email folder** (`MoveToJmf`)|**Move message to Junk Email folder** (`MoveToJmf`)|**Quarantine message** (`Quarantine`)||
|**Quarantine policy** for **Bulk compliant level (BCL) met or exceeded** (_BulkQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if bulk detections are quarantined.|
|**Intra-Organizational messages to take action on** (_IntraOrgFilterState_)|**Default** (Default)|**Default** (Default)|**Default** (Default)|The value **Default** is the same as selecting **High confidence phishing messages**. Currently, in U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD), the value **Default** is the same as selecting **None**.|
|**Retain spam in quarantine for this many days** (_QuarantineRetentionPeriod_)|15 days|30 days|30 days|This value also affects messages quarantined by anti-phishing policies. For more information, see [Quarantine retention](quarantine-about.md#quarantine-retention).|
|**Enable spam safety tips** (_InlineSafetyTipsEnabled_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|Enable zero-hour auto purge (ZAP) for phishing messages (_PhishZapEnabled_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|Enable ZAP for spam messages (_SpamZapEnabled_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Allow & block list**|||||
|Allowed senders (_AllowedSenders_)|None|None|None||
|Allowed sender domains (_AllowedSenderDomains_)|None|None|None|Adding domains to the allowed domains list is a bad idea. Attackers would be able to send you email that would otherwise be filtered out. <br/><br/> Use the [spoof intelligence insight](anti-spoofing-spoof-intelligence.md) and the [Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#spoofed-senders-in-the-tenant-allowblock-list) to review who's spoofing sender email addresses in your domains or external domains.|
|Blocked senders (_BlockedSenders_)|None|None|None||
|Blocked sender domains (_BlockedSenderDomains_)|None|None|None||

¹ As described in [Full access permissions and quarantine notifications](quarantine-policies.md#full-access-permissions-and-quarantine-notifications), your organization might use NotificationEnabledPolicy instead of DefaultFullAccessPolicy. Quarantine notifications are turned on in NotificationEnabledPolicy and turned off in DefaultFullAccessPolicy.

#### ASF settings in anti-spam policies

For more information about Advanced Spam Filter (ASF) settings in anti-spam policies, see [Advanced Spam Filter (ASF) settings in anti-spam policies](anti-spam-policies-asf-settings-about.md).

|Security feature name|Default|Recommended<br/>Standard|Recommended<br/>Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Image links to remote sites** (_IncreaseScoreWithImageLinks_)|Off|Off|Off||
|**Numeric IP address in URL** (_IncreaseScoreWithNumericIps_)|Off|Off|Off||
|**URL redirect to other port** (_IncreaseScoreWithRedirectToOtherPort_)|Off|Off|Off||
|**Links to .biz or .info websites** (_IncreaseScoreWithBizOrInfoUrls_)|Off|Off|Off||
|**Empty messages** (_MarkAsSpamEmptyMessages_)|Off|Off|Off||
|**Embed tags in HTML** (_MarkAsSpamEmbedTagsInHtml_)|Off|Off|Off||
|**JavaScript or VBScript in HTML** (_MarkAsSpamJavaScriptInHtml_)|Off|Off|Off||
|**Form tags in HTML** (_MarkAsSpamFormTagsInHtml_)|Off|Off|Off||
|**Frame or iframe tags in HTML** (_MarkAsSpamFramesInHtml_)|Off|Off|Off||
|**Web bugs in HTML** (_MarkAsSpamWebBugsInHtml_)|Off|Off|Off||
|**Object tags in HTML** (_MarkAsSpamObjectTagsInHtml_)|Off|Off|Off||
|**Sensitive words** (_MarkAsSpamSensitiveWordList_)|Off|Off|Off||
|**SPF record: hard fail** (_MarkAsSpamSpfRecordHardFail_)|Off|Off|Off||
|**Sender ID filtering hard fail** (_MarkAsSpamFromAddressAuthFail_)|Off|Off|Off||
|**Backscatter** (_MarkAsSpamNdrBackscatter_)|Off|Off|Off||
|**Test mode** (_TestModeAction_)|None|None|None|For ASF settings that support **Test** as an action, you can configure the test mode action to **None**, **Add default X-Header text**, or **Send Bcc message** (`None`, `AddXHeader`, or `BccMessage`). For more information, see [Enable, disable, or test ASF settings](anti-spam-policies-asf-settings-about.md#enable-disable-or-test-asf-settings).|

> [!NOTE]
> ASF adds `X-CustomSpam:` X-header fields to messages _after_ Exchange mail flow rules (also known as transport rules) processes messages, so you can't use mail flow rules to identify and act on messages filtered by ASF.

#### Outbound spam policy settings

To create and configure outbound spam policies, see [Configure outbound spam filtering](outbound-spam-policies-configure.md).

For more information about the default sending limits in the service, see [Sending limits](/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits#sending-limits-1).

> [!NOTE]
> Outbound spam policies aren't part of Standard or Strict preset security policies. The **Standard** and **Strict** values indicate our **recommended** values in the default outbound spam policy or custom outbound spam policies that you create.

|Security feature name|Default|Recommended<br/>Standard|Recommended<br/>Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Set an external message limit** (_RecipientLimitExternalPerHour_)|0|500|400|The default value 0 means use the service defaults.|
|**Set an internal message limit** (_RecipientLimitInternalPerHour_)|0|1000|800|The default value 0 means use the service defaults.|
|**Set a daily message limit** (_RecipientLimitPerDay_)|0|1000|800|The default value 0 means use the service defaults.|
|**Restriction placed on users who reach the message limit** (_ActionWhenThresholdReached_)|**Restrict the user from sending mail until the following day** (`BlockUserForToday`)|**Restrict the user from sending mail** (`BlockUser`)|**Restrict the user from sending mail** (`BlockUser`)||
|**Automatic forwarding rules** (_AutoForwardingMode_)|**Automatic - System-controlled** (`Automatic`)|**Automatic - System-controlled** (`Automatic`)|**Automatic - System-controlled** (`Automatic`)|The value **Automatic - System-controlled** (`Automatic`) is equivalent to **Off - Forwarding is disabled** (`Off`). For more information, see [Control automatic external email forwarding](outbound-spam-policies-external-email-forwarding.md).|
|**Send a copy of outbound messages that exceed these limits to these users and groups** (_BccSuspiciousOutboundMail_ and _BccSuspiciousOutboundAdditionalRecipients_)|Not selected (`$false` and Blank)|Not selected (`$false` and Blank)|Not selected (`$false` and Blank)|This setting works only in the default outbound spam policy. It doesn't work in custom outbound spam policies that you create. <br/><br/> The Microsoft SecureScore recommendation **Ensure Exchange Online Spam Policies are set to notify administrators** suggests that you configure this value.|
|**Notify these users and groups if a sender is blocked due to sending outbound spam** (_NotifyOutboundSpam_ and _NotifyOutboundSpamRecipients_)|Not selected (`$false` and Blank)|Not selected (`$false` and Blank)|Not selected (`$false` and Blank)|The default [alert policy](/defender-xdr/alert-policies#threat-management-alert-policies) named **User restricted from sending email** already sends email notifications to members of the **TenantAdmins** group (**Global Administrator** members) when users are blocked due to exceeding the limits in the policy. For instructions, see [Verify the alert settings for restricted users](outbound-spam-restore-restricted-users.md#verify-the-alert-settings-for-restricted-users). <br/><br/> Although we recommend that you use the alert policy rather than this setting in the outbound spam policy to notify admins and other users, the Microsoft SecureScore recommendation **Ensure Exchange Online Spam Policies are set to notify administrators** suggests that you configure this value.|

<a name='eop-anti-phishing-policy-settings'></a>

### Anti-phishing policy settings for all cloud mailboxes

The anti-phishing policy settings described in this section are part of the default email protections included in all organizations with cloud mailboxes. For more information about these settings, see [Spoof settings](anti-phishing-policies-about.md#spoof-settings). To configure these settings, see [Configure anti-phishing policies for all cloud mailboxes](anti-phishing-policies-eop-configure.md).

The spoof settings are inter-related, but the **Show first contact safety tip** setting has no dependency on spoof settings.

Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

Although the **Apply quarantine policy** value appears unselected when you create an anti-phishing policy in the Defender portal, the quarantine policy named DefaultFullAccessPolicy¹ is used if you don't select a quarantine policy. This policy enforces the historical capabilities of messages quarantined as spoof as described in the table [in this article](quarantine-end-user.md). When you later view or edit the anti-phishing policy settings, the quarantine policy name is shown.

Admins can create or use quarantine policies with more restrictive or less restrictive capabilities. For instructions, see [Create quarantine policies in the Microsoft Defender portal](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

|Security feature name|Default|Standard|Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Spoof**|||||
|**Enable spoof intelligence** (_EnableSpoofIntelligence_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Actions**|||||
|**Honor DMARC record policy when the message is detected as spoof** (_HonorDmarcPolicy_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|When this setting is turned on, you control what happens to messages where the sender fails explicit [DMARC](email-authentication-dmarc-configure.md) checks when the policy action in the DMARC TXT record is set to `p=quarantine` or `p=reject`. For more information, see [Spoof protection and sender DMARC policies](anti-phishing-policies-about.md#spoof-protection-and-sender-dmarc-policies).|
|**If the message is detected as spoof and DMARC Policy is set as p=quarantine** (_DmarcQuarantineAction_)|**Quarantine the message** (`Quarantine`)|**Quarantine the message** (`Quarantine`)|**Quarantine the message** (`Quarantine`)|This action is meaningful only when **Honor DMARC record policy when the message is detected as spoof** is turned on.|
|**If the message is detected as spoof and DMARC Policy is set as p=reject** (_DmarcRejectAction_)|**Reject the message** (`Reject`)|**Reject the message** (`Reject`)|**Reject the message** (`Reject`)|This action is meaningful only when **Honor DMARC record policy when the message is detected as spoof** is turned on.|
|**If the message is detected as spoof by spoof intelligence** (_AuthenticationFailAction_)|**Move the message to the recipients' Junk Email folders** (`MoveToJmf`)|**Move the message to the recipients' Junk Email folders** (`MoveToJmf`)|**Quarantine the message** (`Quarantine`)|This setting applies to spoofed senders that were automatically blocked as shown in the [spoof intelligence insight](anti-spoofing-spoof-intelligence.md) or manually blocked in the [Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md#create-block-entries-for-spoofed-senders). <br/><br/> If you select **Quarantine the message** as the action for the spoof verdict, an **Apply quarantine policy** box is available.|
|**Quarantine policy** for **Spoof** (_SpoofQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if spoof detections are quarantined.|
|**Show first contact safety tip** (_EnableFirstContactSafetyTips_)|Not selected (`$false`)|Selected (`$true`)|Selected (`$true`)|For more information, see [First contact safety tip](anti-phishing-policies-about.md#first-contact-safety-tip).|
|**Show (?) for unauthenticated senders for spoof** (_EnableUnauthenticatedSender_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Adds a question mark (?) to the sender's photo in Outlook for unidentified spoofed senders. For more information, see [Unauthenticated sender indicators](anti-phishing-policies-about.md#unauthenticated-sender-indicators).|
|**Show "via" tag** (_EnableViaTag_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Adds a via tag (`chris@contoso.com via fabrikam.com`) to the From address if it's different from the domain in the DKIM signature or the **MAIL FROM** address. <br/><br/> For more information, see [Unauthenticated sender indicators](anti-phishing-policies-about.md#unauthenticated-sender-indicators).|

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

|Security feature name|Default|Standard|Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Phishing email threshold** (_PhishThresholdLevel_)|**1 - Standard** (`1`)|**3 - More aggressive** (`3`)|**4 - Most aggressive** (`4`)||

#### Impersonation settings in anti-phishing policies in Microsoft Defender for Office 365

For more information about these settings, see [Impersonation settings in anti-phishing policies in Microsoft Defender for Office 365](anti-phishing-policies-about.md#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365). To configure these settings, see [Configure anti-phishing policies in Defender for Office 365](anti-phishing-policies-mdo-configure.md).

Wherever you select **Quarantine the message** as the action for an impersonation verdict, an **Apply quarantine policy** box is available. Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

Although the **Apply quarantine policy** value appears unselected when you create an anti-phishing policy in the Defender portal, the quarantine policy named DefaultFullAccessPolicy is used if you don't select a quarantine policy. This policy enforces the historical capabilities of messages quarantined as impersonation as described in the table [in this article](quarantine-end-user.md). When you later view or edit the anti-phishing policy settings, the quarantine policy name is shown.

Admins can create or use quarantine policies with more restrictive or less restrictive capabilities. For instructions, see [Create quarantine policies in the Microsoft Defender portal](quarantine-policies.md#step-1-create-quarantine-policies-in-the-microsoft-defender-portal).

|Security feature name|Default|Standard|Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Impersonation**|||||
|<u>User impersonation protection</u>: **Enable users to protect** (_EnableTargetedUserProtection_ and _TargetedUsersToProtect_)|Not selected (`$false` and none)|Selected (`$true` and \<list of users\>)|Selected (`$true` and \<list of users\>)|We recommend adding users (message senders) in key roles. Internally, protected senders might be your CEO, CFO, and other senior leaders. Externally, protected senders could include council members or your board of directors.|
|<u>Domain impersonation protection</u>: **Enable domains to protect**|Not selected|Selected|Selected||
|**Include domains I own** (_EnableOrganizationDomainsProtection_)|Off (`$false`)|Selected (`$true`)|Selected (`$true`)||
|**Include custom domains** (_EnableTargetedDomainsProtection_ and _TargetedDomainsToProtect_)|Off (`$false` and none)|Selected (`$true` and \<list of domains\>)|Selected (`$true` and \<list of domains\>)|We recommend adding domains (sender domains) that you don't own, but you frequently interact with.|
|**Add trusted senders and domains** (_ExcludedSenders_ and _ExcludedDomains_)|None|None|None|Depending on your organization, we recommend adding senders or domains that are incorrectly identified as impersonation attempts.|
|**Enable mailbox intelligence** (_EnableMailboxIntelligence_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Enable intelligence for impersonation protection** (_EnableMailboxIntelligenceProtection_)|Off (`$false`)|Selected (`$true`)|Selected (`$true`)|This setting allows the specified action for impersonation detections by mailbox intelligence.|
|**Actions**|||||
|**If a message is detected as user impersonation** (_TargetedUserProtectionAction_)|**Don't apply any action** (`NoAction`)|**Quarantine the message** (`Quarantine`)|**Quarantine the message** (`Quarantine`)||
|**Quarantine policy** for **user impersonation** (_TargetedUserQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessWithNotificationPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if user impersonation detections are quarantined.|
|**If a message is detected as domain impersonation** (_TargetedDomainProtectionAction_)|**Don't apply any action** (`NoAction`)|**Quarantine the message** (`Quarantine`)|**Quarantine the message** (`Quarantine`)||
|**Quarantine policy** for **domain impersonation** (_TargetedDomainQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessWithNotificationPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if domain impersonation detections are quarantined.|
|**If mailbox intelligence detects an impersonated user** (_MailboxIntelligenceProtectionAction_)|**Don't apply any action** (`NoAction`)|**Move the message to the recipients' Junk Email folders** (`MoveToJmf`)|**Quarantine the message** (`Quarantine`)||
|**Quarantine policy** for **mailbox intelligence impersonation** (_MailboxIntelligenceQuarantineTag_)|DefaultFullAccessPolicy¹|DefaultFullAccessPolicy|DefaultFullAccessWithNotificationPolicy|The quarantine policy is meaningful only if mailbox intelligence detections are quarantined.|
|**Show user impersonation safety tip** (_EnableSimilarUsersSafetyTips_)|Off (`$false`)|Selected (`$true`)|Selected (`$true`)||
|**Show domain impersonation safety tip** (_EnableSimilarDomainsSafetyTips_)|Off (`$false`)|Selected (`$true`)|Selected (`$true`)||
|**Show user impersonation unusual characters safety tip** (_EnableUnusualCharactersSafetyTips_)|Off (`$false`)|Selected (`$true`)|Selected (`$true`)||

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

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [Set-AtpPolicyForO365](/powershell/module/exchange/set-atppolicyforo365) cmdlet for these settings.

|Security feature name|Default|Built-in protection|Comment|
|---|:---:|:---:|---|
|**Turn on Defender for Office 365 for SharePoint, OneDrive, and Microsoft Teams** (_EnableATPForSPOTeamsODB_)|Off (`$false`)|On (`$true`)|To prevent users from downloading malicious files, see [Use SharePoint Online PowerShell to prevent users from downloading malicious files](safe-attachments-for-spo-odfb-teams-configure.md#step-2-recommended-use-sharepoint-online-powershell-to-prevent-users-from-downloading-malicious-files).|
|**Turn on Safe Documents for Office clients** (_EnableSafeDocs_)|Off (`$false`)|On (`$true`)|This feature is available and meaningful only with licenses that aren't included in Defender for Office 365 (for example, Microsoft 365 A5 or Microsoft 365 E5 Security). For more information, see [Safe Documents in Microsoft 365 A5 or E5 Security](safe-documents-in-e5-plus-security-about.md).|
|**Allow people to click through Protected View even if Safe Documents identified the file as malicious** (_AllowSafeDocsOpen_)|Off (`$false`)|Off (`$false`)|This setting is related to Safe Documents.|

#### Safe Attachments policy settings

To configure these settings, see [Set up Safe Attachments policies in Defender for Office 365](safe-attachments-policies-configure.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [New-SafeAttachmentPolicy](/powershell/module/exchange/new-safeattachmentpolicy) and [Set-SafeAttachmentPolicy](/powershell/module/exchange/set-safelinkspolicy) cmdlets for these settings.

> [!NOTE]
> As described earlier, although there's no default Safe Attachments policy, the **Built-in protection** preset security policy provides Safe Attachments protection to all recipients who aren't defined in the Standard preset security policy, the Strict preset security policy, or in custom Safe Attachments policies.
>
> The **Default in custom** column in the following table refers to the default values in new Safe Attachments policies that you create. The remaining columns indicate (unless otherwise noted) the values that are configured in the corresponding preset security policies.

Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

The policy named AdminOnlyAccessPolicy enforces the historical capabilities of messages quarantined as malware as described in the table [in this article](quarantine-end-user.md).

Users can't release their own messages quarantined as malware or phishing by Safe Attachments, regardless of how the quarantine policy is configured. If the policy is configured for users to release these quarantined messages, users are instead allowed to _request_ the release of these quarantined messages.

|Security feature name|Default in custom|Built-in protection|Standard|Strict|Comment|
|---|:---:|:---:|:---:|:---:|---|
|**Safe Attachments unknown malware response** (_Enable_ and _Action_)|**Off** (`-Enable $false` and `-Action Block`)|**Block** (`-Enable $true` and `-Action Block`)|**Block** (`-Enable $true` and `-Action Block`)|**Block** (`-Enable $true` and `-Action Block`)|When the _Enable_ parameter is $false, the value of the _Action_ parameter doesn't matter.|
|**Quarantine policy** (_QuarantineTag_)|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy||
|**Redirect attachment with detected attachments** : **Enable redirect** (_Redirect_ and _RedirectAddress_)|Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)|Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)|Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)|Not selected and no email address specified. (`-Redirect $false` and _RedirectAddress_ is blank)|Redirection of messages is available only when the **Safe Attachments unknown malware response** value is **Monitor** (`-Enable $true` and `-Action Allow`).|

### Safe Links policy settings

For more information about Safe Links protection, see [Safe Links in Defender for Office 365](safe-links-about.md).

Although there's no default Safe Links policy, the **Built-in protection** preset security policy provides Safe Links protection to all recipients who aren't defined in the Standard preset security policy, the Strict preset security policy or in custom Safe Links policies. For more information, see [Preset security policies](preset-security-policies.md).

To configure Safe Links policy settings, see [Set up Safe Links policies in Microsoft Defender for Office 365](safe-links-policies-configure.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [New-SafeLinksPolicy](/powershell/module/exchange/new-safelinkspolicy) and [Set-SafeLinksPolicy](/powershell/module/exchange/set-safelinkspolicy) cmdlets for Safe Links policy settings.

> [!NOTE]
> The **Default in custom** column refers to the default values in new Safe Links policies that you create. The remaining columns indicate (unless otherwise noted) the values that are configured in the corresponding preset security policies.

|Security feature name|Default in custom|Built-in protection|Standard|Strict|Comment|
|---|:---:|:---:|:---:|:---:|---|
|**URL & click protection settings**||||||
|**Email**|||||The settings in this section affect URL rewriting and time of click protection in email messages.|
|**On: Safe Links checks a list of known, malicious links when users click links in email. URLs are rewritten by default.** (_EnableSafeLinksForEmail_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Apply Safe Links to email messages sent within the organization** (_EnableForInternalSenders_)|Selected (`$true`)|Not selected (`$false`)|Selected (`$true`)|Selected (`$true`)||
|**Apply real-time URL scanning for suspicious links and links that point to files** (_ScanUrls_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Wait for URL scanning to complete before delivering the message** (_DeliverMessageAfterScan_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Do not rewrite URLs, do checks via Safe Links API only** (_DisableURLRewrite_)|Selected (`$false`)<sup>\*</sup>|Selected (`$true`)|Not selected (`$false`)|Not selected (`$false`)|<sup>\*</sup> In new Safe Links policies that you create in the Defender portal, this setting is selected by default. In new Safe Links policies that you create in PowerShell, the default value of the _DisableURLRewrite_ parameter is `$false`.|
|**Do not rewrite the following URLs in email** (_DoNotRewriteUrls_)|Blank|Blank|Blank|Blank|We have no specific recommendation for this setting. <br/><br/> **Note**: Safe Links doesn't scan or wrap entries in the "Don't rewrite the following URLs" list during mail flow. Report the URL as **I've confirmed it's clean** and then select **Allow this URL** to add an allow entry to the Tenant Allow/Block List so the URL isn't scanned or wrapped by Safe Links during mail flow _and_ at time of click. For instructions, see [Report good URLs to Microsoft](submissions-admin.md#report-good-urls-to-microsoft).|
|**Teams**|||||The setting in this section affects time of click protection in Microsoft Teams.|
|**On: Safe Links checks a list of known, malicious links when users click links in Microsoft Teams. URLs are not rewritten.** (_EnableSafeLinksForTeams_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Office 365 apps**|||||The setting in this section affects time of click protection in Office apps.|
|**On: Safe Links checks a list of known, malicious links when users click links in Microsoft Office apps. URLs are not rewritten.** (_EnableSafeLinksForOffice_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Use Safe Links in supported Office 365 desktop and mobile (iOS and Android) apps. For more information, see [Safe Links settings for Office apps](safe-links-about.md#safe-links-settings-for-office-apps).|
|**Click protection settings**||||||
|**Track user clicks** (_TrackClicks_)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)|Selected (`$true`)||
|**Let users click through to the original URL** (_AllowClickThrough_)|Selected (`$false`)<sup>\*</sup>|Selected (`$true`)|Not selected (`$false`)|Not selected (`$false`)|<sup>\*</sup> In new Safe Links policies that you create in the Defender portal, this setting is selected by default. In new Safe Links policies that you create in PowerShell, the default value of the _AllowClickThrough_ parameter is `$false`.|
|**Display the organization branding on notification and warning pages** (_EnableOrganizationBranding_)|Not selected (`$false`)|Not selected (`$false`)|Not selected (`$false`)|Not selected (`$false`)|We have no specific recommendation for this setting. <br/><br/> Before you turn on this setting, you need to follow the instructions in [Customize the Microsoft 365 theme for your organization](/microsoft-365/admin/setup/customize-your-organization-theme) to upload your company logo.|
|**Notification**||||||
|**How would you like to notify your users?** (_CustomNotificationText_ and _UseTranslatedNotificationText_)|**Use the default notification text** (Blank and `$false`)|**Use the default notification text** (Blank and `$false`)|**Use the default notification text** (Blank and `$false`)|**Use the default notification text** (Blank and `$false`)|We have no specific recommendation for this setting. <br/><br/> You can select **Use custom notification text** (`-CustomNotificationText "<Custom text>"`) to enter and use customized notification text. If you specify custom text, you can also select **Use Microsoft Translator for automatic localization** (`-UseTranslatedNotificationText $true`) to automatically translate the text into the user's language.|

### Microsoft Teams protection settings in Microsoft Defender for Office 365

For more information about Microsoft Teams protection, see [Microsoft Defender for Office 365 Plan 2 support for Microsoft Teams](mdo-support-teams-about.md).

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), you use the [New-TeamsProtectionPolicy](/powershell/module/exchange/new-teamsprotectionpolicy) and [Set-TeamsProtectionPolicy](/powershell/module/exchange/set-teamsprotectionpolicy) cmdlets for Microsoft Teams protection settings.

> [!NOTE]
> Microsoft Teams protection isn't part of the Standard or Strict preset security policies, any custom threat policies, or the default threat policies. The **Standard** and **Strict** values indicate our **recommended** values.

|Security feature name|Default|Standard|Strict|Comment|
|---|:---:|:---:|:---:|---|
|**Zero-hour auto purge (ZAP)** (_ZapEnabled_)|**On** (`$true`)|**On** (`$true`)|**On** (`$true`)||
|**Quarantine policies**|||||
|&nbsp;&nbsp;**Malware** (_MalwareQuarantineTag_)|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy||
|&nbsp;&nbsp;**High confidence phishing** (_HighConfidencePhishQuarantineTag_)|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy|AdminOnlyAccessPolicy||

## Related articles

- Are you looking for best practices for **Exchange mail flow rules (also known as transport rules**)? See [Best practices for configuring mail flow rules in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/configuration-best-practices).

- Admins and users can submit false positives (good email marked as bad) and false negatives (bad email allowed) to Microsoft for analysis. For more information, see [Report messages and files to Microsoft](submissions-report-messages-files-to-microsoft.md).

- You can find **Security baselines for Windows** in the following articles:
  - **Group policy**: [Where can I get the security baselines?](/windows/security/operating-system-security/device-management/windows-security-configuration-framework/windows-security-baselines#where-can-i-get-the-security-baselines)
  - **Microsoft Intune***: [Use security baselines to configure Windows devices in Intune](/intune/intune-service/protect/security-baselines) for Intune-based security.
  - **Comparison of Microsoft Defender for Endpoint and Microsoft Intune security baselines**: [Compare the Microsoft Defender for Endpoint and the Windows Intune security baselines](/defender-endpoint/configure-machines-security-baseline#compare-the-microsoft-defender-for-endpoint-and-the-windows-intune-security-baselines).
