---
title: Microsoft Defender for Office 365 support for Microsoft Teams
f1.keywords: 
  - NOCSH
author: chrisda
ms.author: chrisda
audience: Admin
ms.topic: overview
ms.localizationpriority: medium
search.appverid: 
  - MET150
  - MOE150
ms.collection: 
  - m365-security
  - tier1
description: Admins can learn about Microsoft Teams features in Microsoft Defender for Office 365.
ms.service: defender-office-365
ms.date: 03/12/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Microsoft Defender for Office 365 support for Microsoft Teams

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

With the increased use of collaboration tools like Microsoft Teams, the possibility of malicious attacks using chat messages has also increased. This article describes the Microsoft 365 and Microsoft Defender for Office 365 protection features for Microsoft Teams.

All licenses of Microsoft Teams in Microsoft 365 include the following built-in protections:

- [Built-in virus protection in SharePoint, SharePoint Embedded, OneDrive, and Microsoft Teams](anti-malware-protection-for-spo-odfb-teams-about.md)
- [Microsoft Teams external domain anomalies report](/microsoftteams/teams-analytics-and-reports/external-domain-anomalies-report).
- **Near real-time URL protection in Teams messages (currently in Preview)**: Known, malicious URLs in Teams messages are delivered with a warning. Messages found to contain malicious URLs up to 48 hours after delivery also receive a warning. The warning is added to messages in internal and external chats and channels for all URL verdicts (not just malware or high confidence phishing).

  :::image type="content" source="media/teams-message-url-warning.png" alt-text="Screenshot showing a Microsoft Teams message with a URL warning." lightbox="media/teams-message-url-warning.png":::

  To turn this feature off or on, see [Verify warnings for unsafe links are shown in Microsoft Teams messages](mdo-support-teams-quick-configure.md#step-3-verify-warnings-for-unsafe-links-are-shown-in-microsoft-teams-messages).

Microsoft Defender for Office 365 Plan 1 provides the following extra Teams protection features:

- Time of click protection for URLs and files in Teams messages through [Safe Links for Microsoft Teams](safe-links-about.md#safe-links-settings-for-microsoft-teams) and [Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](safe-attachments-for-spo-odfb-teams-about.md).
- Allow/block [domains and addresses](tenant-allow-block-list-teams-domains-configure.md), [URLs](tenant-allow-block-list-urls-configure.md) and [files](tenant-allow-block-list-files-configure.md) inside Teams using the Tenant Allow Block List.
- **Zero-hour auto protection (ZAP) for Teams**: ZAP is an existing email protection feature that detects and neutralizes spam, phishing, and malware messages after delivery by moving the messages to the Junk Email folder or quarantine.

  ZAP for Teams quarantines messages in internal Teams chats or channels that are found to be malware or high confidence phishing. For more information, see [Zero-hour auto purge (ZAP) in Microsoft Teams](zero-hour-auto-purge.md#zero-hour-auto-purge-zap-in-microsoft-teams).

  Instructions to configure ZAP for Teams protection are in the next section.

- **Teams messages in quarantine**: By default, only admins are allowed to manage Teams messages quarantined by ZAP for Teams. This is the same default limitation for email messages identified as malware or high confidence phishing. For more information, see [Manage quarantined Teams messages](quarantine-admin-manage-messages-files.md#use-the-microsoft-defender-portal-to-manage-microsoft-teams-quarantined-messages).

- **Teams message entity panel**: A single place to store all Teams message metadata for immediate SecOps review. Any threats coming from Teams chats, group chats, meeting chats, and other channels can be found in one place as soon as they're assessed. For more information, see [the Teams message entity panel](teams-message-entity-panel.md).

- **Report Teams messages**: Users can report Teams messages as malicious or not malicious. Depending on the reported message settings in the organization, reported messages go to the specified reporting mailbox, to Microsoft, or both. For more information, see [User reported settings in Teams](submissions-teams.md).

Microsoft 365 E5 and Defender for Office 365 Plan 2 extend Teams protection with a set of extra capabilities designed to disrupt the attack chain:

- **Remove users from Teams chat**: To remediate malicious attacks, you can remove users from teams chats directly from the [Teams message entity panel](teams-message-entity-panel.md#remove-users-from-teams-chats-in-the-teams-message-entity-panel).

- **Hunting on Teams messages with URLs**: You can hunt for Teams messages containing URL across three new advanced hunting tables: [MessageEvents](/defender-xdr/advanced-hunting-messageevents-table), [MessagePostDeliveryEvents](/defender-xdr/advanced-hunting-messagepostdeliveryevents-table), and [MessageURLInfo](/defender-xdr/advanced-hunting-messageurlinfo-table).

These features are summarized in the following table:

|Feature|All Teams<br/>licenses|Defender for Office 365<br/>Plan 1|Defender for Office 365<br/>Plan 2|
|---|:---:|:---:|:---:|
|Built-in virus protection (SharePoint, OneDrive, Teams)|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Microsoft Teams external domain anomalies report|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Near real-time URL warnings (up to 48 hours post-delivery)|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Safe Links (time-of-click URL protection)||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Safe Attachments (time-of-click file protection)||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Tenant Allow/Block List (domains, URLs, files)||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Zero-hour auto purge (ZAP) for Teams||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Teams messages in quarantine (admin-managed)||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Teams message entity panel||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|User-reported Teams messages||:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_present_icon.png":::|
|Remove users from Teams chats (admin remediation)|||:::image type="icon" source="media/feature_present_icon.png":::|
|Attack simulation training with Teams messages|||:::image type="icon" source="media/feature_present_icon.png":::|
|Advanced hunting on Teams messages|||:::image type="icon" source="media/feature_present_icon.png":::|

<a name='configure-zap-for-teams-protection-in-defender-for-office-365-plan-2'></a>

## Configure ZAP for Teams protection in Defender for Office 365

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Settings** \> **Email & collaboration** \> **Microsoft Teams protection**. Or, to go directly to the **Microsoft Teams protection** page, use <https://security.microsoft.com/securitysettings/teamsProtectionPolicy>.

2. On the **Microsoft Teams protection** page, verify the toggle in the **Zero-hour auto purge (ZAP)** section:
   - **Turn on ZAP for Teams**: Verify the toggle is **On** :::image type="icon" source="media/scc-toggle-on.png" border="false":::.
   - **Turn off ZAP for Teams**: Slide the toggle to **Off** :::image type="icon" source="media/scc-toggle-off.png" border="false":::.

3. When the toggle is **On** :::image type="icon" source="media/scc-toggle-on.png" border="false":::, use the remaining settings on the page to customize ZAP for Teams protection:

   - **Quarantine policies** section: You can select the existing quarantine policy to use for messages that are quarantined by ZAP for Teams protection as **Malware** or **High confidence phishing**. Quarantine policies define what users are able to do to quarantined messages, and whether users receive quarantine notifications. For more information, see [Anatomy of a quarantine policy](quarantine-policies.md#anatomy-of-a-quarantine-policy).

     > [!NOTE]
     > Currently, quarantined Teams messages are available only to admins, and users don't receive quarantine notifications (the AdminOnlyAccess quarantine policy is used).

   - **Exclude these participants** section: Specify the **Users**, **Groups**, or **Domains** to exclude from ZAP for Teams protection. Exclusions matter for message _recipients_, not message _senders_. For more information, see [Zero-hour auto purge (ZAP) in Microsoft Teams](zero-hour-auto-purge.md#zero-hour-auto-purge-zap-in-microsoft-teams).

     You can use an exception only once, but the exception can contain multiple values:

     - Multiple **values** of the **same exception** use OR logic (for example, _\<recipient1\>_ or _\<recipient2\>_). If the recipient matches **any** of the specified values, ZAP for Teams protection isn't applied to them.
     - Different **types of exceptions** use OR logic (for example, _\<recipient1\>_ or _\<member of group1\>_ or _\<member of domain1\>_). If the recipient matches **any** of the specified exception values, ZAP for Teams protection isn't applied to them.

4. When you're finished on the **Microsoft Teams protection** page, select **Save**.

:::image type="content" source="media/zap-teams-policy-mdo.png" alt-text="Image showing policy settings for Microsoft Teams." lightbox="media/zap-teams-policy-mdo.png":::

### Use Exchange Online PowerShell to configure ZAP for Teams protection

If you'd rather use [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) to configure ZAP for Microsoft Teams, the following cmdlets are involved:

- The Teams protection policy (**\*-TeamsProtectionPolicy** cmdlets) turns ZAP for Teams on and off and specifies the quarantine policies to use for malware and high confidence phishing detections.
- The Teams protection policy rule (**\*-TeamsProtectionPolicyRule** cmdlets) identifies the Teams protection policy and specifies any exceptions for ZAP for Teams protection (users, groups, or domains).

**Notes**:

- There's only one Teams protection policy in an organization. By default, that policy is named Teams Protection Policy.
- Using the **New-TeamsProtectionPolicy** cmdlet is meaningful only if there's no Teams protection policy in the organization (the **Get-TeamsProtectionPolicy** cmdlet returns nothing). You can run the cmdlet without error, but no new Teams protection policies are created if one already exists.
- You can't remove an existing Teams protection policy or Teams protection policy rule (there's no **Remove-TeamsProtectionPolicy** or **Remove-TeamsProtectionPolicyRule** cmdlet).
- By default, there's a Teams protection policy rule named Teams Protection Policy Rule in an organization as returned by the **Get-TeamsProtectionPolicyRule** cmdlet. You can use the Defender portal or the **Set-TeamsProtectionPolicyRule** cmdlet to modify the quarantine policies or exceptions for ZAP for Teams.

#### Use PowerShell to view the Teams protection policy and Teams protection policy rule

To view the important values in Teams protection policy and Teams protection policy rule, run the following commands:

```powershell
Get-TeamsProtectionPolicy | Format-List Name,ZapEnabled,HighConfidencePhishQuarantineTag,MalwareQuarantineTag

Get-TeamsProtectionPolicyRule | Format-List Name,TeamsProtectionPolicy,ExceptIfSentTo,ExceptIfSentToMemberOf,ExceptIfRecipientDomainIs
```

For detailed syntax and parameter information, see [Get-TeamsProtectionPolicy](/powershell/module/exchangepowershell/get-teamsprotectionpolicy) and [Get-TeamsProtectionPolicyRule](/powershell/module/exchangepowershell/get-teamsprotectionpolicyrule).

#### Use PowerShell to modify the Teams protection policy

To modify the Teams protection policy, use the following syntax:

```powershell
Set-TeamsProtectionPolicy -Identity "Teams Protection Policy" [-ZapEnabled <$true | $false>] [-HighConfidencePhishQuarantineTag "<QuarantinePolicyName>"] [-MalwareQuarantineTag "<QuarantinePolicyName>"]
```

This example enables ZAP for Teams and changes the quarantine policy that's used for high confidence phishing detections:

```powershell
Set-TeamsProtectionPolicy -Identity "Teams Protection Policy" -ZapEnabled $true -HighConfidencePhishQuarantineTag AdminOnlyWithNotifications
```

For detailed syntax and parameter information, see [Set-TeamsProtectionPolicy](/powershell/module/exchangepowershell/set-teamsprotectionpolicy).

#### Use PowerShell to create the Teams protection policy rule

By default, there's no Teams protection policy rule, because there are no default exceptions for ZAP for Teams.

To create a new Teams protection policy rule, use the following syntax:

```powershell
New-TeamsProtectionPolicyRule -Name "Teams Protection Policy Rule" -TeamsProtectionPolicy "Teams Protection Policy" [-ExceptIfSentTo <UserEmail1,UserEmail2,...UserEmailN>] [-ExceptIfSentToMemberOf <GroupEmail1,GroupEmail2,...GroupEmailN>] [-ExceptIfRecipientDomainIs <Domain1,Domain2,...DomainN>]
```

> [!IMPORTANT]
> As explained previously in this article, multiple exception types (users, groups, and domains) use OR logic, not AND.

This example creates the Teams protection policy rule with members of the group named Research excluded from ZAP for Teams protection.

```powershell
New-TeamsProtectionPolicyRule -Name "Teams Protection Policy Rule" -TeamsProtectionPolicy "Teams Protection Policy" -ExceptIfSentToMemberOf research@contoso.onmicrosoft.com
```

For detailed syntax and parameter information, see [New-TeamsProtectionPolicyRule](/powershell/module/exchangepowershell/new-teamsprotectionpolicyrule).

#### Use PowerShell to modify the Teams protection policy rule

If the Teams protection policy rule already exists (the **Get-TeamsProtectionPolicyRule** cmdlet returns output), use the following syntax to modify the rule:

```powershell
Set-TeamsProtectionPolicyRule -Identity "Teams Protection Policy Rule" [-ExceptIfSentTo <UserEmailAddresses | $null>] [-ExceptIfSentToMemberOf <GroupEmailAddresses | $null>] [-ExceptIfRecipientDomainIs <Domains | $null>]
```

**Notes**:

- For information about the syntax for adding, removing, and replacing all values for the _ExceptIfSentTo_, _ExceptIfSentToMemberOf_, and _ExceptIfRecipientDomainIs_ parameters, see the parameter descriptions in [Set-TeamsProtectionPolicyRule](/powershell/module/exchangepowershell/set-teamsprotectionpolicyrule).
- To empty the _ExceptIfSentTo_, _ExceptIfSentToMemberOf_, or _ExceptIfRecipientDomainIs_ parameters, use the value `$null`.

This example modifies the existing Teams protection policy rule by excluding recipients in the domains research.contoso.com and research.contoso.net from ZAP for Teams protection.

```powershell
Set-TeamsProtectionPolicyRule -Identity "Teams Protection Policy Rule" -ExceptIfRecipientDomainIs research.contoso.com,research.contoso.net
```

For detailed syntax and parameter information, see [Set-TeamsProtectionPolicyRule](/powershell/module/exchangepowershell/set-teamsprotectionpolicyrule).

## See also

- [Microsoft Teams](/microsoftteams/teams-overview)
- [Managing Teams quarantined messages](quarantine-admin-manage-messages-files.md#use-the-microsoft-defender-portal-to-manage-microsoft-teams-quarantined-messages)
- [Get started using Attack simulation training in Defender for Office 365](attack-simulation-training-get-started.md)
- [Get started with Defender for Cloud Apps for Microsoft Teams](/defender-cloud-apps/what-is-defender-for-cloud-apps)
- [Get started with Compliance and DLP protection for Microsoft Teams](/microsoftteams/security-compliance-overview)
