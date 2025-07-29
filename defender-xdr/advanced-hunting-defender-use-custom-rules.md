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
ms.topic: how-to
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.date: 03/28/2025
---

# Use Microsoft Sentinel functions, saved queries, and custom rules 


## Use functions

To use a function from Microsoft Sentinel, go to the **Functions** tab and scroll until you find the function that you want. Double-click the function name to insert the function in the query editor. 

You can also select the vertical ellipses ( ![kebab icon](/defender/media/ah-kebab.png) ) to the right of the function and select **Insert to query** to insert the function into a query in the query editor. 

Other options include:
- **View details** – Opens the function side pane containing its details.
- **Load function code** – Opens a new tab containing the function code.

For editable functions, more options are available when you select the vertical ellipses:
- **Edit details** – Opens the function side pane to allow you to edit details about the function (except folder names for Sentinel functions).
- **Delete** – Deletes the function.

### Use adx() operator for Azure Data Explorer queries
Use the `adx()` operator to query tables stored in Azure Data Explorer. Read [What is Azure Data Explorer?](/azure/data-explorer/data-explorer-overview) for more details.

This feature was previously only available in log analytics in Microsoft Sentinel. Users can now use the operator in advanced hunting in the unified Microsoft Defender portal without needing to manually open a Microsoft Sentinel window. 

In the query editor, enter the query in the following format:

```Kusto
adx('<Cluster URI>/<Database Name>').<Table Name>
```

For example, to get the first 10 rows of data from the `StormEvents` table stored in a certain URI:

:::image type="content" source="/defender-xdr/media/adx-sample.png" alt-text="Screenshot of adx operator in advanced hunting." lightbox="/defender-xdr/media/adx-sample.png":::

> [!NOTE]
> The `adx()` operator isn't supported for custom detections.


### Use arg() operator for Azure Resource Graph queries
The `arg()` operator can be used to query across deployed Azure resources like subscriptions, virtual machines, CPU, storage, and the like. 

This feature was previously only available in the Logs feature in Microsoft Sentinel. In the Microsoft Defender portal, the `arg()` operator works to combine Azure Resource Graph (arg) queries with Microsoft Sentinel tables (that is, Defender XDR tables aren't supported). This allows users to make the cross-service query in advanced hunting without manually opening a Microsoft Sentinel window.

For more information, see [Query data in Azure Resource Graph by using arg()](/azure/azure-monitor/logs/azure-monitor-data-explorer-proxy#query-data-in-azure-resource-graph-by-using-arg-preview).

In the query editor, enter *arg("").* followed by the Azure Resource Graph table name. 

For example:

:::image type="content" source="/defender-xdr/media/arg-operator2.png" alt-text="Screenshot of arg operator in advanced hunting." lightbox="/defender-xdr/media/arg-operator2.png":::

You can also, for instance, filter a query that searches over Microsoft Sentinel data based on the results of an Azure Resource Graph query:

```Kusto
arg("").Resources
| where type=="microsoft.compute/virtualmachines" | extend name = tolower(name)
| join ( 
BehaviorAnalytics
| where isnotempty(SourceDevice) and InvestigationPriority > 2 | extend SourceDevice = tolower(SourceDevice)
) on $left.name == $right.SourceDevice
```


## Use saved queries

To use a saved query from Microsoft Sentinel, go to the **Queries** tab and scroll until you find the query that you want. Double-click the query name to load the query in the query editor. For more options, select the vertical ellipses ( ![kebab icon](/defender/media/ah-kebab.png) ) to the right of the query. From here, you can perform the following actions:

- **Run query** – Loads the query in the query editor and runs it automatically.
- **Open in query editor** – Loads the query in the query editor.
- **View details** – Opens the query details side pane where you can inspect the query, run the query, or open the query in the editor.

   :::image type="content" source="/defender/media/advanced-hunting-unified-view-details.png" alt-text="Screenshot of the options available in saved queries in the Microsoft Defender portal." lightbox="/defender/media/advanced-hunting-unified-view-details.png":::


For editable queries, more options are available:

- **Edit details** – Opens the query details side pane with the option to edit the details like description (if applicable) and the query itself; only the folder names (location) of Microsoft Sentinel queries can't be edited.
- **Delete** – Deletes the query.
- **Rename** – Allows you to modify the query name.

## Create custom analytics and detection rules

To help discover threats and anomalous behaviors in your environment, you can create customized detection rules. There are two kinds:
- Analytics rules - to generate detections from rules that query data that is ingested through Microsoft Sentinel
- Custom detection rules - to generate detections from rules that query data from Defender XDR or from both Microsoft Sentinel and Defender XDR


##### Analytics rules

For analytics rules that apply to data ingested through the connected Microsoft Sentinel workspace, select **Manage rules > Create analytics rule**.

:::image type="content" source="/defender/media/advanced-hunting-unified-rules.png" alt-text="Screenshot of the options to create custom analytics or detections in the Microsoft Defender portal" lightbox="/defender/media/advanced-hunting-unified-rules.png":::

The **Analytics rule wizard** appears. Fill up the required details as described in [Analytics rule wizard—General tab](/azure/sentinel/detect-threats-custom#analytics-rule-wizardgeneral-tab).


##### Custom detection rules
You can create custom detection rules that query data from both Microsoft Sentinel and Defender XDR tables. Select **Manage rules > Create custom detection**. Read [Create custom detection rules](custom-detection-rules.md) for more information. 


In both custom detection and analytics rule creation, you can only query data ingested as analytics logs (that is, not as basic logs or auxiliary logs. See [log management plans](/azure/sentinel/log-plans#log-management-plans) to check the different tiers) otherwise the rule creation won't proceed.

If your Defender XDR data is ingested into Microsoft Sentinel, you have the option to choose between **Create custom detection** and **Create analytics rule**.


> [!NOTE]
> If a Defender XDR table is not set up to stream to log analytics in Microsoft Sentinel but is recognized as a standard table in Microsoft Sentinel, an analytics rule can be created successfully but the rule won't run correctly since no data is actually available in Microsoft Sentinel. For these cases, use the custom detection rule wizard instead. 

## Manage custom analytics and detection rules

You can view all your user-defined rules—both custom detection rules and analytics rules—in the **Detection rules** page. Read [Manage custom detections](custom-detection-manage.md) for more details.



For multiworkspace organizations that have onboarded multiple workspaces to Microsoft Defender, you can now view the **Workspace ID** column and filter by workspace. 
   
