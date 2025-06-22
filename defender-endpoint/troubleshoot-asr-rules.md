---
title: Report and troubleshoot Microsoft Defender for Endpoint attack surface reduction rules
description: This article describes how to report and troubleshoot Microsoft Defender for Endpoint attack surface reduction rules
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
manager: deniseb
ms.custom: 
- mde-asr
- admindeeplinkDEFENDER
ms.topic: troubleshooting-general
ms.subservice: asr
ms.collection: 
- m365-security
- tier3
search.appverid: met150
ms.date: 03/10/2025
---

# Report and troubleshoot Defender for Endpoint attack surface reduction rules

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

The [Microsoft Defender portal](https://security.microsoft.com) is the new interface for monitoring and managing security across your Microsoft identities, data, devices, apps, and infrastructure. Here you can easily view the security health of your organization, act to configure devices, users, and apps, and get alerts for suspicious activity. The Microsoft Defender portal is intended for security admins and security operations teams to better manage and protect their organization. Visit the Microsoft Defender portal at<a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank"><https://security.microsoft.com></a>.

In the [Microsoft Defender portal](https://security.microsoft.com), we offer you a complete look at the current attack surface reduction rules configuration and events in your estate. Your devices must be onboarded into the Microsoft Defender for Endpoint service for these reports to be populated.
Here's a screenshot from the Microsoft Defender portal (under **Reports** \> **Devices** \> **Attack surface reduction**). At the device level, select **Configuration** from the **Attack surface reduction rules** pane. The following screen is displayed, where you can select a specific device and check its individual attack surface reduction rule configuration.

:::image type="content" source="media/asrrulesnew.png" alt-text="The attack surface reduction rules page" lightbox="media/asrrulesnew.png":::

## Microsoft Defender for Endpoint - Advanced hunting

One of the most powerful features of Microsoft Defender for Endpoint is advanced hunting. If you're unfamiliar with advanced hunting, refer [proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview).

Advanced hunting is a query-based (Kusto Query Language) threat-hunting tool that lets you explore up to 30 days of the captured (raw) data, that Defender for Endpoint collects from your devices. Through advanced hunting, you can proactively inspect events to locate interesting indicators and entities. The flexible access to data helps unconstrained hunting for both known and potential threats.

Through advanced hunting, it's possible to extract attack surface reduction rules information, create reports, and get in-depth information on the context of a given attack surface reduction rule audit or block event.

Attack surface reduction rules events are available to be queried from the DeviceEvents table in the advanced hunting section of the Microsoft Defender XDR. For example, a simple query such as the one below can report all the events that have attack surface reduction rules as data source, for the last 30 days, and will summarize them by the ActionType count, that in this case it is the actual codename of the attack surface reduction rule.

```kusto
DeviceEvents
| where Timestamp > ago(30d)
| where ActionType startswith "Asr"
| summarize EventCount=count() by ActionType
```

:::image type="content" source="media/adv-hunt-sc-2new.png" alt-text="The Advanced hunting page" lightbox="media/adv-hunt-sc-2new.png":::

With advanced hunting you can shape the queries to your liking, so that you can see what is happening, regardless of whether you want to pinpoint something on an individual machine, or you want to extract insights from your entire environment.

## Microsoft Defender for Endpoint machine timeline

An alternative to advanced hunting, but with a narrower scope, is the Microsoft Defender for Endpoint machine timeline. You can view all the collected events of a device, for the past six months, in the Microsoft Defender XDR, by going to the Machines list, select a given machine, and then select on the Timeline tab.

The following screenshot shows the Timeline view of these events on a given endpoint. From this view, you can filter the events list based on any of the Event Groups along the right-side pane. You can also enable or disable Flagged and Verbose events while viewing alerts and scrolling through the historical timeline.

:::image type="content" source="media/mic-sec-def-timelinenew.png" alt-text="The Microsoft Defender XDR timeline" lightbox="media/mic-sec-def-timelinenew.png":::

## How to troubleshoot attack surface reduction rules?

Review [Troubleshoot attack surface reduction rules](/defender-endpoint/troubleshoot-asr)

## Related articles

- [Attack surface reduction rules](attack-surface-reduction.md)
- [Enable attack surface reduction rules](enable-attack-surface-reduction.md)
- [Evaluate attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

- [Troubleshoot attack surface reduction rules](/defender-endpoint/troubleshoot-asr)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

