---
title: Exclusions to avoid in Microsoft Defender Antivirus and Defender for Endpoint
description: Learn which folders, file extensions, and processes you shouldn't exclude from Microsoft Defender Antivirus and Defender for Endpoint.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: yongrhee
ms.subservice: ngp
ms.topic: concept-article
ms.date: 06/30/2026
ai-usage: ai-assisted
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender Antivirus
  - Microsoft Defender for Endpoint on macOS
  - Microsoft Defender for Endpoint on Linux

#customer intent: As a security administrator, I want to know which items I shouldn't exclude from antivirus scanning so that I don't weaken protection on my devices.
---

# Exclusions to avoid in Microsoft Defender Antivirus and Defender for Endpoint

> [!IMPORTANT]
> **Add exclusions with caution**. Exclusions for Microsoft Defender Antivirus and Defender for Endpoint reduce protection for devices.

You can define exclusions for items you don't want Microsoft Defender Antivirus or Microsoft Defender for Endpoint on macOS or Linux to scan. However, excluded items might contain threats that make your device vulnerable. Exclusions also reduce protection for features that depend on the antivirus engine, such as malware protection and file and certificate indicators of compromise (IOCs). Process exclusions also prevent [Microsoft Defender for Endpoint network protection](network-protection.md) and [attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md) from inspecting traffic or enforcing rules for the excluded processes. Before you create any exclusions, review the [Important points about exclusions](microsoft-defender-antivirus-exclusions-overview.md#important-points-about-exclusions) and the broader guidance in [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md).

Don't exclude the files, file types, folders, or processes described in this article, even if you trust that the items aren't malicious. This guidance applies to Microsoft Defender Antivirus and Defender for Endpoint on Windows, macOS, and Linux.

<a name='excluding-certain-trusted-items'></a>

<a name='folder-locations'></a>

<a name='linux-and-macos-platforms'></a>

<a name='folders'></a>

## Folders you shouldn't exclude

Attackers can abuse some folders, so don't exclude the following folders from scans:

- **Windows**:
  - `%systemdrive%`
  - `C:`, `C:\`, or `C:\*`
  - `%ProgramFiles%\Java` or `C:\Program Files\Java`
  - Program folders for installed apps. For example, `%ProgramFiles%\Contoso\`, `C:\Program Files\Contoso\`, `%ProgramFiles(x86)%\Contoso\`, or `C:\Program Files (x86)\Contoso\`
  - `C:\Temp`, `C:\Temp\`, or `C:\Temp\*`
  - `C:\Users\` or `C:\Users\*`
  - `C:\Users\<UserProfileName>\AppData\Local\Temp\` or `C:\Users\<UserProfileName>\AppData\LocalLow\Temp\`

     > [!NOTE]
     > You **should** exclude the following folders when you use [file-level antivirus protection in SharePoint](https://support.microsoft.com/SharePoint/admin/certain-folders-may-have-to-be-excluded-from-antivirus-scanning-when-you-use-file-level-antivirus-so):
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

<a name='file-extensions'></a>

## File extensions you shouldn't exclude

Attackers can abuse some file types, so don't exclude the following file extensions from scans:

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
- `.jar`
- `.java`
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

<a name='processes'></a>

## Processes you shouldn't exclude

Attackers can abuse some processes, so don't exclude the following processes from scans:

- **Windows**:
  - `AcroRd32.exe`
  - `addinprocess.exe`
  - `addinprocess32.exe`
  - `addinutil.exe`
  - `bash.exe`
  - `bginfo.exe`
  - `bitsadmin.exe`
  - `cdb.exe`
  - `cmd.exe`
  - `cscript.exe`
  - `csi.exe`
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
  - `powerpnt.exe`
  - `powershell.exe`
  - `psexec.exe`
  - `rcsi.exe`
  - `schtasks.exe`
  - `svchost.exe`
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

<a name='files-without-a-location-in-exclusions'></a>

## Don't exclude file names without a full path

When you exclude a file, specify its fully qualified path so that you exclude only the file you intend. A name-only exclusion behaves differently depending on the platform, but specifying the full path is the safer choice in every case:

- **Microsoft Defender Antivirus on Windows**: A file exclusion is matched as a path. A bare file name like `Filename.exe` isn't a reliable file exclusion and doesn't dependably exclude the file. Use a fully qualified path, such as `C:\Program Files\Contoso\Filename.exe`. To exclude a file by name in more than one location, use a wildcard path instead. For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions) and [Wildcards in file and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#wildcards-in-file-and-folder-exclusions).
- **Microsoft Defender for Endpoint on macOS and Linux**: macOS and Linux provide a file-name exclusion option in addition to full-path exclusions. To make sure you exclude only the file you intend, and not another file that happens to share the name, specify the full path, such as `/usr/local/bin/contoso-app`.

<a name='a-single-exclusion-list-for-multiple-server-workloads'></a>

## Don't use one exclusion list for multiple server workloads

Don't use a single exclusion list to define exclusions for multiple server workloads. Instead, split the exclusions into multiple lists for different apps or services.

For example, use a different exclusion list for [Internet Information Services (IIS)](/troubleshoot/developer/webapps/aspnet/configuration/exclude-folders-antivirus-scanning) than the exclusion list for [SQL Server](/troubleshoot/sql/database-engine/security/antivirus-and-sql-server).

On Windows Server, Microsoft Defender Antivirus applies many role-based exclusions automatically, so check which exclusions already apply before you create custom lists. For more information, see [Microsoft Defender Antivirus exclusions on Windows Server](microsoft-defender-antivirus-exclusions-windows-server.md).

On Linux servers, identify the specific processes and paths that each workload needs excluded instead of reusing one list. For more information, see [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md) and [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md).

<a name='using-incorrect-environment-variables-as-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists'></a>

<a name='incorrect-environment-variables-as-wildcards-in-exclusions'></a>

## Don't use environment variables that resolve to unexpected system locations

Because the antivirus service runs in the system context, Microsoft Defender Antivirus resolves environment variables in exclusions by using the **system** (LocalSystem) account. Many variables resolve to the same path in both contexts, but some don't. For example, `%TEMP%` resolves to `C:\Windows\TEMP` rather than `C:\Users\<username>\AppData\Local\Temp`, so an exclusion that uses `%TEMP%` doesn't include the location you might expect.

Before you use an environment variable in an exclusion, confirm the location it resolves to under the system account. For more information, see [System environment variables](microsoft-defender-antivirus-exclusions-overview.md#system-environment-variables).

## See also

- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md)
- [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md)
