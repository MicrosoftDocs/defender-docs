---
title: Configure and validate exclusions based on extension, name, or location
description: Exclude files from Microsoft Defender Antivirus scans based on their file extension, file name, or location.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.date: 02/20/2026
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.custom: nextgen
ms.reviewer: thdoucet
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

# Configure and validate exclusions based on file extension and folder location

You can define exclusions for Microsoft Defender Antivirus that apply to [scheduled scans](schedule-antivirus-scans.md), [on-demand scans](run-scan-microsoft-defender-antivirus.md), and [always-on, real-time protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md). **Generally, you don't need to apply exclusions**. If you need to apply exclusions, then you can choose from the following types:

- Exclusions based on file extensions and folder locations as described in this article.
- [Exclusions for files opened by processes](configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)

> [!IMPORTANT]
>
> - Microsoft Defender Antivirus exclusions apply to some Microsoft Defender for Endpoint capabilities (for example, [attack surface reduction (ASR) rules](attack-surface-reduction.md)). Some Microsoft Defender Antivirus exclusions apply to some ASR rules. For more information, see [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md).
> - Excluded files can still trigger Endpoint Detection and Response (EDR) alerts and other detections. To exclude files broadly, add them to Microsoft Defender for Endpoint [custom indicators](indicators-overview.md).
> - Microsoft Defender Antivirus gets information from **system** environment variables, not **user** environment variables. Therefore, environment variables like `%USERPROFILE%` are likely interpreted differently than you expect. For more information, see the [System environment variables](#system-environment-variables) section in this article.

## Prerequisites

### Supported operating systems

- Windows

## Before you begin

See [Recommendations for defining exclusions](configure-exclusions-microsoft-defender-antivirus.md) before defining your exclusion lists.

## Exclusion lists

To exclude certain files from Microsoft Defender Antivirus scans, modify your exclusion lists. Microsoft Defender Antivirus includes many automatic exclusions based on known operating system behaviors and typical management files. For example:

- Files used in enterprise management.
- Files used in database management.
- Files used in other enterprise scenarios.

> [!NOTE]
> Exclusions apply to [potentially unwanted apps (PUA) detections](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md) as well.
> Automatic exclusions apply only to Windows Server 2016 and later. These exclusions aren't visible in the Windows Security app and in PowerShell.

The following table lists some examples of exclusions based on file extension and folder location.

|Exclusion|Examples|Exclusion list|
|---|---|---|
|Any file with a specific extension|All files with the specified extension, anywhere on the machine. <br/><br/> Valid syntax: `.test` and `test`|Extension exclusions|
|Any file or folder under a specific folder|All files and folders under the `c:\test\sample` folder|File and folder exclusions|
|A specific file in a specific folder|The file `c:\sample\sample.test` only|File and folder exclusions|
|A specific process|The executable file `c:\test\process.exe`|File and folder exclusions|

## Characteristics of exclusion lists

- Folder exclusions apply to all files and folders in that folder, unless the subfolder is a reparse point. You need to exclude reparse point subfolders separately.
- File extensions exclusions apply to any file with that extension if a path or folder isn't also specified.

## Important notes about exclusions based on file extensions and folder locations

- Wildcards (for example, `*`) alter how exclusion rules are interpreted. for important information about how wildcards work, see the [Use wildcards in the file name and folder path or extension exclusion lists](#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists) section in this article.

- Don't exclude mapped network drives. Specify the actual network path.

- Reparse point folders are created after the Microsoft Defender Antivirus service starts. Restart Windows for new reparse points to be recognized as valid exclusion targets.

- Exclusions apply to [scheduled scans](schedule-antivirus-scans.md), [on-demand scans](run-scan-microsoft-defender-antivirus.md), and [real-time protection](configure-real-time-protection-microsoft-defender-antivirus.md), but not across all Defender for Endpoint capabilities. To define exclusions across Defender for Endpoint, use [custom indicators](indicators-overview.md).

- By default, local changes to exclusions by admins (including changes made with PowerShell and Windows Management Instrumentation or WMI) are merged with exclusions deployed by Group Policy, Configuration Manager, or Microsoft Intune. Exclusions by Group Policy take precedence when there are conflicts. Exclusion changes made with Group Policy are visible in the [Windows Security app](microsoft-defender-security-center-antivirus.md).

  To allow local changes to override managed deployment settings, see [Configure how locally and globally defined exclusions lists are merged](configure-local-policy-overrides-microsoft-defender-antivirus.md#merge-lists).

## Configure the list of exclusions based on folder name or file extension

You can use the following methods to define exclusions for Microsoft Defender Antivirus.

### Use Intune to configure file name, folder, or file extension exclusions

For more information, see the following article:

- [Create a Microsoft Defender Antivirus exclusions policy in Microsoft Intune](configure-exclusions-microsoft-defender-antivirus.md#create-microsoft-defender-antivirus-exclusion-policies-in-intune)

### Use Configuration Manager to configure file name, folder, or file extension exclusions

For more information, see [How to create and deploy antimalware policies: Exclusion settings](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies#exclusion-settings).

### Use Group Policy to configure folder or file extension exclusions

> [!NOTE]
> If the exclusion specifies a fully qualified path to a file, then only that file in that location is excluded. If the exclusion specifies a folder, then all files and subfolders in that folder are excluded.

1. On your Group Policy management computer, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11)), right-click the Group Policy Object you want to configure, and then select **Edit**.

1. In the **Group Policy Management Editor** go to **Computer configuration**, and select **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Exclusions**.

1. Open the **Path Exclusions** setting for editing, and add your exclusions.

    1. Set the option to **Enabled**.

    1. Under the **Options** section, select **Show**.

    1. Specify each folder on its own line under the **Value name** column.

    1. If you're specifying a file, ensure that you enter a fully qualified path to the file, including the drive letter, folder path, file name, and extension.

    1. Enter **0** in the **Value** column.

    1. Choose **OK**.

    1. Open the **Extension Exclusions** setting for editing and add your exclusions.

    1. Set the option to **Enabled**.

    1. Under the **Options** section, select **Show**.

    1. Enter each file extension on its own line under the **Value name** column.

    1. Enter **0** in the **Value** column.
    1. Choose **OK**.

<a id="ps"></a>

### Use PowerShell cmdlets to configure file name, folder, or file extension exclusions

Use the following cmdlets in the [Defender module](/powershell/module/defender/) to manage exclusions:

- [Set-MpPreference](/powershell/module/defender/set-mppreference): Create or replace the list of exclusions.

  > [!IMPORTANT]
  > If you already created a list of exclusions using the **Set-MpPreference** or **Add-MpPreference** cmdlets, the next use of **Set-MpPreference** _overwrites_ the existing list of exclusions with the entries you specify.

- [Add-MpPreference](/powershell/module/defender/add-mppreference): Add entries to the existing list of exclusions.
- [Remove-MpPreference](/powershell/module/defender/add-mppreference): Remove entries from the existing list of exclusions.

Use the following parameters on those cmdlets:

- _ExclusionExtension_: Exclude files with the specified file extension. Use the following syntax: `"Extension1","Extension2"..."ExtensionN"`.
- _ExclusionPath_:
  - Exclude the specified file in the specified path.

    or

  - Exclude all files in the specified folder (including files in subfolders).

  Use the following syntax: `"Entry1","Entry2",..."EntryN"`.

This example excludes any file with the `.test` file extension from Microsoft Defender Antivirus scans:

```PowerShell
Add-MpPreference -ExclusionExtension ".test"
```

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md).

### Use Windows Management Instrumentation (WMI) to configure file name, folder, or file extension exclusions

Use the **Set**, **Add**, and **Remove** methods of the [MSFT_MpPreference class](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) for the following properties:

- `ExclusionExtension`
- `ExclusionPath`

The **Set**, **Add**, and **Remove** methods in the MSFT_MpPreference class are analogous to the **Set-MpPreference**, **Add-MpPreference**, and **Remove-MpPreference** cmdlets in the Defender module in PowerShell.

For more information, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

<a id="man-tools"></a>

### Use the Windows Security app to configure file name, folder, or file extension exclusions

For more information, see [Add exclusions in the Windows Security app](microsoft-defender-security-center-antivirus.md).

<a id="wildcards"></a>

## Use wildcards in the file name and folder path or extension exclusion lists

You can use the asterisk `*`, question mark `?`, or environment variables (for example, `%ALLUSERSPROFILE%`) as wildcards for file name or folder path exclusions. You can mix and match `*`, `?`, and environment variables in a single exclusion.

How Microsoft Defender Antivirus interprets wildcards is different from their usual usage in other apps and languages:

- The Microsoft Defender Antivirus service runs in the system context using the LocalSystem account. The service gets information from **system** environment variables, not **user** environment variables. Use only the following types of environment variables as wildcards:
  - System environment variables.
  - Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.
- You can use a maximum of six wildcards per entry.
- You can't use a wildcard in place of a drive letter.
- An asterisk `*` in a folder exclusion indicates a single folder. Use multiple instances of `\*\` to indicate multiple nested folders with unspecified names.

The following table describes how the wildcards can be used and provides some examples.

|Wildcard|Examples|
|---|---|
|`*` (asterisk) <br/><br/> **File name and file extension inclusions**: Replaces any number of characters, and only applies to files in the last folder defined in the entry. <br/><br/> **Folder exclusions**: Replaces a single folder. Use multiple `*` with folder slashes `\` to indicate multiple nested folders. After matching the number of wildcard folders and named folders, all subfolders are also included.|`C:\MyData\*.txt` includes `C:\MyData\notes.txt`. <br/><br/> `C:\somepath\*\Data` includes any file in `C:\somepath\Archives\Data` and its subfolders, and in `C:\somepath\Authorized\Data` and its subfolders. <br/><br/> `C:\Serv\*\*\Backup` includes any file in `C:\Serv\Primary\Denied\Backup` and its subfolders, and in `C:\Serv\Secondary\Allowed\Backup` and its subfolders.|
|`?` (question mark) <br/><br/> **File name and file extension inclusions**: Replaces a single character, and only applies to files in the last folder specified in the entry. <br/><br/> **Folder exclusions**: Replaces a single character in a folder name. After matching the number of wildcard folders and named folders, all subfolders are also included.|`C:\MyData\my?.zip` includes `C:\MyData\my1.zip`. <br/><br/> `C:\somepath\?\Data` includes any file in `C:\somepath\P\Data` and its subfolders. <br/><br/> `C:\somepath\test0?\Data` includes any file in `C:\somepath\test01\Data` and its subfolders.|
|Environment variables <br/><br/> The specified variable is populated as a path when the exclusion is evaluated.|`%ALLUSERSPROFILE%\CustomLogFiles` includes `C:\ProgramData\CustomLogFiles\Folder1\file1.txt`.|
|Mix and Match <br/><br/>You can combine environment variables, `*`, and `?` in a single exclusion entry.|`%PROGRAMFILES%\Contoso*\v?\bin\contoso.exe` include `C:\Program Files\Contoso Labs\v1\bin\contoso.exe`.|

> [!IMPORTANT]
> If you mix a file exclusion with a folder exclusion, the rules stop at the file exclusion match in the matched folder, and don't look for file matches in subfolders.
>
> For example, `c:\data\*\marked\date*` excludes all files that start with "date" in the folders `c:\data\final\marked` and `c:\data\review\marked`, but not in subfolders of those folders.

<a id="review"></a>

### System environment variables

The following table lists system account environment variables and their corresponding default locations. Some of these locations are different from the corresponding user account environment variables.

|System environment variable|Redirects to this location|
|---|---|
|`%APPDATA%`|`C:\Windows\system32\config\systemprofile\Appdata\Roaming`|
|`%APPDATA%\Microsoft\Internet Explorer\Quick Launch`|`C:\Windows\System32\config\systemprofile\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch`|
|`%APPDATA%\Microsoft\Windows\Start Menu`|`C:\Windows\System32\config\systemprofile\AppData\Roaming\Microsoft\Windows\Start Menu`|
|`%APPDATA%\Microsoft\Windows\Start Menu\Programs`|`C:\Windows\System32\config\systemprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs`|
|`%LOCALAPPDATA%`|`C:\WINDOWS\system32\config\systemprofile\AppData\Local`|
|`%ProgramData%`|`C:\ProgramData`|
|`%ProgramFiles%`|`C:\Program Files`|
|`%ProgramFiles%\Common Files`|`C:\Program Files\Common Files`|
|`%ProgramFiles%\Windows Sidebar\Gadgets`|`C:\Program Files\Windows Sidebar\Gadgets`|
|`%ProgramFiles%\Common Files`|`C:\Program Files\Common Files`|
|`%ProgramFiles(x86)%`|`C:\Program Files (x86)`|
|`%ProgramFiles(x86)%\Common Files`|`C:\Program Files (x86)\Common Files`|
|`%SystemDrive%`|`C:`|
|`%SystemDrive%\Program Files`|`C:\Program Files`|
|`%SystemDrive%\Program Files (x86)`|`C:\Program Files (x86)`|
|`%SystemDrive%\Users`|`C:\Users`|
|`%SystemDrive%\Users\Public`|`C:\Users\Public`|
|`%SystemRoot%`|`C:\Windows`|
|`%windir%`|`C:\Windows`|
|`%windir%\Fonts`|`C:\Windows\Fonts`|
|`%windir%\Resources`|`C:\Windows\Resources`|
|`%windir%\resources\0409`|`C:\Windows\resources\0409`|
|`%windir%\system32`|`C:\Windows\System32`|
|`%ALLUSERSPROFILE%`|`C:\ProgramData`|
|`%ALLUSERSPROFILE%\Application Data`|`C:\ProgramData\Application Data`|
|`%ALLUSERSPROFILE%\Documents`|`C:\ProgramData\Documents`|
|`%ALLUSERSPROFILE%\Documents\My Music\Sample Music`|`C:\ProgramData\Documents\My Music\Sample Music`|
|`%ALLUSERSPROFILE%\Documents\My Music`|`C:\ProgramData\Documents\My Music`|
|`%ALLUSERSPROFILE%\Documents\My Pictures`|`C:\ProgramData\Documents\My Pictures`|
|`%ALLUSERSPROFILE%\Documents\My Pictures\Sample Pictures`|`C:\ProgramData\Documents\My Pictures\Sample Pictures`|
|`%ALLUSERSPROFILE%\Documents\My Videos`|`C:\ProgramData\Documents\My Videos`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\DeviceMetadataStore`|`C:\ProgramData\Microsoft\Windows\DeviceMetadataStore`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\GameExplorer`|`C:\ProgramData\Microsoft\Windows\GameExplorer`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\Ringtones`|`C:\ProgramData\Microsoft\Windows\Ringtones`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu`|`C:\ProgramData\Microsoft\Windows\Start Menu`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs`|`C:\ProgramData\Microsoft\Windows\Start Menu\Programs`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Administrative Tools`|`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\StartUp`|`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`|
|`%ALLUSERSPROFILE%\Microsoft\Windows\Templates`|`C:\ProgramData\Microsoft\Windows\Templates`|
|`%ALLUSERSPROFILE%\Start Menu`|`C:\ProgramData\Start Menu`|
|`%ALLUSERSPROFILE%\Start Menu\Programs`| `C:\ProgramData\Start Menu\Programs`|
|`%ALLUSERSPROFILE%\Start Menu\Programs\Administrative Tools`|`C:\ProgramData\Start Menu\Programs\Administrative Tools`|
|`%ALLUSERSPROFILE%\Templates`|`C:\ProgramData\Templates`|
|`%LOCALAPPDATA%\Microsoft\Windows\ConnectedSearch\Templates`|`C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\ConnectedSearch\Templates`|
|`%LOCALAPPDATA%\Microsoft\Windows\History`|`C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\History`|
|`%PUBLIC%`|`C:\Users\Public`|
|`%PUBLIC%\AccountPictures`|`C:\Users\Public\AccountPictures`|
|`%PUBLIC%\Desktop`|`C:\Users\Public\Desktop`|
|`%PUBLIC%\Documents`|`C:\Users\Public\Documents`|
|`%PUBLIC%\Downloads`|`C:\Users\Public\Downloads`|
|`%PUBLIC%\Music\Sample Music`|`C:\Users\Public\Music\Sample Music`|
|`%PUBLIC%\Music\Sample Playlists`|`C:\Users\Public\Music\Sample Playlists`|
|`%PUBLIC%\Pictures\Sample Pictures`|`C:\Users\Public\Pictures\Sample Pictures`|
|`%PUBLIC%\RecordedTV.library-ms`|`C:\Users\Public\RecordedTV.library-ms`|
|`%PUBLIC%\Videos`|`C:\Users\Public\Videos`|
|`%PUBLIC%\Videos\Sample Videos`|`C:\Users\Public\Videos\Sample Videos`|
|`%USERPROFILE%`|`C:\Windows\system32\config\systemprofile`|
|`%USERPROFILE%\AppData\Local`|`C:\Windows\system32\config\systemprofile\AppData\Local`|
|`%USERPROFILE%\AppData\LocalLow`|`C:\Windows\system32\config\systemprofile\AppData\LocalLow`|
|`%USERPROFILE%\AppData\Roaming`|`C:\Windows\system32\config\systemprofile\AppData\Roaming`|

## Review the list of exclusions

You can retrieve the items in the exclusion list by using one of the following methods:

- [Microsoft Intune](/intune/intune-service/fundamentals/deployment-guide-intune-setup)
- [Microsoft Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies)
- [MpCmdRun](command-line-arguments-microsoft-defender-antivirus.md)
- [PowerShell](/powershell/module/defender)
- [Windows Security app](microsoft-defender-security-center-antivirus.md)

> [!IMPORTANT]
> Exclusion list changes you make with Group Policy **appear** in the lists of [Windows Security app](microsoft-defender-security-center-antivirus.md).
> Exclusion list changes you make in the Windows Security app **don't appear** in the Group Policy lists.

<a name='validate-the-exclusion-list-by-using-mpcmdrun'></a>

### Verify whether a specified path is excluded using MpCmdRun

You can use the [MpCmdRun.exe command-line tool](./command-line-arguments-microsoft-defender-antivirus.md) in Microsoft Defender Antivirus version 4.18.2111-5.0 or later (December 2021) to verify whether specific folder paths or file and folder paths are excluded from scanning by running the following commands in an elevated command prompt (a Command Prompt window you opened by selecting **Run as administrator**):

```dos
for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n') do if not defined _done cd "%ProgramData%\Microsoft\Windows Defender\Platform\%d"

MpCmdRun.exe -CheckExclusion -Path <PathAndFile or Path>
```

For example, the command `MpCmdRun.exe -CheckExclusion -Path C:\Data\Test` returns the following output:

- **Path excluded**:

  > C:\Data\Test [\Device\HarddiskVolume1\Data\Test] is excluded. Exit code is 0.

- **Path not excluded**:

  > C:\Data\Test [\Device\HarddiskVolume1\Data\Test] is not excluded. Exit code is 1.

<a name='review-the-list-of-exclusions-alongside-all-other-microsoft-defender-antivirus-preferences-by-using-powershell'></a>

<a name='retrieve-a-specific-exclusions-list-by-using-powershell'></a>

### Retrieve exclusions using PowerShell

Run the following commands in an elevated PowerShell window:

```PowerShell
(Get-MpPreference).ExclusionExtension

(Get-MpPreference).ExclusionPath
```

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/).

<a id="validate"></a>

## Validate exclusions lists with the EICAR test file

You can validate your exclusion lists are working by using PowerShell with the **Invoke-WebRequest** cmdlet or the .NET WebClient class to download a test file.

In the following PowerShell command, replace `test.txt` with a file that conforms to your exclusion rules. For example, if you're excluding the `.testing` extension, replace `test.txt` with `test.testing`. If you're testing a path, make sure that you run the cmdlet within that path.

```PowerShell
Invoke-WebRequest "https://secure.eicar.org/eicar.com.txt" -OutFile "test.txt"
```

If Microsoft Defender Antivirus reports malware, the rule isn't working. If there's no report of malware and the downloaded file exists, then the exclusion is working. You can open the file to confirm the contents are the same as what is described on the [EICAR test file website](https://www.eicar.org/download-anti-malware-testfile/).

You can also use the following PowerShell commands, which call the .NET WebClient class to download the test file. Replace `c:\test.txt` with a file that conforms to the rule you're validating:

```PowerShell
$client = new-object System.Net.WebClient

$client.DownloadFile("http://www.eicar.org/download/eicar.com.txt","c:\test.txt")
```

If you don't have internet access, you can create your own EICAR test file by writing the EICAR string to a new text file with the following PowerShell command:

```PowerShell
[io.file]::WriteAllText("test.txt",'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*')
```

You can also copy the string into a blank text file and try to save it with the file name or in the folder you're trying to exclude.

## See also

- [Configure and validate exclusions in Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md)
- [Configure and validate exclusions for files opened by processes](configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)
- [Configure Microsoft Defender Antivirus exclusions on Windows Server](configure-server-exclusions-microsoft-defender-antivirus.md)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)
