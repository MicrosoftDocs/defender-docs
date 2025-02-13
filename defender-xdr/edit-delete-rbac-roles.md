---
title: Edit or delete roles Microsoft Defender XDR Unified role-based access control (RBAC)
description: Edit or delete roles in Microsoft Defender XDR Security portal experiences using role-based access control (RBAC)
ms.service: defender-xdr
ms.author: diannegali
author: siosulli
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
ms.topic: how-to
ms.date: 11/17/2024
ms.reviewer: 
search.appverid: met150
---

# Edit, delete and export roles in Microsoft Defender XDR Unified role-based access control (RBAC)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Identity](https://go.microsoft.com/fwlink/?LinkID=2198108)
- [Microsoft Defender for Office 365 P2](https://go.microsoft.com/fwlink/?LinkID=2158212)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)
- [Microsoft Security Exposure Management](/security-exposure-management/)
- [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps)

In Microsoft Defender XDR Unified role-based access control (RBAC), you can edit and delete custom roles or roles that were imported from Defender for Endpoint, Defender for Identity, or Defender for Office 365.

## Edit roles

The following steps guide you on how to edit roles in Microsoft Defender XDR Unified RBAC:

> [!IMPORTANT]
> You must be a Global Administrator or Security Administrator in Microsoft Entra ID, or have all the Authorization permissions assigned in Microsoft Defender XDR Unified RBAC to perform this task. For more information on permissions, see [Permission pre-requisites](manage-rbac.md#permissions-prerequisites).
> Microsoft recommends that you use roles with the fewest permissions to help improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) as global administrator or security administrator.

2. In the navigation pane, select **Permissions**.

3. Select **Roles** under Microsoft Defender XDR to get to the **Permissions and roles** page.

4. Select the role you want to edit. You can only edit one role at a time.

5. Once selected, a flyout pane opens where you can edit the role:

    :::image type="content" source="/defender/media/defender/m365-defender-rbac-edit-roles.png" alt-text="Screenshot of the edit roles flyout page" lightbox="/defender/media/defender/m365-defender-rbac-edit-roles.png":::

> [!NOTE]
> After editing an imported role, the changes made in Microsoft Defender XDR Unified RBAC will not be reflected back in the individual product RBAC model.

## Delete roles

To delete roles in Microsoft Defender XDR Unified RBAC, select the role or roles you want to delete and select **Delete roles**.

If the workload is active, all assigned user permission are deleted by removing the role.

> [!NOTE]
> After deleting an imported role, the role won't be deleted from the individual product RBAC model. If needed, you can re-import it to the Microsoft Defender XDR Unified RBAC list of roles.

## Export roles

The Export feature enables you to export the following roles data:

- Role name
- Role description
- Permissions included in the role
- The assignment name
- The assigned data sources
- The assigned users or user groups

When a role has multiple assignments, each assignment is represented as a separate row in the CSV file.

The CSV also includes a snapshot of the Defender XDR Unified RBAC activation status for each workload available on the tenant.

The following steps guide you on how to export roles in Microsoft Defender XDR Unified RBAC:

> [!NOTE]
> To export roles, you must be a Global Administrator or Security Administrator in Microsoft Entra ID, or have the **Authorization (manage)** permission assigned for all data sources in Microsoft Defender XDR Unified RBAC and have at least one workload activated for Defender XDR Unified RBAC.
>
>For more information on permissions, see [Permission pre-requisites](manage-rbac.md#permissions-prerequisites).

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) with the required roles or permissions.

2. In the navigation pane, select **Permissions**.

3. Select **Roles** under Microsoft Defender XDR to get to the Permissions and roles page.

4. Select the **Export** button.

    :::image type="content" source="/defender/media/defender/m365-defender-rbac-export-roles.png" alt-text="Screenshot of the export roles page" lightbox="/defender/media/defender/m365-defender-rbac-export-roles.png":::

A CSV file containing all the roles data is generated and downloaded to the local computer.

## Next steps

- [Learn about RBAC permissions](custom-permissions-details.md)
- [Map existing RBAC roles to Microsoft Defender XDR Unified RBAC roles](compare-rbac-roles.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
