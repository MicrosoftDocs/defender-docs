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

# Get started with custom graphs in Microsoft Sentinel

Custom graphs in Microsoft Sentinel enable security researchers and analysts to create tailored graph representations of their security data. By building custom graphs, you can model specific attack patterns, investigate threats, and run advanced graph algorithms to uncover hidden relationships within your digital environment. This guide walks you through the steps to create and manage custom graphs by using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension.

## Prerequisites

### Onboard to Microsoft Sentinel graph

To create custom graphs, you must be onboarded to Microsoft Sentinel data lake. For more information, see [Onboard to Microsoft Sentinel data lake](sentinel-lake-onboard-defender.md).

### Permissions

To interact with custom graphs, you need the following XDR permissions in Sentinel data lake. The following table lists the permission requirements for common graph operations:

| Graph operation| Permissions required|
|---------------------|-------------------------|
| Create and query an ephemeral graph | Use a [custom Microsoft Defender XDR unified RBAC role with *data (manage)*](https://aka.ms/data-lake-custom-urbac) permissions over the Microsoft Sentinel data collection. |
| Materialize a graph in tenant | Use one of the following Microsoft Entra ID roles:<br>[Security operator](/entra/identity/role-based-access-control/permissions-reference#security-operator)<br>[Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)<br>[Global administrator](/entra/identity/role-based-access-control/permissions-reference#global-administrator) |
| Query a materialized graph | Use a [custom Microsoft Defender XDR unified RBAC role with *security data basics (read)*](/defender-xdr/custom-permissions-details) permissions over the Microsoft Sentinel data collection. |

Microsoft Entra ID roles provide broad access across all workspaces in the data lake. For more information, see [Roles and permissions in Microsoft Sentinel](../roles.md#roles-and-permissions-for-the-microsoft-sentinel-data-lake).

### Install Visual Studio Code and the Microsoft Sentinel extension 

Create custom graphs by using Jupyter notebooks in the Microsoft Sentinel Visual Studio Code extension. For more information, see [Install Visual Studio Code and the Microsoft Sentinel extension ](notebooks.md#install-visual-studio-code-and-the-microsoft-sentinel-extension)
  
During the preview period, select **Auto Update** and select **Install Pre-Release Versions**.

:::image type="content" source="media/create-custom-graphs/install-pre-release-versions.png" lightbox="media/create-custom-graphs/install-pre-release-versions.png" alt-text="A screenshot showing the install pre-release versions option in Visual Studio Code.":::


## Create a custom graph 

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

   :::image type="content" source="media/create-custom-graphs/sign-in-to-view-graphs.png" lightbox="media/create-custom-graphs/sign-in-to-view-graphs.png" alt-text="A screenshot of the sign-in page for graphs in Visual Studio Code.":::

1. Select **Select kernel** in the top right of the notebook window to select a spark compute pool.
1. Select **Microsoft Sentinel**, then select the **Medium graph pool**.

   :::image type="content" source="media/create-custom-graphs/select-kernel.png"  lightbox="media/create-custom-graphs/select-kernel.png" alt-text="A screenshot of the select kernel page in Visual Studio Code.":::


1. In an empty cell in the new notebook, paste the following sample code to get started with custom graphs:


    ```python
    import pkg_resources
    from packaging import version
    import logging

    version = pkg_resources.get_distribution('MicrosoftSentinelGraphProvider').version
    print(f"✅ MicrosoftSentinelGraphProvider: {version}" + f" using pool name : {spark.conf.get('spark.synapse.pool.   name')}")

    print(f"Running in: Region  : {spark.conf.get('spark.cluster.region')}" + f" | Account id : {spark.conf.get ('spark.pjs.account.id')}")


    # Set the logging level for the entire package
    logging.getLogger('sentinel_graph').setLevel(logging.DEBUG)  # or ERROR, WARNING, INFO, DEBUG. Default is INFO
    print(f"Logging level set to: {logging.getLevelName(logging.getLogger('sentinel_graph').level)} and above")
    ```

    This checks the version of the library, your Spark custer region and account ID, and sets the logging level to DEBUG for detailed output.
    
1. Run the cell to by selecting the run cell triangle icon to the left of the cell. The first time you run a cell, you might be prompted to select a kernel if you didn't already select one. Select **Microsoft Sentinel**, then select the **Medium graph pool**.

     The first time you run a cell, it might take up to five minutes to start the Spark session.

   :::image type="content" source="media/create-custom-graphs/run-first-cell.png" lightbox="media/create-custom-graphs/run-first-cell.png" alt-text="A screenshot showing the running of the first cell in Visual Studio Code.":::

1. Read the `SignInLogs` and `EntraUsers` tables from Sentinel data lake to create DataFrames to use in your graph specification. Replace `<LogAnalyiticsWorkspace>` with your Log Analytics workspace that contains your `SignInLogs` table.

    In a new cell, paste and run the following code:

    ```python
    from sentinel_lake.providers import MicrosoftSentinelProvider
    from pyspark.sql.functions import col, count, lit, coalesce, window, expr, sum, first
    #from pyspark.sql.types import StructType, StructField, StringType

    sentinel_provider = MicrosoftSentinelProvider(spark)

    ## Read SignIn logs and Entra User tables from Sentinel Lake
    signIn_df = (sentinel_provider.read_table('SigninLogs',"<LogAnalyiticsWorkspace>")
                  .filter((col("UserType").isin("Member")) & (col('TimeGenerated') >= expr("current_timestamp()     - INTERVAL 14 DAYS")) & (col("UserId").isNotNull()))\
                    .select("Identity", "CorrelationId", "ResourceId", "AppId", "ResourceDisplayName",  "UserPrincipalName", "UserId", "IPAddress", "ResourceGroup", "UserDisplayName", "UserAgent",     "TimeGenerated")\
                          ).persist()

    users_df = (sentinel_provider.read_table('EntraUsers').filter(
        (col("id").isNotNull()) &
        (col("id") != '') &
        (col('TimeGenerated') >= expr("current_timestamp() - INTERVAL 14 DAYS"))
    ).select(
        "country", "department", "displayName", "employeeId", "givenName", "id", "mail", "TimeGenerated"
    ).dropDuplicates(["id"])\
    .persist()
    )

    ## Show the first 5 rows of each DataFrame
    signIn_df.show(5, truncate=False)
    users_df.show(5, truncate=False)
    ```

1. Create dataframes for the graph's nodes & edges. In a new cell, paste and run the following code:

    ```python
    
    EntraUsers_df = users_df.withColumn("nodeType", lit("User"))

    Department_df = users_df.selectExpr("Department as Org").distinct().withColumn("nodeType", lit("Department"))

    BelongsTo_df = users_df.withColumn("edgeType", lit("BelongsTo"))\
                            .withColumn("UserId_BT", col("id"))

    AppInfo_df = signIn_df.selectExpr("ResourceId", "AppId", "ResourceDisplayName as AppName")\
                        .withColumn("nodeType", lit("App"))\
                        .dropDuplicates(["ResourceId", "AppId"])
                            #.withColumn("dest", concat(col("UserId"), lit("_User")))

    CommunicatedWith_df = signIn_df.groupBy(
                                        col("UserId"), col("IPAddress"), col("AppId"), col("UserAgent"),
                                        col("UserId").alias("UserId_dest"), 
                                        lit("communicatedWith").alias("edgeType"),
                                        #window(col("TimeGenerated"), "4 hours").alias("TimeGenerated")
                                    ).agg(count("*").alias("count"), first("TimeGenerated").alias   ("FirstTimeSeen"))


    #- Validate the DataFrames
    EntraUsers_df.show(5, truncate=False)
    AppInfo_df.show(5, truncate=False)
    BelongsTo_df.show(5, truncate=False)
    Department_df.show(5, truncate=False)
    CommunicatedWith_df.show(5, truncate=False) 
    ```

1. Create a graph specification by using the DataFrames created in the previous step.  
    This step creates 3 node types
        + Users
        + Applications 
        + Department
    and 2 edge types
        + BelongsTo 
        + communicatedWith

    In a new cell, paste and run the following code:

    ```python
    from sentinel_graph.builders import GraphSpecBuilder

    builder = (GraphSpecBuilder.start()

        .add_node("Users") \
            .from_dataframe(EntraUsers_df.df) \
            .with_columns("country", "department", "displayName", "employeeId",     "givenName", "id", "mail", "TimeGenerated", "nodeType", key="id",   display="id")

        .add_node("Applications") \
            .from_dataframe(AppInfo_df.df) \
            .with_columns("ResourceId", "AppId", "AppName", "nodeType", key ="AppId", display="AppId")

         .add_node("Department") \
            .from_dataframe(Department_df.df) \
            .with_columns("Org", "nodeType", key="Org", display="Org")

        .add_edge("BelongsTo") \
            .from_dataframe(BelongsTo_df.df) \
            .source(id_column="UserId_BT", node_type="Users") \
            .target(id_column="department", node_type="Department") \
            .with_columns("edgeType","TimeGenerated", key ="edgeType",  display="edgeType")

        .add_edge("communicatedWith") \
            .from_dataframe(CommunicatedWith_df) \
            .source(id_column="UserId", node_type="Users") \
            .target(id_column="AppId", node_type="Applications") \
            .with_columns("edgeType","count", "FirstTimeSeen",
                          #Other fields can be added here if needed
                          #"TimeGenerated", 
                      key="edgeType", display="edgeType")
    
    ).done()
    ```

1. Build the graph by using the graph specification created in the previous step. In a new cell, paste and run the following code:

    ```python
    # Create the graph object
    build_result = my_graph.build_graph_with_data()

    print(f"Status: {build_result.get('status')}")
    ```
    When successful, the last line of the output cell displays *Status: success*.

You have now created an ephemeral graph in the notebook.

1. Show a visual representation of the graph. In a new cell, paste and run the following code:

    ```python
    query1 = "MATCH (n:Users)-[e]->(s) WHERE n.department = 'Customer XP' RETURN * LIMIT 50"
    builder.query(query1).show()
    ```

    This code runs a sample GQL query to retrieve all user nodes and their relationships for users in the "Customer XP" department, limiting the results to 50 entries. The resulting graph is visualized in the output.

   :::image type="content" source="media/create-custom-graphs/graph-visualization.png" lightbox="media/create-custom-graphs/graph-visualization.png" alt-text="A screenshot showing the visualization of a graph in Visual Studio Code.":::

    The following code runs another sample GQL query to retrieve all nodes that communicated with applications and belong to the "Customer XP" department, limiting the results to 50 entries. The resulting graph is visualized in the output.

    ```python
    query2 = """MATCH (n)-[e:communicatedWith]->(a), (n)-[b:BelongsTo]->(d)
            WHERE d.Org IN ["Customer XP"]
            RETURN *
            LIMIT 50"""
    builder.query(query2).show()
    ```

   :::image type="content" source="media/create-custom-graphs/graph-visualization2.png" lightbox="media/create-custom-graphs/graph-visualization2.png" alt-text="A screenshot showing the visualization of a graph and detail side-panel in Visual Studio Code.":::


### Materialize a graph in your tenant

After you create an ephemeral graph, you can persist it by storing the graph in your tenant with a scheduled job.

1. From your graph notebook, select **Create Scheduled Job**, then select **Create a graph job**.

    :::image type="content" source="media/create-custom-graphs/create-scheduled-job.png" lightbox="media/create-custom-graphs/create-scheduled-job.png" alt-text="A screenshot showing the create scheduled job button in a graph notebook.":::

1.  In the **Create graph job** form, enter the **Graph name** and **Description**, and verify the correct graph notebook is included in **Path**.

1.  To build the graph without configuring a refresh schedule, select **On demand** in the **Schedule** section, then select **Submit** to create the graph.

1.  To build the graph where the graph data is refreshed regularly, select **Scheduled** in the **Schedule** section.

    1.  Select a **Repeat frequency** for the job. You can choose from **By the minute**, **Hourly**, **Weekly**, **Daily**, or **Monthly**.

    1.  More options are displayed to configure the schedule, depending on the frequency you select. For example day of the week, time of day, or day of the month.

    1.  Select a **Start on** time for the schedule to start running.

    1.  Select an **End on** time for the schedule to stop running. If you don't want to set an end time for the schedule, select **Set job to run indefinitely**. Dates and times are in your timezone.

    1.  Select **Submit** to save the job configuration and publish the job. The graph building process starts in your tenant. View the newly created graph and its latest status in the Sentinel extension.

    :::image type="content" source="media/create-custom-graphs/configure-graph-job.png" lightbox="media/create-custom-graphs/configure-graph-job.png" alt-text="A screenshot of the create graph job page.":::

.

### Viewing and managing materialized graphs

1.  In Microsoft Sentinel extension, select **Graphs** -\> **Custom Graphs** -\> and your materialized graph.

:::image type="content" source="media/create-custom-graphs/configure-graph-job.png" lightbox="media/create-custom-graphs/configure-graph-job.png" alt-text="A screenshot showing the create graph job page in Visual Studio Code.":::

1. From the list of graphs, select your materialized graph to view its details.
1. Select the **Job Details** tab to view the status of the graph job, including last run time, next run time, and any errors encountered during the build process.
1. Select **Run Now** to manually trigger a graph build outside of the scheduled times. The **Status** changes to **Queued**, then "In Progress" while the graph is being built.

    :::image type="content" source="media/create-custom-graphs/graph-job-details.png" lightbox="media/create-custom-graphs/graph-job-details.png" alt-text="A screenshot showing the graph job details tab in Visual Studio Code.":::

1. When the graph build is complete, the **Status** updates to **Succeeded**. Select the **Graph Details** tab to view information about the graph. The **Status** shows **Ready** when the graph is successfully built and stored in your tenant.

    :::image type="content" source="media/create-custom-graphs/graph-details.png" lightbox="media/create-custom-graphs/graph-details.png" alt-text="A screenshot of the graph details tab.":::

1.  You can now query the graph in the query editor.  Select the **Graph Query** tab to open the graph query editor.
1. Paste the following sample GQL query to retrieve all user nodes in the graph:

    ```gql
    MATCH (n)-[e:communicatedWith]->(a), (n)-[b:BelongsTo]->(d)
            WHERE d.Org in ["Customer XP"]
            RETURN *
            LIMIT 30
    ```
:::image type="content" source="media/create-custom-graphs/graph-query.png" lightbox="media/create-custom-graphs/graph-query.png" alt-text="A screenshot of the graph query tab.":::

For more information on GQL, see [GQL language guide](/kusto/query/graph-query-language-reference?view=microsoft-fabric).

## Related articles

- [Microsoft Sentinel graph provider library reference](./graph-builder-api-reference.md)