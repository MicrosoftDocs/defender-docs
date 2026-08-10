---
title: GetAnomalousBehaviorsAbout() function in advanced hunting for Microsoft Defender XDR
description: Learn how to use the GetAnomalousBehaviorsAbout() function to find UEBA behavior insights that match multiple entity or context criteria.
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

# GetAnomalousBehaviorsAbout()

Use the `GetAnomalousBehaviorsAbout()` function in [advanced hunting](advanced-hunting-overview.md) to return behaviors whose insights match multiple entity or contextual criteria.

The function searches the `About` array of each insight. All supplied filters must be satisfied within the same insight for the behavior to be returned.

The function supports up to three filter objects.

## Syntax

```kusto
invoke GetAnomalousBehaviorsAbout(filters)
```

## Parameters

- **filters**—Required. A `dynamic` JSON array containing one to three filter objects.

Each filter object supports the following properties:

| Property | Required | Description |
|----------|----------|-------------|
| `Kind` | Yes | The exact entity or context type to match, such as `Account`, `Country`, `IP`, `Host`, or `ISP`. |
| `Value` | No | The exact value to match for the specified `Kind`. Omit `Value` or specify an empty string to match any value of that `Kind`. |

All filter objects use AND logic. A behavior is returned only when every filter is matched within the same insight's `About` array.

Invoke the function as part of a query on a tabular input that contains an `Insights` column of type `string`.

## Return value

Returns the rows from the input table containing at least one insight whose `About` array satisfies all specified filter criteria. All columns from the input table are preserved.

## Examples

### Find insights involving a specific account and any country

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| invoke GetAnomalousBehaviorsAbout(
    dynamic([
        {
            "Kind": "Account",
            "Value": "jsmith@contoso.com"
        },
        {
            "Kind": "Country"
        }
    ])
)
| project TimeGenerated, BehaviorId, Title, Insights
| order by TimeGenerated desc
```

### Find insights involving an exact country, account, and IP address

```kusto
BehaviorInfo
| where ServiceSource == "Microsoft Sentinel"
| invoke GetAnomalousBehaviorsAbout(
    dynamic([
        {
            "Kind": "Country",
            "Value": "Brazil"
        },
        {
            "Kind": "Account",
            "Value": "jsmith@contoso.com"
        },
        {
            "Kind": "IP",
            "Value": "1.2.3.4"
        }
    ])
)
| project TimeGenerated, BehaviorId, Title, Insights
```

## Related content

- [Investigate anomalies on UEBA behaviors in Microsoft Sentinel](/azure/sentinel/ueba-anomalies-on-behaviors)
- [BehaviorInfo table](advanced-hunting-behaviorinfo-table.md)
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
