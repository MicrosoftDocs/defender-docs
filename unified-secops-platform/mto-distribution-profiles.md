---
title: Content distribution using distribution profiles in multitenant management
description: Overview of content distribution through distribution profiles in multitenant management in Microsoft Defender XDR.
ms.service: unified-secops-platform
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
ms.date: 03/27/2025
appliesto: 
- ✅ <a href="https://learn.microsoft.com/microsoft-365/security/defender/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Content distribution in multitenant management

Content distribution helps you manage content at scale, across tenants in multitenant management in Microsoft Defender XDR. In content distribution, you can create distribution profiles to copy existing content, like custom detection rules, from the source tenant to the target tenants you assign during distribution profile creation. The content then runs on the target tenant's devices or device groups that you set in the distribution profile scope.

Distributing content in this manner, across tenants, enables you to organize tenants and content based on categories like business groups or location.

> [!NOTE]
> Multitenant management currently supports adding custom detection rules to a distribution profile. Additional content types will be added in the future. 

## Requirements

The following table lists the requirements for content distribution in multitenant management in Microsoft Defender XDR.

| Requirement | Description |
|:---|:---|
|Microsoft Defender XDR license |To use content distribution, your organization must have a subscription to Microsoft 365 E5 or Office E5.|
|Permissions |Users must be assigned the correct roles and permission at the individual tenant level to view and manage the associated data in multitenant management. <br/> Access to content distribution is granted through the Security settings (manage) or Security Data Basic (read) permission in [Microsoft 365 Defender Unified role-based access control (URBAC)](/defender-xdr/manage-rbac). Both of these roles are assigned to the Security Administrator and Security Reader Microsoft Entra built-in roles by default.|
|Delegate access |Delegated access via [Azure B2B](/entra/external-id/add-users-administrator) or [GDAP (CSP Parters only)](/microsoft-365/lighthouse/m365-lighthouse-setup-gdap) must be obtained for at least one other tenant.|

## Create distribution profiles

To create a new distribution profile:

1. Go to the [distribution profiles page](https://mto.security.microsoft.com/tenantgroups) in multitenant management in Microsoft Defender XDR.
2. Select **Create distribution profile**. In the **Tenants** page, select **Add tenant** to see a list of available tenants that you can add to your distribution profile. Choose the tenants you want to add to the distribution profile, then select **Add**.

    :::image type="content" source="media/mto-tenantgroups/mto-add-tenants-small.png" alt-text="Screenshot of the distribution profile creation wizard." lightbox="media/mto-tenantgroups/mto-add-tenants.png":::

3. In the **Content selection** page, select the content to be distirbuted across all tenants in your distribution profile, then select **Next**.
    
    :::image type="content" source="media/mto-tenantgroups/mto-add-content-small.png" alt-text="Screenshot of content selection wizard." lightbox="media/mto-tenantgroups/mto-add-content.png":::

> [!NOTE]
> The content type selection is currently limited to adding custom detection rules to a distribution profile. 

4. In the **Custom detection rules** page, select **Add content** to add specific detection rules to your distribution profile.

    :::image type="content" source="media/mto-tenantgroups/mto-add-custom-small.png" alt-text="Screenshot of custom detection rules addition wizard." lightbox="media/mto-tenantgroups/mto-add-custom.png":::

5. In the **Select detection rules** page, filter the source tenant of the content, then select **Apply**. Choose the content you want to add to your distribution profile from the list.

    :::image type="content" source="media/mto-tenantgroups/mto-select-content-small.png" alt-text="Screenshot of the detection rules selection pane." lightbox="media/mto-tenantgroups/mto-select-content.png":::

6. In the **Device groups** page, select the devices or specific device groups that need to be in your tenant's scope.

    :::image type="content" source="media/mto-tenantgroups/mto-select-device-small.png" alt-text="Screenshot of the device selection pane." lightbox="media/mto-tenantgroups/mto-select-device.png":::

7. Add a distribution profile name and description about your distribution profile in the Details page.
8. Review the details of the distribution profile you created in the **Summary** page. Leave the **Sync all authorized tenants** option checked if content needs to be synchronized now or uncheck it if the sync is planned for a later time.

    :::image type="content" source="media/mto-tenantgroups/mto-summary-tenantgroups-small.png" alt-text="Screenshot of summary of distribution profiles with the checkbox highlighted." lightbox="media/mto-tenantgroups/mto-summary-tenantgroups.png":::

9. Select **Submit** to finish your distribution profile creation.

> [!TIP]
> If you choose to **Sync all authorized tenants**, all the tenants and scope within the tenants you have permission automatically syncs.

Your newly created distribution profile appears in the distribution profiles page after creation. Select the distribution profile from the list to add or remove content, add, edit, or remove tenants, or sync the distribution profile.

:::image type="content" source="media/mto-tenantgroups/mto-group-sample-small.png" alt-text="Screenshot of a distribution profile page and the actions available within the page." lightbox="media/mto-tenantgroups/mto-group-sample.png":::

Check the sync results under the **Last sync result** column. If the result is *partially successful* or *failed*, select the result to investigate the cause. When selecting the result, a side pane containing the errors, recommendations, and impacted assets appears. Here's an example.

:::image type="content" source="media/mto-tenantgroups/mto-sync-results-small.png" alt-text="Screenshot of sync results side pane." lightbox="media/mto-tenantgroups/mto-sync-results.png":::

> [!NOTE]
> The maximum number of published items per publish operation is 9,500. Published items are calculated as the number of tenants multiplied by the number of templates. For example, if you publish 10 distribution profiles with 10 target tenants and 95 content templates, then the published items equals to 9,500.

## Syncing content among distribution profiles

To sync content across distribution profiles for the tenants you have permission for:

1. Go to the [distribution profiles page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkbox next to the distribution profile you want to sync, then select **Sync distribution profile**.
3. Select **Sync** on the prompt that appears.
4. Once the sync is completed, you see one of the following statuses:
   - Success
   - Partially successful
   - Failure

5. If you experience a partial success or failure, select the value in the **Last sync result** column to investigate the cause.  

Sync results show the number of synced tenants and content. Synced tenants indicate how many tenants had custom detection rules applied successfully. For example, if all rules are applied in 3 out of 3 tenants, the count is 3; if only 2 tenants succeed, the count is 2. Synced content represents the total custom detection rules synced across all target tenants.

## Edit distribution profiles

1. Go to the [distribution profiles page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the distribution profile you want to edit, then select **Edit distribution profile**.
3. Edit the distribution profile name and description, then select **Save**.

## Remove distribution profiles

1. Go to the [**Distribution profiles** page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the distribution profile you want to remove, then select **Remove distribution profile**.

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