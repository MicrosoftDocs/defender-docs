---
title: Create custom graphs in Microsoft Sentinel
description: Learn how to create and manage custom graphs in Microsoft Sentinel to model attack patterns, investigate threats, and run advanced graph algorithms.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 11/17/2025
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.





Sourin Paul

11/14/2025

DRAFT – Do NOT publish



- Note: Do not publish documentation in production. These will be shared with customers as PDF and hosted internally in **aka.ms/customgraphs (TBD)**

# Summary 

*\[Content for\] In Microsoft Sentinel graph overview (*[link](https://learn.microsoft.com/en-us/azure/sentinel/datalake/sentinel-graph-overview?tabs=defender)*)-\>(after Pricing) add a new section called “Custom Graphs in Microsoft Sentinel”*
---



## Get started with Custom Graphs in Microsoft Sentinel






### Prerequisites

#### Onboard to Microsoft Sentinel graph

To create custom graphs, you must be onboarded to Microsoft Sentinel data lake. For more information, see [Onboard to Microsoft Sentinel data lake](sentinel-lake-onboard-defender.md).

#### Permissions

To interact with custom graphs, you need the following XDR permissions in Sentinel Lake. The following table lists the permission requirements for common graph operations:

| Graph operation| Permissions required|
|---------------------|-------------------------|
| Create and query an temporary graph | Use a [custom Microsoft Defender XDR unified RBAC role with *data (manage)*](https://aka.ms/data-lake-custom-urbac) permissions over the Microsoft Sentinel data collection. |
| Materialize a graph in tenant | Use one of the following Microsoft Entra ID roles:<br>[Security operator](/entra/identity/role-based-access-control/permissions-reference#security-operator)<br>[Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)<br>[Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) |
| Query a materialized graph | Use a [custom Microsoft Defender XDR unified RBAC role with *security data basics (read)*](/defender-xdr/custom-permissions-details) permissions over the Microsoft Sentinel data collection. |

Microsoft Entra ID roles provide broad access across all workspaces in the data lake. For more information, see [Roles and permissions in Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/roles#roles-and-permissions-for-the-microsoft-sentinel-data-lake).

#### Install Visual Studio Code and the Microsoft Sentinel extension 

Custom graphs are created using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension. For more information see[Install Visual Studio Code and the Microsoft Sentinel extension ](notebooks.md#install-visual-studio-code-and-the-microsoft-sentinel-extension)

## Create a custom graph 

>>>>>>>>>> Important: All screenshots must be updated before our final release.

Creating a grpah involves the follwoing steps
1. Create an temporary graph
1. Materialize the graph in your tenant
1. View and manage materialized graphs


### Create an temporary graph

Create a temporary graph using a Jupyter notebook in the Microsoft Sentinel Visual Studio Code extension.


1.  Select the ‘+’ (Create a Graph) icon to create a graph

:::image type="content" source="media/custom-graphs/image1.gif" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

2.  Select “Notebook sample” to create a graph

> \<Screenshot TBD\>

3.  Choose a graph sample to get started

> \<Screenshot TBD\>

4.  The sample notebook walks you through a step-by-step process to create your first graph. Once familiar, you could create new Jupyter notebooks to create graphs.

:::image type="content" source="media/custom-graphs/image2.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

5.  Select the “Graph” kernel so you can access the MicrosoftSentinelGraphProvider library.

:::image type="content" source="media/custom-graphs/image3.png" alt-text="A screenshot of a computer":::

*** Note***

- *Selecting the kernel starts the Spark session and runs the code in the notebook. After selecting the pool, it can take 3-5 mins for the session to start. Subsequent runs are faster as you will have an active session.*

- *The graph libraries are only available in the “Graph” kernel to ensure existing notebook jobs in your environment remain operational.*

6.  Run the first cell in the template, to ensure you can access the latest graph libraries

:::image type="content" source="media/custom-graphs/image4.png" alt-text="A screenshot of a computer program AI-generated content may be incorrect.":::

7.  You can run through the remaining cells in the sample, or refer to [Microsoft Sentinel Graph Provider library](#microsoft-sentinel-graph-provider-reference) to interactively build graphs

8.  Once graph is built, you can query your graph using the below code sample in a cell

:::image type="content" source="media/custom-graphs/image5.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::  
  
  
//////Code block:

\# This shows a sample of 100 elements from the graph as a visual. You can control the sample size with the limit parameter Ex: my_graph.show(limit=50).

my_graph.show()

Congratulations! You have created your first custom graph.

### Materialize graph in your tenant

Once you have created a graph and want to persist it, you can simply store the graph in tenant.

1.  While in the graph notebook, select **Create Scheduled Job**

> :::image type="content" source="media/custom-graphs/image6.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

2.  In the “**Create graph job**” form, enter the **Graph name** and **Description**, and verify the correct graph notebook is included in **Path**.

:::image type="content" source="media/custom-graphs/image7.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

3.  To build the graph without configuring refresh schedule, select **On demand** in the **Schedule** section, then select **Submit** to create the graph.

4.  Alternatively, to customize how often graph data is refreshed, select **Scheduled** in the **Schedule** section.

    1.  Select a **Repeat frequency** for the job. You can choose from **By the minute**, **Hourly**, **Weekly**, **Daily**, or **Monthly**.

    2.  Additional options are displayed to configure the schedule, depending on the frequency you select. For example day of the week, time of day, or day of the month.

    3.  Select a **Start on** time for the schedule to start running.

    4.  Select an **End on** time for the schedule to stop running. If you don't want to set an end time for the schedule, select **Set job to run indefinitely**. Dates and times are in the user's timezone.

    5.  Select **Submit** to save the job configuration and publish the job.

> :::image type="content" source="media/custom-graphs/image8.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

This will initiate the graph building process in your tenant. You can now view the newly created graph and its latest status in the Sentinel extension.

### Viewing and managing materialized graphs

1.  In Microsoft Sentinel extension, select Graphs -\> Custom Graphs -\> and your materialized graph

:::image type="content" source="media/custom-graphs/image9.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

2.  In **Graph details** -\> **Status** field shows the latest status of a graph. Once graph building process is complete, status will change to **‘Ready”**.

:::image type="content" source="media/custom-graphs/image10.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

3.  You can now query the graph in the Query Editor tab.

:::image type="content" source="media/custom-graphs/image11.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

You can learn more about GQL query language \<here\>

For sample graph notebooks that demonstrate how to build graphs from Microsoft Sentinel data lake, see “Graph samples” \<link\>

## Microsoft Sentinel Graph Provider reference

The *MicrosoftSentinelGraphProvider* library provides a set of classes and methods to define, build, query, and visualize custom graphs in Sentinel. This library works in spark pools optimized for graph building and provides a secure way to access data from Sentinel Lake.

Note: Please review the required prerequisites before working with this Sentinel library. \<Link\>

To initialize this library, simply connect to the correct graph pool and import the **GraphBuilder** subpackage

//Code sample:

from sentinel_graph.builders.graph_builder import GraphBuilder

### Methods

Below table provides a summary of currently supported methods. We plan to introduce additional methods to optimize graph operations.

| Method name | Purpose |
|----|----|
| initialize_graph (start) | Creates a new graph instance |
| add_node / add_edge | Define new node/edge types |
| build_graph_with_data | Builds graph with mapping specifications |
| query | Query graph |
| show | Displays graph query results in tabular or graphical formats |
| to_graphframe | Convert results to Graph Frames object |
| to_dataframe |  |
| get | Get the handle of custom graph |
| ?? |  |
| ~~get_schema/get_pipeline~~ | ~~Retrieve schema or ETL pipeline~~ |
| *~~from_query~~* | *~~(coming soon) Use SSQL queries to map node/ edges~~* |
| *~~from_dataframe~~* | *~~(coming soon) Set dataframe as a data source for nodes/edges~~* |

#### initialize_graph() 

```graph
my_graph = (GraphBuilder.initialize_graph()…

add_node / add_edge
//Code sample
.add_node("<Nodename>") | .add_edge("<Edgename>") 
            .from_table(“Tablename”)
            .add_properties("id", "<columnname>", "<columnname>", key="<columnname>", display="<columnname>")

```

#### build_graph()

```graph

build_result = my_graph.build_graph_with_data()

print(f"Status: {build_result.get('status')}")

```

#### query()
```graph

query_result = my_graph.query("MATCH (u:user)-\[s:sign_in\]-\>(d:device) RETURN u,s,d LIMIT 10")

query_result.show()
```

#### to_graphframe()

```graph
gf = my_graph.to_graphframe()

\# Sample function: In-degree \[How many edges coming INTO each node\]

in_degrees = gf.inDegrees

in_degrees.orderBy("inDegree", ascending=False).show(10)
```

#### show()

```graph

query_result = my_graph.query("MATCH (u:user)-\[:sign_in\]-\>(d:device) RETURN u, d LIMIT 10")

query_result.show(format="visual") // “table” – default?
```


### Algorithms

You can run below Sentinel graph algorithms on a custom graph.

####  *centrality()*

Identifies critical nodes in the graph that are most connected and could be vulnerable to adversary attacks.

```graph

my_graph.centrality(CentralityQueryInput(threshold=2))
```

| Parameter | Definition | Required | Default |
|----|----|:--:|:--:|
| threshold | Minimum number of paths an element must participate in to be considered central. | Yes | 3 |
| centrality_type | Calculate centrality for nodes or edges. | No | Node |
| max_paths | Maximum number of paths included for performance; 0 means all paths. | No | 1,000,000 |
| participatingsourcenode_labels | List of labels for source nodes; Null means all labels. | No | Null |
| participatingtargetnode_labels | List of labels for target nodes; Null means all labels. | No | Null |
| participatingedgelabels | List of edge labels for the graph query; Null means all labels. | No | Null |
| is_directional | Treat graph as directional (source → target) or non-directional. | No | TRUE |
| minhopcount | Minimum number of hops for a path. | No | 1 |
| maxhopcount | Maximum number of hops for a path. | No | 4 |
| shortest_path | If true, only shortest paths from source to target are considered. | No | FALSE |
| max_results | Maximum number of results to return. | No | 500 |

#### *blast_radius()*

Measures how far an impact from a node can spread through connected nodes.

```graph
my_graph.k_hop(K_HopQueryInput(source_property_value="user1"))
```


| Parameter | Definition | Required | Default |
|----|----|:--:|:--:|
| source_property | Name of the property in the source node to filter by. | Yes | Null |
| sourcepropertyvalue | Value of the property in the source node to filter by. | Yes | Null |
| participatingsourcenode_labels | List of labels for source nodes; Null means all labels. | No | Null |
| target_property | Name of the property in the target node to filter by. | Yes | Null |
| targetpropertyvalue | Value of the property in the target node to filter by. | Yes | Null |
| participatingtargetnode_labels | List of labels for target nodes; Null means all labels. | No | Null |
| participatingedgelabels | List of edge labels for the graph query; Null means all labels. | No | Null |
| is_directional | Treat graph as directional (source → target) or non-directional. | No | TRUE |
| minhopcount | Minimum number of hops for a path. | No | 1 |
| maxhopcount | Maximum number of hops for a path. | No | 4 |
| shortest_path | If true, only shortest paths from source to target are considered. | No | FALSE |
| max_results | Maximum number of results to return. | No | 500 |

#### prioritized_paths() 

Finds and ranks the most important or optimal paths between nodes based on defined criteria.

*//Code sample - TBD*

| Parameter | Definition | Required | Default |
|----|----|:--:|:--:|
| rankpropertyname | Name of the property in nodes that holds the double value of the rank for that node. | Yes | Null |
| threshold | Minimum rank of the result path to appear in results. | No | 0 |
| max_paths | Maximum number of paths included for performance; 0 means all paths. | No | 1,000,000 |
| decay_factor | Factor by which each graph step reduces rank outcome; 2 means every step halves the rank. | No | 1 |
| is_directional | Treat graph as directional (source → target) or non-directional. | No | TRUE |
| minhopcount | Minimum number of hops for a path. | No | 1 |
| maxhopcount | Maximum number of hops for a path. | No | 4 |
| shortest_path | If true, only shortest paths from source to target are considered. | No | FALSE |
| max_results | Maximum number of results to return. | No | 500 |

#### *k_hop()*

Retrieves all nodes within K steps (hops) from a starting node to analyze local neighborhoods.

*//Code sample - TBD*

| Parameter | Definition | Required | Default |
|----|----|:--:|:--:|
| source_property | Name of the property in the source node to filter by. | Yes (if target_property is not provided) | Null |
| sourcepropertyvalue | Value of the property in the source node to filter by. | Yes\* | Null |
| participatingsourcenode_labels | List of labels for source nodes; Null means all labels. | No | Null |
| target_property | Name of the property in the target node to filter by. | Yes (if source_property is not provided) | Null |
| targetpropertyvalue | Value of the property in the target node to filter by. | Yes\* | Null |
| participatingtargetnode_labels | List of labels for target nodes; Null means all labels. | No | Null |
| participatingedgelabels | List of edge labels for the graph query; Null means all labels. | No | Null |
| is_directional | Treat graph as directional (source → target) or non-directional. | No | TRUE |
| minhopcount | Minimum number of hops for a path. | No | 1 |
| maxhopcount | Maximum number of hops for a path. | No | 4 |
| shortest_path | If true, only shortest paths from source to target are considered. | No | FALSE |
| max_results | Maximum number of results to return. | No | 500 |

# Graph APIs

## List graphs

This API lists all custom graphs available from your tenant.

**HTTP Method:** *GET*   
**URL:**  

*  
Request Body *

No request body required. 

*Sample Response *
```json
{   
  "value": [   
    {   
      "name": "custom_graph_10",   
      "mapFileName": "custom_graph_10",   
      "mapFileVersion": "1.0.0",   
      "graphDefinitionName": "custom_graph_10",   
      "graphDefinitionVersion": "1.0.0",   
      "refreshFrequency": "00:00:00",   
      "createTime": "11/04/2025 22:32:43",   
      "lastUpdateTime": "11/04/2025 22:32:43",   
      "lastSnapshotTime": "2025-11-04T22:34:04.7105015+00:00",   
      "lastSnapshotRequestTime": "2025-11-04T22:32:52.0187838+00:00",   
      "instanceStatus": "Ready",   
      "realizeGraph": **true**   
    },   
    {   
      "name": "notebook_graph_5",   
      "mapFileName": **null**,   
      "mapFileVersion": **null**,   
      "graphDefinitionName": "notebook_graph_5",   
      "graphDefinitionVersion": "1.0.0",   
      "refreshFrequency": "00:00:00",   
      "createTime": "11/04/2025 20:15:22",   
      "lastUpdateTime": "11/04/2025 20:15:22",   
      "lastSnapshotTime": **null**,   
      "lastSnapshotRequestTime": **null**,   
      "instanceStatus": "Creating",   
      "realizeGraph": **true**   
    }   
  ]   
} 
```
*Response Status Code *

- **200 OK** - List retrieved successfully 

 

## Query a graph

Query a custom graph from your tenant using GQL query language.  
  
> [!NOTE] 
> `{graphName}` refers to the "name" of a graph returned from the preceding list or get operation.

**HTTP Method:** *POST*   
**URL:** *<u>https://{endpoint}/graphs/custom-graph-instances/{graphName}/query</u>* 

*  
Request Body Format *
```json
{   
  "query": "string",   
  "queryLanguage": "GQL"   
} 
```
*Sample Request Body *  
  `https://{endpoint}/graphs/custom-graph-instances/{graphName}/query`
```json
{   
  "query": "MATCH (u)-[v]->(w) RETURN * LIMIT 2",   
  "queryLanguage": "GQL"   
} 

*Sample Response *

{   
  "Graph": {   
    "Nodes": [],   
    "Edges": []   
  },   
  "RawData": {   
    "Rows": [   
      {   
        "Cols": [   
          {   
            "Value": "{\n  \\\_id\\: \\sharepoint\\\\system\\\n}",   
            "Metadata": {},   
            "Path": **null**   
          },   
          {   
            "Value": "{\n  \\lastSeen\\: \\2025-10-17T04:42:18.0000000Z\\,\n  \\firstSeen\\: \\2025-10-17T04:42:18.0000000Z\\,\n  \\\_sourceId\\: \\sharepoint\\\\system\\,\n  \\\_targetId\\: \\fea4797a-89d9-4095-8a08-b821d6bfcd8e\\,\n  \\\_label\\: \\Deleted\\,\n  \\\_sourceLabel\\: \\ENTRAUSER\\,\n  \\\_targetLabel\\: \\ONLINEFILE\\\n}",   
            "Metadata": {},   
            "Path": **null**   
          },   
          {   
            "Value": "{\n  \\tenantId\\: \\536279f6-15cc-45f2-be2d-61e352b51eef\\,\n  \\\_id\\: \\fea4797a-89d9-4095-8a08-b821d6bfcd8e\\,\n  \\\_label\\: \\ONLINEFILE\\,\n  \\displayName\\: \\0c8a8c07-a918-4540-ac1d-a78bf7c81a84_LThumb.jpg\\\n}",   
            "Metadata": {},   
            "Path": **null**   
          }   
        ]   
      }   
    ],   
    "ColumnNames": [   
      "u",   
      "v",    
      "w"   
    ]   
  }  
}  
```

*Response Status Code *

- **200 OK** - Query executed successfully 

 

# Appendix:

## Graph samples (TBD)

## Overview of Graph & Sentinel Graph (TBD)
