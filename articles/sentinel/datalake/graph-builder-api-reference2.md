---
title: Microsoft Sentinel Graph Builder API reference
description: Reference documentation for the Microsoft Sentinel Graph Builder API for building and querying security graphs.
author: EdB-MSFT
ms.author: edbaynash
ms.topic: reference
ms.date: 01/11/2026
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#Customer intent: As a security analyst or engineer, I want to use the Graph Builder API to create and query security graphs so that I can perform advanced threat analysis and investigation.

---

# Microsoft Sentinel Graph Builder API reference

The Graph Builder API provides a fluent interface for building graph specifications with nodes and edges, configuring ETL pipelines for data ingestion, querying graphs using GQL (Graph Query Language), running graph algorithms, and visualizing graph data. This API is part of the `sentinel_graph` module.

```python
from sentinel_graph.builders import GraphSpecBuilder

builder = GraphSpecBuilder.start(context=context)
```

## GraphSpecBuilder

The `GraphSpecBuilder` class provides a fluent builder interface for creating graph specifications with ETL pipelines and schema integration.

### start

Create a new fluent graph builder instance.

```python
GraphSpecBuilder.start([context])
```

Parameters:
- `context` (ExecutionContext, optional): ExecutionContext instance. If None, uses default context.

Returns:
- `GraphSpecBuilder`: New builder instance.

Example:

```python
builder = GraphSpecBuilder.start(context=context)
```

### add_node

Start building a node definition.

```python
builder.add_node(alias)
```

Parameters:
- `alias` (str): Unique identifier for this node within the graph.

Returns:
- `NodeBuilderInitial`: Node builder in initial state.

Example:

```python
builder.add_node("user")
```

### add_edge

Start building an edge definition.

```python
builder.add_edge(alias)
```

Parameters:
- `alias` (str): Identifier for this edge within the graph. Can be shared across multiple edges.

Returns:
- `EdgeBuilderInitial`: Edge builder in initial state.

Example:

```python
builder.add_edge("accessed")
```

### done

Finalize graph specification and return a `GraphSpec` instance.

```python
builder.done()
```

Returns:
- `GraphSpec`: Complete graph specification with ETL pipeline and schema.

Example:

```python
graph_spec = builder.done()
```

## GraphSpec

The `GraphSpec` class represents a complete graph specification with ETL pipeline, schema, and query/visualization capabilities. It extends the `Graph` class.

### nodes

Get nodes DataFrame. Lazy loaded and cached. Automatically determines source from ETL pipeline or lake table.

```python
graph_spec.nodes
```

Returns:
- `DataFrame`: Spark DataFrame containing all nodes.

Example:

```python
nodes_df = graph_spec.nodes
nodes_df.show(10)

# Filter nodes by label
user_nodes = nodes_df.filter(nodes_df.label == "user")
print(f"Total users: {user_nodes.count()}")
```

### edges

Get edges DataFrame. Lazy loaded and cached. Automatically determines source from ETL pipeline or lake table.

```python
graph_spec.edges
```

Returns:
- `DataFrame`: Spark DataFrame containing all edges.

Example:

```python
edges_df = graph_spec.edges
edges_df.show(10)

# Filter edges by type
access_edges = edges_df.filter(edges_df.label == "accessed")
print(f"Total access relationships: {access_edges.count()}")
```

### build_graph_with_data

Execute the ETL pipeline and create a graph instance via API.

```python
graph_spec.build_graph_with_data()
```

Returns:
- `dict`: Dictionary containing `etl_result`, `api_result`, `instance_name`, and `status` (`"success"` or `"etl_only"`).

Example:

```python
result = graph_spec.build_graph_with_data()
print(f"Status: {result['status']}")
```

### get_schema

Get the graph schema.

```python
graph_spec.get_schema()
```

Returns:
- `GraphSchema`: Graph schema definition.

### to_graphframe

Convert entire graph to GraphFrame for running graph algorithms.

```python
graph_spec.to_graphframe([column_mapping])
```

Parameters:
- `column_mapping` (dict, optional): Custom column mapping with keys `"id"`, `"source_id"`, and `"target_id"`.

Returns:
- `GraphFrame`: GraphFrame object with all vertices and edges.

