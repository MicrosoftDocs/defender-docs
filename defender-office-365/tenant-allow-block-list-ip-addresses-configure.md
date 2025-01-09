---
title: Allow or block IPv6 addresses using the Tenant Allow/Block List
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
search.appverid:
  - MET150
ms.collection:
  - m365-security
  - tier1
description: Admins can learn how to allow or block IPv6 addresses in the Tenant Allow/Block List.
ms.service: defender-office-365
ms.date: 09/20/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Allow or block IPv6 addresses using the Tenant Allow/Block List

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In Microsoft 365 organizations with mailboxes in Exchange Online or standalone Exchange Online Protection (EOP) organizations without Exchange Online mailboxes, admins can create and manage entries for IPv6 addresses in the Tenant Allow/Block List. For more information about the Tenant Allow/Block List, see [Manage allows and blocks in the Tenant Allow/Block List](tenant-allow-block-list-about.md).

This article describes how admins can manage entries for IPv6 addresses in the Microsoft Defender portal and in Exchange Online PowerShell.

## What do you need to know before you begin?

- You open the Microsoft Defender portal at <https://security.microsoft.com>. To go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>. To go directly to the **Submissions** page, use <https://security.microsoft.com/reportsubmission>.

- To connect to Exchange Online PowerShell, see [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell). To connect to standalone EOP PowerShell, see [Connect to Exchange Online Protection PowerShell](/powershell/exchange/connect-to-exchange-online-protection-powershell).

- IPv6 addresses are supported only in the following formats:
  - Single addresses in colon-hexadecimal format. For example, 2001:0db8:85a3:0000:0000:8a2e:0370:7334.
  - Single addresses in zero-compression format. For example, 2001:db8::1 represents 2001:0db8:0000:0000:0000:0000:0000:0001.
  - CIDR IPv6 range. For example, 2001:0db8::/32. 1-128 range is supported.

- Entry limits for IP addresses:
  - **Exchange Online Protection**: The maximum number of allow entries is 500, and the maximum number of block entries is 500 (1000 IP entries in total).
  - **Defender for Office 365 Plan 1**: The maximum number of allow entries is 1000, and the maximum number of block entries is 1000 (2000 IP entries in total).
  - **Defender for Office 365 Plan 2**: The maximum number of allow entries is 5000, and the maximum number of block entries is 10000 (15000 IP entries in total).

- An entry should be active within 5 minutes.

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Exchange Online permissions** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Authorization and settings/Security settings/Detection tuning (manage)** or **Authorization and settings/Security settings/Core security settings (read)**.
  - [Exchange Online permissions](/exchange/permissions-exo/permissions-exo):
    - _Add and remove entries from the Tenant Allow/Block List_: Membership in one of the following role groups:
      - **Organization Management** or **Security Administrator** (Security admin role).
      - **Security Operator** (Tenant AllowBlockList Manager role): This permission works only when assigned directly in the **Exchange admin center** at <https://admin.exchange.microsoft.com> \> **Roles** \> **Admin Roles**.
    - _Read-only access to the Tenant Allow/Block List_: Membership in one of the following role groups:
      - **Global Reader**
      - **Security Reader**
      - **View-Only Configuration**
      - **View-Only Organization Management**
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, **Global Reader**, or **Security Reader** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Create allow entries for IPv6 addresses

The allow entry overrides only the IP filters for the specified sending IP address.

You can create allow entries for IPv6 addresses directly in the Tenant Allow/Block List as described in this section.

### Use the Microsoft Defender portal to create allow entries for IPv6 addresses in the Tenant Allow/Block List

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. On the **Tenant Allow/Block Lists** page, select the **IP addresses** tab.

3. On the **IP addresses** tab, select :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Allow**.

4. In the **Allow IP addresses** flyout that opens, configure the following settings:

   - **Add IP address**: Enter one IP address per line, up to a maximum of 20.

   - **Remove allow entry after**: Select from the following values:
     - **1 day**
     - **7 days**
     - **30 days**
     - **Never expire** (default)
     - **Specific date**: The maximum value is 90 days from today.

   - **Optional note**: Enter descriptive text for why you're allowing the IP addresses.

   When you're finished in the **Allow IP addresses** flyout, select **Add**.

Back on the **IP addresses** tab, the entry is listed.

#### Use PowerShell to create allow entries for IPv6 addresses in the Tenant Allow/Block List

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), use the following syntax:

```powershell
New-TenantAllowBlockListItems -ListType IP -Allow -Entries "IPAddress1","IPAddress2",..."IPAddressN" <-ExpirationDate Date | -NoExpiration> [-Notes <String>]
```

