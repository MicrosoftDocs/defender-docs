---
title: Activate Microsoft Defender unified role-based access control (URBAC)
description: Activate Microsoft Defender unified role-based access control (URBAC) to enforce permissions and assignments configured in your new custom or imported roles.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.collection: 
- m365-security
- tier3
ms.topic: how-to
ms.date: 03/02/2025
ms.reviewer: Tomas Beerthuis
appliesto:
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender XDR
- Microsoft Defender for Identity
- Microsoft Defender for Office 365 P2
- Microsoft Defender Vulnerability Management
- Microsoft Defender for Cloud
- Microsoft Defender for Cloud Apps
- Microsoft Security Exposure Management
- Microsoft Sentinel
#customer intent: As a security administrator, I want to activate Microsoft Defender unified RBAC so that I can enforce permissions and assignments configured in my new custom roles or imported roles.
---

# Activate Microsoft Defender unified role-based access control (URBAC)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article lists the steps to activate Defender workloads available in your environment to use the Microsoft Defender unified role-based access control (RBAC). Activate the unified RBAC model for some or all of your workloads for the Microsoft Defender portal to start enforcing the permissions and assignments configured in your new [custom roles](create-custom-rbac-roles.md) or [imported roles](import-rbac-roles.md).

> [!IMPORTANT]
> Starting 2025, the Microsoft Defender unified RBAC model is the default permissions model for new Microsoft Defender Endpoint tenants and Microsoft Defender for Identity tenants. These tenants can't export roles and permissions from the old model. Defender for Endpoint or Defender for Identity tenants with roles and permissions assigned or exported prior to this date maintain their old roles and permissions configuration.

<a name='activate-microsoft-365-defender-unified-rbac'></a>

## Prerequisites

You must be at least a Security Administrator in Microsoft Entra ID to activate Microsoft Defender unified RBAC. For more information on permissions, see [Permission prerequisites](manage-rbac.md#permissions-prerequisites).

## Before you begin

Before you activate Microsoft Defender unified RBAC, consider the following:

* The following roles are not supported: the Microsoft Sentinel Playbook Operator, Automation Contributor and Workbook Contributor role. These continue to be managed in Azure.  
* Assigning permissions to a service principal or to a GDAP user group in Microsoft Sentinel isn't supported in unified RBAC. If you need either capability, don't activate Sentinel in unified RBAC yet. Continue using Azure RBAC for Microsoft Sentinel.
* The Microsoft Defender unified RBAC model only impacts the Microsoft Defender portal. It doesn't impact the [Microsoft Purview portal](https://purview.microsoft.com) or the [Exchange Admin Center](https://admin.exchange.microsoft.com).
* Once unified RBAC is activated for Microsoft Sentinel, use unified RBAC in the Defender portal to manage Sentinel permissions. Making permission changes in the Azure portal after unified RBAC is active for a workspace might lead to sync errors. If a sync error occurs, a notification appears on the **Permissions** page in the Defender portal with instructions on how to resolve it.

## Activate Microsoft Defender unified RBAC

The following steps guide you on how to activate the Microsoft Defender unified RBAC model. You can activate your workloads in the following ways:

* [Activate in the permissions and roles page](#activate-from-the-permissions-and-roles-page)
* [Activate in Microsoft Defender XDR settings](#activate-in-microsoft-365-defender-settings)

### Activate from the Permissions and roles page

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. In the navigation pane, select **System** >  **Permissions**.

1. Under **Microsoft Defender XDR**, select **Roles**.

1. You can activate your workloads in two ways: either select **Activate workloads** from the banner or select **Workload settings** at the top of the page.

:::image type="content" source="media/activate-defender-rbac/m365-defender-rbac-activate-workloads1.png" alt-text="Screenshot of the activate workloads page" lightbox="media/activate-defender-rbac/m365-defender-rbac-activate-workloads1.png":::

   > [!NOTE]
   > The **Activate workloads** button is only available when there's at least one workload that's not active for Microsoft Defender unified RBAC.
   > Microsoft Defender for Cloud is active by default with Microsoft Defender unified RBAC.
   > Defender unified RBAC is automatically active for Exposure Management access. Once a custom role with one of the Exposure Management permissions is created, it has an immediate impact on assigned users. There's no need to activate it.
   >
   > To activate Exchange Online permissions in Microsoft Defender unified RBAC, Defender for Office 365 permissions must be active.

1. Select the toggle for each workload you want to activate or deactivate.

1. Optional: To activate Sentinel's workload, select **View Workspaces** and select which workspaces you'd like to activate.

   :::image type="content" source="media/activate-defender-rbac/defender-activate-workloads.png" alt-text="Screenshot of the page where you can choose workloads to activate.":::

1. Select **Activate** on the confirmation message.

<a name='activate-in-microsoft-365-defender-settings'></a>

### Activate in Microsoft Defender XDR settings

Follow these steps to activate your workloads directly in Microsoft Defender XDR settings:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. In the navigation pane, select **System** >  **Settings**.

1. Select **Microsoft Defender XDR**.

1. Under **General**, select **Permissions and roles**. This brings you to the **Activate unified role-based access control** page.

1. Select the toggle for the workloads you want to activate or deactivate.

1. Optional: To activate Microsoft Sentinel's workload, select **View Workspaces** and select which workspaces you'd like to activate.

1. Select **Activate** on the confirmation message.

<a name='deactivate-microsoft-365-defender-unified-rbac'></a>

## Deactivate Microsoft Defender unified RBAC

You can deactivate Microsoft Defender XDR unified RBAC and revert to the individual RBAC models from Microsoft Defender for Endpoint, Microsoft Defender for Identity, Microsoft Sentinel,and Microsoft Defender for Office 365 (which includes [the built-in security features for all cloud mailboxes](/defender-office-365/eop-about)).

To deactivate the workloads, repeat the steps in the previous section and select the workloads you want to deactivate. The status is set to **Not Active**.

If you deactivate a workload, the roles created and edited within Microsoft Defender unified RBAC are no longer in effect, and the previous permissions model is used instead.

## Next steps

[Edit or delete roles](edit-delete-rbac-roles.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
