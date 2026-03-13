---
title: Schedule antivirus scans using PowerShell
description: Schedule antivirus scans using PowerShell
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.date: 12/16/2025
ms.reviewer: pauhijbr, ksarens
manager: bagol
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus

---
# Schedule antivirus scans using PowerShell

This article describes how to use the [Set-MpPreference](/powershell/module/defender/set-mppreference) PowerShell cmdlet to configure scheduled scans. To learn more about scheduling scans and about scan types, see [About scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md).

## Prerequisites

**Supported operating systems**:

- Windows
- Windows Server

## Important PowerShell parameters for scheduled scans

The following **Set-MpPreference** parameters are important for scheduled scans:

- _ScanParameters_: Specifies the scan type to use for scheduled scans. Valid values are:
  - 1 or QuickScan (default)
  - 2 or FullScan

- _ScanScheduleDay_: Specifies the day of the week to run scheduled scans. Valid values are:
  - 0 or Everyday (default)
  - 1 or Sunday
  - 2 or Monday
  - 3 or Tuesday
  - 4 or Wednesday
  - 5 or Thursday
  - 6 or Friday
  - 7 or Saturday
  - 8 or Never

- _ScanScheduleQuickScanTime_: Specifies the time on the local computer to run scheduled **quick scans**. To specify a value, enter it as a time span: `hh:mm:ss` where `hh` = hours, `mm` = minutes and `ss` = seconds. For example, `13:30:00` indicates 1:30 PM. The default value is 02:00:00 (2:00 AM).

- _ScanScheduleTime_: Specifies the time on the local computer to run scheduled **full scans**. To specify a value, enter it as a time span: `hh:mm:ss` where `hh` = hours, `mm` = minutes and `ss` = seconds. For example, `13:30:00` indicates 1:30 PM. The default value is 02:00:00 (2:00 AM).

- _ScanScheduleOffset_: Specifies the fixed number of minutes to delay scheduled scan start times on the device. The default value is 120, which means scheduled scans start 2 hours after the times specified by the _ScanScheduleTime_ and _ScanScheduleQuickScanTime_ parameters.

- _RandomizeScheduleTaskTimes_: Specifies whether to select a random time for the scheduled tasks (including scheduled scans). Valid values are:
  - $true: Scheduled tasks begin within 30 minutes before or after the scheduled time. This value is the default.
  - $false: Scheduled tasks begin on the scheduled time.

  Randomized start times can distribute the effects of scanning. For example, if several virtual machines share the same host, randomized start times prevent all virtual machines from starting the scheduled tasks at the same time.

- _SchedulerRandomizationTime_: Specifies the time window, in minutes, within which scheduled tasks in Microsoft Defender (including scheduled scans) can randomly start. Scheduled tasks can start within the specified number of minutes before or after the time of the scheduled task. A valid value is an integer from 0 to 4294967295.

  The randomization time window is used around specific start time values (for example, _ScanScheduleTime_ and _ScanScheduleQuickScanTime_ parameters) or around the number of minutes specified by the _ScanScheduleOffset_ parameter.

- _ScanOnlyIfIdleEnabled_: Specifies whether to start scheduled scans only when the computer isn't in use. Valid values are:
  - $true: Windows Defender runs schedules scans when the computer is on, but not in use. This value is the default.
  - $false: Windows Defender runs schedules scans when the computer is in use.

> [!TIP]
> We recommend the following settings for scheduled quick scans:
>
> - Real-time protection enabled (`-DisableRealtimeMonitoring $false`, which is the default value).
> - Cloud Protection enabled.
> - Network connectivity to the Cloud Protection backend.

## Use PowerShell to scheduling daily quick scans

This example sets the daily scheduled quick scan to ±4 minutes of 12:30 PM. The device is likely on, but activity on the device is likely minimal (lunch).

```powershell
Set-MpPreference -ScanScheduleQuickScanTime 12:30:00 -ScanScheduleOffset 0 -RandomizeScheduleTaskTimes $false -ScanOnlyIfIdleEnabled $false
```

We didn't need to use the following parameters in this command:

- _ScanParameters_: The default value is 0 (QuickScan).
- _ScanScheduleDay_: The default value is 0 (Everyday).

## Use PowerShell to schedule weekly full scans

