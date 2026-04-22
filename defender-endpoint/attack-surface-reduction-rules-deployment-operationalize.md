---
title: Manage and monitor attack surface reduction rules
description: Provides guidance to operationalize your attack surface reduction rules deployment.
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
ms.date: 04/21/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Manage and monitor attack surface reduction rules

After you fully deployed attack surface reduction (ASR) rules, it's vital that you have processes in place to monitor and respond to ASR-related activities. The article describes the tools and methods you use to monitor ASR rules.

## Managing ASR rules false positives

False positives/negatives can occur with any threat protection solution. False positives are cases in which an entity (such as a file or process) is detected and identified as malicious, although the entity isn't actually a threat. In contrast, a false negative is an entity that wasn't detected as a threat but is malicious. For more information about false positives and false negatives, see: [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)

## Keeping up with ASR rules reports

Consistent, regular review of reports is important to maintain your ASR rules deployment and keeping up with emerging threats. Schedule reviews of ASR rule events using a frequency that keeps up with ASR rule-reported events. Depending on the size of your organization, your reviews might be daily, hourly, or require continuous monitoring.

For complete information about the ASR rules report, see [Attack surface reduction rules report](attack-surface-reduction-rules-report.md).

## ASR rules Advanced Hunting

One of the most powerful features of [Microsoft Defender XDR](https://security.microsoft.com) is advanced hunting. If you're not familiar with advanced hunting, see: [Proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview).

Advanced hunting in Microsoft Defender Endpoint Plan 2 is a Kusto Query Language (KQL) threat-hunting tool in the Microsoft Defender portal that lets you explore up to 30 days of the captured (raw) data from devices. You can proactively inspect events to find interesting indicators and entities for both known and potential threats. The flexible access to data allows hunting for both known and potential threats.

Through advanced hunting, it's possible to extract ASR rule information, create reports, and get in-depth information on the context of a specific audit or block event from ASR rules.

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

To focus on a specific rule and get details on the actual files and processes involved, change the filter for `ActionType` and replace the `summarize` line with a `project` line that contains the fields you want (for example, `DeviceName`, `FileName`, `FolderPath`, etc.).

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

A narrower scoped alternative to advanced hunting is the Defender for Endpoint device timeline. For more information, see [Microsoft Defender for Endpoint device timeline](device-timeline-event-flag.md).

To open the device timeline of a device in the Microsoft Defender portal, do the following steps:

1. Open the **Device Inventory** page at <https://security.microsoft.com/machines>.
1. On the appropriate tab of the **Device Inventory** page (for example, **All devices** or **Computers & mobile**) select a device by clicking on the link in the **Name** column value.
1. In the details page that opens, select the **Timeline** tab.
1. On the **Timeline** tab, select **Filter**. In the **Filter** flyout that opens, select **ASR events** from the **Event group** section, and then select **Apply**.

   The default timeframe is **1 week**, but you can also select **1 day**, **3 days**, **30 days**, or a custom date range within 30 days.

:::image type="content" source="media/device-inventory-timeline.png" alt-text="Screenshot of the Timeline tab of the device details page of a device selected from the Device Inventory page of the Microsoft Defender portal. The results are filtered by the Event group value ASR events." lightbox="media/device-inventory-timeline.png":::

<a name="how-to-troubleshoot-attack-surface-reduction-rules"></a>

## Troubleshoot ASR rules

To troubleshoot ASR rules, see [Troubleshoot attack surface reduction rules](troubleshoot-asr.md).

## Articles in this deployment collection

[Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)

[Plan attack surface reduction rules deployment](attack-surface-reduction-rules-deployment-plan.md)

[Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

[Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)
