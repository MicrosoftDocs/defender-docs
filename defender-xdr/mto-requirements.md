---
title: Set up Microsoft Defender multitenant management
description: Learn what steps you need to take to get started with multitenant management for Microsoft Defender XDR and the Microsoft unified security operations platform.
ms.service: defender-xdr
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- highpri
- tier1
- usx-security
ms.topic: conceptual
ms.date: 01/29/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Set up Microsoft Defender multitenant management

This article describes the steps you need to take to start using multitenant management for Microsoft Defender XDR and the Microsoft unified security operations platform.

1. [Review the requirements](#review-the-requirements)
2. [Verify your tenant access](#verify-your-tenant-access)
3. [Set up Microsoft Defender multitenant management](#set-up-multitenant-management)

>[!Note]
>- In multitenant management, interactions between the multitenant user and the managed tenants could involve accessing data and managing configurations. The ability to undertake these actions is determined by the permissions a managed tenant has granted the multitenant user.
>- [Data privacy](data-privacy.md), [role-based access control (RBAC)](m365d-permissions.md) and [Licensing](prerequisites.md#licensing-requirements) are respected by Microsoft Defender multi-tenant management.

## Review the requirements

The following table lists the basic requirements you need to use multitenant management for Microsoft Defender XDR and the unified security operations platform.

| Requirement | Description |
|:---|:---|
| Microsoft Defender XDR prerequisites | Verify you meet the [Microsoft Defender XDR prerequisites](prerequisites.md)|
| Microsoft Defender XDR for US Government customers | Check if you have the following applicable [licensing requirements](usgov.md#licensing-requirements)|
| Multitenant access | To view and manage the data you have access to in multitenant management, you need to ensure you have the necessary access. For each tenant you want to view and manage, you need to have either: <br/> <br/> - [Granular delegated admin privileges (GDAP)](/partner-center/gdap-introduction) <br/> - [Microsoft Entra B2B authentication](/azure/active-directory/external-identities/what-is-b2b) <br/> <br/> To learn more about how to synchronize multiple B2B users across tenants, see [Configure cross-tenant synchronization](/azure/active-directory/multi-tenant-organizations/cross-tenant-synchronization-configure).|
| Permissions | Users must be assigned the correct roles and permissions at the individual tenant level, in order to view and manage the associated data in multitenant management. To learn more, see: <br/><br/> - [Manage access to Microsoft Defender XDR with Microsoft Entra global roles](./m365d-permissions.md) <br/> - [Custom roles in role-based access control for Microsoft Defender XDR](./custom-roles.md)<br/><br/> To learn how to grant permissions for multiple users at scale, see [What is entitlement management](/azure/active-directory/governance/entitlement-management-overview).|
| Security information and event management (SIEM) data (Optional) |To include SIEM data with the extended detection and response (XDR) data, one or more tenants must include a Microsoft Sentinel workspace onboarded to the Microsoft unified security operations platform. For more information, see [Connect Microsoft Sentinel to Microsoft Defender XDR](/unified-secops-platform/microsoft-sentinel-onboard).<br/><br/>Only one Microsoft Sentinel workspace per tenant is currently supported in the unified security operations platform. So in Microsoft Defender multitenant management, you have SIEM data from one Microsoft Sentinel workspace per tenant.<br/><br/> Access to Microsoft Sentinel data is available through [Microsoft Entra B2B authentication](/azure/active-directory/external-identities/what-is-b2b). Microsoft Sentinel doesn't support [granular delegated admin privileges (GDAP)](/partner-center/gdap-introduction) at this time. |

We recommend that you set up [multifactor authentication trust](/azure/active-directory/external-identities/authentication-conditional-access) for each tenant to avoid missing data in Microsoft Defender multitenant management.


## Verify your tenant access

In order to view and manage the data you have access to in Microsoft Defender multitenant management, you need to ensure you have the necessary permissions. For each tenant you want to view and manage, you need to either:

- [Verify your tenant access with Microsoft Entra B2B](#verify-your-tenant-access-with-microsoft-entra-b2b)
- [Verify your tenant access with GDAP](#verify-your-tenant-access-with-gdap)

### Verify your tenant access with Microsoft Entra B2B

1. Go to [My account](https://myaccount.microsoft.com/organizations).
2. Under **Organizations > Other organizations you collaborate with** see the list of organizations you have guest access to.

   :::image type="content" source="/defender/media/defender/mto-myaccount.png" alt-text="Screenshot of organizations in the myaccount portal" lightbox="/defender/media/defender/mto-myaccount.png":::

3. Verify all the tenants you plan to manage appear in the list.
4. For each tenant, go to the [Microsoft Defender portal](https://security.microsoft.com/?tid=tenant_id) and sign in to validate you can successfully access the tenant.

### Verify your tenant access with GDAP

1. Go to the [Microsoft Partner Center](https://partner.microsoft.com/commerce/granularadminaccess/list).
2. Under **Customers** you can find the list of organizations you have guest access to.
3. Verify all the tenants you plan to manage appear in the list.
4. For each tenant, go to the [Microsoft Defender portal](https://security.microsoft.com/?tid=tenant_id) and sign in to validate you can successfully access the tenant.

## Set up multitenant management

The first time you use Microsoft Defender multitenant management, you need setup the tenants you want to view and manage. To get started:

1. Sign in to [Microsoft Defender multitenant management](https://mto.security.microsoft.com/)
2. Select **Add tenants**.

   :::image type="content" source="/defender/media/defender/mto-add-tenants.png" alt-text="Screenshot of the Microsoft Defender multi-tenant portal setup screen" lightbox="/defender/media/defender/mto-add-tenants.png":::

3. Choose the tenants you want to manage and select **Add**

> [!Note]
> The Microsoft Defender multitenant view currently has a limit of 100 target tenants.

The features available in multitenant management now appear on the navigation bar and you're ready to view and manage security data across all your tenants.

   :::image type="content" source="/defender/media/defender/mto-tenant-selection.png" alt-text="Screenshot of Microsoft Defender multitenant management." lightbox="/defender/media/defender/mto-tenant-selection.png":::

## Next step

Use these articles to get started with Microsoft Defender multitenant management:

- [View and manage incidents and alerts](./mto-incidents-alerts.md)
- [Advanced hunting](./mto-advanced-hunting.md)
- [Multitenant devices](./mto-tenant-devices.md)
- [Vulnerability management](./mto-dashboard.md)
- [Manage tenants](./mto-tenants.md)
