---
title: Microsoft Defender Antivirus exclusions on Windows Server
ms.reviewer: pahuijbr
description: Windows Server includes automatic exclusions, based on server role. You can also add custom exclusions.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.date: 02/19/2026
author: chrisda
ms.author: chrisda
ms.topic: install-set-up-deploy
ms.custom: nextgen
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Microsoft Defender Antivirus exclusions on Windows Server

This article describes the two main types of exclusions that are automatically configured in Microsoft Defender Antivirus:

- [Automatic exclusions](#automatic-server-role-exclusions) for roles on Windows Server 2016 and later.
- [Built-in exclusions](#built-in-exclusions) for operating system files on all versions of Windows.

For a detailed overview of exclusions, see [Manage exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md).

## Prerequisites

### Supported operating systems

- Windows Server

### Important notes about automatic exclusions on Windows Server

- [Custom exclusions](configure-exclusions-microsoft-defender-antivirus.md) take precedence over automatic exclusions. When you set a custom exclusion for a path that duplicates an automatic or built-in exclusion, custom exclusions always apply.
- Automatic exclusions apply only to [real-time protection (RTP)](configure-protection-features-microsoft-defender-antivirus.md)g. Other scan activity (for example, [Network Inspection](network-protection.md) and [Behavior Monitoring](behavior-monitor.md)) isn't excluded. To exclude other scan types, use custom exclusions.
- Automatic exclusions aren't honored during [quick, full, or custom scans](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan). To exclude other scan types, use custom exclusions.
- Built-in exclusions and automatic server role exclusions don't appear in the standard exclusion lists in the [Windows Security app](microsoft-defender-security-center-antivirus.md).
- Microsoft Defender Antivirus uses the Deployment Image Servicing and Management (DISM) tools to determine which roles are installed on your computer.
- You need to set appropriate exclusions for software that isn't included with the operating system.
- The list of built-in exclusions applied by Microsoft Defender Antivirus is updated as the threat landscape changes.

## Automatic server role exclusions

Automatic server role exclusions apply specific path and process exclusions based on the roles you selected for the server.

- **Windows Server 2016 or later**: You shouldn't need to define exclusions for server roles. When you install a role on Windows Server 2016 or later, Microsoft Defender Antivirus includes automatic exclusions for the server role and any files added while installing the role.
- **Windows Server 2012 R2**: Automatic server role exclusions aren't supported.

  Microsoft Defender Antivirus isn't an installable feature in Windows Server 2012 R2. When you onboard these servers to Defender for Endpoint, you install Microsoft Defender Antivirus, and the default built-in exclusions for operating system files are applied. But the automatic server role exclusions as described in this section aren't applied. You can recreate the automatic server role exclusions using custom exclusions.

  To learn more about onboarding Microsoft Defender Antivirus on Windows Server 2012 R2, see [Onboard Windows servers to the Microsoft Defender for Endpoint service](onboard-server.md).

The automatic server role exclusions are described in the following subsections.

> [!NOTE]
>
> - The default locations described in this article might be different than the locations on your servers.
> - The list of built-in exclusions applied by Microsoft Defender Antivirus is updated as the threat landscape changes.
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
> The previous exclusions don't include the exclusions for the Clustering role.

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

<a name=`sysvol-files`></a>

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

#### Exclude files in the Sysvol\Sysvol or SYSVOL_DFSR\Sysvol folder

> [!NOTE]
> This guidance to manually exclude files and folders under `%SystemRoot%\SYSVOL` (including DFSR‑related paths) is relevant only in the following scenarios:
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

## Built-in exclusions

This section describes the built-in exclusions for operating system files on all versions of Windows.

> [!TIP]
>
> - Review the previous [Important notes about automatic exclusions on Windows Server](#important-notes-about-automatic-exclusions-on-windows-server) in this article. The default locations might be different than the locations described in this article.
> - The built-in exclusions applied by Microsoft Defender Antivirus are updated as the threat landscape changes.
> - Microsoft Defender Antivirus is built into Windows, so it doesn't require exclusions for operating system files.

### Windows "temp.edb" files

- `%windir%\SoftwareDistribution\Datastore\*\tmp.edb`
- `%ProgramData%\Microsoft\Search\Data\Applications\Windows\windows.edb`

### Windows Update files or Automatic Update files

- `%windir%\SoftwareDistribution\Datastore\Datastore.edb`
- `%windir%\SoftwareDistribution\Datastore\*\edb.chk`
- `%windir%\SoftwareDistribution\Datastore\*\edb\*.log`
- `%windir%\SoftwareDistribution\Datastore\*\Edb\*.jrs`
- `%windir%\SoftwareDistribution\Datastore\*\Res\*.log`

### Windows Security files

- `%windir%\Security\database\*.chk`
- `%windir%\Security\database\*.edb`
- `%windir%\Security\database\*.jrs`
- `%windir%\Security\database\*.log`
- `%windir%\Security\database\*.sdb`

### Group Policy files

- `%allusersprofile%\NTUser.pol`
- `%SystemRoot%\System32\GroupPolicy\Machine\registry.pol`
- `%SystemRoot%\System32\GroupPolicy\User\registry.pol`

### WINS files

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
  > For custom locations, see the [Opt out of automatic exclusions](#opt-out-of-automatic-exclusions) section.

### Process exclusions for built-in operating system files

- `%systemroot%\System32\dfsr.exe`
- `%systemroot%\System32\dfsrs.exe`

<a name='opting-out-of-automatic-exclusions'></a>

## Opt out of automatic exclusions

In Windows Server 2016 or later, the predefined exclusions delivered by [Security intelligence updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates) use the default paths for a role or feature only. If you used custom paths or to manually control the set of exclusions, be sure to opt out of the automatic exclusions delivered in Security intelligence updates.

If you moved NTDS and SYSVOL folders to a custom drive or path, you must add exclusions manually. For more information, see [Configure the list of exclusions based on folder name or file extension](configure-extension-file-exclusions-microsoft-defender-antivirus.md#configure-the-list-of-exclusions-based-on-folder-name-or-file-extension).

Keep in mind that automatic exclusions are optimized for Windows Server 2016 and later. See the [Important notes about automatic exclusions on Windows Server](#important-notes-about-automatic-exclusions-on-windows-server) section earlier in this article before you define exclusion lists.

> [!WARNING]
> Opting out of automatic exclusions might adversely affect performance or result in data corruption. Automatic server role exclusions are optimized for Windows Server 2016 or later and Azure Stack HCI OS version 23H2 or later.

You can disable the automatic exclusion lists using Group Policy, PowerShell, or Windows Management Instrumentation (WMI) as described in the following subsections.

### Use Group Policy to disable the auto-exclusions list on Windows Server 2016, Windows Server 2019, and later

1. On your Group Policy management computer, open the [Group Policy Management Console](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console). 

1. In the Group Policy Management Console, right-click the Group Policy Object you want to configure, and then select **Edit**.

1. In the **Group Policy Management Editor** go to **Computer configuration**, and then select **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Exclusions**.

1. Double-click **Turn off Auto Exclusions**, set the option to **Enabled**, and then select **OK**.

### Use PowerShell cmdlets to disable the auto-exclusions list on Windows Server

In PowerShell, run the following command:

```PowerShell
Set-MpPreference -DisableAutoExclusions $true
```

For more information, see the following articles:

- [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md).
- [Use PowerShell with Microsoft Defender Antivirus](/powershell/module/defender/).

### Use Windows Management Instrumentation (WMI) to disable the auto-exclusions list on Windows Server

Use the **Set** method of the [MSFT_MpPreference](/previous-versions/windows/desktop/defender/msft-mppreference) class for the following properties:

```WMI
DisableAutoExclusions
```

For more information and allowed parameters, see:

- [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

<a name='defining-custom-exclusions'></a>

## Define custom exclusions

If necessary, you can add or remove custom exclusions. For more information, see the following articles:

- [Configure custom exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md)
- [Configure and validate exclusions based on file name, extension, and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md)
- [Configure and validate exclusions for files opened by processes](configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)

## See also

- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)
- [Customize, initiate, and review the results of Microsoft Defender Antivirus scans and remediation](customize-run-review-remediate-scans-microsoft-defender-antivirus.md)
- [Onboard client devices running Windows or macOS to Microsoft Defender for Endpoint](onboard-client.md)
- [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)
