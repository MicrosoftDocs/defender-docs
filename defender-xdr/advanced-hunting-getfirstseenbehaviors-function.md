---
title: GetFirstSeenBehaviors() function in advanced hunting for Microsoft Defender XDR
description: Learn how to use the GetFirstSeenBehaviors() function to find UEBA behaviors that contain FirstSeen insights.
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

# GetFirstSeenBehaviors()

Use the `GetFirstSeenBehaviors()` function in [advanced hunting](advanced-hunting-overview.md) to return behaviors that contain at least one `FirstSeen` insight in the `Insights` column.

A `FirstSeen` insight indicates that a behavior, entity, value, or combination of values was observed for the first time.

## Syntax

```kusto
invoke GetFirstSeenBehaviors()
```

## Parameters

This function has no explicit parameters. Invoke it as part of a query on a tabular input that contains an `Insights` column of type `string`.

## Return value

Returns the rows from the input table that contain at least one `FirstSeen` insight. All columns from the input table are preserved.

## Example

### Find recent Microsoft Sentinel behaviors with FirstSeen insights

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| where TimeGenerated > ago(1d)
| invoke GetFirstSeenBehaviors()
| project TimeGenerated, BehaviorId, Title, Insights
```

## Related content

- [Investigate anomalies on UEBA behaviors in Microsoft Sentinel](/azure/sentinel/ueba-anomalies-on-behaviors)
- [BehaviorInfo table](advanced-hunting-behaviorinfo-table.md)
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
