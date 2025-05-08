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
ms.date: 05/08/2025
---

# Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint (MDE) on Linux offers robust antivirus scanning capabilities to help identify and mitigate malicious files on your system. You can run these scans on-demand or schedule them at regular intervals, ensuring continuous protection and peace of mind.

## Scans performed by Microsoft Defender for Endpoint on Linux

With Microsoft Defender for Endpoint on Linux, you can perform three types of on-demand scans on individual devices: Quick scan, full scan, and custom scan.

These scans start right away, letting you specify parameters like the location or type of scan. They also honor any configured  [antivirus exclusions](./linux-exclusion.md), ensuring that excluded files and folders aren't scanned.

The following table describes each type of scan:

|Scan type|Description|
|--|--|
|**Quick scan (recommended)**| A quick scan provides strong protection against malware by scanning directories such as `/home`, `/tmp`, `/var`, `/srv`, `/opt`, `/etc`, `/run`, `/lib`, `/usr`, `/boot`. |
|**Full scan**| A full scan scans all files and folders within `/`. <br><br> A full scan with Microsoft Defender for Endpoint on Linux can take several hours or even days to complete. The duration depends on the volume and type of data being scanned, and the availability of CPU resources. |
|**Custom scan**| A custom scan runs on files and folders specified with the `--path` parameter. <br><br> By default, custom scans in Microsoft Defender for Endpoint on Linux ignore files and folders specified in the antivirus exclusions. However, you can override this behavior by using the `--ignore-exclusions` flag, to ensure the excluded files and folders are scanned during a custom scan. |

[!Note]
> For optimal performance, we recommend using quick scans to secure your devices.

## How to Run Antivirus Scans using Microsoft Defender for Endpoint on Linux

You can run antivirus scans on Linux using Microsoft Defender for Endpoint in three ways:

1. Command line interface (CLI) (on-demand scans)
2. crontab / anacron (scheduled scans)
3. Microsoft Defender portal

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

- [Schedule an antivirus scan using crontab with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-crontab.md)
- [Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-anacron.md)

### Microsoft Defender portal

The following screenshots show how to trigger an antivirus scan on a device from the Microsoft Defender portal:

![Screenshot 2025-04-25 070817](https://github.com/user-attachments/assets/e1952535-e55e-4333-8380-f2b527a8afb7)

![Screenshot 2025-04-25 070855](https://github.com/user-attachments/assets/6a454f88-6be6-42ef-b0a1-372248e6f511)

## Performance optimizations for antivirus scans

Running antivirus scans on your device is crucial for maintaining security, but it's important to balance this with the impact on device performance. Naturally, running a full scan on a device with extensive and complex content results in higher system resource usage and longer completion times.

Various antivirus settings and configurations can influence both performance and protection levels. To enhance the performance of Microsoft Defender for Endpoint on Linux during antivirus scans, consider adjusting the following settings and switches:

|Flag|Description|
|--|--|
|**Scan after definitions update**|This setting determines whether to start a process scan after new security intelligence updates are downloaded on the device. When enabled, it initiates an antivirus scan on the device's active processes.|
|**Scan archives (on-demand antivirus scans only)**|This setting specifies whether to scan archives during on-demand antivirus scans. |
|**Maximum on-demand scan threads**|This setting controls how many threads are used for on-demand scans, impacting both CPU usage and the scan's duration.|

For detailed instructions on configuring the above settings using CLI or managed JSON, see [Configure security settings in Microsoft Defender for Endpoint on Linux](./linux-preferences#antivirus-engine-preferences.md).

## Recommended Best Practices and Considerations

Starting from version 101.23062.0001, Microsoft Defender for Endpoint on Linux operates in `passive` mode by default, meaning real-time protection is turned off. To maintain security, it's recommended to use scheduled scans as needed.

Once you've installed Microsoft Defender for Endpoint on Linux, it's a good practice to run a full scan. This helps in identifying and addressing any potential threats that might be present on your system.

For continuous protection, incorporate quick scans into your regular, scheduled scans. Quick scans offer comprehensive coverage for malware that starts with the system and kernel-level threats, all while maintaining minimal impact on your device's performance.
