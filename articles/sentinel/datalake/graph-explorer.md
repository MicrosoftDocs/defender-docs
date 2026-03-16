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

To access Sentinel Graph, select **Microsoft Sentinel** > **Graph** from the left-hand navigation pane.

:::image type="content" source="media/graph-explorer/graph-explorer-navigation.png" alt-text="Screenshot showing how to access Sentinel Graph from the Microsoft Sentinel navigation pane." lightbox="media/graph-explorer/graph-explorer-navigation.png":::

The Sentinel Graph management page lists any custom graphs that you've created in the Visual Studio Code Sentinel extension. If you haven't yet created a custom graph, see [Create a custom graph mapping](./create-custom-graphs.md) to get started.

If you already created custom graphs, the Sentinel Graph management page displays all available custom graphs. View an overview of each custom graph by selecting the **...** menu on any graph tile.

:::image type="content" source="media/graph-explorer/graph-management-page.png" alt-text="Screenshot showing the Sentinel Graph management page with custom graph tiles." lightbox="media/graph-explorer/graph-management-page.png":::

## Query a custom graph

Decide which custom graph you'd like to query and select **Query graph** to be routed to the graph creation page.

The graph creation page shows you the schema for the graph so you can better understand the mapped relationships you can use when querying. If you're unsure about what to query and want to see the schema in action with live data, it's recommended that you begin with the following generic query that produces a visualization for any custom graph:

```gql
MATCH (x)-[y]->(z)
RETURN *
LIMIT 100
```

For more information on using GQL, see the [GQL help documentation](<!-- LINK HERE -->).

Input your query and select **Run GQL query** to view your results. Once complete, the graph visualization appears.

:::image type="content" source="media/graph-explorer/graph-creation-schema.png" alt-text="Screenshot showing the Sentinel Graph creation page with the schema panel and query input." lightbox="media/graph-explorer/graph-creation-schema.png":::

:::image type="content" source="media/graph-explorer/graph-visualization-results.png" alt-text="Screenshot showing the Sentinel Graph visualization results after running a GQL query." lightbox="media/graph-explorer/graph-visualization-results.png":::

## GQL query guidance

To familiarize yourself with some of the available properties that can be used to draft more complex queries, select the **Table** tab. You can select any cell within the table view to view the underlying JSON, which can be used in subsequent queries.

:::image type="content" source="media/graph-explorer/graph-table-view.png" alt-text="Screenshot showing the table view with query results and underlying JSON data." lightbox="media/graph-explorer/graph-table-view.png":::

In the following example, we look at a Device Process Graph to understand how devices communicate with external IP addresses. Looking at the schema helps you understand the relationships defined within the graph. In this example, we can see that:

- IP addresses are linked to threat intel indicator IPs
- Processes and devices are connected to IP addresses
- Users run processes
- Processes connect to URLs

On the **Schema** tab, you can also select an individual node to see the node details pane that displays the available properties for that node type. Once you start generating queries and produce a graph visualization, you can also view the raw property data by selecting any cell within the **Table** view. Both views provide key information that you can use to draft more advanced queries to surface the insights that you care about most.

:::image type="content" source="media/graph-explorer/graph-schema-node-details.png" alt-text="Screenshot showing the schema tab with node details pane displaying available properties." lightbox="media/graph-explorer/graph-schema-node-details.png":::

With this information, you can draft a more specific query. In the following example, the first line specifies that we're looking for devices that utilize a process that's connected to an IP address. The second line specifies that we're looking for public IPs, narrowing our results to external connected entities that pose a greater threat.

```gql
MATCH (d:Device)-[h]-(p:Process)-[c]->(ip:IPAddress)
WHERE ip.RemoteIPType = 'Public'
RETURN *
LIMIT 1000
```

:::image type="content" source="media/graph-explorer/graph-specific-query.png" alt-text="Screenshot showing the graph visualization for a specific query filtering devices connected to public IP addresses." lightbox="media/graph-explorer/graph-specific-query.png":::

Here's an example of a more granular query with additional search parameters. This query searches for malicious IP addresses and devices communicating with more than one device. The first line searches for devices that connect to IP addresses that are known to be used by threat actors. The `DISTINCT` clause searches for unique IP and device values. The `COLLECT_LIST` groups the device names in a singular column in the Table view, and `DeviceCount` specifies that only IPs with more than one connected device are listed.

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

## Interact with a graph

The following graph capabilities help you traverse a graph and obtain insights from the represented data.

### Node colors

Nodes are color coded according to their type so you can easily visualize the breadth of node types represented on the graph.

### Graph legend

The graph legend displays a list of all nodes represented on the graph and their associated colors. The legend also displays counts so you can understand the number of each node type present on the visualized graph. The legend also lists all applicable edges so you can understand how these nodes connect to one another.

### Node hover

To see the connections associated to a particular node, hover your cursor over the node of interest. This action obfuscates any unrelated nodes and edges, providing a clearer view of the connectivity of the specified node. This action also displays key information about the node. To view more metadata, select the node to see the details.

### Node details

When you select a node, a right-hand pane appears that provides additional data about the node. This data can be used in subsequent queries to create a graph visualization based on specific parameters. For instance, you can limit results to a certain geographic region, department, or "last updated" time frame.

### Rearrange nodes

You can drag nodes across the graph canvas to change their position. You can also recenter the graph with a button on the bottom right of the graph canvas. You can also zoom in or out on the graph using either your cursor or the zoom function on the bottom right of the graph canvas.

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