---
title: Content distribution using tenant groups in multitenant management
description: Overview of content distribution through tenant groups in multitenant management in Microsoft Defender XDR.
ms.service: defender-xdr
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- highpri
- tier1
ms.topic: conceptual
ms.date: 01/02/2025
appliesto: 
- ✅ <a href="https://learn.microsoft.com/microsoft-365/security/defender/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Content distribution in multitenant management

Content distribution helps you manage content at scale, across tenants in multitenant management in Microsoft Defender XDR. In content distribution, you can create tenant groups to copy existing content, like custom detection rules, from the source tenant to the target tenants you assign during tenant group creation. The content then runs on the target tenant's devices or device groups that you set in the tenant group scope.

Distributing content in this manner, across tenants, enables you to organize tenants and content based on categories like business groups or location.

> [!NOTE]
> Multitenant management currently supports adding custom detection rules to a tenant group. Additional content types will be added in the future.

## Requirements

The following table lists the requirements for content distribution in multitenant management in Microsoft Defender XDR.

| Requirement | Description |
|:---|:---|
|Microsoft Defender XDR license |To use content distribution, your organization must have a subscription to Microsoft 365 E5 or Office E5.|
|Permissions |Users must be assigned the correct roles and permission at the individual tenant level to view and manage the associated data in multitenant management. <br/> Access to content distribution is granted through the Security settings (manage) or Security Data Basic (read) permission in [Microsoft 365 Defender Unified role-based access control (URBAC)](manage-rbac.md). Both of these roles are assigned to the Security Administrator and Security Reader Microsoft Entra built-in roles by default.|
|Delegate access |Delegated access via [Azure B2B](/entra/external-id/add-users-administrator) or [GDAP (CSP Parters only)](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap) must be obtained for at least one other tenant.|

## Create tenant groups

To create a new tenant group:

1. Go to the [Tenant groups page](https://mto.security.microsoft.com/tenantgroups) in multitenant management in Microsoft Defender XDR.
2. Select **Create tenant group**. In the **Tenants** page, select **Add tenant** to see a list of available tenants that you can add to your tenant group. Choose the tenants you want to add to the tenant group, then select **Add**.:

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-add-tenants-small.png" alt-text="Screenshot of the tenant group creation wizard." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-add-tenants.png":::

3. In the **Content selection** page, select the content to be distirbuted across all tenants in your tenant group, then select **Next**.
    
    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-add-content-small.png" alt-text="Screenshot of content selection wizard." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-add-content.png":::

> [!NOTE]
> The content type selection is currently limited to adding custom detection rules to a tenant group. Adding other content types will be available in the future. 

4. In the **Custom detection rules** page, select **Add content** to add specific detection rules to your tenant group.

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-add-custom-small.png" alt-text="Screenshot of custom detection rules addition wizard." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-add-custom.png":::

5. In the **Select detection rules** page, filter the source tenant of the content, then select **Apply**. Choose the content you want to add to your tenant group from the list.

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-select-content-small.png" alt-text="Screenshot of the detection rules selection pane." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-select-content.png":::

6. In the **Device groups** page, select the devices or specific device groups that need to be in your tenant's scope.

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-select-device-small.png" alt-text="Screenshot of the device selection pane." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-select-device.png":::

7. Add a tenant group name and description about your tenant group in the Details page.
8. Review the details of the tenant group you created in the **Summary** page. Leave the **Sync all authorized tenants** option checked if content needs to be synchronized now or uncheck it if the sync is planned for a later time.

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-summary-tenantgroups-small.png" alt-text="Screenshot of summary of tenant groups with the checkbox highlighted." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-summary-tenantgroups.png":::

9. Select **Submit** to finish your tenant group creation.

> [!TIP]
> If you choose to **Sync all authorized tenants**, all the tenants and scope within the tenants you have permission automatically syncs.

Your newly created tenant group appears in the Tenant groups page after creation. Select the tenant group from the list to add or remove content, add, edit, or remove tenants, or sync the tenant group.

:::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-group-sample-small.png" alt-text="Screenshot of a tenant group page and the actions available within the page." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-group-sample.png":::

Check the sync results under the **Last sync result** column. If the result is *partially successful* or *failed*, select the result to investigate the cause. When selecting the result, a side pane containing the errors, recommendations, and impacted assets appears. Here's an example.

:::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/mto-sync-results-small.png" alt-text="Screenshot of sync results side pane." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/mto-sync-results.png":::

## Syncing content among tenant groups

To sync content across tenant groups for the tenants you have permission for:

1. Go to the [Tenant groups page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkbox next to the tenant group you want to sync, then select **Sync tenant group**.
3. Select **Sync** on the prompt that appears.
4. Once the sync is completed, you see one of the following statuses:
   - Success
   - Partially successful
   - Failure

5. If you experience a partial success or failure, select the value in the **Last sync result** column to investigate the cause.  

Sync results show the number of synced tenants and content. Synced tenants indicate how many tenants had custom detection rules applied successfully. For example, if all rules are applied in 3 out of 3 tenants, the count is 3; if only 2 tenants succeed, the count is 2. Synced content represents the total custom detection rules synced across all target tenants.

## Edit tenant groups

1. Go to the [Tenant groups page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the tenant group you want to edit, then select **Edit tenant group**.
3. Edit the tenant group name and description, then select **Save**.

## Remove tenant groups

1. Go to the [Tenant groups page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the tenant group you want to remove, then select **Remove tenant group**.

## Troubleshooting

Common reasons for a sync to fail include:

- User doesn't have permission to create custom detection rules on the target tenant.
- User doesn't have permission to read custom detection rules from **content source**.
- User doesn't have permission for the target device scope.

If the issue is with the target tenant, try creating an identical custom detection rule for further diagnosis. If the issue is with accessing the source data, try accessing the custom detection.

## Additional resources

- [Create and manage custom detections rules](custom-detection-rules.md)
- [Add Microsoft Entra B2B collaboration users in the Microsoft Entra admin center](/entra/external-id/add-users-administrator)
- [Set up GDAP for your customers in Microsoft 365 Lighthouse](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap)