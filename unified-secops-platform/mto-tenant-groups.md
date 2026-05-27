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
ms.date: 05/27/2026
ai-usage: ai-assisted
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Create and manage tenant groups in Microsoft Defender multitenant management

Tenant groups in Microsoft Defender multitenant management let you organize the tenants you manage into named collections and switch the multitenant view between them. Use tenant groups to focus on a specific set of tenants, such as those that belong to a single customer, business unit, or geographic region, instead of viewing every tenant you have access to at once.

> [!NOTE]
> The previous use of *tenant groups* for content distribution is now called [distribution profiles](mto-distribution-profiles.md). The name *tenant groups* now refers to the groups of tenants you create to switch the multitenant view, as described in this article.

## Permissions

To access tenant groups, you need one of the following sets of permissions.

**Microsoft Entra ID roles**

- Security Administrator
- Security Operator

**Product-specific RBAC (for example, Microsoft Defender for Endpoint or Microsoft Defender for Identity)**

- Security Administrator
- Custom RBAC roles that grant visibility across products

**Unified role-based access control (URBAC)**

- *Security / read* to view tenant groups
- *Security / manage* to create tenant groups

Users only see the tenants they have permission to see through B2B or [granular delegated admin privileges (GDAP)](/partner-center/gdap-introduction), even when a tenant group contains more tenants than the user can access.

## Access tenant groups

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com) with appropriate administrative credentials.
1. Go to **Multi-tenant management** > **Tenant groups**.

The first time you open the page, you see **My private group**, which contains all tenants from your previous multitenant settings. You can add or remove tenants from **My private group**, but you can't delete it.

## Create a tenant group

1. On the **Tenant groups** page, select **+ Create tenant group**.
1. Enter a descriptive name for the tenant group.
1. Optionally, enter a description.
1. Select the tenants you want to add to the group.
1. Select **Create**.

## Switch the view between tenant groups

1. In the top-left corner of the multitenant portal, select **Open multitenant management**.
1. Select the tenant group you want to view.

After you switch groups, browse the different views in the multitenant portal and confirm that the data shown comes only from the tenants in the selected group.

If someone edits a tenant group (by adding or removing tenants) while you have a view open for that group, the portal shows a notification that a change was detected. Refresh the view to load data for the updated set of tenants.

## Edit a tenant group

1. Go to **Multi-tenant management** > **Tenant groups**.
1. Select the tenant group you want to change, and then select **Edit**.
1. Add or remove tenants as needed, and then save your changes.
1. Switch the view to the edited tenant group to confirm the data reflects the updated membership.

## Related content

- [Microsoft Defender multitenant management](mto-overview.md)
- [Manage tenants with Microsoft Defender multitenant management](mto-tenants.md)
- [Content distribution using distribution profiles in multitenant management](mto-distribution-profiles.md)
