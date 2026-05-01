---
title: Monitor ASR rule activity
description: Describes how to use advanced hunting and the device timeline to monitor attack surface reduction (ASR) rule events.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar, yongrhee
ms.custom: asr
ms.topic: article
ms.collection:
- m365-security
- m365solution-asr-rules
- highpri
- tier1
- mde-asr
ms.date: 04/22/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Monitor attack surface reduction (ASR) rule activity

A critical part of any deployment of attack surface reduction (ASR) rules is monitoring the effect of rules on devices. This article describes the available methods to view ASR rule events in your Microsoft Defender for Endpoint organization. For more information about ASR rules, see [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md).

## ASR rules report

> [!NOTE]
> This feature requires Microsoft Defender for Endpoint Plan 2 or Microsoft Defender for Business.

For complete information, see [Attack surface reduction rules report in the Microsoft Defender portal](attack-surface-reduction-rules-report.md).

<a name='asr-rules-advanced-hunting'></a>

## ASR rule events in Advanced Hunting

> [!NOTE]
> This feature requires Microsoft Defender for Endpoint Plan 2.

One of the most powerful features of [Microsoft Defender XDR](https://security.microsoft.com) is advanced hunting. If you're not familiar with advanced hunting, see: [Proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview).

Advanced hunting is a Kusto Query Language (KQL) threat-hunting tool in the Microsoft Defender portal that lets you explore up to 30 days of the captured (raw) data from devices. You can proactively inspect events to find interesting indicators and entities for both known and potential threats. The flexible access to data allows hunting for both known and potential threats.

Through advanced hunting, you can extract ASR rule information, create reports, and get in-depth information on the context of a specific audit or block event from ASR rules.

ASR rule events are available in the `DeviceEvents` table on the **Advanced hunting** page of the Defender portal at <https://security.microsoft.com/v2/advanced-hunting>.

Attack surface reduction events shown in advanced hunting are throttled to unique processes seen every hour. The time of the attack surface reduction event is the first time the event is seen within that hour.

The following sample query reports all events from the last 30 days with ASR rules as the data source. The query summarizes by `ActionType` count, which is the ASR rule.

```kusto
DeviceEvents
| where Timestamp > ago(30d)
| where ActionType startswith "Asr"
| summarize EventCount=count() by ActionType
```

:::image type="content" source="media/advanced-hunting-attack-surface-reduction-rules-query.png" alt-text="Screenshot of the Advanced hunting page in the Microsoft Defender portal with the example DeviceEvents query results." lightbox="media/advanced-hunting-attack-surface-reduction-rules-query.png":::

To focus on a specific rule and get details on the actual files and processes involved, change the filter for `ActionType` and replace the `summarize` line with a `project` line that contains the fields you want to see as shown in the following example:

```kusto
DeviceEvents
| where (ActionType startswith "AsrOfficechild")
| extend RuleId=extractjson("$Ruleid", AdditionalFields, typeof(string))
| project DeviceName, FileName, FolderPath, ProcessCommandLine, InitiatingProcessFileName, InitiatingProcessCommandLine
```

The true benefit of advanced hunting is that you can shape the queries to your liking. You can pinpoint something on an individual machine, or you can extract insights from your entire environment.

For more information about hunting options, see: [Demystifying attack surface reduction rules - Part 3](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-3/ba-p/1360968).

<a name="microsoft-defender-for-endpoint-machine-timeline"></a>

## ASR events in the device timeline

> [!NOTE]
> This feature requires Microsoft Defender for Endpoint Plan 2 or Microsoft Defender for Business.

A narrower scoped alternative to advanced hunting is the Defender for Endpoint device timeline. For more information, see [Microsoft Defender for Endpoint device timeline](device-timeline-event-flag.md).

To open the device timeline of a device in the Microsoft Defender portal, complete the following steps:

1. Open the **Device Inventory** page at <https://security.microsoft.com/machines>.
1. On the appropriate tab of the **Device Inventory** page (for example, **All devices** or **Computers & mobile**) select a device by clicking on the link in the **Name** column value.
1. In the details page that opens, select the **Timeline** tab.
1. On the **Timeline** tab, select **Filter**. In the **Filter** flyout that opens, select **ASR events** from the **Event group** section, and then select **Apply**.

   The default timeframe is **1 week**, but you can also select **1 day**, **3 days**, **30 days**, or a custom date range within 30 days.

:::image type="content" source="media/device-inventory-timeline.png" alt-text="Screenshot of the Timeline tab of the device details page of a device selected from the Device Inventory page of the Microsoft Defender portal. The results are filtered by the Event group value ASR events." lightbox="media/device-inventory-timeline.png":::

<a name="how-to-troubleshoot-attack-surface-reduction-rules"></a>

## ASR events in Windows Event Viewer

For complete information, see [Attack surface reduction events in Windows Event Viewer](attack-surface-reduction-windows-events.md).

## Troubleshoot ASR rules

To troubleshoot ASR rules, see [Troubleshoot attack surface reduction rules](troubleshoot-asr.md).

## See also

- [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md)
- [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Troubleshoot attack surface reduction rules](troubleshoot-asr.md)
