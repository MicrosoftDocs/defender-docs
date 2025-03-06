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
ms.date: 03/06/2025
---

# Troubleshoot Microsoft Defender Antivirus scan issues

If you're seeing issues with Microsoft Defender Antivirus scans, such as scans aren't finishing, or scans are causing performance isssues on devices, you might need to troubleshoot the scan process. This article describes how to troubleshoot these kinds of issues. 

> [!NOTE]
> To understand differences between antivirus scan types, see [Comparing the quick scan, full scan, and custom scan](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan).

## How are scans launched?

Understanding why a scan is launched can help identify what settings are applied to the scan and what can be adjusted. In Microsoft Defender for Endpoint, antivirus scans can be launched in several ways. The following table summarizes these options:

| Method | Description |
|--|--|
| Schedule | Defined by policy as per policy table |
| Scan after update | Defined by policy (Settings catalogue in Intune) |
| Catch up scan | Launched when a scheduled scan was missed twice |
| Manually launched | A scan is launched manually by any of the following methods: <br/>- Command Prompt: `MpCmdRun -scan -scantype` <br/>- [Taking a response action on a device](/defender-endpoint/respond-machine-alerts#run-microsoft-defender-antivirus-scan-on-devices) in the Microsoft Defender portal <br/>- Using the Windows Security app or Microsoft Defender app on the device |


## Policies that impact scanning

Understanding the policies applied to the scan will enable you to understand the behaviour of the scan and what can be tuned to remediate the scan challenges.

The following table summarizes antivirus settings in Microsoft Intune for Windows devices:

| Group | Setting | Description |
|--|--|--|
| Scan | Allow Full Scan On Mapped Network Drives | This policy setting allows you to configure scanning mapped network drives. Keep in mind that configuring this setting can degrade performance on full scans. |
| Scan | Allow Full Scan Removable Drive Scanning | This policy setting allows you to manage whether or not to scan for malicious software and unwanted software in the contents of removable drives, such as USB flash drives, when running a full scan. |
| Scan | Allow Scanning Network Files | This policy setting allows you to configure scheduled scans and on-demand (manually initiated) scans for files that are accessed over the network. It is recommended to enable this setting. |
| Scan | Avg CPU Load Factor | This policy setting allows you to configure the maximum percentage CPU utilization permitted during a scan. Valid values for this setting are a percentage represented by the integers 5 to 100. A value of 0 indicates that there should be no throttling of CPU utilization. The default value is 50. |
| Scan | Allow Archive Scanning | This policy setting allows you to configure scans for malicious software and unwanted software in archive files such as .ZIP or .CAB files. Keep in mind that configuring this setting can degrade performance on a scan. |
| Scan | Archive Max Depth | |
| Scan | Archive Max Size | |
| Scan | Check For Signatures Before Running Scan | This policy setting allows you to manage whether a check for new virus and spyware security intelligence occurs before running a scan. It applies to scheduled scans, but has no effect on scans initiated manually from the user interface or scans started using Command Prompt with the command, `mpcmdrun -Scan`. |
| Scan | Disable Catchup Full Scan | This policy setting allows you to configure catch-up scans for scheduled full scans. A catch-up scan is a scan that's initiated because a regularly scheduled scan was missed. Usually, these scheduled scans are missed because the computer was turned off at the scheduled time. <br/><br/>If you disable or don't configure this setting, catch-up scans for scheduled full scans occur. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone signs into the computer. If there is no scheduled scan configured, no catch-up scan runs. <br/><br/> If you enable this setting, catch-up scans for scheduled full scans are disabled. |
| Scan | Enable Low CPU Priority | This policy setting allows you to enable or disable low CPU priority for scheduled scans. <br/>- If you enable this setting, low CPU priority is used during scheduled scans. <br/>- If you disable or don't configure this setting, no changes are made to CPU priority for scheduled scans. |
| General | Excluded Extensions | |
| General | Excluded Paths |  |
| General | Excluded Processes | |
| Scan Schedule | Scan Parameter | This policy setting allows you to specify the scan type to use during a scheduled scan. Scan type options are: <br/>- `1` = Quick Scan (default) <br/>- `2` = Full Scan <br/><br/>If you enable this setting, the scan type is set to the specified value. <br/><br/>If you disable or don't configure this setting, the default scan type is used. |
| Scan Schedule | Schedule Quick Scan Time | This policy setting allows you to specify the time of day at which to perform a daily quick scan. The time value is represented as the number of minutes past midnight (00:00). For example, 120 (0x78) is equivalent to 02:00 AM. By default, this setting is set to disabled. The schedule is based on local time on the computer where the scan is executing. <br/><br/>If you enable this setting, a daily quick scan runs at the time of day specified. <br/><br/>If you disable or don't configure this setting, daily quick scan controlled by this configuration doesn't run. |
| Scan Schedule | Schedule Scan Day | This policy setting allows you to specify the day of the week on which to perform a scheduled scan. The scan can also be configured to run every day or to never run at all. <br/><br/>This setting can be configured with the following ordinal number values: <br/>- (`0x0`) Every Day <br/>- (`0x1`) Sunday <br/>- (`0x2`) Monday <br/>- (`0x3`) Tuesday <br/>- (`0x4`) Wednesday <br/>- (`0x5`) Thursday <br/>- (`0x6`) Friday <br/>- (`0x7`) Saturday <br/>- (`0x8`) <br/>- Never (*default*) <br/><br/>If you enable this setting, a scheduled scan runs at the frequency specified. <br/><br/>If you disable or don't configure this setting, a scheduled scan runs at a default frequency. |











