---
title: Query custom graphs in Microsoft Sentinel Graph (preview)
description: Learn how to use Microsoft Sentinel Graph to query, visualize, and interact with custom security graphs to gain new security insights.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 03/16/2026
ms.topic: how-to 
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#Customer intent: As a security analyst, I want to use Microsoft Sentinel Graph to query and visualize custom security graphs so that I can gain new insights into entity relationships and threats in my environment.
---

# Query custom graphs in Microsoft Sentinel Graph (preview)

Sentinel Graph is a user interface that enables you to visualize disparate datasets by querying a graph mapping. Sentinel Graph allows you to run queries to visualize the insights that matter most to your organization and supports ad hoc traversal of the graph so you can quickly investigate entities of interest. You can study the graph schema to understand the relationships defined on your graph and use any of the displayed metadata to narrow down your results. You can quickly validate your results with the table view and export them for easy integration into any preexisting workflows.  Use the Visual Studio Code Sentinel extension to create your own custom mappings that use tables in the Microsoft Sentinel data lake, then use Sentinel Graph to query and visualize the relationships between the entities in those tables. 

This article explains how to use Sentinel Graph to query, visualize, and interact with graphs to obtain new insights.

> [!IMPORTANT]
> Sentinel Graph is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

## Prerequisites

To access Sentinel Graph and query it to produce visualizations, you must have the appropriate permissions. For more information, see [Roles and permissions in Microsoft Sentinel](roles.md).

## Access Sentinel Graph

To use Sentinel Graph, select **Microsoft Sentinel** > **Graph** from the left-hand navigation pane.

The Sentinel Graph management page lists any custom graphs that you've created in the Visual Studio Code Sentinel extension. If you haven't yet created a custom graph, see [Create a custom graph mapping](./create-custom-graphs.md) to get started.

If you already created custom graphs, the Sentinel Graph management page displays all available custom graphs. View an overview of each custom graph by selecting the **...** menu on any graph tile.

:::image type="content" source="media/graph-explorer/graphs-landing-page.png" alt-text="Screenshot showing how to access Sentinel Graph from the Microsoft Sentinel navigation pane." lightbox="media/graph-explorer/graphs-landing-page.png":::
## Query a custom graph

Select **Query graph** on the graph tile to view the graph query page.

The graph creation page shows the graph schema. Use the schema to understand the mapped relationships when creating a query. 

:::image type="content" source="media/graph-explorer/graph-creation-schema.png" alt-text="Screenshot showing the Sentinel Graph creation page with the schema panel and query input." lightbox="media/graph-explorer/graph-creation-schema.png":::

Start with the following generic query that produces a visualization for any custom graph:

```gql
MATCH (x)-[y]->(z)
RETURN *
LIMIT 100
```

For more information on using GQL, see the [GQL help documentation](<!-- LINK HERE -->).

Paste the query into the quey field and select **Run GQL query** to view your results. Once complete, the graph visualization appears.

Select any node to view the node details, including the properties associated with that node. Use this information to inform subsequent queries and visualizations.

:::image type="content" source="./media/graph-explorer/graph-basic-query.png" lightbox="./media/graph-explorer/graph-basic-query.png"  alt-text="Screenshot showing the Sentinel Graph visualization results after running a GQL query.":::

Select the **Table** tab to view a tabular representation of your results. Select a row to see the underlying JSON data for each cell. 

:::image type="content" source="media/graph-explorer/basic-query-table.png" alt-text="Screenshot showing the table visualization results after running a GQL query." lightbox="media/graph-explorer/basic-query-table.png":::

## GQL query guidance

The following example demonstrates how to query a Device Process Graph to understand device communication with external IP addresses. By examining the schema, you can identify the key relationships within your graph:
- *IP Addresses* are linked to *Threat Intel Indicator IPs*
- *Processes* and *Devices* are connected to *IP Addresses*
- *Users* run *Processes*
- *Processes* connect to *URLs*

