---
title: Prerequisites for Microsoft Defender for IoT
description: This article describes prerequisites of Microsoft Defender for IoT
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: get-started
---

# Prerequisites for Defender for IoT

Defender for IoT monitors and secures network traffic across your OT networks. To see how Defender for IoT can help your network you can sign up to a free, 90 day, trial version. This article describes the prerequisites needed to set up a trial license for Microsoft Defender for IoT, for customers who don't have a Microsoft tenant at all.

A trial supports a **Large** sized site with up to 1,000 devices, and lasts for 90 days. You might want to use this trial with your existing OT devices to monitor traffic, analyze data, generate alerts, understand network risks and vulnerabilities, and more.

## Prerequisites for a trial license

Before you start, you need:

1. An email address to be used as the contact for your new Microsoft Tenant.

1. A Microsoft 365 tenant, with access to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) as Global or Billing admin.

    For more information, see [Buy or remove licenses for a Microsoft business subscription](/microsoft-365/commerce/licenses/buy-licenses.md) and [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles.md).

1. Credit card details for your new subscription, although you aren't charged until you switch from the **Free Trial** to the **Pay-As-You-Go** plan.
<!-- should this be added?-->
### Prerequisite for creating a site 

1. We recommend you have IP or MAC address details of at least one OT device at the site.

## Permissions

Microsoft Defender for IoT is part of Microsoft Defender portal and users should already have permissions for alerts, incidents, inventory, device groups and vulnerabilities configured. In order to access the Defender for IoT features, extra permissions and roles must be assigned to the correct users.

To assign roles and permissions for other Microsoft MDE features, such as alerts, incidents and inventory, etc., see [assign roles and permissions for MDE](/defender-endpoint/prepare-deployment.md).

### Access management options

There are two ways to manage access to the Microsoft Defender portal:

1. Global Microsoft Entra roles: For more information, see [Microsoft Entra built-in roles](/entra/identity/role-based-access-control/permissions-reference.md).

1. Custom role access: RBAC is a capability in Microsoft Defender that allows you to manage access to specific data, tasks, and capabilities in Microsoft Defender portal. For more information, see [custom roles in Microsoft Defender](/defender-xdr/custom-roles.md).

If you're using the Defender portal for the first time, you need to set up all of your roles and permissions. For more information, see [setting up RBAC in the Defender portal](). <!-- what link here-->

### Assign RBAC roles for Defender for IoT

Assign RBAC roles and permissions to give your users access to **Site security** features. This article describes assigning site security roles and permission settings with the RBAC unified version.

>[!Note]
>Depending on your tenant you might have access to RBAC version 1 or 2 instead of the unified version. For more information, see [permissions for RBAC version 1](/defender-endpoint/prepare-deployment.md), or [permissions for RBAC version 2](/defender-endpoint/user-roles#permission-options.md).  <!-- check these are correct? -->

For Site security assign the following permissions:

1. The **Write** permissions:
    1. MDE roles: Core security settings scoped to all device groups.
    1. Entra ID roles: Global Administrator, Security Administrator, Security Operator scoped to all device groups.

1. The **Read** permissions:
    1. Write roles (including roles that are non scoped to all device groups).
    1. MDE Roles: Security data basics (under Security Operations).<!-- keep this? -->
    1. Entra ID roles: Global Reader, Security Reader.
<!-- Do we need the following table here, is there a better place to put it, or introduce it? -->
This table shows the full roles and permissions needed for all features of MDE and Defender for IoT:

| Feature | Write permissions | Read permissions |
|---|----|---|
|Alerts and incidents| **MDE Roles**: Alerts (manage) <br> **Entra ID roles**: Global Administrator, Security Administrator, Security Operator| Write roles<br> **MDE Roles**: Security data basics<br>**Entra ID roles**: Global Reader, Security Reader |
|Vulnerabilities | **MDE Roles**: Response (manage)\ Security operations \ Security data <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles<br> **MDE Roles**: Vulnerability management (read) <br> **Entra ID roles**: Global Reader, Security Reader |
|Inventory| **MDE Roles**: Onboard offboard device: Detection tuning (manage) <br> Manage device tags: Alerts (manage) <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles <br>**MDE Roles**: Security data basics/Security operations \ Security data <br> **Entra ID roles**: Global Reader, Security Reader |
|Device group| **MDE Roles**: Authorization (Read and manage) <br>**Entra ID roles**: Global Administrator, Security Administrator |**MDE Roles**: Authorization (write roles, Read-only) |
|Defender for IoT| **MDE roles**: Core security settings. <br> **Entra ID roles**: Global Administrator, Security Administrator, Security Operator scoped to all device groups.|Write roles (including roles that are non scoped to all device groups). <br> **MDE Roles**: Security data basics (under Security Operations).<br> **Entra ID roles**: Global Reader, Security Reader.|

For more information, see [map unified RBAC permissions](/defender-xdr/compare-rbac-roles.md#microsoft-entra-global-roles-access).

## Supported protocols

TBD link to MDE supported protocols
