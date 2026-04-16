---
title: Advanced hunting with Microsoft Sentinel data in Microsoft Defender
description: Learn how to use advanced hunting in the portal unifying Defender XDR and Sentinel data
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
  - usx-security
ms.custom:
- cx-ti
- cx-ah
ms.topic: concept-article
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 04/14/2026
---

# Advanced hunting with Microsoft Sentinel data in Microsoft Defender portal

Advanced hunting enables you to view and query all the data sources available within the [unified Microsoft Defender portal](/defender-xdr/microsoft-365-defender-portal). These data sources include Microsoft Defender XDR and various Microsoft security services. If you onboard Microsoft Sentinel to the Defender portal, you can also access and use all your existing Microsoft Sentinel workspace content, including queries and functions.

Querying from a single portal across different data sets makes hunting more efficient and removes the need for context-switching.

[!INCLUDE [unified-soc-preview](../includes/unified-soc-preview.md)]

> [!NOTE]
> After onboarding to the Microsoft Sentinel data lake, Microsoft Defender advanced hunting no longer supports auxiliary log tables. Instead, you can access them through data lake exploration KQL queries in the Defender portal. For more information, see [KQL queries in the Microsoft Sentinel data lake](/azure/sentinel/datalake/kql-queries).

## How to access

### Required roles and permissions

You can query data in any workload that you can currently access based on your roles and permissions.

