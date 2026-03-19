---
title: Use federated data sources in Microsoft Sentinel
titleSuffix: Microsoft Security
description: Learn how to view, query, and work with federated data sources in Microsoft Sentinel data lake using the portal, KQL queries, and Jupyter notebooks.
author: EdB-MSFT
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to
ms.date: 03/19/2026
ms.author: edbaynash
ms.collection: ms-security

#Customer intent: As a security analyst, I want to use federated data sources so that I can query external data alongside my Sentinel security data for comprehensive investigations.
---

# Use federated data sources in Microsoft Sentinel

After setting up federated data connectors, you can access your federated tables through multiple interfaces in Microsoft Sentinel. Federated tables are used in the same way as other data lake tables. This article explains how to view federated tables, query them using KQL (Kusto Query Language), and work with them in Jupyter notebooks.

## Prerequisites

Before you begin, ensure:

- You have [set up federated data connectors](data-federation-setup.md) for your external data sources.
- You have appropriate permissions to query data in the Sentinel data lake.

## Understand federated table naming

Federated table names follow the pattern `<tableName>_<connectorInstanceName>`. For example:

| Original table name | Connector instance name | Federated table name |
|---------------------|------------------------|---------------------|
| `widgets` | `ADLS01` | `widgets_ADLS01` |
| `sales_data` | `AzureDBX01` | `sales_data_AzureDBX01` |
| `inventory` | `Fabric01` | `inventory_Fabric01` |

Use the federated table name when querying data from the Sentinel data lake.

## View federated tables in table management

The table management view provides an overview of all tables in your Sentinel data lake, including federated tables.

1. Navigate to **Microsoft Sentinel** > **Configuration** > **Tables**.
1. Select the **Type** filter.
1. Select **Federated** and select **Apply**.

:::image type="content" source="./media/using-data-federation/defender-portal-federated-tables.png" alt-text="Screenshot showing the table management view filtered to show federated tables." lightbox="./media/using-data-federation/defender-portal-federated-tables.png":::


### View table details

Select a table row to open the details panel. The panel contains three tabs:

| Tab | Description |
|-----|-------------|
| **Overview** | Basic information about the federated table, including the source type and connection status. |
| **Data Sources** | Shows which connector instances provide data for this table. |
| **Schema** | Displays the columns, data types, and descriptions for the table's columns. Users with permissions to write to the data lake System tables can select **Refresh schema** to update columns and other schema metadata from the source. |

:::image type="content" source="./media/using-data-federation/federated-table-details.png" alt-text="Screenshot showing the federated table details flyout with overview, data sources, and schema tabs." lightbox="./media/using-data-federation/federated-table-details.png":::

## Query federated tables using KQL

The KQL queries page in Microsoft Sentinel allows you to query federated tables alongside native Sentinel data.

1. Navigate to **Microsoft Sentinel** > **Data lake exploration** > **KQL queries**.

1. Select the **Selected workspace** button in the information bar.
1. Select  **System Tables** as one of the workspaces.
1. In the **Schema** tab, expand the **System tables** section.
1. Expand the **Federated tables** section.
1. Find the federation type for your data source (such as Azure Databricks or Azure Data Lake Storage Gen2).
1. Expand the federation type to see your federated tables.
1. Expand a table to view its columns.

:::image type="content" source="./media/using-data-federation/kql-schema-federated.png" alt-text="Screenshot showing the KQL queries schema tab with federated tables expanded." lightbox="./media/using-data-federation/kql-schema-federated.png":::

### Write and execute queries

Queries against federated tables work like queries against native lake tables with a few important differences:

+ It's possible for a change to occur to the schema of a table in the external source.  This can result in a failure during a query that indicates a column isn’t present. Refresh columns on Table management page by selecting the federated table, selecting the **Schema** tab and selecting **Refresh Schema**.

+ Federated tables without a `TimeGenerated` column, or where a `TimeGenerated` column is present with data in the wrong format, can't be used in data lake explorer to select time ranges in the user interface. Define date filters in the body of the KQL that match your federated table's date format. 

### Create KQL jobs from federated queries

You can create KQL jobs based on queries that use federated tables:

1. Write and test your KQL query using federated tables.
1. Select the **Create job** button in the upper right corner of the query panel.
1. Configure the job settings, including schedule and output destination.
1. Save the job.

> [!NOTE] 
> If federated tables don't contain `TimeGenerated` columns, or your output doesn’t contain a `TimeGenerated` column with a properly formatted date value for each row, KQL queries won't function on the table once its created in the lake. 

Federated tables are fully supported for KQL jobs, async queries, and MCP tools.

## Use federated tables in Jupyter notebooks

Federated tables are accessible in Jupyter notebooks through the Microsoft Sentinel VS Code extension.

In the Microsoft Sentinel VS Code extension, federated tables appear under: **Lake tables** > **System tables** > **Assets**

:::image type="content" source="./media/using-data-federation/vscode-federated-tables.png" alt-text="Screenshot showing federated tables in the Microsoft Sentinel VS Code extension under System tables Assets." lightbox="./media/using-data-federation/vscode-federated-tables.png":::


Working with federated tables in Jupyter notebooks follows the same patterns as native System tables:

1. **Use the full table name**: Reference tables using the `<tableName>_<connectorInstance>` format.
1. **Don't specify a workspace name**: Read operations don't require a workspace specification.
1. **Read-only access**: Federated tables are read-only; you can't write data back to federated sources.

### Jupyter notebook jobs

You can create scheduled Jupyter notebook jobs that utilize federated tables in the same way that you would create a notebook job for native data lake tables: 

1. Develop your notebook with federated table queries.
1. Test the notebook to ensure federated queries execute correctly.
1. Create a job from the notebook.
1. Configure the job schedule and parameters.

> [!NOTE]
> Notebook jobs can only write to Sentinel workspaces or system tables as destinations. You can't write data to a federated table.


## Best practices

### Query optimization

- **Apply filters early**: Filter data at the source when possible to reduce data transfer.
- **Limit result sets**: Use `take` or `limit` clauses during development.
- **Use projections**: Select only the columns you need to improve performance.

**Example: Optimized query**

```kusto
large_dataset_adls_connector
| where EventTime >= ago(1h)           // Filter early
| where EventType == "Login"           // Reduce data volume
| project EventTime, UserId, SourceIP  // Select needed columns
| take 10000                           // Limit results
```

### Join strategies

- **Use appropriate join kinds**: Choose `inner`, `leftouter`, or `rightouter` based on your needs.
- **Filter before joining**: Reduce the data volume before join operations.
- **Consider data sizes**: Place the smaller table on the right side of the join.

### Error handling

- **Check connection status**: Verify federated connector instances are connected before querying.
- **Handle null values**: External data may contain unexpected nulls; use `coalesce()` or `isnull()` functions.
- **Monitor query performance**: Track execution times for federated queries to identify performance issues.

## Troubleshooting

**Query returns no results**

- Verify the connector instance is in a connected state.
- Check that you're using the correct federated table name format.
- Ensure System Tables is selected as the workspace scope in KQL queries.

**Query is slow**

- Apply filters to reduce the data volume queried from external sources.
- Check the external source's performance and availability.
- Consider creating summary tables for frequently accessed data.

**Schema mismatch**

- Review the table schema in the table management view.
- Adjust your query to handle schema differences.
- Check if the external table schema has changed since connector creation.

## Next steps

- [Data federation overview](data-federation-overview.md)
- [Set up federated data connectors](data-federation-setup.md)
- [KQL query reference](kql-jobs-summary-rules-search-jobs.md)
