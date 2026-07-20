---
title: Develop Custom Graph Solutions for Microsoft Sentinel
description: Build, test, materialize, package, and publish a Microsoft Sentinel custom graph solution to Microsoft Security Store. Get started today.
author: EdB-MSFT
ms.author: edbaynash
ms.reviewer: smarapareddy
ms.date: 06/22/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012

#customer intent: As an ISV partner, I want to build and publish a custom graph platform solution so that customers can query and use my graph in Microsoft Security Store.
---

# Develop custom graph platform solutions

A Microsoft Sentinel custom graph solution is a notebook-based solution that defines nodes and edges from Microsoft Sentinel data lake tables, builds a graph, and lets users query that graph with Graph Query Language (GQL).

Use this guide to build, test, materialize, package, and publish a custom graph solution as a SaaS offer in Microsoft Partner Center so customers can discover it in Microsoft Security Store.


## Prerequisites

You must be onboarded to the data lake to create Custom Graph solutions. For more information, see  [How to onboard to the Microsoft Sentinel data lake](sentinel-data-lake-onboarding.md).

### Permissions

The following table lists the required permissions for each operation or scope in this guide.

| Operation  | Required role |
|---|---|
| Onboarding to the Sentinel data lake | Microsoft Entra ID - Security Administrator or Global Administrator |
| Onboard Sentinel workspace to Defender portal | Subscription Owner, or User Access Administrator at subscription scope and Microsoft Sentinel Contributor at subscription or resource group scope |
| Onboard Sentinel workspace to Data Lake | Subscription Owner or Microsoft Sentinel Contributor at subscription or resource group scope |
| Model and build a notebook graph | Custom Microsoft Defender XDR unified RBAC role with `data (manage)` permission over the Microsoft Sentinel data collection |
| Persist (materialize) a graph | Security Operator, Security Administrator, or Global Administrator |
| Query a persisted graph | Custom Microsoft Defender XDR unified RBAC role with `security data basics (read)` over the Microsoft Sentinel data collection |
|Publishing Custom Graph solution  | Marketplace Publisher account on Microsoft Partner Center |

### Tools

The following tools are required to build and publish a custom graph solution:

