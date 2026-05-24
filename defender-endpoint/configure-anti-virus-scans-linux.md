---
title: Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux
description: Describes how to set up and run antivirus scans using Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: gopkr; meghapriya; lakshmyav
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: how-to
ms.subservice: linux
ms.date: 02/09/2026
---

# Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint on Linux offers robust antivirus scanning capabilities to help identify and mitigate malicious files on your system. You can run these scans on-demand or schedule them at regular intervals, ensuring continuous protection and peace of mind. Three ways of running the scans are supported:

- [Command line interface (CLI) (on-demand scans)](#run-on-demand-scans-via-cli)
- [crontab / anacron (scheduled scans)](#run-scheduled-scans-via-crontabanacron)
- [Through the Microsoft Defender portal (on-demand scans)](#run-on-demand-scans-via-the-defender-portal)

## Prerequisites

To launch a scan from the Defender portal, you must have at least **Alerts (manage)** permission. This permission requirement does not apply to manual scans triggered via the CLI.

## Supported scan types

With Defender for Endpoint on Linux, you can perform three types of on-demand scans on individual devices: *quick scan*, *full scan*, and *custom scan*.

These scans start right away, letting you specify parameters such as the location or type of scan. They also honor any configured  [antivirus exclusions](./linux-exclusions.md), ensuring that excluded files and folders aren't scanned.

The following table describes each type of scan:

|Scan type|Description|
|--|--|
|**Quick scan (recommended)**| A quick scan examines locations where malware is likely to be registered and executed, such as startup scripts, cron jobs, and system service directories (for example, `/etc/rc.local`, `/etc/init.d/`, and `systemd` service files). It also checks common directories where malware could reside, such as `/tmp`, `/var`, etc. This is subject to change based on various factors such as threat landscape or evolving malware techniques.|
|**Full scan**| A full scan scans all files and folders within `/`. <br><br> A full scan with Defender for Endpoint on Linux can take several hours or even days to complete. The duration depends on the volume and type of data being scanned and the availability of CPU resources. |
|**Custom scan**| A custom scan runs on files and folders specified with the `--path` parameter. <br><br> By default, custom scans in Defender for Endpoint on Linux ignore files and folders specified in the antivirus exclusions. However, you can override this behavior by using the `--ignore-exclusions` flag, to ensure the excluded files and folders are scanned during a custom scan. |

> [!Note]
> For optimal performance, we recommend using quick scans to secure your devices.
>
> Based on the enforcement level configured, Defender for Endpoint takes remediation actions accordingly when a scan detects a malicious file. For more information, see [Enforcement level for Microsoft Defender Antivirus](./linux-preferences.md#enforcement-level-for-microsoft-defender-antivirus).
>
> If multiple scans are initiated, they get queued one after the other.

## Run on-demand scans via CLI

The following commands can be used to run quick, full, or custom scans:

| Description | Command |
|--|--|
| Run a quick scan | `mdatp scan quick` |
| Run a full scan | `mdatp scan full` |
| Run a custom scan on a path | `mdatp scan custom --path [path] [--ignore-exclusions]` |
| Cancel an ongoing on-demand scan | `mdatp scan cancel` |
| List the completed / canceled on-demand scans | `mdatp scan list` |

## Run scheduled scans via crontab/anacron

The following articles describe how to schedule antivirus scans using crontab or anacron:

- [Schedule an antivirus scan using crontab with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-crontab.md)
- [Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-anacron.md)

## Run on-demand scans via the Defender portal

To trigger an antivirus scan on a device from the Defender portal:

1. Go to the Microsoft Defender portal (https://security.microsoft.com) and sign-in.

1. Navigate to **Assets** > **Devices**, and select the device you want to scan.

1. On the device's page, select More options (**...**), and then select **Run Antivirus Scan**.

   :::image type="content" source="./media/schedule-anti-virus-scans-linux/run-anti-virus-scan.png" alt-text="Screenshot showing where to access the run antivirus scan option." lightbox="./media/schedule-anti-virus-scans-linux/run-anti-virus-scan.png":::

1. Under **Select scan type**, select either the **Quick Scan** or **Full Scan** radio button, add a comment, and then select **Confirm**.

   :::image type="content" source="./media/schedule-anti-virus-scans-linux/choose-anti-virus-scan-type.png" alt-text="Screenshot how to choose type of antivirus scan to run.":::

## Performance optimizations

Running antivirus scans on your device is crucial for maintaining security, but it's important to balance this with the impact on device performance. Naturally, running a full scan on a device with extensive and complex content results in higher system resource usage and longer completion times.

Various antivirus settings and configurations can influence both performance and protection levels. To enhance the performance of Microsoft Defender for Endpoint on Linux during antivirus scans, consider adjusting the following settings and switches:

|Flag|Description|
|--|--|
|**Scan after definitions update**|This setting determines whether to start a process scan after new security intelligence updates are downloaded on the device. When enabled, it initiates an antivirus scan on the device's active processes.|
|**Scan archives (on-demand antivirus scans only)**|This setting specifies whether to scan archives (such as *.zip*, *.rar*, *.7z*, etc.) during on-demand antivirus scans. |
|**Maximum on-demand scan threads**|This setting controls how many threads are used for on-demand scans, impacting both CPU usage and the scan's duration.|

For detailed instructions on configuring the above settings using CLI or managed JSON, see [Configure security settings in Microsoft Defender for Endpoint on Linux](./linux-preferences.md#antivirus-engine-preferences).

## Best practices

Starting from version 101.23062.0001, Defender for Endpoint on Linux operates in passive mode by default, meaning real-time protection (RTP) is turned off. In this mode, it's recommended to use scheduled scans as needed to ensure the system is periodically protected.
 
After installing Defender for Endpoint on Linux, it's a good practice to run a full scan (or a quick scan) to help identify and remediate any existing threats on the system.
 
This is especially important before switching from passive mode to RTP mode, as enabling RTP primarily provides protection against newly introduced malware, and not the threats already present on the system. Running a scan beforehand helps ensure the device starts from a known clean state.
 
For continuous protection, incorporate quick scans into your regular scheduled scans. Quick scans offer comprehensive coverage for malware that starts with the system and kernel-level threats, all while maintaining minimal impact on your device's performance.

## Related content

- [About scheduled quick or full Microsoft Defender Antivirus scans](./schedule-antivirus-scans.md)
- [Configure and run on-demand Microsoft Defender Antivirus scans](./run-scan-microsoft-defender-antivirus.md)
- [Schedule an antivirus scan using crontab with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-crontab.md)
- [Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-anacron.md)