---
title: Filter and split data transformations in Microsoft Sentinel
description: Learn how to use filter and split data transformations to streamline ingestion, reduce costs, and route data between Analytics and Data Lake tiers in Microsoft Sentinel.
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to
ms.date: 03/08/2026

#Customer intent: As a security engineer, I want to filter and split incoming data during ingestion so that I can reduce noise, optimize costs, and route data to the appropriate storage tier.

---

# Filter and split data transformations in Microsoft Sentinel

As security data volumes continue to grow, organizations face the challenge of balancing cost-effective retention of telemetry used for AI, compliance, and investigations while ensuring that only necessary data is retained in high-performance storage tiers. Use Filter and split data transformations in Microsoft Sentinel to address this challenge by modifying data at ingestion time to optimize your data retention strategy.

This article describes how to configure filter and split data transformations to streamline your analytics pipelines in Microsoft Sentinel. These transformations let you tailor data ingestion, improving performance and reducing noise.

Data transformations allow you to optimize your security data pipeline by controlling what data is stored and where it's stored. Using filter and split transformations provides the following benefits:

- **Cost optimization**: Reduce storage and processing costs by filtering out low-value data that doesn't contribute to threat detection. Route less frequently accessed data to cost-effective Data Lake storage while keeping high-priority data in the Analytics tier.

- **Improved SOC efficiency**: Focus your security operations center (SOC) on actionable, high-value events. By removing noise at ingestion time, analysts spend less time sifting through irrelevant logs and more time investigating real threats.

- **Faster query performance**: Smaller datasets in the Analytics tier result in faster query execution times. This improves the responsiveness of your threat hunting, incident investigations, and analytics rules.

- **Compliance and retention flexibility**: Maintain comprehensive data retention for regulatory audits and forensic analysis in the Data Lake tier while optimizing the Analytics tier for operational workloads. This approach satisfies compliance requirements without sacrificing performance.

- **Scalable data management**: As your organization's data volumes grow, transformations help you maintain control over costs and performance. Apply consistent policies across tables to ensure predictable data management.

Filter and split transformations are the first steps in a larger transformation framework that empowers you to evolve your data to fit your needs. For more information about data transformation concepts, see [Custom data ingestion and transformation in Microsoft Sentinel](data-transformation.md).

## Prerequisites

Before you configure filter or split transformation rules, verify the following requirements:

- In the Microsoft Defender portal with unified role-based access control (RBAC), **Data (manage)** permissions under the **Data operations** permissions group.

- For the Microsoft Sentinel workspace, you need **Microsoft.OperationalInsights/workspaces/write** and **Microsoft.OperationalInsights/workspaces/tables/write** permissions to the Log Analytics workspace. These permissions are provided by the **Log Analytics Contributor** built-in role.

### Supported tables

Filter and split transformations have different table support requirements:

- **Filtering**: Supported on any table that supports Data Collection Rules (DCRs).
- **Splitting**: Supported on any table that supports Analytics only ingestion, Data Lake only ingestion, and Data Collection Rules (DCRs).

To verify whether a connector's tables support DCRs, see [Find your Microsoft Sentinel data connector](data-connectors-reference.md).

## Understand filter transformations

Filter transformations enable you to reduce noise by discarding data during ingestion that isn't useful for investigations. Use a filter transformation rule to specify a KQL condition that determines which data is retained and sent to the Analytics tier.

### Filter transformation use cases

Use filter transformations when you need to:

- **Reduce noise**: Focus your SOC on actionable events by filtering out routine, low-severity logs such as "allow" events from firewall logs.
- **Optimize costs**: Lower storage and processing costs by discarding data that doesn't contribute to threat detection.
- **Improve performance**: Speed up queries and streamline analytics by reducing the volume of stored data.

### Example: Filter firewall events

Your enterprise relies on firewall logs to identify anomalies. However, most firewall logs are routine "allow" events with low severity that don't contribute to threat detection. To retain only critical events (blocked traffic, high severity) and filter out low-value logs, create a filter transformation rule with a KQL condition to send only medium or high severity data that isn't "allow" events to the Analytics tier.

## Understand split transformations

Split transformations enable you to route data between the Analytics tier and the Data Lake tier based on specified conditions. Use a split transformation rule to define a KQL expression that determines which data lands in Analytics. Data that doesn't match the expression is routed to the Data Lake tier only.

> [!IMPORTANT]
> When you configure a split transformation, data designated for the Analytics tier is also copied to the Data Lake tier. Data that doesn't match the Analytics criteria goes to the Data Lake tier only. This ensures that all your data remains available in the Data Lake for long-term retention and compliance purposes.

:::image type="content" source="media/data-transformation-filter-split/split-rule-config.png" alt-text="Screenshot showing the split rule configuration dialog in Microsoft Sentinel." lightbox="media/data-transformation-filter-split/split-rule-config.png":::

### Split transformation use cases

Use split transformations when you need to:

- **Optimize storage costs**: Route older or less frequently accessed logs to the Data Lake tier for cost-effective long-term storage.
- **Maintain performance**: Keep recent logs in the Analytics tier for faster queries during active threat hunting.
- **Meet compliance requirements**: Retain historical logs for regulatory audits and forensic analysis without sacrificing operational agility.

