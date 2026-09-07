---
title: Configure custom exclusions for Microsoft Defender Antivirus
description: Learn how to exclude specific files, folders, and processes from Microsoft Defender Antivirus scans by using Intune, MDM, Group Policy, PowerShell, or WMI.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 08/12/2026
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: ksarens
ms.subservice: ngp
ms.audience: ITPro
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender Antivirus
ai-usage: ai-assisted

#customer intent: As a security administrator, I want to configure custom exclusions for Microsoft Defender Antivirus so that I can prevent specific files, folders, and processes from being scanned when necessary.
---

# Configure custom exclusions for Microsoft Defender Antivirus

You usually don't need to define exclusions for Microsoft Defender Antivirus. However, you can exclude specific files, folders, and all files opened by a specific process from Microsoft Defender Antivirus scans. These exclusions are known as _custom exclusions_, and they come in the following types:

- [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions)
- [Process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions)
- [Contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions)

This article describes how to configure custom exclusions for Microsoft Defender Antivirus on Windows.

Custom exclusions apply to [scheduled scans](schedule-antivirus-scans.md), [on-demand scans](run-scan-microsoft-defender-antivirus.md), and [always-on real-time protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md). Process exclusions are the exception: they apply only to real-time protection and monitoring, not to scheduled or on-demand scans.

Before you define exclusions, review [Exclusions in Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-overview.md) to understand the exclusion types, wildcards, and system environment variables.

For best results, use enterprise-level management solutions like Microsoft Intune or Microsoft Configuration Manager to manage exclusions. Exclusion settings from Intune or Configuration Manager overwrite any conflicting Group Policy or PowerShell settings on startup.

