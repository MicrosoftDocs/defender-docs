---
title: Permissions needed for the site security feature of Microsoft Defender for IoT in the Defender portal
description: This article describes the permissions required for the site security feature of Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 07/2/2024
ms.topic: how-to
---

# Set up RBAC permissions to access Site security

The Microsoft Defender portal allows granular access to features and data based on user roles and the permissions given to each user.
<!--Defender for IoT is part of the Defender portal and user access permissions for alerts, incidents, device inventory, device groups and vulnerabilities should already be configured.-->
To access the Defender for IoT features, such as site security, alerts, and vulnerability updates, you need to assign permissions and roles to the correct users.

### Access management options

There are two ways to manage user access to the Microsoft Defender portal:

- [Global Microsoft Entra roles](/entra/identity/role-based-access-control/permissions-reference).
- [Custom role access](/defender-xdr/custom-roles): Use role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.

The permission settings listed in this section apply to the unified RBAC version.

### Set up Unified RBAC roles for site security

To <!-- give users access to [site security](site-security-overview.md) features-->assign users the unified RBAC permissions and roles:

1. In the Defender portal, select **Settings > Microsoft XDR > Permissions and roles**.
1. Enable **Endpoints & Vulnerability Management**.
1. Select **Go to Permissions and roles**.
1. Select **Create custom role**.
1. Type a **Role name**, and then select **Next** for Permissions.
    :::image type="content" source="media/set-up-rbac/permissions-set-up.png" alt-text="Screenshot of the permissions set up page for site security":::
1. Select **Security operations**, select Select custom permissions. In Security settings select Security data basics, select **Apply**
    :::image type="content" source="media/set-up-rbac/permissions-choose.png" alt-text="Screenshot of the permissions set up page with the categories of permissions for site security":::
1. Select **Authorization and settings**, select Select custom permissions. In Security data select Core security settings (manage), select **Apply**
    :::image type="content" source="media/set-up-rbac/permissions-choose-options.png" alt-text="Screenshot of the permissions set up page with the specific permissions chosen for site security":::
1. Select **Next** for Assignments.
1. Select **Add assignment**, type a name, choose users and groups and select the Data sources. Select **Add**.
1. Select **Next** to Review and finish.
    :::image type="content" source="media/set-up-rbac/permissions-review.png" alt-text="Screenshot of the review permissions set up page for site security":::
1. Select **Submit**.

This table shows the permissions and roles to assign:

|Write permissions |Read permissions |
|----|----|
| **MDE Roles**: Core security settings scoped to all device groups. <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator scoped to all device groups.| Write roles (including roles that aren't scoped to all device groups). <br> **MDE Roles**: Security data basics (under Security Operations).<br>**Entra ID roles**: Global Reader, Security Reader.|

### RBAC for version 1 or 2

Depending on your tenant, you might have access to RBAC version 1 or 2 instead of the unified version. For more information, see [permissions for RBAC version 1](/defender-endpoint/prepare-deployment), or [permissions for RBAC version 2](/defender-endpoint/user-roles#permission-options).

If you're using the Defender portal for the first time, you need to set up all of your roles and permissions. For more information, see [manage portal access using role-based access control](/defender-xdr/manage-rbac).
