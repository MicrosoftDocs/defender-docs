---
title: Exclusions in Microsoft Defender Antivirus
description: Learn the concepts behind Microsoft Defender Antivirus exclusions, including built-in exclusions, custom exclusions, exclusion types, wildcards, and system environment variables.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 07/06/2026
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: ksarens
ms.subservice: ngp
ms.audience: ITPro
ms.topic: concept-article
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender Antivirus
ai-usage: ai-assisted

#customer intent: As a security administrator, I want to understand how Microsoft Defender Antivirus exclusions work so that I can define them safely and sparingly.
---

# Exclusions in Microsoft Defender Antivirus

Exclusions tell Microsoft Defender Antivirus to skip specific files, folders, or processes when it scans. Every exclusion is a protection gap that lowers your defenses, so use exclusions sparingly. Define an exclusion only to resolve a specific problem, such as a performance or app compatibility issue, and consider alternatives like [custom indicators](indicators-overview.md) first. Don't exclude something just because you think it might be a problem later. For more items you should never exclude, see [Exclusions to avoid in Microsoft Defender Antivirus and Defender for Endpoint](defender-endpoint-exclusions-common-mistakes.md). For more information about the tradeoffs, see [Overview of exclusions and indicators in Microsoft Defender for Endpoint](defender-endpoint-exclusions-overview.md).

Microsoft Defender Antivirus supports the following types of exclusions:

