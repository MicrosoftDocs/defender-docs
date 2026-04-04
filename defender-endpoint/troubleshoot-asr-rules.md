---
title: Attack surface reduction rule activity in Microsoft Defender for Endpoint
description: "Admins can learn about the ways to view activity related to attack surface reduction rules in Microsoft Defender for Endpoint."
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.custom:
- mde-asr
- admindeeplinkDEFENDER
ms.topic: troubleshooting-general
ms.subservice: asr
ms.collection:
- m365-security
- tier3
search.appverid: met150
ms.date: 04/03/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# View attack surface reduction rule activity in Microsoft Defender for Endpoint

This article describes the tools to use to view detection activity and other information related to attack surface reduction (ASR) rule activity in Microsoft Defender for Endpoint

<a name="microsoft-defender-for-endpoint---advanced-hunting"></a>

## ASR rules report

For complete information, see [Attack surface reduction rules report](attack-surface-reduction-rules-report.md).

## ASR rule events in advanced hunting in Microsoft Defender for Endpoint Plan 2

Advanced hunting is a query-based (Kusto Query Language or KQL) threat-hunting tool in the Microsoft Defender portal that lets you explore up to 30 days of the captured (raw) data that Defender for Endpoint collects from devices. You can proactively inspect events to find interesting indicators and entities for both known and potential threats. For more information, see [Proactively hunt for threats with advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview).

Using advanced hunting, you can extract ASR rule events, create reports, and get in-depth information on the context of a specific event for an ASR rule in **Audit** mode or **Block** mode.

ASR rule events are available in the `DeviceEvents` table on the **Advanced hunting** page of the Defender portal at <https://security.microsoft.com/v2/advanced-hunting>.

The following sample query reports all events from the last 30 days with attack surface reduction rules as data source. The query summarizes the `ActionType` count, which is the ASR rule.

```kusto
DeviceEvents
| where Timestamp > ago(30d)
| where ActionType startswith "Asr"
| summarize EventCount=count() by ActionType
```

:::image type="content" source="media/advanced-hunting-attack-surface-reduction-rules-query.png" alt-text="Screenshot of the Advanced hunting page in the Microsoft Defender portal with the example DeviceEvents query results." lightbox="media/advanced-hunting-attack-surface-reduction-rules-query.png":::

<a name="microsoft-defender-for-endpoint-machine-timeline"></a>

## ASR events in the device timeline in Microsoft Defender for Endpoint Plan 2

A narrower scoped alternative to advanced hunting is the Defender for Endpoint device timeline. For more information, see [Microsoft Defender for Endpoint device timeline](device-timeline-event-flag.md).

To open the device timeline of a device in the Microsoft Defender portal, do the following steps:

1. Open the **Device Inventory** page at <https://security.microsoft.com/machines>.
2. On the appropriate tab of the **Device Inventory** page (for example, **All devices** or **Computers & mobile**) select a device by clicking on the link in the **Name** column value.
3. In the details page that opens, select the **Timeline** tab.
4. On the **Timeline** tab, select **Filter**. In the **Filter** flyout that opens, select **ASR events** from the **Event group** section, and then select **Apply**.

   The default timeframe is **1 week**, but you can also select **1 day**, **3 days**, **30 days**, or a custom date range within 30 days.

:::image type="content" source="media/device-inventory-timeline.png" alt-text="Screenshot of the Timeline tab of the device details page of a device selected from the Device Inventory page of the Microsoft Defender portal The results are filtered by the Event group value ASR events." lightbox="media/device-inventory-timeline.png":::

<a name="how-to-troubleshoot-attack-surface-reduction-rules"></a>

## Troubleshoot attack surface reduction rules

To troubleshoot ASR rules, see [Troubleshoot attack surface reduction rules](troubleshoot-asr.md).

## Related articles

- [Attack surface reduction rules](attack-surface-reduction-rules-overview.md)
- [Enable attack surface reduction rules](attack-surface-reduction-rules-enable.md)
- [Evaluate attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)
- [Troubleshoot attack surface reduction rules](troubleshoot-asr.md)
