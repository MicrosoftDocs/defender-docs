---
title: Microsoft Sentinel graph provider library reference
description: A reference for the Microsoft Sentinel graph provider library, including methods and algorithms to create, query, and analyze custom graphs in Microsoft Sentinel.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 11/28/2025
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#customer intent: As a security admin, I want to understand the Sentinel graph provider class so I can create custom graphs in my tenant.

---

# Microsoft Sentinel graph provider reference

The *MicrosoftSentinelGraphProvider* library provides a set of classes and methods to define, build, query, and visualize custom graphs in Sentinel. This library works in the Microsoft Sentinel Visual Studio Code extension using Jupyter notebooks running on Spark pools optimized for graph building and provides a secure way to access data from Sentinel Lake.

Custom graphs are created using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension. For more information see[Install Visual Studio Code and the Microsoft Sentinel extension ](notebooks.md#install-visual-studio-code-and-the-microsoft-sentinel-extension)


To initialize this library, connect to the correct graph pool and import the **GraphBuilder** subpackage as folllows:

```graph
from sentinel_graph.builders.graph_builder import GraphBuilder
```


**Need full usage, params and returns for each method as per sentinel provider class reference doc.**
For example:

### list_tables

List all tables in a given database.

```python
data_provider.list_tables([database_name],[database_id])
   
```

Parameters:
- `database_name` (str, optional): The name of the database (workspace) to list tables from. IF not specified the system tables database is used.
- `database_id` (str, optional): The unique identifier of the database if workspace names aren't unique.

Returns:
- `list[str]`: A list of table names in the specified database.

Examples:

List all tables in the system tables database:


```python
data_provider.list_tables() 
```


List all tables in a specific database. Specify the `database_id` of the database if your workspace names aren't unique:

```python
data_provider.list_tables("workspace1", database_id="ab1111112222ab333333")
```


### Methods

THe following table provides a summary of the supported methods. We plan to introduce additional methods to optimize graph operations.

| Method name | Purpose |
|----|----|
| initialize_graph (start) | Creates a new graph instance |
| add_node / add_edge | Define new node/edge types |
| build_graph_with_data | Builds graph with mapping specifications |
| add_node / add_edge | Define new node/edge types |
| query | Query graph |
| show | Displays graph query results in tabular or graphical formats |
| to_graphframe | Convert results to Graph Frames object |
| to_dataframe |  |
| get | Get the handle of custom graph |
| ?? |  |


#### initialize_graph() 

Create a new graph instance

```graph
from sentinel_graph.builders.graph_builder import GraphBuilder
my_graph = (GraphBuilder.initialize_graph()…
```


### add_node 

Define a new node

```graph
my_graph.add_node("<Nodename>") 
            .from_table(“Tablename”)
            .add_properties("id", "<columnname>", "<columnname>", key="<columnname>", display="<columnname>")

```

### add_edge

Define a new edge type

```graph
my_graph.add_edge("<Edgename>") 
            .from_table(“Tablename”)
            .add_properties("id", "<columnname>", "<columnname>", key="<columnname>", display="<columnname>")

```


#### build_graph

```graph

build_result = my_graph.build_graph_with_data()

print(f"Status: {build_result.get('status')}")

```

#### query()

hTERE IS A WHOLE QUERY LANGUAGE HERE THAT NEEDS TO BE
```graph

query_result = my_graph.query("MATCH (u:user)-\[s:sign_in\]-\>(d:device) RETURN u,s,d LIMIT 10")

query_result.show()
```

#### to_graphframe()

Convert graph query results to a Graph Frames object 

```graph
gf = my_graph.to_graphframe()
```

```graph
\# Sample function: In-degree \[How many edges coming INTO each node\]
gf = my_graph.to_graphframe()
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



## Graph APIs 

### List graphs

This API lists all custom graphs available from your tenant.

**HTTP Method**: GET 
**URL**: https://api.securityplatform.microsoft.com/graphs/custom-graph-instances 


**Request Body**
No request body required. 

**Sample Response**

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
**Response Status Code**

- **200 OK** - List retrieved successfully 

 

## Query a graph

Query a custom graph from your tenant using GQL query language.  
For more information on GQL, see [GQL language guide](/fabric/graph/gql-language-guide).
  
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
