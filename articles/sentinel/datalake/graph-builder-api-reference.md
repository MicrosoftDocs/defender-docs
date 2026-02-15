---
title: Microsoft Sentinel Graph Builder API reference
description: Comprehensive API reference for building and querying security graphs using the Sentinel Graph Provider.
author: EdB-MSFT
ms.author: edbaynash
ms.topic: reference
ms.date: 01/11/2026
ms.service: microsoft-sentinel

#Customer intent: As a security analyst or engineer, I want to use the Graph Builder API to create and query security graphs so that I can perform advanced threat analysis and investigation.

---

# Microsoft Sentinel Graph Builder API reference

This article provides a comprehensive API reference for the Sentinel Graph Provider, which enables you to build and query security graphs for advanced threat analysis and investigation.

The Graph Builder API provides a fluent interface for:
- Building graph specifications with nodes and edges
- Configuring ETL pipelines for data ingestion
- Querying graphs using GQL (Graph Query Language)
- Running graph algorithms for security analysis
- Visualizing graph data

## GraphSpecBuilder

The `GraphSpecBuilder` class provides a fluent builder interface for creating graph specifications with ETL pipelines and schema integration.

### Static methods

#### start

```python
@staticmethod
GraphSpecBuilder.start(context: Optional[ExecutionContext] = None) -> GraphSpecBuilder
```

Define a new fluent graph builder.

**Parameters:**

- `context` (ExecutionContext, optional): ExecutionContext instance. If None, uses default context.

**Returns:**

GraphSpecBuilder: New builder instance

**Example:**

```python
builder = GraphSpecBuilder.start(context=context)
```

### Instance methods

#### add_node

```python
def add_node(alias: str) -> NodeBuilderInitial
```

Start building a node definition.

**Parameters:**

- `alias` (str): Unique identifier for this node within the graph

**Returns:**

NodeBuilderInitial: Node builder in initial state

**Example:**

```python
builder.add_node("user")
```

#### add_edge

```python
def add_edge(alias: str) -> EdgeBuilderInitial
```

Start building an edge definition.

**Parameters:**

- `alias` (str): Identifier for this edge within the graph (can be shared across multiple edges)

**Returns:**

EdgeBuilderInitial: Edge builder in initial state

**Example:**

```python
builder.add_edge("accessed")
```

#### done

```python
def done() -> GraphSpec
```

Finalize graph specification and return GraphSpec instance.

**Returns:**

GraphSpec: Complete graph specification with ETL pipeline and schema

**Raises:**

ValueError: If graph has no nodes or edges, or if validation fails

**Example:**

```python
graph_spec = builder.done()
```

## GraphSpec

The `GraphSpec` class represents a complete graph specification with ETL pipeline, schema, and query/visualization capabilities. It extends the Graph class.

### Properties

#### nodes

```python
@property
def nodes() -> DataFrame
```

Get nodes DataFrame (lazy, cached). Automatically determines source from ETL pipeline or lake table.

**Returns:**

DataFrame: Spark DataFrame containing all nodes

**Raises:**

ValueError: If context is missing or DataFrames cannot be loaded

**Example:**

```python
# Access nodes DataFrame
nodes_df = graph_spec.nodes
nodes_df.show(10)

# Filter nodes by label
user_nodes = nodes_df.filter(nodes_df.label == "user")
print(f"Total users: {user_nodes.count()}")

# Analyze node properties
nodes_df.groupBy("label").count().show()

# Access specific columns
nodes_df.select("id", "label", "properties").show()
```

#### edges

```python
@property
def edges() -> DataFrame
```

Get edges DataFrame (lazy, cached). Automatically determines source from ETL pipeline or lake table.

**Returns:**

DataFrame: Spark DataFrame containing all edges

**Raises:**

ValueError: If context is missing or DataFrames cannot be loaded

**Example:**

```python
# Access edges DataFrame
edges_df = graph_spec.edges
edges_df.show(10)

# Filter edges by type
access_edges = edges_df.filter(edges_df.label == "accessed")
print(f"Total access relationships: {access_edges.count()}")

# Analyze edge distribution
edges_df.groupBy("label").count().show()

# Join nodes and edges for analysis
from pyspark.sql.functions import col

user_access_pattern = edges_df.alias("e") \
    .join(graph_spec.nodes.alias("n"), col("e.source_id") == col("n.id")) \
    .select("e.source_id", "e.target_id", "e.label", "n.properties") \
    .show()
```

