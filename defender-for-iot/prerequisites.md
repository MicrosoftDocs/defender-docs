---
title: Prerequisites for Microsoft Defender for IoT in the Defender portal
description: This article describes the prerequisites for Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: get-started
---

# Prerequisites for Defender for IoT in the Defender portal

Microsoft Defender for IoT in the Microsoft Defender portal monitors and secures network traffic across your operational technology (OT) networks and allows you to analyze OT data, generate alerts, identify network risks, and more.

To see how Defender for IoT can help and protect your network sign up to a free, 90 day, trial version. This article describes the prerequisites needed to set up a trial license for Microsoft Defender for IoT.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Prerequisites for a trial license

Before you start, you need:

- A Microsoft tenant, with Global or Billing admin access to the tenent.

    For more information, see [Buy or remove licenses for a Microsoft business subscription](/microsoft-365/commerce/licenses/buy-licenses) and [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

- A Microsoft 365 E5/ Defender for Endpoint Plan 2/ E5 security license.

- Microsoft Defender for Endpoint agents deployed in your environment. For more information, see [onboard Microsoft Defender for Endpoint](/defender-endpoint/onboarding)

## Prerequisites for setting up a site

We recommend that you note the IP or MAC address details of at least one OT device listed in Defender for Endpoint. You'll need this information later when you [set up a site](set-up-sites.md).

## Permissions

The Microsoft Defender portal allows granular access to features and data based on user roles and the permissions given to each user.

Defender for IoT is part of the Defender portal and user access permissions for alerts, incidents, device inventory, device groups and vulnerabilities should already be configured.

To access the Defender for IoT features, such as site security, alerts, and vulnerability updates, you need to assign permissions and roles to the correct users.

### Access management options

There are two ways to manage user access to the Microsoft Defender portal:

- [Global Microsoft Entra roles](/entra/identity/role-based-access-control/permissions-reference).
- [Custom role access](/defender-xdr/custom-roles): Use role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.

The permission settings listed in this section apply to the unified RBAC version.

Depending on your tenant, you might have access to RBAC version 1 or 2 instead of the unified version. For more information, see [permissions for RBAC version 1](/defender-endpoint/prepare-deployment), or [permissions for RBAC version 2](/defender-endpoint/user-roles#permission-options).

If you're using the Defender portal for the first time, you need to set up all of your roles and permissions. For more information, see [manage portal access using role-based access control](/defender-endpoint/rbac).

### Unified RBAC roles for Defender for IoT

The unified RBAC roles and permissions to give users access to [site security](site-security-overview.md) features are:

|Write permissions |Read permissions |
|----|----|
| **MDE Roles**: Core security settings scoped to all device groups. <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator scoped to all device groups.| Write roles (including roles that aren't scoped to all device groups). <br> **MDE Roles**: Security data basics (under Security Operations).<br>**Entra ID roles**: Global Reader, Security Reader.|

This table shows the full roles and permissions needed for all MDE features used with Defender for IoT:

| Feature | Write permissions | Read permissions |
|---|----|---|
|Alerts and incidents| **MDE Roles**: Alerts (manage) <br> **Entra ID roles**: Global Administrator, Security Administrator, Security Operator| Write roles<br> **MDE Roles**: Security data basics<br>**Entra ID roles**: Global Reader, Security Reader |
|Vulnerabilities | **MDE Roles**: Response (manage)\ Security operations \ Security data <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles<br> **MDE Roles**: Vulnerability management (read) <br> **Entra ID roles**: Global Reader, Security Reader |
|Inventory| **MDE Roles**: Onboard offboard device: Detection tuning (manage) <br> Manage device tags: Alerts (manage) <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles <br>**MDE Roles**: Security data basics/Security operations \ Security data <br> **Entra ID roles**: Global Reader, Security Reader |
|Device group| **MDE Roles**: Authorization (Read and manage) <br>**Entra ID roles**: Global Administrator, Security Administrator |**MDE Roles**: Authorization (write roles, Read-only) |
|Defender for IoT| **MDE roles**: Core security settings. <br> **Entra ID roles**: Global Administrator, Security Administrator, Security Operator scoped to all device groups.|Write roles (including roles that aren't scoped to all device groups). <br> **MDE Roles**: Security data basics (under Security Operations).<br> **Entra ID roles**: Global Reader, Security Reader |

To assign roles and permissions for other Microsoft Defender for Endpoint features, such as alerts, incidents and inventory, see [assign roles and permissions for Defender for Endpoint](/defender-endpoint/prepare-deployment).

For more information, see [map unified RBAC permissions](/defender-xdr/compare-rbac-roles#microsoft-entra-global-roles-access).
