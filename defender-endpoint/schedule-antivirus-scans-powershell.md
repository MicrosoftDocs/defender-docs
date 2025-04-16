---
title: Schedule antivirus scans using PowerShell
description: Schedule antivirus scans using PowerShell
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 03/26/2025
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

## Use PowerShell cmdlets to set the general settings for Scheduled scan and/or On-Demand scan

| Description | Setting|Powershell cmdlet|
| -------- | -------- | -------- |
|Check for Security Intelligence Updates Before Running Scan |Disabled/Not configured (Default)|Set-MpPreference -CheckForSignaturesBeforeRunningScan <Boolean><br>For example: Set-MpPreference -CheckForSignaturesBeforeRunningScan $False|
|Randomize Schedule Task Times|Disabled/Not configured (Default)|Set-MpPreference -RandomizeScheduleTaskTimes <Boolean> <br>Example for physical devices: Set-MpPreference -RandomizeScheduleTaskTimes  $False <br>Example for Virtual Machines (VM's) or Virtual Desktop Infrastructure (VDI's) or Azure Virtual Desktop (AVD): Set-MpPreference -RandomizeScheduleTaskTimes $True <br>Note: The default randomization time is within an interval of 30 minutes after the specified start time, if the "Scheduler Randomization Time" is also not configured.<br>Note 2: Applies to scheduled scans.|
|Scheduler Randomization Time|0/Not Configured (Default, Scheduled tasks won't be randomized)|Set-MpPreference -SchedulerRandomizationTime <UInt32> <br>For example: Set-MpPreference -SchedulerRandomizationTime 1<br>Note: If Randomize Schedule Task Times is "Not configured" and "Randomize Schedule Task Times" is also set to "Not configured", then the system will use the default behavior within an interval of 30 minutes after the specific start time.<br>Note: If you enable this setting, you must pick a randomization window in hours between 1 and 23. <br>Note 2: Applies to scheduled scans.|
|Avg CPU Load Factor|50/Not Configured (Default)|Set-MpPreference -ScanAvgCPULoadFactor <Byte><br>For example: Set-MpPreference -ScanAvgCPULoadFactor 50 <br>Note: The default value is 50.  The acceptable values are 5 through 100.  <br>Note 2: The lower you set it, the longer the scan will take. <br>Note 3: If both ScanOnlyIfIdleEnabled and DisableCpuThrottleOnIdleScans are both enabled, then the value of ScanAvgCPULoadFactor is ignored. <br>Note 4: Applies to scheduled scans.|
|Start the scheduled scan only when device is on but not in use|True/Not Configured (Default)|Set-MpPreference -ScanOnlyIfIdleEnabled <Boolean><br>For example: Set-MpPreference -ScanOnlyIfIdleEnabled $True <br>Note: Applies to scheduled scans.|
|Disable CPU throttle on idle scans|Enabled/Not Configured (Default)|Set-MpPreference -DisableCpuThrottleOnIdleScans <Boolean><br>For example: Set-MpPreference -DisableCpuThrottleOnIdleScans $True <br>Idle here means 90% of CPU utilization or below|
|Enable Low CPU Priority|Disabled/Not Configured (Default)|Set-MpPreference -EnableLowCpuPriority <Boolean><br>For example: Set-MpPreference -EnableLowCpuPriority $false|
|Disable Catchup Quick Scan|Enabled/Not Configured (Default)|Set-MpPreference -DisableCatchupQuickScan <Boolean><br>For example: |
|Disable Catchup Full Scan|Disabled/Not Configured (Default)|Set-MpPreference -DisableCatchupFullScan <Boolean><br>For example: |
|Enable full scan on battery power|Disabled/Not Configured (Default)|Set-MpPreference -EnableFullScanOnBatteryPower <Boolean><br>For example: Set-MpPreference -EnableFullScanOnBatteryPower $False|

## Use PowerShell cmdlets to schedule scans

Use the following cmdlets:

```PowerShell
Set-MpPreference -ScanParameters
Set-MpPreference -ScanScheduleDay
Set-MpPreference -ScanScheduleTime
Set-MpPreference -RandomizeScheduleTaskTimes

```

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/) for more information on how to use PowerShell with Microsoft Defender Antivirus.

## PowerShell cmdlets for scheduling scans when an endpoint isn't in use

Use the following cmdlets:

```PowerShell
Set-MpPreference -ScanOnlyIfIdleEnabled
```

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/).

> [!NOTE]
> When you schedule scans for times when endpoints aren't in use, scans don't honor the CPU throttling configuration and will take full advantage of the resources available to complete the scan as fast as possible.

## PowerShell cmdlets for scheduling scans to complete remediation

Use the following cmdlets:

```PowerShell
Set-MpPreference -RemediationScheduleDay
Set-MpPreference -RemediationScheduleTime
```

See [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/) for more information on how to use PowerShell with Microsoft Defender Antivirus.

## PowerShell cmdlets for scheduling daily scans

Use the following cmdlets:

```PowerShell
Set-MpPreference -ScanScheduleQuickScanTime
```

For more information about how to use PowerShell with Microsoft Defender Antivirus, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/).

#### See also

[Troubleshoot Microsoft Defender Antivirus scan issues](/defender-endpoint/troubleshoot-mdav-scan-issues)

[Use PowerShell cmdlets to configure and manage Microsoft Defender Antivirus](/defender-endpoint/use-powershell-cmdlets-microsoft-defender-antivirus)

[Defender Antivirus specific Powershell functions](/powershell/module/defender/?view=windowsserver2025-ps)

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
