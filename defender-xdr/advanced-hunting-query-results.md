---
title: Work with advanced hunting query results in Microsoft Defender
description: Make the most of the query results returned by advanced hunting in Microsoft Defender
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
  - tier1
ms.custom:
- cx-ti
- cx-ah
ms.topic: how-to
ms.date: 10/18/2024
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Work with advanced hunting query results

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

While you can construct your [advanced hunting](advanced-hunting-overview.md) queries to return precise information, you can also work with the query results to gain further insight and investigate specific activities and indicators. You can take the following actions on your query results:

- View results as a table or chart
- Export tables and charts
- Drill down to detailed entity information
- Tweak your queries directly from the results

## View query results as a table or chart

By default, advanced hunting displays query results as tabular data. You can also display the same data as a chart. Advanced hunting supports the following views:

| View type | Description |
|--|--|
| **Table** | Displays the query results in tabular format |
| **Column chart** | Renders a series of unique items on the x-axis as vertical bars whose heights represent numeric values from another field |
| **Pie chart** | Renders sectional pies representing unique items. The size of each pie represents numeric values from another field. |
| **Line chart** | Plots numeric values for a series of unique items and connects the plotted values |
| **Scatter chart** | Plots numeric values for a series of unique items |
| **Area chart** | Plots numeric values for a series of unique items and fills the sections below the plotted values |
| **Stacked area chart** | Plots numeric values for a series of unique items and stacks the filled sections below the plotted values  |
| **Time chart** | Plots values by count on a linear time scale |

### Construct queries for effective charts

When rendering charts, advanced hunting automatically identifies columns of interest and the numeric values to aggregate. To get meaningful charts, construct your queries to return the specific values you want to see visualized. Here are some sample queries and the resulting charts.

#### Alerts by severity

Use the `summarize` operator to obtain a numeric count of the values you want to chart. The query below uses the `summarize` operator to get the number of alerts by severity.

```kusto
AlertInfo
| summarize Total = count() by Severity
```

When rendering the results, a column chart displays each severity value as a separate column:


```kusto
AlertInfo
| summarize Total = count() by Severity
| render columnchart
```

:::image type="content" source="/defender/media/advanced-hunting-column-chart-new.png" alt-text="An example of a chart that displays advanced hunting results in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-column-chart-new.png":::

#### Phishing emails across top ten sender domains

If you're dealing with a list of values that isn't finite, you can use the `Top` operator to chart only the values with the most instances. For example, to get the top 10 sender domains with the most phishing emails, use the query below:

```kusto
EmailEvents
| where ThreatTypes has "Phish"
| summarize Count = count() by SenderFromDomain
| top 10 by Count
```

Use the pie chart view to effectively show distribution across the top domains:

:::image type="content" source="/defender/media/advanced-hunting-pie-chart-new.png" alt-text="The pie chart that displays advanced hunting results in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-pie-chart-new.png":::


#### File activities over time
Using the `summarize` operator with the `bin()` function, you can check for events involving a particular indicator over time. The query below counts events involving the file `invoice.doc` at 30-minute intervals to show spikes in activity related to that file:

```kusto
CloudAppEvents
| union DeviceFileEvents
| where FileName == "invoice.doc"
| summarize FileCount = count() by bin(Timestamp, 30m)
```

The line chart below clearly highlights time periods with more activity involving `invoice.doc`:

:::image type="content" source="/defender/media/line-chart-a.png" alt-text="The line chart that displays advanced hunting results in the Microsoft Defender portal" lightbox="/defender/media/line-chart-a.png":::


## Export tables and charts

After running a query, select **Export** to save the results to local file. Your chosen view determines how the results are exported:

- **Table view**—The query results are exported in tabular form as a Microsoft Excel workbook
- **Any chart**—The query results are exported as a JPEG image of the rendered chart

## Filter results

After running a query, select **Filter** to narrow down the results. 

:::image type="content" source="/defender/media/add-filter1.png" alt-text="Screenshot of filters in advanced hunting." lightbox="/defender/media/add-filter1.png":::

To add a filter, select the data you want to filter for by selecting one or more of the check boxes. Then select **Add**.

:::image type="content" source="/defender/media/add-filter2.png" alt-text="Screenshot of filters dropdown in advanced hunting." lightbox="/defender/media/add-filter2.png":::

You can narrow the results down even further to specific data by selecting the newly added filter. 