### Methods

#### build_graph_with_data

```python
def build_graph_with_data() -> Dict[str, Any]
```

Execute the ETL pipeline and create graph instance via API.

**Returns:**

Dictionary containing:
- `etl_result`: ETL execution results
- `api_result`: API creation results (if successful)
- `instance_name`: Graph instance name
- `status`: "success" or "etl_only"

**Raises:**

ValueError: If this is a remote graph without local ETL pipeline

**Example:**

```python
result = graph_spec.build_graph_with_data()
print(f"Status: {result['status']}")
```

#### get_schema

```python
def get_schema() -> GraphSchema
```

Get the graph schema.

**Returns:**

GraphSchema: Graph schema definition

#### to_graphframe

```python
def to_graphframe(column_mapping: Optional[Dict[str, str]] = None) -> GraphFrame
```

Convert entire graph to GraphFrame for running graph algorithms.

**Parameters:**

- `column_mapping` (Dict[str, str], optional): Custom column mapping with keys:
  - `"id"`: Vertex ID column name
  - `"source_id"`: Edge source ID column name
  - `"target_id"`: Edge target ID column name

**Returns:**

GraphFrame: GraphFrame object with all vertices and edges

**Raises:**

ValueError: If ExecutionContext is not available

**Example:**

```python
gf = graph_spec.to_graphframe()
pagerank = gf.pageRank(resetProbability=0.15, maxIter=10)
```

#### show

```python
def show(limit: int = 100, viz_format: str = "visual") -> None
```

Display graph data in various formats.

**Parameters:**

- `limit` (int, default=100): Maximum nodes/edges to display
- `viz_format` (str, default="visual"): Output format
  - `"table"`: Full DataFrame tables (all columns)
  - `"visual"`: Interactive graph visualization
  - `"all"`: Show all formats

**Raises:**

ValueError: If format is not one of the supported values

**Example:**

```python
graph_spec.show(limit=50, viz_format="table")
```

## Graph

The `Graph` class represents a graph instance for querying existing graphs. It serves as the base class for GraphSpec.

### Static methods

#### get

```python
@staticmethod
Graph.get(name: str, context: Optional[ExecutionContext] = None) -> Graph
```

Gets a graph instance from an existing graph.

**Parameters:**

- `name` (str): Graph instance name
- `context` (ExecutionContext, optional): Execution context (defaults to ExecutionContext.default())

**Returns:**

Graph: Graph instance

**Raises:**

ValueError: If graph name is empty or graph instance does not exist

**Example:**

```python
graph = Graph.get("my_graph", context=context)
```

### Methods

#### query

```python
def query(query_string: str, query_language: str = "GQL") -> QueryResult
```

Execute a query against the graph instance using GQL.

**Parameters:**

- `query_string` (str): Graph query string (GQL Language)
- `query_language` (str, default="GQL"): Query language

**Returns:**

QueryResult: Object containing nodes, edges, and metadata

**Raises:**

- ValueError: If ExecutionContext or Spark session is missing
- RuntimeError: If client initialization or query execution fails

**Example:**

```python
result = graph.query("MATCH (u:user) WHERE u.age > 30 RETURN u")
result.show()
```

#### to_graphframe

```python
def to_graphframe(column_mapping: Optional[Dict[str, str]] = None) -> GraphFrame
```

Convert entire graph to GraphFrame.

**Parameters:**

- `column_mapping` (Dict[str, str], optional): Custom column mapping

**Returns:**

GraphFrame: GraphFrame object with all vertices and edges

**Example:**

```python
gf = graph.to_graphframe()
```

#### show

```python
def show() -> None
```

Display basic information about the graph instance.

### Graph algorithms

The Graph class provides several built-in graph algorithms for security analysis:

#### reachability

```python
def reachability(query_input: ReachabilityQueryInput) -> QueryResult
```

Perform reachability analysis between source and target nodes.

**Parameters:**

- `query_input` (ReachabilityQueryInput): Query parameters

**Returns:**

QueryResult: Containing the reachability paths

#### k_hop

```python
def k_hop(query_input: K_HopQueryInput) -> QueryResult
```

Perform k-hop analysis from a given source node.

**Parameters:**

- `query_input` (K_HopQueryInput): Query parameters

**Returns:**

QueryResult: Containing the k-hop paths

#### blast_radius

```python
def blast_radius(query_input: BlastRadiusQueryInput) -> QueryResult
```