This example adds an allow entry for the specified IP address that never expires.

```powershell
New-TenantAllowBlockListItems -ListType IP -Allow -Entries "2001:db8:3333:4444:5555:6666:7777:8882" -NoExpiration
```

For detailed syntax and parameter information, see [New-TenantAllowBlockListItems](/powershell/module/exchange/new-tenantallowblocklistitems).

## Create block entries for IPv6 addresses

You can create block entries for IPv6 addresses directly in the Tenant Allow/Block List as described in this section.

Incoming email messages from IPv6 addresses in block entries are blocked at the edge of the service.

### Use the Microsoft Defender portal to create block entries for IPv6 addresses in the Tenant Allow/Block List

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. On the **Tenant Allow/Block Lists** page, select the **IP addresses** tab.

3. On the **IP addresses** tab, select :::image type="icon" source="media/m365-cc-sc-create-icon.png" border="false"::: **Block**.

4. In the **Block IP addresses** flyout that opens, configure the following settings:

   - **Add IP address**: Enter one IP address per line, up to a maximum of 20.

   - **Remove block entry after**: Select from the following values:
     - **1 day**
     - **7 days**
     - **30 days**
     - **Never expire** (default)
     - **Specific date**: The maximum value is 90 days from today.

   - **Optional note**: Enter descriptive text for why you're blocking the IP addresses.

   When you're finished in the **Block IP addresses** flyout, select **Add**.

Back on the **IP addresses** tab, the entry is listed.

#### Use PowerShell to create block entries for IPv6 addresses in the Tenant Allow/Block List

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), use the following syntax:

```powershell
New-TenantAllowBlockListItems -ListType IP -Block -Entries "IPAddress1","IPAddress2",..."IPAddressN" <-ExpirationDate Date | -NoExpiration> [-Notes <String>]
```

This example adds an block entry for the specified IP address that never expires.

```powershell
New-TenantAllowBlockListItems -ListType IP -Block -Entries "2001:db8:3333:4444:5555:6666:7777:8882" -NoExpiration
```

For detailed syntax and parameter information, see [New-TenantAllowBlockListItems](/powershell/module/exchange/new-tenantallowblocklistitems).

## Use the Microsoft Defender portal to view entries for IPv6 addresses in the Tenant Allow/Block List

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Tenant Allow/Block Lists** in the **Rules** section. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

Select the **IP addresses** tab.

On the **IP addresses** tab, you can sort the entries by clicking on an available column header. The following columns are available:

- **Value**: The IP address.
- **Action**: The available values are  **Allow** or **Block**.
- **Modified by**
- **Last updated**
- **Last used date**: The date the entry was last used in the filtering system to override the verdict.
- **Remove on**: The expiration date.
- **Notes**

To filter the entries, select :::image type="icon" source="media/m365-cc-sc-filter-icon.png" border="false"::: **Filter**. The following filters are available in the **Filter** flyout that opens:

- **Action**: The available values are **Allow** and **Block**.
- **Never expire**: :::image type="icon" source="media/scc-toggle-on.png" border="false"::: or :::image type="icon" source="media/scc-toggle-off.png" border="false":::
- **Last updated**: Select **From** and **To** dates.
- **Last used date**: Select **From** and **To** dates.
- **Remove on**: Select **From** and **To** dates.

When you're finished in the **Filter** flyout, select **Apply**. To clear the filters, select :::image type="icon" source="media/m365-cc-sc-clear-filters-icon.png" border="false"::: **Clear filters**.

Use the :::image type="icon" source="media/m365-cc-sc-search-icon.png" border="false"::: **Search** box and a corresponding value to find specific entries.

To group the entries, select :::image type="icon" source="media/m365-cc-sc-group-icon.png" border="false"::: **Group** and then select **Action**. To ungroup the entries, select **None**.

### Use PowerShell to view entries for IPv6 addresses in the Tenant Allow/Block List

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), use the following syntax:

```powershell
Get-TenantAllowBlockListItems -ListType IP [-Allow] [-Block] [-Entry <IPaddress>] [<-ExpirationDate Date | -NoExpiration>]
```

This example returns all allowed and blocked IP addresses.

```powershell
Get-TenantAllowBlockListItems -ListType IP
```

This example returns information for the specified IP address.

```powershell
Get-TenantAllowBlockListItems -ListType IP -Entry "2001:db8:3333:4444:5555:6666:7777:8882"
```

This example filters the results by blocked IP address.

