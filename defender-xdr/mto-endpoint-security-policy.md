---
title: Endpoint security policies in multitenant management
description: Learn how to manage endpoint security policies in multi-tenant management in Microsoft Defender XDR.
ms.service: defender-xdr
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: denisemb
audience: ITPro
ms.collection: 
  - m365-security
  - highpri
  - tier1
ms.topic: conceptual
ms.date: 05/29/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
  - ✅ <a href="https://learn.microsoft.com/defender-endpoint/microsoft-defender-endpoint" target="_blank">Microsoft Defender for Endpoint</a>
---

# Endpoint security policies in multitenant management

An aggregated view of all security policies from all tenants is now available through the **Endpoint security policies** page in multitenant management. The page gives you access to manage security settings on your tenants' devices, allowing you to create, edit, or delete security policies. Navigate to the page through **Endpoint > Configuration management > Endpoint security policies**.

:::image type="content" source="media/multi-tenant/endpoint-security-policy/navigation-mto-endpoint-policies-small.png" alt-text="Screenshot of the endpoint security policies page in multitenant management in Microsoft Defender XDR." lightbox="media/multi-tenant/endpoint-security-policy/navigation-mto-endpoint-policies.png":::

> [!IMPORTANT]
> The Endpoint security policies page is available only for [users with the security administrator role in Microsoft Defender XDR](/defender-endpoint/assign-portal-access). Any other user role like Security Reader cannot access the security policies page. When a user has the required permissions to view policies in the Microsoft Defender portal, the data is presented based on Intune permissions. If the user is in scope for Intune role-based access control, it applies to the list of policies presented in the Microsoft Defender portal. We recommend granting security administrators with the [Intune built-in role "Endpoint Security Manager"](/mem/intune/fundamentals/role-based-access-control#built-in-roles) to effectively align the level of permissions between Intune and Microsoft Defender XDR.

> [!NOTE]
> The endpoints security policies page is not yet available for tenants with Microsoft Defender for Business licenses.

To know more about endpoint security policy types, see [Manage endpoint security policies in Microsoft Defender for Endpoint](/defender-endpoint/manage-security-policies).

> [!TIP]
> Security administrators must have permissions in each tenant to access the endpoint security policies page in multitenant management.

From the page, you can search for a specific policy by using the **Search** function. You can also **Filter** the policies according to tenant name, policy category, policy type, and targets. You can view, create, edit, or delete a security policy on a single tenant only through the page.

## Create a new security policy

> [!NOTE]
> Creating one policy for multiple tenants is not yet supported.

To create a new security policy, perform the following steps:

1. Sign in to the Microsoft Defender portal using a security administrator role.
2. From the main menu, select **Configuration management > Endpoint security policies**, then select **Create new Policy**.
3. Select a tenant, platform, and a template in the dropdown menus. Then select Create policy.
   :::image type="content" source="media/multi-tenant/endpoint-security-policy/mto-create-policy-small.png" alt-text="Screenshot of the policy creation page in endpoints security policy page in multitenant management." lightbox="media/multi-tenant/endpoint-security-policy/mto-create-policy.png":::
4. On the **Basics** page, enter a name and description for the new policy, then choose **Next**.
5. On the **Configuration settings** page, expand a group of settings and configure the settings you need to manage the endpoints in the tenant. Select **Next** once you're done with the configuration.
6. On the **Assignments** page, select the Microsoft Entra ID groups where the policy will apply, then select **Next**.
7. Review your new policy's settings on the **Review + create** page, then select **Save** when you're done.

After creating, the Microsoft Defender portal opens a new window showing the new policy's details.

> [!NOTE]
> To edit the scope tags, you'll need to go to the [Microsoft Intune admin center](https://intune.microsoft.com/). Editing scope tags must be done in the single tenant portal as multitenant management is not yet supported in the Intune admin center.

## Edit a security policy

To edit an existing security policy, perform the following steps:

1. In the **Endpoint security policies** page, select the policy you want to edit and then select **Edit**.
2. In the side panel, select **Edit** to edit the policy.
3. Modify the policy's settings and configuration in the next pages.
4. After you've made changes, select **Save** to save your edits.

You can delete a security policy by selecting the policy in the Endpoint security policies page, then selecting **Delete**.

:::image type="content" source="media/multi-tenant/endpoint-security-policy/mto-edit-policy-small.png" alt-text="Screenshot of the editing pane for endpoint security policies page in multitenant management in Microsoft Defender XDR." lightbox="media/multi-tenant/endpoint-security-policy/mto-edit-policy.png":::

## Verify endpoint security policy status

To verify that you have successfully created a policy, select the policy from the list and click on the policy name to open the policy page. You can also view the policy page through **Edit > Open policy page**. The policy page opens in a new tab.

The policy page displays details of an endpoint security policy, including the status, which devices the policy applies to, and the assigned groups.

:::image type="content" source="media/multi-tenant/endpoint-security-policy/mto-policy-page-small.png" alt-text="Screenshot of the policy page in multitenant management in Microsoft Defender XDR." lightbox="media/multi-tenant/endpoint-security-policy/mto-policy-page.png":::

You can also view the policy in the Microsoft Intune admin center. To do so, select the More actions ellipsis (…) in the policy page, then select **View in Intune**.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]