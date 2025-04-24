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

These scans will start immediately, and you can define parameters for the scan, such as the location or type.

The following table lists the key points about each type of scan:

| Scan type	| Description |
|--|--|
| Quick scan (recommended) | A quick scan helps provide strong protection against malware that starts with the system and kernel-level malware by scanning directories such as `/home`, `/tmp`, `/var`, `/srv`, `/opt`, `/etc`, `/run`, `/lib`, `/usr`, `/boot`. <br><br> By default, quick scans ignore files / folders specified as part of the antivirus exclusions. However, it is possible to override this behavior by using a flag called `--ignore-exclusions`, to ensure the excluded files and folders are scanned during a quick scan. |
| Full scan	| A full scan scans all files and folders within `/`. <br><br> A full scan can take a few hours or days to complete, depending on the amount and type of data that needs to be scanned, and the availability of CPU resources. |
| Custom scan | A custom scan runs on files and folders that you specify using the `--path` parameter. <br><br> Like quick scans, custom scans by default ignore files / folders specified as part of the antivirus exclusions. However, it is possible to override this behavior by using the `--ignore-exclusions` flag. |


> Note
> It is recommended to use quick scans to secure your devices with least performance overheads.