Example:

```python
gf = graph_spec.to_graphframe()
pagerank = gf.pageRank(resetProbability=0.15, maxIter=10)
```

### show

Display graph data in various formats.

```python
graph_spec.show([limit], [viz_format])
```

Parameters:
- `limit` (int, optional): Maximum nodes/edges to display. Default: `100`.
- `viz_format` (str, optional): Output format. Default: `"visual"`. Supported values: `"table"`, `"visual"`, `"all"`.

Example:

```python
graph_spec.show(limit=50, viz_format="table")
```

## Graph

The `Graph` class represents a graph instance for querying existing graphs. It serves as the base class for `GraphSpec`.

### get

Gets a graph instance from an existing graph.

```python
Graph.get(name, [context])
```

Parameters:
- `name` (str): Graph instance name.
- `context` (ExecutionContext, optional): Execution context. Defaults to `ExecutionContext.default()`.

Returns:
- `Graph`: Graph instance.

Example:

```python
graph = Graph.get("my_graph", context=context)
```

### query

Execute a query against the graph instance using GQL.

```python
graph.query(query_string, [query_language])
```

Parameters:
- `query_string` (str): Graph query string in GQL.
- `query_language` (str, optional): Query language. Default: `"GQL"`.

Returns:
- `QueryResult`: Object containing nodes, edges, and metadata.

Example:

```python
result = graph.query("MATCH (u:user) WHERE u.age > 30 RETURN u")
result.show()
```

### to_graphframe

Convert entire graph to GraphFrame.

```python
graph.to_graphframe([column_mapping])
```

Parameters:
- `column_mapping` (dict, optional): Custom column mapping.

Returns:
- `GraphFrame`: GraphFrame object with all vertices and edges.

Example:

```python
gf = graph.to_graphframe()
```

### show

Display basic information about the graph instance.

```python
graph.show()
```

Parameters:
- `limit` (int, default=100): Maximum nodes/edges to display
- `viz_format` (str, default="visual"): Output format
  - `"table"`: Full DataFrame tables (all columns)
  - `"visual"`: Interactive graph visualization
  - `"all"`: Show all formats


### Graph algorithms

The `Graph` class provides several built-in graph algorithms for security analysis.

#### reachability

Perform reachability analysis between source and target nodes.

```python
graph.reachability(query_input)
```

Parameters:
- `query_input` (ReachabilityQueryInput): Query parameters.

Returns:
- `QueryResult`: Containing the reachability paths.

#### k_hop

Perform k-hop analysis from a given source node.

```python
graph.k_hop(query_input)
```

Parameters:
- `query_input` (K_HopQueryInput): Query parameters.

Returns:
- `QueryResult`: Containing the k-hop paths.

#### blast_radius

Perform blast radius analysis from source node to target node.

```python
graph.blast_radius(query_input)
```

Parameters:
- `query_input` (BlastRadiusQueryInput): Query parameters.

Returns:
- `QueryResult`: Containing the blast radius paths.

#### centrality

Perform centrality analysis on the graph.

```python
graph.centrality(query_input)
```

Parameters:
- `query_input` (CentralityQueryInput): Query parameters.

Returns:
- `QueryResult`: Containing the centrality metrics.

#### ranked

Perform ranked analysis on the graph.

```python
graph.ranked(query_input)
```

Parameters:
- `query_input` (RankedQueryInput): Query parameters.

Returns:
- `QueryResult`: Containing the ranked nodes/edges.

## Node builders

Node builders provide a fluent interface for defining nodes in your graph specification. The builder progresses through stages: `NodeBuilderInitial` for setting the data source, and `NodeBuilderSourceSet` for configuring columns, labels, and time ranges.

### from_table

Set a table as the data source for a node. Database resolution order: explicit database parameter, then `ExecutionContext.default_database`, then search all databases.

```python
builder.add_node(alias).from_table(table_name, [database])
```

Parameters:
- `table_name` (str): Name of the table.
- `database` (str, optional): Explicit database name.

Returns:
- `NodeBuilderSourceSet`: Builder for further configuration.

Example:

```python
builder.add_node("user").from_table("SigninLogs", database="security_db")
```

### from_dataframe (node)

