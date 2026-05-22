---
title: Enable and update Microsoft Defender Antivirus on Windows Server
description: Learn how to enable and update Microsoft Defender Antivirus on Windows Server
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.reviewer: yongrhee
ms.localizationpriority: high
ms.date: 05/01/2025
ms.collection:
- m365-security
- tier2
- mde-ngp
ms.custom: intro-overview
ms.topic: how-to
ms.subservice: ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
---

# Enable and update Defender Antivirus to the latest version on Windows Server

This article describes how to enable and update Microsoft Defender Antivirus on Windows Server. You'd use the procedures in this article if Microsoft Defender Antivirus was previously disabled or uninstalled.

## Enable and update Microsoft Defender Antivirus on Windows Server

1. Install the latest [servicing stack updates](/windows/deployment/update/servicing-stack-updates).

1. Install the latest [cumulative update](/windows/deployment/update/catalog-checkpoint-cumulative-updates).

1. Reinstall Microsoft Defender Antivirus or re-enable it. See the following sections (in this article):

   - [Re-enable Microsoft Defender Antivirus on Windows Server if it was disabled](#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-disabled)
   - [Re-enable Microsoft Defender Antivirus on Windows Server if it was uninstalled](#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-uninstalled)

1. Reboot the system.

1. Install the latest version of the platform update.

   > [!NOTE]
   > Re-enabling Microsoft Defender Antivirus doesn't automatically install the platform update. You can download and install the latest platform version using Windows update. Alternatively, you can download the update package from the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623) or from the [Antimalware and cyber security portal](https://go.microsoft.com/fwlink/?linkid=870379&arch=x64).
   >
   > If you're preparing to install the modern, unified solution on Windows Server 2016, you can leverage the [Installer help script](https://github.com/microsoft/mdefordownlevelserver/blob/main/Install.ps1) to automate the platform update and the subsequent installation and onboarding. This script can also assist in re-enabling Microsoft Defender Antivirus.

## Re-enable Microsoft Defender Antivirus on Windows Server if it was disabled

First, ensure that Microsoft Defender Antivirus is not disabled either through Group Policy or registry. For more information, see [Troubleshoot Microsoft Defender Antivirus while migrating from a third-party solution](troubleshoot-microsoft-defender-antivirus-when-migrating.yml).

If Microsoft Defender Antivirus features and installation files were previously removed from Windows Server 2016, follow the guidance in [Configure a Windows Repair Source](/windows-hardware/manufacture/desktop/configure-a-windows-repair-source) to restore the feature installation files.

On Windows Server 2016 you might need to use the `-WdEnable` option on the MpCmdRun command-line tool to re-enable Microsoft Defender Antivirus.

1. In an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**), run the following commands:

   > [!TIP]
   > The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Windows Defender`.

   ```dos
   (set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

   MpCmdRun.exe -WdEnable
   ```

1. Restart the device.

## Re-enable Microsoft Defender Antivirus on Windows Server if it was uninstalled

In case the Defender feature was uninstalled/removed, you can add it back.

1. In an elevated Command Prompt, run the following commands:

   ```powershell
   # Windows Server 2016
   Dism /Online /Enable-Feature /FeatureName:Windows-Defender-Features

   Dism /Online /Enable-Feature /FeatureName:Windows-Defender

   Dism /Online /Enable-Feature /FeatureName:Windows-Defender-Gui

   # Windows Server 1803 or Windows Server 2019 or later
   Dism /Online /Enable-Feature /FeatureName:Windows-Defender
   ```

   > [!TIP]
   > You can also use [Server Manager or PowerShell to install the Microsoft Defender Antivirus feature](microsoft-defender-antivirus-on-windows-server.md#install-microsoft-defender-antivirus-on-windows-server).

1. Reboot the system.

## Related articles

[Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
