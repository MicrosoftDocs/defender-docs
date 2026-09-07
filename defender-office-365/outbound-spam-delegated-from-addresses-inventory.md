---
title: Inventory delegated From addresses for outbound spam policies
description: Use Exchange Online PowerShell to inventory Send As and Send on behalf permissions so you can map delegated From addresses to outbound spam policies.
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.service: defender-office-365
ms.date: 07/27/2026
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom: msecd-doc-authoring-1015
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
ai-usage: ai-assisted
#customer intent: As an admin, I want to inventory delegated Send As and Send on behalf permissions so I can map delegated From addresses to outbound spam policies and prevent unexpected sending restrictions.
---

# Inventory delegated From addresses for outbound spam policies

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Outbound spam policy limits depend on the address in the **From** field (also known as the `5322.From` address or P2 sender) of each message, not just the authenticated sender. For details, see [How outbound spam policy limits apply to Send As and Send on behalf permissions](outbound-spam-policies-send-as-send-on-behalf.md).

An inventory of delegated sending permissions helps you:

- Identify who can send email from mailboxes and group addresses.
- Investigate unexpected outbound sending restrictions.
- Verify that delegated From addresses are covered by appropriate outbound spam policies.

Include the following delegated permissions in the inventory:

- **Send As** permissions assigned on mailboxes and groups.
- **Send on behalf** permissions assigned on mailboxes, distribution groups, dynamic distribution groups, mail-enabled security groups, and Microsoft 365 Groups.

Keep the following points in mind:

- **Full Access** permissions are excluded, because they don't grant the ability to send email from the mailbox.
- If a delegate has both **Send As** and **Send on behalf** permissions for the same target, **Send As** takes precedence.

## Before you begin

- Connect to Exchange Online PowerShell. For instructions, see [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell).
- You need to be assigned permissions before you can run the commands in this article. You have the following options:
  - [Exchange Online permissions](/exchange/permissions-exo/permissions-exo): Membership in a role group that has the **View-Only Recipients** role assigned. By default, that role is assigned to the **Organization Management**, **View-Only Organization Management**, **Compliance Management**, **Hygiene Management**, and **Help Desk** role groups.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Exchange Administrator**, **Exchange Recipient Administrator**, or **Global Reader** roles gives users read access to recipients _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

## Inventory Send As permissions

Send As assignments are stored as recipient permissions, so you can inventory them for the whole organization. The following Exchange Online PowerShell command returns Send As assignments, excludes the built-in `NT AUTHORITY\SELF` and `NT AUTHORITY\SYSTEM` trustees, and sorts the results:

```powershell
Get-EXORecipientPermission -AccessRights SendAs -ResultSize Unlimited | Where-Object { $_.Trustee -ne "NT AUTHORITY\SELF" -and $_.Trustee -ne "NT AUTHORITY\SYSTEM" } | Select-Object Identity, Trustee, AccessRights | Sort-Object Identity, Trustee
```

The output includes the following fields:

- _Identity_ is the mailbox or group address that can be used as the delegated From address.
- _Trustee_ is the user or mail-enabled security group granted Send As permission.

To export the results to a CSV file, replace \<PathAndFilename\> with the desired name and location of the CSV file, and then add ` | Export-Csv -Path "<PathAndFilename>.csv" -NoTypeInformation` to the end of the command.

For more information, see [Get-EXORecipientPermission](/powershell/module/exchangepowershell/get-exorecipientpermission).

## Inventory Send on behalf permissions

Send on behalf assignments are stored in the _GrantSendOnBehalfTo_ property of recipient objects. Because the script that collects these assignments is long, save it as a script file and then run it in Exchange Online PowerShell:

1. Copy the code from the following code block into a plain-text editor like Notepad.
1. Save the file with a .ps1 extension (for example, `GetSendOnBehalf.ps1`) in a location that's easy to find (for example, `C:\Data\`).
1. In Exchange Online PowerShell, run the following command:

   ```powershell
   & "C:\Data\GetSendOnBehalf.ps1"
   ```

The script collects assignments from mailboxes, distribution groups, dynamic distribution groups, and Microsoft 365 Groups, and returns one row for each delegation.

