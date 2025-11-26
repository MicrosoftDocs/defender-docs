---
title: Get started with custom graphs in Microsoft Sentinel
description: Learn how to create and manage custom graphs in Microsoft Sentinel to model attack patterns, investigate threats, and run advanced graph algorithms.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 12/01/2025
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

#customer intent: As a security researcher, I want to create custom graphs in my tenant so that I can continuously monitor and detect systemic threats.
---

## Get started with custom graphs in Microsoft Sentinel

Custom graphs in Microsoft Sentinel enable security researchers and analysts to create tailored graph representations of their security data. By building custom graphs, you can model specific attack patterns, investigate threats, and run advanced graph algorithms to uncover hidden relationships within your digital environment. This guide walks you through the steps to create and manage custom graphs by using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension.

### Prerequisites

#### Onboard to Microsoft Sentinel graph

To create custom graphs, you must be onboarded to Microsoft Sentinel data lake. For more information, see [Onboard to Microsoft Sentinel data lake](sentinel-lake-onboard-defender.md).

#### Permissions

To interact with custom graphs, you need the following XDR permissions in Sentinel data lake. The following table lists the permission requirements for common graph operations:

| Graph operation| Permissions required|
|---------------------|-------------------------|
| Create and query an ephemeral graph | Use a [custom Microsoft Defender XDR unified RBAC role with *data (manage)*](https://aka.ms/data-lake-custom-urbac) permissions over the Microsoft Sentinel data collection. |
| Materialize a graph in tenant | Use one of the following Microsoft Entra ID roles:<br>[Security operator](/entra/identity/role-based-access-control/permissions-reference#security-operator)<br>[Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)<br>[Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) |
| Query a materialized graph | Use a [custom Microsoft Defender XDR unified RBAC role with *security data basics (read)*](/defender-xdr/custom-permissions-details) permissions over the Microsoft Sentinel data collection. |

Microsoft Entra ID roles provide broad access across all workspaces in the data lake. For more information, see [Roles and permissions in Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/roles#roles-and-permissions-for-the-microsoft-sentinel-data-lake).

#### Install Visual Studio Code and the Microsoft Sentinel extension 

Create custom graphs by using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension. For more information, see[Install Visual Studio Code and the Microsoft Sentinel extension ](notebooks.md#install-visual-studio-code-and-the-microsoft-sentinel-extension)

## Create a custom graph 

**Important: All screenshots must be updated before our final release.**

To create and work with custom graphs, complete the following steps:

1. Create an ephemeral graph
1. Materialize the graph in your tenant
1. View and manage materialized graphs


### Create an ephemeral graph

Create an ephemeral graph by using a Jupyter notebook in the Microsoft Sentinel Visual Studio Code extension. 

The following steps walk you through creating your first custom graph by using a sample notebook:

1. In Visual Studio Code with the Microsoft Sentinel extension installed, select the **Microsoft Sentinel** icon in the left-hand menu.
1. Select **Sign in to view graphs**
1. A dialog box appears with the text *The extension 'Microsoft Sentinel' wants to sign in using Microsoft*. Select **Allow** to sign in.
1. Sign in with your credentials.
1. After signing in, select  **+** then select **Create new notebook**.
1. Name the notebook file and save it in an appropriate location in your workspace.

   :::image type="content" source="media/custom-graphs/sign-in-to-view-graphs.png" lightbox="media/custom-graphs/sign-in-to-view-graphs.png" alt-text="A screenshot of the sign-in page for graphs in Visual Studio Code.":::

1. Select **Select kernel** in the top right of the notebook window to select a spark compute pool.
1. Select **Microsoft Sentinel**, then select the **Medium graph pool**.

   :::image type="content" source="media/custom-graphs/select-kernel.png"  lightbox="media/custom-graphs/select-kernel.png" alt-text="A screenshot of the select kernel page in Visual Studio Code.":::


1. In an empty cell in the new notebook, paste the following sample code to get started with custom graphs:

    ```python
    # create the graph using the graph spec builder
    # type: ignore
    # pyright: off
    # pylance: off


    # Data lake tables we will use as input for the graph in this example
    identity_info_tbl = "cgi_identity_info_SPRK"
    device_info_tbl = "cgi_device_info_SPRK"
    signin_logs_tbl = "cgi_signin_logs_SPRK"

    my_graph = (GraphSpecBuilder.start()

            # Add user node from IdentityInfo table (using direct column names)
            .add_node("user") 
                .from_table(identity_info_tbl)
                .with_time_range(time_column="TimeGenerated", start_time="2025-10-22", end_time="2025-10-24")
                .with_columns("id", "name", "email", key="id", display="name")

            # Add device node from DeviceInfo table
            .add_node("device") 
                .from_table(device_info_tbl)
                .with_time_range(time_column="TimeGenerated", start_time="2025-10-22", end_time="2025-10-24")
                .with_columns("id", "name", "type", key="id", display="name")

            # Add edge between users and devices from SigninLogs table
            .add_edge("sign_in") 
                .from_table(signin_logs_tbl)
                .with_time_range(time_column="TimeGenerated", start_time="2025-10-22", end_time="2025-10-24")
                .source(id_column="UserId", node_type="user")
                .target(id_column="DeviceId", node_type="device")
                .with_columns("id", "location", key="id", display="id")

            ).done()

    print(f"✅ Graph specification created successfully")
    ```

    This cell creates a simple graph specification with user and device nodes, and sign-in edges between them by using sample tables in Sentinel data lake. You can modify the code to create graphs based on your own data, dates, and requirements.

1. Run the cell to create the graph specification by selecting the run cell triangle icon to the left of the cell. The first time you run a cell, you might be prompted to select a kernel if you didn't already select one. Select **Microsoft Sentinel**, then select the **Medium graph pool**.

   The first time you run a cell, it might take up to five minutes to start the Spark session.

   :::image type="content" source="media/custom-graphs/run-first-cell.png" lightbox="media/custom-graphs/run-first-cell.png" alt-text="A screenshot showing the running of the first cell in Visual Studio Code.":::

   After the cell runs successfully, the message *✅ Graph specification created successfully* displays in the last output cell. You have now created a graph specification.

1. Build the graph by using the graph specification created in the previous step. In a new cell, paste and run the following code:

    ```python
    # build your graph

    build_result = my_graph.build_graph_with_data()

    print(f"Status: {build_result.get('status')}")
    ```

    When successful, the last line of the output cell displays *Status: success*.

    You have now created an ephemeral graph in the notebook.

1. Show a visual representation of the graph. In a new cell, paste and run the following code:
This shows a sample of up to 50 elements from the graph as a visual. 

    ```python
    my_graph.show(limit=50)
    ```

    The output cell displays a visual representation of the graph.

    :::image type="content" source="media/custom-graphs/graph-visualization.png" lightbox="media/custom-graphs/graph-visualization.png" alt-text="A     screenshot showing the visualization of a graph in Visual Studio Code.":::

## Perform graph analytics

With the ephemeral graph created, you can now run advanced graph analytics by using built-in graph algorithms. The following sections demonstrate two common graph analytics: blast radius and k-hop neighbors.

### Blast radius visualization

To explore and interact with the graph, in a new cell, paste and run the following code to import the library and create a graph object for blast radius visualization. Replace the `source_property_value` and `target_property_value` with appropriate node property values from your data.

```python
from sentinel_graph.builders.query_input import BlastRadiusQueryInput

result = my_graph.blast_radius(BlastRadiusQueryInput(source_property_value="user-003", target_property_value="device-003", min_hop_count=1))

result.show()
```

This code runs a blast radius query on the graph, starting from a user node with ID `user-003` and expanding to connected device nodes at least one hop away. The resulting subgraph is visualized in the output.

:::image type="content" source="media/custom-graphs/blast-radius-graph.png" lightbox="media/custom-graphs/blast-radius-graph.png" alt-text="A screenshot showing the blast radius visualization of a graph in Visual Studio Code.":::

### K-hop neighbors visualization
To find and visualize k-hop neighbors in the graph, in a new cell, paste and run the following code. Replace the `start_property_value` with an appropriate node property value from your data.

```python
from sentinel_graph.builders.query_input import K_HopQueryInput

result = my_graph.k_hop(K_HopQueryInput(source_property_value="user-001"))

result.show()
```

This code runs a k-hop query on the graph, starting from a user node with ID `user-001` and expanding to its neighbors. The resulting subgraph is visualized in the output.

:::image type="content" source="media/custom-graphs/k-hop-graph.png" lightbox="media/custom-graphs/k-hop-graph.png" alt-text="A screenshot showing the k-hop neighbors visualization of a graph in Visual Studio Code.":::
  


### Materialize graph in your tenant

After you create an ephemeral graph, you can persist it by storing the graph in your tenant with a scheduled job.

1. From your graph notebook, select **Create Scheduled Job**, then select **Create a graph job**.

    :::image type="content" source="media/custom-graphs/create-scheduled-job.png" lightbox="media/custom-graphs/create-scheduled-job.png" alt-text="A screenshot showing the create scheduled job button in a graph notebook.":::

1.  In the **Create graph job** form, enter the **Graph name** and **Description**, and verify the correct graph notebook is included in **Path**.

1.  To build the graph without configuring a refresh schedule, select **On demand** in the **Schedule** section, then select **Submit** to create the graph.

1.  To build the graph where the graph data is refreshed regularly, select **Scheduled** in the **Schedule** section.

    1.  Select a **Repeat frequency** for the job. You can choose from **By the minute**, **Hourly**, **Weekly**, **Daily**, or **Monthly**.

    1.  More options are displayed to configure the schedule, depending on the frequency you select. For example day of the week, time of day, or day of the month.

    1.  Select a **Start on** time for the schedule to start running.

    1.  Select an **End on** time for the schedule to stop running. If you don't want to set an end time for the schedule, select **Set job to run indefinitely**. Dates and times are in your timezone.

    1.  Select **Submit** to save the job configuration and publish the job. The graph building process starts in your tenant. View the newly created graph and its latest status in the Sentinel extension.

    :::image type="content" source="media/custom-graphs/configure-graph-job.png" lightbox="media/custom-graphs/configure-graph-job.png" alt-text="A screenshot of the create graph job page":::

.

### Viewing and managing materialized graphs

1.  In Microsoft Sentinel extension, select **Graphs** -\> **Custom Graphs** -\> and your materialized graph.

:::image type="content" source="media/custom-graphs/configure-graph-job.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

1. From the list of graphs, select your materialized graph to view its details.
1. Select the **Job Details** tab to view the status of the graph job, including last run time, next run time, and any errors encountered during the build process.
1. Select **Run Now** to manually trigger a graph build outside of the scheduled times. The **Status** changes to **Queued**, then "In Progress" while the graph is being built.

    :::image type="content" source="media/custom-graphs/graph-job-details.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

1. When the graph build is complete, the **Status** updates to **Succeeded**. Select the **Graph Details** tab to view information about the graph. The **Status** shows **Ready** when the graph is successfully built and stored in your tenant.

    :::image type="content" source="media/custom-graphs/graph-details.png" lightbox="media/custom-graphs/graph-details.png" alt-text="A screenshot of the graph details tab.":::

1.  You can now query the graph in the query editor.  Select the **Graph Query** tab to open the graph query editor.
1. Paste the following sample GQL query to retrieve all user nodes in the graph:

    ```gql
    MATCH (u: user)-[s:sign_in]->(d: device) 
    RETURN u,s,d LIMIT 10
    ```
:::image type="content" source="media/custom-graphs/graph-query.png" lightbox="media/custom-graphs/graph-query.png" alt-text="A screenshot of the graph query tab.":::

For more information on GQL, see [GQL language guide](/fabric/graph/gql-language-guide).





## Related articles

- [Microsoft Sentinel graph provider library reference](sentinel-custom-graph-provider-reference.md)