Set a Spark DataFrame as the data source for a node.

```python
builder.add_node(alias).from_dataframe(dataframe)
```

Parameters:
- `dataframe` (DataFrame): Spark DataFrame.

Returns:
- `NodeBuilderSourceSet`: Builder for further configuration.

Example:

```python
df = spark.read.table("users")
builder.add_node("user").from_dataframe(df)
```

### with_time_range (node)

Apply time range filtering to a node's data source. If `start_time` and `end_time` are provided, they're used directly. If only `lookback_hours` is provided, the range is calculated from the current time. If both are provided, `start_time` and `end_time` take precedence.

```python
builder.add_node(alias).from_table(table_name).with_time_range(time_column, [start_time], [end_time], [lookback_hours])
```

Parameters:
- `time_column` (str): Column name containing timestamp data.
- `start_time` (str or datetime, optional): Start date in formats like `'10/20/25'`, `'2025-10-20'`, or a `datetime` object.
- `end_time` (str or datetime, optional): End date in the same formats as `start_time`.
- `lookback_hours` (float, optional): Hours to look back from now.

Returns:
- `NodeBuilderSourceSet`: Self for method chaining.

Examples:

Explicit date range:

```python
builder.add_node("user").from_table("SigninLogs") \
    .with_time_range(time_column="TimeGenerated", start_time="2025-01-01", end_time="2025-01-31")
```

Lookback window:

```python
builder.add_node("user").from_table("SigninLogs") \
    .with_time_range(time_column="TimeGenerated", lookback_hours=24)
```

### with_label (node)

Set the node label. Defaults to the alias if not called.

```python
builder.add_node(alias).from_table(table_name).with_label(label)
```

Parameters:
- `label` (str): Node label.

Returns:
- `NodeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_node("u").from_table("Users").with_label("user")
```

### with_columns (node)

Configure columns with required key and display designation. Properties are automatically built from column types. Time filter column is automatically added if specified. Property types are auto-inferred from source schema.

```python
builder.add_node(alias).from_table(table_name).with_columns(*columns, key=key, display=display)
```

Parameters:
- `*columns` (str): Column names to include. At least one is required.
- `key` (str): Column name to mark as key. Must be in columns.
- `display` (str): Column name to mark as display value. Must be in columns. Can be the same as key.

Returns:
- `NodeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_node("user").from_table("Users") \
    .with_columns("id", "name", "email", "created_at", key="id", display="name")
```

## Edge builders

Edge builders provide a fluent interface for defining edges (relationships) in your graph specification. The builder progresses through stages: `EdgeBuilderInitial` for setting the data source, and `EdgeBuilderSourceSet` for configuring source, target, columns, labels, and time ranges.

### from_table (edge)

Set a table as the data source for an edge.

```python
builder.add_edge(alias).from_table(table_name, [database])
```

Parameters:
- `table_name` (str): Name of the table.
- `database` (str, optional): Explicit database name.

Returns:
- `EdgeBuilderSourceSet`: Builder for further configuration.

Example:

```python
builder.add_edge("accessed").from_table("AccessLogs")
```

### from_dataframe (edge)

Set a Spark DataFrame as the data source for an edge.

```python
builder.add_edge(alias).from_dataframe(dataframe)
```

Parameters:
- `dataframe` (DataFrame): Spark DataFrame.

Returns:
- `EdgeBuilderSourceSet`: Builder for further configuration.

Example:

```python
df = spark.read.table("access_logs")
builder.add_edge("accessed").from_dataframe(df)
```

### edge_label

Set edge relationship type or label. Defaults to the alias if not called.

```python
builder.add_edge(alias).from_table(table_name).edge_label(label)
```

Parameters:
- `label` (str): Edge label.

Returns:
- `EdgeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_edge("acc").from_table("AccessLogs").edge_label("accessed")
```

### source

Set the source node with ID column and label.

```python
builder.add_edge(alias).from_table(table_name).source(id_column, node_type)
```

Parameters:
- `id_column` (str): Column name containing source node ID.
- `node_type` (str): Source node label.

Returns:
- `EdgeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user")
```

### target

Set the target node with ID column and label.

```python
builder.add_edge(alias).from_table(table_name).target(id_column, node_type)
```

