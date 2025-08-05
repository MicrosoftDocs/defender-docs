---
title: Schedule antivirus scans using PowerShell
description: Schedule antivirus scans using PowerShell
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 04/30/2025
ms.reviewer: pauhijbr, ksarens
manager: deniseb
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Schedule antivirus scans using PowerShell

**Applies to:**
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md)
- Microsoft Defender for Business
- Microsoft Defender Antivirus

**Platforms**
- Windows
- Windows Server

This article describes how to configure scheduled scans using PowerShell cmdlets. To learn more about scheduling scans and about scan types, see [Configure scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md).

## Use PowerShell cmdlets for scheduling daily quick scans

Use the following cmdlets:


```powershell
Set-MpPreference -ScanScheduleQuickScanTime
```

> [!NOTE]
> The time value is represented as the number of minutes past midnights (00:00 or 12:00 a.m.), For example, 120 is equivalent to 2:00 AM.  The schedule is based on local time on the device where the scan is executing. 

To set a daily quick scan run on the Windows clients at 12:00 PM. (720). In this example, we use lunch time, since many devices nowadays are turned off after-hours (For example, laptops and/or tablets).

```powershell
Set-MpPreference -ScanScheduleQuickScanTime 720
```
To disable the daily quick scan, set this value to 0
```powershell
Set-MpPreference -ScanScheduleQuickScanTime 0
```

## Use PowerShell cmdlets to scheduling weekly quick or full scans

Use the following cmdlets:

```PowerShell
Set-MpPreference -ScanParameters
Set-MpPreference -ScanScheduleDay
Set-MpPreference -ScanScheduleOffset
```

> [!TIP]
> We recommend using the ScanScheduleOffset instead of ScanScheduleTime.

-ScanParameters,  specifies the scan type to use during a scheduled scan. The acceptable values for this parameter are:

1: Quick scan

2: Full scan

-ScanScheduleDay

Specifies the day of the week on which to perform a scheduled scan. Alternatively, specify everyday for a scheduled scan or never. The acceptable values for this parameter are:

0: Everyday

1: Sunday

2: Monday

3: Tuesday

4: Wednesday

5: Thursday

6: Friday

7: Saturday

8: Never

The default value is 8, never. If you specify a value of 8 or don't specify a value, Windows Defender doesn't perform scheduled scans.

-ScanScheduleOffset

This setting allows you to configure the number of minutes after midnight to perform a scheduled scan. The local time on the endpoint is used to determine when the scan occurs. If you enable this setting, the scheduled scan runs at the specified time. If you disable or don't enable this setting, the scheduled scan will default to running two hours (120 minutes) after midnight.

For example, setting the weekly scheduled scan for a quick scan, that runs every Wednesday at 12:00 PM (lunch time)

```powershell
Set-MpPreference -ScanParameters 1
Set-MpPreference -ScanScheduleDay 4
Set-MpPreference -ScanScheduleOffset 720
```

> [!TIP]
> We recommend setting the scheduled scans for a quick scan with Real-Time Protection enabled, Cloud Protection enabled and having the network connectivity to the Cloud Protection backend.

## Use PowerShell cmdlets to set the general settings for Scheduled scan

