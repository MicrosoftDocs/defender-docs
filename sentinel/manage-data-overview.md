---
title: Manage data tiers and retention in Microsoft Sentinel
description: Manage log data in Microsoft Sentinel and with Microsoft Defender XDR services in the Microsoft Defender portal to optimize security operations and cost efficiency.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: how-to
ms.date: 06/24/2026
# Customer intent: As a Microsoft Defender Portal administrator or subscription owner, I want to configure log table tiers and data retention settings to optimize security operations needs and cost efficiency.
---

# Manage data tiers and retention in Microsoft Sentinel

Data you collect into Microsoft Sentinel (SIEM) and Microsoft Defender XDR is stored in tables. The Microsoft Defender portal lets you manage the retention period and the storage costs associated with your data. You can manage retention and costs when you:

- [Configure data connectors](configure-data-connector.md) to send data to Microsoft Sentinel or Microsoft Defender XDR.
- [Manage your existing tables and data](manage-table-tiers-retention.md).

This article explains how to manage table retention and tier options in the Microsoft Defender portal to optimize security operations and reduce costs in Microsoft Sentinel and Microsoft Defender XDR.

## Which tables can you manage in the Microsoft Defender portal?

This section describes the table types you can manage in the Microsoft Defender portal.

:::image type="content" source="media/manage-data-overview/view-table-properties-microsoft-defender-portal.png" lightbox="media/manage-data-overview/view-table-properties-microsoft-defender-portal.png" alt-text="Screenshot that shows the Table Management screen in the Defender portal.":::

