---
title: Microsoft Defender Antivirus exclusions on Windows Server
ms.reviewer: pahuijbr
description: Learn which built-in and automatic exclusions Microsoft Defender Antivirus applies on Windows Server by role, and how to add custom exclusions or disable automatic exclusions.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.date: 06/30/2026
author: chrisda
ms.author: chrisda
ms.topic: install-set-up-deploy
ai-usage: ai-assisted
ms.custom: nextgen, msecd-doc-authoring-1015
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender Antivirus

#customer intent: As a server administrator, I want to understand which exclusions Microsoft Defender Antivirus applies automatically on Windows Server so that I can avoid redundant or conflicting custom exclusions.
---

# Microsoft Defender Antivirus exclusions on Windows Server

On Windows Server, Microsoft Defender Antivirus applies exclusions automatically so that it doesn't scan files and processes that are critical to installed server roles and the operating system. These predefined exclusions reduce the risk of performance or stability problems without any manual configuration.

Microsoft Defender Antivirus automatically configures the following types of exclusions on Windows Server:

- **Built-in exclusions** for operating system files on all supported versions of Windows.
- **Automatic exclusions** for server roles on Windows Server 2016 and later.

Built-in and automatic exclusions are delivered and kept up to date through [security intelligence updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates), so they apply without any manual configuration. They don't appear in the standard exclusion lists in the [Windows Security app](microsoft-defender-security-center-antivirus.md).

Built-in and automatic exclusions are separate from the custom exclusions that you define. [Custom exclusions](microsoft-defender-antivirus-exclusions-configure.md) take precedence: when you set a custom exclusion for a path that duplicates a built-in or automatic exclusion, the custom exclusion always applies.

To learn how the different exclusion types work, see [Exclusions in Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-overview.md).

This article lists the built-in and automatic exclusions that Microsoft Defender Antivirus applies on Windows Server, and explains how to disable automatic exclusions when you need full control.

## Prerequisites

### Supported operating systems

Microsoft Defender Antivirus is built into Windows Server 2016 and later, and Azure Stack HCI OS version 23H2 and later, so the built-in and automatic exclusions in this article apply by default.

On Windows Server 2012 R2, Microsoft Defender Antivirus isn't built in. It's installed when you onboard the server to Microsoft Defender for Endpoint with the [modern unified solution](onboard-server.md), and automatic server role exclusions don't apply.

## Built-in exclusions

