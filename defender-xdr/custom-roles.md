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
# Custom roles in role-based access control for Microsoft Defender XDR services

By default, access to Microsoft Defender XDR services is managed collectively using [Microsoft Entra global roles](m365d-permissions.md). If you need greater flexibility and control over access to specific product data, and aren't yet using the [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md) for centralized permissions management, we recommend creating custom roles for each service.

For example, create a custom role for Microsoft Defender for Endpoint to manage access to specific Defender for Endpoint data, create a custom role for Microsoft Defender for Office to manage access to specific email and collaboration data.

Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

**Applies to:**

- Microsoft Defender for Cloud Apps
- Microsoft Defender for Endpoint
- Microsoft Defender for Identity
- Microsoft Defender for Office 365
- Microsoft Defender XDR

[!INCLUDE [Prerelease](../includes/prerelease.md)]

<a name='manage-permissions-and-roles-in-the-microsoft-365-defender-portal'></a>

## Locate custom role management settings in the Microsoft 365 Defender portal

Each Microsoft Defender service has its own custom role management settings, with some services being represented in a central location in the Microsoft Defender portal. To locate custom role management settings in the Microsoft Defender portal:

1. Sign in to the Microsoft Defender portal at [security.microsoft.com](https://security.microsoft.com).
1. In the navigation pane, select **Permissions**.
1. Select the **Roles** link for the service where you want to create a custom role. For example, for Defender for Endpoint:

  :::image type="content" source="./media/custom-roles/custom-roles-endpoint.png" alt-text="Screenshot of a Roles link for Defender for Endpoint.":::

## Required roles for Defender XDR services

Custom role names aren't connected to global roles in Microsoft Entra ID, even if similarly named. For example, a custom role named *Security Admin* in Microsoft Defender for Endpoint isn't connected to the global *Security Admin* role in Microsoft Entra ID.

For Defender for Endpoint and Defender for Office, use custom roles as follows:

|Task  |Required roles for Defender for Endpoint | Required roles for Defender for Office 365 |
|---------|---------|
|**View investigation data**, including alerts, incidents, and the Action center      | View data - security operations        | One of the following: <ul><li>View-only Manage alerts<li>Organization configuration<li>Audit logs<li>View-only audit logs<li>Security reader<li>Security admin<li>View-only recipients |
|**View and manage hunting data**, including queries and functions     |    View data - security operations     | One of the following: <ul><li>Security reader<li>Security admin <li>View-only recipients|
|**Manage alerts and incidents**     | Alert investigation        |One of the following: <ul><li>Manage alerts<li>Security admin|
|**Action center remediation**     |     Active remediation actions – security operations    | Search and purge |
|**Set custom detections**     |   Manage security settings      | One of the following: <ul><li>Manage alerts<li>Security admin|
|**Threat analytics**     |   For alert and incidents data: View data- security operations <br><br>For vulnerability management mitigations: View data - Threat and vulnerability management      | For alerts and incidents data, one of the following: <ul><li>View-only Manage alerts<li>Manage alerts<li>Organization configuration<li>Audit logs<li>View-only audit logs<li>Security reader<li>Security admin<li>View-only recipients<br>For prevented email attempts, one of the following:<ul><li>Security reader<li>Security admin<li>View-only recipients |

For other service information, see:

- [Configure access for Defender for Cloud Apps](/defender-cloud-apps/manage-admins)
- [Roles and permissions in Defender for Identity](/defender-for-identity/role-groups)

## Related content

For more information about other Microsoft Defender portal services, see:

- [Microsoft Defender for Cloud user roles and permissions](/azure/defender-for-cloud/permissions)
- [Roles and permissions in Microsoft Sentinel](/azure/sentinel/roles)
- [Microsoft Defender for IoT user management](/azure/defender-for-iot/organizations/manage-users-overview)
