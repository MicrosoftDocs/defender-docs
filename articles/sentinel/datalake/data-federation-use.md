---
title: Use federated data sources in Microsoft Sentinel
titleSuffix: Microsoft Security
description: Learn how to view, query, and work with federated data sources in Microsoft Sentinel data lake using the portal, KQL queries, and Jupyter notebooks.
author: edbaynash
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to
ms.date: 03/05/2026
ms.author: edbaynash
ms.collection: ms-security

#Customer intent: As a security analyst, I want to use federated data sources so that I can query external data alongside my Sentinel security data for comprehensive investigations.
---

# Use federated data sources in Microsoft Sentinel

After setting up federated data connectors, you can access your federated tables through multiple interfaces in Microsoft Sentinel. This article explains how to view federated tables, query them using KQL, and work with them in Jupyter notebooks.

## Prerequisites

Before you begin, ensure:

- You have [set up federated data connectors](data-federation-setup.md) for your external data sources.
- You have appropriate permissions to query data in the Sentinel data lake.
- The federated connector instances are in a connected state.

## Understand federated table naming

Federated table names follow the pattern `<tableName>_<connectorInstanceName>`. For example:

| Original table name | Connector instance name | Federated table name |
|---------------------|------------------------|---------------------|
| `widgets` | `my_adls_connector` | `widgets_my_adls_connector` |
| `sales_data` | `databricks_prod` | `sales_data_databricks_prod` |
| `inventory` | `fabric_lakehouse` | `inventory_fabric_lakehouse` |

Use the federated table name when querying data from the Sentinel data lake.

## View federated tables in table management

The table management view provides an overview of all tables in your Sentinel data lake, including federated tables.

1. Navigate to **Microsoft Sentinel** > **Configuration** > **Tables**.
1. Select the **Type** filter.
1. Select **Federated** and select **Apply**.

:::image type="content" source="../media/data-federation/tables-federated-filter.png" alt-text="Screenshot showing the table management view filtered to show federated tables." lightbox="../media/data-federation/tables-federated-filter.png":::

Your table list now displays only federated tables.

### View table details

Select a table row to open the details flyout panel. The panel contains three tabs:

| Tab | Description |
|-----|-------------|
| **Overview** | Basic information about the federated table, including the source type and connection status |
| **Data Sources** | Shows which connector instances provide data for this table |
| **Schema** | Displays the columns, data types, and descriptions for the table's columns |

:::image type="content" source="../media/data-federation/table-details-flyout.png" alt-text="Screenshot showing the federated table details flyout with overview, data sources, and schema tabs." lightbox="../media/data-federation/table-details-flyout.png":::

## Query federated tables using KQL

The KQL queries page in Microsoft Sentinel allows you to query federated tables alongside native Sentinel data.

### Access the KQL queries page

1. Navigate to **Microsoft Sentinel** > **Data lake exploration** > **KQL queries**.
1. Select the **Selected workspace** button in the information bar.
1. Ensure **System Tables** is selected as the workspace scope.

:::image type="content" source="../media/data-federation/kql-schema-federated.png" alt-text="Screenshot showing the KQL queries workspace selector with System Tables selected." lightbox="../media/data-federation/kql-schema-federated.png":::

### Locate federated tables in the schema

1. In the **Schema** tab, expand the **System tables** section.
1. Expand the **Federated tables** section.
1. Find the federation type for your data source (such as Azure Databricks or Azure Data Lake Storage Gen2).
1. Expand the federation type to see your federated tables.
1. Expand a table to view its columns.

:::image type="content" source="../media/data-federation/kql-schema-federated.png" alt-text="Screenshot showing the KQL queries schema tab with federated tables expanded." lightbox="../media/data-federation/kql-schema-federated.png":::

### Write and execute queries

1. In the query pane, construct a KQL query that references your federated table.
1. Select **Run query** to execute the query.
1. View the results in the **Results** pane.

**Example: Basic query on a federated table**

```kusto
widgets_my_adls_connector
| take 100
```

**Example: Query with filtering and projection**

```kusto
sales_data_databricks_prod
| where TransactionDate >= ago(30d)
| summarize TotalSales = sum(Amount) by Region
| order by TotalSales desc
```

### View nested data

If your federated data contains nested objects or complex types:

1. Run a query to retrieve the data.
1. In the results pane, expand individual rows to view nested details.
1. Expand complex column values to validate the data structure.