:::image type="content" source="/defender/media/add-filter3.png" alt-text="Screenshot of new filter pill in advanced hunting." lightbox="/defender/media/add-filter3.png":::

This opens a dropdown showing the possible filters you can use further. Select one or more of the check boxes, then select **Apply**.

:::image type="content" source="/defender/media/add-filter4.png" alt-text="Screenshot of new filter's dropdown in advanced hunting." lightbox="/defender/media/add-filter4.png":::

Confirm that you have added the filters that you wanted by checking the Filters section. 

:::image type="content" source="/defender/media/add-filter5.png" alt-text="Screenshot of filters added advanced hunting." lightbox="/defender/media/add-filter5.png":::

## Drill down from query results

You can also explore the results in-line with the following features:
- Expand a result by selecting the dropdown arrow at the left of each result
- Where applicable, expand details for results that are in JSON and array formats by selecting the dropdown arrow at the left of applicable column names for added readability
- Open the side pane to see a record's details (concurrent with expanded rows)



:::image type="content" source="/defender/media/advanced-hunting-query-results-expand.png" alt-text="Screenshot of expanding results to drill down" lightbox="/defender/media/advanced-hunting-query-results-expand.png":::

You can also right-click on any result value in a row so that you can use it to add more filters to the existing query or copy the value for use in further investigation. 

:::image type="content" source="/defender/media/advanced-hunting-query-results-rightclick.png" alt-text="Screenshot of options upon right-clicking an option" lightbox="/defender/media/advanced-hunting-query-results-rightclick.png":::

Furthermore, for JSON and array fields, you can right-click and update the existing query to include or exclude the field, or to extend the field to a new column.

:::image type="content" source="/defender/media/advanced-hunting-query-results-json-right.png" alt-text="Screenshot of options upon right-clicking an option for JSON and array fields" lightbox="/defender/media/advanced-hunting-query-results-json-right.png":::


To quickly inspect a record in your query results, select the corresponding row to open the **Inspect record** panel. The panel provides the following information based on the selected record:

- **Assets**—Summarized view of the main assets (mailboxes, devices, and users) found in the record, enriched with available information, such as risk and exposure levels
- **All details**—All the values from the columns in the record

:::image type="content" source="/defender/media/results-inspect-record.png" alt-text="The selected record with panel for inspecting the record in the Microsoft Defender portal" lightbox="/defender/media/results-inspect-record.png":::

To view more information about a specific entity in your query results, such as a machine, file, user, IP address, or URL, select the entity identifier to open a detailed profile page for that entity.

## Tweak your queries from the results

Select the three dots to the right of any column in the **Inspect record** panel. You can use the options to:

- Explicitly look for the selected value (`==`)
- Exclude the selected value from the query (`!=`)
- Get more advanced operators for adding the value to your query, such as `contains`, `starts with`, and `ends with`

:::image type="content" source="/defender/media/work-with-query-tweak-query.png" alt-text="Screenshot of the Action Type pane on the Inspect record page in the Microsoft Defender portal." lightbox="/defender/media/work-with-query-tweak-query.png":::



## Add items to Favorites
You can add your frequently used schemas, functions, queries, and detection rules to the Favorites section of each tab in the advanced hunting page for quick access.

:::image type="content" source="media/faves-1.png" alt-text="Screenshot of the advanced hunting page with the Favorites section highlighted." lightbox="media/faves-1.png":::

For instance, to add `AlertInfo` to your **Favorites**, go to the **Schema** tab, and select the three dots to the right of the table and select **Add to favorites**. 

:::image type="content" source="media/faves-2.png" alt-text="Screenshot of the Add to Favorites option in the advanced hunting page." lightbox="media/faves-2.png":::

A notification appears to inform you that the item was successfully added to Favorites.

![Screenshot of notification that a new item was added to Favorites in advanced hunting.](media/faves-3.png)

You can do the same for your saved functions, queries, and custom detections in their respective Favorites sections right under each tab (**Functions**, **Queries**, and **Detection Rules**).

> [!NOTE]
> Some tables in this article might not be available at Microsoft Defender for Endpoint. [Turn on Microsoft Defender XDR](m365d-enable.md) to hunt for threats using more data sources. You can move your advanced hunting workflows from Microsoft Defender for Endpoint to Microsoft Defender XDR by following the steps in [Migrate advanced hunting queries from Microsoft Defender for Endpoint](advanced-hunting-migrate-from-mde.md).

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
- [Custom detections overview](custom-detections-overview.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
