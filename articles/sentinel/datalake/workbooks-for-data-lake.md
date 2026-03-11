---  
title:  Run KQL queries against the Microsoft Sentinel data lake
titleSuffix: Microsoft Security  
description: Use the Defender portal's Data lake exploration KQL queries to query and interact with the Microsoft Sentinel data lake. Create, edit, and run KQL queries to explore your data lake resources
author: EdB-MSFT  
ms.service: microsoft-sentinel  
ms.topic: how-to
ms.subservice: sentinel-graph
ms.date: 12/10/2025
ms.author: edbaynash  

ms.collection: ms-security  
---  

# Visualize data in Microsoft Sentinel data lake using Workbooks
 
Running Microsoft Sentinel workbooks on top of Sentinel data lake data allows SOC teams to visualize and monitor security telemetry directly from the lake using KQL, without duplicating or reshaping data. By selecting Sentinel data lake as the data source in a workbook, analysts can run the same analytical queries used for investigations and hunting, and render them as interactive charts and tables for operational monitoring and reporting. This approach enables consistent analytics across ad-hoc queries, workbooks, and downstream tools, supports longer data retention scenarios, and allows workbooks to scale with high-volume historical data stored in the lake, making it ideal for advanced threat hunting, trend analysis, and executive dashboards.
 
When using Sentinel data lake as the data source for your workbooks, keep in mind the importance of query performance as workbook visualization may auto-refresh and execute repeatedly. Queries should be scoped with appropriate time filters, summarization, and projections to avoid scanning excessive historical data in the lake, ensuring dashboards remain responsive while still leveraging long-term, high-volume telemetry for analysis.
 
> [!NOTE]
> Relative time ranges such as `> ago(10d) ` are supported up to 90 days. Absolute time ranges are supported according to your data retention policy. 


1. In the defender portal go to **Microsoft Sentinel** > **Threat management** > **Workbooks**.
1. Select the cube icon in the top right corner to select the workspaces you want to query against.
1. Select **Add workbook** 
    :::image type="content" source="./media/workbooks-for-data-lake/add-workbook.png" alt-text="Screenshot of a workbook in edit mode with the query editor open." lightbox="./media/workbooks-for-data-lake/workbook-edit-mode.png":::
   
    A new workbook opens with a basic query and a par chart visual.
1. Select the **Edit**.
    :::image type="content" source="./media/workbooks-for-data-lake/edit-new-workbook.png" alt-text="Screenshot of a new workbook with basic query and chart visual." lightbox="./media/workbooks-for-data-lake/edit-workbook.png":::
1. Under the chart, select **Add**, and then select **Add data source and visualization**.
    :::image type="content" source="./media/workbooks-for-data-lake/add-data-source-and-visualization.png" alt-text="Screenshot of the Add data source and visualization button in a Microsoft Sentinel workbook." lightbox="./media/workbooks-for-data-lake/add-data-source-and-visualization.png":::    

1. Select **Sentinel data lake** as the data source
1. Select the workspace containing your SignInLogs table in the data lake.
1. Base the following KQL into the query editor:
    ```kql
    SigninLogs
    | summarize SignInCount = count(), FailedCount = countif(ResultType != "0") by UserPrincipalName
    | extend FailureRate = round(100.0 * FailedCount / SignInCount, 2)
    | order by FailedCount desc
    | take 20
    ```
1. Select **Run query** to visualize the results.
 
    > [!NOTE]
    > The **Visualization** type **Set by query** is not supported. 

    :::image type="content" source="./media/workbooks-for-data-lake/edit-new-query.png" alt-text="Screenshot showing the editing of a new query and visualization." lightbox="./media/workbooks-for-data-lake/edit-new-query.png":::

1. Customize the visual by selecting **Visual formatting**
1. Under **Visualization**, select **Bar Chart**
1. Select **X Axis** and set the **Column** to `UserPrincipalName` 
1. Select **Done editing** to save your changes.
    :::image type="content" source="./media/workbooks-for-data-lake/customize-visual.png" alt-text="Screenshot showing the results of a new query in a Microsoft Sentinel workbook." lightbox="./media/workbooks-for-data-lake/new-query-result.png":::
1. Select **Done editing** on the main workbook page
1. Select **Save** to save the workbook to your library, giving your workbook a name and location.
1. You can view your saved workbook in the list of workbooks, and select it to view the visualizations you created. You can also edit the workbook at any time to update the queries or visuals.

For more information on using workbooks with Sentinel data lake, see [Create and publish workbooks for Microsoft Sentinel solutions](/azure/sentinel/sentinel-workbook-creation).