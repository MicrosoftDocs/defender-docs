---
title: Edit or delete roles in Microsoft Defender unified role-based access control (RBAC)
description: Edit or delete roles in Microsoft Defender Security portal experiences using role-based access control (RBAC)
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
- Microsoft Security Exposure Management
- Microsoft Defender for Cloud Apps
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to edit or delete roles in Microsoft Defender unified RBAC so that I can manage permissions and access to Microsoft Defender portal experiences.
---

# Edit, delete, and export roles in Microsoft Defender unified role-based access control (RBAC)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article walks you through how to edit, delete, and export roles in Microsoft Defender unified role-based access control (RBAC). These tasks apply to custom roles you created in unified RBAC and roles imported from Defender for Endpoint, Defender for Identity, or Defender for Office 365. Each section lists the required permissions before the steps.

## Edit roles

To edit roles in Microsoft Defender unified RBAC, follow these steps:

> [!IMPORTANT]
> You must be a Security Administrator or higher in Microsoft Entra ID. You can also perform this task if you have all Authorization permissions in Microsoft Defender Unified RBAC. For more information, see [Permission prerequisites](manage-rbac.md#permissions-prerequisites).

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) as security administrator or higher.

2. In the navigation pane, select **Permissions**.

3. Select **Roles** under Microsoft Defender XDR to get to the **Permissions and roles** page.

4. Select the role you want to edit. You can only edit one role at a time.

5. Once selected, a flyout pane opens where you can edit the role:

    :::image type="content" source="media/edit-delete-rbac-roles/m365-defender-rbac-edit-roles.png" alt-text="Screenshot of the edit roles flyout page" lightbox="media/edit-delete-rbac-roles/m365-defender-rbac-edit-roles.png":::

> [!NOTE]
> After editing an imported role, the changes made in Microsoft Defender unified RBAC will not be reflected back in the individual product RBAC model.

## Delete roles

To delete roles in Microsoft Defender unified RBAC:

1. Select the role or roles you want to delete.

2. Select **Delete roles**.

> [!WARNING]
> If a Microsoft Defender workload that uses the role is active, deleting the role also removes all assigned user permissions.

> [!NOTE]
> When an an imported role is deleted, the role isn't deleted from the individual product RBAC model. If needed, you can reimport it to the Microsoft Defender unified RBAC list of roles.

## Export roles

> [!IMPORTANT]
> Starting in 2025, Microsoft Defender unified RBAC is the default model for new Defender for Endpoint and Defender for Identity tenants. These tenants can't export roles from the old model. Tenants that had roles assigned or exported before 2025 keep their old roles setup.

The Export feature lets you export the following role data:

- Role name
- Role description
- Permissions in the role
- Assignment name
- Assigned data sources
- Assigned users or user groups

When a role has multiple assignments, each assignment appears as a separate row in the CSV file.

The CSV also includes the Defender unified RBAC activation status for each workload on the tenant.

To export roles in Microsoft Defender unified RBAC, follow these steps:

> [!NOTE]
> To export roles, you must be a Security Administrator or higher in Microsoft Entra ID. Or, you must have the **Authorization (manage)** permission for all data sources in Microsoft Defender Unified RBAC and at least one workload activated.
>
>For more information, see [Permission prerequisites](manage-rbac.md#permissions-prerequisites).

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) with the required roles or permissions.

2. In the navigation pane, select **Permissions**.

3. Select **Roles** under Microsoft Defender XDR to get to the Permissions and roles page.

4. Select the **Export** button.

    :::image type="content" source="media/edit-delete-rbac-roles/m365-defender-rbac-export-roles.png" alt-text="Screenshot of the export roles page" lightbox="media/edit-delete-rbac-roles/m365-defender-rbac-export-roles.png":::

A CSV file containing all the roles data is generated and downloaded to the local computer.

<a name="next-steps"></a>
## Related content

- [Learn about RBAC permissions](custom-permissions-details.md)
- [Map existing RBAC roles to Microsoft Defender unified RBAC roles](compare-rbac-roles.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