Parameters:
- `id_column` (str): Column name containing target node ID.
- `node_type` (str): Target node label.

Returns:
- `EdgeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user") \
    .target(id_column="device_id", node_type="device")
```

### with_time_range (edge)

Apply time range filtering to an edge's data source.

```python
builder.add_edge(alias).from_table(table_name).with_time_range(time_column, [start_time], [end_time], [lookback_hours])
```

Parameters:
- `time_column` (str): Column name containing timestamp data.
- `start_time` (str or datetime, optional): Start date.
- `end_time` (str or datetime, optional): End date.
- `lookback_hours` (float, optional): Hours to look back from now.

Returns:
- `EdgeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .with_time_range(time_column="TimeGenerated", lookback_hours=48)
```

### with_columns (edge)

Configure columns with required key and display designation.

```python
builder.add_edge(alias).from_table(table_name).with_columns(*columns, key=key, display=display)
```

Parameters:
- `*columns` (str): Column names to include. At least one is required.
- `key` (str): Column name to mark as key. Must be in columns.
- `display` (str): Column name to mark as display value. Must be in columns.

Returns:
- `EdgeBuilderSourceSet`: Self for method chaining.

Example:

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user") \
    .target(id_column="device_id", node_type="device") \
    .with_columns("id", "location", "status", key="id", display="location")
```

## QueryResult

The `QueryResult` class represents the result from a graph query with lazy DataFrame access.

### to_dataframe

Convert the query result to a Spark DataFrame.

```python
result.to_dataframe()
```

Returns:
- `DataFrame`: Query result as Spark DataFrame.

Example:

```python
result = graph.query("MATCH (u:user) RETURN u")
df = result.to_dataframe()
df.show()
```

### get_raw_data

Get the RawData section from the response.

```python
result.get_raw_data()
```

Returns:
- `dict`: Dictionary with raw metadata, or empty dict if not present.

Example:

```python
result = graph.query("MATCH (u:user) RETURN u")
metadata = result.get_raw_data()
```

### show (QueryResult)

Display query result in various formats.

```python
result.show([format])
```

Parameters:
- `format` (str, optional): Output format. Default: `"visual"`. Supported values: `"table"`, `"visual"`, `"all"`.

Example:

```python
result = graph.query("MATCH (u:user)-[r:accessed]->(d:device) RETURN u, r, d")
result.show()  # Visual by default
result.show(format="table")  # Table format
```

## Usage examples

### Building a basic graph

```python
from sentinel_graph.builders import GraphSpecBuilder

# Start building a graph
builder = GraphSpecBuilder.start()

# Add a user node from a table
builder.add_node("user") \
    .from_table("SigninLogs") \
    .with_columns("UserId", "UserName", "Email", key="UserId", display="UserName")

# Add a device node
builder.add_node("device") \
    .from_table("DeviceInfo") \
    .with_columns("DeviceId", "DeviceName", key="DeviceId", display="DeviceName")

# Add an edge connecting users to devices
builder.add_edge("accessed") \
    .from_table("AccessLogs") \
    .source(id_column="UserId", node_type="user") \
    .target(id_column="DeviceId", node_type="device") \
    .with_columns("AccessId", "Timestamp", key="AccessId", display="Timestamp")

# Finalize the graph specification
graph_spec = builder.done()
```

### Querying a graph

```python
# Query the graph using GQL
result = graph_spec.query(
    "MATCH (u:user)-[a:accessed]->(d:device) WHERE u.UserName = 'john.doe' RETURN u, a, d"
)

# Display results
result.show()

# Convert to DataFrame for analysis
df = result.to_dataframe()
df.show(20)
```

### Using time ranges

```python
# Filter nodes by time range
builder.add_node("user") \
    .from_table("SigninLogs") \
    .with_time_range(time_column="TimeGenerated", lookback_hours=24) \
    .with_columns("UserId", "UserName", key="UserId", display="UserName")

# Filter edges by time range
builder.add_edge("accessed") \
    .from_table("AccessLogs") \
    .with_time_range(
        time_column="TimeGenerated",
        start_time="2024-12-01",
        end_time="2024-12-31"
    ) \
    .source(id_column="UserId", node_type="user") \
    .target(id_column="DeviceId", node_type="device")
