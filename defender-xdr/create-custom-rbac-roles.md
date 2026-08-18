---
title: Create custom roles with Microsoft Defender unified role-based access control (RBAC)
description: Create custom roles in Microsoft Defender unified RBAC and assign specific permissions to users or groups for granular access to Microsoft Defender portal experiences.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom: msecd-doc-authoring-1014
ms.topic: how-to
ms.date: 08/25/2026
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
- Microsoft Sentinel data lake
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to create custom roles in Microsoft Defender unified RBAC so that I can manage permissions and access to Microsoft Defender portal experiences.
---

# Create custom roles with Microsoft Defender unified RBAC

This article describes how to create custom roles in Microsoft Defender unified role-based access control (RBAC). Microsoft Defender unified RBAC enables you to create custom roles with specific permissions and assign them to users or groups, allowing for granular control over access to Microsoft Defender portal experiences.

Creating custom roles for [Microsoft Sentinel data lake](https://aka.ms/data-lake-overview) is supported in Preview. Before you begin, make sure you meet the [prerequisites](#prerequisites) listed in this article.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

## Prerequisites

To create custom roles in Microsoft Defender unified RBAC, you must be assigned one of the following roles or permissions:

- At least Security Administrator in Microsoft Entra ID.
- All **Authorization** permissions assigned in Microsoft Defender Unified RBAC.

For more information on permissions, see [Permission prerequisites](manage-rbac.md#permissions-prerequisites).

To create custom roles for the Microsoft Sentinel data lake using the **Security Operations** or **Data operations** permission group, you must have a Log Analytics workspace enabled for Microsoft Sentinel and onboarded to the Defender portal. 

- [Onboard Microsoft Sentinel](/azure/sentinel/quickstart-onboard?tabs=defender-portal)
- [Connect Microsoft Sentinel to the Microsoft Defender portal](/unified-secops-platform/microsoft-sentinel-onboard?toc=%2Fazure%2Fsentinel%2FTOC.json&bc=%2Fazure%2Fsentinel%2Fbreadcrumb%2Ftoc.json)

## Create a custom role

The following steps describe how to create custom roles in the Microsoft Defender portal.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com). In the navigation pane on the side, scroll down and select **Permissions**.

1. On the **Permissions** page, under **Microsoft Defender XDR**, select **Roles** > **Create custom role**.

1. In the wizard that opens, on the **Basics** tab, enter the role name and an optional description, and then select **Next**.

1. On the **Choose permissions** page, select each of the following as needed to configure permissions for that area:

    - **Security operations**: Permissions for roles that manage day-to-day operations and respond to incidents and advisories. 
    - **Security posture**: Permissions for roles that manage the organization's security posture and perform Defender Vulnerability Management.
    - **Authorization and settings**: Permissions for roles that modify the portal configurations such as authorization, security settings, and system settings.
    - **Data operations** (Preview): Permissions for managing the organization's security data and controlling advanced analytics permissions. Supported for the **Microsoft Sentinel data lake** data collection.

    Hover over the description column for each permission group for a detailed description of the permissions available in that group.

    An extra **Authorization and settings** side pane slides open for each permission group you select, where you can choose the specific permissions to assign to the role.

    If you select **All read-only permissions**, or **All read and manage permissions**, any new permissions later added to these categories are also automatically assigned under this role.

    For more information, see [Permissions in Microsoft Defender unified role-based access control (RBAC)](custom-permissions-details.md).

1. When you're done assigning permissions for each selected permission group, select **Apply** and then **Next** to continue configuring the remaining permission groups you selected.
    
    > [!NOTE]
    > If all read-only permissions or all read and manage permissions are assigned, any new permissions added to those permission categories in the future are automatically assigned under this role.
    >
    > If you assigned custom permissions and new permissions are added to the same category, you'll need to reassign your roles with the new permissions if needed.

1. After you select your permissions for any relevant permission group, select **Apply** and then **Next** to assign users and data sources.

1. On the **Assign users and data sources** page, select **Add assignment**.

    1. On the **Add assignment** side pane, enter the following details:

        - **Assignment name**: Enter a descriptive name for the assignment.
        - **Employees**: Select Microsoft Entra security groups or individual users to assign users to the role.
        - **Remote tenant group**: Select one or more GDAP remote tenant groups to assign to this role. Users who are members of the selected remote tenant groups inherit the permissions, data source access, and applicable scopes configured in this assignment. This option enables organizations to extend Microsoft Defender unified RBAC permissions to external tenants through an established GDAP relationship.

        - **Data sources**: Select the **Data sources** drop down and then select the services where the assigned users will have the selected permissions. If you assigned read-only permissions for a single data source, such as Microsoft Defender for Endpoint, the assigned users can't read alerts in the other services, such as Microsoft Defender for Office 365 or Microsoft Defender for Identity.
        - **Data collections**: Users assigned in this assignment can be granted permissions either across all available Sentinel workspaces or only to selected workspaces. For example, if a role with 'Security operations - read only permission' is created, one team may be assigned this role for US-Workspace and UK-Workspace, allowing them to access all alerts from these sources. Another assignment can be created for the same role, providing another team in the organization access to only UK-Workspace alerts from Sentinel UK-Workspace.

    1. Select **Include future data sources automatically** to include all other data sources supported by Microsoft Defender unified RBAC. If this option is selected, any future data sources that are added for unified RBAC support are also automatically added to the assignment.

    1. In the **Data collections** area on the **Add assignments** side pane, the Microsoft Sentinel default data lake is listed by default. Select **Edit** to either remove access to the data lake, or define a custom data lake selection.

    > [!NOTE]
    > In Microsoft Defender unified RBAC, you can create as many assignments as needed under the same role with same permissions. For example, you can have an assignment within a role that has access to all data sources and then a separate assignment for a team that only needs access to Endpoint alerts from the Defender for Endpoint data source. This enables maintaining the minimum number of roles.

1. Back on the **Assign users and data sources** page, select **Next** to review the role and assignment details. Select **Submit** to create the role.

## Create a role to access and manage roles and permissions

**Authorization** permissions are the unified RBAC permissions that allow users to view, create, and manage roles and permissions in the Microsoft Defender portal. If you're not at least a Security Administrator in Microsoft Entra ID, you need a role with **Authorization** permissions to access and manage roles and permissions. To create this role:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) as Security Administrator or higher.

1. In the navigation pane, select **Permissions > Microsoft Defender XDR > Roles > Create custom role**.

1. Enter your role name and description, and then select **Next**.

1. Select **Authorization and settings**, and then on the **Authorization and settings** side pane, select **Select custom permissions**.

1. Under **Authorization**, select one of the following options:

    - **Select all permissions**. Users are able to create and manage roles and permissions.
    - **Read-only**. Users can access and view roles and permissions in a read-only mode.

    For example:

    :::image type="content" source="media/create-custom-rbac-roles/m365-defender-rbac-authorization-role.png" alt-text="Screenshot of the permissions and roles page" lightbox="media/create-custom-rbac-roles/m365-defender-rbac-authorization-role.png":::

1. Select **Apply** and then **Next** to assign users and data sources.

1. Select **Add assignments** and enter the **Assignment name**.

1. To configure the access scope for users assigned with the *Authorization* permission, select one of the following access settings:

    - **Choose all data sources**: Grants users permissions to create and manage roles for all data sources.
    - **Select specific data sources**: Grants users permissions to create and manage roles for a specific data source. For example, select **Microsoft Defender for Endpoint** from the dropdown to grant users the *Authorization* permission for the Microsoft Defender for Endpoint data source only.
    - **Microsoft Sentinel data lake collection**: Grants users the *Authorization* permission for the Microsoft Sentinel data lake data collection.

1. In **Assigned users and groups** – choose the Microsoft Entra security groups or individual users to assign the role to, and select **Add**.

1. Select **Next** to review and finish creating the role and then select **Submit**.

> [!NOTE]
> For the Microsoft Defender portal to start enforcing the permissions and assignments configured in your new or imported roles, you need to activate the new Microsoft Defender unified RBAC model. For more information, see [Activate Microsoft Defender unified RBAC](activate-defender-rbac.md).


## Configure scoped roles for Microsoft Defender for Identity

You can configure scoped access using Microsoft Defender Unified RBAC (URBAC) model for identities managed by Microsoft Defender for Identity (MDI). This allows you to restrict access and visibility to specific Active Directory domains or Organizational units, helping align with team responsibilities and reduce unnecessary data exposure.

For more information, see: [Configure scoped access for Microsoft Defender for Identity](/defender-for-identity/configure-scoped-access).

## Configure scoped roles for Microsoft Defender for Cloud

You can configure scoped access using the Microsoft Defender Unified RBAC model for resources managed by Microsoft Defender for Cloud. This enables you to limit access and visibility to specific **subscriptions**, **resource groups**, or **individual resources**. By applying scoped roles, you help ensure that team members only see and manage the assets relevant to their responsibilities, reducing unnecessary exposure and improving operational security.

For more information, see: [Manage cloud scopes and unified role-based access control](/azure/defender-for-cloud/cloud-scopes-unified-rbac?pivots=defender-portal).

## Scoping considerations for Microsoft Defender for Endpoint device groups

Microsoft Defender for Endpoint device groups continue to govern per-device visibility and actions alongside unified RBAC. When you create or import URBAC roles, device group assignments determine which devices assigned users can see and act on. Configure device groups in the Microsoft Defender portal separately from URBAC role assignments to ensure proper scoping.

For more information, see [Create and manage device groups in Microsoft Defender for Endpoint](/defender-endpoint/machine-groups).

> [!NOTE]
> In multi-workspace Microsoft Sentinel environments, URBAC data source selections control access to Sentinel workspace data in the Defender portal. These selections don't change security information and event management (SIEM) access or permissions configured through Azure RBAC for individual workspaces. Azure RBAC continues to govern direct workspace access outside the Defender portal.

## Next steps

After you create custom roles, continue with the following related tasks:

- [Import existing RBAC roles](import-rbac-roles.md)
- [Activate Microsoft Defender unified RBAC](activate-defender-rbac.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
