---
title: SeenBy() function in advanced hunting for Microsoft Defender XDR
description: Learn how to use the SeenBy() function to look for which onboarded devices discovered a certain device.
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
ms.date: 08/05/2025
---

# SeenBy()

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]




The `SeenBy()` function is invoked to see a list of onboarded devices that have seen a certain device using the device discovery feature.

This function returns a table that has the following column:

| Column | Data type | Description |
|------------|---------------|-------------|
| `DeviceId` | `string` | Unique identifier for the device in the service |

You can enter up to 1,000 devices in this function. 

## Syntax

```kusto
invoke SeenBy(x)
```

- where **x** is the device ID of interest

> [!TIP]
> Enrichment functions show supplemental information only when they're available. Availability of information is varied and depends on many factors. Make sure to consider this when using SeenBy() in your queries or in creating custom detections. For best results, we recommend using the SeenBy() function with the DeviceInfo table.

### Example: Obtain list of onboarded devices that have seen a device

```kusto
DeviceInfo 
| where OnboardingStatus <> "Onboarded" 
| limit 100 | invoke SeenBy()
```

## Related articles
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Get more query examples](advanced-hunting-shared-queries.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
