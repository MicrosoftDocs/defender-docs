---
title: Troubleshoot Microsoft Defender Antivirus scan issues
description: Troubleshoot antivirus scan issues, such as scan not finishing or scans affecting device performance. 
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: troubleshooting
ms.subservice: ngp
search.appverid: met150
ms.date: 04/29/2025
---

# Troubleshoot Microsoft Defender Antivirus scan issues

If you're seeing issues with Microsoft Defender Antivirus scans, such as scans aren't finishing, or scans are causing performance issues on devices, you might need to troubleshoot the scan process. This article describes how to identify information to address issues with Microsoft Defender Antivirus scans. You learn how scans are launched, what policies are applied to scans, why scans ended, and what's impacting the performance of a scan.

> [!NOTE]
> To understand differences between antivirus scan types, see [Comparing the quick scan, full scan, and custom scan](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan).

## How scans are launched

Understanding why a scan is launched can help identify what settings are applied to the scan and what can be adjusted. In Microsoft Defender for Endpoint, antivirus scans can be launched in several ways. The following table summarizes these options:

| Method | Description |
|--|--|
| Schedule | Defined by policy as per policy table |
| Scan after update | Defined by policy (Settings catalog in Intune) |
| Catch up scan | Launched when a scheduled scan was missed twice |
| Manually launched | A scan is launched manually by using any of the following methods: <br/>- Command Prompt: `MpCmdRun -scan -scantype` <br/>- [Taking a response action on a device](/defender-endpoint/respond-machine-alerts#run-microsoft-defender-antivirus-scan-on-devices) in the Microsoft Defender portal <br/>- Using the Windows Security app or Microsoft Defender app on the device |

## CPU performance and scan throttling in Microsoft Defender Antivirus

Microsoft Defender Antivirus includes several configurable settings to manage CPU usage during scans. These settings help balance system performance and security by controlling how aggressively Defender uses system resources. If you use Group Policy, these settings are found under `Computer Configuration > Administrative Templates > Windows Components > Microsoft Defender Antivirus > Scan`. To check current value of these settings on a machine use the `Get-MpPreference` PowerShell command.

The key settings to be aware of are listed in the following table:

| Setting | Details |
|--|--|
| `ScanOnlyIfIdle` | **Description**: When enabled, Microsoft Defender Antivirus only performs scans when the system is idle.<br/><br/>**Purpose**: This minimizes performance impact during active use by deferring scans until the system is not in use.<br/><br/>**Typical Use Case**: Ideal for environments where user experience is a priority and scans can be delayed without compromising security.<br/><br/>**Policy Name**:<br/>**Group Policy**: Not available. <br/>- **Intune**: `./Device/Vendor/MSFT/Defender/Configuration/ScanOnlyIfIdleEnabled` <br/><br/>**Default**: True (Enabled) |
| `DisableCpuThrottleOnIdleScans` | **Description**: When set to `true`, this disables CPU throttling during idle-time scans.<br/><br/>**Purpose**: Allows Defender to use more CPU resources when the system is idle, potentially completing scans faster.<br/><br/>**Interaction with Other Settings**: Works with `ScanOnlyIfIdle`. If both are enabled, scans run only when idle and aren't throttled.<br/><br/>**Policy Name**:<br/>- **Group Policy**: Not available.<br/>- **Intune**: `./Device/Vendor/MSFT/Defender/Configuration/DisableCpuThrottleOnIdleScans`<br/><br/>**Default**: True (Enabled) |
| `AvgCPULoadFactor` | **Description**: Specifies the average CPU load (as a percentage) that Microsoft Defender Antivirus shouldn't exceed during scans. This setting doesn't apply to real time protection scans.<br/><br/>**Purpose**: Helps maintain overall system responsiveness by limiting Defender's CPU usage.<br/><br/>**Example**: A value of `50` means Microsoft Defender Antivirus attempts to keep its CPU usage below 50% during scans.<br/><br/>**Interaction with Other Settings**: This setting is influenced by `DisableCpuThrottleOnIdleScans` and `ThrottleForScheduledScanOnly`, which can override or limit when throttling is applied.<br/><br/>**Policy Name**: <br/>- **Group Policy**: `Specify the maximum percentage of CPU utilization during a scan`<br/>- **Intune**: `./Device/Vendor/MSFT/Policy/Config/Defender/AvgCPULoadFactor` |
| `ThrottleForScheduledScanOnly` | **Description**: When enabled, CPU throttling is applied only to scheduled scans, not to manual scans.<br/><br/>**Purpose**: Ensures that scheduled scans are less intrusive, while allowing manual scans to run at full speed if needed.<br/><br/>**Interaction with Other Settings**: When used with `AvgCPULoadFactor`, throttling limits only apply to scheduled scans. Manual scans ignore the CPU load factor and might use more resources.<br/><br/>**Policy Name**:<br/>- **Group Policy**: `Cpu throttling type` <br/>- **Intune**: `./Device/Vendor/MSFT/Policy/Config/Defender/ThrottleForScheduledScanOnly`<br/><br/>**Default**: True (Enabled) |
| `EnableLowCpuPriority` | **Description**: This policy setting allows you to enable or disable low CPU priority for scheduled scans.<br/><br/>**Purpose**: Helps reduce the impact of scans on system performance by allowing other processes to take precedence over Microsoft Defender Antivirus's scanning tasks.<br/><br/>**Interaction with Other Settings**: Complements `AvgCPULoadFactor` and `ThrottleForScheduledScanOnly` by further deprioritizing Microsoft Defender Antivirus's CPU usage. It's especially useful in environments where maintaining responsiveness during scans is critical.<br/><br/>**Policy Name**: <br/>- **Group Policy**: `Configure low CPU priority for scheduled scans`<br/>- **Intune**: `./Device/Vendor/MSFT/Policy/Config/Defender/EnableLowCPUPriority`<br/><br/>**Default**: False (Disabled) |

## Policies that impact scanning

Understanding the policies applied to the scan enables you to understand the behavior of the scan and what can be tuned to remediate scan challenges.

The following table summarizes antivirus settings in Microsoft Intune for Windows devices:

| Group | Setting | Description |
|--|--|--|
| Scan | Allow Full Scan On Mapped Network Drives | This policy setting allows you to configure scanning mapped network drives. Keep in mind that configuring this setting can degrade performance on full scans. |
| Scan | Allow Full Scan Removable Drive Scanning | This policy setting allows you to manage whether or not to scan for malicious software and unwanted software in the contents of removable drives, such as USB flash drives, when running a full scan. |
| Scan | Allow Scanning Network Files | This policy setting allows you to configure scheduled scans and on-demand (manually initiated) scans for files that are accessed over the network. It's recommended to enable this setting. |
| Scan | Avg CPU Load Factor | This policy setting allows you to configure the maximum percentage CPU utilization permitted during a scan. Valid values for this setting are a percentage represented by the integers 5 to 100. A value of 0 indicates that there should be no throttling of CPU utilization. The default value is 50. |
| Scan | Allow Archive Scanning | This policy setting allows you to configure scans for malicious software and unwanted software in archive files such as .ZIP or .CAB files. Keep in mind that configuring this setting can degrade performance on a scan. |
| Scan | Archive Max Depth | |
| Scan | Archive Max Size | |
| Scan | Check For Signatures Before Running Scan | This policy setting allows you to manage whether a check for new virus and spyware security intelligence occurs before running a scan. It applies to scheduled scans, but has no effect on scans initiated manually from the user interface or scans started using Command Prompt with the command, `mpcmdrun -Scan`. |
| Scan | Disable Catchup Full Scan | This policy setting allows you to configure catch-up scans for scheduled full scans. A catch-up scan is a scan that's initiated because a regularly scheduled scan was missed. Usually, these scheduled scans are missed because the computer was turned off at the scheduled time. <br/><br/>If you disable or don't configure this setting, catch-up scans for scheduled full scans occur. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone signs into the computer. If there's no scheduled scan configured, no catch-up scan runs. <br/><br/> If you enable this setting, catch-up scans for scheduled full scans are disabled. |
| Scan | Enable Low CPU Priority | This policy setting allows you to enable or disable low CPU priority for scheduled scans. <br/>- If you enable this setting, low CPU priority is used during scheduled scans. <br/>- If you disable or don't configure this setting, no changes are made to CPU priority for scheduled scans. |
| General | Excluded Extensions | |
| General | Excluded Paths |  |
| General | Excluded Processes | |
| Scan Schedule | Scan Parameter | This policy setting allows you to specify the scan type to use during a scheduled scan. Scan type options are: <br/>- 1 = Quick Scan (default) <br/>- 2 = Full Scan <br/><br/>If you enable this setting, the scan type is set to the specified value. <br/><br/>If you disable or don't configure this setting, the default scan type is used. |
| Scan Schedule | Schedule Quick Scan Time | This policy setting allows you to specify the time of day at which to perform a daily quick scan. The time value is represented as the number of minutes past midnight (00:00). For example, 120 (0x78) is equivalent to 02:00 AM. By default, this setting is set to disabled. The schedule is based on local time on the computer where the scan is executing. <br/><br/>If you enable this setting, a daily quick scan runs at the time of day specified. <br/><br/>If you disable or don't configure this setting, daily quick scan controlled by this configuration doesn't run. |
| Scan Schedule | Schedule Scan Day | This policy setting allows you to specify the day of the week on which to perform a scheduled scan. The scan can also be configured to run every day or to never run at all. <br/><br/>This setting can be configured with the following ordinal number values: <br/>- (0x0) Every Day <br/>- (0x1) Sunday <br/>- (0x2) Monday <br/>- (0x3) Tuesday <br/>- (0x4) Wednesday <br/>- (0x5) Thursday <br/>- (0x6) Friday <br/>- (0x7) Saturday <br/>- (0x8) Never (*default*) <br/><br/>If you enable this setting, a scheduled scan runs at the frequency specified. <br/><br/>If you disable or don't configure this setting, a scheduled scan runs at a default frequency. |
| Scan Schedule | Schedule Scan Time | This policy setting allows you to specify the time of day at which to perform a scheduled scan. The time value is represented as the number of minutes past midnight (00:00). For example, 120 (0x78) is equivalent to 02:00 AM. By default, this setting is set to a time value of 2:00 AM. The schedule is based on local time on the computer where the scan is executing. <br/><br/>If you enable this setting, a scheduled scan runs at the time of day specified. <br/><br/>If you disable or don't configure this setting, a scheduled scan runs at a default time. |
| Scan Schedule | Randomize Schedule Task Times | Widen or narrow the randomization period for scheduled scans. Specify a randomization window of between 1 and 23 hours by using the setting `SchedulerRandomizationTime`. |
| Scan Schedule | Scheduler Randomization Time | |
| Scan Schedule | Turn on scan after Security intelligence update | Turn on scan after Security intelligence update. Keep in mind that this setting is only available through Settings Catalog. |

In an Intune policy and in [Defender for Endpoint Security Settings Management](/defender-endpoint/mde-security-settings-management), you can configure two scanning schedules:

- **A daily quick scan**: You can configure the time a daily quick scan runs. Disabling or not configuring disables a daily quick scan.

   Setting: `Schedule Quick Scan Time`

- **A Scheduled scan**: You can configure when a scheduled scan runs, you can choose the type of scan and when it runs.

   Settings: `Scan Parameter`; `Schedule Scan Day`; and `Schedule Scan Time`

If you're using Group Policy to manage your devices, see [Configure Microsoft Defender Antivirus with Group Policy](/defender-endpoint/use-group-policy-microsoft-defender-antivirus#group-policy-settings-and-resources)

For information about troubleshooting antivirus settings, see [Troubleshoot Microsoft Defender Antivirus settings](/defender-endpoint/troubleshoot-settings)

For more information about scan behaviors when Microsoft Defender Antivirus is in passive mode, see [Microsoft Defender Antivirus compatibility with other security products](/defender-endpoint/microsoft-defender-antivirus-compatibility#notes-about-protection-states)

## Frequently asked questions about scans

- **Question**: My quick scans are scheduled for Mondays but they're happening daily. Why is that?

   **Answer**: If you want the scheduled scans to be the only scans, set `ScheduleQuickScanTime` to `0`.

- **Question**: Why are catch-up scans not running on my machine, even though `DisableCatchupQuickScan` is set to `0`?

   **Answer**: Catch-up scans don't run when the device is running on battery.

- **Question**: Why are daily quick scans not running on my machine even though I have scheduled them?

   **Answer**: Check to see if daily quick scans are configured on the machine. If `ScanParameters` is set to `2`, then the default scheduled scan type is `Full Scan`. If `ScheduledQuickScanTime` is set to `0`, then daily quick scans aren't set.

- **Question**: Why is my full scan failing due to memory issues (memory consumption/exceeding constraints)?

   **Answer**: It's possible that there are a large number of cab/zip files on the machine. We recommend going through high size folders and either cleaning up or removing unused files, and/or implementing exclusions for specific cases (such as files under `C:\Windows`). See [Recommended antivirus exclusions for Configuration Manager](/troubleshoot/mem/configmgr/endpoint-protection/recommended-antivirus-exclusions).

## How to confirm scan status

Confirming if a scan has been canceled or finished successfully allows you to target devices that have failed scans. To find out what happened, you can use Event Viewer in Windows; reports, advanced hunting, and the Device page in the Microsoft Defender portal; or APIs.

### Event Viewer

The following Event IDs are related to scan operations on a device.

- Event ID 1000 - An anti-malware scan started.
- Event ID 1001 - An anti-malware scan finished.
- Event ID 1002 - An anti-malware scan was stopped before it finished.

For more information, see [Microsoft Defender Antivirus event IDs and error codes](/defender-endpoint/troubleshoot-microsoft-defender-antivirus).

Event viewer can be access on the machine by the application or PowerShell. For more information, see [Review logs in Event Viewer](#review-logs-in-event-viewer) (in this article).

### Reports in the Microsoft Defender portal

Reports are available that include current scan status. You can expand the view and export details. For more information, see [Device health report](/defender-endpoint/device-health-microsoft-defender-antivirus-health).
 
### Advanced hunting

You can also find information about scan completion and cancellation in [advanced hunting](/defender-xdr/advanced-hunting-overview). To get help with advanced hunting, see the following articles:

- [Proactively hunt for threats with advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview)
- [Choose between guided and advanced modes to hunt in Microsoft Defender XDR](/defender-xdr/advanced-hunting-modes)
- [Learn the advanced hunting query language](/defender-xdr/advanced-hunting-query-language)
        
### Device page in the Microsoft Defender portal

In the Microsoft Defender portal, you can view information about scans on the device page. For more information, see the following articles:

- [Device health reports in Microsoft Defender for Endpoint](device-health-reports.md)
- [Device inventory](machines-view-overview.md)
 
### APIs

Data about scan status can be exported by using the export health reporting API, as follows:

```console

"quickScanResult": "Completed",
"quickScanError": "",
"quickScanTime": "2202-08-02T18:40:15.882Z",
"fullScanResult": "",
"fullScanError": "",
"fullScanTime": null,

```

For more information, see [Export device antivirus health report](/defender-endpoint/api/device-health-export-antivirus-health-report-api).

## Reasons why scans are canceled or terminated

Identifying why a scan was canceled enables you to identify what needs to be reviewed to enable scans to finish successfully. The following table lists reasons why scans didn't complete.

| Reason | Details |
|--|--|
| The device restarts | Details of device restarts can be reviewed using Event Viewer on the device. <br/>- Event Log:    System <br/>- Event IDs: 6005, 6006, 6007, and 6008 |
| The scan times out | Scheduled scans use `mpcmdrun`, but if someone uses `mpcmdrun` to run an on-demand scan, the timer still applies. Antivirus scans launched by the Windows Security app (Local) and the Microsoft Defender portal don't use `mpcmdrun`, and each method starts a scan directly by using `mpclient`. <br/>- Scans initiated in the Microsoft Defender portal or the Windows Security app (Quick or Full): No time limit<br/>- Scheduled Full Scans or `MpCmdRun -scan`: Seven day limit<br/>- Scheduled Quick Scans or `MpCmdRun -scan`: One day limit |
| The device is running on battery | If a device is unplugged and running on battery during a scheduled full scan, the scheduled scan stops with event 1002, which states that the scan stopped before completion. Microsoft Defender Antivirus runs a full scan at the next scheduled time. For more information, see [Schedule antivirus scans: Important points to keep in mind](/microsoft-365/security/defender-endpoint/schedule-antivirus-scans?#important-points-to-keep-in-mind).
| Other power-related events | The following event IDs (from Kernel-Power) indicate changing of the power state of the device which could impact the scanning finishing in a timely manner: <br/>- 107: The system has resumed from sleep.<br/>- 42: The system is entering sleep. Sleep Reason: Hibernate from Sleep - Standby Battery Budget Exceeded<br/>- 507: The system is exiting Modern Standby. Reason: Sleep, Hibernate, or Shutdown.<br/>- 506: The system is entering Modern Standby. Reason: Lid.<br/>- 105:  Power source change. |

## Use performance analyzer on the device

If, after following the guidance in this article, you haven't identified a misconfiguration issue on the device, you can use the `New-MpPerformanceRecording` command to generate a trace to identify problems on the device. This performance analyzer gives you the following information: 

- Top paths that impact scan time
- Top files that impact scan time
- Top processes that impact scan time
- Top file extensions that impact scan time
- Combinations, like these:
   - Top files per extension
   - Top paths per extension
   - Top processes per path
   - Top scans per file
   - Top scans per file per process

For more information, see [Performance analyzer for Microsoft Defender Antivirus](/defender-endpoint/tune-performance-defender-antivirus).

One outcome of this process might be identifying files or paths that you want to exclude from antivirus scans to improve performance. Make sure to review the following articles:

- [Exclusions overview](/defender-endpoint/navigate-defender-endpoint-antivirus-exclusions)
- [Contextual file and folder exclusions](/defender-endpoint/configure-contextual-file-folder-exclusions-microsoft-defender-antivirus)

## Reviewing Event logs

Local event logs can be reviewed either using the Event Viewer application or by using PowerShell.

### Review logs in Event Viewer

On Windows devices, Microsoft Defender Antivirus logs are located at **Application and Service Logs** > **Microsoft** > **Windows** > **Windows Defender** > **Operational**. 

The following screenshot shows scan logs in Event Viewer:

:::image type="content" source="media/mdav-scan-logs-event-viewer.png" alt-text="Screenshot showing antivirus scan logs in Windows Event Viewer." lightbox="media/mdav-scan-logs-event-viewer.png":::

Here's an example of Event 1000 in Event Viewer:

:::image type="content" source="media/event-viewer-event1000.png" alt-text="Screenshot showing Event 1000 in Event Viewer on a Windows device." lightbox="media/event-viewer-event1000.png":::

### Review events using PowerShell

You can also access this information with PowerShell by using the [Get-WinEvent](/powershell/module/microsoft.powershell.diagnostics/get-winevent?view=powershell-7.4&preserve-view=true) cmdlet.

For example, to get all events, use this command:

```powershell
Get-WinEvent -LogName 'Microsoft-Windows-Windows Defender/Operational'
```

To view scan events, use this command:

```powershell
Get-WinEvent -LogName 'Microsoft-Windows-Windows Defender/Operational' | where id -eq '1000'
```

## See also

- [Configure scheduled quick or full Microsoft Defender Antivirus scans](schedule-antivirus-scans.md)
- [Exclusions overview](navigate-defender-endpoint-antivirus-exclusions.md)
