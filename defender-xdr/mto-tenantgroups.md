---
title: Content distribution in multitenant management
description: Overview of multitenant management content distribution through tenant groups in Microsoft Defender XDR.
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
ms.date: 06/05/2024
appliesto: 
  - ✅ <a href="https://learn.microsoft.com/microsoft-365/security/defender/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Content distribution in multitenant management

[!INCLUDE [Prerelease](../includes/prerelease.md)]

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
2. Select **Create tenant group**:

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-add-small.png" alt-text="Screenshot of the tenant group creation wizard." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-add.png":::

3. Enter in **Tenant group name** and **Description**, then select **Next**.
4. Select **Add** to add custom detection rules.

> [!NOTE]
> Multitenant management currently only supports adding custom detection rules to a tenant group. Additional content types will be added in the future.

5. The **Source tenant** column displays the tenant the detection rule comes from. Choose the detection rules you want to add to the assignment.

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-select-rules-small.png" alt-text="Screenshot of the detection rules selection pane." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-select-rules.png":::

6. Select **Add to tenant group**.
7. Select **Next** on the **Content** page.
8. Select the target tenants for the assignment on the **Assign tenants** page, then select **Next**.
9. For each target tenant, you can opt to select the devices or device groups to include in the scope of the assignment in the **Set scope** page.

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-scope-small.png" alt-text="Screenshot of the scope settings section." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-scope.png":::

10. Select **Next**.
11. Review the assignment details. Leave the **Sync all authorized tenants** option checked if content needs to be synchronized now or uncheck it if the sync is planned for a later time.
12. Select **Submit** then select **Done**.

If you chose to **Sync all authorized tenants**, all the tenants and scope within the tenants you have permission will now sync.

## Syncing content among tenant groups

To sync content across tenant groups for the tenants you have permission for:

1. Go to the [Tenant groups page](https://mto.security.microsoft.com/tenantgroups).
2. Select the checkboxes next to the tenant group you want to sync, then select **Sync tenant group**.
3. Select **Sync** on the prompt that appears.

> [!NOTE]
> It may take a few minutes to sync.

4. Once the sync is completed, you see one of the following statuses:

- Success
- Partially successful
- Failure

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-sync-results-small.png" alt-text="Screenshot of the sync results with status highlighted." lightbox="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-sync-results.png":::

5. If you experience a partial success or failure state, select on the value  in **Last Sync Results** column to investigate the cause.  

    :::image type="content" source="/defender-xdr/media/multi-tenant/tenant-groups/tenant-groups-sync-partial.png" alt-text="Screenshot of the sync results details from the sync results pane.":::

Sync results display the number of synced tenants and synced content. The number of synced tenants shows the number of tenants where all the custom detection rules applied successfully. For example, if you have 3 tenants in a tenant group and all 3 tenants have the same custom detection rules applied successfully, the number of synced tenants is 3. If only 2 out of 3 tenants have the custom detection rules applied successfully, the number of synced tenants is 2. The number of synced content shows the number of custom detection rules that are synced across all target tenants.

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