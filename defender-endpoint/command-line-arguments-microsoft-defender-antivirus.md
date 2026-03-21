---
title: Use the command line to manage Microsoft Defender Antivirus
description: Learn how to use MpCmdRun to run Microsoft Defender Antivirus scans and configure other options like next-generation protection.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.reviewer: ksarens
manager: bagol
ms.date: 03/20/2026
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier3
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Configure and manage Microsoft Defender Antivirus with the MpCmdRun command-line tool

You can do tasks in Microsoft Defender Antivirus using the MpCmdRun command-line tool. MpCmdRun is useful when you want to automate Microsoft Defender Antivirus tasks.

- You need to run MpCmdRun in an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**). For example:
  1. Open the **Start** menu, and then type **cmd**.
  2. Right-click on the **Command Prompt** result, and then select **Run as administrator**.
  
- By default, the folder that contains MpCmdRun isn't in the PATH environment variable, so you need to get to the folder that contains MpCmdRun before you can run it. MpCmdRun.exe is located in the following locations on Windows x64 devices:
  - `C:\Program Files\Windows Defender`
  - `C:\ProgramData\Microsoft\Windows Defender\Platform\<antimalware platform version>`

  The latest version of MpCmdRun is always in the `C:\ProgramData\Microsoft\Windows Defender\Platform\<antimalware platform version>` folder. To go to this directory in the Command Prompt window without knowing the platform version, use the following enhanced change directory (cd) command:

  ```dos
  set "_done=" & (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) >nul 2>&1
  ```

  For more information about the antimalware platform, see [Microsoft Defender Antivirus updates and baselines](microsoft-defender-antivirus-updates.md).

MpCmdRun uses the following syntax:

```console
MpCmdRun.exe -Command [-CommandOptions]
```

In the following example, MpCmdRun starts a full antivirus scan on the device.

```console
MpCmdRun.exe -Scan -ScanType 2
```

The rest of this article describes the available options and troubleshooting information for MpCmdRun.

## Prerequisites

### Supported operating systems

- Windows

<a name="commands"></a>

## Commands and options in MpCmdRun

The commands and their available options are described in the following table.

