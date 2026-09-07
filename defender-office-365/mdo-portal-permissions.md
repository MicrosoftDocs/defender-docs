---
title: Microsoft Defender for Office 365 permissions in the Microsoft Defender portal
author: chrisda
ms.author: chrisda
ms.audience: Admin
ms.topic: how-to
ms.localizationpriority: high
ms.collection: 
  - m365-security
  - tier1
description: Admins can learn how to manage Microsoft Defender for Office 365 (Email & collaboration) permissions in the Microsoft Defender portal.
ms.custom:
  - msecd-doc-authoring-1016
  - seo-marvel-apr2020
  - sfi-ga-nochange
ms.service: defender-office-365
ms.date: 07/10/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
ai-usage: ai-assisted
---

# Microsoft Defender for Office 365 permissions in the Microsoft Defender portal

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Global roles in Microsoft Entra ID allow you to manage permissions and access to capabilities in all of Microsoft 365, which also includes Microsoft Defender for Office 365. But, if you need to limit permissions and capabilities to security features in Defender for Office 365 only, you can assign **Email & collaboration** permissions in the Microsoft Defender portal.

> [!IMPORTANT]
> Microsoft Defender unified role-based access control (Unified RBAC) is the recommended permission model for Microsoft Defender for Office 365 in the Microsoft Defender portal, and it's the default for new Plan 2 organizations starting July 2026. The Email & collaboration roles described on this page are the legacy model and aren't available for new Plan 2 organizations. Existing organizations can activate Unified RBAC at any time and are encouraged to move to Unified RBAC. Currently, Unified RBAC is available for Microsoft Defender for Office 365 Plan 2. For more information, see [Unified RBAC permissions for Microsoft Defender for Office 365](defender-office-365-unified-rbac-permissions.md) and [MC1246006](https://admin.microsoft.com/Adminportal/Home#/MessageCenter/:/messages/MC1246006).

To manage Defender for Office 365 permissions in the Microsoft Defender portal, go to **Permissions** \> **Email & collaboration roles** \> **Roles** or go directly to <https://security.microsoft.com/emailandcollabpermissions>.

You need to be member of the **Global Administrator**<sup>\*</sup> role in Microsoft Entra ID or a member of the **Organization Management** role group in Defender for Office 365 permissions. Specifically, the **Role Management** role in Defender for Office 365 allows users to view, create, and modify Defender for Office 365 role groups. By default, the **Role Management** role is assigned only to the **Organization Management** role group (and by extension, global administrators).

- Some Defender for Office 365 features require additional permissions in Exchange Online. For more information, see [Permissions in Exchange Online](/exchange/permissions-exo/permissions-exo).
- Microsoft Defender has its own Unified role-based access control (RBAC). This model provides a single permissions management experience in one central location where admins can control permissions for different security solutions. These permissions are different from the permissions described in this article. For more information, see [Microsoft Defender role-based access control (RBAC)](/defender-xdr/manage-rbac).

  > [!IMPORTANT]
  > Unified RBAC will become the default permission model for new Microsoft Defender for Office 365 Plan 2 organizations. For more information, see [Message Center post MC1246006: Unified RBAC as the default for Defender for Office 365](https://admin.microsoft.com/Adminportal/Home#/MessageCenter/:/messages/MC1246006). For a complete list of Unified RBAC permissions mapped to Defender for Office 365 features, see [Unified RBAC permissions for Defender for Office 365](defender-office-365-unified-rbac-permissions.md). For step-by-step configuration guidance, see [How to configure Unified RBAC for Defender for Office 365](step-by-step-guides/configure-unified-rbac-defender-office-365.md).
  >
  > If you activate Defender unified RBAC for Email & collaboration, the permissions page at <https://security.microsoft.com/emailandcollabpermissions> is no longer available in the Defender portal, so you need to ensure that you configure or import your roles _before_ you activate Defender unified RBAC.

  :::image type="content" source="media/defender-xdr-rbac-permissions-page.png" alt-text="Screenshot of the Permissions page in the Microsoft Defender portal showing Microsoft Defender XDR roles and Email & Collaboration roles." lightbox="media/defender-xdr-rbac-permissions-page.png":::

- For information about permissions in the Microsoft Purview portal, see [Permissions in the Microsoft Purview portal](/purview/purview-permissions).

> [!IMPORTANT]
> <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

## Relationship of members, roles, and role groups

Defender for Office 365 permissions in the Microsoft Defender portal are based on the role-based access control (RBAC) permissions model. This permissions model is the same one that's used by most Microsoft 365 services, so if you're familiar with the permission structure in these services, granting permissions in the Microsoft Defender portal should be familiar.

A **role** grants the permissions to do a set of tasks.

A **role group** is a set of roles that lets people do their jobs in the Microsoft Defender portal.

Defender for Office 365 permissions in the Microsoft Defender portal includes default role groups for the most common tasks and functions that you need to assign. Generally, we recommend simply adding individual users as **members** to the default role groups.

:::image type="content" source="media/2a16d200-968c-4755-98ec-f1862d58cb8b.png" alt-text="The relationship of a role group to its roles and members" lightbox="media/2a16d200-968c-4755-98ec-f1862d58cb8b.png":::

## Roles and role groups in the Microsoft Defender portal

On the **Permissions** page in the Defender portal at <https://security.microsoft.com/securitypermissions>, the following types of roles and role groups are available:

- **Microsoft Entra roles**: You can view the roles and assigned users, but you can't manage them directly in the Microsoft Defender portal. Microsoft Entra roles are central roles that assign permissions for **all** Microsoft 365 services.

- **Email & collaboration roles**: You can view and manage these role groups directly in the Microsoft Defender portal. These permissions are specific to the Microsoft Defender portal and the Microsoft Purview portal. These permissions don't cover all of the permissions that you need in other Microsoft 365 workloads.

:::image type="content" source="media/m365-sc-permissions-and-roles-page.png" alt-text="The Permissions & roles page in the Microsoft Defender portal" lightbox="media/m365-sc-permissions-and-roles-page.png":::

### Microsoft Entra roles in the Microsoft Defender portal

The Microsoft Entra roles listed in the following table are available in the [Microsoft Defender portal](https://security.microsoft.com) \> **Permissions** \> **Microsoft Entra ID** \> **Roles** or directly at <https://security.microsoft.com/aadpermissions>.

When you select a role, a details flyout opens that contains the description of the role and the user assignments. But to manage those assignments, you need to select **Manage members in Microsoft Entra ID** at the bottom of the flyout.

:::image type="content" source="media/permissions-manage-in-azure-ad-link.png" alt-text="The link to manage permissions in Microsoft Entra ID" lightbox="media/permissions-manage-in-azure-ad-link.png":::

For more information, see [Assign Microsoft Entra roles to users](/entra/identity/role-based-access-control/manage-roles-portal) and [Manage access to Microsoft Defender XDR with Microsoft Entra global roles](/defender-xdr/m365d-permissions).

|Role|Description|
|---|---|
|**Global Administrator**|Access to all administrative features in all Microsoft 365 services. Only global administrators can assign other administrator roles. For more information, see [Global Administrator / Company Administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator--company-administrator).|
|**Compliance Data Administrator**|Keep track of your organization's data across Microsoft 365, make sure it's protected, and get insights into any issues to help mitigate risks. For more information, see [Compliance Data Administrator](/entra/identity/role-based-access-control/permissions-reference#compliance-data-administrator).|
|**Compliance Administrator**|Help your organization stay compliant with any regulatory requirements, manage eDiscovery cases, and maintain data governance policies across Microsoft 365 locations, identities, and apps. For more information, see [Compliance Administrator](/entra/identity/role-based-access-control/permissions-reference#compliance-administrator).|
|**Security Operator**|View, investigate, and respond to active threats to your Microsoft 365 users, devices, and content. For more information, see [Security Operator](/entra/identity/role-based-access-control/permissions-reference#security-operator).|
|**Security Reader**|View and investigate active threats to your Microsoft 365 users, devices, and content, but (unlike the Security operator) they don't have permissions to respond by taking action. For more information, see [Security Reader](/entra/identity/role-based-access-control/permissions-reference#security-reader).|
|**Security Administrator**|Control your organization's overall security by managing threat policies, reviewing security analytics and reports across Microsoft 365 products, and staying up-to-speed on the threat landscape. For more information, see [Security Administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator).|
|**Global Reader**|The read-only version of the **Global administrator** role. View all settings and administrative information across Microsoft 365. For more information, see [Global Reader](/entra/identity/role-based-access-control/permissions-reference#global-reader).|
|**Attack Simulation Administrator**|Create and manage all aspects of [attack simulation](attack-simulation-training-simulations.md) creation, launch/scheduling of a simulation, and the review of simulation results. For more information, see [Attack Simulation Administrator](/entra/identity/role-based-access-control/permissions-reference#attack-simulation-administrator).|
|**Attack Payload Author**|Create attack payloads but not actually launch or schedule them. For more information, see [Attack Payload Author](/entra/identity/role-based-access-control/permissions-reference#attack-payload-author).|

### Email & collaboration roles in the Microsoft Defender portal

The Email & collaboration role groups and roles are available in both the Defender portal and the Purview compliance portal:

- [Microsoft Defender portal](https://security.microsoft.com): **Permissions** \> **Email & collaboration roles** \> **Roles** or directly at <https://security.microsoft.com/emailandcollabpermissions>
- [Microsoft Purview compliance portal](https://purview.microsoft.com): **Roles & Scopes** \> **Permissions** \> **Microsoft Purview solutions** \> **Roles** or directly at <https://purview.microsoft.com/compliancecenterpermissions>

For complete information about the Email & collaboration role groups, see [Roles and role groups in the Microsoft Defender XDR and Microsoft Purview compliance portals](scc-permissions.md)

> [!NOTE]
> Defender for Office 365 data that's available in the Microsoft Defender portal isn't affected by adaptive scopes that are configured in the Microsoft Purview portal. For more information about adaptive scopes, see [Adaptive scopes](/purview/purview-adaptive-scopes).

The following actions are available for Email & collaboration role groups in the Defender portal:

- [Create role groups](#create-email--collaboration-role-groups-in-the-microsoft-defender-portal)
- [Copy role groups](#copy-email--collaboration-role-groups-in-the-microsoft-defender-portal)
- [Modify role group membership](#modify-email--collaboration-role-group-membership-in-the-microsoft-defender-portal)
- [Modify role assignments](#modify-email--collaboration-role-group-role-assignments-in-the-microsoft-defender-portal) (custom role groups only)
- [Remove role groups](#remove-email--collaboration-role-groups-in-the-microsoft-defender-portal) (custom role groups only)

#### Create Email & collaboration role groups in the Microsoft Defender portal

To create a new Email & collaboration role group in the Microsoft Defender portal, perform the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Permissions** \> **Email & collaboration roles** \> **Roles**. Or, to go directly to the **Permissions** page, use <https://security.microsoft.com/emailandcollabpermissions>.

2. On the **Permissions** page, select :::image type="icon" source="media/defender-portal-icon-create.png" border="false"::: **Create** to start the new role group wizard.

3. On the **Name your role group** page, enter the following information:
   - **Name**: Enter a unique name for the role group.
   - **Description**: Enter an optional description for the role group.

   When you're finished on the **Name your role group** page, select **Next**.

4. On the **Choose roles** page, select **Choose roles**.

   1. In the **Chose roles** flyout that opens, select **Add** at the top of the flyout.

   2. In the new **Choose roles** flyout that opens, select one or more roles. Select the **Name** column header to sort the list by name, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role.

      After you've selected one or more roles to add, select **Add** at the bottom of the flyout.

      Back on the original **Choose roles** flyout, the roles you added are listed on the page. To add more roles, repeat the previous step. Roles that you already selected are grayed out.

      To remove roles, select **Remove**. In the new **Choose roles** flyout that opens, select one or more roles, and then select **Remove**.

   3. When you're finished on the original **Choose roles** flyout, select **Done**.

   Back on the **Choose roles** page, the roles are shown in the **Selected roles** section.

   When you're finished on the **Choose roles** page, select **Next**.

5. On the **Choose members** page, select **Choose members**.

   1. In the **Choose members** flyout that opens, select **Add** at the top of the flyout.

   2. In the new **Choose members** flyout that opens, select one or more users. Select a column header to sort the list by **Name** or **Email address**, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the user.

      After you've selected one or more users to add, select **Add** at the bottom of the flyout.

      Back on the original **Choose members** flyout, the members you added are listed on the page. To add more members, repeat the previous step. Members that you already selected are grayed out.

      To remove members, select **Remove**. In the new **Choose members** flyout that opens, select one or more members, and then select **Remove**.

   3. When you're finished on the original **Choose roles** flyout, select **Done**.

   Back on the **Choose members** page, the members are shown in the **Selected members** section.

   When you're finished on the **Choose members** page, select **Next**.

6. On the **Review your settings** page, review your settings. You can select **Edit** in each section to modify the settings within the section. Or you can select **Back** or the specific page in the wizard.

   When you're finished on the **Review your settings** page, select **Create role group**.

Back on the **Permissions** page, the new role group is listed.

#### Copy Email & collaboration role groups in the Microsoft Defender portal

To copy an existing Email & collaboration role group in the Microsoft Defender portal, perform the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Permissions** \> **Email & collaboration roles** \> **Roles**. Or, to go directly to the **Permissions** page, use <https://security.microsoft.com/emailandcollabpermissions>.

2. On the **Permissions** page, select the role group from the list. Use the **Name** column header to sort the list by name, or the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role group.

3. In the role group details flyout that opens, select **Copy role group** at the top of the flyout.

The new role group wizard opens. For instructions, see [Create Email & collaboration role groups in the Microsoft Defender portal](#create-email--collaboration-role-groups-in-the-microsoft-defender-portal).

The default name of the new role group is **Copy of \<original role group name\>**, but you can change it.

The roles and members are populated with the values from the role group you're copying, but you can change them.

#### Modify Email & collaboration role group membership in the Microsoft Defender portal

To add or remove members in an Email & collaboration role group, perform the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Permissions** \> **Email & collaboration roles** \> **Roles**. Or, to go directly to the **Permissions** page, use <https://security.microsoft.com/emailandcollabpermissions>.

2. On the **Permissions** page, select the role group from the list. Use the **Name** column header to sort the list by name, or the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role group.

3. In the role group details flyout that opens, do one of the following steps:

   - Select :::image type="icon" source="media/defender-portal-icon-edit.png" border="false"::: **Edit role group** at the top of the flyout. In the edit role group wizard that opens, select the **Choose members** tab.
   - In the **Members** section of the flyout, select **Edit**.

4. On the **Choose members** tab of the edit role group wizard that opens, do one of the following steps:
   - If there are no role group members, select **Choose members**.
   - If there are existing role group members, select **Edit**

5. In the **Choose members** flyout that opens, do one of the following steps:

   - **Add members**: Select **Add** at the top of the flyout. In the new **Choose members** flyout that opens, select one or more users. Select a column header to sort the list by **Name** or **Email address**, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the user.

     After you've selected one or more users to add, select **Add** at the bottom of the flyout.

     Back in the original **Choose members** flyout, the added users are shown in the **Members** section.

   - **Remove members**: Select **Remove** at the top of the flyout. In the new **Choose members** flyout that opens, select one or more users. Select a column header to sort the list by **Name** or **Email address**, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the user.

     After you've selected one or more users to remove, select **Remove**.

     Back on the original **Choose members** flyout, the removed users are no longer shown in the **Members** section.

   When you're finished in the original **Choose members** flyout, select **Done**.

6. Back on the **Choose members** tab of the wizard, select **Save**.

7. Back on the role group details flyout, select **Done**.

#### Modify Email & collaboration role group role assignments in the Microsoft Defender portal

> [!NOTE]
> You can modify the role assignments for custom role groups only. You can't modify the role assignments for built-in role groups.

To modify the role assignments for a custom Email & collaboration role group, perform the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Permissions** \> **Email & collaboration roles** \> **Roles**. Or, to go directly to the **Permissions** page, use <https://security.microsoft.com/emailandcollabpermissions>.

2. On the **Permissions** page, select the role group from the list. Select the **Name** column header to sort the list by name, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role group.

3. In the role group details flyout that opens, do one of the following steps:

   - Select :::image type="icon" source="media/defender-portal-icon-edit.png" border="false"::: **Edit role group** at the top of the flyout. In the edit role group wizard that opens, select the **Choose roles** tab.
   - In the **Assigned roles** section of the flyout, select **Edit**.

4. On the **Choose roles** tab of the edit role group wizard that opens, do one of the following steps:
   - If there are no assigned roles, select **Choose roles**.
   - If there are existing roles assigned, select **Edit**

5. In the **Choose roles** flyout that opens, do one of the following steps:

   - **Add roles**: Select **Add** at the top of the flyout. In the new **Choose roles** flyout that opens, select one or more roles. Roles that are already assigned are grayed out. Select the **Name** column header to sort the list by name, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role.

     After you've selected one or more roles to add, select **Add** at the bottom of the flyout.

     Back in the original **Choose roles** flyout, the added roles are shown in the **Roles** section.

   - **Remove roles**: Select **Remove** at the top of the flyout. In the new **Choose roles** flyout that opens, select one or more roles. Select a column header to sort the list by **Name**, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role.

     After you've selected one or more roles to remove, select **Remove**.

     Back on the original **Choose roles** flyout, the removed roles are no longer shown in the **Roles** section.

   When you're finished in the original **Choose roles** flyout, select **Done**.

6. Back on the **Choose roles** tab of the wizard, select **Save**.

7. Back on the role group details flyout, select **Done**.

#### Remove Email & collaboration role groups in the Microsoft Defender portal

> [!NOTE]
> You can remove custom role groups only. You can't remove built-in role groups.

To remove a custom Email & collaboration role group, perform the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Permissions** \> **Email & collaboration roles** \> **Roles**. Or, to go directly to the **Permissions** page, use <https://security.microsoft.com/emailandcollabpermissions>.

2. On the **Permissions** page, select the role group from the list. Select the **Name** column header to sort the list by name, or use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find the role group.

3. In the role group details flyout that opens, select **Delete role group** at the top of the flyout.

4. Select **Yes** in the warning dialog that opens.

Back on the **Permissions** page, the role group is no longer listed.