| Table type | Description | Examples | Is in Microsoft Sentinel workspace? |
| --- | --- | --- | --- |
| **Microsoft Sentinel** | Built-in tables, including:<br>- Azure tables, such as AzureDiagnostics and SigninLogs.<br>- Microsoft Sentinel tables.<br>- [Microsoft Defender XDR integration with Microsoft Sentinel](connect-microsoft-365-defender.md?tabs=MDE#connect-events), which are created in your Microsoft Sentinel workspace when you increase the analytics retention period beyond 30 days. See the **XDR** table type for Defender XDR tables that are currently unsupported. | - Azure tables: `AzureDiagnostics`, `SigninLogs`<br>- Microsoft Sentinel tables: `AWSCloudTrail`, `SecurityAlert`<br>- XDR tables: `DeviceEvents`,<br>`AlertInfo` | Yes |
| **Custom** | Tables you create manually or through jobs in your Microsoft Sentinel workspace, including summary rule and search job results tables, and custom data source tables. | Tables with `_CL` or `_SRCH` suffixes. | Yes |
| **XDR** | Tables in the XDR default tier, which have 30 days of analytics retention by default. You can view these tables, but you can't manage them from the Defender portal. | `IdentityInfo` | No |

> [!NOTE]
> You can view Basic Logs tables in your Microsoft Sentinel workspace from the Microsoft Defender portal, but you can currently manage them only from your Log Analytics workspace. To manage these tables from the Microsoft Defender portal, change the table plan from Basic Logs to Analytics in your Microsoft Sentinel workspace.

## How data tiers and retention work

You can retain data in Microsoft Sentinel in one of two tiers:

* **Analytics tier**: This tier makes data available for alerting, hunting, workbooks, and all Microsoft Sentinel features. It retains data in two states:

  - **Analytics retention**: In this "hot" state, data is fully available for real-time analytics, including high-performance queries, analytics rules, and threat hunting. By default, Microsoft Sentinel and Microsoft Defender XDR retain data in this tier for 30 days. You can extend the retention period of all tables to up to two years at a prorated monthly long-term retention charge. You can extend the retention period of Microsoft Sentinel solution tables to 90 days for free.
  - **Total retention**: By default, all data in the analytics tier is mirrored to the data lake for the same retention period. You can extend the retention of your data in the lake beyond the analytics retention, for up to 12 years of total retention at a low cost.

* **Data Lake tier**: In this low-cost "cold" tier, Microsoft Sentinel retains your data in the data lake only. Data in the Data Lake tier isn't available for real-time analytics features and threat hunting. However, you can access data in the lake whenever you need it through [KQL jobs](datalake/kql-jobs.md), analyze trends over time by running scheduled KQL or Spark jobs, and aggregate insights from incoming data at a regular cadence by using summary rules.

* **XDR data**: By default, Microsoft Defender XDR threat hunting data is always available in the Analytics tier for 30 days. You can extend retention of this data in the Analytics tier up to 90 days, which incurs ingestion costs, while storage remains free. Extending retention beyond 90 days in the Analytics tier also incurs storage costs. You can also ingest exclusively into the Data Lake tier, but the data remains available in the Analytics tier for 30 days. Ingesting XDR data directly into the Data Lake tier is more cost-effective, but it involves ingestion, storage, and processing costs. In this option, customers still get 30 days' worth of data in the Analytics tier at no additional cost.

For more information about the differences between these two retention types, see [Compare the analytics and data lake tiers](#compare-the-analytics-and-data-lake-tiers).

This diagram shows the retention components of the analytics, data lake, and XDR default tiers, and which table types apply to each tier:

:::image type="content" source="media/manage-data-overview/tiers-retention-defender-portal.png" lightbox="media/manage-data-overview/tiers-retention-defender-portal.png" alt-text="Diagram that depicts the analytics and data lake tiers in the Microsoft Defender portal.":::

For more information about the Microsoft Sentinel data lake, see [What is Microsoft Sentinel data lake](datalake/sentinel-lake-overview.md).

## Use Table insights for table-level observability

In the Microsoft Defender portal, Table insights is a built-in monitoring view on the Tables page that helps you understand ingestion health at the table level for the selected Microsoft Sentinel workspace. It gives you quick observability signals so you can identify ingestion and cost patterns before you change tier or retention settings.

Table insights includes signals such as:

- Ingestion volume by tier
- Day-over-week ingestion fluctuations
- Top tables by daily ingestion volume
- Last data received
- Estimated daily ingestion cost
- Volume anomaly

Use these signals to detect connector failures, investigate cost spikes, validate new connector onboarding, and identify candidates for right-sizing retention and tier.

> [!IMPORTANT]
> Table insights is a visualization surface for investigation. It isn't a billing-grade or alerting surface.

For setup, access, and interpretation guidance, see [Configure table settings in Microsoft Sentinel](manage-table-tiers-retention.md#use-table-insights-to-monitor-table-health).

## Compare the analytics and data lake tiers

This table compares the Analytics and Data Lake tiers and their key characteristics:

| Comparison                                               | Analytics tier                                                  | Data Lake tier                           |
| ------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
|Key characteristics                                   | High-performance querying and indexing for logs (also known as hot, or interactive retention). | Cost-effective long-term retention of large data volumes (also known as cold storage). |
| Best for                                               | Real-time analytics rules, alerting, hunting, workbooks, and all Microsoft Sentinel features. |  - Compliance and regulatory logging.<br>- Historical trend analysis and forensics.<br>- Low-touch data that's not needed for real-time alerts. |
| Ingestion cost                                         | Standard                                                     | Minimal                                                      |
| Query price included                                   | ✅                                                           | ❌                                                            |
| Optimized query performance                            | ✅                                                           | ❌ Slower queries.<br>Good for auditing. Not optimized for real-time analysis. |
| Query capabilities                                     | [Full query capabilities](/azure/azure-monitor/logs/get-started-queries) in the Microsoft Defender portal, the Azure portal, and by using APIs.    | - [Full query capabilities](/azure/azure-monitor/logs/get-started-queries), including unions and joins.<br>- Run scheduled KQL or Spark jobs.<br>- Use notebooks. |
| Full set of real-time analytics features | ✅                                                           | ❌  Limitations on some features, including analytics rules, hunting queries, parsers, watchlists, workbooks, and playbooks.                                                           |
| [Search jobs](investigate-large-datasets.md)                  | ✅                                                           | ✅                                                            |
| [Summary rules](summary-rules.md)              | ✅                                                           | ✅  [Full KQL on a single table](/azure/azure-monitor/logs/basic-logs-query), which you can extend with data from an analytics table using [lookup](/azure/data-explorer/kusto/query/lookup-operator)                              |
| [Restore](restore.md)                          | ✅                                                           | ❌ KQL and Notebook jobs can promote data to the analytics tier.                                                           |
| [Data export](/azure/azure-monitor/logs/logs-data-export)                     | ✅                                                           | ❌                                                            |
| Retention period                                  | 90 days for Microsoft Sentinel, 30 days for Microsoft Defender XDR.<br> Can be extended to up to two years at a prorated monthly long-term retention charge. | Same as analytics retention, by default. Can be extended to up to 12 years. |

## What happens when you modify table settings

You can switch a table's tier and retention settings at any time.

When you change a table's tier from Analytics to Data Lake, all real-time analytics and hunting queries stop working.

When you shorten a table's total retention, Microsoft waits 30 days before removing the data, so you can revert the change and avoid data loss if you made a configuration error.

When you increase total retention, the new retention period applies to all data that was already ingested into the table and wasn't yet removed.

When you change the analytics retention settings of a table with existing data, the change takes effect immediately.

***Example***:

- You have a table in the Analytics tier with 180 days of analytics retention. By default, total retention is also set to 180 days.
- You change analytics retention to 90 days without changing total retention, which remains 180 days.
- Microsoft Sentinel automatically removes the last 90 days of data from analytics retention, but continues to store data that's 90-180 days old in the Data Lake tier.

## Manage XDR data in Microsoft Sentinel

By default, Microsoft Defender XDR retains threat hunting data in the **XDR default tier** for 30 days. This data isn't ingested into the Analytics or Data Lake tiers by default. If you extend the retention period of supported XDR tables beyond 30 days and up to 90 days, Sentinel ingestion costs apply, but there are no additional storage costs. The tables are created in your Microsoft Sentinel workspace in the Analytics tier and mirrored to the Data Lake tier.

If you enable the Microsoft Sentinel XDR connector in the Azure portal, the tables you select during setup are automatically ingested into the Analytics tier and mirrored to the Data Lake tier. The default retention is 30 days, and you can extend it up to 12 years. For a list of tables, see [Microsoft Defender XDR integration with Microsoft Sentinel](connect-microsoft-365-defender.md?tabs=MDE#connect-events). You can ingest supported XDR tables that you didn't select during connector deployment into the Analytics tier and mirror them to the Data Lake tier by setting retention to more than 30 days.

If you don't enable the Microsoft Sentinel XDR connector, XDR tables aren't automatically ingested, but you can still ingest them by setting Analytics or Data Lake tier retention to more than 30 days in the Microsoft Defender portal.

You can choose to ingest supported XDR tables exclusively into the Data Lake tier by selecting the **Data Lake tier** option when configuring retention settings. For more information, see [Configure data retention and tiering](configure-data-connector.md?tabs=defender-portal#configure-data-retention-and-tiering).

Stop ingesting data into the Analytics tier by resetting analytics retention and total retention to the default 30 days. This action disables the connector in the Azure portal.

For more information about managing your tables and data, see [Manage your existing tables and data](manage-table-tiers-retention.md).

### XDR data retention and costs

The following tables summarize the free retention periods and cost implications for the different tiers in Microsoft Sentinel:

| Tier | Retention | Notes |
| --- | --- | --- |
|Advanced hunting (default)|	30 days	| Default, included in the XDR license. |
|Analytics tier | 31-90 days | Free storage for Sentinel-enabled workspaces. Data is mirrored to the data lake. Sentinel ingestion charges apply.|
|Data Lake tier	| Configurable. By default, the same as the analytics tier. | Free storage when total retention is the same as analytics tier retention.<br>Retaining data in the Data Lake tier beyond analytics tier retention incurs Data Lake tier storage costs.<br>Ingesting data directly into the Data Lake tier incurs ingestion, storage, and processing costs.|

For more information about billing and costs, see [Understand the full billing model for Microsoft Sentinel](billing.md#understand-the-full-billing-model-for-microsoft-sentinel).

In the following examples, XDR data is available through advanced hunting for at least 30 days, regardless of the retention settings in the analytics or data lake tiers.

| Analytics tier retention | Total retention | Analytics tier ingestion costs | Analytics tier storage costs | Data Lake tier costs |
|---|---|---|---|---|
| 30 days default | 30 days default| No additional costs | N/A  | N/A |
| 90 days | 90 days | Costs apply for analytics tier ingestion. | No additional costs. 90 days included free. | No additional costs. Total retention matches analytics tier retention.|
| 90 days | 180 days | Costs apply for analytics tier ingestion. | No additional costs; 90 days included free. | Costs apply for 90 days of additional data lake retention (180 - 90 days). |
| 180 days | 1 year | Costs apply for analytics tier ingestion. | Costs apply for 90 days of additional analytics tier retention. | Costs apply for 185 days of additional data lake retention (365 - 180 days). |
| 0 days (data lake only) | 5 years | N/A | N/A | Costs apply for ingestion and for 5 years of data lake retention. |

## Next steps

Learn more about:

- [Configuring log table tiers and retention settings](manage-table-tiers-retention.md)
- [Creating a search job to retrieve data matching particular criteria](investigate-large-datasets.md)
