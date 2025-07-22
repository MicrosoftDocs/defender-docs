---
title: Create custom roles with Microsoft Defender XDR Unified role-based access control (RBAC)
description: Create custom roles in Microsoft Defender XDR Security portal role-based access control (RBAC)
ms.service: defender-xdr
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
ms.topic: how-to
ms.date: 07/06/2025
ms.reviewer: 
search.appverid: met150
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
#customer intent: As a security administrator, I want to create custom roles in Microsoft Defender XDR Unified RBAC so that I can manage permissions and access to Microsoft Defender portal experiences.
---

# Create custom roles with Microsoft Defender XDR Unified RBAC

This article describes how to create custom roles in Microsoft Defender XDR Unified role-based access control (RBAC). Microsoft Defender XDR Unified RBAC enables you to create custom roles with specific permissions and assign them to users or groups, allowing for granular control over access to Microsoft Defender portal experiences.

Creating custom roles for [Microsoft Sentinel data lake](https://aka.ms/data-lake-overview) is supported in Preview.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

## Prerequisites

To create custom roles in Microsoft Defender XDR Unified RBAC, you must be assigned one of the following roles or permissions:

- Global Administrator or Security Administrator in Microsoft Entra ID.
- All **Authorization** permissions assigned in Microsoft Defender XDR Unified RBAC.

For more information on permissions, see [Permission prerequisites](manage-rbac.md#permissions-prerequisites).

> [!TIP]
> Microsoft recommends that you use roles with the fewest permissions. This practice helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

To create custom roles for the Microsoft Sentinel data lake using the **Security Operations** or **Data operations** permission group, you must have a Log Analytics workspace enabled for Microsoft Sentinel and onboarded to the Defender portal. 

- [Onboard Microsoft Sentinel](/azure/sentinel/quickstart-onboard?tabs=defender-portal)
- [Connect Microsoft Sentinel to the Microsoft Defender portal](/unified-secops-platform/microsoft-sentinel-onboard?toc=%2Fazure%2Fsentinel%2FTOC.json&bc=%2Fazure%2Fsentinel%2Fbreadcrumb%2Ftoc.json)

## Create a custom role

The following steps describe how to create custom roles in the Microsoft Defender portal.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com). In the navigation pane on the side, scroll down and select **Permissions**.

1. On the **Permissions** page, under **Microsoft Defender XDR**, select **Roles** > **Create custom role**.

1. In the wizard that opens, on the **Basics** tab, enter the role name and an optional description, and then select **Next**.

1. On the **Choose permissions** page, select each of the following as needed to configure permissions for that area:

    - **Security operations**
    - **Security posture**
    - **Authorization and settings**
    - **Data Operations** (Preview). Supported for the **Microsoft Sentinel data lake** data collection.

    Hover over the description column for each permission group for a detailed description of the permissions available in that group. 

    An extra **Authorization and settings** side pane slides open for each permission group you select, where you can choose the specific permissions to assign to the role.

    If you select **All read-only permissions**, or **All read and manage permissions**, any new permissions later added to these categories are also automatically assigned under this role.

    For more information, see [Permissions in Microsoft Defender XDR Unified role-based access control (RBAC)](custom-permissions-details.md).

1. When you're done assigning permissions for each permission group, select **Apply** and then **Next** to continue on to the next permission group.
    
    > [!NOTE]
    > If all read-only or all read and manage permissions are assigned, any new permissions added to this category in the future are automatically assigned under this role.
    >
    > If you assigned custom permissions and new permissions are added to this category, you'll need to reassign your roles with the new permissions if needed.

1. Once you selected your permissions for any relevant permission group, select **Apply** and then **Next** to assign users and data sources.

1. On the **Assign users and data sources** page, select **Add assignment**.

    1. On the **Add assignment** side pane, enter the following details:

        - **Assignment name**: Enter a descriptive name for the assignment.
        - **Employees**: Select Microsoft Entra security groups or individual users to assign users to the role.
        - **Data sources**: Select the **Data sources** drop down and then select the services where the assigned users will have the selected permissions. If you assigned read-only permissions for a single data source, such as Microsoft Defender for Endpoint, the assigned users can't read alerts in the other services, such as Microsoft Defender for Office 365 or Microsoft Defender for Identity.

    1. Select **Include future data sources automatically** to include all other data sources supported by Microsoft Defender unified RBAC. If this option is selected, any future data sources that are added for unified RBAC support are also automatically added to the assignment.

    1. In the **Data collections** area on the **Add assignments** side pane, the Microsoft Sentinel default data lake is listed by default. Select **Edit** to either remove access to the data lake, or define a custom data lake selection.

    > [!NOTE]
    > In Microsoft Defender XDR Unified RBAC, you can create as many assignments as needed under the same role with same permissions. For example, you can have an assignment within a role that has access to all data sources and then a separate assignment for a team that only needs access to Endpoint alerts from the Defender for Endpoint data source. This enables maintaining the minimum number of roles.

1. Back on the **Assign users and data sources** page, select **Next** to review the role and assignment details. Select **Submit** to create the role.

## Create a role to access and manage roles and permissions

To access and manage roles and permissions, without being a Global Administrator or Security Administrator in Microsoft Entra ID, create a role with **Authorization** permissions. To create this role:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) as Global Administrator or Security Administrator.

1. In the navigation pane, select **Permissions > Microsoft Defender XDR > Roles > Create custom role**.

1. Enter your role name and description, and then select **Next**.

1. Select **Authorization and settings**, and then on the **Authorization and settings** side pane, select **Select custom permissions**.

1. Under **Authorization**, select one of the following options:

    - **Select all permissions**. Users are able to create and manage roles and permissions.
    - **Read-only**. Users can access and view roles and permissions in a read-only mode.

    For example:

    :::image type="content" source="/defender/media/defender/m365-defender-rbac-authorization-role.png" alt-text="Screenshot of the permissions and roles page" lightbox="/defender/media/defender/m365-defender-rbac-authorization-role.png":::

1. Select **Apply** and then **Next** to assign users and data sources.

1. Select **Add assignments** and enter the **Assignment name**.

1. To choose the data sources that users assigned with the *Authorization* permission have access to, select one of the following options:

    - **Choose all data sources**: This grants users permissions to create new roles and manage roles for all data sources.
    - **Select specific data sources**: This grants users permissions to create new roles and manage roles for a specific data source. For example, select **Microsoft Defender for Endpoint** from the dropdown to grant users the *Authorization* permission for the Microsoft Defender for Endpoint data source only.
    - **Microsoft Sentinel data lake collection**: Select this option to grant users the *Authorization* permission for the Microsoft Sentinel data lake.

1. In **Assigned users and groups** – choose the Microsoft Entra security groups or individual users to assign the role to, and select **Add**.

1. Select **Next** to review and finish creating the role and then select **Submit**.

> [!NOTE]
> For the Microsoft Defender XDR security portal to start enforcing the permissions and assignments configured in your new or imported roles, you need to activate the new Microsoft Defender XDR Unified RBAC model. For more information, see [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md).


## Configure scoped roles for Microsoft Defender for Identity

Scoped access for Microsoft Defender for Identity (MDI) is currently in **Public preview**. You can configure scoped access using Microsoft Defender XDR’s Unified RBAC (URBAC) model. This allows you to restrict access and visibility to specific Active Directory domains, helping align with team responsibilities and reduce unnecessary data exposure.

For more information, see: [Configure scoped access for Microsoft Defender for Identity](/defender-for-identity/configure-scoped-access).

## Next steps

- [Import existing RBAC roles](import-rbac-roles.md)
- [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
