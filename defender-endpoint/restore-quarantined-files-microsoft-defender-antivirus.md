---
title: Restore quarantined files in Microsoft Defender Antivirus
description: You can restore quarantined files and folders in Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 03/26/2025
ms.reviewer: yongrhee, pahuijbr
manager: deniseb
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Restore quarantined files in Microsoft Defender Antivirus

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

**Platforms**
- Windows

Depending on how Microsoft Defender Antivirus is configured, it quarantines suspicious files. If you're certain a quarantined file isn't a threat, you can restore it on your Windows device.

### Using the Windows Security app

1. On your Windows device, open **Windows Security**.

2. Select **Virus & threat protection** and then, under **Current threats**, select **Protection history**.

3. If you have a list of items, you can filter on **Quarantined Items**.

4. Select an item you want to keep, and choose an action, such as **Restore**.

### Using the MpCmdRun command line

1. Open Command Prompt as an administrator.

2. Type the following command, and then press **Enter**:

   ```dos
   "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Restore -Name <filename>
   ```

### Download or collect the file

Selecting **Download file** from the response actions allows you to download a local, password-protected .zip archive containing your file. A flyout appears where you can record a reason for downloading the file, and set a password. By default, you should be able to download files that are in quarantine.

The **Download file** button can have the following states:

   - **Active** - You're able to collect the file. 
   - **Disabled** - If the button is grayed out or disabled during an active collection attempt, you might not have appropriate permissions to collect files.

For more information, see [Download or collect file](/defender-endpoint/respond-file-alerts#download-or-collect-file).

## See also

- [Configure remediation for scans](configure-remediation-microsoft-defender-antivirus.md)
- [Review scan results](review-scan-results-microsoft-defender-antivirus.md)
- [Address false positives/negatives in Microsoft Defender for Endpoint](/defender-endpoint/defender-endpoint-false-positives-negatives)


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

