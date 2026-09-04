---
title: Visualize custom graphs in Microsoft Sentinel graph (preview)
description: Learn how to use Microsoft Sentinel graph to query, visualize, and interact with custom security graphs to gain new security insights.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: dandennis
ms.date: 08/07/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015

#Customer intent: As a security analyst, I want to use Microsoft Sentinel graph to query and visualize custom security graphs so that I can gain new insights into entity relationships and threats in my environment.
---

# Visualize graphs in Microsoft Sentinel (preview)

The graphs experience in the Microsoft Defender portal enables you to perform interactive graph-based investigations on your custom graphs, such as using a graph built for phishing analysis to help you quickly evaluate the impact of a recent incident, profile the attacker, and trace its paths across Microsoft telemetry and third-party data. The graphs experience allows you to run graph queries to visualize the insights that matter most to your organization and supports ad hoc traversal of the graph so you can quickly investigate entities of interest. You can study the graph schema to understand the relationships defined on your graph and use any of the displayed metadata to narrow down your results. You can quickly validate your results with the table view and export them for easy integration into any preexisting workflows. Use Jupyter Notebooks in Microsoft Visual Studio Code to create and materialize your custom graphs, then use the graph experience in Microsoft Sentinel to query and visualize your custom graphs.

Use Microsoft Sentinel graph to query, visualize, and interact with graphs to obtain new insights.

## Prerequisites