To query across Microsoft Sentinel and Microsoft Defender XDR data in the unified advanced hunting page, you need at least the Microsoft Sentinel Reader role. For more information, see [Microsoft Sentinel-specific roles](/azure/sentinel/roles#microsoft-sentinel-specific-roles).

### Connect a workspace

In Microsoft Defender, you can connect workspaces by selecting **Connect a workspace** in the top banner. This button appears if you're eligible to onboard a Microsoft Sentinel workspace onto the unified Microsoft Defender portal. Follow the steps in: **[Onboarding a workspace](https://aka.ms/onboard-microsoft-sentinel)**. 

After connecting your Microsoft Sentinel workspace and Microsoft Defender XDR advanced hunting data, you can start querying Microsoft Sentinel data from the advanced hunting page. For an overview of advanced hunting features, read [Proactively hunt for threats with advanced hunting](advanced-hunting-overview.md).

## What to expect for Defender XDR tables streamed to Microsoft Sentinel
- **Use tables with longer data retention periods in queries** – Advanced hunting follows the maximum data retention period you set for the Defender XDR tables (see [Understand quotas](advanced-hunting-limits.md#understand-advanced-hunting-quotas-and-usage-parameters)). If you [stream Defender XDR tables](/defender-xdr/streaming-api) to Microsoft Sentinel and set a data retention period longer than 30 days for those tables, you can query for the longer period in advanced hunting.
- **Use Kusto operators you use in Microsoft Sentinel** – In general, queries from Microsoft Sentinel work in advanced hunting, including queries that use the `adx()` operator. IntelliSense might warn you that the operators in your query don't match the schema. However, you can still run the query and it should execute successfully.
- **Use the time filter dropdown instead of setting the time span in the query** – If you're filtering ingestion of Defender XDR tables to Sentinel instead of streaming the tables as is, don't filter the time in the query as this action might generate incomplete results. If you set the time in the query, the streamed, filtered data from Sentinel is used because it usually has the longer data retention period. If you want to make sure you're querying all Defender XDR data for up to 30 days, use the time filter dropdown provided in the query editor instead. 
- **View `SourceSystem` and `MachineGroup` columns for Defender XDR data that you stream from Microsoft Sentinel** – Since the columns `SourceSystem` and `MachineGroup` are added to Defender XDR tables once you stream them to Microsoft Sentinel, they also appear in results in advanced hunting in Defender. However, they remain blank for Defender XDR tables that you don't stream (tables that follow the default 30-day data retention period).

> [!NOTE]
> Using the unified portal, where you can query Microsoft Sentinel data after connecting a Microsoft Sentinel workspace, doesn't automatically mean you can also query Defender XDR data while in Microsoft Sentinel. You still need to configure raw data ingestion of Defender XDR in Microsoft Sentinel for this to happen.

> [!IMPORTANT]
> Microsoft Government Community Cloud Moderate (GCC-M) customers should be aware of the following limitation in advanced hunting:
> - Queries that reference both Microsoft Sentinel and Defender XDR tables aren't supported. If you use _Search_ or _Union *_ in your queries, consider replacing the _*_ with an explicit list of tables that are limited to Microsoft Sentinel only or Defender XDR only.

## Where to find your Microsoft Sentinel data
You can use advanced hunting KQL (Kusto Query Language) queries to hunt through Microsoft Defender XDR and Microsoft Sentinel data.

When you open the advanced hunting page for the first time after connecting a workspace, you can find many of that workspace's tables  organized by solution after the Microsoft Defender XDR tables under the **Schema** tab.


:::image type="content" source="./media/advanced-hunting-microsoft-defender/advanced-hunting-unified-sentinel-data.png" alt-text="Screenshot of advanced hunting schema tab in the Microsoft Defender portal highlighting location of Sentinel tables" lightbox="./media/advanced-hunting-microsoft-defender/advanced-hunting-unified-sentinel-data.png":::


Likewise, you can find the functions from Microsoft Sentinel in the **Functions** tab, and your shared and sample queries from Microsoft Sentinel can be found in the **Queries** tab inside folders marked **Sentinel**.

## View schema information
To learn more about a schema table, select the vertical ellipses ( ![kebab icon](/defender/media/ah-kebab.png) ) to the right of any schema table name under the **Schema** tab, and then select **View schema**.

In the unified portal, you can view the schema column names and descriptions, as well as the following information:

- Sample data – select **See preview data**, which loads a simple query like `TableName | take 5`
- **Schema type** – whether the table supports full query capabilities (advanced table) or not (basic logs table)
- **Data retention period** – how long the data is set to be kept
- **Tags** – available for Sentinel data tables

:::image type="content" source="./media/advanced-hunting-microsoft-defender/advanced-hunting-unified-view-schema.png" alt-text="Screenshot of the schema information pane in the Microsoft Defender portal" lightbox="./media/advanced-hunting-microsoft-defender/advanced-hunting-unified-view-schema.png":::

## Known issues

- The Microsoft Sentinel `SecurityAlert` table is replaced by `AlertInfo` and `AlertEvidence` tables, which both contain all the data on alerts. While `SecurityAlert` isn't available in the schema tab, you can still use it in queries by using the advanced hunting editor. This provision prevents existing queries from Microsoft Sentinel that use this table from breaking. 
- Guided hunting mode and take actions capabilities support Defender XDR data only.
- Custom detections have the following limitations:
    - Near real-time detection frequency isn't available for detections that include Microsoft Sentinel data. 
    - Custom functions that you create and save in Microsoft Sentinel aren't supported.
- Bookmarks aren't supported in the advanced hunting experience. They're supported in the **Microsoft Sentinel > Threat management > Hunting** feature. Alternatively, you can use the [Link to incident](advanced-hunting-defender-results.md#link-query-results-to-an-incident) feature to link query results to new or existing incidents.
- If you're streaming Defender XDR tables to Log Analytics, there might be a difference between the `Timestamp` and `TimeGenerated` columns. If the data arrives to Log Analytics after 48 hours, the ingestion process overrides it to `now()`. Therefore, to get the actual time the event happened, rely on the `Timestamp` column.
- When prompting [Security Copilot](advanced-hunting-security-copilot.md) for advanced hunting queries, you might find that not all Microsoft Sentinel tables are currently supported. However, support for these tables can be expected in the future.


## See also

- [Use advanced hunting functions, saved queries, and custom rules](advanced-hunting-defender-use-custom-rules.md)
- [Work with results containing Microsoft Sentinel data](advanced-hunting-defender-results.md)
