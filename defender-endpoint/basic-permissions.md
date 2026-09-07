---
title: Assign Microsoft Defender for Endpoint basic permissions
description: Learn how existing Microsoft Defender for Endpoint customers can assign full or read-only portal access by using Microsoft Graph PowerShell.
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.custom:
  - msecd-doc-authoring-1015
  - has-azure-ad-ps-ref
  - azure-ad-ref-level-one-done
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.date: 08/13/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to assign basic Defender for Endpoint portal permissions so that users have the access required for their responsibilities.
---

# Assign basic permissions for Microsoft Defender for Endpoint portal access

Basic permissions management gives existing Microsoft Defender for Endpoint customers two portal access levels: full access or read-only access. Use Microsoft Graph PowerShell to assign the Security Administrator role for full access or the Security Reader role for read-only access. For more granular permissions, [use role-based access control](rbac.md).

> [!IMPORTANT]
> Starting February 16, 2025, new Defender for Endpoint customers can use only Microsoft Defender unified role-based access control (RBAC). Existing customers can continue to use their current permission model. For more information, see [Microsoft Defender unified RBAC](/defender-xdr/manage-rbac).

<a name='before-you-begin'></a>

## Prerequisites

Complete these prerequisites before you assign user access:

- Confirm that your organization still uses basic permissions management. If your organization switched to RBAC, you can't switch back to basic permissions.
- Install [Microsoft Graph PowerShell](/powershell/microsoftgraph/installation).
- Use an account assigned the Privileged Role Administrator role or a custom role with the required role-management permissions. Privileged Role Administrator is the least-privileged Microsoft Entra built-in role supported for this operation.
- Connect to Microsoft Graph by using **Connect-MgGraph** with the delegated `RoleManagement.ReadWrite.Directory` and `User.ReadBasic.All` permissions. For authentication options, see [Microsoft Graph PowerShell authentication commands](/powershell/microsoftgraph/authentication-commands).

You don't need to run PowerShell as a local Windows administrator to assign Microsoft Entra roles through Microsoft Graph.

## Understand the basic access levels

Basic permissions management provides these access levels:

- **Full access**: Users can sign in, view system information, resolve alerts, submit files for deep analysis, and download the onboarding package. Assign the Microsoft Entra Security Administrator role to grant full access.
- **Read-only access**: Users can sign in and view alerts and related information. They can't change alert states, submit files for deep analysis, or perform other state-changing operations. Assign the Microsoft Entra Security Reader role to grant read-only access.

## Assign user access using Microsoft Graph PowerShell

Assign the appropriate Microsoft Entra role to each user who needs access to Defender for Endpoint.

> [!NOTE]
> The following examples use the `directoryRole` membership API. Microsoft recommends the unified role-assignment API for new automation. **Get-MgDirectoryRole** returns only activated directory roles. If the command doesn't return the requested role, [assign the Microsoft Entra role in the admin center](/entra/identity/role-based-access-control/manage-roles-portal) or use the [unified role-assignment API](/graph/api/rbacapplication-post-roleassignments).

### Assign full access

Replace `secadmin@contoso.onmicrosoft.com` with the user principal name of the account that needs full access, and then run the following command:

```powershell
New-MgDirectoryRoleMemberByRef -DirectoryRoleId (Get-MgDirectoryRole -Filter "DisplayName eq 'Security Administrator'").Id -OdataId "https://graph.microsoft.com/v1.0/directoryObjects/$((Get-MgUser -UserId 'secadmin@contoso.onmicrosoft.com').Id)"
```

### Assign read-only access

Replace `reader@contoso.onmicrosoft.com` with the user principal name of the account that needs read-only access, and then run the following command:

```powershell
New-MgDirectoryRoleMemberByRef -DirectoryRoleId (Get-MgDirectoryRole -Filter "DisplayName eq 'Security Reader'").Id -OdataId "https://graph.microsoft.com/v1.0/directoryObjects/$((Get-MgUser -UserId 'reader@contoso.onmicrosoft.com').Id)"
```

<a name='related-articles'></a>

## Related content

- [Assign Microsoft Entra roles to users](/entra/identity/role-based-access-control/manage-roles-portal)
- [Manage Defender for Endpoint portal access permissions](assign-portal-access.md)
- [Manage portal access by using RBAC](rbac.md)