- **Built-in exclusions**: Predefined exclusions for operating system files that Microsoft Defender Antivirus applies automatically, with no configuration on your part. For more information, see [Built-in exclusions](#built-in-exclusions).
- **Custom exclusions**: Exclusions that you define yourself:
  - **File and folder exclusions**: Exclude a specific file or everything in a folder. Also known as _path exclusions_.
  - **File extension exclusions**: Exclude any file that has a specific extension, regardless of location.
  - **Process exclusions**: Exclude all files that a specific process opens.
  - **Contextual exclusions**: Narrow a path exclusion so that it applies only in a specific context, such as only when a specific process opens the file.

To configure any of the custom exclusion types, see [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md).

## Important points about exclusions

Keep the following points in mind when you define exclusions:

- Exclusions can directly affect whether Microsoft Defender Antivirus blocks, remediates, or inspects events for the excluded files, folders, or processes. They also affect features that depend on the antivirus engine, such as malware protection, [file Indicators of Compromise (IOCs)](indicator-file.md), and [certificate IOCs](indicator-certificates.md). Process exclusions on any platform also prevent [network protection](network-protection.md) and [attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md) from inspecting traffic or enforcing rules for the excluded processes.

- Even with exclusions configured, Microsoft Defender Antivirus performs a minimal evaluation to determine whether an exclusion applies. This evaluation doesn't involve a full content scan. When the exclusion criteria are met, Microsoft Defender Antivirus skips the scan for the specified file, folder, or process.

- On Windows Server, Microsoft Defender Antivirus also applies predefined automatic exclusions for installed server roles and built-in exclusions for operating system files. These predefined exclusions are separate from the custom exclusions that you define. For more information, see [Microsoft Defender Antivirus exclusions on Windows Server](microsoft-defender-antivirus-exclusions-windows-server.md).

- Exclusions apply to [scheduled scans](schedule-antivirus-scans.md), [on-demand scans](run-scan-microsoft-defender-antivirus.md), [real-time protection](configure-real-time-protection-microsoft-defender-antivirus.md), and [potentially unwanted app (PUA) detections](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md), but not to all Defender for Endpoint capabilities. To exclude files for all of Defender for Endpoint, use [custom indicators](indicators-overview.md).

- Microsoft Defender Antivirus exclusions apply to some [ASR rules](attack-surface-reduction-rules-overview.md). For more information, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

- Files that you exclude can still trigger Endpoint Detection and Response (EDR) alerts, and they can still generate antivirus behavioral or heuristic detections in the Microsoft Defender portal. To exclude files more broadly, add them to Microsoft Defender for Endpoint [custom indicators](indicators-overview.md).

- Don't exclude mapped network drives. Specify the actual network path instead.

- Wildcards (for example, `*`) change how exclusion rules are interpreted. For more information, see [Wildcards in Microsoft Defender Antivirus exclusions](#wildcards-in-microsoft-defender-antivirus-exclusions).

- By default, local changes to exclusions by administrators (including changes made with PowerShell and Windows Management Instrumentation, or WMI) are merged with exclusions deployed by Group Policy, Configuration Manager, or Microsoft Intune. Exclusions deployed by Group Policy take precedence when there's a conflict, and they're visible in the [Windows Security app](microsoft-defender-security-center-antivirus.md). To let local changes override managed settings, see [Configure how locally and globally defined exclusion lists are merged](configure-local-policy-overrides-microsoft-defender-antivirus.md#merge-lists).

- Periodically review and audit your exclusions. Recheck and re-enforce mitigations as part of your review, and preserve the context for why each exclusion was required.

## Built-in exclusions

Microsoft Defender Antivirus includes built-in exclusions for operating system files on all supported client and server versions of Windows. These exclusions are delivered and kept up to date through [security intelligence updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates) as the threat landscape changes, so they apply without any manual configuration. They don't appear in the standard exclusion lists in the [Windows Security app](microsoft-defender-security-center-antivirus.md).

> [!TIP]
> The default locations described in this article might be different from the locations on your devices.

- **Windows temp.edb files**:
  - `%windir%\SoftwareDistribution\Datastore\*\tmp.edb`
  - `%ProgramData%\Microsoft\Search\Data\Applications\Windows\windows.edb`

- **Windows Update files or Automatic Update files**:
  - `%windir%\SoftwareDistribution\Datastore\Datastore.edb`
  - `%windir%\SoftwareDistribution\Datastore\*\edb.chk`
  - `%windir%\SoftwareDistribution\Datastore\*\edb\*.log`
  - `%windir%\SoftwareDistribution\Datastore\*\Edb\*.jrs`
  - `%windir%\SoftwareDistribution\Datastore\*\Res\*.log`

- **Windows Security files**:
  - `%windir%\Security\database\*.chk`
  - `%windir%\Security\database\*.edb`
  - `%windir%\Security\database\*.jrs`
  - `%windir%\Security\database\*.log`
  - `%windir%\Security\database\*.sdb`

- **Group Policy files**:
  - `%allusersprofile%\NTUser.pol`
  - `%SystemRoot%\System32\GroupPolicy\Machine\registry.pol`
  - `%SystemRoot%\System32\GroupPolicy\User\registry.pol`

On supported versions of Windows Server, Microsoft Defender Antivirus applies more built-in exclusions for server features (such as Windows Internet Name Service and File Replication Service) and automatic exclusions for installed server roles. For more information, see [Microsoft Defender Antivirus exclusions on Windows Server](microsoft-defender-antivirus-exclusions-windows-server.md).

## File and folder exclusions

File and folder exclusions are available for individual files and entire folders, which are stored together in a single path exclusion list. A file and folder exclusion always applies to a specific location (path). To exclude all files that have a specific extension regardless of location, use a separate [file extension exclusion](#file-extension-exclusions) instead.

- **Files**: The following types of exclusions are available:
  - An individual file specified by its fully qualified path, such as `c:\sample\sample.test`. Only that file in that location is excluded.
  - An executable program file specified by its fully qualified path, such as `c:\test\process.exe`. Excluding an executable file stops Microsoft Defender Antivirus from scanning the file itself, not files that the program opens. To skip the files that a process opens, use a [process exclusion](#process-exclusions) instead.

  > [!NOTE]
  > A file name only value like `sample.test` doesn't reliably exclude the file. Specify the file's full path instead. [Wildcards](#wildcards-in-file-and-folder-exclusions) substitute a single folder each, so `c:\*\sample.test` matches the file only in folders one level below `c:\`, not at the root or in more deeply nested folders.

- **Folders**: Exclude everything under a folder, such as all files and subfolders under `c:\test\sample`. The following conditions apply:
  - The exclusion covers every file and subfolder in the folder, except [reparse point](/windows/win32/fileio/reparse-points) subfolders. Add a separate folder exclusion entry for each reparse point subfolder you want to exclude.
  - A reparse point folder created after the Microsoft Defender Antivirus service starts isn't recognized as a valid exclusion target until you restart Windows.

## File extension exclusions

File extension exclusions are stored in a separate extension exclusion list, distinct from file and folder exclusions. A value like `test` is treated as an extension only because it's in the extension list, not in the file and folder path list.

- An extension exclusion, such as `.test` (the leading dot is optional), applies to any file with that extension, anywhere on the device.
- To restrict an extension to a specific location, use a [file and folder exclusion](#file-and-folder-exclusions) with a wildcard instead, such as `c:\example\*.test`.

## Process exclusions

A process exclusion tells Microsoft Defender Antivirus to skip the files that the process opens. Exclusions for files opened by excluded processes apply to scheduled scans and [always-on real-time protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md).

To exclude the process's executable file itself, add a separate [file and folder exclusion](#file-and-folder-exclusions) for it.

Use the following methods to exclude a process:

- **Image name exclusions**: The file name of the process without a path, such as `MyProcess.exe`. Excludes files opened by any process with that name, no matter where it runs from, including removable media.
- **Full path exclusions**: The file name and path of the process, such as `C:\MyFolder\MyProcess.exe`. Excludes files opened by that specific process only. Whenever possible, use the full path.

Here are some process exclusion examples:

- `test.exe` excludes any file opened by any process with that name, which includes files opened by the following processes:
  - `c:\sample\test.exe`
  - `d:\internal\files\test.exe`
- `c:\test\test.exe` excludes any files opened by that process only.
- `c:\test\sample\*` excludes any file opened by any process under that specific folder path. For example:
  - `c:\test\sample\test.exe`
  - `c:\test\sample\test2.exe`
  - `c:\test\sample\utility.exe`

## Contextual exclusions

A contextual exclusion narrows a [file and folder exclusion](#file-and-folder-exclusions) so that Microsoft Defender Antivirus skips the file or folder only in a specific context. For example, you can exclude a file only when a specific process or type of scan opens it. Because every exclusion improves performance but reduces protection, contextual restrictions limit that tradeoff by controlling _when_ an exclusion applies.

Contextual file and folder exclusions require Microsoft Defender Antivirus as the primary antivirus app on Windows devices:

- Platform version: **4.18.2205.7** (May 2022) or later.
- Engine version: **1.1.19300.2** (May 2022) or later.

Contextual file and folder exclusions are a Windows-only feature. They aren't available on Linux or macOS devices, even those onboarded to Microsoft Defender for Endpoint.

You create a contextual exclusion by adding contextual restrictions to a standard [file and folder exclusion](#file-and-folder-exclusions), then apply it the same way as any other exclusion. For the configuration methods, see [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md).

> [!NOTE]
> The [Windows Security app](https://support.microsoft.com/Windows/Security/Windows-Security/stay-protected-with-the-windows-security-app) doesn't support contextual exclusions.

Contextual file and folder exclusions use the following syntax:

`<RegularFileOrFolderExclusion>\:{ContextualRestrictionKeyword1:value1,ContextualRestrictionKeyword2:value2,...ContextualRestrictionKeywordN:valueN}`

The `<RegularFileOrFolderExclusion>` portion is a standard [file or folder exclusion](#file-and-folder-exclusions), so it supports the same wildcards (`*`, `?`, and environment variables) and follows the same path-matching rules. For details, see [Wildcards in file and folder exclusions](#wildcards-in-file-and-folder-exclusions). In contextual exclusions, a backslash (`\`) is always required immediately before the colon (`:`) that separates the path and the `{}` restrictions, as in `...\:{...}`.

You add the contextual restrictions in the `{}` portion. Each contextual restriction has a keyword and a value as shown in the following table:

|Contextual restriction type|Keyword|Value|
|---|---|---|
|File and folder restriction|`PathType`|`file` <br/><br/> `folder`|
|Scan type restriction|`ScanType`|`quick` <br/><br/> `full`|
|Scan trigger restriction|`ScanTrigger`|`OnDemand` <br/><br/> `OnAccess` <br/><br/> `BM` (Behavior monitoring)|
|Process restriction|`Process`|`<path>`|

> [!IMPORTANT]
> The contextual keyword restrictions (such as `PathType`) and their values (such as `file`, `OnAccess`, and `BM`) are case sensitive, as shown in the table and in upcoming examples. The file, folder, and process paths follow normal Windows path rules and aren't case sensitive.

<!--- NOTE: The case-insensitivity of file, folder, and process paths is inferred from standard Windows path rules. The contextual exclusions documentation states only that keyword restrictions and values are case sensitive; it doesn't document path case behavior. --->

> [!NOTE]
> Multiple `ScanType`, `ScanTrigger`, or `PathType` keyword-value pairs in the same contextual exclusion use AND logic. For example, `{ScanTrigger:OnAccess,ScanTrigger:OnDemand}` can never be true and the exclusion never applies because a single scan event has only one scan trigger. To exclude multiple `ScanType`, `ScanTrigger`, or `PathType` values, create multiple contextual exclusions.
>
> Multiple `Process` keyword-value pairs in the same contextual exclusion use OR logic, so you can exclude multiple `Process` values in one exclusion. For more information, see [Process contextual restrictions](#process-contextual-restrictions).
>
> You can combine different keyword types in one contextual exclusion as shown in the following subsections.
>
> Contextual exclusions aren't a reliable way to address false positives (legitimate files or processes incorrectly detected as malicious). If you encounter a false positive, you can submit the file to Microsoft for analysis at [Microsoft Security Intelligence](https://www.microsoft.com/wdsi/filesubmission). With Microsoft Defender for Endpoint Plan 2 or Microsoft Defender XDR, you can instead [submit files from the Microsoft Defender portal](admin-submissions-mde.md). If you have Microsoft Defender for Endpoint, you can also create a custom _allow_ indicator as a temporary suppression method. For more information, see [Create indicators for files](indicator-file.md).

### File or folder path contextual restrictions

Use the `PathType` contextual restriction keyword to identify the exclusion as a file only or a folder only.

- Use `PathType:folder` to apply the exclusion only when the excluded item is a folder, not a file. For example:

  `C:\documents\*\:{PathType:folder}`

- Use `PathType:file` to apply the exclusion only when the excluded item is a file, not a folder. For example:

  `C:\documents\*.mdb\:{PathType:file}`

- If the `PathType` restriction doesn't match the excluded item type, the exclusion doesn't apply:
  - The contextual restriction identifies the exclusion as a folder, but the scanned item is a file.
  - The contextual restriction identifies the exclusion as a file, but the scanned item is a folder.

- This example excludes `.docx` files inside any first-level folder of the C: drive from on-demand scans:

  `c:\*\*.docx\:{PathType:file,ScanTrigger:OnDemand}`

  If you don't include `PathType:file` in the exclusion, any _folders_ whose names end with `.docx` in those same first-level folders are also excluded from on-demand scans.

### Scan type contextual restrictions

Use the `ScanType` contextual restriction keyword to apply the exclusion only during a specific scan type:

- **Quick scans** (`quick`): Common startup locations used by malware, memory, and certain registry keys.
- **Full scans** (`full`): Quick scan locations plus the complete file system (all files and folders).

For more information about each scan type, see [Comparing the quick scan, full scan, and custom scan](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan).

This example excludes the specified folder only during a full scan:

`C:\documents\:{ScanType:full}`

This example excludes the specified file only during a quick scan:

`C:\program.exe\:{ScanType:quick}`

To make sure the exclusion applies only to files, not folders (`c:\program.exe` could be a folder), also use the `PathType` contextual restriction as shown in the following example:

`C:\program.exe\:{ScanType:quick,PathType:file}`

### Scan trigger contextual restrictions

Use the `ScanTrigger` contextual restriction keyword to apply the exclusion only when a scan is initiated by a specific event:

- `OnDemand`: A scan triggered by a command or administrator action. Scheduled quick and full scans also fall under this category. For more information, see [Run and customize on-demand scans in Microsoft Defender Antivirus](run-scan-microsoft-defender-antivirus.md).
- `OnAccess`: A file or folder is opened, written, read, or modified (typically considered [real-time protection](configure-real-time-protection-microsoft-defender-antivirus.md)).
- `BM`: A behavioral trigger causes [behavior monitoring](behavior-monitor.md) to scan a specific file.

This example excludes the specified folder only when it's scanned after being accessed:

`c:\documents\:{ScanTrigger:OnAccess}`

This example excludes the specified file (not a folder) only when it's scanned by a command or administrator action:

`c:\documents\design.docx\:{PathType:file,ScanTrigger:OnDemand}`

### Process contextual restrictions

Use the `Process` contextual restriction keyword to apply the exclusion only when a specific process accesses the file or folder.

- Avoid excluding the process itself, because excluding the process causes Microsoft Defender Antivirus to ignore all other operations by that process.
- [Wildcards](#wildcards-in-process-exclusions) are supported in the process name and path.
- You can list multiple processes in a single contextual exclusion using the following syntax:

  `<RegularFileOrFolderExclusion>\:{Process1:value1,Process2:value2,...ProcessN:valueN}`

  Unlike other contextual restriction types, multiple `Process` restrictions are matched with OR logic: the exclusion applies if any of the listed processes accesses the file or folder.

- Using many process restrictions on a device can degrade performance.
- If an exclusion is restricted to a specific process, other active processes (such as indexing, backup, or updates) can still trigger file scans.

This example excludes the specified file only when the specified process accesses it:

`c:\documents\design.docx\:{Process:"winword.exe"}`

This example excludes the specified file (not a folder) only when the specified processes access it:

`c:\documents\design.docx\:{PathType:file,Process:"winword.exe",Process:"msaccess.exe",Process:"C:\Program Files*\Microsoft Office\root\Office??\winword.exe"}`

<a id="wildcards"></a>
<a id="use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists"></a>

## Wildcards in Microsoft Defender Antivirus exclusions

You can use the asterisk `*`, question mark `?`, or environment variables as wildcards in file, folder, and process exclusions. You can mix and match `*`, `?`, and environment variables in a single exclusion.

How Microsoft Defender Antivirus interprets wildcards differs from their usual use in other apps and languages:

- The Microsoft Defender Antivirus service runs in the system context using the LocalSystem account. The service gets information from **system** environment variables, not **user** environment variables. Use only the following types of environment variables as wildcards:
  - [System environment variables](#system-environment-variables).
  - Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.
- You can use a maximum of six wildcards per entry.
- You can't use a wildcard in place of a drive letter.

### Wildcards in file and folder exclusions

Wildcard behavior for file and folder exclusions is described in the following list. Because these are exclusion entries, _excludes_ means the entry matches and skips the listed item.

- **`*` (asterisk)**:
  - **In a file name or extension**: Matches any number of characters, but applies only to files in the last folder named in the entry (not subfolders). For example, `C:\MyData\*.txt` excludes `C:\MyData\notes.txt`.
  - **In a folder path**: Matches a single folder. Use multiple `\*\` instances for nested, unnamed folders. After the named and wildcard folders match, all subfolders are also covered. For example:
    - `C:\somepath\*\Data` excludes any file in `C:\somepath\Archives\Data` and its subfolders, and in `C:\somepath\Authorized\Data` and its subfolders.
    - `C:\Serv\*\*\Backup` excludes any file in `C:\Serv\Primary\Denied\Backup` and its subfolders, and in `C:\Serv\Secondary\Allowed\Backup` and its subfolders.
- **`?` (question mark)**:
  - **In a file name or extension**: Matches a single character, but applies only to files in the last folder named in the entry (not subfolders). For example, `C:\MyData\my?.zip` excludes `C:\MyData\my1.zip`.
  - **In a folder path**: Matches a single character in a folder name. After the named and wildcard folders match, all subfolders are also covered. For example, `C:\somepath\?\Data` excludes any file in `C:\somepath\P\Data` and its subfolders, and `C:\somepath\test0?\Data` excludes any file in `C:\somepath\test01\Data` and its subfolders.
- **Environment variables**: Expanded to a path when the exclusion is evaluated. For example, `%ALLUSERSPROFILE%\CustomLogFiles` excludes `C:\ProgramData\CustomLogFiles\Folder1\file1.txt`.
- **Mix and match**: Combine environment variables, `*`, and `?` in a single entry. For example, `%PROGRAMFILES%\Contoso*\v?\bin\contoso.exe` excludes `C:\Program Files\Contoso Labs\v1\bin\contoso.exe`.

> [!IMPORTANT]
> If you mix a file exclusion with a folder exclusion, the rules stop at the file exclusion match in the matched folder, and don't look for file matches in subfolders.
>
> For example, `c:\data\*\marked\date*` excludes all files that start with "date" in the folders `c:\data\final\marked` and `c:\data\review\marked`, but not in subfolders of those folders.

### Wildcards in process exclusions

Wildcards are available in [process exclusions](#process-exclusions), but their usability is slightly different:

- **Image name exclusions**: Wildcards aren't allowed.
- **Full path exclusions**: Wildcards are supported and follow the same rules as [wildcards in file and folder exclusions](#wildcards-in-file-and-folder-exclusions).

Wildcard behavior for full path process exclusions is described in the following list. Because these are exclusion entries, _excludes_ means the entry matches and skips files opened by the listed process.

- **`*` (asterisk)**: Matches any number of characters. For example:
  - `C:\MyFolder\*` excludes any file opened by `C:\MyFolder\MyProcess.exe` or `C:\MyFolder\AnotherProcess.exe`.
  - `C:\*\*\MyProcess.exe` excludes any file opened by `C:\MyFolder1\MyFolder2\MyProcess.exe` or `C:\MyFolder3\MyFolder4\MyProcess.exe`.
  - `C:\*\MyFolder\My*.exe` excludes any file opened by `C:\MyOtherFolder\MyFolder\MyProcess.exe` or `C:\AnotherFolder\MyFolder\MyOtherProcess.exe`.
- **`?` (question mark)**: Matches a single character. For example, `C:\MyFolder\MyProcess??.exe` excludes any file opened by `C:\MyFolder\MyProcess42.exe`, `C:\MyFolder\MyProcessAA.exe`, or `C:\MyFolder\MyProcessF5.exe`.
- **Environment variables**: Expanded to a path when the exclusion is evaluated. For example, `%ALLUSERSPROFILE%\MyFolder\MyProcess.exe` excludes any file opened by `C:\ProgramData\MyFolder\MyProcess.exe`.

### System environment variables

Because the Microsoft Defender Antivirus service runs as the LocalSystem account, an environment variable in an exclusion resolves to its **system** account location, which is often different from the **user** account location you might expect. The following table lists the most commonly used system environment variables and the default locations they resolve to. The **Same as user location?** column indicates whether the variable points to the same path in a normal user context (**No** means it resolves somewhere different under LocalSystem). For general information about Windows environment variables, see [Recognized environment variables](/windows/deployment/usmt/usmt-recognized-environment-variables).

|System variable|Resolves to|Same as<br/>user location?|Examples|
|---|---|:---:|---|
|`%ALLUSERSPROFILE%`|`C:\ProgramData`|Yes|`%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs` <br/><br/> `%ALLUSERSPROFILE%\Microsoft\Windows\DeviceMetadataStore` <br/><br/> `%ALLUSERSPROFILE%\Microsoft\Windows\Templates`|
|`%APPDATA%`|`C:\Windows\System32\config\systemprofile\AppData\Roaming`|No|`%APPDATA%\Microsoft\Windows\Start Menu` <br/><br/> `%APPDATA%\Microsoft\Windows\Start Menu\Programs`|
|`%CommonProgramFiles%`|`C:\Program Files\Common Files`|Yes||
|`%CommonProgramFiles(x86)%`|`C:\Program Files (x86)\Common Files`|Yes||
|`%LOCALAPPDATA%`|`C:\Windows\System32\config\systemprofile\AppData\Local`|No|`%LOCALAPPDATA%\Microsoft\Windows\History`|
|`%ProgramData%`|`C:\ProgramData`|Yes||
|`%ProgramFiles%`|`C:\Program Files`|Yes|`%ProgramFiles%\Common Files`|
|`%ProgramFiles(x86)%`|`C:\Program Files (x86)`|Yes|`%ProgramFiles(x86)%\Common Files`|
|`%PUBLIC%`|`C:\Users\Public`|Yes|`%PUBLIC%\Desktop` <br/><br/> `%PUBLIC%\Documents` <br/><br/> `%PUBLIC%\Pictures`|
|`%SystemDrive%`|`C:`|Yes|`%SystemDrive%\Program Files` <br/><br/> `%SystemDrive%\Program Files (x86)` <br/><br/> `%SystemDrive%\Users`|
|`%SystemRoot%`|`C:\Windows`|Yes||
|`%TEMP%`|`C:\Windows\TEMP`|No||
|`%TMP%`|`C:\Windows\TEMP`|No||
|`%USERPROFILE%`|`C:\Windows\System32\config\systemprofile`|No|`%USERPROFILE%\AppData\Local` <br/><br/> `%USERPROFILE%\AppData\LocalLow` <br/><br/> `%USERPROFILE%\AppData\Roaming`|
|`%windir%`|`C:\Windows`|Yes|`%windir%\Fonts` <br/><br/> `%windir%\System32` <br/><br/> `%windir%\Resources`|

## See also

- [Exclusions to avoid in Microsoft Defender Antivirus and Defender for Endpoint](defender-endpoint-exclusions-common-mistakes.md)
- [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md)
- [Microsoft Defender Antivirus exclusions on Windows Server](microsoft-defender-antivirus-exclusions-windows-server.md)
