---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title:       Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux
description: # Add a meaningful description for search results
author:      lakshmyav # GitHub alias
ms.author:   lakshmyav
ms.service:  # Add the ms.service or ms.prod value
# ms.prod:   # To use ms.prod, uncomment it and delete ms.service
ms.topic:    # Add the ms.topic value
ms.date:     04/09/2025
---

# Configure and run antivirus scans with Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint (MDE) on Linux can be used to perform different kinds of antivirus scans on the device to help detect malicious files on the system. These scans can be run on-demand, or scheduled to run at regular intervals.

## Types of scans that can be performed with Microsoft Defender for Endpoint on Linux

You can run 3 types of on-demand scans on individual devices using MDE on Linux: Quick scan, full scan, and custom scan. 

These scans will start immediately, and you can define parameters for the scan, such as the location or type. These scans will ignore files / folders corresponding to any [antivirus exclusions](./linux-exclusions) configured on the device.

The following table lists the key points about each type of scan:

| Scan type	| Description |
|--|--|
| Quick scan (recommended) | A quick scan helps provide strong protection against malware that starts with the system and kernel-level malware by scanning directories such as `/home`, `/tmp`, `/var`, `/srv`, `/opt`, `/etc`, `/run`, `/lib`, `/usr`, `/boot`. |
| Full scan	| A full scan scans all files and folders within `/`. <br><br> A full scan can take a few hours or days to complete, depending on the amount and type of data that needs to be scanned, and the availability of CPU resources. |
| Custom scan | A custom scan runs on files and folders that you specify using the `--path` parameter. <br><br> By default, custom scans ignore files / folders specified as part of the antivirus exclusions. However, it is possible to override this behavior by using the `--ignore-exclusions` flag, to ensure the excluded files and folders are scanned during a custom scan. |


> Note
> It is recommended to use quick scans to secure your devices with least performance overheads.

## How to Run Antivirus Scans using Microsoft Defender for Endpoint on Linux

There are 3 ways by which you can run Antivirus scans using MDE on Linux: 

1. On-demand antivirus scans on individual devices using the command line
2. Scheduled antivirus scans using crontab / anacron
3. From the Portal -- needs more work

### On-demand antivirus scans on individual devices using the command line

The following commands can be used to run quick, full or custom scans on an individual device using MDE on Linux:

| Description | Command |
|--|--|
| Run a quick scan | `mdatp scan quick` |
| Run a full scan | `mdatp scan full` |
| Run a custom scan on a path | `mdatp scan custom --path [path] [--ignore-exclusions]` |
| Cancel an ongoing on-demand scan | `mdatp scan cancel` |
| List the completed / cancelled on-demand scans | `mdatp scan list` |

### Scheduled antivirus scans using crontab / anacron

Refer to the following articles for more details:

- [Schedule an antivirus scan using crontab with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-crontab)
- [Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux](./schedule-antivirus-scan-anacron)

### From the Portal -- needs more work

## Performance optimizations for antivirus scans

Running antivirus scans on your device is essential for security, but this needs to be carefully balanced with the impact on device performance. It's natural that running a full scan on a device with lots of complex content would lead to an increased use of system resources, as well as longer time to complete.

Different antivirus settings / configurations can impact performance and protection. The following are settings and switches available that you can configure to adjust the performance of MDE on Linux during antivirus scans:

| Flag | Description |
|--|--|
| Scan after definitions update | Specifies whether to start a process scan after new security intelligence updates are downloaded on the device. Enabling this setting triggers an antivirus scan on the running processes of the device. |
| Scan archives (on-demand antivirus scans only) | Specifies whether to scan archives during on-demand antivirus scans. |
| Maximum on-demand scan threads | Specifies the degree of parallelism for on-demand scans. This corresponds to the number of threads used to perform the scan and impacts the CPU usage, and the duration of the on-demand scan. |

Refer to the following article to see how to configure the above settings using CLI / managed json:

[Configure security settings in Microsoft Defender for Endpoint on Linux](./linux-preferences#antivirus-engine-preferences)


## Recommended Best Practices and Considerations

Microsoft Defender for Endpoint on Linux by default runs the antivirus engine in `passive` mode from version 101.23062.0001 onwards. Since real-time protection is turned off, it is recommended to use scheduled scans as per the requirement.

Running a full scan once after you have enabled or installed Microsoft Defender for Endpoint on Linux can be useful to scan systems to detect existing threats.

For regular, scheduled scans on the system, prefer quick scans, which help provide strong coverage both for malware that starts with the system and kernel-level malware, and have minimal performance impact on the device.
