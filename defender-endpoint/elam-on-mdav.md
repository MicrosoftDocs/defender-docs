---
title: Early Launch Antimalware (ELAM) and Microsoft Defender Antivirus
description: Learn how Microsoft Defender Antivirus uses the Early Launch Antimalware (ELAM) driver to detect rootkits and malicious drivers during boot.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/14/2026
ms.subservice: ngp
ms.localizationpriority: medium
ms.custom: partner-contribution, msecd-doc-authoring-1012
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
#customer intent: As an IT admin, I want to understand how the ELAM driver works in Microsoft Defender Antivirus so that I can troubleshoot boot-time protection issues.
---

# Early Launch Antimalware (ELAM) and Microsoft Defender Antivirus

Detecting malware that starts early in the boot cycle was a challenge before Windows 8. Starting with Windows 8 and Windows Server 2012, Windows introduced the [Early Launch Antimalware (ELAM)](/windows/compatibility/early-launch-antimalware) driver. Microsoft Defender Antivirus uses the ELAM driver (Wdboot.sys) to combat early boot threats (for example, rootkits or malicious drivers that can hide from detection). The Wdboot.sys driver starts before other boot-start drivers. ELAM evaluates other drivers and helps the Windows kernel decide whether to initialize them.

## Supported operating systems

- Windows 11
- Windows 10
- Windows Server 2025
- Windows Server 2022
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 R2
- Windows Server 2012

## ELAM detection logging

ELAM detections are logged in the same location as other Microsoft Defender Antivirus detections, for example, [Event ID 1006](troubleshoot-microsoft-defender-antivirus.yml).

## Keep the ELAM driver up to date

The ELAM driver is included in the monthly [platform update](microsoft-defender-antivirus-updates.md).

## Modify the ELAM policy

To modify the ELAM policy, use Group Policy:

**Computer Configuration** \> **Administrative Templates** \> **System** \> **Early Launch Antimalware** \> **Boot-Start Driver Initialization Policy**

## Verify the ELAM driver is loaded

Open **Registry Editor** and go to **HKEY_LOCAL_MACHINE** \> **SYSTEM** \> **CurrentControlSet** \> **Control** \> **EarlyLaunch**.

The string key named **BackupPath** should have the value `C:\Windows\ELAMBKUP`.

For more information, see [ELAM Driver Requirements](/windows-hardware/drivers/install/elam-driver-requirements).

## Revert the ELAM driver to a previous version

In an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**), run the following commands:

> [!TIP]
> The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Microsoft Defender`.

```dos
(set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

MpCmdRun.exe -RevertPlatform
```

For more information, see [Manage the sources for Microsoft Defender Antivirus protection updates](manage-protection-updates-microsoft-defender-antivirus.md).