```

### Union schemas

Multiple edges with the same alias are automatically merged with a union of their properties:

```python
# Both edges use alias "sign_in" - they will be merged into one schema edge
builder.add_edge("sign_in") \
    .from_table("AzureSignins") \
    .source(id_column="UserId", node_type="AZuser") \
    .target(id_column="DeviceId", node_type="device")

builder.add_edge("sign_in") \
    .from_table("EntraSignins") \
    .source(id_column="UserId", node_type="EntraUser") \
    .target(id_column="DeviceId", node_type="device")
```

## Graph REST APIs

The Graph Builder API also provides REST endpoints for managing and querying custom graphs in your Microsoft Sentinel tenant.

### List graphs

List all custom graphs available from your tenant.

```
GET https://api.securityplatform.microsoft.com/graphs/custom-graph-instances
```

No request body required.

Sample response:

```json
{
  "value": [
    {
      "name": "custom_graph_10",
      "mapFileName": "custom_graph_10",
      "mapFileVersion": "1.0.0",
      "graphDefinitionName": "custom_graph_10",
      "graphDefinitionVersion": "1.0.0",
      "refreshFrequency": "00:00:00",
      "createTime": "11/04/2025 22:32:43",
      "lastUpdateTime": "11/04/2025 22:32:43",
      "lastSnapshotTime": "2025-11-04T22:34:04.7105015+00:00",
      "lastSnapshotRequestTime": "2025-11-04T22:32:52.0187838+00:00",
      "instanceStatus": "Ready",
      "realizeGraph": true
    },
    {
      "name": "notebook_graph_5",
      "mapFileName": null,
      "mapFileVersion": null,
      "graphDefinitionName": "notebook_graph_5",
      "graphDefinitionVersion": "1.0.0",
      "refreshFrequency": "00:00:00",
      "createTime": "11/04/2025 20:15:22",
      "lastUpdateTime": "11/04/2025 20:15:22",
      "lastSnapshotTime": null,
      "lastSnapshotRequestTime": null,
      "instanceStatus": "Creating",
      "realizeGraph": true
    }
  ]
}
```

Response status code:
- **200 OK** - List retrieved successfully.

### Query a graph

Query a custom graph from your tenant using GQL query language. For more information on GQL, see [GQL language guide](/fabric/graph/gql-language-guide).

> [!NOTE]
> `{graphName}` refers to the `name` of a graph returned from the list or get operation.

```
POST https://{endpoint}/graphs/custom-graph-instances/{graphName}/query
```

Request body format:

```json
{
  "query": "string",
  "queryLanguage": "GQL"
}
```

Sample request body:

```json
{
  "query": "MATCH (u)-[v]->(w) RETURN * LIMIT 2",
  "queryLanguage": "GQL"
}
```

Sample response:

```json
{
  "Graph": {
    "Nodes": [],
    "Edges": []
  },
  "RawData": {
    "Rows": [
      {
        "Cols": [
          {
            "Value": "{ _id: sharepointsystemn}",
            "Metadata": {},
            "Path": null
          },
          {
            "Value": "{ lastSeen: 2025-10-17T04:42:18.0000000Z, firstSeen: 2025-10-17T04:42:18.0000000Z, _sourceId: sharepointsystem, _targetId: fea4797a-89d9-4095-8a08-b821d6bfcd8e, _label: Deleted, _sourceLabel: ENTRAUSER, _targetLabel: ONLINEFILEn}",
            "Metadata": {},
            "Path": null
          },
          {
            "Value": "{ tenantId: 536279f6-15cc-45f2-be2d-61e352b51eef, _id: fea4797a-89d9-4095-8a08-b821d6bfcd8e, _label: ONLINEFILE, displayName: 0c8a8c07-a918-4540-ac1d-a78bf7c81a84_LThumb.jpgn}",
            "Metadata": {},
            "Path": null
          }
        ]
      }
    ],
    "ColumnNames": [
      "u",
      "v",
      "w"
    ]
  }
}
```

Response status code:
- **200 OK** - Query executed successfully.

## Related content

- [Custom graphs overview](./custom-graphs-overview.md)
- [Create custom graphs](./create-custom-graphs.md)