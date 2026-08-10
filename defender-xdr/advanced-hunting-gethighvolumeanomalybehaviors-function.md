---
title: GetHighVolumeAnomalyBehaviors() function in advanced hunting for Microsoft Defender XDR
description: Learn how to use the GetHighVolumeAnomalyBehaviors() function to find UEBA behaviors that contain HighVolumeAnomaly insights.
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

# GetHighVolumeAnomalyBehaviors()

Use the `GetHighVolumeAnomalyBehaviors()` function in [advanced hunting](advanced-hunting-overview.md) to return behaviors that contain at least one `HighVolumeAnomaly` insight in the `Insights` column.

A `HighVolumeAnomaly` insight indicates that an unusually high volume of activity was detected compared to the established behavioral baseline.

## Syntax

```kusto
invoke GetHighVolumeAnomalyBehaviors()
```

## Parameters

This function has no explicit parameters. Invoke it as part of a query on a tabular input that contains an `Insights` column of type `string`.

## Return value

Returns the rows from the input table that contain at least one `HighVolumeAnomaly` insight. All columns from the input table are preserved.

## Example

### Find recent behaviors with unusually high activity volume

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| where TimeGenerated > ago(7d)
| invoke GetHighVolumeAnomalyBehaviors()
| project TimeGenerated, BehaviorId, Title, Insights
| order by TimeGenerated desc
```

## Related content

- [Investigate anomalies on UEBA behaviors in Microsoft Sentinel](/azure/sentinel/ueba-anomalies-on-behaviors)
- [BehaviorInfo table](advanced-hunting-behaviorinfo-table.md)
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