Perform blast radius analysis from source node to target node.

**Parameters:**

- `query_input` (BlastRadiusQueryInput): Query parameters

**Returns:**

QueryResult: Containing the blast radius paths

#### centrality

```python
def centrality(query_input: CentralityQueryInput) -> QueryResult
```

Perform centrality analysis on the graph.

**Parameters:**

- `query_input` (CentralityQueryInput): Query parameters

**Returns:**

QueryResult: Containing the centrality metrics

#### ranked

```python
def ranked(query_input: RankedQueryInput) -> QueryResult
```

Perform ranked analysis on the graph.

**Parameters:**

- `query_input` (RankedQueryInput): Query parameters

**Returns:**

QueryResult: Containing the ranked nodes/edges

## Node builders

Node builders provide a fluent interface for defining nodes in your graph specification.

### NodeBuilderInitial

The initial state for node builder with data source configuration methods.

#### from_table

```python
def from_table(table_name: str, database: Optional[str] = None) -> NodeBuilderSourceSet
```

Set table as data source with intelligent database resolution.

**Parameters:**

- `table_name` (str): Name of the table (required)
- `database` (str, optional): Explicit database name (takes precedence over context default)

**Returns:**

NodeBuilderSourceSet: Builder for further configuration

**Raises:**

ValueError: If table not found or multiple conflicting tables found

**Database resolution order:**
1. Explicit database parameter (highest precedence)
2. ExecutionContext.default_database
3. Search all databases (with conflict detection)

**Example:**

```python
builder.add_node("user").from_table("SigninLogs", database="security_db")
```

#### from_dataframe

```python
def from_dataframe(dataframe: DataFrame) -> NodeBuilderSourceSet
```

Set Spark DataFrame as data source.

**Parameters:**

- `dataframe` (DataFrame): Spark DataFrame

**Returns:**

NodeBuilderSourceSet: Builder for further configuration

**Example:**

```python
df = spark.read.table("users")
builder.add_node("user").from_dataframe(df)
```

### NodeBuilderSourceSet

Node builder after data source is set, with configuration methods available.

#### with_time_range

```python
def with_time_range(
    time_column: str,
    start_time: Optional[Union[str, datetime]] = None,
    end_time: Optional[Union[str, datetime]] = None,
    lookback_hours: Optional[float] = None
) -> NodeBuilderSourceSet
```

Apply time range filtering to the node's data source.

**Parameters:**

- `time_column` (str): Column name containing timestamp data (required)
- `start_time` (str or datetime, optional): Start date ('10/20/25', '2025-10-20', or datetime object)
- `end_time` (str or datetime, optional): End date (same formats as start_time)
- `lookback_hours` (float, optional): Hours to look back from now

**Returns:**

NodeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If time column not found in source schema

**Time range logic:**
- If start_time and end_time provided: use them directly
- If only lookback_hours provided: end=now, start=now-lookback_hours
- If nothing provided: no time filtering
- If start/end AND lookback_hours: start/end take precedence

**Example:**

```python
# Explicit date range
builder.add_node("user").from_table("SigninLogs") \
    .with_time_range(time_column="TimeGenerated", start_time="2025-01-01", end_time="2025-01-31")

# Lookback window
builder.add_node("user").from_table("SigninLogs") \
    .with_time_range(time_column="TimeGenerated", lookback_hours=24)
```

#### with_label

```python
def with_label(label: str) -> NodeBuilderSourceSet
```

Set node label (defaults to alias if not called).

**Parameters:**

- `label` (str): Node label

**Returns:**

NodeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If label already set

**Example:**

```python
builder.add_node("u").from_table("Users").with_label("user")
```

#### with_columns

```python
def with_columns(
    *columns: str,
    key: str,
    display: str
) -> NodeBuilderSourceSet
```

Configure columns with required key and display designation.

**Parameters:**

- `*columns` (str): Column names to include (at least one required)
- `key` (str): Column name to mark as key (required, must be in columns)
- `display` (str): Column name to mark as display value (required, must be in columns, can be same as key)

**Returns:**

NodeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If validation fails (duplicate columns, missing key/display, etc.)

> [!NOTE]
> - Properties are automatically built from column types
> - Time filter column is automatically added if specified
> - Property types are auto-inferred from source schema

**Example:**

```python
builder.add_node("user").from_table("Users") \
    .with_columns("id", "name", "email", "created_at", key="id", display="name")
```

#### add_node

