---
title: Microsoft Defender XDR Unified role-based access control (RBAC)
description: Manage permissions and access to Microsoft Defender XDR Security portal experiences using unified role-based access control (RBAC).
ms.service: defender-xdr
ms.author: diannegali
author: siosulli
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
ms.topic: overview
ms.date: 07/02/2024
ms.reviewer: 
search.appverid: met150
---

# Microsoft Defender XDR Unified role-based access control (RBAC)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Identity](https://go.microsoft.com/fwlink/?LinkID=2198108)
- [Microsoft Defender for Office 365 P2](https://go.microsoft.com/fwlink/?LinkID=2158212)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)
- [Microsoft Security Exposure Management](/security-exposure-management/)

Microsoft Defender XDR provides integrated threat protection, detection, and response across endpoints, email, identities, applications, and data within a single portal. Controlling a user's permissions around their access to view data or complete tasks is essential for organizations to minimize the risks associated with unauthorized access.

The Microsoft Defender XDR Unified role-based access control (RBAC) model provides a single permissions management experience that provides one central location for administrators to control user permissions across different security solutions.

<a name='whats-supported-by-the-microsoft-365-defender-unified-rbac-model'></a>

## What's supported by the Microsoft Defender XDR Unified RBAC model

Centralized permissions management is supported for the following solutions:

|Solution|Description|
|---|---|
|Microsoft Defender XDR|Centralized permissions management for Microsoft Defender XDR experiences.|
|Microsoft Defender for Endpoint|Full support for all endpoint data and actions. All roles are compatible with the device group's scope as defined on the device groups page.|
|Microsoft Defender Vulnerability Management|Centralized permissions management for all  Defender Vulnerability Management capabilities.|
|Microsoft Defender for Office 365|Full support for all data and actions. </br></br> **Note**: <ul><li>Initially, the Microsoft Defender XDR RBAC model is available only for organizations with Microsoft Defender for Office 365 Plan 2 licenses (trial licenses aren't supported).</li><li>Granular delegated admin privileges (GDAP) aren't supported.</li><li>Exchange Online PowerShell and Security & Compliance PowerShell continue to use [Exchange Online roles](/exchange/permissions-exo/permissions-exo) and [Email & Collaboration roles](/defender-office-365/mdo-portal-permissions). Microsoft Defender XDR Unified RBAC doesn't affect Exchange Online PowerShell or Security & Compliance PowerShell.</li><li>Azure B2B invited guests aren't supported by all experiences that were previously under Exchange Online RBAC.</li></ul>|
|Microsoft Defender for Identity|Full support for all identity data and actions. </br></br> **Note:** Defender for Identity experiences also adhere to permissions granted from [Microsoft Defender for Cloud Apps](https://security.microsoft.com/cloudapps/permissions/roles). For more information, see [Microsoft Defender for Identity role groups](https://go.microsoft.com/fwlink/?linkid=2202729).|
|Microsoft Defender for Cloud|Support access management for all Defender for Cloud data that is available in Microsoft Defender portal.|
|Microsoft Security Exposure Management|Full support for all Exposure Management data and actions, including Microsoft Secure Score data.|

> [!NOTE]
> Scenarios and experiences controlled by Compliance permissions are still managed in the Microsoft Purview compliance portal.
>
> This offering isn't currently available for Microsoft Defender for CloudApps.

## Before you start

This section provides useful information on what you need to know before you start using Microsoft Defender XDR Unified RBAC.

### Permissions prerequisites

- You must be a Global Administrator or Security Administrator in Microsoft Entra ID to:
  - Gain initial access to [Permissions and roles](https://security.microsoft.com/mtp_roles) in the Microsoft Defender portal.

  - Manage roles and permissions in Microsoft Defender XDR Unified RBAC.

  - Create a custom role that can grant access to security groups or individual users to manage roles and permissions in Microsoft Defender XDR unified RBAC. This removes the need for Microsoft Entra global roles to manage permissions. To do this, you need to assign the **Authorization** permission in Microsoft Defender XDR Unified RBAC. For details on how to assign the Authorization permission, see [Create a role to access and manage roles and permissions](create-custom-rbac-roles.md#create-a-role-to-access-and-manage-roles-and-permissions).

- The Microsoft Defender XDR security solution continues to respect existing Microsoft Entra global roles when you activate the Microsoft Defender XDR Unified RBAC model for some or all of your workloads, that is, Global Administrators retain assigned administrator privileges.

> [!IMPORTANT]
> Global Administrator is a highly privileged role that should be limited to scenarios when you can't use an existing role.

### Migration of existing roles and permissions

The new Microsoft Defender XDR Unified RBAC model provides easy migration of the existing permissions in the individual supported unified RBAC models to the new RBAC model.

All permissions listed within the Microsoft Defender XDR Unified RBAC model align to permissions in the individual RBAC models to ensure backward compatibility. For more information on how the permissions align, see [Map permissions in Microsoft Defender XDR unified role-based access control (RBAC)](compare-rbac-roles.md).

<a name='activation-of-the-microsoft-365-defender-unified-rbac-model'></a>

### Activation of the Microsoft Defender XDR Unified RBAC model

You must activate the workloads in Microsoft Defender XDR to use the Microsoft Defender XDR Unified RBAC model. Until activated, Microsoft Defender XDR continues to respect the existing RBAC models. For more information, see [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md).

When you activate some or all of your workloads to use the new permission model, the roles and permissions for these workloads are fully controlled by the Microsoft Defender XDR Unified RBAC model in the Microsoft Defender portal.

<a name='start-using-microsoft-365-defender-unified-rbac-model'></a>

## Start using Microsoft Defender XDR Unified RBAC model

Use the following steps as a guide to start using the Microsoft Defender XDR Unified RBAC model:

1. **Get started with creating custom roles and importing roles from existing RBAC role models**
    - [Create custom roles](create-custom-rbac-roles.md)
    - [Import existing RBAC roles](import-rbac-roles.md)
    - [View, edit, and delete RBAC roles](edit-delete-rbac-roles.md)

2. **Activate and manage your roles with the Microsoft Defender XDR Unified RBAC model**
   - [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md)

3. **Learn more about the Microsoft Defender XDR Unified RBAC model**
   - [Microsoft Defender XDR Unified RBAC permissions](custom-permissions-details.md)
   - [Map existing RBAC roles to Microsoft Defender XDR Unified RBAC roles](compare-rbac-roles.md)

Watch the following video to see the preceding steps in action:

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RW12hyh]

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