|Command|Option|Description|
|---|---|---|
|`-?` or `-h`||Displays all available commands and their options.|
|`-Scan [Options]`||Scans for malicious software. Typically, `-Scan` with no options runs a quick scan, unless a different default scan type is configured on the device. <br/><br/> Quick scans and full scans have default timeouts. The scan automatically stops after the time passes: <ul><li>**Quick scans**: One day</li><li>**Full scans**: Seven days</li></ul>|
||`-ScanType <value>`|Specifies the type of antimalware scan to run. Valid values are: <ul><li>**0**: Default, according to your configuration.</li><li>**1**: Quick scan.</li><li>**2**: Full system scan</li><li>**3**: File and folder custom scan</li></ul> <br/> The return code is one of the following values: <ul><li>**0**: Indicates one of the following results: <ul><li>No malware found.</li><li>Malware found and successfully remediated.</li></ul></li><li>**2**: Indicates one of the following results: <ul><li>Malware found and not remediated.</li><li>Malware found and user action required to complete remediation.</li><li>Scanning error.</li></ul></li></ul>|
||`-BootSectorScan`|Valid only for custom scans. Enables boot sector scanning.|
||`-Cancel`|Try to cancel active quick scans or full scans.|
||`-CpuThrottling`|Specifies the maximum CPU usage percentage. The default value is 50.|
||`-DisableRemediation`|Valid only for custom scans. <ul><li>File exclusions are ignored.</li><li>Archive files are scanned.</li><li>Actions aren't applied after detection.</li><li>Event log entries aren't written after detection.</li><li>Detections from the custom scan aren't displayed in the user interface.</li><li>Detections from the custom scan are displayed in the console output.</li></ul>|
||`-File <path>`|Valid only for custom scans. Specifies the file or folder to scan.|
||`-ReturnHR`|Instead of returning 0 or 2, return the actual HRESULT of the scan command.|
||`-Timeout <days>`|Default value is 7 for full scans and 1 for all other scan types. The maximum value is 30.|
|`-AddDynamicSignature -Path <path>`||Loads dynamic security intelligence from the specified location.|
|`-CaptureNetworkTrace -Path <path>`||Captures network input from the Network Protection service, and saves it to the specified location. To stop tracing, use the `Path` option without a value. <br/><br/>**Note**: NT AUTHORITY\LocalService must have write access to the specified path (for example, `C:\Windows\Temp\MpCmdRun`).|
|`-CheckExclusion -Path <PathAndFile or Path>`||Verifies whether the specified file or path is excluded from scanning. For more information, see [Verify whether a specified path is excluded using MpCmdRun](configure-extension-file-exclusions-microsoft-defender-antivirus.md#verify-whether-a-specified-path-is-excluded-using-mpcmdrun).|
|`-DeviceControl -TestPolicyXml <PathAndFilename> -Rules or -Groups`||Validate the specified Device Control rules (`-Rules`) or groups (`-Groups`) XML policy file.|
|`-DisplayECSConnection`||Displays the URLs used by the Defender Core service to connection to the Experimentation and Configuration Service (ECS).|
|`-GetFiles`||Generates, compresses, and saves Microsoft Defender Antivirus-related log files into the file `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab`. For more information, see [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).|
||`-DlpTrace`|Includes the data loss prevention (DLP) trace files in the .cab file.|
||`-SupportLogLocation <RootPath>`|Specifies the root folder of a central location where the local MpSupportFiles.cab file is copied. The file is copied with a unique filename into a date-based subfolder path: `<RootPath>\<MMDD>\MpSupport-<Hostname>-<HHMM>.cab`. For more information, see [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).|
|`-GetFilesDiagTrack`||Generates, compresses, and saves Microsoft Defender Antivirus-related log files into the file `%TEMP%\DiagOutputDir\MpSupportFiles.cab`.|
|`-HeapSnapshotConfig -Enable or -Disable`||Enable or Disable heap snapshot (tracing) configuration for the specified process ID or process name.|
||`-Pid <ProcessID>`|The process ID value of the process. Valid values are: <ul><li>**0 (Default)**: MsMpEng.exe</li><li>**1**: MpDefenderCoreService.exe</li><li>**2**: NisSrv.exe</li><li>**3**: MpDlpService.exe</li><li>**A custom value**: The specified process ID.</li></ul>|
||`-Name <ProcessName.exe>`|The name of the process.|
|`-ListAllDynamicSignatures`||Lists the SignatureSet IDs of all loaded dynamic security intelligence updates.|
|`-ListCustomASR`||Lists any custom Azure Site Recovery rules configured on the device.|
|`-OSCA`||Verifies whether the OS Copy Acceleration feature is enabled.|
|`-RegisterWmiSchema`||Re-registers the MpProtection MOF schema if it doesn't match the latest installed schema.|
|`-RemoveDefinitions [Options]`||Restores the previous set of signature definitions.|
||`-All`|Restores the installed security intelligence to a previous backup copy or to the original default set.|
||`-DynamicSignatures`|Removes only dynamically downloaded security intelligence updates.|
||`-Engine`|Restores the previously installed engine.|
|`-RemoveDynamicSignature -SignatureSetID <SignatureSetID>`||Removes the specified dynamic security intelligence update.|
|`-SignatureUpdate`||Checks for new security intelligence updates.|
||`-UNC <path>`|Downloads updates directly from the specified UNC file share. If you don't specify a path value, the update is done directly from the preconfigured UNC location.|
||`-MMPC`|Downloads updates directly from the Microsoft Malware Protection Center.|
|`-Restore`||Restores or lists quarantined items.|
||`-ListAll`|Lists all quarantined items.|
||`-Name <name> [-All]`|Restores the most recently quarantined item based on the specified threat name. If you use `-All`, all quarantined items are restored based on the specified threat name. A threat can map to multiple files.|
||`-FilePath <QuarantinedFilePath>`|Restores a quarantined item based on the file path that was quarantined.|
||`-Path <path>`|Specifies the location of the restored items. <ul><li>If you don't use `-Path`, the item is restored to its original location and is removed from quarantine.</li><li>If you use `-Path`, the item is restored to the specified path, but isn't removed from quarantine.</li></ul>|
||`-Output <filename>`|Write all quarantine item names to the specified file with UTF-8 encoding.|
|`-Trace`||Starts a trace of actions by the Microsoft Antimalware Service. By default all Error, Warning, and Informational events for all components are logged. The results are stored in `C:\ProgramData\Microsoft\Windows Defender\Support\MPTrace-<YYYMMDD>-<UTC HHMMSS>-<GUID>.bin`.|
||`-Grouping <value>`|Specifies the component to include in the trace. Valid values are: <ul><li>**0x1**: Service</li><li>**0x2**: Malware Protection Engine</li><li>**0x4**: User Interface</li><li>**0x8**: Real-Time Protection</li><li>**0x10**: Scheduled actions</li><li>**0x20**: WMI</li><li>**0x40**: NIS/GAPA</li><li>**0x80**: Windows Security Center</li><li>**0x100**: DLP external</li><li>**0x200**: Browser Protection</li></ul>|
||`-Level <value>`|Specifies the event severity levels to include in the trace. Valid values are: <ul><li>**0x1**: Errors</li><li>**0x2**: Warnings</li><li>**0x4**: Informational messages</li><li>**0x8**: Function calls</li><li>**0x10**: Verbose</li><li>**0x20**: Performance</li></ul>|
|`-TrustCheck -File <PathAndFilename>`||Checks the trust status of the specified file. Benign files might not be trusted. Only known, good files are trusted.||
|`-ValidateMapsConnection`||Verifies the device can communicate with the Microsoft Defender Antivirus cloud service. Available in Windows 10 version 1703 (October 2019) or later.|

<a name="common-errors-in-running-commands-via-mpcmdrunexe"></a>

## Common MpCmdRun errors

The following table lists common errors that you might encounter using MpCmdRun.

|Error message|Possible reason|
|---|---|
|**ValidateMapsConnection failed (800106BA)** or **0x800106BA**|The Microsoft Defender Antivirus service is disabled. Enable the service and try again. If you need help re-enabling Microsoft Defender Antivirus, see [Reinstall/enable Microsoft Defender Antivirus on your endpoints](switch-to-mde-phase-2.md#step-1-reinstallenable-microsoft-defender-antivirus-on-your-endpoints). <br/><br/> The service was formerly named Windows Defender Antivirus in: <ul><li>Windows 10 version 1909 (November 2019) or earlier, and Windows Server 2019 or earlier, the service was formerly named *Windows Defender Antivirus*.|
|**0x80070667**|You're running the `-ValidateMapsConnection` command on a Windows 10 version 1607 (August 2016) or earlier, or on Windows Server 2016 or earlier. Run the command on Windows 10 version 1703 or later (April 2017), or Windows Server 2019 or later.|
|**MpCmdRun is not recognized as an internal or external command, operable program, or batch file.**|You need to run MpCmdRun from `%ProgramFiles%\Windows Defender` or `C:\ProgramData\Microsoft\Windows Defender\Platform\<antimalware platform version>` (recommended). <br/><br/> To go to this directory in the Command Prompt window without knowing the platform version, use the following enhanced change directory (cd) command: `set "_done=" & (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) >nul 2>&1`.|
|**ValidateMapsConnection failed to establish a connection to MAPS (hr=80070005 httpcode=450)**|You need to run MpCmdRun in an elevated Command Prompt. For example: <ol><li>Open the **Start** menu, and then type **cmd**.</li><li>Right-click on the **Command Prompt** result, and then select **Run as administrator**.</li></ol>.|
|**ValidateMapsConnection failed to establish a connection to MAPS (hr=80070006 httpcode=451)**|A firewall is blocking the connection or doing TLS inspection.|
|**ValidateMapsConnection failed to establish a connection to MAPS (hr=80004005 httpcode=450)**|Possible network-related issues. For example, name resolution problems.|
|**ValidateMapsConnection failed to establish a connection to MAPS (hr=0x80508015**)|A firewall is blocking the connection or doing TLS inspection.|
|**ValidateMapsConnection failed to establish a connection to MAPS (hr=800722F0D**)|A firewall is blocking the connection or doing TLS inspection.|
|**ValidateMapsConnection failed to establish a connection to MAPS (hr=80072EE7 httpcode=451)**|A firewall is blocking the connection or doing TLS inspection.|

## See also

- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Configure Microsoft Defender Antivirus features](configure-microsoft-defender-antivirus-features.md)
- [Configure and validate Microsoft Defender Antivirus network connections](configure-network-connections-microsoft-defender-antivirus.md)
- [Reference articles for management and configuration tools](configuration-management-reference-microsoft-defender-antivirus.md)
- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
