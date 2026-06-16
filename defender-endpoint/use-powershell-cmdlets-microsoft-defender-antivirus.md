---
title: Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus
description: In Windows 10 and Windows 11, you can use PowerShell cmdlets to run scans, update Security intelligence, and change settings in Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen
ms.date: 10/20/2025
ms.reviewer: yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

---
# Use PowerShell cmdlets to configure and manage Microsoft Defender Antivirus


You can use PowerShell to perform various functions in Microsoft Defender Antivirus. Similar to the command prompt or command line, PowerShell is a task-based command-line shell and scripting language designed especially for system administration. You can read more about it in the [PowerShell documentation](/powershell/scripting/overview).

For a list of the cmdlets and their functions and available parameters, see the [Microsoft Defender Antivirus cmdlets](/powershell/module/defender) topic.

PowerShell cmdlets are most useful in Windows Server environments that don't rely on a graphical user interface (GUI) to configure software.

> [!NOTE]
> PowerShell cmdlets should not be used as a replacement for a full network policy management infrastructure, such as [Microsoft Configuration Manager](/intune/configmgr), [Group Policy Management Console](use-group-policy-microsoft-defender-antivirus.md), or [Microsoft Defender Antivirus Group Policy ADMX templates](/troubleshoot/windows-client/group-policy/create-and-manage-central-store).

Changes made with PowerShell will affect local settings on the endpoint where the changes are deployed or made. This means that deployments of policy with Microsoft Defender for Endpoint security settings management, Microsoft Intune, Microsoft Configuration Manager Tenant Attach, or Group Policy can overwrite changes made with PowerShell.

You can [configure which settings can be overridden locally with local policy overrides](configure-local-policy-overrides-microsoft-defender-antivirus.md).

PowerShell is typically installed under the folder `%SystemRoot%\system32\WindowsPowerShell`.

## Prerequisites

### Supported operating systems

- Windows

## Use Microsoft Defender Antivirus PowerShell cmdlets

1. In the Windows search bar, type **powershell**.
1. Select **Windows PowerShell** from the results to open the interface.
1. Enter the PowerShell command and any parameters.

> [!NOTE]
> You may need to open PowerShell in administrator mode. Right-click the item in the Start menu, click **Run as administrator** and click **Yes** at the permissions prompt.

To open online help for any of the cmdlets type the following:

```PowerShell
Get-Help <cmdlet> -Online
```

Omit the `-online` parameter to get locally cached help.

### Common Microsoft Defender Antivirus PowerShell cmdlets

Microsoft Defender Antivirus can be configured using PowerShell cmdlets. These are task-based commands for configuration and management. Common cmdlets include:

- [Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus): Check Microsoft Defender Antivirus status and protection settings.
- [Set-MpPreference](/powershell/module/defender/set-mppreference): Configure preferences, such as exclusions, scan schedules, and cloud-delivered protection.
- [Update-MpSignature](/powershell/module/defender/update-mpsignature): Update security intelligence.
- [Start-MpScan](/powershell/module/defender/start-mpscan): Trigger quick, full, or custom scans.
- [Get-MpThreat](/powershell/module/defender/get-mpthreat) or [Get-MpThreatDetection](/powershell/module/defender/get-mpthreatdetection): Review detected and remediated threats.

For full syntax and parameter options, see [Microsoft Defender Antivirus cmdlets](/powershell/module/defender).

> [!TIP]
>
> - If you're looking for Antivirus related information for other platforms, see:
>   - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
>   - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
>   - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
>   - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
>   - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
>   - [Configure Defender for Endpoint on Android features](android-configure.md)
>   - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
> - **Performance tip**: Due to a variety of factors, anti-virus software (including Microsoft Defender Antivirus) can cause performance issues on endpoint devices. In some cases, you might need to tune the performance of Microsoft Defender Antivirus to alleviate those performance issues. Microsoft's **Performance analyzer** is a PowerShell command-line tool that helps determine which files, file paths, processes, and file extensions might be causing performance issues. For example:
>   - Top paths that impact scan time.
>   - Top files that impact scan time.
>   - Top processes that impact scan time.
>   - Top file extensions that impact scan time.
>   - Combinations. For example:
>     - Top files per extension.
>     - Top paths per extension.
>     - Top processes per path.
>     - Top scans per file.
>     - Top scans per file per process.
>
>   You can use this information to better assess performance issues and apply remediation actions. For more information, see [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

## Related articles

- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Reference topics for management and configuration tools](configuration-management-reference-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender Antivirus Cmdlets](/powershell/module/defender)
