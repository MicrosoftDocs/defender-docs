---
title: Monitor controlled folder access activity
description: Monitor controlled folder access events with audit mode, advanced hunting, the device timeline, and Windows Event Viewer in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar, moeghasemi
ms.custom:
  - asr
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.date: 06/10/2026
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to monitor controlled folder access events so I can identify false positives and protect important folders without affecting productivity.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Monitor controlled folder access (CFA) activity

A critical part of any deployment of [controlled folder access](controlled-folder-access-overview.md) (CFA) is monitoring the effect on devices. Monitoring helps you identify apps that CFA blocks, find false positives, and protect important folders from ransomware without affecting productivity. Use the methods in this article to view CFA events in your Microsoft Defender for Endpoint organization.

> [!TIP]
> CFA blocks don't generate alerts in the **[Alerts queue](alerts-queue.md)**. However, you can view information about CFA blocks by using [advanced hunting](#cfa-events-in-advanced-hunting), the [device timeline](#cfa-events-in-the-device-timeline), or [custom detection rules](/defender-xdr/custom-detection-rules).

## Use audit mode to measure the effect of CFA

Microsoft recommends running CFA in **Audit** mode first to assess its effect before you move to **Enabled** (block) mode. Enable CFA in audit mode to see a record of what happens if the feature is enabled. Test how the feature works in your organization to make sure it doesn't affect your line-of-business apps. You can also get an idea of how many suspicious attempts to modify files occur over a given period.

