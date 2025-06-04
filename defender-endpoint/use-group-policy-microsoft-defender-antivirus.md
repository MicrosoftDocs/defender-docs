---
title: Configure Microsoft Defender Antivirus with Group Policy
description: Learn how to use a Group Policy to configure and manage Microsoft Defender Antivirus on your endpoints in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 04/11/2025
ms.reviewer: ksarens, jtoole, pahuijbr, yongrhee
manager: deniseb
ms.subservice: ngp
audience: ITPro
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Use Group Policy settings to configure and manage Microsoft Defender Antivirus

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

**Platforms**
- Windows
- Windows Server

We recommend using [Microsoft Intune](/mem/intune/fundamentals/what-is-intune) to manage Microsoft Defender Antivirus settings for your organization. However, you can use [Group Policy](/windows/win32/srvnodes/group-policy) to configure and manage some settings for Microsoft Defender Antivirus.

> [!IMPORTANT]
> If [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) is enabled in your organization, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored. In addition, you can't turn off tamper protection by using Group Policy. 
> 
> If you must make changes to a device and those changes are blocked by tamper protection, we recommend using [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable tamper protection on the device. After troubleshooting mode ends, any changes made to tamper-protected settings are reverted to their configured state.
> 

## Configure Microsoft Defender Antivirus using Group Policy

In general, you can use the following procedure to configure or change some settings for Microsoft Defender Antivirus.

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11)). Right-click the Group Policy Object (GPO) you want to configure and select **Edit**.

2. Using the **Group Policy Management Editor** go to **Computer configuration**.

3. Select **Administrative templates**.

4. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus**.

5. Expand the section (referred to as **Location** in the table in this article) that contains the setting you want to configure, double-click the setting to open it, and make configuration changes.

6. [Deploy the updated GPO as you normally do](/windows/win32/srvnodes/group-policy).

## Group Policy settings and resources

The following table lists commonly used Group Policy settings that are available in Windows 10 and later, Windows Server 2016 and later, including if you are running Windows Server 2012 R2 with the unified Microsoft Defender for Endpoint client.

> [!TIP]
> For the most current settings, get the latest ADMX files in your central store to access the correct policy options. See [How to create and manage the Central Store for Group Policy Administrative Templates in Windows](/troubleshoot/windows-client/group-policy/create-and-manage-central-store) and download the latest files. 

