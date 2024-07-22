---
title: Permissions needed for Microsoft Defender for IoT in the Defender portal
description: This article describes the permissions required for Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 07/2/2024
ms.topic: how-to
---

# Set up full roles and permissions

The Microsoft Defender portal allows granular access to features and data based on user roles and the permissions given to each user.

Defender for IoT is part of the Defender portal and user access permissions for alerts, incidents, device inventory, device groups and vulnerabilities should already be configured.

To access the Defender for IoT features, such as site security, alerts, and vulnerability updates, you need to assign permissions and roles to the correct users.

### Access management options

There are two ways to manage user access to the Microsoft Defender portal:

- [Global Microsoft Entra roles](/entra/identity/role-based-access-control/permissions-reference).
- [Custom role access](/defender-xdr/custom-roles): Use role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.

The permission settings listed in this section apply to the unified RBAC version.

Depending on your tenant, you might have access to RBAC version 1 or 2 instead of the unified version. For more information, see [permissions for RBAC version 1](/defender-endpoint/prepare-deployment), or [permissions for RBAC version 2](/defender-endpoint/user-roles#permission-options).

If you're using the Defender portal for the first time, you need to set up all of your roles and permissions. For more information, see [manage portal access using role-based access control](/defender-xdr/manage-rbac).

### Unified RBAC roles for features in Defender for IoT

Assign users the unified RBAC permissions and roles based on the table:

1. In the Defender portal, either: 
    1. select **Settings > Microsoft XDR > Permissions and roles**.
        1. Enable **Endpoints & Vulnerability Management**.
        1. Select **Go to Permissions and roles**.
    Or
    1. select **Permissions > Microsft Defender XDR (1) > Roles**

1. Select **Create custom role**.
1. Type a **Role name**, and then select **Next** for Permissions.

    :::image type="content" source="media/permissions/permissions-choose.png" alt-text="Screenshot of the permissions set up page with the categories of permissions for site security" lightbox="media/permissions/permissions-choose.png" :::

1. Select **Security operations**, select the permissions as needed, select **Apply**.
1. Select **Security posture**, select the permissions as needed, select **Apply**.
1. Select **Authorization and settings**, select the permissions as needed, select **Apply**.

    :::image type="content" source="media/permissions/permissions-choose-options.png" alt-text="Screenshot of the permissions set up page with the specific permissions chosen for site security" lightbox="media/permissions/permissions-choose-options.png" :::

1. Select **Next** for Assignments.
1. Select **Add assignment**, type a name, choose users and groups and select the Data sources. Select **Add**.
1. Select **Next** to Review and finish.
1. Select **Submit**.

This table shows the full roles and permissions needed for all MDE features used with Defender for IoT:

| Feature | Write permissions | Read permissions |
|---|----|---|
|Alerts and incidents| **MDE Roles**: Alerts (manage) <br> **Entra ID roles**: Global Administrator, Security Administrator, Security Operator| Write roles<br> **MDE Roles**: Security data basics<br>**Entra ID roles**: Global Reader, Security Reader |
|Vulnerabilities | **MDE Roles**: Response (manage)/ Security operations / Security data <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles<br> **MDE Roles**: Vulnerability management (read) <br> **Entra ID roles**: Global Reader, Security Reader |
|Inventory| **MDE Roles**: Onboard offboard device: Detection tuning (manage) <br> Manage device tags: Alerts (manage) <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles <br>**MDE Roles**: Security data basics/Security operations / Security data <br> **Entra ID roles**: Global Reader, Security Reader |
|Device group| **MDE Roles**: Authorization (Read and manage) <br>**Entra ID roles**: Global Administrator, Security Administrator |**MDE Roles**: Authorization (write roles, Read-only) |

To assign roles and permissions for other Microsoft Defender for Endpoint features, such as alerts, incidents and inventory, see [assign roles and permissions for Defender for Endpoint](/defender-endpoint/prepare-deployment).

For more information, see [map unified RBAC permissions](/defender-xdr/compare-rbac-roles#microsoft-entra-global-roles-access).