By monitoring audit events and [allowing the apps your users need](controlled-folder-access-configure.md), you can enable CFA without reducing productivity. For more information about the available modes, see [Modes for CFA](controlled-folder-access-overview.md#modes-for-cfa).

To enable audit mode, configure CFA with the **Audit Mode** setting, either on an individual device or throughout your organization. For instructions, see [Configure CFA](controlled-folder-access-configure.md).

## CFA events in advanced hunting

> [!NOTE]
> This feature requires Microsoft Defender for Endpoint Plan 2.

One of the most powerful features of [Microsoft Defender XDR](https://security.microsoft.com) is advanced hunting. If you're not familiar with advanced hunting, see [Proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview).

Advanced hunting is a Kusto Query Language (KQL) threat-hunting tool in the Microsoft Defender portal that lets you explore up to 30 days of the captured (raw) data from devices. You can proactively inspect events to find indicators and entities for both known and potential threats.

CFA events are available in the `DeviceEvents` table on the **Advanced hunting** page of the Defender portal at <https://security.microsoft.com/v2/advanced-hunting>. If you use audit mode, you can use advanced hunting to see how CFA settings affect your environment if they're enabled.

The following sample query reports both audited and blocked CFA events:

```kusto
DeviceEvents
| where ActionType in ('ControlledFolderAccessViolationAudited','ControlledFolderAccessViolationBlocked')
```

To get details on the actual files and processes involved, replace the query with a `project` line that contains the fields you want to see, as shown in the following example:

```kusto
DeviceEvents
| where ActionType in ('ControlledFolderAccessViolationAudited','ControlledFolderAccessViolationBlocked')
| project DeviceName, FileName, FolderPath, InitiatingProcessFileName, InitiatingProcessCommandLine
```

Advanced hunting lets you customize queries to target individual devices or extract insights from your entire environment.

## CFA events in the device timeline

<!-- TODO: Confirm with the PM which Event group value surfaces controlled folder access events in the device timeline. There's no dedicated "Controlled folder access" event group; step 4 currently assumes "ASR events" because CFA is an attack surface reduction capability, but "Antivirus events" or "File events" are also candidates. -->

> [!NOTE]
> This feature requires Microsoft Defender for Endpoint Plan 2 or Microsoft Defender for Business.

A narrower scoped alternative to advanced hunting is the Defender for Endpoint device timeline. For more information, see [Microsoft Defender for Endpoint device timeline](investigate-machines.md#investigate-device-timeline).

To open the device timeline of a device in the Microsoft Defender portal, complete the following steps:

1. Open the **Device Inventory** page at <https://security.microsoft.com/machines>.
1. On the appropriate tab of the **Device Inventory** page (for example, **All devices** or **Computers & mobile**), select a device by selecting the device name link.
1. In the details page that opens, select the **Timeline** tab.
1. On the **Timeline** tab, select **Filter**. In the **Filter** flyout that opens, select **ASR events** from the **Event group** section, and then select **Apply**. CFA is an attack surface reduction capability, so its events appear in the **ASR events** group.

   The default timeframe is **1 week**, but you can also select **1 day**, **3 days**, **30 days**, or a custom date range within 30 days.

## CFA events in Windows Event Viewer

Reviewing events in Windows Event Viewer is useful when you evaluate CFA. For example, you can enable audit mode and then review what would happen if the feature were fully enabled. You can also view the effects of CFA when it's fully enabled.

### Browse CFA events in Windows Event Viewer

CFA events are located in **Applications and Services Logs**. To view these events, do the following steps:

1. Select **Start**, type **Event Viewer**, and then press **Enter** to open Event Viewer.

1. In Event Viewer, expand **Applications and Services Logs** \> **Microsoft** \> **Windows** \> **Windows Defender** \> **Operational**.

1. Find and filter the events by using the following event IDs:

   |Event ID|Description|
   |:---:|---|
   |5007|Event when settings are changed|
   |1123|Blocked CFA event|
   |1124|Audited CFA event|
   |1127|Blocked CFA sector write block event|
   |1128|Audited CFA sector write block event|

### Use a custom view in Windows Event Viewer

You can create a custom view in Windows Event Viewer to see only CFA events using the [XML for controlled folder access events](attack-surface-reduction-windows-events.md#xml-for-controlled-folder-access-events).

To import the template as a custom view or copy the XML directly into Event Viewer, follow the procedures in [Use custom views in Windows Event Viewer to view attack surface reduction events](attack-surface-reduction-windows-events.md#use-custom-views-in-windows-event-viewer-to-view-attack-surface-reduction-events).

> [!TIP]
> You can use [Windows Event Forwarding](/windows/security/operating-system-security/device-management/use-windows-event-forwarding-to-assist-in-intrusion-detection) to centralize CFA event collection from multiple devices.

## Investigate CFA detections with the client analyzer

When you investigate audit or block events, you might find that CFA stops a known, trusted app. To see why CFA detected an app, run the [Microsoft Defender for Endpoint Client Analyzer](run-analyzer-windows.md) with the `-cfa` argument on the affected device. The analyzer reports the reason for each CFA detection, which helps you decide whether to [allow the app](controlled-folder-access-configure.md).

Some types of endpoint security or asset management software inject code into every process that starts on the system. This injection can result in CFA no longer trusting known applications like Office apps. If the client analyzer shows that an injecting process causes the detections, consider adding an [antivirus exclusion](configure-exclusions-microsoft-defender-antivirus.md) for that process, or consult your management software vendor about signing all their binaries.

> [!NOTE]
> If you [allowed an app](controlled-folder-access-configure.md) but CFA still blocks it, [data loss prevention (DLP)](/purview/dlp-learn-about-dlp) might be preventing your allowed apps from taking effect. To investigate, do the following steps:
>
> 1. Download and install the [Defender for Endpoint client analyzer](run-analyzer-windows.md).
> 1. Run a trace for at least five minutes.
> 1. In the resulting `MDEClientAnalyzerResult.zip` output file, extract the contents of the `EventLogs` folder, and search for instances of `DLP EA` in the available `.evtx` log files.

## Related content

- [Controlled folder access (CFA) overview](controlled-folder-access-overview.md)
- [Configure controlled folder access (CFA)](controlled-folder-access-configure.md)
- [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md)
- [Use audit mode](attack-surface-reduction-overview.md#audit-mode)