| Location | Setting | Article |
|---|---|---|
| Client interface| Enable headless UI mode | [Prevent users from seeing or interacting with the Microsoft Defender Antivirus user interface](prevent-end-user-interaction-microsoft-defender-antivirus.md) |
| Client interface| Display more text to clients when they need to perform an action | [Configure the notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Client interface| Suppress all notifications | [Configure the notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Client interface| Suppresses reboot notifications| [Configure the notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Exclusions| Extension Exclusions| [Configure and validate exclusions in Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md) |
| Exclusions | IP Address Exclusions | [Add exclusions](troubleshoot-np.md#add-exclusions) |
| Exclusions|Path Exclusions | [Configure and validate exclusions in Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md) |
| Exclusions|Process Exclusions | [Configure and validate exclusions in Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md) |
| Exclusions| Turn off Auto Exclusions | [Configure and validate exclusions in Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md) |
| Features | Device Control | [Deploy and manage device control in Microsoft Defender for Endpoint using Group Policy](device-control-deploy-manage-gpo.md) |
| Features | Enable EDR in Block Mode | [EDR in block mode: Group Policy](edr-in-block-mode.md#group-policy) |
| MAPS |  Configure the "Block at First Sight" feature| [Enable block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md) |
| MAPS | Join Microsoft MAPS| [Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md) |
| MAPS | Send file samples when further analysis is required | [Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md) |
| MAPS |  Configure local setting override for reporting to Microsoft MAPS| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| MpEngine | Configure extended cloud check| [Configure the cloud block time-out period](configure-cloud-block-timeout-period-microsoft-defender-antivirus.md) |
| MpEngine | Disable gradual rollout of Microsoft Defender updates | [Configure updates: Group Policy](configure-updates.md#group-policy) |
| MpEngine | Enable file hash computation feature |[Create indicators for files](/defender-endpoint/indicator-file#windows-prerequisites)<br/>This drives the ability to enforce Indicators of Compromise (IoC) by using file hash allow/block indicators, available in Defender for Endpoint Plan 1 and Plan 2, and in Defender for Business. Note that Microsoft Defender Antivirus automatically does hash-based computation for the antimalware engine, so you don't have to do anything extra unless it is a [VDI non-persistent image](/defender-endpoint/deployment-vdi-microsoft-defender-antivirus). |
| MpEngine | Select cloud protection level | [Specify the cloud-delivered protection level](specify-cloud-protection-level-microsoft-defender-antivirus.md) |
| Network inspection system | Convert warn verdict to block | [Network protection: Warn experience](network-protection.md#warn-experience) |
| Network inspection system | Specify more definition sets for network traffic inspection | Not used (deprecated) |
| Network inspection system | Turn on asynchronous inspection | [Optimizing network protection performance](network-protection.md#optimizing-network-protection-performance) |
| Network inspection system | Turn on definition retirement| Not used (deprecated) |
| Network inspection system | Turn on protocol recognition | Not used (deprecated) |
|Quarantine| Configure local setting override for the removal of items from Quarantine folder | [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
|Quarantine| Configure removal of items from Quarantine folder | [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Real-time protection | Configure local setting override for monitoring file and program activity on your computer | [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Real-time protection | Configure local setting override for monitoring for incoming and outgoing file activity| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Real-time protection | Configure local setting override for scanning all downloaded files and attachments| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Real-time protection | Configure local setting override to turn on behavior monitoring| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Real-time protection | Configure local setting override to turn on real-time protection | [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Real-time protection | Define the maximum size of downloaded files and attachments to be scanned | [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Configure performance mode status | [Performance mode: Group Policy](microsoft-defender-endpoint-antivirus-performance-mode.md#group-policy) |
| Real-time protection | Configure real-time protection and Security Intelligence Updates during OOBE | [Enable and configure Microsoft Defender Antivirus always-on protection](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Monitor file and program activity on your computer | [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Scan all downloaded files and attachments| [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Turn off real-time protection | [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Turn on behavior monitoring| [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Turn on process scanning whenever real-time protection is enabled | [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Turn on raw volume write notifications| [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Real-time protection | Configure monitoring for incoming and outgoing file and program activity| [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Remediation | Configure local setting override for the time of day to run a scheduled full scan to complete remediation | [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Remediation | Specify the day of the week to run a scheduled full scan to complete remediation | [Configure scheduled Microsoft Defender Antivirus scans](schedule-antivirus-scans.md) |
| Remediation | Specify the time of day to run a scheduled full scan to complete remediation | [Configure scheduled Microsoft Defender Antivirus scans](schedule-antivirus-scans.md) |
| Reporting | Configure time interval for service health reports  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure time out for detections in critically failed state  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure time out for detections in noncritical failed state  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure time out for detections in recently remediated state  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure time out for detections in requiring additional action | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure Watson events  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure whether to report Dynamic Signature dropped events  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure Windows software trace preprocessor components  | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting | Configure WPP tracing level | [Configure Microsoft Defender Antivirus notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Reporting| Turn off enhanced notifications| [Configure the notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md) |
| Root| Turn off Microsoft Defender Antivirus| Not used. If you're using or planning to use a non-Microsoft antivirus product, see [Microsoft Defender Antivirus compatibility with other security products](microsoft-defender-antivirus-compatibility.md).|
| Root| Define addresses to bypass proxy server | [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md#configure-a-static-proxy-for-microsoft-defender-antivirus) |
| Root| Define proxy autoconfig (.pac) for connecting to the network| [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md#configure-a-static-proxy-for-microsoft-defender-antivirus) |
| Root| Define proxy server for connecting to the network| [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md#configure-a-static-proxy-for-microsoft-defender-antivirus) |
| Root | Define the directory path to copy support log files  | [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md) |
| Root| Configure local administrator merge behavior for lists| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Root|Allow anti-malware service to start up with normal priority| [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Root|Allow anti-malware service to remain running always| [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Root| Turn off routine remediation | [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Root| Randomize scheduled task times| [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Root | Select the channel for Microsoft Defender daily security intelligence updates | [Update channels for security intelligence updates](manage-gradual-rollout.md#update-channels-for-security-intelligence-updates) |
| Root | Select the channel for Microsoft Defender monthly engine updates | [Update channels for monthly updates](manage-gradual-rollout.md#update-channels-for-monthly-updates) |
| Root | Select the channel for Microsoft Defender monthly platform updates | [Update channels for monthly updates](manage-gradual-rollout.md#update-channels-for-monthly-updates) |
| Scan |Allow users to pause scan | [Prevent users from seeing or interacting with the Microsoft Defender Antivirus user interface](prevent-end-user-interaction-microsoft-defender-antivirus.md) (Not supported on Windows 10 or newer, and Windows Server 2016 and newer) |
| Scan | Check for the latest virus and spyware definitions before running a scheduled scan | [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md) |
| Scan | Define the number of days after which a catch-up scan is forced | [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Scan | Turn on catch up full scan | [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Scan | Turn on catch up quick scan | [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Scan | Configure local setting override for maximum percentage of CPU utilization | [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Scan | Configure local setting override for schedule scan day| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Scan | Configure local setting override for scheduled quick scan time| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Scan | Configure local setting override for scheduled scan time| [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Scan | Configure local setting override for the scan type to use for a scheduled scan | [Prevent or allow users to locally modify policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) |
| Scan | Configure low CPU priority for scheduled scans | [Configure Microsoft Defender Antivirus scanning options](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Configure scanning of network files | [Configure Microsoft Defender Antivirus scanning options](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | CPU throttling type | [Configure Microsoft Defender Antivirus scanning options](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Create a system restore point| [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Scan | Turn on removal of items from scan history folder | [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Scan | Turn on heuristics| [Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md) |
| Scan | Turn on e-mail scanning| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Turn on reparse point scanning| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Run full scan on mapped network drives| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Scan archive files| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Scan excluded files and directories during quick scan | [Configure scanning options: Settings and locations](/defender-endpoint/configure-advanced-scan-types-microsoft-defender-antivirus#settings-and-locations) |
| Scan | Scan packed executables| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Scan scripts | [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) <p>Also see [Defender/AllowScriptScanning](/windows/client-management/mdm/policy-csp-defender).|
| Scan | Scan removable drives| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Specify the maximum depth to scan archive files| [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Specify the maximum percentage of CPU utilization during a scan | [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Specify the maximum size of archive files to be scanned | [Configure scanning options in Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md) |
| Scan | Specify the day of the week to run a scheduled scan | [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Scan | Specify the interval to run quick scans per day| [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Scan | Specify the scan type to use for a scheduled scan | [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Scan | Specify the time for a daily quick scan | [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Scan | Specify the time of day to run a scheduled scan | [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Scan | Start the scheduled scan only when computer is on but not in use| [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Scan | Trigger a quick scan after X days without any scans | [Configure scanning options: Settings and locations](/defender-endpoint/configure-advanced-scan-types-microsoft-defender-antivirus#settings-and-locations) |
| Security intelligence updates|Allow security intelligence updates from Microsoft Update| [Manage updates for mobile devices and virtual machines (VMs)](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md) |
| Security intelligence updates|Allow security intelligence updates when running on battery power | [Manage updates for mobile devices and virtual machines (VMs)](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md) |
| Security intelligence updates | Allow Microsoft Defender Antivirus to update and communicate over a metered connection | [Manage Microsoft Defender Antivirus updates and scans for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Security intelligence updates|Allow notifications to disable definitions-based reports to Microsoft MAPS| [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md) |
| Security intelligence updates|Allow real-time security intelligence updates based on reports to Microsoft MAPS| [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md) |
| Security intelligence updates| Check for the latest virus and spyware security intelligence on startup| [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md) |
| Security intelligence updates| Define file shares for downloading security intelligence updates| [Manage Microsoft Defender Antivirus protection and security intelligence updates](manage-protection-updates-microsoft-defender-antivirus.md) |
| Security intelligence updates | Define security intelligence location for VDI clients | [Configure Microsoft Defender Antivirus on a remote desktop or VDI: Group Policy](deployment-vdi-microsoft-defender-antivirus.md#group-policy) |
| Security intelligence updates| Define the number of days after which a catch up security intelligence update is required | [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Security intelligence updates| Define the number of days before spyware security intelligence are considered out of date | [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Security intelligence updates| Define the number of days before virus security intelligence are considered out of date | [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) |
| Security intelligence updates| Define the order of sources for downloading security intelligence updates| [Manage Microsoft Defender Antivirus protection and security intelligence updates](manage-protection-updates-microsoft-defender-antivirus.md) |
| Security intelligence updates|Initiate security intelligence update on startup| [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md) |
| Security intelligence updates| Specify the day of the week to check for security intelligence updates| [Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md) |
| Security intelligence updates| Specify the interval to check for security intelligence updates| [Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md) |
| Security intelligence updates| Specify the time to check for security intelligence updates| [Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md) |
| Security intelligence updates| Turn on scan after Security intelligence update| [Configure scheduled scans for Microsoft Defender Antivirus](schedule-antivirus-scans.md) |
| Threats| Specify threat alert levels at which default action shouldn't be taken when detected | [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |
| Threats| Specify threats upon which default action shouldn't be taken when detected | [Configure remediation for Microsoft Defender Antivirus scans](configure-remediation-microsoft-defender-antivirus.md) |


> [!TIP]
> Instead of using "Run full scan on mapped network drives", if you have a Network-Attached Storage (NAS) or Storage Area Network (SAN), you can use Internet Content Adaption Protocol (ICAP) scanning with the Microsoft Defender Antivirus engine. For more information, see **[Tech Community Blog: MetaDefender ICAP with Windows Defender Antivirus: World-class security for hybrid environments](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/metadefender-icap-with-windows-defender-antivirus-world-class/ba-p/800234)**.

> [!TIP]
> **Performance tip** Due to a variety of factors, Microsoft Defender Antivirus, like other antivirus software, can cause performance issues on endpoint devices. In some cases, you might need to tune the performance of Microsoft Defender Antivirus to alleviate those performance issues. Microsoft's **Performance analyzer** is a PowerShell command-line tool that helps determine which files, file paths, processes, and file extensions might be causing performance issues. You can use the information gathered using Performance analyzer to better assess performance issues and apply remediation actions. For more information, see: [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

## See also

- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Reference topics for management and configuration tools](configuration-management-reference-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)
- [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
- [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