### Example: Optimize firewall log storage

Your enterprise ingests millions of firewall log entries daily for threat detection and compliance. Your SOC team needs real-time access to recent logs for active investigations, but must also retain historical logs for regulatory audits. Create a split transformation rule to route real-time data to the Analytics tier and historical data to the Data Lake tier.

## Configure filter transformation rules

Follow these steps to create a filter transformation rule:

1. In the Microsoft Defender portal, go to **Microsoft Sentinel** > **Configuration** > **Tables**.

1. Select a table and then in the side panel, select **Filter rule**.

:::image type="content" source="media/data-transformation-filter-split/table-properties-filter.png" alt-text="Screenshot showing the table properties in Microsoft Sentinel." lightbox="media/data-transformation-filter-split/table-properties-filter.png":::


1. In the side panel, enter a *rule name**.

1. In the **Condition** field, enter a KQL expression that designates which data is filtered out. The KQL expression should evaluate to true for data you don't want to ingest.
1. Set the **rule status** switch to **On** to enable the filter.


> [!IMPORTANT]
> Filters filter data out. Data matching the filter condition is discarded and isn't ingested to either Analytics or Data Lake tiers. Ensure your KQL expression accurately captures the data you want to exclude.

1. To add another condition, select **Add condition** and enter a new KQL expression to filter out data. Multiple conditions are combined with a logical OR, meaning data matching any of the conditions is filtered out.

1. Select **Save** to apply the rule.

1. Verify that the filter rule is applied by checking the **Transformation Rules** column for the table. The column displays **Filter** when a filter rule is active.

:::image type="content" source="media/data-transformation-filter-split/filter-rule.png" alt-text="Screenshot showing the filter rule applied in the table list in Microsoft Sentinel." lightbox="media/data-transformation-filter-split/filter-rule.png":::



## Configure a split transformation rule

Follow these steps to create a split transformation rule:

1. In the Microsoft Defender portal, go to **Microsoft Sentinel** > **Configuration** > **Tables**.

1. Select a table and then select **Split rule**.

1. Enter the following information:

   - **Rule name**: A descriptive name for the split rule.
   - **KQL expression**: The Kusto Query Language expression that designates which data lands in the Analytics tier. Data that doesn't match this expression lands in the Data Lake tier.

1. Select **Save** to apply the rule.

1. Verify that the split rule is applied by checking the **Transformation Rules** column for the table. The column displays **Split** when a split rule is active.

### Configure retention for split tables

After creating a split rule, you can configure retention settings for each tier:

1. Beneath the original table, view the resulting **Analytics** and **Data Lake** split tables.

1. To configure Analytics tier retention:
   - Select the Analytics table.
   - Select **Data retention settings**.
   - Configure the desired retention period and save.

1. To configure Data Lake tier retention:
   - Select the Data Lake table.
   - Select **Data retention settings**.
   - Configure the desired retention period and save.

1. Alternatively, select the original table and configure both Analytics and Data Lake retention from the combined **Data retention settings** dialog.

### Manage rules

To manage existing rules, select the table and then select either **Split rule** or **Filter rule** depending on the rule type you want to manage.
+ To Disable a rule,  select the **Rule status** switch to turn off the rule then select save.
+ Delete a rule by selecting **Delete**.

Verify rules by running KQL queries to confirm that data is being ingested correctly and is being routed to the correct tier.


<!-- ### Pricing example

Consider a scenario where 100 GB enters the pipeline, 50% is filtered out, and the remaining 50% is split between Analytics and Data Lake tiers:

1. **Filtering and routing to Data Lake**: 100% of Data Lake tier data is charged for transformation. The filtered portion incurs no storage cost, while the routed portion is charged only for Data Lake ingestion.

1. **Filtering and routing to Analytics**: Data sent to Analytics isn't charged for transformation. The Analytics portion is stored at standard Analytics tier pricing. -->

## Known limitations

Be aware of the following limitations when using filter and split transformations:

- **XDR table visibility**: Split and filter transformations applied to XDR tables don't appear in Advanced Hunting for the first 30 days of data. The transformations are applied, and once data ages beyond the first 30 days, it behaves normally in Advanced Hunting. Data queried from Log Analytics or Microsoft Sentinel reflects the cost savings immediately.

- **DCR conflicts**: Transformations created in Microsoft Sentinel override transformations created in Azure Monitor using DCRs. Ensure you don't have an existing Azure Monitor DCR applied to a table before creating a new split or filter rule.

- **Propagation delay**: Transformations can take up to one hour to take effect.

- **Table support**: Only tables that support Data Collection Rules (DCRs) support split and filter transformations.

## Related content

- [Custom data ingestion and transformation in Microsoft Sentinel](data-transformation.md)
- [Transform or customize data at ingestion time in Microsoft Sentinel](configure-data-transformation.md)
- [Data collection rules in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview)
- [Sample data collection rules in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-samples)
- [Find your Microsoft Sentinel data connector](data-connectors-reference.md)
