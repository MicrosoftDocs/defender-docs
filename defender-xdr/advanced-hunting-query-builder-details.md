---
title: Supported data types and filters in guided mode for hunting in Microsoft Defender XDR
description: Refine your query by using the different guided mode capabilities in advanced hunting in Microsoft Defender XDR.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier2
ms.custom:
- msecd-doc-authoring-1014
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
---

# Refine your query in guided mode 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]



> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

This article explains how to refine your advanced hunting queries in guided mode in Microsoft Defender XDR. Learn how to use supported data types, subgroups, smart auto-complete, event type filters, sample sizes, and how to switch from guided mode to advanced (KQL) mode.

## Use different data types

Advanced hunting in guided mode supports several data types that you can use to fine-tune your query.

- Numbers<br>
![Screenshot of the query builder with a numeric field added as a condition](media/advanced-hunting-query-builder-details/21-numbers.png)

- Strings<br>
![Screenshot of the query builder with a string field configured as a condition](media/advanced-hunting-query-builder-details/21-string.png)

   In the free text box, type the value and press **Enter** to add it. Note that the delimiter between values is **Enter**.<br>

   ![Screenshot of the query builder showing multiple string values entered as filter conditions](media/advanced-hunting-query-builder-details/23-string2.png)

- Boolean<br>
![Screenshot of the query builder with a Boolean field used as a condition](media/advanced-hunting-query-builder-details/24-boolean.png)


- Datetime<br>
![Screenshot of the query builder with a datetime field configured as a condition](media/advanced-hunting-query-builder-details/25-datetime.png)


- Closed list - You don't need to remember the exact value you're looking for. You can easily choose from a suggested closed list that supports multi-selection.<br>
![Screenshot of the query builder with a predefined list of values available for multi-selection as a condition](media/advanced-hunting-query-builder-details/26-closed.png)


## Use subgroups
You can create groups of conditions by clicking **Add subgroup**:

![Screenshot highlighting Add subgroup button](media/advanced-hunting-query-builder-details/27-subgroup1.png)

![Screenshot showing use of subgroups in query builder conditions](media/advanced-hunting-query-builder-details/28-subgroup2.png)

## Use smart auto-complete for search
Smart auto-complete for searching devices and user accounts is supported. 
You don't need to remember the device ID, full device name, or user account name. You can start typing the first few characters of the device or user you're looking for and a suggested list appears from which you can choose what you need:

![Screenshot showing smart auto-complete support](media/advanced-hunting-query-builder-details/29-smart-auto.png)

## Use `EventType`
You can even look for specific event types like all failed logons, file modification events, or successful network connections by using the **EventType** filter in any section where the **EventType** filter is available.

For instance, if you want to add a condition that looks for registry value deletions, you can go to the **Registry Events** section and select **EventType**.

![Screenshot of the Registry Events EventType list showing available registry event values](media/advanced-hunting-query-builder-details/30-eventtype1.png)

Selecting EventType under Registry Events allows you to choose from different registry events, including the one you're hunting for, **RegistryValueDeleted**.

![Screenshot of the Registry Events filter with EventType set to RegistryValueDeleted](media/advanced-hunting-query-builder-details/31-eventtype2.png)

> [!NOTE] 
>`EventType` is the equivalent of `ActionType` in the data schema, which users of advanced mode might be more familiar with.

## Test your query with a smaller sample size
If you're still working on your query and would like to see its performance and some sample results quickly, adjust the number of records to return by picking a smaller set through the **Sample size** dropdown menu. 
 
![Screenshot of the Sample size dropdown used to limit returned records while testing a query](media/advanced-hunting-query-builder-details/32-sample-size.png)

The sample size is set to 10,000 results by default, which is the maximum number of records that can be returned in hunting. However, we highly recommend lowering the sample size to 10 or 100 to quickly test your query, as doing so consumes less resources while you're still working on improving the query.

Then, once you finalize your query and are ready to use it to get all the relevant results for your hunting activity, make sure that the sample size is set to 10k, the maximum.

## Switch to advanced mode after building a query
You can click on **Edit in KQL** to view the KQL query generated by your selected conditions. Editing in KQL opens a new tab in advanced mode, with the corresponding KQL query:

![Screenshot of guided mode showing the Edit in KQL control used to open the generated query in advanced mode](media/advanced-hunting-query-builder-details/33-edit-kql.png)

![Screenshot of the generated KQL query in advanced mode for a guided query searching file name and SHA256 across all relevant tables](media/advanced-hunting-query-builder-details/33-edit-kql-2.png)

In the file-name and SHA256 query example shown in the previous screenshot, the selected view is All, so the KQL query searches all tables that have file properties of name and SHA256, and in all the relevant columns covering these properties. 

If you change the view to **Emails & collaboration**, the KQL query generated for the file-name and SHA256 example is narrowed down to:

![Screenshot of the generated KQL query in advanced mode narrowed to Emails & collaboration tables for the file-name and SHA256 example](media/advanced-hunting-query-builder-details/34-edit-kql-3.png)

<a name="see-also"></a>
## Related content
 - [Advanced hunting quotas and usage parameters](advanced-hunting-limits.md)
 - [Extend advanced hunting coverage with the right settings](advanced-hunting-extend-data.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
