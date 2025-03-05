---
title: Use Microsoft Sentinel custom functions in advanced hunting in Microsoft Defender
description: Using functions, saved queries, and custom rules in advanced hunting in the portal unifying Defender XDR and Sentinel data
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
  - usx-security
ms.topic: conceptual
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 08/07/2024
---

# Use Microsoft Sentinel functions, saved queries, and custom rules 


## Use functions

To use a function from Microsoft Sentinel, go to the **Functions** tab and scroll until you find the function that you want. Double-click the function name to insert the function in the query editor. 

You can also select the vertical ellipses ( ![kebab icon](/defender/media/ah-kebab.png) ) to the right of the function and select **Insert to query** to insert the function into a query in the query editor. 

Other options include:
- **View details** – opens the function side pane containing its details
- **Load function code** – opens a new tab containing the function code

For editable functions, more options are available when you select the vertical ellipses:
- **Edit details** – opens the function side pane to allow you to edit details about the function (except folder names for Sentinel functions)
- **Delete** – deletes the function

### Use adx() operator for Azure Data Explorer queries (Preview)
Use the `adx()` operator to query tables stored in Azure Data Explorer. Read [What is Azure Data Explorer?](/azure/data-explorer/data-explorer-overview) for more details.

This feature was previously only available in log analytics in Microsoft Sentinel. Users can now use the operator in advanced hunting in the unified Microsoft Defender portal without needing to manually open a Microsoft Sentinel window. 

In the query editor, enter the query in the following format:
```Kusto
adx('<Cluster URI>/<Database Name>').<Table Name>
```

For example, to get the first 10 rows of data from the `StormEvents` table stored in a certain URI:

:::image type="content" source="/defender-xdr/media/adx-sample.png" alt-text="Screenshot of adx operator in advanced hunting." lightbox="/defender-xdr/media/adx-sample.png":::

> [!NOTE]
> The `adx()` operator is not supported for custom detections.


### Use arg() operator for Azure Resource Graph queries
The `arg()` operator can be used to query across deployed Azure resources like subscriptions, virtual machines, CPU, storage, and the like. 

This feature was previously only available in log analytics in Microsoft Sentinel. In the Microsoft Defender portal, the `arg()` operator works over Microsoft Sentinel data (that is, Defender XDR tables are not supported). This allows users to use the operator in advanced hunting without needing to manually open a Microsoft Sentinel window. 

Note that queries using the `arg()` operator return the first 1,000 records only. Read [Query data in Azure Resource Graph by using arg()](/azure/azure-monitor/logs/azure-monitor-data-explorer-proxy#query-data-in-azure-resource-graph-by-using-arg-preview) for more details.

In the query editor, enter *arg("").* followed by the Azure Resource Graph table name. 

For example:

:::image type="content" source="/defender-xdr/media/arg-operator2.png" alt-text="Screenshot of arg operator in advanced hunting." lightbox="/defender-xdr/media/arg-operator2.png":::

You can also, for instance, filter a query that searches over Microsoft Sentinel data based on the results of an Azure Resource Graph query:

```Kusto
arg("").Resources 
| where type == "microsoft.compute/virtualmachines" and properties.hardwareProfile.vmSize startswith "Standard_D"
| join (
    Heartbeat
    | where TimeGenerated > ago(1d)
    | distinct Computer
    )
    on $left.name == $right.Computer
```


## Use saved queries

To use a saved query from Microsoft Sentinel, go to the **Queries** tab and scroll until you find the query that you want. Double-click the query name to load the query in the query editor. For more options, select the vertical ellipses ( ![kebab icon](/defender/media/ah-kebab.png) ) to the right of the query. From here, you can perform the following actions:

- **Run query** – loads the query in the query editor and runs it automatically
- **Open in query editor** – loads the query in the query editor
- **View details** – opens the query details side pane where you can inspect the query, run the query, or open the query in the editor

   :::image type="content" source="/defender/media/advanced-hunting-unified-view-details.png" alt-text="Screenshot of the options available in saved queries in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-unified-view-details.png":::


For editable queries, more options are available:

- **Edit details** – opens the query details side pane with the option to edit the details like description (if applicable) and the query itself; only the folder names (location) of Microsoft Sentinel queries can't be edited
- **Delete** – deletes the query
- **Rename** – allows you to modify the query name

## Create custom analytics and detection rules

To help discover threats and anomalous behaviors in your environment, you can create custom detection policies. 

For analytics rules that apply to data ingested through the connected Microsoft Sentinel workspace, select **Manage rules > Create analytics rule**.

:::image type="content" source="/defender/media/advanced-hunting-unified-rules.png" alt-text="Screenshot of the options to create custom analytics or detections in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-unified-rules.png":::

The **Analytics rule wizard** appears. Fill up the required details as described in [Analytics rule wizard—General tab](/azure/sentinel/detect-threats-custom#analytics-rule-wizardgeneral-tab).

You can also create custom detection rules that query data from both Microsoft Sentinel and Defender XDR tables. Select **Manage rules > Create custom detection**. Read [Create and manage custom detection rules](custom-detection-rules.md) for more information. 

If your Defender XDR data is ingested into Microsoft Sentinel, you have the option to choose between **Create custom detection** and **Create analytics rule**.
