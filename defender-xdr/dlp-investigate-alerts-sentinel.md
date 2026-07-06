---
title: Investigate data loss prevention alerts with Microsoft Sentinel
description: Learn how to use the Microsoft Defender XDR connector in Microsoft Sentinel to import, correlate, and investigate data loss prevention (DLP) alerts across data sources.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.collection: 
  - m365-security
  - tier2
ms.topic: how-to
ms.date: 06/16/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Investigate data loss prevention alerts with Microsoft Sentinel

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR
- Microsoft Sentinel

<a name="before-you-start"></a>
## Prepare to investigate DLP alerts in Microsoft Sentinel

See, [Investigate data loss prevention alerts with Microsoft Defender XDR](dlp-investigate-alerts-defender.md) for more details.

## DLP investigation experience in Microsoft Sentinel

You can use the Microsoft Defender XDR connector in Microsoft Sentinel to import all DLP incidents into Sentinel to extend your correlation, detection, and investigation across other data sources and extend your automated orchestration flows using Sentinel's native SOAR capabilities.

1. Follow instructions on Connect data from Microsoft Defender XDR to Microsoft Sentinel to import all incidents including DLP incidents and alerts into Sentinel. Enable the `CloudAppEvents` event connector, which imports Office 365 audit log events into Microsoft Sentinel, to pull all Office 365 audit logs into Sentinel.

   You should be able to see your DLP incidents in Sentinel once the Microsoft Defender XDR connector and the `CloudAppEvents` event connector are set up.

2. Select **Alerts** to view the alert page.

3. You can use **AlertType**, **startTime**, and **endTime** to query the **CloudAppEvents** table to get all the user activities that contributed to the alert. Use this query to identify the underlying activities. The query retrieves a specific security alert by its `SystemAlertId`, then correlates it with `CloudAppEvents` to return the user activities that occurred within the alert time window. Replace the empty `SystemAlertId` value with the ID of the alert you want to investigate.

```kusto
let Alert = SecurityAlert
| where TimeGenerated > ago(30d)
| where SystemAlertId == ""; // insert the systemAlertID here
CloudAppEvents
| extend correlationId1 = parse_json(tostring(RawEventData.Data)).cid
| extend correlationId = tostring(correlationId1)
| join kind=inner Alert on $left.correlationId == $right.AlertType
| where RawEventData.CreationTime > StartTime and RawEventData.CreationTime < EndTime
```

## Related articles

- [Incidents overview](incidents-overview.md)
- [Prioritize incidents](incident-queue.md)
- [Manage incidents](manage-incidents.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
