---
title: Common mistakes to avoid when defining exclusions
description: Avoid common mistakes when defining exclusions for Microsoft Defender Antivirus scans.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.reviewer: yongrhee
ms.subservice: ngp
ms.topic: concept-article
ms.date: 02/20/2026
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Common mistakes to avoid when defining exclusions

> [!IMPORTANT]
> **Add exclusions with caution**. Exclusions for Microsoft Defender Antivirus reduce the level of protection for devices.

You can define exclusions for items you don't want Microsoft Defender Antivirus to scan. However, excluded items might contain threats that make your device vulnerable.

You shouldn't exclude the files, file types, folders, or processes described in this article from Microsoft Defender Antivirus scanning, even if you trust the items aren't malicious.

## Prerequisites

> [!TIP]
> Before you create exclusions, see the following articles:
>
> - [Important points about exclusions](configure-exclusions-microsoft-defender-antivirus.md#important-points-about-exclusions)
> - [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md).

### Supported operating systems

- Windows
- macOS
- Linux

<a name='excluding-certain-trusted-items'></a>

<a name='folder-locations'></a>

<a name='linux-and-macos-platforms'></a>

## Folders

You shouldn't exclude some folders from scans, because attackers might use these folders. In general, don't define exclusions for the following folders:

- **Windows**:
  - `%systemdrive%`
  - `C:`, `C:\`, or `C:\*`
  - `%ProgramFiles%\Java` or `C:\Program Files\Java`
  - Example: `%ProgramFiles%\Contoso\`, `C:\Program Files\Contoso\`, `%ProgramFiles(x86)%\Contoso\`, or `C:\Program Files (x86)\Contoso\`
  - `C:\Temp`, `C:\Temp\`, or `C:\Temp\*`
  - `C:\Users\` or `C:\Users\*`
  - `C:\Users\<UserProfileName>\AppData\Local\Temp\` or `C:\Users\<UserProfileName>\AppData\LocalLow\Temp\`.

     > [!NOTE]
     > You **should** exclude the following folders when you use [file-level antivirus protection in SharePoint](https://support.microsoft.com/office/01cbc532-a24e-4bba-8d67-0b1ed733a3d9):
     >
     > `C:\Users\ServiceAccount\AppData\Local\Temp` or `C:\Users\Default\AppData\Local\Temp`.

  - `%Windir%\Prefetch`, `C:\Windows\Prefetch`, `C:\Windows\Prefetch\`, or `C:\Windows\Prefetch\*`
  - `%Windir%\System32\Spool` or `C:\Windows\System32\Spool`
  - `C:\Windows\System32\CatRoot2`
  - `%Windir%\Temp`, `C:\Windows\Temp`, `C:\Windows\Temp\`, or `C:\Windows\Temp\*`

- **Linux and macOS**:
  - `/`
  - `/bin` or `/sbin`
  - `/usr/lib`

## File extensions

You shouldn't exclude some file extensions from scans, because attackers might use these types of files. In general, don't define exclusions for the following file extensions:

- `.7z`
- `.bat`
- `.bin`
- `.cab`
- `.cmd`
- `.com`
- `.cpl`
- `.dll`
- `.exe`
- `.fla`
- `.gif`
- `.gz`
- `.hta`
- `.inf`
- `.java`
- `.jar`
- `.job`
- `.jpeg`
- `.jpg`
- `.js`
- `.ko` or `.ko.gz`
- `.msi`
- `.ocx`
- `.png`
- `.ps1`
- `.py`
- `.rar`
- `.reg`
- `.scr`
- `.sys`
- `.tar`
- `.tmp`
- `.url`
- `.vbe`
- `.vbs`
- `.wsf`
- `.zip`

> [!NOTE]
> You can choose to exclude file types (for example, `.gif`, `.jpg`, `.jpeg`, or `.png`) if your organization uses modern, up-to-date software with strict update policies to handle vulnerabilities.

<a name='linux-and-macos-platforms-1'></a>

## Processes

You shouldn't exclude some processes from scans, because attackers might use these processes. In general, don't define exclusions for the following processes:

- **Windows**:
  - `AcroRd32.exe`
  - `addinprocess.exe`
  - `addinprocess32.exe`
  - `addinutil.exe`
  - `bash.exe`
  - `bginfo.exe`
  - `bitsadmin.exe`
  - `cdb.exe`
  - `csi.exe`
  - `cmd.exe`
  - `cscript.exe`
  - `dbghost.exe`
  - `dbgsvc.exe`
  - `dnx.exe`
  - `dotnet.exe`
  - `excel.exe`
  - `fsi.exe`
  - `fsiAnyCpu.exe`
  - `iexplore.exe`
  - `java.exe`
  - `kd.exe`
  - `lxssmanager.dll`
  - `msbuild.exe`
  - `mshta.exe`
  - `ntkd.exe`
  - `ntsd.exe`
  - `outlook.exe`
  - `psexec.exe`
  - `powerpnt.exe`
  - `powershell.exe`
  - `rcsi.exe`
  - `svchost.exe`
  - `schtasks.exe`
  - `system.management.automation.dll`
  - `windbg.exe`
  - `winword.exe`
  - `wmic.exe`
  - `wscript.exe`
  - `wuauclt.exe`

- **Linux and macOS**:
  - `bash`
  - `java`
  - `python` and `python3`
  - `sh`
  - `zsh`

<a name='using-just-the-file-name-in-the-exclusion-list'></a>

## Files without a location in exclusions

A malicious file might have the same name as a file you trust. To avoid excluding potentially malicious files from scanning, don't exclude the file only. Instead, include the fully qualified path with the file.

For example, don't exclude `Filename.exe` from scanning. Exclude the complete path and file: `C:\Program Files\Contoso\Filename.exe`.

## A single exclusion list for multiple server workloads

Don't use a single exclusion list to define exclusions for multiple server workloads. Instead, split the exclusions into multiple lists for different apps or services.

For example, the use a different exclusion list for IIS than the exclusion list for SQL Server.

<a name='using-incorrect-environment-variables-as-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists'></a>

## Incorrect environment variables as wildcards in exclusions

Don't use **user** environment variables as wildcards in folder and process exclusions in Microsoft Defender Antivirus. Only use the following types of environment variables as wildcards:

- System environment variables.
- Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.

The Microsoft Defender Antivirus service runs in the system context using the LocalSystem account. The service gets information from **system** environment variables, not **user** environment variables.

For a complete list of system environment variables, see [System environment variables](configure-extension-file-exclusions-microsoft-defender-antivirus.md#system-environment-variables).

For more information about how to use wildcards in exclusions, see [Use wildcards in the file name and folder path or extension exclusion lists](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists).

## See also

- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Configure custom exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md)
