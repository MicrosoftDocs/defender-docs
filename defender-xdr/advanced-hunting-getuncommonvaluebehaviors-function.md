---
title: GetUncommonValueBehaviors() function in advanced hunting for Microsoft Defender XDR
description: Learn how to use the GetUncommonValueBehaviors() function to find UEBA behaviors that contain UncommonValue insights.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
ms.custom:
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 07/15/2026
---

# GetUncommonValueBehaviors()

Use the `GetUncommonValueBehaviors()` function in [advanced hunting](advanced-hunting-overview.md) to return behaviors that contain at least one `UncommonValue` insight in the `Insights` column.

An `UncommonValue` insight indicates that a value associated with the behavior, such as a country or internet service provider (ISP), is rarely observed across the organization.

## Syntax

```kusto
invoke GetUncommonValueBehaviors()
```

## Parameters

This function has no explicit parameters. Invoke it as part of a query on a tabular input that contains an `Insights` column of type `string`.

## Return value

Returns the rows from the input table that contain at least one `UncommonValue` insight. All columns from the input table are preserved.

## Example

### Find Microsoft Sentinel behaviors with uncommon values

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| invoke GetUncommonValueBehaviors()
| project TimeGenerated, BehaviorId, Title, Insights
| order by TimeGenerated desc
```

## Related content

- [Investigate anomalies on UEBA behaviors in Microsoft Sentinel](/azure/sentinel/ueba-anomalies-on-behaviors)
- [BehaviorInfo table](advanced-hunting-behaviorinfo-table.md)
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