> [!TIP]
>
> - For a detailed overview of suppressions, submissions, and exclusions in Microsoft Defender Antivirus and Defender for Endpoint, see [Overview of exclusions and indicators in Microsoft Defender for Endpoint](defender-endpoint-exclusions-overview.md).
> - The following methods are available to protect exclusions configured on devices:
>   - [Tamper protection for antivirus exclusions](manage-tamper-protection-intune.md#tamper-protection-for-antivirus-exclusions).
>   - [HideExclusionsFromLocalAdmins](/windows/client-management/mdm/defender-csp#configurationhideexclusionsfromlocaladmins):
>     - Doesn't remove existing exclusions from the device.
>     - Exclusions aren't visible in [Get-MpPreference](/powershell/module/defender/get-mppreference) or Registry Editor.
>   - [HideExclusionsFromLocalUsers](/windows/client-management/mdm/defender-csp#configurationhideexclusionsfromlocalusers): Implicitly enabled if HideExclusionsFromLocalAdmins is enabled.

## Prerequisites

### Supported operating systems

- Windows

<a name='create-a-new-antivirus-policy-with-exclusions-in-intune'></a>

<a name='configure-and-validate-exclusions'></a>

<a name='configure-exclusions-in-microsoft-intune'></a>

## Configure Microsoft Defender Antivirus exclusions in Microsoft Intune

> [!IMPORTANT]
> The procedures in this section require Microsoft Intune. Intune is a separate product that isn't included in all subscriptions. If you don't have Intune, use one of the other methods in this article. For more information, see [Microsoft Intune licensing](/intune/intune-service/fundamentals/licenses).

Microsoft Intune is the recommended tool for configuring and distributing Microsoft Defender Antivirus exclusion policies to devices. Use the Microsoft Defender Antivirus exclusions profile to create or modify exclusion policies.

> [!NOTE]
> You can define antivirus exclusions in a dedicated **Microsoft Defender Antivirus exclusions** profile (described in this section) or directly in a **Microsoft Defender Antivirus** profile. The exclusion settings are identical in both, and Intune merges the exclusions from all assigned policies into a single superset on each device. Use a dedicated exclusions profile when you want to manage or target exclusions separately from your other antivirus settings. For more information, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy#policy-merge-for-settings).

### Configure Microsoft Defender Antivirus exclusions in Intune using endpoint security policies

To create a Microsoft Defender Antivirus exclusions policy in Intune, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When you create the policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus exclusions
- **Configuration settings**: Configure some or all of the following exclusion types:
  - **Excluded extensions**: Exclusions by file type extension. The exclusion applies to any files with that extension, regardless of location. For more information, see [File extension exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-extension-exclusions).
  - **Excluded paths**: Also known as _file and folder exclusions_. For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).

    Contextual exclusions are also available. For more information, see [Contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).

  - **Excluded processes**: Exclusions for files opened by specified processes. The processes themselves aren't excluded. To exclude the processes, use an **Excluded paths** exclusion. For more information, see [Process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions).

  Wildcards, including _system_ (not _user_) environment variables are supported in **Excluded paths** and **Excluded processes** values. For more information, see [Wildcards in Microsoft Defender Antivirus exclusions](microsoft-defender-antivirus-exclusions-overview.md#wildcards-in-microsoft-defender-antivirus-exclusions).

  To add exclusions, use either of the following methods:

  - Select **Add**, and then enter the value in the box that appears. Repeat as many times as necessary. To remove an exclusion or an empty box, select the check box next to the entry, and then select **Remove**.

  - Select **Import** to import a CSV file that contains the names of files and folders to exclude. The CSV file uses the following format (the example shows **Excluded extensions**):

    ```text
    ExcludedExtensions
    "extension1"
    "extension2"
    ...
    ```

    > [!TIP]
    > Double quotation marks around the values are optional, and are ignored (aren't used in the values) if you include them. Don't use single quotation marks around the values.

<a name='manage-antivirus-exclusions-in-intune-for-existing-policies'></a>

To change the exclusions in an existing policy later, select the policy on the **Endpoint security \| Antivirus** page in the Microsoft Intune admin center at <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/antivirus>, and then select **Edit** next to **Configuration settings** to add or remove exclusions. To save the current list of exclusions to a .csv file, select **Export**.

## Configure Microsoft Defender Antivirus exclusions in the Microsoft Defender portal

If your organization [manages endpoint security policies in the Microsoft Defender portal](endpoint-security-policies-configure.md), you can configure Microsoft Defender Antivirus exclusions with the same endpoint security policies that Intune uses.

On the **Windows** tab of the **Endpoint security policies** page of the Defender portal at <https://security.microsoft.com/policy-inventory>, select :::image type="icon" source="media/defender-portal-icon-create.png" border="false"::: **Create new policy** and then create an **Microsoft Defender Antivirus exclusions** policy. For the full procedure, see [Create an endpoint security policy](endpoint-security-policies-configure.md#create-an-endpoint-security-policy).

Use the same **Microsoft Defender Antivirus exclusions** profile and settings described in [Configure Microsoft Defender Antivirus exclusions in Intune using endpoint security policies](#configure-microsoft-defender-antivirus-exclusions-in-intune-using-endpoint-security-policies).

When you assign the policy, note that assignment group limitations apply to devices managed through security settings management. For details, see the [Assignments step](endpoint-security-policies-configure.md#create-an-endpoint-security-policy).

## Configure Microsoft Defender Antivirus exclusions in any MDM solution using the Policy CSP

The Policy configuration service provider (CSP) enables you to configure Microsoft Defender Antivirus exclusions on Windows devices using any mobile device management (MDM) solution, not just Microsoft Intune. For more information, see [Policy CSP](/windows/client-management/mdm/policy-configuration-service-provider).

Use the following CSP settings to configure exclusions. Separate each value in a list with a vertical bar (`|`).

- **Excluded extensions**: Use the [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions) CSP with the following settings:

  **OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/ExcludedExtensions`<br/>
  **Value**: `<Extension1>|<Extension2>|...<ExtensionN>`

  For example, `lib|obj`.

  For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).

- **Excluded paths**: Use the [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths) CSP with the following settings:

  **OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/ExcludedPaths`<br/>
  **Value**: `<FileOrFolderExclusion1>|<FileOrFolderExclusion2>|...<FileOrFolderExclusionN>`

  A value can be a specific file, an entire folder, or a path with wildcards. For example, in `C:\Example|C:\Example\sample.exe|C:\Example\*.test`:

  - The contents of the `C:\Example` folder are excluded.
  - The specific file `C:\Example\sample.exe` is excluded.
  - All `.test` files in `C:\Example` are excluded.

  For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).

  Wildcards, including _system_ (not _user_) environment variables are supported in **Excluded paths** values. For more information, see [Wildcards in Microsoft Defender Antivirus exclusions](microsoft-defender-antivirus-exclusions-overview.md#wildcards-in-microsoft-defender-antivirus-exclusions).

  A value can also be a contextual exclusion, such as `C:\Example\*.test\:{ScanTrigger:OnDemand}`, which excludes those files only during on-demand scans.

  For more information, see [Contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).

- **Excluded processes**: Use the [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses) CSP with the following settings:

  **OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/ExcludedProcesses`<br/>
  **Value**: `<Process1>|<Process2>|...<ProcessN>`

  For example, `C:\Example.exe|C:\Example1.exe` excludes any files opened by those processes. To exclude the files themselves, you need an **Excluded paths** entry for the process executable itself.

  For more information, see [Process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions).

  Wildcards, including _system_ (not _user_) environment variables are supported in **Excluded processes** values. For more information, see [Wildcards in Microsoft Defender Antivirus exclusions](microsoft-defender-antivirus-exclusions-overview.md#wildcards-in-microsoft-defender-antivirus-exclusions).

<!--- MOVED FROM configure-extension-file-exclusions + configure-process-opened: Configuration Manager --->

<a name='configure-exclusions-in-microsoft-configuration-manager'></a>

## Configure Microsoft Defender Antivirus exclusions in Microsoft Configuration Manager

To configure file extension, folder, and process exclusions in Microsoft Configuration Manager, see [How to create and deploy antimalware policies: Exclusion settings](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies#exclusion-settings).

<!--- MERGED FROM configure-extension-file-exclusions ("Use Group Policy to configure folder or file extension exclusions") + configure-process-opened ("Use Group Policy to exclude files that have been opened by specified processes") --->

<a name='configure-exclusions-in-group-policy'></a>

## Configure Microsoft Defender Antivirus exclusions in Group Policy

To configure exclusions by using Group Policy, follow these steps:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Exclusions**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

1. In the details pane of **Exclusions**, the available settings are:

   - [Extension Exclusions](#configure-file-extension-exclusions-in-group-policy)
   - [Path Exclusions](#configure-file-and-folder-exclusions-in-group-policy) (file and folder exclusions)
   - [Process Exclusions](#configure-process-exclusions-in-group-policy) (files opened by processes)

   To open and configure an exclusion setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Exclusions**.

> [!NOTE]
> Exclusion changes you make in Group Policy appear in the [Windows Security app exclusions](#configure-microsoft-defender-antivirus-exclusions-in-the-windows-security-app).

### Configure file and folder exclusions in Group Policy

Use the following steps to configure file and folder exclusions in Group Policy:

1. In the details pane of **Exclusions**, open the **Path Exclusions** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Path Exclusions**: Select **Show...**.

1. In the **Path Exclusions** dialog that opens, configure the following settings:
   - **Value name**: Enter each folder on its own line. If you're specifying a file, enter a fully qualified path to the file, including the drive letter, folder path, file name, and extension.
   - **Value**: Enter `0`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).

Wildcards, including _system_ (not _user_) environment variables are supported in **Path Exclusions** values. For more information, see [Wildcards in Microsoft Defender Antivirus exclusions](microsoft-defender-antivirus-exclusions-overview.md#wildcards-in-microsoft-defender-antivirus-exclusions).

Contextual exclusions are also available. For more information, see [Contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).

### Configure file extension exclusions in Group Policy

Use the following steps to configure file extension exclusions in the Group Policy **Exclusions** settings:

1. In the details pane of **Exclusions**, open the **Extension Exclusions** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Extension Exclusions**: Select **Show...**.

1. In the **Extension Exclusions** dialog that opens, configure the following settings:
   - **Value name**: Enter each file extension on its own line.
   - **Value**: Enter `0`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

For more information, see [File extension exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-extension-exclusions).

### Configure process exclusions in Group Policy

Use the following steps to configure process exclusions in the Group Policy **Exclusions** settings:

1. In the details pane of **Exclusions**, open the **Process Exclusions** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Process Exclusions**: Select **Show...**.

1. In the **Process Exclusions** dialog that opens, configure the following settings:
   - **Value name**: Enter each process on its own line.
   - **Value**: Enter `0`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

For more information, see [Process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions).

Wildcards, including _system_ (not _user_) environment variables are supported in **Process Exclusions** values. For more information, see [Wildcards in Microsoft Defender Antivirus exclusions](microsoft-defender-antivirus-exclusions-overview.md#wildcards-in-microsoft-defender-antivirus-exclusions).

<!--- MERGED FROM configure-extension-file-exclusions ("Use PowerShell cmdlets...") + configure-process-opened ("Use PowerShell cmdlets...") --->

<a name='configure-exclusions-in-powershell'></a>

<a name='review-the-list-of-exclusions'></a>

<a name='review-the-list-of-exclusions-alongside-all-other-microsoft-defender-antivirus-preferences-by-using-powershell'></a>

<a name='retrieve-a-specific-exclusions-list-by-using-powershell'></a>

<a name='retrieve-exclusions-using-powershell'></a>

## Configure Microsoft Defender Antivirus exclusions in PowerShell

On the target device, use the following PowerShell command syntax in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**). This syntax adds, sets, or removes one or more exclusions by specifying an exclusion parameter and its values:

```powershell
<Add-MpPreference | Set-MpPreference | Remove-MpPreference> [-ExclusionExtension "<Value1>","<Value2>",..."<ValueN>"] [-ExclusionPath "<Value1>","<Value2>",..."<ValueN>"] [-ExclusionProcess "<Value1>","<Value2>",..."<ValueN>"]
```

- **[Set-MpPreference](/powershell/module/defender/set-mppreference)** _overwrites_ any existing exclusions of the specified type with the values you specify. To display the exclusions currently configured on the device, run the following command:

  ```powershell
  $p = Get-MpPreference; 'ExclusionExtension','ExclusionPath','ExclusionProcess' | ForEach-Object { $t = $_; $p.$t | ForEach-Object {[pscustomobject]@{Type=$t; Value=$_}} } | Format-Table -AutoSize
  ```

  To add new exclusions without affecting any existing values, use the **[Add-MpPreference](/powershell/module/defender/add-mppreference)** cmdlet. To remove the specified exclusions without affecting other existing values, use the **[Remove-MpPreference](/powershell/module/defender/remove-mppreference)** cmdlet. The command syntax is identical for the three cmdlets.

- Use one or more of the following parameters to specify the type of exclusion:
  - _ExclusionExtension_: Exclusions by file type extension. The exclusion applies to any files with that extension, regardless of location. For more information, see [File extension exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-extension-exclusions).
  - _ExclusionPath_: Also known as _file and folder exclusions_. For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).

    Contextual exclusions are also available. For more information, see [Contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).

  - _ExclusionProcess_: Exclusions for files opened by specified processes. The processes themselves aren't excluded. To exclude the processes, use _ExclusionPath_. For more information, see [Process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions).

The following example adds the `.test` file extension to the exclusion list, so that Microsoft Defender Antivirus skips files with that extension during scans:

```powershell
Add-MpPreference -ExclusionExtension ".test"
```

The following example adds a process exclusion for `c:\internal\test.exe`, so that Microsoft Defender Antivirus skips scanning any file opened by that process:

```powershell
Add-MpPreference -ExclusionProcess "c:\internal\test.exe"
```

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md).

<!--- MERGED FROM configure-extension-file-exclusions ("Use WMI...") + configure-process-opened ("Use WMI...") --->

<a name='configure-exclusions-in-windows-management-instrumentation-wmi'></a>

## Configure Microsoft Defender Antivirus exclusions in WMI

Use Windows Management Instrumentation (WMI) to configure exclusions by calling the **Set**, **Add**, and **Remove** methods of the [MSFT_MpPreference class](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) for the following properties:

- `ExclusionExtension`: Exclusions by file type extension. The exclusion applies to any files with that extension, regardless of location. For more information, see [File extension exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-extension-exclusions).
- `ExclusionPath`: Also known as _file and folder exclusions_. For more information, see [File and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).

  Contextual exclusions are also available. For more information, see [Contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).

- `ExclusionProcess`: Exclusions for files opened by specified processes. The processes themselves aren't excluded. To exclude the processes, use _ExclusionPath_. For more information, see [Process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions).

The **Set**, **Add**, and **Remove** methods in the MSFT_MpPreference class are analogous to the **Set-MpPreference**, **Add-MpPreference**, and **Remove-MpPreference** cmdlets as described in [Configure Microsoft Defender Antivirus exclusions in PowerShell](#configure-microsoft-defender-antivirus-exclusions-in-powershell).

For more information, see [Use WMI to configure and manage Microsoft Defender Antivirus](use-wmi-microsoft-defender-antivirus.md) and [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

<!--- MOVED FROM configure-extension-file-exclusions + configure-process-opened: Windows Security app --->

<a name='configure-exclusions-in-the-windows-security-app'></a>

## Configure Microsoft Defender Antivirus exclusions in the Windows Security app

You can use the [Windows Security app](https://support.microsoft.com/Windows/Security/Windows-Security/stay-protected-with-the-windows-security-app) on individual devices to configure exclusions. This method is useful for testing or for configuring a single device. To configure exclusions on many devices, use one of the enterprise management methods described earlier in this article.

For instructions, see [Add exclusions in the Windows Security app](microsoft-defender-security-center-antivirus.md).

> [!NOTE]
> Exclusion changes you make in the Windows Security app don't appear in [Group Policy exclusions](#configure-microsoft-defender-antivirus-exclusions-in-group-policy).
>
> The Windows Security app doesn't support [contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).

<a name='validate-the-exclusion-list-by-using-mpcmdrun'></a>

<a name='verify-whether-a-specified-path-is-excluded-using-mpcmdrun'></a>

## Verify whether a file or folder is excluded by using MpCmdRun

You can use the [MpCmdRun.exe command-line tool](command-line-arguments-microsoft-defender-antivirus.md) in Microsoft Defender Antivirus version 4.18.2111-5.0 (December 2021) or later to verify whether a specific file or folder is excluded from scanning by running the following commands in an elevated command prompt (a Command Prompt window you opened by selecting **Run as administrator**):

> [!TIP]
> The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Windows Defender`.

```dos
(set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

MpCmdRun.exe -CheckExclusion -Path <PathAndFile or Path>
```

For example, the command `MpCmdRun.exe -CheckExclusion -Path C:\Data\Test` returns the following output:

- **Path excluded**:

  > C:\Data\Test [\Device\HarddiskVolume1\Data\Test] is excluded. Exit code is 0.

- **Path not excluded**:

  > C:\Data\Test [\Device\HarddiskVolume1\Data\Test] is not excluded. Exit code is 1.

> [!NOTE]
> An `is excluded` result doesn't necessarily mean the exact path you tested is in the exclusion list. A folder exclusion also applies to all subfolders and files within that folder. For example, if `C:\Data\Test` is excluded and you test `C:\Data\Test\Logs\app.log`, the result is `is excluded` because the file inherits the exclusion from the higher-level folder. The command reports only whether the path is excluded, not which exclusion entry matched it.

<!--- MOVED FROM configure-extension-file-exclusions-microsoft-defender-antivirus.md: "Validate exclusions lists with the EICAR test file" --->

<a name='validate-exclusions-lists-with-the-eicar-test-file'></a>

## Test Microsoft Defender Antivirus exclusions with the EICAR test file

The [EICAR test file](https://www.eicar.org/download-anti-malware-testfile/) is a small, harmless text file that contains a standard string recognized by all antivirus products as malware. It's an industry-standard way to safely confirm that antivirus protection is working, without using real malware. Microsoft Defender Antivirus detects the file by its content (the standard EICAR string), not by its filename.

Because Microsoft Defender Antivirus always detects the EICAR test file, you can use it to confirm that an exclusion is working by creating the file so that its name, extension, or location matches the exclusion you want to validate:

- In a specific folder with any file name or a specific file name (and possibly a specific extension) to validate [file and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions).
- Any file name with a specific extension in any location to validate [file extension exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-extension-exclusions).

If the file isn't detected, the exclusion works. If the file is detected, the exclusion doesn't work.

This method doesn't validate [process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions), which depend on the process that opens the file rather than the file itself.

Use any of the following methods to create an EICAR test file that matches your exclusion:

- **PowerShell**: Run the following commands in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):
  - **With internet access**: Use the following syntax:

    ```powershell
    Invoke-WebRequest "https://secure.eicar.org/eicar.com.txt" -OutFile "<FileNameOrFileNameAndPath>"
    ```

    For example, the device has an extension exclusion for `.test` files, so the file name and location don't matter:

    ```powershell
    Invoke-WebRequest "https://secure.eicar.org/eicar.com.txt" -OutFile "test.test"
    ```

  - **Without internet access**: Use the following syntax:

    ```powershell
    [io.file]::WriteAllText("<FileNameOrFileNameAndPath>",'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*')
    ```

    For example, the device has a file and folder exclusion for `c:\test`, so create the file in that folder with any file name or extension:

    ```powershell
    [io.file]::WriteAllText("c:\test\eicar.txt",'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*')
    ```

- **.NET WebClient class with internet access**: Use the following syntax:

  ```powershell
  $client = new-object System.Net.WebClient

  $client.DownloadFile("http://www.eicar.org/download/eicar.com.txt","<FileNameOrFileNameAndPath>")
  ```

  For example, the device has a file and folder exclusion for `c:\test\*\*.doc`, so download the file to `c:\test\data\test.doc`:

  ```powershell
  $client = new-object System.Net.WebClient

  $client.DownloadFile("http://www.eicar.org/download/eicar.com.txt","c:\test\data\test.doc")
  ```

- **Notepad**: Copy the following text string into the first line of a blank text file, then save it with the file name and/or extension in the appropriate location:

  ```text
  X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
  ```

## Related content

- [Exclusions in Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-overview.md)
- [Microsoft Defender Antivirus exclusions on Windows Server](microsoft-defender-antivirus-exclusions-windows-server.md)
- [Exclusions to avoid in Microsoft Defender Antivirus and Defender for Endpoint](defender-endpoint-exclusions-common-mistakes.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md)