You can now draft a more specific query. In the following example, the first line specifies that you're looking for devices that utilize a process that's connected to an IP address. `MATCH (d:Device)-[h]-(p:Process)-[c]->(ip:IPAddress)`
The second line specifies that your're looking for public IPs, narrowing our results to external connected entities that pose a greater threat. `WHERE ip.RemoteIPType = 'Public'`
The last two lines specify that you want to return all available data for the specified query, but limit results to 1000 to ensure the query runs efficiently. `RETURN * LIMIT 1000`

```gql
MATCH (d:Device)-[h]-(p:Process)-[c]->(ip:IPAddress)
WHERE ip.RemoteIPType = 'Public'
RETURN *
LIMIT 1000
```

:::image type="content" source="media/graph-explorer/graph-specific-query.png" alt-text="Screenshot showing the graph visualization for a specific query filtering devices connected to public IP addresses." lightbox="media/graph-explorer/graph-specific-query.png":::

The following is an example of a more granular query with additional search parameters. This query searches for malicious IP addresses and devices communicating with more than one device. The first line searches for devices that connect to IP addresses that are known to be used by threat actors. The `DISTINCT` clause searches for unique IP and device values. The `COLLECT_LIST` groups the device names in a singular column in the **Table** view, and `DeviceCount` specifies that only IPs with more than one connected device are listed.

```gql
MATCH (d:Device)-[c]->(ip:IPAddress)-[l]->(ti:ThreatIntelIndicatorIP)
RETURN DISTINCT ti.ObservableValue, d.display_name
NEXT
RETURN ti.ObservableValue as ObservableValue, COLLECT_LIST(d.display_name) as Devices, COUNT(*) as DeviceCount
NEXT FILTER
DeviceCount > 1
ORDER BY DeviceCount desc
RETURN *
```

:::image type="content" source="media/graph-explorer/table-specific-query.png" alt-text="Screenshot showing the table view for a specific query filtering devices connected to malicious IP addresses." lightbox="media/graph-explorer/graph-specific-query.png":::

## Interact with graphs

Use the following capabilities to traverse and explore your graphs:

**Node colors**
Nodes are color-coded by type, making it easy to visualize the different entity types in your graph.

**Graph legend**
The graph legend shows all node types in your graph with their corresponding colors and counts. It also lists all edge types, so you can understand how nodes connect to each other.

**View node details**
Select a node to open a details pane on the right side. Use the metadata shown here to refine future queries—for example, by filtering on geographic region, department, or last updated date.
:::image type="content" source="media/graph-explorer/graph-legend.png" lightbox="media/graph-explorer/graph-legend.png" alt-text="Screenshot showing the graph legend with node and edge types.":::

**Hover over nodes**
Hover over a node to highlight its connections. This hides unrelated nodes and edges for a clearer view of the node's connectivity and displays key node information.

**Rearrange and zoom**
- Drag nodes to reposition them on the canvas
- Use the recenter button in the bottom right to reset the view
- Zoom in or out using your cursor or the zoom controls in the bottom right

### Table view

You can view a tabular representation of your data by selecting the **Table** tab. From the table, you can:

- Validate that your GQL query produced the desired results.
- Search and sort the table to quickly find entities of interest.
- View the underlying JSON for an individual cell, providing key context you can use in future queries.
- Export to CSV format for use in other preexisting workflows.

:::image type="content" source="media/graph-explorer/graph-table-export.png" alt-text="Screenshot showing the table view with search, sort, and export capabilities." lightbox="media/graph-explorer/graph-table-export.png":::

You can also customize the table format by using the `RETURN` operator to define the column structure, or order results to your preference. For more information, see the [GQL documentation](<!-- LINK HERE -->).

## Related content

- [Microsoft Sentinel overview](overview.md)
- [Investigate incidents with Microsoft Sentinel](investigate-incidents.md)