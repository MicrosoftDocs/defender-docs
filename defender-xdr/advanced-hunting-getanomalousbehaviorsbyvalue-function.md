---
title: GetAnomalousBehaviorsByValue() function in advanced hunting for Microsoft Defender XDR
description: Learn how to use the GetAnomalousBehaviorsByValue() function to find UEBA behavior insights involving a specific entity or context value.
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

# GetAnomalousBehaviorsByValue()

Use the `GetAnomalousBehaviorsByValue()` function in [advanced hunting](advanced-hunting-overview.md) to return behaviors containing an insight that involves a specific entity or contextual value.

The function searches the `Value` fields in each insight's `About` array. You can optionally limit the results to a specific insight type.

## Syntax

```kusto
invoke GetAnomalousBehaviorsByValue(entityValue, insightType)
```

## Parameters

- **entityValue**—Required. A `string` containing the exact `Value` to match in the insight's `About` array. The value can represent an account, country, IP address, ISP, device, resource, or other contextual value.
- **insightType**—Optional. A `string` containing the exact insight type to match, such as `FirstSeen`, `UncommonValue`, or `HighVolumeAnomaly`. If you omit this parameter or specify an empty string, the function matches all insight types.

Invoke the function as part of a query on a tabular input that contains an `Insights` column of type `string`.

## Return value

Returns the rows from the input table containing an insight whose `About` array includes an entry with the specified `Value`. When `insightType` is provided, only insights of that type are evaluated. All columns from the input table are preserved.

## Examples

### Find FirstSeen insights involving a specific account

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| invoke GetAnomalousBehaviorsByValue(
    "jsmith@contoso.com",
    "FirstSeen"
)
| project TimeGenerated, BehaviorId, Title, Insights
| order by TimeGenerated desc
```

### Find all insights involving a specific country

Omit the `insightType` parameter to return matching insights of any type.

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| invoke GetAnomalousBehaviorsByValue("Sweden")
| project TimeGenerated, BehaviorId, Title, Insights
```

## Related content

- [Investigate anomalies on UEBA behaviors in Microsoft Sentinel](/azure/sentinel/ueba-anomalies-on-behaviors)
- [BehaviorInfo table](advanced-hunting-behaviorinfo-table.md)
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
