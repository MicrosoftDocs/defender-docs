---
title: Use the advanced hunting query resource report
description: Learn how to use advanced hunting query resource report to keep the advanced hunting service responsive
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: how-to
ms.date: 12/18/2025
---

# Use the advanced hunting query resource report

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

The query resources report shows your organization's consumption of CPU resources for hunting based on queries that ran in the last 30 days by using any of the hunting interfaces.

This report is useful for identifying the most resource-intensive queries and understanding how to prevent throttling due to excessive use.

## Understand advanced hunting quotas and usage parameters

To keep the service performant and responsive, advanced hunting sets various quotas and usage parameters (also known as "service limits"). For more information, see [Quotas and usage parameters](advanced-hunting-overview.md#quotas-and-usage-parameters).


## Access the query resources report

You can access the report in two ways:

- In the advanced hunting page, select **Query resources report**:

  :::image type="content" source="./media/advanced-hunting-limits/view-query-resources report.png" alt-text="view the query resources report button in the AH portal" lightbox="./media/advanced-hunting-limits/view-query-resources report.png":::

- In the **Reports** page, find the new report entry in the **General** section.

  :::image type="content" source="./media/advanced-hunting-limits/reports-general-query-resources.png" alt-text="view the query resources report in the Reports section" lightbox="./media/advanced-hunting-limits/reports-general-query-resources.png":::

All users can access the reports. However, only people with Microsoft Entra Security Reader and above roles can see queries done by all users in all interfaces. Other users can only see:

- Queries they ran via the portal
- Public API queries they ran themselves and not through the application
- Custom detections they created

## Query resource report contents

By default, the report table displays queries from the last day. It's sorted by resource usage, so you can easily see which queries used the most CPU resources.

The query resources report includes all queries that ran, along with detailed resource information for each query:

- **Time** – when the query ran
- **Interface** – whether the query ran in the portal, in custom detections, or through API query
- **User/App** – the user or app that ran the query
- **Resource usage** – an indicator of the amount of CPU resources a query used. It can be Low, Medium, or High. High means the query used a large amount of CPU resources and you should improve it to be more efficient.
- **State** – whether the query completed, failed, or was throttled
- **Query time** – how long it took to run the query
- **Time range** – the time range used in the query

> [!TIP]
> If the query state is **Failed**, you can view the reason for the query failure by hovering over the field.

:::image type="content" source="./media/advanced-hunting-limits/excessive-usage-sample.png" alt-text="view inefficient queries" lightbox="./media/advanced-hunting-limits/excessive-usage-sample.png":::

## Find resource-heavy queries

You can probably optimize queries with high resource usage or a long query time to prevent throttling.

The graph displays resource usage over time per interface. You can easily identify excessive usage and select the spikes in the graph to filter the table accordingly. When you select an entry in the graph, the table filters to that specific date.

You can identify the queries that used the most resources on that day and take action to improve them. [Apply query best practices](advanced-hunting-best-practices.md) or educate the user who ran the query or created the rule to take query efficiency and resources into consideration. 

To view a query, select the three dots beside the timestamp of the query you want to check and select **Open in query editor**.

For guided mode, the user needs to [switch to advanced mode](advanced-hunting-query-builder-details.md#switch-to-advanced-mode-after-building-a-query) to edit the query.

The graph supports two views:

- Average use per day –  the average use of resources per day
- Highest use per day – the highest actual use of resources per day

![Two view modes for query resources report](./media/advanced-hunting-limits/resource-usage-over-time.png)

This means that, for instance, if on a specific day you ran two queries, one query used 50% of your resources and the other query used 100%, the average daily use value shows 75%, while the top daily use shows 100%.

## Related articles

- [Advanced hunting best practices](advanced-hunting-best-practices.md)
- [Handle advanced hunting errors](advanced-hunting-errors.md)
- [Advanced hunting overview](advanced-hunting-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
