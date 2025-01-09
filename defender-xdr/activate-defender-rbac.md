---
title: Activate Microsoft Defender XDR Unified role-based access control (RBAC)
description: Activate Microsoft Defender XDR Security unified role-based access control(RBAC)
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
ms.topic: how-to
ms.date: 11/17/2024
ms.reviewer: 
search.appverid: met150
---

# Activate Microsoft Defender XDR Unified role-based access control (RBAC)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Identity](https://go.microsoft.com/fwlink/?LinkID=2198108)
- [Microsoft Defender for Office 365 P2](https://go.microsoft.com/fwlink/?LinkID=2158212)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)
- [Microsoft Defender for Cloud Apps](/defender-cloud-apps/)
- [Microsoft Security Exposure Management](/security-exposure-management/)

For the Microsoft Defender XDR security portal to start enforcing the permissions and assignments configured in your new [custom roles](create-custom-rbac-roles.md) or [imported roles](import-rbac-roles.md), you must activate the Microsoft Defender XDR Unified RBAC model for some or all of your workloads.

<a name='activate-microsoft-365-defender-unified-rbac'></a>

## Activate Microsoft Defender XDR Unified RBAC

The following steps guide you on how to activate the Microsoft Defender XDR Unified RBAC model. You can activate your workloads in the following ways:

1. [Activate in the permissions and roles page](#activate-from-the-permissions-and-roles-page)
2. [Activate in Microsoft Defender XDR settings](#activate-in-microsoft-365-defender-settings)

> [!IMPORTANT]
> You must be a Global Administrator or Security Administrator in Microsoft Entra ID to perform this task. For more information on permissions, see [Permission pre-requisites](manage-rbac.md#permissions-prerequisites).
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

### Activate from the Permissions and roles page

Sign in to the [Microsoft Defender portal](https://security.microsoft.com). In the navigation pane, select **Permissions** and select **Roles** under Microsoft Defender XDR to get to the Permissions and roles page.

You can activate your workloads in two ways from the Permissions and roles page:

:::image type="content" source="/defender/media/defender/m365-defender-rbac-activate-workloads1.png" alt-text="Screenshot of the activate workloads page" lightbox="/defender/media/defender/m365-defender-rbac-activate-workloads1.png":::

1. **Activate workloads**

- Select **Activate workloads** on the banner above the list of roles to go directly to the **Activate workloads** screen.
- You must activate each workload one by one. Once you select the individual toggle, you activate (or deactivate) that workload.

:::image type="content" source="/defender/media/defender/defender-activate-workloads.png" alt-text="Screenshot of the choose workloads to activate screen.":::

   > [!NOTE]
   > The **Activate workloads** button is only available when there is it at least one workload that's not active for Microsoft Defender XDR Unified RBAC.
   > Microsoft Defender for Cloud is active by default with Microsoft Defender XDR Unified RBAC.
   > Defender XDR Unified RBAC is automatically active for Exposure Management access. Once a custom role with one of the Exposure Management permissions is created, it has an immediate impact on assigned users. There is no need to activate it.
   > 
   > To activate Exchange Online permissions in Microsoft Defender XDR Unified RBAC, Defender for Office 365 permissions must be active. 
   
2. **Workload settings**
    - Select **Workload settings**.
    - This brings you to the Microsoft Defender XDR **Permission and roles** page.
    - Select the toggle for the workload you want to activate.
    - Select **Activate** on the confirmation message.

You have now successfully activated (or deactivated) that workload.

<a name='activate-in-microsoft-365-defender-settings'></a>

### Activate in Microsoft Defender XDR settings

Follow these steps to activate your workloads directly in Microsoft Defender XDR settings:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

2. In the navigation pane, select **Settings**.

3. Select **Microsoft Defender XDR**.

4. Select **Permissions and roles**. This brings you to the **Activate workloads** page.

5. Select the toggle for the workload you want to activate.

6. Select **Activate** on the confirmation message.

You have now successfully activated (or deactivated) that workload.

> [!NOTE]
> The Microsoft Defender XDR Unified RBAC model only impacts the Microsoft Defender XDR security portal. It does not impact the [Microsoft Purview Compliance center](https://compliance.microsoft.com) or the [Exchange Admin Center](https://admin.exchange.microsoft.com).

<a name='deactivate-microsoft-365-defender-unified-rbac'></a>

## Deactivate Microsoft Defender XDR Unified RBAC

You can deactivate Microsoft Defender XDR Unified RBAC and revert to the individual RBAC models from Microsoft Defender for Endpoint, Microsoft Defender for Identity, and Microsoft Defender for Office 365 (Exchange Online Protection).

To Deactivate the workloads, repeat the steps above and select the workloads you want to deactivate. The status is set to **Not Active**.

If you deactivate a workload, the roles created and edited within Microsoft Defender XDR Unified RBAC are no longer in effect, and the previous permissions model is used instead.

## Next steps

- [Edit or delete roles](edit-delete-rbac-roles.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
