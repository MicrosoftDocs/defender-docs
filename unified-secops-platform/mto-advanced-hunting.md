---
title: Advanced hunting in Microsoft Defender multitenant management
description: Learn about advanced hunting in Microsoft Defender multitenant management
search.appverid: met150
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
- usx-security
ms.topic: article
ms.date: 07/07/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
---

# Advanced hunting in Microsoft Defender multitenant management

Advanced hunting in Microsoft Defender multitenant management allows you to proactively hunt for intrusion attempts and breach activity in email, data, devices, and accounts across multiple tenants and workspaces at the same time. If you have multiple tenants with Microsoft Sentinel workspaces onboarded to the Microsoft Defender portal, search for security information and event management (SIEM) data together with extended detection and response (XDR) data across multiple tenants and workspaces.

Multiple workspaces per tenant are supported in multitenant Advanced hunting as preview.

## Quotas

In multitenant environments, advanced hunting queries can return a maximum of 50,000 records in total. The result set from each individual tenant is capped at 50,000 divided by the number of tenants queried. 

For more information about service limits in advanced hunting, read [Understand advanced hunting quotas](/defender-xdr/advanced-hunting-limits#understand-advanced-hunting-quotas-and-usage-parameters).

## Run cross-tenant queries

You can run any query that you already have access to in the multitenant management **Advanced hunting** page.

1. Queries listed on the **Queries** tab are filtered by tenant. Select a tenant to view the queries available for each one.

1. Load a query in the query editor and select the tenant selector to specify the tenants and workspaces you want to run the query against.

   :::image type="content" source="media/mto-advanced-hunting/mto-cross-tenants-query.png" alt-text="Screenshot of the Microsoft Defender XDR cross tenants advanced hunting query page" lightbox="media/mto-advanced-hunting/mto-cross-tenants-query.png":::

1. In the side pane that opens, select the tenants you want to include in the query. Each tenant supports a single workspace. If you have multiple workspaces onboarded to the Defender portal in your tenant, select **Edit selection** to select the workspace you want to use.

   :::image type="content" source="media/mto-advanced-hunting/mto-cross-tenants-sidepane.png" alt-text="Screenshot of the Microsoft Defender XDR cross tenants advanced hunting query side pane scope" lightbox="media/mto-advanced-hunting/mto-cross-tenants-sidepane.png":::

    When you select multiple tenants, the query runs independently in each tenant, and the combined results are displayed in a single table. For example, the sample query below (`DeviceEvents | take 10`) returns 10 results per tenant, resulting in a total equal to 10 multiplied by the number of tenants selected.
      
1. When you're done, select **Apply** > **Run query**.

   :::image type="content" source="media/mto-advanced-hunting/mto-cross-tenants-query-tenant-id.png" alt-text="Screenshot of the Microsoft Defender XDR ross tenants advanced hunting query scope column" lightbox="media/mto-advanced-hunting/mto-cross-tenants-query-tenant-id.png":::

   The query results contain a column named **TenantId**. If you're using multiple workspaces, the values in this column show the workspace ID instead of the tenant ID. In such cases, we recommend that you use your query to rename the column in your results from **TenantId** to **WorkspaceId** to make it simpler to read. For example: 

   ```kusto
   DeviceEvents
   | take 10
   | project TenantId = WorkspaceID

   Or, to query multiple workspaces in the same tenant, use a query similar to the following:

   ```kusto
   Usage
   | union workspace("WorkpaceA").Usage
   | take 10
   ```

>[!IMPORTANT]
> Running queries across multiple tenants using the `adx(x)` operator will run separate ADX queries per tenant and aggregate them, which might return duplicate results. Use the `adx(x)` operator with multiple tenants only if you need to join tenant results with ADX data. For more information about ADX in Advanced hunting, see [Use Microsoft Sentinel functions, saved queries, and custom rules](/defender-xdr/advanced-hunting-defender-use-custom-rules#use-adx-operator-for-azure-data-explorer-queries).

To learn more about advanced hunting in Microsoft Defender XDR, read [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/defender-xdr/advanced-hunting-overview).

## Run cross-workspace queries

To run queries across multiple workspaces in the same tenant, use the [workspace( ) expression](/azure/azure-monitor/logs/cross-workspace-query#query-across-log-analytics-workspaces-using-workspace), with the workspace identifier as the argument in your query to refer to a table in a different workspace.

If you're using [Azure Lighthouse](/azure/lighthouse/overview) to grant your tenant with permissions to other tenants workspaces, you can also query across both tenants and workspaces. To do so, select only one tenant in the **Tenant scope** selector. Then in the query, use the `workspace()` expression to call the names of any other workspaces you want to query in other tenants. For example, if you have tenants and workspaces named as follows:

- **TenantA**: *WorkspaceA1*, *WorkspaceA2*
- **TenantB**: *WorkspaceB1*, *WorkspaceB2*

And you want to query across both *WorkspaceA1* and *WorkspaceB1*, select **TenantA** and **WorkspaceA1** in the **Tenant scope** selector. Then in your query, use the `workspace()` operator to call *WorkspaceB2*. For example:

```kusto 
union workspace("WorkspaceB2").Usage, Usage
| where TimeGenerated > ago(1d)
| summarize TotalRecords = count() by Workspace = TenantId
```

Results show from both *WorkspaceA1* and *WorkspaceB2*.

For more information, see [Query multiple workspaces](/azure/sentinel/extend-sentinel-across-workspaces-tenants#query-multiple-workspaces) and [Manage workspaces across tenants using Azure Lighthouse](/azure/sentinel/extend-sentinel-across-workspaces-tenants#manage-workspaces-across-tenants-using-azure-lighthouse).

> [!NOTE]
> If you have tables with the same name but different schemas in multiple workspaces and want to use them in the same query, you should use the workspace operator to uniquely identify the table that you need.

## View schema tables

View the [advanced hunting schema tables](/defender-xdr/advanced-hunting-schema-tables) in the left pane inside the advanced hunting page under the **Schema** tab. 

The schema list is a unified view of all tables from all your tenants regardless of the tenant selected in the upper right tenant selector.

This could mean that some tables that appear here might only be available for query in some tenants, like custom Microsoft Sentinel tables.

## View and manage custom detection rules

You can also manage custom detection rules from multiple tenants in the custom detection rules page.

### View custom detection rules by tenant

1. To view custom detection rules, go to the [Custom detection rules page](https://mto.security.microsoft.com/v2/custom_detection) in Microsoft Defender multitenant management.
2. View the **Tenant name** column to see which tenant the detection rule comes from:

   :::image type="content" source="media/mto-advanced-hunting/mto-custom-detection-tenant-name.png" alt-text="Screenshot of the Microsoft Defender XDR multitenant custom detection page." lightbox="media/mto-advanced-hunting/mto-custom-detection-tenant-name.png":::

To view only a specific tenant's custom detection rules, select **Filter**, choose the tenant or tenants and select **Apply**.

To read more about custom detection rules, read [Custom detections overview](/defender-xdr/custom-detections-overview).

### Manage custom detection rules

You can **Run**, **Turn off**, and **Delete** detection rules from Microsoft Defender multitenant management.

To manage detection rules:

1. Go to the [Custom detection rules page](https://mto.security.microsoft.com/v2/custom_detection) in Microsoft Defender multitenant management.
1. Choose the detection rule you want to manage.

   When you select a single detection rule, a flyout panel opens with the detection rule details:

   :::image type="content" source="media/mto-advanced-hunting/custom-detection-rule-details.png" alt-text="Screenshot of the Microsoft Defender XDR custom detection rule details page" lightbox="media/mto-advanced-hunting/custom-detection-rule-details.png":::

1. Select **Open detection rules** to view this rule in a new tab for the specific tenant in the [Microsoft Defender portal](https://security.microsoft.com). To learn more, see [Custom detection rules](/defender-xdr/custom-detection-rules).

## Related content

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
- [Connect Microsoft Sentinel to Microsoft Defender XDR](microsoft-sentinel-onboard.md)
- [View and manage incidents and alerts](mto-incidents-alerts.md)
- [Multiple Microsoft Sentinel workspaces in the Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2310579)