```powershell
Get-TenantAllowBlockListItems -ListType IP -Block
```

For detailed syntax and parameter information, see [Get-TenantAllowBlockListItems](/powershell/module/exchange/get-tenantallowblocklistitems).

## Use the Microsoft Defender portal to modify entries for IPv6 addresses in the Tenant Allow/Block List

For existing IP addresses entries, you can change the expiration date and note.

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. Select the **IP addresses** tab

3. On the **IP addresses** tab, select the entry from the list by selecting the check box next to the first column, and then select the :::image type="icon" source="media/m365-cc-sc-edit-icon.png" border="false"::: **Edit** action that appears.

4. In the **Edit IP addresses** flyout that opens, the following settings are available:
   - **Block entries**:
     - **Remove block entry after**: Select from the following values:
       - **1 day**
       - **7 days**
       - **30 days**
       - **Never expire**
       - **Specific date**: The maximum value is 90 days from today.
     - **Optional note**
   - **Allow entries**:
     - **Remove allow entry after**: Select from the following values:
       - **1 day**
       - **7 days**
       - **30 days**
       - **Never expire**
       - **Specific date**: The maximum value is 30 days from today.
     - **Optional note**

   When you're finished in the **Edit IP addresses** flyout, select **Save**.

### Use PowerShell to modify existing allow or block entries for IPv6 addresses in the Tenant Allow/Block List

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), use the following syntax:

```powershell
Set-TenantAllowBlockListItems -ListType IP <-Ids <Identity value> | -Entries <Value> [<-ExpirationDate Date | -NoExpiration>] [-Notes <String>]
```

This example changes the expiration date of the specified IP address block entry.

```powershell
Set-TenantAllowBlockListItems -ListType IP -Entries "2001:db8:3333:4444:5555:6666:7777:8882" -ExpirationDate "9/1/2024"
```

For detailed syntax and parameter information, see [Set-TenantAllowBlockListItems](/powershell/module/exchange/set-tenantallowblocklistitems).

## Use the Microsoft Defender portal to remove entries for IPv6 addresses from the Tenant Allow/Block List

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Policies & rules** \> **Threat Policies** \> **Rules** section \> **Tenant Allow/Block Lists**. Or, to go directly to the **Tenant Allow/Block Lists** page, use <https://security.microsoft.com/tenantAllowBlockList>.

2. Select the **IP addresses** tab.

3. On the **IP addresses** tab, do one of the following steps:

   - Select the entry from the list by selecting the check box next to the first column, and then select the :::image type="icon" source="media/m365-cc-sc-delete-icon.png" border="false"::: **Delete** action that appears.
   - Select the entry from the list by clicking anywhere in the row other than the check box. In the details flyout that opens, select :::image type="icon" source="media/m365-cc-sc-delete-icon.png" border="false"::: **Delete** at the top of the flyout.

     > [!TIP]
     > To see details about other entries without leaving the details flyout, use :::image type="icon" source="media/updownarrows.png" border="false"::: **Previous item** and **Next item** at the top of the flyout.

4. In the warning dialog that opens, select **Delete**.

Back on the **IP addresses** tab, the entry is no longer listed.

> [!TIP]
> You can select multiple entries by selecting each check box, or select all entries by selecting the check box next to the **Value** column header.

### Use PowerShell to remove entries for IPv6 addresses from the Tenant Allow/Block List

In [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell), use the following syntax:

```powershell
Remove-TenantAllowBlockListItems -ListType IP <-Ids <Identity value> | -Entries <Value>>
```

This example removes the specified IP address block from the Tenant Allow/Block List.

```powershell
Remove-TenantAllowBlockListItems -ListType IP -Entries "2001:db8:3333:4444:5555:6666:7777:8882"
```

For detailed syntax and parameter information, see [Remove-TenantAllowBlockListItems](/powershell/module/exchange/remove-tenantallowblocklistitems).

## Related articles

- [Use the Submissions page to submit suspected spam, phish, URLs, legitimate email getting blocked, and email attachments to Microsoft](submissions-admin.md)
- [Report false positives and false negatives](submissions-outlook-report-messages.md)
- [Manage allows and blocks in the Tenant Allow/Block List](tenant-allow-block-list-about.md)
- [Allow or block emails in the Tenant Allow/Block List](tenant-allow-block-list-email-spoof-configure.md)
- [Allow or block URLs in the Tenant Allow/Block List](tenant-allow-block-list-urls-configure.md)
- [Allow or block files in the Tenant Allow/Block List](tenant-allow-block-list-files-configure.md)
