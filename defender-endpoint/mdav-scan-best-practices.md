---
title: Microsoft Defender Antivirus scan considerations and best practices
description: Understand when and how to use full scans with Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: high
ms.date: 05/15/2024
audience: ITPro
ms.topic: reference
author: siosulli
ms.author: siosulli
ms.custom: nextgen
ms.reviewer: pahuijbr, tudobril, yongrhee, bsabetghadam
manager: deniseb
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Microsoft Defender Antivirus scan considerations and best practices

**Applies to:**

- [Microsoft Defender for Endpoint Plans 1 and 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

**Platforms**

- Windows

This article explains the considerations and best practices for Antivirus Full Scans with Microsoft Defender for Endpoint. The article outlines the factors that impact scan performance, and describes scenarios were increased resource consumption results in increased protection efficacy.

## Overview

Real-time protection in Microsoft Defender is a feature that continuously scans your computer to help detect and stop malware infections in real time. It uses heuristic and behavior-based detection methods to monitor the activity on your device and protect against threats as they happen. Our recommendation for scheduled scans is to configure Quick Scan together with always-on Real-time Protection and Cloud Protection, as this combination provides strong coverage against malware that starts with the system and kernel-level malware. This is the default configuration. In general, there is no need to schedule a full scan and the majority of our users never need to manually run full scans.

However, some customers want to run full scans to meet their organization’s specific requirements. A full scan starts with a Quick Scan and then continues with a sequential file scan of all the fixed and removable network drives that are mounted. A full scan can last from several hours to several days, depending on the content volume, type of content, and the resources that Microsoft Defender has been allocated to perform the scan (see [Schedule regular quick and full scans with Microsoft Defender Antivirus](schedule-antivirus-scans.md)). Scan performance is not solely a function of file size and is mostly determined by the type and complexity of the content.

## Protection efficiency and performance impact

Protection and system resource usage entails tradeoffs. Device performance is highly dependent on the customers’ environment. It is quite natural that running a full scan on a device with lots of complex content would lead to an increased time to completion. The following table summarizes scenarios where we’ve made decisions to use more system resources to increase our protection efficiency.

| Setting | Default | Details |
|--|--|--|
| Archive/Container (e.g., ISOs) Scanning | Enabled | Defender is optimized to minimize the scan time of a single object. Containers may contain many objects and scanning them may take more time than expected due to the overhead of extracting the items in the container. |
| Max size of archive scanning | Unlimited | |
| Mapped Network (e.g., UNC, SMB, CIFS) | Enabled | By default, Defender scans mapped network drives. |
| OneDrive sync | Enabled | By default, Defender scans desktops, documents, or downloads that are synchronized via OneDrive or folder sync. |
| Client-side cache/offline files | Enabled | By default, Defender scans client-side cache. |
| Scan Average CPU Load Factor | 50 | See the [Scanning and CPU throttling](#scanning-and-cpu-throttling) section of this article. |

> [!NOTE]
> If real-time protection is turned on, files are scanned before they are accessed and executed. Scan occurs regardless where the files are located (see [Configure scanning options for Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md)).
> Actual CPU usage may vary depending on number of CPU cores, I/O performance, memory pressure etc. Limiting CPU usage can cause full scan to take longer to complete, so customers should fine tune this value depending on the actual CPU usage values obtained in their specific environment.

## Full scan performance optimization settings and switches

Device performance is an important factor in the rate of security event processing and the speed of file, network, and scan activities. A higher event processing rate equals higher performance impact with the AV scanner. Different Antivirus software configuration can impact performance and protection. There are settings and switches available that you can configure to adjust the performance of Microsoft Defender Antivirus.

To configure scanning options for Microsoft Defender Antivirus, you can use various tools (see [Configure scanning options for Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md)). Here are some of the available settings and switches that you can use to configure Microsoft Defender Antivirus full scans:

| Setting | Default | PowerShell/WMI parameter | Details |
|--|--|--|--|
| Archive files (.zip, .rar, etc) | Scanned	DisableArchiveScanning | By turning “DisableArchiveScanning” on, the following archive types are excluded from AV scanning: ZIP, Ace, Arc, Arj, BZip2, Cab, CF, CPIO, CPT, GZip, Hap, ISO, Lharc, PSF, Quantum, Rar, Stuff-It, Zoo, ZCompress, Compress, VC4, RPM, BGA, BH, Universal Disk Format, 7z.
https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2022-ps#-disablearchivescanning |
| Level of subfolders within an archive folder to scan | 0 | NA | 0 means unlimited. |
| Max size of archive for scan | 0 | NA | 0 means unlimited. |
| Mapped network drives | Scanned | DisableScanningMappedNetworkDrivesForFullScan | See details here: https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2022-ps#-disablescanningmappednetworkdrivesforfullscan |
| Network files | Scanned | DisableScanningNetworkFiles |  |
| Max CPU load % during scan | 50 | ScanAvgCPULoadFactor | See the “Scanning and CPU throttling” section of this page. |
| Disable CPU throttle on idle scans | Unthrottled | DisableCpuThrottleOnIdleScans | See the “Scanning and CPU throttling” section of this page. |
| Signature checks before scanning | Disabled | CheckForSignaturesBeforeRunningScan | Defender periodically checks for signature updates and performs scheduled scans automatically. By default, scan begins with existing definitions. This setting applies only to scheduled scans. |
| Removable drives during full scans | Scanned | DisableRemovableDriveScanning | Indicates whether to scan removable drives, such as flash drives, during a full scan. |
| Email | Scanned | DisableEmailScanning | Indicates whether Windows Defender parses the mailbox and mail files, according to their specific format, in order to analyze mail bodies and attachments. |
| Script | Scanned | DisableScriptScanning | Specifies whether to disable the scanning of script files. |

## Best practices and considerations

The followings are Microsoft’s recommendations:

### Full scans

- Running a full scan once after you have just enabled or installed Microsoft Defender Antivirus can be useful to scan systems to detect existing threats.

- We recommend configuring scan policies based on device type and role, e.g., SQL Server Collection, IIS Server Collection, Restricted Workstation Collection, Standard Workstation Collection.

- Avoid using domain controllers in a file server role. This lowers AV scanning activities on file shares and minimizes performance overhead.

- Microsoft Defender Antivirus has the file hash computation feature that computes file hashes for every executable file that is scanned if it wasn’t previously computed. This will have a performance cost especially when copying large files from a network share. See configure File Hash Computation to learn more about the impact on indicators.

- The full scan performance can be impacted by CPU throttling. Our recommendation is to leave CPU limit settings at the default.

> [!NOTE]
> - By design, Microsoft Defender inspects the internal content type as file extensions are often misleading and can be easily spoofed by attackers.
> 
> - The scanning performance is heavily dependent on the actual content type that is being scanned. In general, more complex file types require more time and cycle, while more unusual content types require even more time (e.g., JavaScript files).
> 
> - Microsoft Defender Performance Analyzer tool helps determine files, file extensions, and processes that might be causing performance issues on individual endpoints during antivirus scans. If you are running Microsoft Defender Antivirus and experiencing performance issues, you can use performance analyzer to optimize performance (see [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)).
> 
> - A trusted image identifier for Microsoft Defender can help improve the performance of your devices right out of the box. See [Configure a Trusted Image Identifier for Microsoft Defender](/windows-hardware/manufacture/desktop/configure-a-trusted-image-identifier-for-windows-defender?view=windows-11).

### Scanning and CPU throttling

The CPU usage limit, also known as CPU throttling, setting is used to set the maximum CPU usage for Microsoft Defender on-demand scans. The CPU throttling setting is enabled by default and is applies only to scheduled scans, and optionally to custom scans as well. It's recommended to fine tune this setting (see [Set-MpPreference (Defender)](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true) for `ScanAverageCPULoadFactor` setting) depending on the actual CPU usage values obtained in your specific environment. 

The CPU load factor for Microsoft Defender is not a hard limit but rather a guidance for the scanning engine to not exceed this maximum. For this scan policy setting you can specify a value as a percentage the maximum CPU utilization during scan. The value of 0 or 100 indicates no throttling. For instance, if this value is reduced to 20, it implies that the scanning engine will aim to keep the average CPU load of the system below 20% during the scan and it takes longer to be completed. 

- If you set the percentage value to 0 or 100, CPU throttling will be disabled, and Windows Defender can use up to 100% of CPU during the scheduled and custom scans. This is not recommended as it can lead to unresponsive apps, and even overheating so proceed with extreme caution.

- Changing the value has both pros and cons. Higher values mean the scans will perform faster however, it could slow down your system during the scan, while lower values mean the scan will take longer to finish, but you will have more CPU resources available for your system during the scan. For instance, if you are running critical workloads on a server, this setting should be set to a value that doesn’t interfere with the functioning of the workloads.

- Manual scans ignore the CPU throttling setting and run without any CPU limits. However, there is a scan policy setting (see [Set-MpPreference (Defender)](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true) for ThrottleForScheduledScanOnly setting) that if it is disabled, then manual scans will adhere to the same CPU limits as a scheduled scan.

- CPU throttling on idle scans (see [Set-MpPreference (Defender)](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true) for DisableCpuThrottleOnIdleScans setting) controls whether the CPU will be throttled for scheduled scans while the device is idle. This setting is disabled by default to ensure that the CPU will not be throttled for scheduled scans when the device is idle, regardless of what CPU throttling is set to.

> [!NOTE]
> See the idle state criteria in [Task idle conditions - Win32 apps](/windows/win32/taskschd/task-idle-conditions).

### Scanning and exclusions

Microsoft Defender has the following features that help enhance scan performance and efficiency:

- Containers/archives can take a long time to scan as certain optimizations (e.g. parallel scans) are not possible in these situations. Whenever possible, we recommend extracting the content of these containers which would allow the full scan to process items in parallel.

- Scan exclusions where you can exclude containers from scanning if this is allowed by your compliance requirements.

- Microsoft Defender Performance Analyzer tool can be used to determine exclusions that help optimize performance. See [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

Microsoft Defender has a built-in optimization for content that is highly reputable (e.g. signed by trusted sources). When it encounters such content, it simply shifts away from scanning the content to validating the signature to ensure the file wasn’t tampered with.

Note: On Windows Server 2016 and Windows Server 2019, automatic exclusions help reduce CPU load during real-time scanning. The automatic exclusions are applied in addition to any custom exclusions you configure. The automatic exclusions are based on server role, such as DNS, AD DS, Hyper-V host, File Server, Print Server, Web Server, etc. Automatic exclusions only apply to Real-time protection (RTP) scanning and are not honored during a Full/Quick or On-demand scans. See [Microsoft Defender Antivirus exclusions on Windows Server](configure-server-exclusions-microsoft-defender-antivirus.md).

### Antivirus exclusions recommendations
Excluding certain locations from scanning can shorten the scan time. There are two types of exclusions, process exclusions and file/folder exclusions. Only file/folder exclusions apply to full scan. Scan exclusions should be carefully developed to reduce scan time while minimizing risk. 
- Do not exclude compressed files if disallowed by your compliance requirements.
- Do not exclude the User Profile temp folder or the System temp folder, commonly used by malware:
o	C:\Users<UserProfileName>\AppData\Local\Temp\
o	C:\Users<UserProfileName>\AppData\LocalLow\Temp\
o	C:\Users<UserProfileName>\AppData\Roaming\Temp\
o	%Windir%\Prefetch
o	%Windir%\System32\Spool
o	C:\Windows\System32\CatRoot2
o	%Windir%\Temp
- The use of environment variables as a wildcard in exclusion lists is limited to system variables only. Do not use user-scoped environment variables when adding Microsoft Defender Antivirus folder and process exclusions. 
