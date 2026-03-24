---
title: Restore quarantined files in Microsoft Defender Antivirus
description: You can restore quarantined files and folders in Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.date: 10/20/2025
ms.reviewer: yongrhee, pahuijbr
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

---

# Restore quarantined files in Microsoft Defender Antivirus

Depending on how Microsoft Defender Antivirus is configured, it quarantines suspicious files. If you're certain a quarantined file isn't a threat, you can restore it on your Windows device.

## Prerequisites

### Supported operating systems

- Windows

## Using the Windows Security app

1. On your Windows device, open **Windows Security**.

1. Select **Virus & threat protection** and then, under **Current threats**, select **Protection history**.

1. If you have a list of items, you can filter on **Quarantined Items**.

1. Select an item you want to keep, and choose an action, such as **Restore**.

## Using the MpCmdRun command line

1. To show all quarantined files, run the following command in an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**):

   ```dos
   "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Restore -ListAll
   ```

1. In the same elevated Command Prompt window, use the following syntax to restore a quarantined file:

   ```dos
   "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Restore -Name <filename>
   ```

## Download or collect the file

Selecting **Download file** from the response actions allows you to download a local, password-protected .zip archive containing your file. A flyout appears where you can record a reason for downloading the file, and set a password. By default, you should be able to download files that are in quarantine.

The **Download file** button can have the following states:

- **Active** - You're able to collect the file. 
- **Disabled** - If the button is grayed out or disabled during an active collection attempt, you might not have appropriate permissions to collect files.

For more information, see [Download or collect file](respond-file-alerts.md#download-or-collect-file).

## See also

- [Configure remediation for scans](configure-remediation-microsoft-defender-antivirus.md)
- [Review scan results](review-scan-results-microsoft-defender-antivirus.md)
- [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)