|Description|Setting|PowerShell cmdlet|
| -------- | -------- | -------- |
|Check for Security Intelligence Updates Before Running Scan|Disabled/Not configured (Default)|Set-MpPreference -CheckForSignaturesBeforeRunningScan Boolean <br> For example: Set-MpPreference -CheckForSignaturesBeforeRunningScan $False|
|Check for Security Intelligence Updates Before Running Scan|Disabled/Not configured (Default)|Set-MpPreference -CheckForSignaturesBeforeRunningScan `Boolean` <br> For example: Set-MpPreference -CheckForSignaturesBeforeRunningScan $False|
|Randomize Schedule Task Times|Disabled/Not configured (Default)|Set-MpPreference -RandomizeScheduleTaskTimes `Boolean` <br>Example for physical devices: Set-MpPreference -RandomizeScheduleTaskTimes $False <br>Example for Virtual Machines (VMs) or Virtual Desktop Infrastructure (VDIs) or Azure Virtual Desktop (AVD): Set-MpPreference -RandomizeScheduleTaskTimes $True <br> Note: The default randomization time is within an interval of 30 minutes after the specified start time, if the "Scheduler Randomization Time" is also not configured. <br> Note 2: Applies to scheduled scans.|
|Scheduler Randomization Time|0/Not Configured (Default, Scheduled tasks aren't randomized)|Set-MpPreference -SchedulerRandomizationTime `UInt32` <br>For example: Set-MpPreference -SchedulerRandomizationTime 1 <br> Note: If Randomize Schedule Task Times is "Not configured" and "Randomize Schedule Task Times" is also set to "Not configured," then the system will use the default behavior within an interval of 30 minutes after the specific start time. Note: If you enable this setting, you must pick a randomization window in hours between 1 and 23. <br> Note 2: Applies to scheduled scans.|
|Avg CPU Load Factor|50/Not Configured (Default)|Set-MpPreference -ScanAvgCPULoadFactor `Byte` <br>For example: Set-MpPreference -ScanAvgCPULoadFactor 50 <br> Note: The default value is 50. The acceptable values are 5 through 100. <br> Note 2: The lower you set it, the longer the scan takes. <br> Note 3: If both ScanOnlyIfIdleEnabled and DisableCpuThrottleOnIdleScans are both enabled, then the value of ScanAvgCPULoadFactor is ignored. |
|Start the scheduled scan only when device is on but not in use|True/Not Configured (Default)|Set-MpPreference -ScanOnlyIfIdleEnabled `Boolean` <br>For example: Set-MpPreference -ScanOnlyIfIdleEnabled $True Note: Applies to scheduled scans.|
|Disable CPU throttle on idle scans|Enabled/Not Configured (Default)|Set-MpPreference -DisableCpuThrottleOnIdleScans `Boolean` <br>For example: Set-MpPreference -DisableCpuThrottleOnIdleScans $True Idle here means 90% of CPU utilization or below|
|Enable Low CPU Priority|Disabled/Not Configured (Default)|Set-MpPreference -EnableLowCpuPriority `Boolean` <br>For example: Set-MpPreference -EnableLowCpuPriority $False|
|Disable Catchup Full Scan|Disabled/Not Configured (Default)|Set-MpPreference -DisableCatchupFullScan `Boolean` <br>For example: Set-MpPreference -DisableCatchupFullScan $True|
|Disable Catchup Quick Scan|Disabled/Not Configured (Default)|Set-MpPreference -DisableCatchupQuickScan `Boolean` <br>For example: Set-MpPreference -DisableCatchupQuickScan $True|
|Enable full scan on battery power|Disabled/Not Configured (Default)|Set-MpPreference -EnableFullScanOnBatteryPower `Boolean` <br>For example: Set-MpPreference -EnableFullScanOnBatteryPower $False|

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](/editor/MicrosoftDocs/defender-docs-pr/defender-endpoint%2Fschedule-antivirus-scans-powershell.md/main/bcb7536e-34b9-8af7-5381-96c46d108a91/use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/).

## PowerShell cmdlets for scheduling scans to complete remediation

Use the following cmdlets:

```PowerShell
Set-MpPreference -RemediationScheduleDay
Set-MpPreference -RemediationScheduleTime
```

#### See also

[Troubleshoot Microsoft Defender Antivirus scan issues](/defender-endpoint/troubleshoot-mdav-scan-issues)

[Use PowerShell cmdlets to configure and manage Microsoft Defender Antivirus](/defender-endpoint/use-powershell-cmdlets-microsoft-defender-antivirus)

[Set the PowerShell cmdlet to configure and manage Microsoft Defender Antivirus](/powershell/module/defender/set-mppreference)

[Defender Antivirus specific PowerShell functions](/powershell/module/defender)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/mem/intune/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
