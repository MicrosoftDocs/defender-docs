---
title: Advanced hunting with Microsoft Sentinel data in Microsoft Defender
description: Learn how to use advanced hunting in the portal unifying Defender XDR and Sentinel data
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
  - usx-security
ms.custom:
- cx-ti
- cx-ah
ms.topic: conceptual
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 02/10/2025
---

# Advanced hunting with Microsoft Sentinel data in Microsoft Defender portal

Advanced hunting allows you to view and query all the data sources available within the [unified Microsoft Defender portal](/defender-xdr/microsoft-365-defender-portal), which include Microsoft Defender XDR and various Microsoft security services. If you onboard Microsoft Sentinel to the Defender portal, you can also access and use all your existing Microsoft Sentinel workspace content, including queries and functions.

Querying from a single portal across different data sets makes hunting more efficient and removes the need for context-switching.

[!INCLUDE [unified-soc-preview](../includes/unified-soc-preview.md)]

## How to access

### Required roles and permissions

You can query data in any workload that you can currently access based on your roles and permissions.

To query across Microsoft Sentinel and Microsoft Defender XDR data in the unified advanced hunting page, you'll also need at least the Microsoft Sentinel Reader role. For more information, see [Microsoft Sentinel-specific roles](/azure/sentinel/roles#microsoft-sentinel-specific-roles).

### Connect a workspace

In Microsoft Defender, you can connect workspaces by selecting **Connect a workspace** in the top banner. This button appears if you're eligible to onboard a Microsoft Sentinel workspace onto the unified Microsoft Defender portal. Follow the steps in: **[Onboarding a workspace](https://aka.ms/onboard-microsoft-sentinel)**. 

After connecting your Microsoft Sentinel workspace and Microsoft Defender XDR advanced hunting data, you can start querying Microsoft Sentinel data from the advanced hunting page. For an overview of advanced hunting features, read [Proactively hunt for threats with advanced hunting](advanced-hunting-overview.md).

## What to expect for Defender XDR tables streamed to Microsoft Sentinel
- **Use tables with longer data retention period in queries** – Advanced hunting follows the maximum data retention period configured for the Defender XDR tables (see [Understand quotas](advanced-hunting-limits.md#understand-advanced-hunting-quotas-and-usage-parameters)). If you stream Defender XDR tables to Microsoft Sentinel and have a data retention period longer than 30 days for said tables, you can query for the longer period in advanced hunting.
- **Use Kusto operators you've used in Microsoft Sentinel** – In general, queries from Microsoft Sentinel work in advanced hunting,  including queries that use the `adx()` operator. There might be cases where IntelliSense warns you that the operators in your query don't match the schema, however, you can still run the query and it should still be executed successfully.
- **Use the time filter dropdown instead of setting the time span in the query** – If you're filtering ingestion of Defender XDR tables to Sentinel instead of streaming the tables as is, don't filter the time in the query as this might generate incomplete results. If you set the time in the query, the streamed, filtered data from Sentinel is used because it usually has the longer data retention period. If you would like to make sure you're querying all Defender XDR data for up to 30 days, use the time filter dropdown provided in the query editor instead. 
- **View `SourceSystem` and `MachineGroup` columns for Defender XDR data that have been streamed from Microsoft Sentinel** – Since the columns `SourceSystem` and `MachineGroup` are added to Defender XDR tables once they're streamed to Microsoft Sentinel, they also appear in results in advanced hunting in Defender. However, they remain blank for Defender XDR tables that weren't streamed (tables that follow the default 30-day data retention period).

> [!NOTE]
> Using the unified portal, where you can query Microsoft Sentinel data after connecting a Microsoft Sentinel workspace, does not automatically mean you can also query Defender XDR data while in Microsoft Sentinel. Raw data ingestion of Defender XDR should still be configured in Microsoft Sentinel for this to happen.

## Where to find your Microsoft Sentinel data
You can use advanced hunting KQL (Kusto Query Language) queries to hunt through Microsoft Defender XDR and Microsoft Sentinel data.

When you open the advanced hunting page for the first time after connecting a workspace, you can find many of that workspace's tables  organized by solution after the Microsoft Defender XDR tables under the **Schema** tab.


:::image type="content" source="/defender/media/advanced-hunting-unified-sentinel-data.png" alt-text="Screenshot of advanced hunting schema tab in the Microsoft Defender portal highlighting location of Sentinel tables" lightbox="/defender/media/advanced-hunting-unified-sentinel-data.png":::


Likewise, you can find the functions from Microsoft Sentinel in the **Functions** tab, and your shared and sample queries from Microsoft Sentinel can be found in the **Queries** tab inside folders marked **Sentinel**.

## View schema information
To learn more about a schema table, select the vertical ellipses ( ![kebab icon](/defender/media/ah-kebab.png) ) to the right of any schema table name under the **Schema** tab, then select **View schema**.

In the unified portal, in addition to viewing the schema column names and descriptions, you can also view:

- Sample data – select **See preview data**, which loads a simple query like `TableName | take 5`
- **Schema type** – whether the table supports full query capabilities (advanced table) or not (basic logs table)
- **Data retention period** – how long the data is set to be kept
- **Tags** – available for Sentinel data tables

:::image type="content" source="/defender/media/advanced-hunting-unified-view-schema.png" alt-text="Screenshot of the schema information pane in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-unified-view-schema.png":::

## Known issues

- The `IdentityInfo table` from [Microsoft Sentinel](/azure/sentinel/ueba-reference#identityinfo-table) isn't available, as the `IdentityInfo` table remains as is in Defender XDR. Microsoft Sentinel features like analytics rules that query this table aren't impacted as they're querying the Log Analytics workspace directly.
- The Microsoft Sentinel `SecurityAlert` table is replaced by `AlertInfo` and `AlertEvidence` tables, which both contain all the data on alerts. While SecurityAlert isn't available in the schema tab, you can still use it in queries using the advanced hunting editor. This provision is made so as not to break existing queries from Microsoft Sentinel that use this table. 
- Guided hunting mode and take actions capabilities are supported for Defender XDR data only.
- Custom detections have the following limitations:
    - Custom detections are not available for KQL queries that do not include Defender XDR data.
    - Near real-time detection frequency is not available for detections that include Microsoft Sentinel data. 
    - Custom functions that were created and saved in Microsoft Sentinel are not supported.
    - Defining entities from Sentinel data is not yet supported in custom detections.
- Bookmarks aren't supported in the advanced hunting experience. They're supported in the **Microsoft Sentinel > Threat management > Hunting** feature. Alternatively, you can use the [Link to incident](advanced-hunting-defender-results.md#link-query-results-to-an-incident) feature to link query results to new or existing incidents.
- If you're streaming Defender XDR tables to Log Analytics, there might be a difference between the`Timestamp` and `TimeGenerated` columns. In case the data arrives to Log Analytics after 48 hours, it's being overridden upon ingestion to `now()`. Therefore, to get the actual time the event happened, we recommend relying on the `Timestamp` column.
- When prompting [Security Copilot](advanced-hunting-security-copilot.md) for advanced hunting queries, you might find that not all Microsoft Sentinel tables are currently supported. However, support for these tables can be expected in the future.


## See also

- [Use advanced hunting functions, saved queries, and custom rules](advanced-hunting-defender-use-custom-rules.md)
- [Work with results containing Microsoft Sentinel data](advanced-hunting-defender-results.md)
