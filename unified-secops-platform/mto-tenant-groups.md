---
title: Create and manage tenant groups in Microsoft Defender multitenant management
description: Learn how to create tenant groups and switch the multitenant view between groups in the Microsoft Defender portal.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: soulisabag
ms.collection: 
- m365-security
- tier1
- usx-security
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
ms.custom: msecd-doc-authoring-1016
---

# Create and manage tenant groups in Microsoft Defender multitenant management

Tenant groups in Microsoft Defender multitenant management let you organize the tenants you manage into named collections and switch the multitenant view between them. Use tenant groups to focus on a specific set of tenants, such as those that belong to a single customer, business unit, or geographic region, instead of viewing every tenant you have access to at once.

> [!NOTE]
> The previous use of *tenant groups* for content distribution is now called [content distribution using distribution profiles](mto-distribution-profiles.md). The name *tenant groups* now refers to the groups of tenants you create to switch the multitenant view, as described in this article.

## Prerequisites

Before you create tenant groups, onboard your tenants to the Microsoft Defender multitenant portal. Only onboarded tenants appear when you create or edit a group.

For setup steps, see [Set up Microsoft Defender multitenant management](mto-requirements.md). To manage tenants, see [Manage tenants with Microsoft Defender multitenant management](mto-tenants.md).

<a name="permissions"></a>
## Required permissions

To access tenant groups, you need the following permissions.

**Microsoft Entra ID roles**

- [Security Administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)
- [Security Operator](/entra/identity/role-based-access-control/permissions-reference#security-operator)

**Product-specific RBAC (for example, Microsoft Defender for Endpoint or Microsoft Defender for Identity)**

- [Security Administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)
- Custom RBAC roles with access across products. For details, see [Custom roles for role-based access control](/defender-xdr/custom-roles).

**[Unified role-based access control (URBAC)](/defender-xdr/manage-rbac)**

- *Security / read* to view tenant groups
- *Security / manage* to create tenant groups

To learn more about URBAC permissions, see [Manage unified role-based access control (URBAC) for multitenant management](mto-urbac.md).

Users only see tenants they have access to through B2B or [granular delegated admin privileges (GDAP)](/partner-center/gdap-introduction). A tenant group can include tenants that a user can't see.

## Access tenant groups

To access tenant groups, follow these steps:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) with appropriate administrative credentials.
1. Go to **Multi-tenant management** > **Tenant groups**.

The first time you open the **Tenant groups** page, you see **My private group**, which contains all tenants from your previous multitenant settings. You can add or remove tenants from **My private group**, but you can't delete it.

## Create a tenant group

To create a tenant group, follow these steps:

1. On the **Tenant groups** page, select **+ Create tenant group**.
1. Enter a descriptive name for the tenant group.
1. Optionally, enter a description.
1. Select the tenants you want to add to the group.
1. Select **Create**.

## Switch the view between tenant groups

To switch the multitenant view to a different tenant group, follow these steps:

1. In the top-left corner of the multitenant portal, select **Open multitenant management**.
1. Select the tenant group you want to view.

   :::image type="content" source="media/mto-tenant-groups/multitenant-view-settings.png" alt-text="Screenshot of the Multi-tenant view settings page in the Microsoft Defender portal, with the Open multitenant management icon highlighted in the top-right corner." lightbox="media/mto-tenant-groups/multitenant-view-settings.png":::

After you switch groups, check that the portal shows data only from tenants in that group.

If someone changes the group while you have it open, the portal shows a notice. Refresh to load the new data.

:::image type="content" source="media/mto-tenant-groups/group-changes-detected.png" alt-text="Screenshot of the Group changes detected dialog with Refresh and reload and Cancel buttons.":::

## Edit a tenant group

To edit a tenant group, follow these steps:

1. Go to **Multi-tenant management** > **Tenant groups**.
1. Select the tenant group you want to change, and then select **Edit**.
1. Add or remove tenants as needed, and then save your changes.
1. Switch the view to the edited tenant group to confirm the data reflects the updated membership.

## Related content

- [Microsoft Defender multitenant management](mto-overview.md)
- [Manage tenants with Microsoft Defender multitenant management](mto-tenants.md)
- [Content distribution using distribution profiles in multitenant management](mto-distribution-profiles.md)