+ To access the graph experience in Microsoft Sentinel and query the graph experience to produce visualizations, you must have the appropriate permissions. For more information, see [Get started with custom graphs in Microsoft Sentinel](./create-custom-graphs.md#permissions). Users of Sentinel Scope can't access Sentinel Graphs unless they hold one of four highly privileged roles that override scoping: Security Reader, Security Operator, Security Admin, or Global Admin.


## Access graphs

To access the graph experience in Microsoft Sentinel, sign in to the Microsoft Defender portal, select **Microsoft Sentinel** > **Graphs** from the navigation pane.

The Sentinel Graph management page lists custom graphs that you created with the Microsoft Sentinel extension for Visual Studio Code and materialized by publishing a graph job. A graph created only in an interactive notebook session isn't available on this page. If you haven't published a custom graph, see [Create a custom graph](./create-custom-graphs.md) to get started.

If you already created custom graphs, the **Graphs** page in Microsoft Sentinel displays all available custom graphs. View an overview of each custom graph by selecting the **...** menu on any graph tile.

Graphs published by an on-demand graph job are retained for 30 days and then deleted. Scheduled graph jobs rebuild graphs on their configured refresh schedules. If a graph is missing or its data is stale, review the graph job status and schedule in the Microsoft Sentinel extension for Visual Studio Code.

:::image type="content" source="media/graph-visualization/graphs-landing-page.png" alt-text="Screenshot showing how to access Sentinel graph from the Microsoft Sentinel navigation pane." lightbox="media/graph-visualization/graphs-landing-page.png":::


## Query a custom graph

Select **Query graph** on the graph tile to view the graph query page.

Graph queries are billed under the Microsoft Sentinel graph meter. For more information, see [Graph charges](../billing.md#graph-charges).

View the schema to understand the graph ontology – nodes, edges, and their properties available to query.

:::image type="content" source="media/graph-visualization/graph-creation-schema.png" alt-text="Screenshot showing the Sentinel graph creation page with the schema panel and query input." lightbox="media/graph-visualization/graph-creation-schema.png":::

1. Select the **Getting started** tab 

1. A list of suggested queries appears. Select **Edit query** for the **Visualize any graph** query to copy it to the query editor.
   - Enter multiple queries manually or select additional suggested queries.
   - The editor supports undo (Ctrl+Z) and redo (Ctrl+Y).
   - Before running a query, highlight the correct query in the editor.
   - When you type GQL queries manually, the editor suggests predictive values based on your graph's schema.

    This example query, **Visualize any graph**, matches any one‑hop connection in the graph, finding a source node, a directed relationship, and a target node. It returns the full nodes and relationship for up to 100 such matches, making it useful for quickly exploring raw graph structure.


    ```gql
    MATCH (x)-[y]->(z)
    RETURN *
    LIMIT 100
    ```
    For more information on using GQL, see [Graph Query Language (GQL) reference](./gql-reference-for-sentinel-custom-graph.md).

    > [!NOTE]
    > Predefined queries include a default `LIMIT` clause (for example, `LIMIT 100`) that caps the number of results returned. This default keeps initial visualizations responsive, but you see only a subset of your graph data. To see all matching results, edit the query to increase the value or remove the `LIMIT` clause before you run it. Returning large result sets can affect performance, so increase the limit incrementally to find the right balance for your graph.

1. Select **Run GQL query** to view your results. You can cancel a query mid-execution. Copy the content of your query editor cell to share or save the query elsewhere. 

1. When the query finishes, the graph visualization appears. Some queries use operators like `COLLECTLIST` that can't be rendered as a graph. Operators that can't be rendered as a graph are reflected in the table view. When a query uses operators that can't be rendered as a graph, the graph tab displays a message explaining why the graph can't be rendered

1. Select any node to view the node details, including the properties associated with that node. Use this information to inform subsequent queries and visualizations.

    :::image type="content" source="./media/graph-visualization/graph-basic-query.png" lightbox="./media/graph-visualization/graph-basic-query.png"  alt-text="Screenshot showing the Sentinel graph visualization results after running a GQL query.":::

1. Select the **Table** tab to view a tabular representation of your results. Select a row to see the underlying JSON data for each cell.

    :::image type="content" source="media/graph-visualization/basic-query-table.png" alt-text="Screenshot showing the table visualization results after running a GQL query." lightbox="media/graph-visualization/basic-query-table.png":::



## Interact with graphs

Use the following capabilities to traverse and explore your graphs:

### Node colors
Nodes are color-coded by type, making it easy to visualize the different entity types in your graph.

### Graph legend
The graph legend shows all node types in your graph with their corresponding colors and counts. It also lists all edge types, so you can understand how nodes connect to each other.

### Node labels
As you zoom in on the graph, more node labels appear. The first labels to appear are the most heavily connected nodes that are represented by larger circles. As you continue to zoom, more node labels appear in descending order of connectivity.  

### Hover over nodes
When you hover over a node, the graph highlights its connections and hides unrelated nodes and edges so you can clearly see key information and how the node connects to others. A pop-up box appears showing more information about the node.

### Grouping and ungrouping
By default, nodes are grouped on your graph visualization if they are the same node type, and connect to the same origin node by the same edge type. For example, "file" nodes and "accessed by" edges. Grouped nodes are represented by stacked circles on the descriptive layout and diamond shapes on the simplified layout. Node grouping produces a cleaner visualization with fewer nodes, which is important when investigating large graphs. To ungroup nodes, right-click and select **ungroup** to ungroup all nodes. Select the node group to open a right-hand pane of all nodes within that group. Select individual nodes to ungroup, leaving the unselected nodes in their original grouping. To regroup nodes, right-click on any node that was included in the group and select **Regroup**. 

### View node details
Select a node to open a details pane on the right side. Use the metadata shown in the details pane to refine future queries—for example, by filtering on geographic region, department, or last updated date.

### Explore connected assets
Right-click the node, and select **Explore connected assets** to traverse the graph and view the next hop from this node. When viewing the detailed renderer, you can also traverse by clicking the plus "+" icon next to a node.

:::image type="content" source="media/graph-visualization/explore-connected-assets.png" alt-text="Screenshot showing how to explore connected assets by right-clicking a node in the graph visualization." lightbox="media/graph-visualization/explore-connected-assets.png":::


### Filtering a graph

You can use the filters at the top-right of the graph canvas to narrow down the visualized results by node type or edge relationship.

:::image type="content" source="media/graph-visualization/filters.png" lightbox="media/graph-visualization/filters.png" alt-text="Screenshot showing the graph filters for node and edge types.":::


### Sharing graph results 

You can share your query results by selecting **Share query**. From this dropdown menu, you can choose between three options: 

* **Copy link to their last run query:** produces and copies a URL that routes the user to the graph page with the referenced query already in the GQL editor. 
* **Copy link to code**: produces and copies a shareable URL link and the query code content. 
* **Copy graph results**: produces and copies a shareable URL link that automatically runs the query to generate the graph, as well as the query code content and a screenshot of the produced graph. 

You can also create direct links to your graph queries that will open your graph page with the query prefilled and optionally run the query. For more information, see [Create deep links to Microsoft Sentinel graph queries](create-deep-links-graph-queries.md).


## Table view

View a tabular representation of your data by selecting the **Table** tab. From the table, you can:

- Validate that your Graph Query Language (GQL) query produced the desired results.
- Search and sort the table to quickly find entities of interest.
- View the underlying JSON for an individual cell, providing key context that you can use in future queries.
- Export to CSV format for use in other preexisting workflows.

:::image type="content" source="media/graph-visualization/graph-table-export.png" alt-text="Screenshot showing the table view with search, sort, and export capabilities." lightbox="media/graph-visualization/graph-table-export.png":::

Customize the table format by using the `RETURN` operator to define the column structure, or order results to your preference. For more information, see the [GQL documentation](./gql-reference-for-sentinel-custom-graph.md).


<a name="configuration-options"></a>
## Configure graph visualization options

On the bottom right corner of the graph canvas, you can customize your graph visualization with a series of configuration options. 

### Layouts

The first settings button offers a series of customization options for your graph visualization.

<a name="renderer"></a>
#### Choose a graph renderer

To accommodate both targeted investigations and large-scale open exploration, the graph uses two different renderers to produce visualizations. By default, the renderer is set to "auto," which means the graph renders based on the number of displayed nodes. Use either the descriptive or simplified renderer according to your needs. The descriptive renderer is best suited for smaller graphs where detailed granularity is key. It includes small enhancements like plus ("+") icons next to each node for easy graph traversal, and grouped nodes are represented by stacked circles. The simplified renderer is better suited for large graphs with thousands of nodes, scaling for open exploration of the presented data, and represents node groups as diamond shapes. 

The following image demonstrates the difference between the descriptive renderer on the left and the simplified renderer on the right.

:::image type="content" source="media/graph-visualization/renderer-comparison.png" alt-text="Screenshot showing the difference between the descriptive and simplified renderers in graph visualization." lightbox="media/graph-visualization/renderer-comparison.png":::



<a name="layout"></a>
#### Select a graph layout

You have the option to change the layout of your graph from "force" (default) to "directed." The force layout automatically displays nodes based on their connections, producing an interconnected graph where anomalies are easy to identify. The directed layout follows a stricter structure, organizing nodes top-down in a clean, linear manner. The following image demonstrates the directed layout.

:::image type="content" source="media/graph-visualization/directed-layout.png" alt-text="Screenshot showing the directed layout of a graph visualization." lightbox="media/graph-visualization/directed-layout.png":::



<a name="behavior"></a>
#### Configure graph interaction behavior

By default, the "Preserve positions on data change" option is selected. The "Preserve positions on data change" setting ensures that actions like node connection expansion or grouping/ungrouping don't change the positioning of other nodes. Turning off the "Preserve positions on data change" setting shifts the positioning of existing nodes when node connection expansion or grouping and ungrouping actions are taken.

<a name="actions"></a>
#### Available graph actions

Selecting "Realign graph" reverts the graph to its original state.


<a name="layers"></a>
### Configure graph layers

By default, both node and edge labels are visible on the graph, as well as icons for pre-defined graphs. Turn off labels and icons from the settings menu.


### Enter fullscreen

Select fullscreen to view your graph in full screen mode, providing significantly more space with which to explore the visualization. 

### Zoom to fit 

Select the zoom to fit option to reposition your graph so that all nodes are visible and take up the majority of your graph canvas screen. While the "Realign graph" option reverts the graph back to its original state, the zoom to fit option simply fits the graph (with any moved nodes or other customizations) within your screen. 



## Related content

- [Microsoft Sentinel graph overview](sentinel-graph-overview.md)
- [Custom graphs in Microsoft Sentinel](custom-graphs-overview.md)
- [Create custom graphs in Microsoft Sentinel](create-custom-graphs.md)
- [GQL reference for Microsoft Sentinel graph](gql-reference-for-sentinel-custom-graph.md)
- [Create deep links to Microsoft Sentinel graph queries](create-deep-links-graph-queries.md)
