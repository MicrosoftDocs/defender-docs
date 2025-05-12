---
title: Schedule antivirus scans using Group Policy
description: Use Group Policy to set up antivirus scans
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 04/29/2025
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

# Schedule antivirus scans using Group Policy

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

**Platforms**
- Windows

This article describes how to configure scheduled scans using Group Policy. To learn more about scheduling scans and about scan types, see [Configure scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md). 

## Configure antivirus scans using Group Policy

1. On your Group Policy management machine, in the Group Policy Editor, go to **Computer configuration** \> **Administrative Templates** \> **Windows Components** \> **Microsoft Defender Antivirus** \> **Scan**.

2. Right-click the Group Policy Object you want to configure, and then select **Edit**.

3. Specify the settings for the Group Policy Object, and then select **OK**. 

1. Repeat steps for each setting you want to configure.

5. Deploy your Group Policy Object as you normally do. If you need help with Group Policy Objects, see [Create a Group Policy Object](/windows/security/threat-protection/windows-firewall/create-a-group-policy-object).

> [!NOTE]
> When configuring scheduled scans, the setting **Start the scheduled scan only when computer is on but not in use** (which is enabled by default) can affect the expected scheduled time by requiring the machine to be idle first.
> For weekly scans, the default behavior on Windows Server and Windows 10 and later, is to scan outside of the automatic maintenance when the machine is idle. To change this behavior, modify the settings by disabling "Start the scheduled scan only when computer is on but not in use" (**ScanOnlyIfIdle**), and then define a schedule.

For more information, see the [Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md) and [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) articles.

## Group Policy settings for scheduling daily scans (quick)

| Location | Setting | Description | Default setting (if not configured) |
| -------- | -------- | -------- | -------- |
| Scan |Specify the daily interval for running quick scans. |Specify the number of hours that should pass before the next quick scan is performed. For example, to run every two hours, enter **2**, for once a day, enter **24**. Enter **0** to never run a daily quick scan. | Never |
| Scan |Specify the time for a daily quick scan |Specify the number of minutes after midnight (for example, enter **60** for 1 AM.)  If this setting is set to 0, daily quick scans don't run.| 120 (2 AM) |

> [!TIP]
> When scheduling a scan, depending on your environment, if your client devices are shutdown after-hours, you might want to consider setting the daily quick scans during lunch time (720). 

## Group Policy settings for scheduling weekly scans (quick or full)

| Location | Setting | Description | Default setting (if not configured) |
| -------- | -------- | -------- | -------- |
|Scan|Specify the scan type to use for a scheduled scan|Quick scan||
| Scan | Specify the day of the week to run a scheduled scan| Specify the day (or never) to run a scan.| Never |
| Scan | Specify the time of day to run a scheduled scan| Specify the number of minutes after midnight to run a scan (for example, enter 60 for 1 AM).| 2 AM. |

> [!TIP]
> Our recommendation for scheduled scans is to configure **quick** scan together with always-on [real-time protection](/defender-endpoint/configure-real-time-protection-microsoft-defender-antivirus) and [cloud protection](/defender-endpoint/enable-cloud-protection-microsoft-defender-antivirus), as this combination provides strong coverage against malware that starts with the system and kernel-level malware.

> [!WARNING]
> Generally, there's no need to schedule a full scan, and most users won't need to manually run full scans (see [Comparing quick scan, full scan, and custom scan](/defender-endpoint/schedule-antivirus-scans)).

## Group Policy settings for general scheduling scans

| Location | Setting | Description | Default setting (if not configured) |
|:---|:---|:---|:---|
| Root | Randomize scheduled task times |In Microsoft Defender Antivirus, randomize the start time of the scan to any interval from **0 to 23 hours**. By default, scheduled tasks begin at a random time within four hours of the time specified in Task Scheduler. | Enabled |
| Root | Configure scheduled task times randomization window |- This setting lets you set the start time for scheduled task scans and security updates. <br> - When enabled, you can choose a randomization window between **1 and 23 hours**. <br> - The Randomize Scheduled Task Times uses the specified window. <br> - If disabled or not configured, it randomizes times between **0 and 4 hours**. | Not configured (Disabled)|

> [!TIP]
> Enable randomization for Virtual Machines (VMs), Virtual Desktop Infrastructure (VDI), and Azure Virtual Desktop (AVD) devices to ensure that scheduled scans don't run simultaneously. This helps prevent CPU and disk I/O bottlenecks on the parent partition (also known as the Host).

## Group Policy settings for scheduling scans for specifying the maximum percentage of CPU utilization during a scan

| Location | Setting |Description |Default setting (if not configured) |
| -------- | -------- | -------- | -------- |
| Scan |Specify the maximum percentage of CPU utilization during a scan|Configure the maximum percentage CPU utilization permitted during a scan.  Valid values for this setting are a percentage represented by integers 5 to 100.  A value of 0 indicates that there should be no throttling of CPU utilization.|Enabled - 50|

> [!NOTE]
> Reducing the maximum CPU utilization during a scan to between 5% and 30% will extend the duration of the scheduled scan. For environments with a maintenance window, please take this into consideration.

## Group Policy settings for scheduling scans for lowering the CPU priority

| Location | Setting | Description | Default setting (if not configured) |
|:---|:---|:---|:---|
| Scan | Start the scheduled scan only when computer is on but not in use | Scheduled scans won't run, unless the computer is on but not in use | Enabled |

## Group Policy settings for scheduling scans for when an endpoint isn't in use

| Location | Setting | Description | Default setting (if not configured) |
|:---|:---|:---|:---|
| Scan | Start the scheduled scan only when computer is on but not in use | Scheduled scans won't run, unless the computer is on but not in use | Enabled |

> [!NOTE]
> When you schedule scans for times when endpoints aren't in use, scans don't honor the CPU throttling configuration and takes full advantage of the resources available to complete the scan as fast as possible.

## Group Policy settings for scheduling remediation-required scans

|Location |Setting |Description |Default setting (if not configured) |
|---|---|---|---|
| Remediation |Specify the day of the week to run a scheduled full scan to complete remediation |Specify the day (or never) to run a scan. |Never |
| Remediation |Specify the time of day to run a scheduled full scan to complete remediation |Specify the number of minutes after midnight (for example, enter **60** for 1 AM.) |120 (2 AM)|

## Group Policy settings for scheduling scans after protection updates

|Location |Setting |Description |Default setting (if not configured)|
|:---|:---|:---|:---|
|Signature updates |Turn on scan after Security intelligence update |A process scan will occur immediately after a new protection update is downloaded |Enabled |

## See also

[Troubleshoot Microsoft Defender Antivirus scan issues](/defender-endpoint/troubleshoot-mdav-scan-issues)

[Performance analyzer for Microsoft Defender Antivirus](/defender-endpoint/tune-performance-defender-antivirus)

[Use PowerShell cmdlets to configure and manage Microsoft Defender Antivirus](/defender-endpoint/use-powershell-cmdlets-microsoft-defender-antivirus)

[Set the PowerShell cmdlet to configure and manage Microsoft Defender Antivirus](/powershell/module/defender/set-mppreference)

[Defender Antivirus specific PowerShell functions](/powershell/module/defender)

[Troubleshoot Microsoft Defender Antivirus settings](/defender-endpoint/troubleshoot-settings)

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
