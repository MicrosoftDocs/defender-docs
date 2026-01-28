---
title: Configure the permissions needed for Microsoft Defender for IoT in the Defender portal
description: This article describes how to configure the permissions required for Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 07/23/2024
ms.topic: how-to
---

# Configure full roles and permissions

The Microsoft Defender portal allows granular access to features and data based on user roles and the permissions given to each user with Role-Based Access Control (RBAC).

Microsoft Defender for IoT is part of the Defender portal and user access permissions for alerts, incidents, device inventory, device groups and vulnerabilities should already be configured. Nevertheless, with the added features of Defender for IoT you might want to check, adjust or add to the existing roles and permissions of your team in the Defender portal.

This article shows you how to make general changes to RBAC roles and permissions that relate to all areas of Defender for IoT in the Defender portal. To set up roles and permissions specifically for site security, see [set up RBAC permissions for site security](set-up-rbac.md).  

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Prerequisites

- Review [the general prerequisites for Microsoft Defender for IoT](prerequisites.md).
- Details of all users to be assigned updated roles and permissions for the Defender portal.

## Access management options

There are two ways to manage user access to the Defender portal, depending on the type of tenent you're using. Each system has different named permissions that allow access for Defender for IoT. The two systems are:

- [Global Microsoft Entra roles](/entra/identity/role-based-access-control/permissions-reference).
- [Microsoft Defender XDR Unified RBAC](/defender-xdr/custom-roles): Use Microsoft Defender XDR Unified role-based access control (RBAC) to manage access to specific data, tasks, and capabilities in the Defender portal.

The instructions and permission settings listed in this article apply to Defender XDR Unified RBAC.

### RBAC for version 1 or 2 only

Depending on your tenant, you might have access to RBAC version 1 or 2 instead of Defender XDR Unified RBAC. Assign RBAC permissions and roles, based on the [summary table](#summary-of-roles-and-permissions-for-all-defender-for-iot-features), to give users access to general Defender for IoT features. However, follow the instructions listed here [for RBAC version 1](/defender-endpoint/prepare-deployment), or here [for RBAC version 2](/defender-endpoint/user-roles#permission-options).

If you're using the Defender portal for the first time, you need to set up all of your roles and permissions. For more information, see [manage portal access using role-based access control](/defender-xdr/manage-rbac).

## Defender XDR Unified RBAC roles for features in Defender for IoT

Assign RBAC permissions and roles, based on the [summary table](#summary-of-roles-and-permissions-for-all-defender-for-iot-features), to give users access to general Defender for IoT features:

1. In the Defender portal, either:
    1. Select **Settings** \> **Microsoft XDR** \> **Permissions and roles**.
        1. Enable **Endpoints & Vulnerability Management**.
        1. Select **Go to Permissions and roles**.

    1. Select **Permissions** \> **Microsft Defender XDR (1)** \> **Roles**.

1. Select **Create custom role**.
1. Type a **Role name**, and select **Next** for **Permissions**.

    :::image type="content" source="media/permissions/permissions-choose.png" alt-text="Screenshot of the permissions set up page with the categories of permissions for site security" lightbox="media/permissions/permissions-choose.png" :::

1. Select **Security operations**, select the permissions as needed, and select **Apply**.
1. Select **Security posture**, select the permissions as needed, and select **Apply**.
1. Select **Authorization and settings**, select the permissions as needed, and select **Apply**.

    :::image type="content" source="media/permissions/permissions-choose-options.png" alt-text="Screenshot of the permissions set up page with the specific permissions chosen for site security" lightbox="media/permissions/permissions-choose-options.png" :::

1. Select **Next** for **Assignments**.
1. Select **Add assignment**.
    1. Type a name.
    1. Choose users and groups.
    1. Select the Data sources.
    1. Select **Add**.
1. Select **Next** for **Review and finish**.
1. Select **Submit**.

### Summary of roles and permissions for all Defender for IoT features

| Feature | Write permissions | Read permissions |
|---|----|---|
|Alerts and incidents| **Defender Permissions**: Alerts (manage) <br> **Entra ID roles**: Global Administrator, Security Administrator, Security Operator| Write roles<br> **Defender Permissions**: Security data basics<br>**Entra ID roles**: Global Reader, Security Reader |
|Vulnerabilities | **Defender Permissions**: Response (manage)/ Security operations / Security data <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles<br> **Defender Permissions**: Vulnerability management (read) <br> **Entra ID roles**: Global Reader, Security Reader |
|Inventory| **Defender Permissions**: Onboard offboard device: Detection tuning (manage) <br> Manage device tags: Alerts (manage) <br>**Entra ID roles**: Global Administrator, Security Administrator, Security Operator | Write roles <br>**Defender Permissions**: Security data basics/Security operations / Security data <br> **Entra ID roles**: Global Reader, Security Reader |
|Device group| **Defender Permissions**: Authorization (Read and manage) <br>**Entra ID roles**: Global Administrator, Security Administrator |**Defender Permissions**: Authorization (write roles, Read-only) |

To assign roles and permissions for other Microsoft Defender for Endpoint features, such as alerts, incidents and inventory, see [assign roles and permissions for Defender for Endpoint](/defender-endpoint/prepare-deployment).

For more information, see [map Defender XDR Unified RBAC permissions](/defender-xdr/compare-rbac-roles#microsoft-entra-global-roles-access).

## Next steps

[Monitor site security](monitor-site-security.md)
