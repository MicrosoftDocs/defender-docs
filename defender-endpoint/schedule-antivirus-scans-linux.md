---
title: Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux
description: Describes how to set up and run antivirus scans using Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.reviewer: gopkr; meghapriya; lakshmyav
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 04/24/2025
---

# Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint (MDE) on Linux offers robust antivirus scanning capabilities to help identify and mitigate malicious files on your system. You can run these scans on-demand or schedule them to occur at regular intervals, ensuring continuous protection and peace of mind.

## Scans performed by Microsoft Defender for Endpoint on Linux

With Microsoft Defender for Endpoint on Linux, you can perform three types of on-demand scans on individual devices: Quick scan, full scan, and custom scan.

These scans initiate immediately, allowing you to specify parameters such as the location or type of scan. Additionally, they respect any configured [antivirus exclusions](./linux-exclusions), ensuring that excluded files and folders aren't scanned.

The following table describes each type of scan:

|Scan type|Description|
|--|--|
|**Quick scan (recommended)**| A quick scan helps provide strong protection against malware that starts with the system and kernel-level malware by scanning directories such as `/home`, `/tmp`, `/var`, `/srv`, `/opt`, `/etc`, `/run`, `/lib`, `/usr`, `/boot`. |
|**Full scan**| A full scan scans all files and folders within `/`. <br><br> A full scan with Microsoft Defender for Endpoint on Linux can take several hours or even days to complete. The duration depends on the volume and type of data being scanned, and the availability of CPU resources. |
|**Custom scan**| A custom scan runs on files and folders that you specify using the `--path` parameter. <br><br> By default, custom scans in Microsoft Defender for Endpoint on Linux ignore files and folders specified in the antivirus exclusions. However, you can override this behavior by using the `--ignore-exclusions` flag, to ensure the excluded files and folders are scanned during a custom scan. |

[!Note]
> For optimal performance with minimal impact, it is recommended to use quick scans to secure your devices.

## How to Run Antivirus Scans using Microsoft Defender for Endpoint on Linux

You can run antivirus scans on Linux using Microsoft Defender for Endpoint in three ways:

1. Command line interface (CLI) (on-demand scans)
2. crontab / anacron (scheduled scans)
3. The Defender for Endpoint portal

### Command line interface (CLI) (on-demand scans)

The following commands can be used to run quick, full, or custom scans: 

| Description | Command |
|--|--|
| Run a quick scan | `mdatp scan quick` |
| Run a full scan | `mdatp scan full` |
| Run a custom scan on a path | `mdatp scan custom --path [path] [--ignore-exclusions]` |
| Cancel an ongoing on-demand scan | `mdatp scan cancel` |
| List the completed / canceled on-demand scans | `mdatp scan list` |

### Crontab / anacron (scheduled scans)

The following articles describe how to schedule antivirus scans using crontab or anacron:

- [Schedule an antivirus scan using crontab with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-crontab)
- [Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-anacron)

### The Defender for Endpoint portal

## Performance optimizations for antivirus scans

Running antivirus scans on your device is crucial for maintaining security, but it's important to balance this with the impact on device performance. Naturally, running a full scan on a device with extensive and complex content will result in higher system resource usage and longer completion times.

Different antivirus settings and configurations can impact both performance and protection levels. To optimize the performance of Microsoft Defender for Endpoint on Linux during antivirus scans, you can adjust the following settings and switches:

|Flag|Description|
|--|--|
|**Scan after definitions update**|Determines whether to initiate a process scan after new security intelligence updates are downloaded on the device. When enabled, it triggers an antivirus scan on the device's running processes.|
|**Scan archives (on-demand antivirus scans only)**|Specifies whether to scan archives during on-demand antivirus scans. |
|**Maximum on-demand scan threads**| Specifies the degree of parallelism for on-demand scans. This corresponds to the number of threads used to perform the scan and impacts the CPU usage, and the duration of the on-demand scan. |

For detailed instructions on configuring the above settings using CLI or managed JSON, refer to the following article.

[Configure security settings in Microsoft Defender for Endpoint on Linux](./linux-preferences#antivirus-engine-preferences)


## Recommended Best Practices and Considerations

Starting from version 101.23062.0001, Microsoft Defender for Endpoint on Linux operates in `passive` mode by default, meaning real-time protection is turned off. To maintain security, it's recommended to use scheduled scans as needed.

After enabling or installing Microsoft Defender for Endpoint on Linux, running a full scan can be beneficial to detect any existing threats on the system.

For ongoing protection, opt for quick scans in your regular, scheduled scans. Quick scans provide robust coverage for malware that initiates with the system and kernel-level malware, while having minimal impact on device performance.
