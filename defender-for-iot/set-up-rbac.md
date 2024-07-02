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

Defender for IoT is part of the Defender portal and user access permissions for alerts, incidents, device inventory, device groups and vulnerabilities should already be configured.

To access the Defender for IoT features, such as site security, alerts, and vulnerability updates, you need to assign permissions and roles to the correct users.

### Access management options

There are two ways to manage user access to the Microsoft Defender portal:

- [Global Microsoft Entra roles](/entra/identity/role-based-access-control/permissions-reference).
- [Custom role access](/defender-xdr/custom-roles): Use role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.

The permission settings listed in this section apply to the unified RBAC version.

### Set up Unified RBAC roles for site security

The unified RBAC roles and permissions to give users access to [site security](site-security-overview.md) features are:

|Write permissions |Read permissions |
|----|----|
| **MDE Roles**: Core security settings scoped to all device groups. <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator scoped to all device groups.| Write roles (including roles that aren't scoped to all device groups). <br> **MDE Roles**: Security data basics (under Security Operations).<br>**Entra ID roles**: Global Reader, Security Reader.|

### RBAC for version 1 or 2

Depending on your tenant, you might have access to RBAC version 1 or 2 instead of the unified version. For more information, see [permissions for RBAC version 1](/defender-endpoint/prepare-deployment), or [permissions for RBAC version 2](/defender-endpoint/user-roles#permission-options).

If you're using the Defender portal for the first time, you need to set up all of your roles and permissions. For more information, see [manage portal access using role-based access control](/defender-xdr/manage-rbac).