This example schedules a weekly full scan every Wednesday at to ±4 minutes of 12:30 PM.

```powershell
Set-MpPreference -ScanParameters FullScan -ScanScheduleDay Wednesday -ScanScheduleQuickScanTime 12:30:00 -ScanScheduleOffset 0 -RandomizeScheduleTaskTimes $false
```

## General PowerShell parameters for scheduled scans

The following **Set-MpPreference** parameters are also available for scheduled scans:

- _CheckForSignaturesBeforeRunningScan_: Specifies whether to check for new virus and spyware definitions before Windows Defender runs **scheduled** scans. Valid values are:
  - $true: Windows Defender checks for new definitions before running a scheduled scan.
  - $false: The scheduled scan begins with the existing definitions. This value is the default.

- _ScanAvgCPULoadFactor_: Specifies the maximum percentage CPU usage for a scan. A valid value is an integer from 5 to 100. The default value is 50. The value 0 disables CPU throttling. This value isn't a hard limit, but rather guidance for the scanning engine to not exceed the specified value on average.

  The value of this parameter is ignored if both of the following conditions are true:

  - The value of the _ScanOnlyIfIdleEnabled_ parameter is $true (scan only when the computer isn't in use).
  - The value of the _DisableCpuThrottleOnIdleScans_ parameter is $true (disable CPU throttling on idle scans).

- _DisableCpuThrottleOnIdleScans_: Specifies whether to disable CPU throttling for scheduled scans while the device is idle (less than 90% CPU utilization). Valid values are:
  - $true: The CPU isn't throttled for scheduled scans, regardless of the value of the _ScanAvgCPULoadFactor_ parameter. This value is the default.
  - $false: The CPU is throttled for scheduled scans.

- _EnableLowCpuPriority_: Specifies whether to enable using low CPU priority for scheduled scans. Valid values are:
  - $true: Windows Defender uses low CPU priority for scheduled scans. This value is the default.
  - $false: Windows Defender doesn't use low CPU priority for scheduled scans.

- _DisableCatchupFullScan_: Specifies whether to disable catch-up scans for missed scheduled full scans. Valid values are:
  - $true: Windows Defender doesn't run catch-up scans for missed scheduled full scans. This value is the default.
  - $false: After two missed scheduled full scans, Windows Defender runs a catch-up scan the next time someone signs in to the computer.

- _DisableCatchupQuickScan_: Specifies whether to disable catch-up scans for missed scheduled quick scans. Valid values are:
  - $true: Windows Defender doesn't run catch-up scans for missed scheduled quick scans. This value is the default.
  - $false: After two missed scheduled quick scans, Windows Defender runs a catch-up scan the next time someone signs in to the computer.

- _EnableFullScanOnBatteryPower_: Specifies whether to enable full scans while on battery power. Valid values are:
  - $true: Windows Defender does full scans while on battery power.
  - $false: Windows Defender doesn't do full scans while on battery power. This value is the default

For more information, see [Use PowerShell cmdlets to configure and manage Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/).

## PowerShell parameters for scheduled scans to complete remediation

Scheduled full scans to complete remediation use the following parameters:

- _RemediationScheduleDay_:  Specifies the day of the week to run the scan. Valid values are:
  - 0 or Everyday (default)
  - 1 or Sunday
  - 2 or Monday
  - 3 or Tuesday
  - 4 or Wednesday
  - 5 or Thursday
  - 6 or Friday
  - 7 or Saturday
  - 8 or Never

- _RemediationScheduleTime_: Specifies the time on the local computer to run the scan. To specify a value, enter it as a time span: `hh:mm:ss` where `hh` = hours, `mm` = minutes and `ss` = seconds. For example, `13:30:00` indicates 1:30 PM. The default value is 02:00:00 (2:00 AM).

## See also

[Troubleshoot Microsoft Defender Antivirus scan issues](/defender-endpoint/troubleshoot-mdav-scan-issues)

[Use PowerShell cmdlets to configure and manage Microsoft Defender Antivirus](/defender-endpoint/use-powershell-cmdlets-microsoft-defender-antivirus)

[Set the PowerShell cmdlet to configure and manage Microsoft Defender Antivirus](/powershell/module/defender/set-mppreference)

[Defender Antivirus specific PowerShell functions](/powershell/module/defender)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see the following resources:

> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

