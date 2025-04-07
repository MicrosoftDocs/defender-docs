---
title: Microsoft Defender Antivirus full scan considerations and best practices
description: Understand when and how to use full scans with Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: high
ms.date: 05/17/2024
audience: ITPro
ms.topic: conceptual
author: emmwalshh
ms.author: ewalsh
ms.custom: 
- nextgen
- partner-contribution
ms.reviewer: bsabetghadam
manager: deniseb
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Microsoft Defender Antivirus full scan considerations and best practices

**Applies to:**

- [Microsoft Defender for Endpoint Plans 1 and 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

**Platforms**

- Windows

This article explains the considerations and best practices for running full antivirus scans with Microsoft Defender for Endpoint. This article outlines factors that impact scan performance and describes scenarios where increased resource consumption results in increased protection efficacy.

## Overview

[Real-time protection](configure-protection-features-microsoft-defender-antivirus.md) in Defender for Endpoint is a feature that continuously scans your computer to help detect and stop malware infections in real time. It uses heuristic and behavior-based detection methods to monitor the activity on your device and protect against threats as they happen. Our recommendation for scheduled scans is to configure quick scan together with always-on real-time protection and [cloud protection](cloud-protection-microsoft-defender-antivirus.md), as this combination provides strong coverage against malware that starts with the system and kernel-level malware. This configuration is the default configuration. In general, there's no need to schedule a full scan, and most users never need to manually run full scans (see [Comparing quick scan, full scan, and custom scan](/defender-endpoint/schedule-antivirus-scans#comparing-the-quick-scan-full-scan-and-custom-scan)).

However, you might have to run full scans to meet your organization's specific requirements. A full scan starts with a quick scan, and then continues with a sequential file scan of all the fixed and removable network drives that are mounted. A full scan can last from several hours to several days, depending on the content volume, type of content, and the resources that Microsoft Defender has been allocated to perform the scan (see [Schedule regular quick and full scans with Microsoft Defender Antivirus](schedule-antivirus-scans.md)). Scan performance isn't solely a function of file size, and is mostly determined by the type and complexity of the content.

## Protection efficiency and performance impact

Protection and system resource usage entails tradeoffs. Device performance is highly dependent on your environment. It's natural that running a full scan on a device with lots of complex content would lead to an increased time to completion. The following table summarizes scenarios where we've made decisions to use more system resources to increase our protection efficiency.

| Setting | Default | Details |
|--|--|--|
| Archive/Container (for example, ISOs) Scanning | `Enabled` | Microsoft Defender Antivirus is optimized to minimize the scan time of a single object. Containers might contain many objects and scanning them may take more time than expected due to the overhead of extracting the items in the container. |
| Max size of archive scanning | `Unlimited` | |
| Mapped Network (for example, UNC, SMB, CIFS) | `Enabled` | By default, Microsoft Defender Antivirus scans mapped network drives. |
| OneDrive sync | `Enabled` | By default, Microsoft Defender Antivirus scans desktops, documents, or downloads that are synchronized via OneDrive or folder sync. |
| Client-side cache/offline files | `Enabled` | By default, Defender scans client-side cache. |
| Scan Average CPU Load Factor | `50` | See the [Scanning and CPU throttling](#scanning-and-cpu-throttling) section of this article. |

> [!NOTE]
>
> - If real-time protection is turned on, files are scanned before they are accessed and executed. Scan occurs regardless of where the files are located (see [Configure scanning options for Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md)).
> - Actual CPU usage may vary depending on number of CPU cores, I/O performance, memory pressure etc. Limiting CPU usage can cause full scan to take longer to complete, so customers should fine tune this value depending on the actual CPU usage values obtained in their specific environment.

## Full scan performance optimization settings and switches

Device performance is an important factor in the rate of security event processing and the speed of file, network, and scan activities. A higher event processing rate equals higher performance impact with the AV scanner. Different Antivirus software configuration can impact performance and protection. There are settings and switches available that you can configure to adjust the performance of Microsoft Defender Antivirus.

To configure scanning options for Microsoft Defender Antivirus, you can use various tools (see [Configure scanning options for Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md)). Here are some of the available settings and switches that you can use to configure Microsoft Defender Antivirus full scans:

| Setting | Default | PowerShell/WMI parameter and details |
|--|--|--|
| Archive/Container (for example, ISOs) Scanning | `Enabled` | Microsoft Defender Antivirus is optimized to minimize the scan time of a single object. Containers might contain many objects and scanning them may take more time than expected due to the overhead of extracting the items in the container. |
| Archive files | `Scanned` | `DisableArchiveScanning`<br/><br/>Turning on `DisableArchiveScanning` excludes the following archive types from antivirus scans: <br/>- `ZIP`<br/>- `Ace`<br/>- `Arc`<br/>- `Arj`<br/>- `BZip2`<br/>- `Cab`<br/>- `CF`<br/>- `CPIO`<br/>- `CPT`<br/>- `GZip`<br/>- `Hap`<br/>- `ISO`<br/>- `Lharc`<br/>- `PSF`<br/>- `Quantum`<br/>- `Rar`<br/>- `Stuffit`<br/>- `Zoo`<br/>- `ZCompress`<br/>- `Compress`<br/>- `VC4`<br/>- `RPM`<br/>- `BGA`<br/>- `BH`<br/>- `Universal Disk Format`<br/>- `7z` <br/><br/>For more information, see [DisableArchiveScanning](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-disablearchivescanning) |
| Level of subfolders within an archive folder to scan | `0` | `0` means unlimited. |
| Max size of archive for scan | `0` | `0` means unlimited. |
| Mapped network drives | `Scanned` | `DisableScanningMappedNetworkDrivesForFullScan`<br/><br/>See [DisableScanningMappedNetworkDrivesForFullScan](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true&#-disablescanningmappednetworkdrivesforfullscan) |
| Network files | `Scanned` | `DisableScanningNetworkFiles`  |
| Max CPU load % during scan | `50` | `ScanAvgCPULoadFactor`<br/><br/>See the [Scanning and CPU throttling](#scanning-and-cpu-throttling) section of this article. |
| Disable CPU throttle on idle scans | `Unthrottled` | `DisableCpuThrottleOnIdleScans`<br/><br/>See the [Scanning and CPU throttling](#scanning-and-cpu-throttling) section of this article. |
| Signature checks before scanning | `Disabled` | `CheckForSignaturesBeforeRunningScan`<br/><br/>Microsoft Defender Antivirus periodically checks for signature updates and performs scheduled scans automatically. By default, scan begins with existing definitions. This setting applies only to scheduled scans. |
| Removable drives during full scans | `Scanned` | `DisableRemovableDriveScanning`<br/><br/>Indicates whether to scan removable drives, such as flash drives, during a full scan. |
| Email | `Scanned` | `DisableEmailScanning`<br/><br/>Indicates whether Windows Defender parses the mailbox and mail files, according to their specific format, in order to analyze mail bodies and attachments. |
| Script | `Scanned` | `DisableScriptScanning`<br/><br/>Specifies whether to disable the scanning of script files. |

## Best practices and considerations

The followings are Microsoft's recommendations:

### Full scans

- Running a full scan once after you have enabled or installed Microsoft Defender Antivirus can be useful to scan systems to detect existing threats.

- We recommend configuring scan policies based on device type and role, for example, SQL Server Collection, IIS Server Collection, Restricted Workstation Collection, Standard Workstation Collection.

- Avoid using domain controllers in a file server role. This lowers antivirus scanning activities on file shares and minimizes performance overhead.

- Microsoft Defender Antivirus has the file hash computation feature that computes file hashes for every executable file that is scanned if it wasn't previously computed. This has a performance cost especially when copying large files from a network share. See [Configure File Hash Computation](/windows/client-management/mdm/defender-csp) to learn more about the impact on indicators.

- The full scan performance can be impacted by CPU throttling. Our recommendation is to leave CPU limit settings at the default.

> [!NOTE]
>
> - By design, Microsoft Defender Antivirus inspects the internal content type as file extensions are often misleading and can be easily spoofed by attackers.
> - The scanning performance is heavily dependent on the actual content type that is being scanned. In general, more complex file types require more time and cycle, while more unusual content types require even more time (e.g., JavaScript files).
> - The performance analyzer tool for Microsoft Defender Antivirus helps determine files, file extensions, and processes that might be causing performance issues on individual endpoints during antivirus scans. If you are running Microsoft Defender Antivirus and experiencing performance issues, you can use performance analyzer to optimize performance (see [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)).
> - A trusted image identifier for Microsoft Defender Antivirus can help improve the performance of your devices. See [Configure a Trusted Image Identifier for Microsoft Defender](/windows-hardware/manufacture/desktop/configure-a-trusted-image-identifier-for-windows-defender).

### Scanning and CPU throttling

The CPU usage limit, also known as CPU throttling, setting is used to set the maximum CPU usage for Microsoft Defender on-demand scans. The CPU throttling setting is enabled by default and is applies only to scheduled scans, and optionally to custom scans as well. It's recommended to fine tune this setting (see the `ScanAverageCPULoadFactor` setting in [Set-MpPreference (Defender)](/powershell/module/defender/set-mppreference)), depending on the actual CPU usage values obtained in your specific environment. 

The CPU load factor for Microsoft Defender Antivirus isn't a hard limit but rather guidance for the scanning engine to not exceed this maximum. For this scan policy setting you can specify a value as a percentage the maximum CPU utilization during scan. The value of 0 or 100 indicates no throttling. For instance, if this value is reduced to 20, it implies that the scanning engine aims to keep the average CPU load of the system below 20% during the scan and it takes longer to be completed. 

- If you set the percentage value to 0 or 100, CPU throttling is disabled, and Windows Defender can use up to 100% of CPU during the scheduled and custom scans. This isn't recommended as it can lead to unresponsive apps, and even overheating so proceed with extreme caution.

- Changing the value has both pros and cons. Higher values mean the scans perform faster; however, it could slow down your system during the scan, while lower values mean the scan takes longer to finish, but you have more CPU resources available for your system during the scan. For instance, if you're running critical workloads on a server, this setting should be set to a value that doesn't interfere with the functioning of the workloads.

- Manual scans ignore the CPU throttling setting and run without any CPU limits. However, there's a scan policy setting (see the `ThrottleForScheduledScanOnly` setting in [Set-MpPreference (Defender)](/powershell/module/defender/set-mppreference)) that if it's disabled, then manual scans adhere to the same CPU limits as a scheduled scan.

- CPU throttling on idle scans controls whether the CPU is throttled for scheduled scans while the device is idle. This setting is disabled by default to ensure that the CPU isn't throttled for scheduled scans when the device is idle, regardless of what CPU throttling is set to. For more information, see the `DisableCpuThrottleOnIdleScans` setting in [Set-MpPreference (Defender)](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true).

   > [!NOTE]
   > See the idle state criteria in [Task idle conditions - Win32 apps](/windows/win32/taskschd/task-idle-conditions).

### Scanning and exclusions

Microsoft Defender Antivirus has the following features that help enhance scan performance and efficiency:

- Containers/archives can take a long time to scan as certain optimizations (for example, parallel scans) aren't possible in these situations. Whenever possible, we recommend extracting the content of these containers that would allow the full scan to process items in parallel.

- Scan exclusions where you can exclude containers from scanning, if this option is allowed by your compliance requirements.

- The performance analyzer tool for Microsoft Defender Antivirus can be used to determine exclusions that help optimize performance. See [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

Microsoft Defender Antivirus has a built-in optimization for content that is highly reputable (for example, signed by trusted sources). When it encounters such content, it simply shifts away from scanning the content to validating the signature to ensure the file wasn't tampered with.

### Antivirus exclusions recommendations

Excluding certain locations from scanning can shorten the scan time. There are two types of exclusions: process exclusions and file/folder exclusions. Only file/folder exclusions apply to full scan. Scan exclusions should be carefully developed to reduce scan time while minimizing risk.

- Don't exclude compressed files if disallowed by your compliance requirements.

- Don't exclude the User Profile temp folder or the System temp folder, commonly used by malware:
  - `C:\Users<UserProfileName>\AppData\Local\Temp\`
  - `C:\Users<UserProfileName>\AppData\LocalLow\Temp\`
  - `C:\Users<UserProfileName>\AppData\Roaming\Temp\`
  - `%Windir%\Prefetch`
  - `%Windir%\System32\Spool`
  - `C:\Windows\System32\CatRoot2`
  - `%Windir%\Temp`

- The use of environment variables as a wildcard in exclusion lists is limited to system variables only. Don't use user-scoped environment variables when adding Microsoft Defender Antivirus folder and process exclusions. 
