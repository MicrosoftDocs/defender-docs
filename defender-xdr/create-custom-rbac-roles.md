---
title: Create custom roles with Microsoft Defender XDR Unified role-based access control (RBAC)
description: Create custom roles in Microsoft Defender XDR Security portal role-based access control (RBAC)
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

# Create custom roles with Microsoft Defender XDR Unified RBAC

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

## Create a custom role

The following steps guide you on how to create custom roles in Microsoft Defender XDR Unified RBAC.

> [!IMPORTANT]
> You must be a Global Administrator or Security Administrator in Microsoft Entra ID, or have all the **Authorization** permissions assigned in Microsoft Defender XDR Unified RBAC to perform this task. For more information on permissions, see [Permission pre-requisites](manage-rbac.md#permissions-prerequisites).
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

2. In the navigation pane, go to **System > Permissions**.

3. Select **Roles** under Microsoft Defender XDR to get to the Permissions and roles page.

4. Select **Create custom role**.

5. Enter the Role name and description.

6. Select **Next** to choose the permissions you want to assign. Permissions are organized in three different categories:

   :::image type="content" source="/defender/media/defender/m365-defender-rbac-permissions1.png" alt-text="Screenshot of the permissions screen" lightbox="/defender/media/defender/m365-defender-rbac-permissions1.png":::

7. Select a permission category (for example, Security operations), and then review the permissions available. You can choose to assign the following different levels of permissions:

    - Select all read-only permissions – Users are assigned with all the read-only permissions in this category.
    - Select all read and manage permissions – Users are assigned all permissions in this category (read and manage permissions).
    - Select custom permissions – Users are assigned the custom permissions selected.

   :::image type="content" source="/defender/media/defender/m365-defender-rbac-assignments-fig.png" alt-text="Screenshot of the permissions flyout screen" lightbox="/defender/media/defender/m365-defender-rbac-assignments-fig.png":::

    For more information on the RBAC custom permissions, see [About RBAC custom permissions](custom-permissions-details.md).

    > [!NOTE]
    > If all read-only or all read and manage permissions are assigned, any new permissions added to this category in the future are automatically assigned under this role.
    >
    > If you have assigned custom permissions and new permissions are added to this category, you will need to re-assign your roles with the new permissions if needed.

8. Once you have selected your permissions, select **Apply** and then **Next** to assign users and data sources.

9. Select **Add assignments** and add the Assignment name.

10. Under **data sources**, choose if the assigned users will have the selected permissions across all the available products, or only for specific data sources:

     :::image type="content" source="/defender/media/defender/defender-rbac-add-assignments-small.png" alt-text="Screenshot of the assignments screen" lightbox="/defender/media/defender/defender-rbac-add-assignments.png":::

    If a user selects all read-only permissions for a single data source, for example, Microsoft Defender for Endpoint, they will not be able to read alerts for Microsoft Defender for Office 365 or Microsoft Defender for Identity.

    > [!NOTE]
    > By selecting **Include future data sources automatically** all supported data sources within Microsoft Defender XDR Unified RBAC and any future data sources that are added are automatically assigned to this assignment.

11. In **Assigned users and groups** choose the Microsoft Entra security groups or individual users to assign the role to, and select **Add**.

    > [!NOTE]
    > In Microsoft Defender XDR Unified RBAC, you can create as many assignments as needed under the same role with same permissions. For example, you can have an assignment within a role that has access to all data sources and then a separate assignment for a team that only needs access to Endpoint alerts from the Defender for Endpoint data source. This enables maintaining the minimum number of roles.

12. Select **Next** to review and finish creating the role and then select **Submit**.

## Create a role to access and manage roles and permissions

To access and manage roles and permissions, without being a Global Administrator or Security Administrator in Microsoft Entra ID, you need to create a role with **Authorization** permissions. To create this role:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) as Global Administrator or Security Administrator.

2. In the navigation pane, select **Permissions**.

3. Select **Roles** under Microsoft Defender XDR.

4. Select **Create custom role**.

5. Enter the Role name and description.

6. Select **Next** and choose the **Authorization and settings** option.

7. On the Authorization and settings category flyout, choose **Select custom permissions** and under **Authorization** select either:

    - Select all permissions - users are able to create and manage roles and permissions.
    - Read-only - uses can access and view roles and permissions in a read-only mode.

    :::image type="content" source="/defender/media/defender/m365-defender-rbac-authorization-role.png" alt-text="Screenshot of the permissions and roles page" lightbox="/defender/media/defender/m365-defender-rbac-authorization-role.png":::

8. Select **Apply** and then **Next** to assign users and data sources.

9. Select **Add assignments** and enter the Assignment name.

10. To choose the **data sources** users assigned the Authorization permission will have access to:

    - Select **Choose all data sources** to grant users permissions to create new roles and manage roles for all data sources.
    - Select **Select specific data sources** to grant users permissions to create new roles and manage roles for a specific data source. For example, select Microsoft Defender for Endpoint from the dropdown to grant users the Authorization permission for the Microsoft Defender for Endpoint data source only.

11. In **Assigned users and groups** – choose the Microsoft Entra security groups or individual users to assign the role to, and select **Add**.

12. Select **Next** to review and finish creating the role and then select **Submit**.

> [!NOTE]
> For the Microsoft Defender XDR security portal to start enforcing the permissions and assignments configured in your new or imported roles, you'll need to activate the new Microsoft Defender XDR Unified RBAC model. For more information, see [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md).

## Next steps

- [Import existing RBAC roles](import-rbac-roles.md)
- [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
