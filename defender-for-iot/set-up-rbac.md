---
title: Permissions needed for the site security feature of Microsoft Defender for IoT in the Defender portal
description: This article describes the permissions required for the site security feature of Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 07/23/2024
ms.topic: how-to
---

# Set up RBAC permissions to access site security

The Microsoft Defender portal allows granular access to features and data based on user roles and the permissions given to each user with Role-Based Access Control (RBAC).

To access the Microsoft Defender for IoT features in the Defender portal, such as site security, and Defender for IoT specific alerts and vulnerability updates, you need to assign permissions and roles to the correct users.

This article shows you how to set up the new roles and permissions to access the site security and Defender for IoT specific features.

To make general changes to RBAC roles and permissions that relate to all other areas of Defender for IoT, see [configure general RBAC permissions](configure-permissions.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Prerequisites

- Review [the general prerequisites for Microsoft Defender for IoT](prerequisites.md).
- Details of all users to be assigned site security permissions.

## Access management options

There are three ways to manage user access to the Defender portal, depending on the type of tenent you're using. Each system has different named permissions that allow access for site security. The systems are:

- [Global Microsoft Entra roles](/entra/identity/role-based-access-control/permissions-reference).
- [Microsoft Defender XDR Unified RBAC](/defender-xdr/manage-rbac): Use Defender XDR Unified role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.
- [Microsoft Defender for Endpoint XDR RBAC](/defender-endpoint/user-roles): Use Defender for Endpoint XDR role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.

The instructions and permission settings listed in this article apply to both Defender XDR Unified and Microsoft Defender for Endpoint XDR RBAC.

## Set up Defender XDR Unified RBAC roles for site security

Assign RBAC permissions and roles, based on the [summary table](#summary-of-rbac-roles-and-permissions-for-site-security), to give users access to site security features:

1. In the Defender portal, select **Settings** \> **Microsoft Defender XDR** \> **Permissions and roles**.
1. Enable **Endpoints & Vulnerability Management**.
1. Select **Go to Permissions and roles**.
1. Select **Create custom role**.
1. Type a **Role name**, and then select **Next** for Permissions.

    :::image type="content" source="media/set-up-rbac/permissions-set-up.png" alt-text="Screenshot of the permissions set up page for site security." lightbox="media/set-up-rbac/permissions-set-up.png":::

1. For read permissions, select **Security operations**, and select **Select custom permissions**.
1. In **Security data**, select **Security data basics(read)** and select **Apply**.

    :::image type="content" source="media/set-up-rbac/permissions-unified-read-options.png" alt-text="Screenshot of the permissions set up page with the specific read permissions chosen for site security." lightbox="media/set-up-rbac/permissions-unified-read-options.png":::

1. For write permissions, in **Authorization and settings**, select **Select custom permissions**.
1. In **Security data**, select **Core security settings (manage)** and select **Apply**.

    :::image type="content" source="media/set-up-rbac/permissions-choose-options.png" alt-text="Screenshot of the permissions set up page with the specific write permissions chosen for site security." lightbox="media/set-up-rbac/permissions-choose-options.png":::

1. Select **Next** for Assignments.
1. Select **Add assignment**, type a name, choose users and groups and select the Data sources.
1. Select **Add**.
1. Select **Next** to **Review and finish**.
1. Select **Submit**.

## Set up Microsoft Defender for Endpoint XDR RBAC (Version 2) roles for site security

Assign RBAC permissions and roles, based on the [summary table](#summary-of-rbac-roles-and-permissions-for-site-security), to give users access to site security features:

1. In the Defender portal, select **Settings** \> **Endpoints** \> **Roles**.
1. Select **Add role**.
1. Type a **Role name**, and a **Description**.
1. Select **Next** for Permissions.

    :::image type="content" source="media/set-up-rbac/permissions-mde-rbac2-add-role.png" alt-text="Screenshot of the Microsoft Defender for Endpoint XDR RBAC (version2) permissions set up page for site security." lightbox="media/set-up-rbac/permissions-mde-rbac2-add-role.png":::

1. For read permissions, in **View Data**, select **Security Operations**.

    :::image type="content" source="media/set-up-rbac/permissions-mde-rbac2-read-options.png" alt-text="Screenshot of the Microsoft Defender for Endpoint XDR RBAC (version2) permissions set up page with the specific read permissions chosen for site security." lightbox="media/set-up-rbac/permissions-mde-rbac2-read-options.png":::

1. For write permissions, select **Manage security settings in Security Center**.

    :::image type="content" source="media/set-up-rbac/permissions-mde-rbac2-write-options.png" alt-text="Screenshot of the Microsoft Defender for Endpoint XDR RBAC (version2) permissions set up page with the specific read and write permissions chosen for site security." lightbox="media/set-up-rbac/permissions-mde-rbac2-write-options.png":::

1. Select **Next**.
1. In **Assigned user groups**, select the user groups from the list to assign to this role.
1. Select **Submit**.

### Summary of RBAC roles and permissions for site security

**For Unified RBAC**:

|Write permissions |Read permissions |
|----|----|
| **Defender permissions**: Core security settings (manage) under Authorization and Settings and scoped to all device groups. <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator and scoped to all device groups.| Write roles (including roles that are non-scoped to all device groups). <br> **Defender permissions**: Security data basics (under Security Operations).<br>**Entra ID roles**: Global Reader, Security Reader.|

**For Microsoft Defender for Endpoint XDR RBAC (version 2)**:

|Write permissions |Read permissions |
|----|----|
| **Defender for Endpoint roles**: Manage security settings in Security Center and scoped to all device groups.<br>**Entra ID roles**: Global Administrator, Security Administrator.| Write roles (including roles that are non-scoped to all device groups). <br> **Defender for Endpoint roles**: View data - Security operations (read). <br>**Entra ID roles**: Global Reader, Security Reader.|

## Next steps

Once you have set up the RBAC roles and permissions, [set up a site](set-up-sites.md) so that Microsoft Defender for IoT can begin sending data to the Defender portal.