```python
def add_node(alias: str) -> NodeBuilderInitial
```

Finish this node and start building another node.

**Parameters:**

- `alias` (str): Alias for the new node

**Returns:**

NodeBuilderInitial: New node builder

**Example:**

```python
builder.add_node("user").from_table("Users") \
    .with_columns("id", "name", key="id", display="name") \
    .add_node("device")
```

#### add_edge

```python
def add_edge(alias: str) -> EdgeBuilderInitial
```

Finish this node and start building an edge.

**Parameters:**

- `alias` (str): Alias for the edge

**Returns:**

EdgeBuilderInitial: New edge builder

**Example:**

```python
builder.add_node("user").from_table("Users") \
    .with_columns("id", "name", key="id", display="name") \
    .add_edge("accessed")
```

#### done

```python
def done() -> GraphSpec
```

Finalize this node and complete the graph specification.

**Returns:**

GraphSpec: Complete graph specification

**Example:**

```python
graph_spec = builder.add_node("user").from_table("Users") \
    .with_columns("id", "name", key="id", display="name") \
    .done()
```

## Edge builders

Edge builders provide a fluent interface for defining edges (relationships) in your graph specification.

### EdgeBuilderInitial

The initial state for edge builder with data source configuration methods.

#### from_table

```python
def from_table(table_name: str, database: Optional[str] = None) -> EdgeBuilderSourceSet
```

Set table as data source with intelligent database resolution.

**Parameters:**

- `table_name` (str): Name of the table (required)
- `database` (str, optional): Explicit database name

**Returns:**

EdgeBuilderSourceSet: Builder for further configuration

**Raises:**

ValueError: If table not found or multiple conflicting tables found

**Example:**

```python
builder.add_edge("accessed").from_table("AccessLogs")
```

#### from_dataframe

```python
def from_dataframe(dataframe: DataFrame) -> EdgeBuilderSourceSet
```

Set Spark DataFrame as data source.

**Parameters:**

- `dataframe` (DataFrame): Spark DataFrame

**Returns:**

EdgeBuilderSourceSet: Builder for further configuration

**Example:**

```python
df = spark.read.table("access_logs")
builder.add_edge("accessed").from_dataframe(df)
```

### EdgeBuilderSourceSet

Edge builder after data source is set, with configuration methods available.

#### edge_label

```python
def edge_label(label: str) -> EdgeBuilderSourceSet
```

Set edge relationship type/label (defaults to alias if not called).

**Parameters:**

- `label` (str): Edge label

**Returns:**

EdgeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If label already set

**Example:**

```python
builder.add_edge("acc").from_table("AccessLogs").edge_label("accessed")
```

#### source

```python
def source(id_column: str, node_type: str) -> EdgeBuilderSourceSet
```

Set source node with ID column and label.

**Parameters:**

- `id_column` (str): Column name containing source node ID
- `node_type` (str): Source node label

**Returns:**

EdgeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If source already set

**Example:**

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user")
```

#### target

```python
def target(id_column: str, node_type: str) -> EdgeBuilderSourceSet
```

Set target node with ID column and label.

**Parameters:**

- `id_column` (str): Column name containing target node ID
- `node_type` (str): Target node label

**Returns:**

EdgeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If target already set

**Example:**

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user") \
    .target(id_column="device_id", node_type="device")
```

#### with_time_range

```python
def with_time_range(
    time_column: str,
    start_time: Optional[Union[str, datetime]] = None,
    end_time: Optional[Union[str, datetime]] = None,
    lookback_hours: Optional[float] = None
) -> EdgeBuilderSourceSet
```

Apply time range filtering to the edge's data source.

**Parameters:**

- `time_column` (str): Column name containing timestamp data (required)
- `start_time` (str or datetime, optional): Start date
- `end_time` (str or datetime, optional): End date
- `lookback_hours` (float, optional): Hours to look back from now

**Returns:**

EdgeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If time column not found in source schema

**Example:**

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .with_time_range(time_column="TimeGenerated", lookback_hours=48)
```

#### with_columns

```python
def with_columns(
    *columns: str,
    key: str,
    display: str
) -> EdgeBuilderSourceSet
```

Configure columns with required key and display designation.

**Parameters:**

- `*columns` (str): Column names to include (at least one required)
- `key` (str): Column name to mark as key (required, must be in columns)
- `display` (str): Column name to mark as display value (required, must be in columns)

**Returns:**

EdgeBuilderSourceSet: Self for method chaining

**Raises:**

ValueError: If validation fails

**Example:**

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user") \
    .target(id_column="device_id", node_type="device") \
    .with_columns("id", "location", "status", key="id", display="location")
```

