---
title: Early Launch Antimalware (ELAM) and Microsoft Defender Antivirus
description: How Microsoft Defender Antivirus incorporates Early Launch Antimalware (ELAM) for preventing rootkit and drivers with malware from loading before the antivirus service and drivers are loaded.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: overview
ms.date: 10/20/2025
ms.subservice: ngp
ms.localizationpriority: medium
ms.custom: partner-contribution
search.appverid: MET150
f1 keywords: NOCSH
audience: ITPro
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Early Launch Antimalware (ELAM) and Microsoft Defender Antivirus

Detecting malware that starts early in the boot cycle was a challenge before Windows 8. In August 2012, Microsoft Defender Antivirus (MDAV) for Windows 8 or later, and Windows Server 2012 and later incorporated a new feature called the [Early Launch Antimalware (ELAM)](/windows/compatibility/early-launch-antimalware) driver. ELAM combats early boot threats (for example, rootkits or malicious drivers that can hide from detection) by using a Wdboot.sys driver that starts before other boot-start drivers. ELAM enables the evaluation of other drivers, and helps the Windows kernel decide whether those drivers should be initialized.

## Prerequisites

### Supported operating systems

- Windows 11
- Windows 10
- Windows 8.1
- Windows 8
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 R2
- Windows Server 2012

## Where are the ELAM detections logged?

The ELAM detection is logged in the same location as the other Microsoft Defender Antivirus threats, such as [Event ID 1006](troubleshoot-microsoft-defender-antivirus.yml).

## How do I keep the MDAV ELAM driver up to date?

The MDAV ELAM driver ships with the monthly "[Platform update](microsoft-defender-antivirus-updates.md)."

## Can the Early Launch Antimalware (ELAM) policy be modified?

ELAM can be modified here:

**Computer Configuration** \> **Administrative Templates** \> **System** \> **Early Launch Antimalware**

## How can I check that the MDAV ELAM driver is loaded?

Open **Registry Editor** and go to **HKEY_LOCAL_MACHINE** \> **SYSTEM** \> **CurrentControlSet** \> **Control** \> **EarlyLaunch**.

The string key named **BackupPath** should have the value `C:\Windows\ELAMBKUP`.

For more information, see [ELAM Driver Requirements](/windows-hardware/drivers/install/elam-driver-requirements).

<!--- ## How do I revert the MDAV ELAM driver to a previous version?

This option isn't available in Windows 11 versions of MpCmdRun.

C:\ProgramData\Microsoft\Windows Defender\Platform\<antimalware platform version>\MpCmdRun.exe -[RevertPlatform](command-line-arguments-microsoft-defender-antivirus.md).

For example:

```dos
C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.24010.12-0\MpCmdRun.exe -RevertPlatform
```
--->