```powershell
$sendOnBehalfPermissions = @()

# Mailboxes
Get-EXOMailbox -ResultSize Unlimited -Properties GrantSendOnBehalfTo |
    Where-Object { $_.GrantSendOnBehalfTo.Count -gt 0 } |
    ForEach-Object {
        $target = $_
        foreach ($delegate in $target.GrantSendOnBehalfTo) {
            $sendOnBehalfPermissions += [PSCustomObject]@{
                Permission        = "Send on behalf"
                FromAddress       = $target.PrimarySmtpAddress
                FromDisplayName   = $target.DisplayName
                FromRecipientType = $target.RecipientTypeDetails
                Delegate          = $delegate
            }
        }
    }

# Distribution groups
Get-DistributionGroup -ResultSize Unlimited |
    Where-Object { $_.GrantSendOnBehalfTo.Count -gt 0 } |
    ForEach-Object {
        $target = $_
        foreach ($delegate in $target.GrantSendOnBehalfTo) {
            $sendOnBehalfPermissions += [PSCustomObject]@{
                Permission        = "Send on behalf"
                FromAddress       = $target.PrimarySmtpAddress
                FromDisplayName   = $target.DisplayName
                FromRecipientType = $target.RecipientTypeDetails
                Delegate          = $delegate
            }
        }
    }

# Dynamic distribution groups
Get-DynamicDistributionGroup -ResultSize Unlimited |
    Where-Object { $_.GrantSendOnBehalfTo.Count -gt 0 } |
    ForEach-Object {
        $target = $_
        foreach ($delegate in $target.GrantSendOnBehalfTo) {
            $sendOnBehalfPermissions += [PSCustomObject]@{
                Permission        = "Send on behalf"
                FromAddress       = $target.PrimarySmtpAddress
                FromDisplayName   = $target.DisplayName
                FromRecipientType = $target.RecipientTypeDetails
                Delegate          = $delegate
            }
        }
    }

# Microsoft 365 Groups
Get-UnifiedGroup -ResultSize Unlimited |
    Where-Object { $_.GrantSendOnBehalfTo.Count -gt 0 } |
    ForEach-Object {
        $target = $_
        foreach ($delegate in $target.GrantSendOnBehalfTo) {
            $sendOnBehalfPermissions += [PSCustomObject]@{
                Permission        = "Send on behalf"
                FromAddress       = $target.PrimarySmtpAddress
                FromDisplayName   = $target.DisplayName
                FromRecipientType = "Microsoft 365 Group"
                Delegate          = $delegate
            }
        }
    }

$sendOnBehalfPermissions |
    Sort-Object FromAddress, Delegate |
    Format-Table -AutoSize
```

To export the results to a CSV file, replace the final `Format-Table -AutoSize` command with `Export-Csv -Path "<PathAndFilename>.csv" -NoTypeInformation`, where \<PathAndFilename\> is the desired name and location of the CSV file.

> [!NOTE]
> For dynamic distribution groups, the _GrantSendOnBehalfTo_ property returns directory identities. To return friendly display names instead, run **Get-DynamicDistributionGroup** with the _IncludeGrantSendOnBehalfToWithDisplayNames_ switch.

## Review permissions assigned through groups

The inventory reports only the trustee that received the permission directly. Because a trustee can be a group, users can inherit delegated sending rights through membership even when their names don't appear in the results.

For each group trustee:

- Determine whether the group-based permission assignment is still needed.
- Review the current membership of the group. The command in this section expands nested groups automatically, so members of nested groups are included in the results.
- Document the effective users that can send email from the delegated address.

To list all members of a group, including members of any nested groups, replace \<GroupName\> with the name, alias, or email address of the group, and then run the following command:

```powershell
function Get-AllGroupMembers ($GroupIdentity) {$members = Get-DistributionGroupMember -Identity $GroupIdentity -ResultSize Unlimited; foreach ($member in $members) {if ($member.RecipientType -like "*Group*") { Get-AllGroupMembers $member.PrimarySmtpAddress} else {$member}}}; Get-AllGroupMembers "<GroupName>" | Select-Object DisplayName, PrimarySmtpAddress, RecipientType -Unique
```

## Map delegated permissions to outbound spam policies

Use the inventory results to build a mapping between the effective delegate, the delegated From address, the delegated permission type, and the outbound spam policy that applies to that From address. For example:

|Effective delegate|Delegated From address|Permission|Outbound spam policy for the From address|
|---|---|---|---|
|`sender@contoso.com`|`shared@contoso.com`|Send As|Default outbound spam policy|
|`sender@contoso.com`|`sales@contoso.com`|Send on behalf|High-volume senders|

For each user, compare:

- The user's own From address.
- Every delegated From address the user routinely uses.
- Delegated permissions obtained through group membership.
- Delegated permissions obtained through nested groups.

If different policies have different limits or restriction actions, users can encounter unexpected restrictions when they send email from delegated addresses. To adjust policy coverage, see [Configure outbound spam policies](outbound-spam-policies-configure.md).

## Related content

- [How outbound spam policy limits apply to Send As and Send on behalf permissions](outbound-spam-policies-send-as-send-on-behalf.md)
- [Configure outbound spam policies](outbound-spam-policies-configure.md)
- [Troubleshoot outbound sending limits in Exchange Online](outbound-spam-sending-limits-troubleshoot.md)
- [Manage permissions for recipients in Exchange Online](/exchange/recipients-in-exchange-online/manage-permissions-for-recipients)