#### add_node

```python
def add_node(alias: str) -> NodeBuilderInitial
```

Finish this edge and start building a node.

**Parameters:**

- `alias` (str): Alias for the new node

**Returns:**

NodeBuilderInitial: New node builder

#### add_edge

```python
def add_edge(alias: str) -> EdgeBuilderInitial
```

Finish this edge and start building another edge.

**Parameters:**

- `alias` (str): Alias for the new edge

**Returns:**

EdgeBuilderInitial: New edge builder

**Example:**

```python
builder.add_edge("accessed").from_table("AccessLogs") \
    .source(id_column="user_id", node_type="user") \
    .target(id_column="device_id", node_type="device") \
    .with_columns("id", "location", key="id", display="location") \
    .add_edge("connected_to")
```

#### done

```python
def done() -> GraphSpec
```

Finalize this edge and complete the graph specification.

**Returns:**

GraphSpec: Complete graph specification

## QueryResult

The `QueryResult` class represents the result from a graph query with lazy DataFrame access.

### Methods

#### to_dataframe

```python
def to_dataframe() -> DataFrame
```

Converts the query result to a Spark DataFrame.

**Returns:**

DataFrame: Query result as Spark DataFrame

**Raises:**

ValueError: If conversion fails

**Example:**

```python
result = graph.query("MATCH (u:user) RETURN u")
df = result.to_dataframe()
df.show()
```

#### get_raw_data

```python
def get_raw_data() -> Dict[str, Any]
```

Get RawData section from response.

**Returns:**

Dict[str, Any]: Dictionary with raw metadata, or empty dict if not present

**Example:**

```python
result = graph.query("MATCH (u:user) RETURN u")
metadata = result.get_raw_data()
```

#### show

```python
def show(format: str = "visual") -> None
```

Display query result in various formats.

**Parameters:**

- `format` (str, default="visual"): Output format
  - `"table"`: Full DataFrame tables (all columns)
  - `"visual"`: Interactive graph visualization with VSC plugin
  - `"all"`: Show all formats

**Raises:**

ValueError: If format is not one of the supported values

**Example:**

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

## Design patterns

Understanding these design patterns helps you use the Graph Builder API effectively:

### Fluent API

All builders support method chaining for readable, declarative graph definitions:

```python
builder.add_node("user") \
    .from_table("Users") \
    .with_columns("id", "name", key="id", display="name") \
    .add_edge("follows")
```

### Union schemas

Multiple edges with the same alias are automatically merged with union of their properties:

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

### Auto-configuration

Many fields have sensible defaults to simplify graph creation:

- Node and edge labels default to their aliases
- Properties are auto-inferred from source schemas
- Entity groups default to primary labels/relationship types

### Lazy evaluation

DataFrames and resources are loaded lazily and cached for performance:

- `graph_spec.nodes` and `graph_spec.edges` are loaded on first access
- Query results create DataFrames only when requested
- This approach minimizes resource usage and improves performance


## Graph REST APIs 

The Graph Builder API also provides REST endpoints for managing and querying custom graphs in your Microsoft Sentinel tenant.

### List graphs
List all custom graphs available from your tenant.

**HTTP Method**: `GET`
**URL**: `https://api.securityplatform.microsoft.com/graphs/custom-graph-instances `


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
            "Value": "{ _id: sharepointsystemn}",   
            "Metadata": {},   
            "Path": **null**   
          },   
          {   
            "Value": "{ lastSeen: 2025-10-17T04:42:18.0000000Z, firstSeen: 2025-10-17T04:42:18.0000000Z, _sourceId: sharepointsystem, _targetId: fea4797a-89d9-4095-8a08-b821d6bfcd8e, _label: Deleted, _sourceLabel: ENTRAUSER, _targetLabel: ONLINEFILEn}",   
            "Metadata": {},   
            "Path": **null**   
          },   
          {   
            "Value": "{ tenantId: 536279f6-15cc-45f2-be2d-61e352b51eef, _id: fea4797a-89d9-4095-8a08-b821d6bfcd8e, _label: ONLINEFILE, displayName: 0c8a8c07-a918-4540-ac1d-a78bf7c81a84_LThumb.jpgn}",   
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

**Response Status Code**

- **200 OK** - Query executed successfully 


