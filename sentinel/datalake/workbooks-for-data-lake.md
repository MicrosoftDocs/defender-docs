---  
title: Workbooks for Microsoft Sentinel Data Lake
titleSuffix: Microsoft Security  
description: Learn how to create and use Microsoft Sentinel workbooks with data from the Microsoft Sentinel data lake to visualize and monitor security data.
ms.author: edbaynash  
author: EdB-MSFT  
ms.reviewer: zeinam
ms.service: microsoft-sentinel  
ms.topic: how-to
ms.subservice: sentinel-platform
ms.date: 07/01/2026

ms.collection: ms-security  
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---  

# Visualize data in Microsoft Sentinel data lake using workbooks
 
Microsoft Sentinel workbooks let SOC teams visualize and monitor security data directly from the data lake. Analysts use KQL (Kusto Query Language) to query the lake without duplicating or transforming data. Select Sentinel data lake as the data source in a workbook to run the same queries used for investigations and hunting. Then render results as interactive charts and tables for monitoring and reporting. Running workbook queries directly against the Sentinel data lake keeps analytics consistent across queries, supports longer data retention, and scales with high-volume historical data. Consistent analytics, longer data retention, and high-volume scalability make workbooks ideal for threat hunting, trend analysis, and executive dashboards.
 
This article walks you through the process of creating workbooks for using Microsoft Sentinel data lake as the data source. For more information on using workbooks with Sentinel, see [Visualize and monitor your data by using workbooks in Microsoft Sentinel](/azure/sentinel/monitor-your-data?tabs=defender-portal).

Query performance matters because workbook visuals can autorefresh and run many times. Add time filters, summarize results, and project only the columns you need. Adding time filters, summarizing results, and projecting only the required columns prevent queries from scanning too much historical data. Well-scoped queries keep dashboards fast while still using long-term data for analysis.

## Create a workbook with Microsoft Sentinel data lake as the data source

Follow these steps to create a workbook that uses Microsoft Sentinel data lake as its data source:

1. In the Defender portal, go to **Microsoft Sentinel** > **Threat management** > **Workbooks**.

1. Select the cube icon in the top right corner to select the workspaces you want to store your workbooks.

1. Select **Add workbook**.

    :::image type="content" source="./media/workbooks-for-data-lake/add-workbook.png" alt-text="Screenshot of a workbook in edit mode with the query editor open." lightbox="./media/workbooks-for-data-lake/add-workbook.png":::
   
    A new workbook opens with a basic query and a par chart visual.

1. Select the **Edit**.

    :::image type="content" source="./media/workbooks-for-data-lake/edit-new-workbook.png" alt-text="Screenshot of a new workbook with basic query and chart visual." lightbox="./media/workbooks-for-data-lake/edit-new-workbook.png":::

1. Under the chart, select **Add**, and then select **Add data source and visualization**.

    :::image type="content" source="./media/workbooks-for-data-lake/add-data-source-and-visualization.png" alt-text="Screenshot of the Add data source and visualization button in a Microsoft Sentinel workbook." lightbox="./media/workbooks-for-data-lake/add-data-source-and-visualization.png":::    

1. Select **Sentinel data lake** as the data source.

1. Select the workspace containing your SignInLogs table in the data lake.

1. Paste the following KQL into the query editor:
    ```kql
    AWSCloudTrail
    | where isnotempty(ErrorCode)
    | summarize FailedEvents = count()
        by bin(TimeGenerated, 1h), SourceIpAddress, UserIdentityPrincipalid
    | where FailedEvents > 3
    | summarize FailedEvents = sum(FailedEvents) by UserIdentityPrincipalid
    | top 10 by FailedEvents
    ```
1. Under **Visualization** select **Bar chart**.

1. Select **Run query** to visualize the results.

1. Select **Done editing** to exit edit mode and view your visual.

 
    :::image type="content" source="./media/workbooks-for-data-lake/edit-new-query.png" alt-text="Screenshot showing the editing of a new query and visualization." lightbox="./media/workbooks-for-data-lake/edit-new-query.png":::

    This visual shows the top 10 AWS principal identities with the most failed API calls in AWSCloudTrail logs. Failed events are counted and filtered to show identities with repeated errors. Use the failed-events bar chart to spot suspicious or misconfigured identities that produce unusual failure patterns.
    
    > [!NOTE]
    > The **Visualization** type **Set by query** isn't supported. 
    >
    > Relative time ranges such as `> ago(10d) ` work for up to 90 days. Absolute time ranges follow your data retention policy. 


1.  On the workbook page, select **Done editing**.

1. Select **Save** to save the workbook to your library, giving your workbook a name and location.

1. You can view your saved workbook in the list of workbooks, and select it to view the visualizations you created. You can also edit the workbook at any time to update the queries or visuals.

:::image type="content" source="./media/workbooks-for-data-lake/saved-workbooks.png" lightbox="./media/workbooks-for-data-lake/saved-workbooks.png" alt-text="Screenshot showing the list of saved workbooks in Microsoft Sentinel.":::

## Related content

- [KQL queries in the Microsoft Sentinel data lake](kql-queries.md)
- [Visualize and monitor your data by using workbooks in Microsoft Sentinel](/azure/sentinel/monitor-your-data?tabs=defender-portal)