- Visual Studio Code.
- [Microsoft Sentinel extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-security.ms-sentinel). For more information, see [Install Visual Studio Code and the Microsoft Sentinel extension](/azure/sentinel/datalake/notebooks#install-visual-studio-code-and-the-microsoft-sentinel-extension )
- Jupyter extension for Visual Studio Code.
- GitHub Copilot extension and a GitHub Copilot Business or Enterprise plan.
- Python 3.10 or later on your local machine.

> [!TIP]
> Reuse an existing data lake if your tenant is already onboarded for KQL queries, notebooks, or a Security Copilot agent. There is one data lake per tenant. In the Defender portal, go to **System** > **Settings** > **Microsoft Sentinel** > **Data lake**. If status is **Provisioned**, skip task 1.

## Build workflow

The following workflow outlines the steps to build and publish a custom graph solution.

1. Ingest sample data to the tables that your graph models.
1. Validate connectivity with a simple notebook.
1. Author the custom graph.
1. Test the graph notebook.
1. Schedule a graph job to materialize the graph.
1. Query and visualize the graph from Graph explorer.
1. Package and publish the custom graph solution.

## Ingest sample data

This task ingests Microsoft Entra ID asset tables used by the sample graph in this guide: `EntraUsers`, `EntraGroups`, `EntraServicePrincipals`, and `EntraMembers`.

1. In the Defender portal, go to **System** > **Settings** > **Microsoft Sentinel** > **Data connectors**.
1. Enable the Microsoft Entra ID connector so Entra asset tables are ingested into the data lake. For more information, see [Asset data ingestion in the Microsoft Sentinel data lake](../datalake/enable-data-connectors.md)
1. Confirm these tables appear in the data lake explorer:
   - `EntraUsers`
   - `EntraGroups`
   - `EntraServicePrincipals`
   - `EntraMembers`
1. These tables land in the **System tables** workspace.
1. Optional: ingest other connectors and replace table names in later steps if your scenario uses different data.

> [!NOTE]
> If a table doesn't appear in the data lake explorer, you can't use it for graph authoring, and AI assistance won't reference it.


## Validate connectivity with a simple notebook

Create and run a minimal notebook to verify data lake connectivity before graph authoring.

1. Open Visual Studio Code and sign in to the Microsoft Sentinel extension with the same account that has access to the data lake.
1. In Visual Studio Code, under Sentinel Extension–Graphs select **Create new notebook**.
    :::image type="content" source="media/develop-custom-graph-platform-solutions/create-new-workbook.png" lightbox="media/develop-custom-graph-platform-solutions/create-new-workbook.png" alt-text="A screenshot showing the create new notebook option in VS Code.":::


1. Save the notebook, for example `hello-world-show-tables.ipynb`.
1. Select **Select kernel**, select **Microsoft Sentinel** and select an available spark pool.
    :::image type="content" source="media/develop-custom-graph-platform-solutions/select-kernel.png" lightbox="media/develop-custom-graph-platform-solutions/select-kernel.png" alt-text="A screenshot showing the select kernel option in VS Code.":::

1. Add the following cells in order.

Cell 1 - Markdown:

```md
# Hello World: Show Tables
A minimal connectivity test for the Microsoft Sentinel data lake.
If every cell below runs without error, your environment is ready
to author custom graphs.
Steps:
1. Connect to the data lake with the Microsoft Sentinel provider
2. Point at your workspace
3. Read a table and show a few rows
```

Cell 2 - Code (connect and set your workspace):

```python
from sentinel_lake.providers import MicrosoftSentinelProvider
# The provider gives the notebook access to data lake tables.
lake_provider = MicrosoftSentinelProvider(spark=spark)
# >>> ADD YOUR WORKSPACE HERE <<<
# Replace with the Log Analytics workspace that holds your tables.
# Entra asset tables (EntraUsers, EntraGroups, ...) live in "System tables".
LOG_ANALYTICS_WORKSPACE = "System tables"
print(f"Using workspace: {LOG_ANALYTICS_WORKSPACE}")
```

Cell 3 - Markdown:

```md
## Read a table and show rows
Reading a known table is the fastest way to confirm the extension
can reach the lake with your permissions. Swap EntraGroups for any
table that exists in your workspace.
```

Cell 4 - Code (read a table and show rows):

```python
# Read a table from the data lake into a Spark DataFrame.
df_groups = lake_provider.read_table("EntraGroups", LOG_ANALYTICS_WORKSPACE)
# Show a sample. .df exposes the underlying Spark DataFrame.
df_groups.df.select("id", "displayName", "mailEnabled").show(20, truncate=False)
```

Cell 5 - Code (optional sanity counts):

```python
# Confirm the read returned data and inspect the schema.
print("Row count:", df_groups.df.count())
df_groups.df.printSchema()
```

1. Run all cells top to bottom.
1. Confirm every cell completes without a red traceback, table preview data appears, and row count is non-zero.

> [!NOTE]
> If reads fail or return no rows, confirm the connector from the [Ingest sample data](#ingest-sample-data) section has completed its first snapshot, `LOG_ANALYTICS_WORKSPACE` matches a real workspace, and your account has read access. Check table contents with KQL in the Defender portal to confirm data is present. For more information, see [Run KQL queries on the Microsoft Sentinel data lake](../datalake/kql-queries.md).

## Author the custom graph

Author in one of these ways:

- AI-assisted graph authoring.
- Author by hand.

### AI-assisted graph authoring

To author a graph with AI assistance, follow these steps:

1. In Visual Studio Code, open GitHub Copilot Chat.
1. Start your prompt with the graph-authoring helper `@sentinel /graph-authoring` and describe your graph in plain language:

   ```text
   @sentinel /graph-authoring Create a graph that maps Entra groups to
   their member users, groups, and service principals using EntraGroups,
   EntraUsers, EntraServicePrincipals, and EntraMembers from the
   "System tables" workspace.
   ```
   :::image type="content" source="media/develop-custom-graph-platform-solutions/ai-assisted-graph.png" lightbox="media/develop-custom-graph-platform-solutions/ai-assisted-graph.png" alt-text="A screenshot showing AI-assisted graph authoring in VS Code.":::

   Copilot generates the following cells for the graph authoring lifecycle:

   | Lifecycle stage | Generated output |
   |---|---|
   | Environment setup | Verifies required packages and connection information |
   | Data loading | Reads named tables from Sentinel data lake |
   | Data transformation | Prepares node and edge data |
   | Graph schema | Defines nodes and edges |
   | Schema validation | Validates the graph definition |
   | Graph build | Materializes the graph for the session |
   | Graph query | Runs a sample GQL query and visualizes the result |

1. Continue refining the notebook with prompts like these:

   | Goal | Prompt |
   |---|---|
   | Add a relationship | `@sentinel Add an edge from User to IPAddress` |
   | Filter data | `@sentinel Filter the data to show only failed sign-ins` |
   | Change time range | `@sentinel Change the time range to the last 7 days` |
   | Fix build error | `@sentinel Fix the error in the graph build step` |
   | Understand code | `@sentinel Explain how edge keys are defined` |
   | Look up an API without editing | `What parameters does build_graph_with_data() accept? #sentinel` |

> [!TIP]
> Use `@sentinel /graph-authoring` to create or modify notebook cells. If you need API explanations or sample queries, ask Copilot and include `#Sentinel` for Sentinel-specific answers.

### Author by hand

To author a graph manually, follow these steps:

1. Connect and read asset tables.

    ```python
    from pyspark.sql import functions as F
    from sentinel_lake.providers import MicrosoftSentinelProvider
    lake_provider = MicrosoftSentinelProvider(spark=spark)
    # Entra asset tables live in the "System tables" workspace.
    # If your data is elsewhere, update this and ensure the tables exist.
    LOG_ANALYTICS_WORKSPACE = "System tables"
    # Use the latest snapshot of EntraUsers as the point-in-time for all tables.
    snapshot_time = (
        lake_provider.read_table("EntraUsers", LOG_ANALYTICS_WORKSPACE)
        .df.agg(F.max("_SnapshotTime").alias("max_snapshot"))
        .collect()[0]["max_snapshot"]
        .strftime("%Y-%m-%dT%H:%M:%SZ")
    )
    print(f"Using snapshot_time: {snapshot_time}")
    snapshot_filter = (F.col("_SnapshotTime") == F.lit(snapshot_time).cast("timestamp"))
    # Edges: group contains user / group / servicePrincipal
    df_members = (
        lake_provider.read_table("EntraMembers", LOG_ANALYTICS_WORKSPACE)
        .filter(
            snapshot_filter
            & (F.col("sourceType") == "group")
            & (F.col("targetType").isin("user", "group", "servicePrincipal"))
        )
    )
    # Nodes
    df_groups = (
        lake_provider.read_table("EntraGroups", LOG_ANALYTICS_WORKSPACE)
        .filter(snapshot_filter)
        .select("id", "displayName", "mailEnabled")
    )
    df_users = (
        lake_provider.read_table("EntraUsers", LOG_ANALYTICS_WORKSPACE)
        .filter(snapshot_filter)
        .select("id", "accountEnabled", "displayName", "department",
                "userPrincipalName", "usageLocation")
    )
    ```

1. Prepare node and edge DataFrames.

    ```python
    # NODES
    user_nodes = df_users.df.select(
        "id", "displayName", "accountEnabled", "department",
        "userPrincipalName", "usageLocation")
    group_nodes = df_groups.df.select("id", "displayName", "mailEnabled")
    # EDGES
    edge_group_contains_user = (
        df_members.df.filter(F.col("targetType") == "user")
        .select(F.col("sourceId").alias("SourceGroupId"),
                F.col("targetId").alias("TargetUserId"))
        .distinct()
        .withColumn("EdgeKey", F.concat_ws("_", F.col("SourceGroupId"), F.col("TargetUserId")))
    )
    edge_group_contains_group = (
        df_members.df.filter(F.col("targetType") == "group")
        .select(F.col("sourceId").alias("SourceGroupId"),
                F.col("targetId").alias("TargetGroupId"))
        .distinct()
        .withColumn("EdgeKey", F.concat_ws("_", F.col("SourceGroupId"), F.col("TargetGroupId")))
    )
    ```

1. Define graph schema and bind DataFrames.

    ```python
    from sentinel_graph import GraphSpecBuilder, Graph
    entra_group_graph_spec = (
        GraphSpecBuilder.start()
        # === NODES ===
        .add_node("EntraUser").from_dataframe(user_nodes)
        .with_columns("id", "displayName", "accountEnabled", "department",
                      "userPrincipalName", "usageLocation",
                      key="id", display="displayName")
        .add_node("EntraGroup").from_dataframe(group_nodes)
        .with_columns("id", "displayName", "mailEnabled",
                      key="id", display="displayName")
        # === EDGES ===
        .add_edge("ContainsUser").from_dataframe(edge_group_contains_user)
        .source(id_column="SourceGroupId", node_type="EntraGroup")
        .target(id_column="TargetUserId", node_type="EntraUser")
        .with_columns("SourceGroupId", "TargetUserId", "EdgeKey",
                      key="EdgeKey", display="EdgeKey")
        .add_edge("ContainsGroup").from_dataframe(edge_group_contains_group)
        .source(id_column="SourceGroupId", node_type="EntraGroup")
        .target(id_column="TargetGroupId", node_type="EntraGroup")
        .with_columns("SourceGroupId", "TargetGroupId", "EdgeKey",
                      key="EdgeKey", display="EdgeKey")
    ).done()
    # Validate the schema before building.
    entra_group_graph_spec.show_schema()
    ```

1. Build the graph.

    ```python
    # Build = prepare data + publish for the session.
    entra_group_graph = Graph.build(entra_group_graph_spec)
    print(entra_group_graph.build_status.status)   # "published" or "prepared"
    ```

    > [!NOTE]
    > `Graph.build()` prepares data and publishes in one call. To inspect prepared nodes and edges before publish, call `Graph.prepare(spec)`, review `graph.nodes` and `graph.edges`, then call `graph.publish()`.

1. Run a GQL query.

    ```python
    # Find nested group relationships up to 8 levels deep. 
    # Update the Entra Group name that you want to traverse from 
    
    query_nested_groups = """ 
    MATCH p=(g1:EntraGroup)-[cg]->{1,8}(g2) 
    WHERE g1.displayName = 'tmplevel3' 
    RETURN * 
    """ 
    entra_group_graph.query(query_nested_groups).show()
    ```

## Test the graph notebook

Test the notebook to ensure it produces the expected graph output:

1. Restart the kernel and run all cells top to bottom.
    :::image type="content" source="media/develop-custom-graph-platform-solutions/restart-kernel.png" lightbox="media/develop-custom-graph-platform-solutions/restart-kernel.png" alt-text="A screenshot showing the restart kernel button.":::

1. Confirm each cell completes successfully.
1. If transform cells run longer than 5 minutes on a small pool, tighten snapshot filters and column projection before scaling up.
1. Confirm `show_schema()` returns expected nodes and edges.
1. Run a sample GQL query and verify visualization and tabular output.
1. Validate edge cases:
   - Empty input.
   - Schema drift.
   - Missing table access.

> [!TIP]
> Add markdown cells above each code section to document purpose, inputs, outputs, and the nodes or edges produced.

## Schedule a graph job to materialize the graph

Graphs created in an interactive session are ephemeral. Schedule a graph job to persist and refresh the graph.  For more information, see [Schedule and manage Microsoft Sentinel graph jobs](../datalake/create-custom-graphs.md#persist-your-custom-graph).


1. In your graph notebook, select **Create Scheduled Job** > **Create a graph job**.
    :::image type="content" source="media/develop-custom-graph-platform-solutions/create-graph-job.png" lightbox="media/develop-custom-graph-platform-solutions/create-graph-job.png" alt-text="A screenshot showing the create graph job button.":::

1. Enter graph **Name** and **Description**, and verify the notebook path.
1. Select a schedule:
   - **On demand**: builds once, with a default 30-day retention.
   - **Scheduled**: select repeat cadence and start/end times.
1. Select **Submit**.
1. Open the graph in the Sentinel extension and monitor **Job Details**.
1. Use **Run Now** to run outside schedule as needed.
1. Confirm status progression from `Queued` to `In Progress` to `Ready`.

> [!IMPORTANT]
> Submitted jobs are decoupled from your local notebook. Editing the local `.ipynb` doesn't update the scheduled job. To update a job notebook, download it from the Graphs panel, edit it, then use **Edit job** > **Submit**.


## Query and visualize from Graph explorer

After the graph job status is `Ready`, query and visualize in the Defender portal, notebooks, and REST APIs.

1. In the Defender portal under Microsoft Sentinel, open graph experience and select your materialized graph.
1. Run GQL queries, inspect schema, switch visual and tabular outputs, and traverse next hop.
1. Use this GQL quick reference:

| Pattern or clause | Example |
|---|---|
| Node with label | `(g:EntraGroup)` |
| Typed, directed edge | `-[c:ContainsUser]->` |
| Variable-length path (1 to 8 hops) | `(a)-[e]->{1,8}(b)` |
| Filter | `WHERE g.displayName = 'Finance Admins'` |
| Project, sort, limit | `RETURN g.displayName ORDER BY g.displayName LIMIT 10` |
| Label expressions | `(:EntraUser \| EntraServicePrincipal)` |

> [!NOTE]
> Every GQL query starts with `MATCH`. The engine operates in UTC. Use `ZONED_DATETIME(...)` for datetime literals. `INSERT` and `CREATE` aren't supported. Graphs are read-only.

1. Query from a notebook.

    ```python
    from sentinel_graph import Graph
    # Attach to an already-materialized graph by name.
    graph = Graph.get("entra_group_membership")
    graph.query("MATCH (g:EntraGroup)-[c:ContainsUser]->(u:EntraUser) RETURN g, c, u").show()
    # Purpose-built security algorithms are available too:
    graph.blast_radius(source_property_value="Finance Admins", min_hop_count=1).show()
    ```

1. Query by using Graph REST APIs.

    ```http
    GET https://api.securityplatform.microsoft.com/graphs/graph-instances?graphTypes=Custom
    Authorization: Bearer <access_token>
    ```
    
    ```http
    POST https://api.securityplatform.microsoft.com/graphs/graph-instances/{graphName}/query
    Authorization: Bearer <access_token>
    Content-Type: application/json
    {
      "query": "MATCH (g:EntraGroup)-[c:ContainsUser]->(u) RETURN g, c, u LIMIT 100",
      "responseFormats": ["Table", "Graph"],
      "queryLanguage": "GQL"
    }
    ```

`responseFormats` controls output shape. `"Table"` returns rows, `"Graph"` returns nodes and edges, and `["Table", "Graph"]` returns both.

For more information, see [Graph REST APIs for custom graphs](../datalake/graph-rest-api.md).



## Package and publish your graph solution

Once your graph is tested and materialized, package it for deployment to customers.
For detailed packaging instructions, see [Package and publish Microsoft Sentinel graph and notebook solutions](./package-publish-notebook-graph-solutions.md).


## Troubleshooting

Use the following tables to diagnose common issues by symptom.

### Graph authoring

| Symptom | Likely cause and fix |
|---|---|
| `MicrosoftSentinelProvider` or `sentinel_graph` not found | Sign in again to the extension and confirm a Microsoft Sentinel kernel is selected. |
| Cell hangs at "Starting Spark session" | First startup can take 3 to 5 minutes. If it exceeds 6 minutes, check pool capacity and retry. |
| `show_schema()` is empty or `Graph.build()` fails | Confirm key and display columns exist and are non-null, and source and target `node_type` values match node aliases. |
| GQL query returns no rows | Confirm filter values exist in the selected snapshot and verify snapshot filtering. |
| `publish()` fails with permission denied | Confirm you have Security Operator, Security Administrator, or Global Administrator role. |

### AI-assisted authoring

| Symptom | Likely cause and fix |
|---|---|
| `@sentinel /graph-authoring` does nothing | Confirm GitHub Copilot and Jupyter extensions are installed and active, and you have a Copilot Business or Enterprise plan. |
| Generated code references a missing table | Confirm connector setup and verify the table appears in the data lake explorer. |

### Job scheduling

| Symptom | Likely cause and fix |
|---|---|
| Local notebook edits aren't reflected in the job | Download the job notebook from Graphs panel, edit it, then use **Edit job** > **Submit**. |
| Materialized graph disappeared | On-demand graphs have 30-day retention. Schedule a recurring job or run a new build. |

## Related content

- [Custom graphs in Microsoft Sentinel overview](../datalake/custom-graphs-overview.md)
- [Get started with custom graphs](../datalake/create-custom-graphs.md)
- [AI-assisted custom graph authoring](../datalake/create-graphs-with-ai.md)
- [Microsoft Sentinel graph provider reference](../datalake/sentinel-graph-provider-reference.md)
- [GQL reference for Sentinel custom graph](../datalake/gql-reference-for-sentinel-custom-graph.md)
- [Graph REST APIs for custom graphs](../datalake/graph-rest-api.md)
- [Onboard to Microsoft Sentinel data lake](../datalake/sentinel-lake-onboard-defender.md)
- [Run notebooks on Microsoft Sentinel data lake](../datalake/notebooks.md)
- [Publish a Security Copilot agent or analytics solution in Security Store](/security/store/partners/publish-a-security-copilot-agent-or-analytics-solution-in-security-store)
- [Microsoft Partner Center](<https://partner.microsoft.com/dashboard/home>)
