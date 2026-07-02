---
title: Endpoint security policies in multitenant management
description: Learn how to manage endpoint security policies for Defender XDR multi-tenant management in the Microsoft Defender portal.
author: guywi-ms
ms.author: guywild
ms.collection: 
  - m365-security
  - highpri
  - tier1
ms.topic: how-to
ms.date: 07/28/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
  - Microsoft Defender for Endpoint
ms.custom: sfi-image-nochange
---

# Endpoint security policies in multitenant management

Microsoft Defender for Endpoint security policies help you manage security settings across your devices. In the Microsoft Defender multitenant management portal, the **Endpoints > Configuration management > Endpoint security policies** page allows you to manage security settings on your tenants' devices across multiple tenants.

For more information, see [Manage endpoint security policies in Microsoft Defender for Endpoint](/defender-endpoint/manage-security-policies).

## Prerequisites

- You must have Microsoft Defender for Endpoint to use endpoint security policies in multitenant management.

- Security administrators must have permissions in each tenant to access the endpoint security policies page in multitenant management.

- The **Endpoint security policies** page is available only for [users with the security administrator role in Microsoft Defender XDR](/defender-endpoint/assign-portal-access). Other user roles, like Security Reader, don't provide access to the **Endpoint security policies** page. 

    When a user has the required permissions to view policies in the Microsoft Defender portal, the data is presented based on Intune permissions. If the user is in scope for Intune role-based access control, it applies to the list of policies presented in the Microsoft Defender portal.

    We recommend granting security administrators with the [Intune built-in role "Endpoint Security Manager"](/intune/intune-service/fundamentals/role-based-access-control#built-in-roles) to effectively align the level of permissions between Intune and Microsoft Defender XDR.

## Create a new or edit an existing security policy

Use the same procedure to create a new endpoint security policy in the multitenant management portal as you would in the single tenant portal. For more information, see [Create an endpoint security policy](/defender-endpoint/manage-security-policies#create-an-endpoint-security-policy).

Differences include:

- Before you start, select the tenant for which you want to create the policy. Each policy is created for a specific tenant, and you can only create policies for one tenant at a time.

  For example:
  
  :::image type="content" source="media/mto-endpoint-security-policy/mto-create-policy-small.png" alt-text="Screenshot of the policy creation page in endpoints security policy page in multitenant management." lightbox="media/mto-endpoint-security-policy/mto-create-policy.png":::

- To edit the scope tags, you'll need to go to the [Microsoft Intune admin center](https://intune.microsoft.com/). Editing scope tags must be done in the single tenant portal as multitenant management is not yet supported in the Intune admin center.

Use the **Search** and **Filter** options to find a specific policy in the **Endpoint security policies** page. You can filter policies by tenant name, policy category, policy type, and targets.

Edit or delete a security policy by selecting the policy in the Endpoint security policies page, then selecting **Edit** or  **Delete**. For example:

:::image type="content" source="media/mto-endpoint-security-policy/mto-edit-policy-small.png" alt-text="Screenshot of the editing pane for endpoint security policies page in multitenant management in Microsoft Defender XDR." lightbox="media/mto-endpoint-security-policy/mto-edit-policy.png":::


## Verify endpoint security policy status

To verify that you have successfully created a policy, select the policy from the list and click on the policy name to open the policy page. You can also view the policy page through **Edit > Open policy page**. The policy page opens in a new tab.

The policy page displays details of an endpoint security policy, including the status, which devices the policy applies to, and the assigned groups.

:::image type="content" source="media/mto-endpoint-security-policy/mto-policy-page-small.png" alt-text="Screenshot of the policy page in multitenant management in Microsoft Defender XDR." lightbox="media/mto-endpoint-security-policy/mto-policy-page.png":::

You can also view the policy in the Microsoft Intune admin center. To do so, select the More actions ellipsis (…) in the policy page, then select **View in Intune**.

## View distributed policies

Endpoint security policies that are distributed across tenants with the multitenant management portal appear in a hierarchical view, with the original policy serving as the parent. You can find the policies that were distributed from your tenant under the original policy. For example:

:::image type="content" source="media/mto-endpoint-security-policy/mto-distributed.png" alt-text="Screenshot of the endpoint security policies page in multitenant management highlighting distributed policies" lightbox="media/mto-endpoint-security-policy/mto-distributed.png":::

The **Last Distribution Status** for the original policy reflects the overall status of its distributed copies, and the **Tenants** and **Distribution profiles** columns indicate the distribution profile recipients of the policy. For more information, see [Content distribution in multitenant management](mto-distribution-profiles.md).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