:::image type="content" source="../media/data-federation/kql-nested-data.png" alt-text="Screenshot showing expanded nested data in KQL query results." lightbox="../media/data-federation/kql-nested-data.png":::

### Join federated and native tables

One of the key benefits of federation is the ability to join external data with native Sentinel data lake tables.

**Example: Join federated data with security events**

```kusto
SecurityEvent
| where TimeGenerated >= ago(1d)
| join kind=inner (
    user_data_databricks_prod
    | project UserPrincipalName, Department, CostCenter
) on $left.Account == $right.UserPrincipalName
| project TimeGenerated, Account, Activity, Department, CostCenter
```

**Example: Enrich alerts with external context**

```kusto
SecurityAlert
| where TimeGenerated >= ago(7d)
| extend HostName = tostring(parse_json(ExtendedProperties).HostName)
| join kind=leftouter (
    asset_inventory_adls_connector
    | project HostName, AssetOwner, BusinessUnit, CriticalityLevel
) on HostName
| project TimeGenerated, AlertName, Severity, HostName, AssetOwner, CriticalityLevel
```

### Create KQL jobs from federated queries

You can create KQL jobs based on queries that use federated tables:

1. Write and test your KQL query using federated tables.
1. Select the **Create job** button in the upper right corner of the query panel.
1. Configure the job settings, including schedule and output destination.
1. Save the job.

Federated tables are fully supported for KQL jobs, async queries, and MCP tools.

## Use federated tables in Jupyter notebooks

Federated tables are accessible in Jupyter notebooks through the Microsoft Sentinel VS Code extension.

### Locate federated tables

In the Microsoft Sentinel VS Code extension, federated tables appear under:

**System tables** > **Assets**

:::image type="content" source="../media/data-federation/vscode-federated-tables.png" alt-text="Screenshot showing federated tables in the Microsoft Sentinel VS Code extension under System tables Assets." lightbox="../media/data-federation/vscode-federated-tables.png":::

### Work with federated tables in notebooks

Working with federated tables in Jupyter notebooks follows the same patterns as native System tables:

1. **Use the full table name**: Reference tables using the `<tableName>_<connectorInstance>` format.
1. **Don't specify a workspace name**: Read operations don't require a workspace specification.
1. **Read-only access**: Federated tables are read-only; you can't write data back to federated sources.

**Example: Reading federated data in a notebook**

```python
# Query federated table
df = sentinel.query("widgets_my_adls_connector | take 1000")

# Process the data
df.head()
```

### Save federated data to other tables

Although you can't write to federated tables, you can save processed federated data to other Sentinel tables:

- **System table custom tables** (`_SPRK`): Save to custom tables in the System tables workspace.
- **Analytics custom tables** (`_SPRK_CL`): Save to analytics custom tables.

**Example: Transform and save federated data**

```python
# Query and transform federated data
df = sentinel.query("""
    sales_data_databricks_prod
    | summarize DailySales = sum(Amount) by bin(TransactionDate, 1d), Region
""")

# Save to a custom system table
sentinel.save_dataframe(df, "daily_sales_summary_SPRK")
```

### Create Jupyter notebook jobs

You can create scheduled Jupyter notebook jobs that utilize federated tables:

1. Develop your notebook with federated table queries.
1. Test the notebook to ensure federated queries execute correctly.
1. Create a job from the notebook.
1. Configure the job schedule and parameters.

## Best practices

### Query optimization

- **Apply filters early**: Filter data at the source when possible to reduce data transfer.
- **Limit result sets**: Use `take` or `limit` clauses during development.
- **Use projections**: Select only the columns you need to improve performance.

**Example: Optimized query**

```kusto
large_dataset_adls_connector
| where EventTime >= ago(1h)  // Filter early
| where EventType == "Login"   // Reduce data volume
| project EventTime, UserId, SourceIP  // Select needed columns
| take 10000  // Limit results
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

### Query returns no results

- Verify the connector instance is in a connected state.
- Check that you're using the correct federated table name format.
- Ensure System Tables is selected as the workspace scope in KQL queries.

### Query is slow

- Apply filters to reduce the data volume queried from external sources.
- Check the external source's performance and availability.
- Consider creating summary tables for frequently accessed data.

### Schema mismatch

- Review the table schema in the table management view.
- Adjust your query to handle schema differences.
- Check if the external table schema has changed since connector creation.

## Next steps

- [Data federation overview](data-federation-overview.md)
- [Set up federated data connectors](data-federation-setup.md)
- [KQL query reference](kql-jobs-summary-rules-search-jobs.md)
