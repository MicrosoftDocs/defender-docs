---
title: Content distribution using deployment profiles in multitenant management
description: Overview of content distribution through deployment profiles in multitenant management in Microsoft Defender XDR.
ms.service: unified-secops-platform
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
- m365-security
- highpri
- tier1
ms.topic: conceptual
ms.date: 06/03/2025
appliesto: 
- ✅ <a href="https://learn.microsoft.com/microsoft-365/security/defender/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Content distribution in multitenant management

Content distribution helps you manage content at scale, across tenants in the Microsoft Defender multitenant portal. In content distribution, you can create deployment profiles to copy existing content, like custom detection rules, from the source tenant to the target tenants you assign during deployment profile creation. The content then runs on the target tenant's devices or device groups that you set in the deployment profile scope.

Distributing content in this manner, across tenants, enables you to organize tenants and content based on categories like business groups or location.

> [!NOTE]
> Multitenant management currently supports adding custom detection rules to a deployment profile. Additional content types will be added in the future. 

## Requirements

The following table lists the requirements for content distribution in multitenant management in Microsoft Defender XDR.

| Requirement | Description |
|:---|:---|
|Microsoft Defender XDR license |To use content distribution, your organization must have a subscription to Microsoft 365 E5 or Office E5.|
|Permissions |Users must be assigned the correct roles and permission at the individual tenant level to view and manage the associated data in multitenant management. <br/> Access to content distribution is granted through the Security settings (manage) or Security Data Basic (read) permission in [Microsoft 365 Defender Unified role-based access control (URBAC)](/defender-xdr/manage-rbac). Both of these roles are assigned to the Security Administrator and Security Reader Microsoft Entra built-in roles by default.|
|Delegate access |Delegated access via [Azure B2B](/entra/external-id/add-users-administrator) or [GDAP (CSP Parters only)](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap) must be obtained for at least one other tenant.|

## Create deployment profiles

To create a new deployment profile:

1. In the Microsoft Defender multitenant portal, select **Multi-tenant management > Deployment profiles > Create deployment profile**. 

1. In the **Create deployment profile** wizard, on the **Details** page, enter a name and an option description for your deployment profile, then select **Next**.

1. In the **Assign tenants** page, select **Add tenant** to see a list of available tenants that you can add to your deployment profile. Select the tenants from those listed in the side pane that you want to add to your deployment profile, and then select **Add**. When you're satisfied with the tenants listed on the **Assign tenants** page, select **Next**.

1. On the **Content selection** page, select the content to be distributed across all tenants in your deployment profile, such as endpoint security policies, custom detection rules, and unified RBAC roles. When you're done, select **Next**.

    The next few pages depend on the content types you've selected. Follow the wizard's instructions to add specific content to the deployment profile for distribution, including defining any groups or role assignments as requested. Continue selecting **Next** to continue.

1. On the **Summary** page, review the details of the deployment profile you created. Leave the **Sync all authorized tenants** option checked if content needs to be synchronized now or clear the check it if the sync is planned for a later time.

    When you're done, select **Submit** to finish your deployment profile creation.

> [!IMPORTANT]
> If you choose to **Sync all authorized tenants**, all the tenants and scope within the tenants you have permission automatically syncs.

Your newly created deployment profile appears in the deployment profiles page after creation. Select the deployment profile from the list to add or remove content, add, edit, or remove tenants, or sync the deployment profile.

Check the sync results under the **Last sync result** column. If the result is *partially successful* or *failed*, select the result to investigate the cause. When selecting the result, a side pane containing the errors, recommendations, and impacted assets appears.

> [!NOTE]
> The maximum number of published items per publish operation is 9,500. Published items are calculated as the number of tenants multiplied by the number of templates. For example, if you publish 10 deployment profiles with 10 target tenants and 95 content templates, then the published items equals to 9,500.

## Syncing content among deployment profiles

To sync content across deployment profiles for the tenants you have permission for:

1. Go to the [deployment profiles page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkbox next to the deployment profile you want to sync, then select **Sync deployment profile**.
3. Select **Sync** on the prompt that appears.
4. Once the sync is completed, you see one of the following statuses:
   - Success
   - Partially successful
   - Failure

5. If you experience a partial success or failure, select the value in the **Last sync result** column to investigate the cause.  

Sync results show the number of synced tenants and content. Synced tenants indicate how many tenants had custom detection rules applied successfully. For example, if all rules are applied in 3 out of 3 tenants, the count is 3; if only 2 tenants succeed, the count is 2. Synced content represents the total custom detection rules synced across all target tenants.

## Edit deployment profiles

1. Go to the [deployment profiles page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the deployment profile you want to edit, then select **Edit deployment profile**.
3. Edit the deployment profile name and description, then select **Save**.

## Remove deployment profiles

1. Go to the [**Deployment profiles** page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the deployment profile you want to remove, then select **Remove deployment profile**.

## Troubleshooting

Common reasons for a sync to fail include:

- User doesn't have permission to create custom detection rules on the target tenant.
- User doesn't have permission to read custom detection rules from **content source**.
- User doesn't have permission for the target device scope.

If the issue is with the target tenant, try creating an identical custom detection rule for further diagnosis. If the issue is with accessing the source data, try accessing the custom detection.

## Additional resources

- [Create and manage custom detections rules](/defender-xdr/custom-detection-rules)
- [Add Microsoft Entra B2B collaboration users in the Microsoft Entra admin center](/entra/external-id/add-users-administrator)
- [Set up GDAP for your customers in Microsoft 365 Lighthouse](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap)