---
title: Get started with troubleshooting mode in Microsoft Defender for Endpoint 
description: Turn on the Microsoft Defender for Endpoint troubleshooting mode to address various antivirus issues.
search.appverid: met150
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
ms.reviewer: pricci
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-ngp
ms.topic: get-started
ms.subservice: ngp
ms.date: 05/01/2025
---

# Get started with troubleshooting mode in Microsoft Defender for Endpoint 

**Applies to:**

- [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

Troubleshooting mode in Microsoft Defender for Endpoint enables administrators to troubleshoot various Microsoft Defender Antivirus features, even if devices are managed by organizational policies. For example, if [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) is enabled, [certain settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) can't be modified or turned off, but you can use troubleshooting mode on a device to edit those settings temporarily.

Troubleshooting mode is disabled by default, and requires you to turn it on for a device (and/or group of devices) for a limited time. Troubleshooting mode is exclusively an enterprise-only feature, and requires [Microsoft Defender portal](https://security.microsoft.com) access.

This article describes troubleshooting mode for Windows devices. For information about troubleshooting mode on Mac, see [Troubleshooting mode in Microsoft Defender for Endpoint on macOS](mac-troubleshoot-mode.md).

> [!TIP]
> - During troubleshooting mode, you can use the PowerShell command `Set-MPPreference -DisableTamperProtection $true` on Windows devices.
> - To check the state of [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md), you can use the [Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus) PowerShell cmdlet. In the list of results, look for `IsTamperProtected` or `RealTimeProtectionEnabled`. (A value of *true* means tamper protection is enabled.)
> - For Mac devices, see [Troubleshooting mode in Microsoft Defender for Endpoint on macOS](mac-troubleshoot-mode.md).

## What do you need to know before you begin?

During troubleshooting mode, you can use the PowerShell command `Set-MPPreference -DisableTamperProtection $true` or, on client operating systems, the Security Center app to temporarily disable tamper protection on your device and make your necessary configuration changes.

You can use troubleshooting mode to troubleshoot or check application compatibility with Microsoft Defender Antivirus, such as when false positives occur with application blocks.

With appropriate permissions, local administrators can change configuration on individual devices that are usually locked by policy. Having a device in troubleshooting mode can be helpful when diagnosing Microsoft Defender Antivirus performance and compatibility scenarios. Local administrators can't turn off Microsoft Defender Antivirus, or uninstall it. Local administrators can configure all other security settings in the Microsoft Defender Antivirus suite (for example, cloud protection, tamper protection).

Administrators must have "Manage Security settings" permissions to turn on troubleshooting mode.

Defender for Endpoint collects logs and investigation data throughout the troubleshooting process.

- A snapshot of `MpPreference` is taken before troubleshooting mode begins.
- A second snapshot is taken just before troubleshooting mode expires.
- Operational logs from during troubleshooting mode are also collected.
- Logs and snapshots are collected and are available for an administrator to collect using the [Collect investigation package](respond-machine-alerts.md#collect-investigation-package-from-devices) feature on the device page. Microsoft doesn't remove this data from the device until an administrator has collected it.

Administrators can also review the changes in settings that take place during troubleshooting mode in **Event Viewer** on the device itself. 

- Open Event Viewer, and then expand **Applications and Services Logs** > **Microsoft** > **Windows** > **Windows Defender**, and then select **Operational**.
- Potential events can include events with IDs 5000, 5001, 5004, 5007 and others. See more details at [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml#event-id-5000).

Troubleshooting mode automatically turns off after reaching its expiration time (it lasts for 4 hours). When troubleshooting mode has expired, all policy-managed configurations become read-only again and revert to how the device was configured before enabling troubleshooting mode. 

It can take up to 15 minutes from the time the command is sent from Microsoft Defender XDR to when it becomes active on the device.

Notifications are sent to the user when troubleshooting mode begins and when troubleshooting mode ends. A warning is also sent to indicate that troubleshooting mode is ending soon. The beginning and end of troubleshooting mode is also identified in the [Microsoft Defender portal](https://security.microsoft.com), in the **Device Timeline** on the device page.

You can query all troubleshooting mode events in advanced hunting.

> [!NOTE]
> Policy management changes are applied to the device when it's actively in troubleshooting mode. However, the changes don't take effect until troubleshooting mode expires. Additionally, Microsoft Defender Antivirus Platform updates aren't applied during Troubleshooting mode. Platform updates are applied when troubleshooting mode ends with a Windows update.

## Prerequisites

- Devices must be running a supported operating system.

   - Windows 10 (version 19044.1618 or later), Windows 11, Windows Server 2019, Windows Server 2022, or Windows Server 2025.

      |Semester/Redstone|OS version|Release|
      |:---|:---|:---|
      | 21H2/SV1|`22000.593` or later|[KB5011563: Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5019275) |
      | 20H1/20H2/21H1|`19042.1620` or later<br/> `19041.1620` or later<br/> `19043.1620` or later|[KB5011543: Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5011543) |
      | Windows Server 2022 or later|`20348.617` or later|[KB5011558: Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5011558) |
      | Windows Server 2019 (RS5)|`17763.2746` or later |[KB5011551: Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5011551) |

   - Windows Server 2012 R2 and Windows Server 2016 using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2), with all of the following components up to date:

      | Component | Version | Release |
      |--|--|--|
      | Sense version | `10.8049.22439.1084` or later | [KB5005292: Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5005292) |
      | Microsoft Defender Antivirus | Platform: `4.18.2207.7` or later | [KB4052623: Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623) |
      | Microsoft Defender Antivirus | Engine: `1.1.19500.2` or later | [KB2267602: Microsoft Update Catalog](https://www.microsoft.com/en-us/wdsi/defenderupdates) |

- Defender for Endpoint must be tenant-enrolled and active on the device.

- Devices must be actively running Microsoft Defender Antivirus, version `4.18.2203 or later`.

- For macOS devices, see [Prerequisites for troubleshooting mode on Mac](mac-troubleshoot-mode.md#prerequisites).

## Enable troubleshooting mode

1. Go to the [Microsoft Defender portal](https://security.microsoft.com), and sign in.

2. Navigate to the device page/machine page for the device you would like to turn on troubleshooting mode. Select **Turn on troubleshooting mode**. You must have "Manage security settings in Security Center" [permissions](assign-portal-access.md) for Microsoft Defender for Endpoint.

   :::image type="content" source="/defender/media/ts-mode-menu.png" alt-text="Turn on troubleshooting mode" lightbox="/defender/media/ts-mode-menu.png":::

   > [!NOTE]
   > The **Turn on troubleshooting mode** option is available on all devices, even if the device doesn't meet the prerequisites for troubleshooting mode.  

3. Confirm you want to turn on troubleshooting mode for the device.

   :::image type="content" source="/defender/media/ts-mode-conf-flyout.png" alt-text="The configuration flyout" lightbox="/defender/media/ts-mode-conf-flyout.png":::

4. The device page shows the device is now in troubleshooting mode.

   :::image type="content" source="/defender/media/ts-mode-option-greyed-out.png" alt-text="The device is now in troubleshooting mode" lightbox="/defender/media/ts-mode-option-greyed-out.png":::

## Advanced hunting queries

Here are some prebuilt advanced hunting queries to give you visibility into the troubleshooting events that are occurring in your environment. You can also use these queries to [create detection rules](/defender-xdr/custom-detection-rules#create-a-custom-detection-rule) to generate alerts when devices are in troubleshooting mode.

### Get troubleshooting events for a particular device

Search by deviceId or deviceName by commenting out the respective lines. 
 
```kusto
//let deviceName = "<deviceName>";   // update with device name
let deviceId = "<deviceID>";   // update with device id
DeviceEvents
| where DeviceId == deviceId
//| where DeviceName  == deviceName
| where ActionType == "AntivirusTroubleshootModeEvent"
| extend _tsmodeproperties = parse_json(AdditionalFields)
| project Timestamp,DeviceId, DeviceName, _tsmodeproperties,
 _tsmodeproperties.TroubleshootingState, _tsmodeproperties.TroubleshootingPreviousState, _tsmodeproperties.TroubleshootingStartTime,
 _tsmodeproperties.TroubleshootingStateExpiry, _tsmodeproperties.TroubleshootingStateRemainingMinutes,
 _tsmodeproperties.TroubleshootingStateChangeReason, _tsmodeproperties.TroubleshootingStateChangeSource
```

### Devices currently in troubleshooting mode  

```kusto
DeviceEvents
| where Timestamp > ago(3h) // troubleshooting mode automatically disables after 4 hours 
| where ActionType == "AntivirusTroubleshootModeEvent"
| extend _tsmodeproperties = parse_json(AdditionalFields)
| where _tsmodeproperties.TroubleshootingStateChangeReason contains "started"
|summarize (Timestamp, ReportId)=arg_max(Timestamp, ReportId), count() by DeviceId
| order by Timestamp desc
```

### Count of troubleshooting mode instances by device

```kusto
DeviceEvents
| where ActionType == "AntivirusTroubleshootModeEvent"
| extend _tsmodeproperties = parse_json(AdditionalFields)
| where Timestamp > ago(30d)  // choose the date range you want
| where _tsmodeproperties.TroubleshootingStateChangeReason contains "started"
| summarize (Timestamp, ReportId)=arg_max(Timestamp, ReportId), count() by DeviceId
| sort by count_
```

### Total count

```kusto
DeviceEvents
| where ActionType == "AntivirusTroubleshootModeEvent"
| extend _tsmodeproperties = parse_json(AdditionalFields)
| where Timestamp > ago(2d) //beginning of time range
| where Timestamp < ago(1d) //end of time range
| where _tsmodeproperties.TroubleshootingStateChangeReason contains "started"
| summarize (Timestamp, ReportId)=arg_max(Timestamp, ReportId), count()
| where count_ > 5          // choose your max # of TS mode instances for your time range
```

## Related articles

- [Troubleshooting mode in Microsoft Defender for Endpoint on macOS](mac-troubleshoot-mode.md)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).
- [Troubleshooting mode scenarios](troubleshooting-mode-scenarios.md)
- [Protect security settings with tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
