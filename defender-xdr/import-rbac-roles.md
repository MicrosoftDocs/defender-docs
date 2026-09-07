---
title: Import roles to Microsoft Defender unified role-based access control (RBAC)
description: Import existing roles from individual Microsoft Defender RBAC models into unified RBAC in the Microsoft Defender portal.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom: msecd-doc-authoring-1016
ms.topic: how-to
ms.date: 07/02/2026
ms.reviewer: 
appliesto:
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender XDR
- Microsoft Defender for Identity
- Microsoft Defender for Office 365 P2
- Microsoft Defender Vulnerability Management
- Microsoft Defender for Cloud
- Microsoft Defender for Cloud Apps
ai-usage: ai-assisted
---

# Import roles to Microsoft Defender unified role-based access control (RBAC)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

<a name='import-roles-to-microsoft-365-defender-unified-rbac-from-individual-rbac-models'></a>

## Import roles to Microsoft Defender unified RBAC from individual RBAC models

You can import existing roles that are maintained as part of individual supported products in Microsoft Defender (for example, Microsoft Defender for Endpoint) to the Microsoft Defender unified RBAC model.

Importing roles migrates and maintains the roles with full parity in relation to their permissions and user assignments in the Microsoft Defender unified RBAC model.

> [!NOTE]
> Once roles are migrated, you can modify the imported roles and change the level of permissions as needed.

The following steps guide you on how to import roles into Microsoft Defender unified RBAC:

> [!IMPORTANT]
> You must be a Security Administrator or higher in Microsoft Entra ID, or have all the **Authorization** permissions assigned in Microsoft Defender Unified RBAC to perform this task. For more information on permissions, see [Permissions prerequisites for Defender unified RBAC](manage-rbac.md#permissions-prerequisites).

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

2. In the navigation pane, select **Permissions**.

3. Select **Roles** under Microsoft Defender XDR to get to the Permissions and roles page.

4. Select **Import role**.

5. Select the products you want to import roles from.

    :::image type="content" source="media/import-rbac-roles/m365-defender-import-workloads.png" alt-text="Screenshot of the import workloads page" lightbox="media/import-rbac-roles/m365-defender-import-workloads.png":::

6. Select **Next** to choose the roles to import. You can choose all roles or select specific roles from the list. Select the role name to review the permissions and assigned users or groups for that specific role.

7. Select the roles you want to import and select **Next**.

   > [!NOTE]
   > If the role you want to import appears in the **Roles not eligible for import** list, it contains assignments for users or user groups that no longer exist in Entra ID.
   >
   > To import this role to Microsoft Defender unified RBAC, remove the user or user group from the role in the original RBAC model. Select the role to view the list of users that still exist for that role to determine which user or group to remove.

8. Select **Submit**.

9. Select **Done** on the confirmation page.

After importing your roles, you are be able to [View and edit Defender unified RBAC roles](edit-delete-rbac-roles.md) and activate the workloads.

You need to activate the new Defender unified RBAC model to start enforcing the permissions and assignments configured in your new or imported roles within the Microsoft Defender portal. For more information, see [Activate Microsoft Defender unified RBAC](activate-defender-rbac.md).

Imported roles appear in the **Permissions and roles** list together with any custom roles you created. All imported roles are marked as **Imported** in the description. Once you edit an imported role, it will no longer be marked as **Imported**.

> [!NOTE]
> You can import roles as frequently as required. After you edit an imported role, the changes don't affect the source role in the original RBAC model. Because changes to an imported role don't affect the source role, you can delete the imported role and re-import it from the original RBAC model, if necessary. If you import the same role twice, you create a duplicate role.

<a name="next-steps"></a>
## Related content

- [Activate Microsoft Defender unified RBAC](activate-defender-rbac.md)
- [Edit or delete Defender unified RBAC roles](edit-delete-rbac-roles.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]

