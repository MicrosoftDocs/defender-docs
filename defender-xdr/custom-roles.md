---
title: Custom roles for role-based access control
description: Learn how to manage custom roles in the Microsoft Defender portal
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: dansimp
author: dansimp
ms.localizationpriority: medium
ms.date: 08/22/2024
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
---
# Custom roles in role-based access control for Microsoft Defender portal services

By default, access to services available in the Microsoft Defender portal are managed collectively using [Microsoft Entra global roles](m365d-permissions.md). If you need greater flexibility and control over access to specific product data, and aren't yet using the [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md) for centralized permissions management, we recommend creating custom roles for each service.

For example, create a custom role for Microsoft Defender for Endpoint to manage access to specific Defender for Endpoint data, or create a custom role for Microsoft Defender for Office to manage access to specific email and collaboration data.

**Applies to:**

- Microsoft Defender for Cloud
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Endpoint
- Microsoft Defender for Identity
- Microsoft Defender for IoT
- Microsoft Defender for Office 365
- Microsoft Defender XDR
- Microsoft Security Exposure Management (preview)
- Microsoft Sentinel

[!INCLUDE [Prerelease](../includes/prerelease.md)]

<a name='manage-permissions-and-roles-in-the-microsoft-365-defender-portal'></a>

## Locate custom role management settings in the Microsoft Defender portal

Each Microsoft Defender service has its own custom role management settings, with some services being represented in a central location in the Microsoft Defender portal. To locate custom role management settings in the Microsoft Defender portal:

1. Sign in to the Microsoft Defender portal at [security.microsoft.com](https://security.microsoft.com).
1. In the navigation pane, select **Permissions**.
1. Select the **Roles** link for the service where you want to create a custom role. For example, for Defender for Endpoint:

  :::image type="content" source="./media/custom-roles/custom-roles-endpoint.png" alt-text="Screenshot that shows Roles link for Defender for Endpoint." lightbox="./media/custom-roles/custom-roles-endpoint.png" :::

In each service, custom role names aren't connected to global roles in Microsoft Entra ID, even if similarly named. For example, a custom role named *Security Admin* in Microsoft Defender for Endpoint isn't connected to the global *Security Admin* role in Microsoft Entra ID.

## Reference of Defender portal service content

For information about the permissions and roles for each Microsoft Defender XDR service, see the following articles:

- [Microsoft **Defender for Cloud** user roles and permissions](/azure/defender-for-cloud/permissions)
- [Configure access for **Defender for Cloud Apps**](/defender-cloud-apps/manage-admins)
- [Create and manage roles in **Defender for Endpoint**](/defender-endpoint/user-roles)
- [Roles and permissions in **Defender for Identity**](/defender-for-identity/role-groups)
- [Microsoft **Defender for IoT** user management](/azure/defender-for-iot/organizations/manage-users-overview)
- [Microsoft **Defender for Office 365** permissions](/defender-office-365/mdo-portal-permissions)
- [Manage access to **Microsoft Defender XDR**](m365d-permissions.md)
- [**Microsoft Security Exposure Management** permissions](/security-exposure-management/prerequisites#permissions)
- [Roles and permissions in **Microsoft Sentinel**](/azure/sentinel/roles)

Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.
