---
title: Troubleshooting mode in Microsoft Defender for Endpoint on macOS
description: This article describes how to enable the troubleshooting mode in Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-macos
ms.topic: troubleshooting-general
ms.subservice: macos
search.appverid: met150
ms.date: 12/15/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Troubleshooting mode in Microsoft Defender for Endpoint on macOS

This article describes how to enable the troubleshooting mode in Microsoft Defender for Endpoint on macOS so admins can troubleshoot various Microsoft Defender Antivirus features temporarily, even if organizational policies manage the devices.

For example, if the tamper protection is enabled, certain settings can't be modified or turned off, but you can use troubleshooting mode on the device to edit those settings temporarily.

Troubleshooting mode is disabled by default, and requires you to turn it on for a device (and/or group of devices) for a limited time. Troubleshooting mode is exclusively an enterprise-only feature, and requires access to [Microsoft Defender portal](https://security.microsoft.com/).

## What do you need to know before you begin

During the troubleshooting mode, you can:

- Use Microsoft Defender for Endpoint on macOS functional troubleshooting /application compatibility (false positives).
- Local admins, with appropriate permissions, can change the following policy locked configurations on individual endpoints:

  |Setting|Enable|Disable/Remove|
  |----|----|----|
  |Real-Time Protection/ Passive mode / On-Demand|`mdatp config real-time-protection --value enabled`|`mdatp config real-time-protection --value disabled`|
  |Network Protection|`mdatp config network-protection enforcement-level --value block`|`mdatp config network-protection enforcement-level --value disabled`|
  |realTimeProtectionStatistics|`mdatp config real-time-protection-statistics --value enabled`|`mdatp config real-time-protection-statistics --value disabled`|
  |tags|`mdatp edr tag set --name GROUP --value [name]`|`mdatp edr tag remove --tag-name [name]`|
  |groupIds|`mdatp edr group-ids --group-id [group]`||
  |Endpoint DLP|`mdatp config data_loss_prevention --value enabled`|`mdatp config data_loss_prevention --value disabled`|

During troubleshooting mode, you can't:

- Disable tamper protection for Microsoft Defender for Endpoint on macOS.
- Uninstall the Microsoft Defender for Endpoint on macOS.

### Prerequisites

- Supported version of macOS for Microsoft Defender for Endpoint.
- Microsoft Defender for Endpoint must be tenant-enrolled and active on the device.
- Permissions for "Manage security settings in Security Center" in Microsoft Defender for Endpoint.
- Platform Update version: 101.23122.0005 or newer.

## Enable troubleshooting mode on macOS

1. Go to the [Microsoft Defender portal](https://security.microsoft.com/), and sign in.
1. Navigate to the device page you would like to turn on troubleshooting mode. Then, select the ellipses(...) and select **Turn on troubleshooting mode**.

   :::image type="content" source="media/troubleshooting-mode-on-mac.png" alt-text="Screenshot displaying the screenshot of the troubleshooting mode on mac.":::

   > [!NOTE]
   > The **Turn on troubleshooting mode** option is available on all devices, even if the device does not meet the prerequisites for troubleshooting mode. For more information, see the [Problems with troubleshooting mode](#problems-with-troubleshooting-mode) section later in this article.

1. Read the information displayed on the pane and once you're ready, select **Submit** to confirm that you want to turn on troubleshooting mode for that device.
1. You'll see *It might take a few minutes for the change to take effect* text being displayed. During this time, when you select the ellipses again, you'll see the **Turn On Troubleshooting mode is pending** option grayed-out.
1. Once complete, the device page shows that the device is now in troubleshooting mode.

   If the end-user is logged-in on the macOS device, they'll see the following text:

   *Troubleshooting mode has started. This mode allows you to temporarily change settings that are managed by your Administrator. Expires at YEAR-MM-DDTHH:MM:SSZ.*

   Select **OK**.

1. Once enabled, you can test the different command line options that are togglable in the troubleshooting mode (TS Mode).

   For example, when you use `mdatp config real-time-protection --value disabled` command to disable real time protection, you'll be prompted to enter your password. Select **OK** after entering your password.

   :::image type="content" source="media/ts-mode-rtp-disable.png" alt-text="Screenshot displaying the screenshot of real time protection being disabled.":::

   The output report similar to the following screenshot will be displayed on running mdatp health with `real_time_protection_enabled` as "false" and `tamper_protection` as "block."

   :::image type="content" source="media/ts-mode-mdatp-health.png" alt-text="Screnshot displaying the screenshot of the output report of mdatp health running.":::

## Advanced hunting queries for detection

There are some prebuilt advanced hunting queries to give you visibility into the troubleshooting events that are occurring in your environment. You can use these queries to [create detection rules](/defender-xdr/custom-detection-rules) to generate alerts when devices are in troubleshooting mode.

### Get troubleshooting events for a particular device

You can use the following query to search by `deviceId` or `deviceName` by commenting out the respective lines.

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

You can find the devices that are currently in troubleshooting mode using the following query:

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

You can find the number of troubleshooting mode instances for a device using the following query:

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

You can know the total count of troubleshooting mode instances using the following query:

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

## Problems with troubleshooting mode

If you can't enable troubleshooting mode, do the following troubleshooting steps on the target Mac:

- Verify the app version by running the following command:

  ```terminal
  mdatp health --field app_version
  ```

  As previously mentioned, you need Platform Update version: 101.23122.0005 or newer.

- Verify the device is enrolled and active by running the following commands:

  ```terminal
  mdatp health --field edr_machine_id

  mdatp connectivity test
  ```

  All endpoints should show **\[OK\]**.

- Verify the configuration source by running the following command:

  ```terminal
  mdatp health --field managed_by
  ```

  **MDE** indicates Microsoft Defender for Endpoint Attach and takes priority. **MEM** indicates Microsoft Intune or Apple Jamf.

- Validate the required profile paths:
  - /Library/Preferences/com.microsoft.mdeattach.plist
  - /Library/Managed Preferences/com.microsoft.wdav\*.plist

To elevate logging and collect diagnostics, run the following commands and then try to enable troubleshooting mode again:

```terminal

sudo mdatp log level set --level debug

sudo mdatp diagnostic create

sudo mdatp log level set --level info
```

## Recommended content

- [Microsoft Defender XDR for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender XDR for Endpoint integration with Microsoft Defender XDR for Cloud Apps](/defender-cloud-apps/mde-integration)
- [Get to know the innovative features in Microsoft Edge](https://www.microsoft.com/edge/features?form=MW00UY)
- [Protect your network](network-protection.md)
- [Turn on network protection](enable-network-protection.md)
- [Web protection](web-protection-overview.md)
- [Create indicators](indicators-overview.md)
- [Web content filtering](web-content-filtering.md)