Microsoft Defender Antivirus applies built-in exclusions for operating system files on all supported versions of Windows. The exclusions that apply to client and server versions alike (such as Windows Update, Windows Security, and Group Policy files) are listed in [Built-in exclusions](microsoft-defender-antivirus-exclusions-overview.md#built-in-exclusions).

This section lists the built-in exclusions for server features that aren't present on client versions of Windows.

> [!TIP]
>
> - The default locations described in this article might be different from the locations on your servers.
> - The list of built-in exclusions applied by Microsoft Defender Antivirus is updated as the threat landscape changes.

<a name='wins-files'></a>

### Windows Internet Name Service (WINS) exclusions

The following exclusions apply when the Windows Internet Name Service (WINS) server feature is installed:

- `%systemroot%\System32\Wins\*\*.chk`
- `%systemroot%\System32\Wins\*\*.log`
- `%systemroot%\System32\Wins\*\*.mdb`
- `%systemroot%\System32\LogFiles\`
- `%systemroot%\SysWow64\LogFiles\`

### File Replication Service (FRS) exclusions

The following FRS exclusions are automatically configured:

- **Files in the FRS working folder**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NtFrs\Parameters\Working Directory` specifies the location.
  - `%windir%\Ntfrs\jet\sys\*\edb.chk`
  - `%windir%\Ntfrs\jet\*\Ntfrs.jdb`
  - `%windir%\Ntfrs\jet\log\*\*.log`
- **FRS Database log files**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Ntfrs\Parameters\DB Log File Directory` specifies the location.
  - `%windir%\Ntfrs\*\Edb\*.log`
- **FRS staging folder**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NtFrs\Parameters\Replica Sets\GUID\Replica Set Stage` specifies the location.
  - `%systemroot%\Sysvol\*\Ntfrs_cmp*\`
- **FRS preinstall folder**: The hidden, preinstall folder `Replica_root\DO_NOT_REMOVE_NtFrs_PreInstall_Directory` identifies this folder.
  - `%systemroot%\SYSVOL\domain\DO_NOT_REMOVE_NtFrs_PreInstall_Directory\*\Ntfrs*\`
- **Distributed File System Replication (DFSR) database and working folders**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DFSR\Parameters\Replication Groups\GUID\Replica Set Configuration File` specifies the location.
  - `%systemdrive%\System Volume Information\DFSR\$db_normal$`
  - `%systemdrive%\System Volume Information\DFSR\FileIDTable_*`
  - `%systemdrive%\System Volume Information\DFSR\SimilarityTable_*`
  - `%systemdrive%\System Volume Information\DFSR\*.XML`
  - `%systemdrive%\System Volume Information\DFSR\$db_dirty$`
  - `%systemdrive%\System Volume Information\DFSR\$db_clean$`
  - `%systemdrive%\System Volume Information\DFSR\$db_lostl$`
  - `%systemdrive%\System Volume Information\DFSR\Dfsr.db`
  - `%systemdrive%\System Volume Information\DFSR\*.frx`
  - `%systemdrive%\System Volume Information\DFSR\*.log`
  - `%systemdrive%\System Volume Information\DFSR\Fsr*.jrs`
  - `%systemdrive%\System Volume Information\DFSR\Tmp.edb`

  > [!NOTE]
  > For custom locations, see the [Disable automatic exclusions on Windows Server](#disable-automatic-exclusions-on-windows-server) section.

### Process exclusions for built-in operating system files

- `%systemroot%\System32\dfsr.exe`
- `%systemroot%\System32\dfsrs.exe`

## Automatic server role exclusions

Automatic server role exclusions add path and process exclusions based on the roles installed on the server.

On Windows Server 2016 and later, you don't need to define exclusions for server roles. When you install a role, Microsoft Defender Antivirus automatically excludes the role's files and processes, including files added during installation.

Automatic server role exclusions aren't supported on Windows Server 2012 R2. When you onboard these servers to Defender for Endpoint, only the [built-in exclusions](#built-in-exclusions) for operating system files apply. To get equivalent coverage, recreate the role exclusions as [custom exclusions](microsoft-defender-antivirus-exclusions-configure.md). For more information, see [Onboard Windows servers to the Microsoft Defender for Endpoint service](onboard-server.md).

> [!NOTE]
>
> - Automatic exclusions apply only to [real-time protection (RTP)](configure-protection-features-microsoft-defender-antivirus.md). Other scan activity (for example, [Network Inspection](network-protection.md) and [Behavior Monitoring](behavior-monitor.md)) isn't excluded. To exclude these scan types, use custom exclusions.
> - Automatic exclusions aren't honored during [quick, full, or custom scans](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan). To exclude files from these scans, use custom exclusions.
> - Microsoft Defender Antivirus uses the Deployment Image Servicing and Management (DISM) tools to determine which roles are installed on your computer.
> - The default locations described in this article might be different from the locations on your servers.
> - To set exclusions for software that isn't included as a Windows feature or server role, refer to the software documentation.

### Active Directory exclusions

The following exclusions are automatically configured when you install the Active Directory Domain Services (AD DS) role:

- **NTDS database files**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\DSA Database File` specifies the location.
  - `%windir%\Ntds\ntds.dit`
  - `%windir%\Ntds\ntds.pat`
- **AD DS transaction log files**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\Database Log Files Path` specifies the location.
  - `%windir%\Ntds\EDB*.log`
  - `%windir%\Ntds\Res*.log`
  - `%windir%\Ntds\Edb*.jrs`
  - `%windir%\Ntds\Ntds*.pat`
  - `%windir%\Ntds\TEMP.edb`
- **NTDS working folder**: The registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\DSA Working Directory` specifies the location.
  - `%windir%\Ntds\Temp.edb`
  - `%windir%\Ntds\Edb.chk`
- **Process exclusions for AD DS and AD DS-related support files**:
  - `%systemroot%\System32\ntfrs.exe`
  - `%systemroot%\System32\lsass.exe`

### DHCP Server exclusions

The following exclusions are automatically configured when you install the DHCP Server role:

- `%systemroot%\System32\DHCP\*\*.mdb`
- `%systemroot%\System32\DHCP\*\*.pat`
- `%systemroot%\System32\DHCP\*\*.log`
- `%systemroot%\System32\DHCP\*\*.chk`
- `%systemroot%\System32\DHCP\*\*.edb`

The following registry keys specify the file locations:

- `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DHCPServer\Parameters\DatabasePath`
- `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DHCPServer\Parameters\DhcpLogFilePath`
- `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\DHCPServer\Parameters\BackupDatabasePath`

### DNS Server exclusions

The following exclusions are automatically configured when you install the DNS Server role:

- **Files and folders**:
  - `%systemroot%\System32\Dns\*\*.log`
  - `%systemroot%\System32\Dns\*\*.dns`
  - `%systemroot%\System32\Dns\*\*.scc`
  - `%systemroot%\System32\Dns\*\BOOT`
- **Processes**:
  - `%systemroot%\System32\dns.exe`

### File and Storage Services exclusions

The following exclusions are automatically configured when you install the File and Storage Services role:

- `%SystemDrive%\ClusterStorage`
- `%clusterserviceaccount%\Local Settings\Temp`
- `%SystemDrive%\mscs`

> [!TIP]
> The preceding File and Storage Services exclusions don't include exclusions for the Clustering role.

### Hyper-V exclusions

The following exclusions are automatically configured when you install the Hyper-V role:

- **Files**:
  - `*.avhd`
  - `*.avhdx`
  - `*.iso`
  - `*.rct`
  - `*.vhd`
  - `*.vhdx`
  - `*.vmcx`
  - `*.vmrs`
  - `*.vsv`
- **Folders**:
  - `%ProgramData%\Microsoft\Windows\Hyper-V`
  - `%ProgramFiles%\Hyper-V`
  - `%SystemDrive%\ProgramData\Microsoft\Windows\Hyper-V\Snapshots`
  - `%Public%\Documents\Hyper-V\Virtual Hard Disks`
- **Processes**:
  - `%systemroot%\System32\Vmms.exe`
  - `%systemroot%\System32\Vmwp.exe`

### Print Server exclusions

The following exclusions are automatically configured when you install the Print Server role:

- **File exclusions**:
  - `*.shd`
  - `*.spl`
- **Folder exclusions**: The registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\DefaultSpoolDirectory` specifies the location.
  - `%systemroot%\system32\spool\printers\*`
- **Process exclusions**:
  - `spoolsv.exe`

<a name='sysvol-files'></a>

### SYSVOL folder exclusions

The following exclusions are automatically configured for files in the SYSVOL folder:

- `%systemroot%\Sysvol\Domain\*.adm`
- `%systemroot%\Sysvol\Domain\*.admx`
- `%systemroot%\Sysvol\Domain\*.adml`
- `%systemroot%\Sysvol\Domain\Registry.pol`
- `%systemroot%\Sysvol\Domain\*.aas`
- `%systemroot%\Sysvol\Domain\*.inf`
- `%systemroot%\Sysvol\Domain\*Scripts.ini`
- `%systemroot%\Sysvol\Domain\*.ins`
- `%systemroot%\Sysvol\Domain\Oscfilter.ini`

<a name='turning-off-scanning-of-files-in-the-sysvolsysvol-folder-or-the-sysvol_dfsrsysvol-folder'></a>

#### Manually exclude files in the Sysvol\Sysvol or SYSVOL_DFSR\Sysvol folder

> [!NOTE]
> This guidance to manually exclude files and folders under `%SystemRoot%\SYSVOL` (including DFSR-related paths) is relevant only in the following scenarios:
>
> - You explicitly disabled automatic exclusions.
> - You're troubleshooting performance or stability issues and need to temporarily validate antivirus interaction.

The `Sysvol\Sysvol` or `SYSVOL_DFSR\Sysvol` folder and all subfolders is the file system reparse target of the replica set root. By default, these folders use the following locations:

- `%systemroot%\Sysvol\Domain`
- `%systemroot%\Sysvol_DFSR\Domain`

The NETLOGON share references the currently active `SYSVOL` location. The SysVol value in the registry key `HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Netlogon\Parameters` identifies the location. In this location and all subfolders, exclude the following files:

- `*.adm`
- `*.admx`
- `*.adml`
- `Registry.pol`
- `Registry.tmp`
- `*.aas`
- `*.inf`
- `Scripts.ini`
- `*.ins`
- `Oscfilter.ini`

For the steps to add these exclusions, see [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md).

To confirm the exclusions are configured after you add them, run the following command in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
$p = Get-MpPreference; 'ExclusionExtension','ExclusionPath','ExclusionProcess' | ForEach-Object { $t = $_; $p.$t | ForEach-Object {[pscustomobject]@{Type=$t; Value=$_}} } | Format-Table -AutoSize
```

The command uses the [Get-MpPreference](/powershell/module/defender/get-mppreference) cmdlet to display the configured exclusions by type: extension, path, and process.

### Web Server exclusions

The following exclusions are automatically configured when you install the Web Server role:

- **Folder exclusions**:
  - `%SystemRoot%\IIS Temporary Compressed Files`
  - `%SystemDrive%\inetpub\temp\IIS Temporary Compressed Files`
  - `%SystemDrive%\inetpub\temp\ASP Compiled Templates`
  - `%systemDrive%\inetpub\logs`
  - `%systemDrive%\inetpub\wwwroot`
- **Process exclusions**:
  - `%SystemRoot%\system32\inetsrv\w3wp.exe`
  - `%SystemRoot%\SysWOW64\inetsrv\w3wp.exe`
  - `%SystemDrive%\PHP5433\php-cgi.exe`

### Windows Server Update Services exclusions

The following exclusions are automatically configured when you install the Windows Server Update Services (WSUS) role:

- `%systemroot%\WSUS\WSUSContent`
- `%systemroot%\WSUS\UpdateServicesDBFiles`
- `%systemroot%\SoftwareDistribution\Datastore`
- `%systemroot%\SoftwareDistribution\Download`

The registry key `HKEY_LOCAL_MACHINE\Software\Microsoft\Update Services\Server\Setup` specifies the location.

<a name='opting-out-of-automatic-exclusions'></a>

## Disable automatic exclusions on Windows Server

Automatic exclusions in Windows Server 2016 or later and Azure Stack HCI OS version 23H2 or later use the default paths for a role or feature only.

You might need to disable automatic exclusions when the default paths don't match your environment. For example, if you moved the NTDS and SYSVOL folders to a custom drive or path, the automatic exclusions no longer cover them. In cases like this, disable the automatic exclusions, review the [Automatic server role exclusions](#automatic-server-role-exclusions) section to identify the exclusions your roles need, and then add the equivalent [custom exclusions](microsoft-defender-antivirus-exclusions-configure.md).

> [!WARNING]
> Disabling automatic exclusions in Windows Server 2016 or later and Azure Stack HCI OS version 23H2 or later might adversely affect performance or result in data corruption.

The following subsections describe how to disable the automatic exclusions.

<a name='use-group-policy-to-disable-the-auto-exclusions-list-on-windows-server-2016-windows-server-2019-and-later'></a>

### Disable automatic exclusions in Group Policy

To disable the automatic exclusions list by using Group Policy, follow these steps:

1. On your Group Policy management computer, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11)), right-click the Group Policy Object you want to configure, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Exclusions**.

1. In the details pane of **Exclusions**, open the **Turn off Auto Exclusions** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select **Enabled**, and then select **OK**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Exclusions**.

<a name='use-powershell-cmdlets-to-disable-the-auto-exclusions-list-on-windows-server'></a>

### Disable automatic exclusions in PowerShell

To disable automatic exclusions by using PowerShell, run the following command in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
Set-MpPreference -DisableAutoExclusions $true
```

For more information, see the following articles:

- [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md).
- [Set-MpPreference](/powershell/module/defender/set-mppreference).

<a name='use-windows-management-instrumentation-wmi-to-disable-the-auto-exclusions-list-on-windows-server'></a>

### Disable automatic exclusions in WMI

Use Windows Management Instrumentation (WMI) to disable automatic exclusions by calling the **Set** method of the [MSFT_MpPreference](/previous-versions/windows/desktop/defender/msft-mppreference) class to configure the `DisableAutoExclusions` property.

For more information and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

## Microsoft Defender Antivirus exclusions on Exchange servers

Microsoft Exchange Server 2016 or later supports integration with the Antimalware Scan Interface (AMSI). For more information, see [Exchange Server AMSI integration](/exchange/antispam-and-antimalware/amsi-integration-with-exchange).

Many organizations exclude Exchange Server folders from antivirus scans for performance reasons. Microsoft recommends auditing Microsoft Defender Antivirus exclusions on Exchange servers and assessing whether you can remove exclusions without affecting performance. To add, change, or remove exclusions, see [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md).

To list the [extension exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-extension-exclusions), [file and folder exclusions](microsoft-defender-antivirus-exclusions-overview.md#file-and-folder-exclusions), and [process exclusions](microsoft-defender-antivirus-exclusions-overview.md#process-exclusions) currently configured on an Exchange Server, run the following command in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
$p = Get-MpPreference; 'ExclusionExtension','ExclusionPath','ExclusionProcess' | ForEach-Object { $t = $_; $p.$t | ForEach-Object {[pscustomobject]@{Type=$t; Value=$_}} } | Format-Table -AutoSize
```

Custom exclusions are honored during all scan types. Automatic exclusions apply only to real-time protection and are ignored during quick, full, and custom scans, so a quick scan still scans the Exchange directories covered by automatic exclusions.

<a name='see-also'></a>

## Related content

- [Configure custom exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md)
- [Exclusions to avoid in Microsoft Defender Antivirus and Defender for Endpoint](defender-endpoint-exclusions-common-mistakes.md)
- [Customize, initiate, and review the results of Microsoft Defender Antivirus scans and remediation](customize-run-review-remediate-scans-microsoft-defender-antivirus.md)
- [Onboard client devices running Windows or macOS to Microsoft Defender for Endpoint](onboard-client.md)
- [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)
