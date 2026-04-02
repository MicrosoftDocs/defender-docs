---
title: Migrating from non-Microsoft HIPS to attack surface reduction rules
description: Describes how to approach a migration from a non-Microsoft Host Intrusion Prevention System (HIPS) solution into attack surface reduction rules.
ms.topic: upgrade-and-migration-article
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
author: limwainstein
ms.author: lwainstein
ms.custom: asr
ms.subservice: asr
ms.collection:
- m365-security
- tier2
- mde-asr
search.appverid: met150
ms.date: 03/10/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Migrating from a non-Microsoft HIPS to attack surface reduction rules

This article helps you to map common rules to Microsoft Defender for Endpoint.

## Scenarios when migrating from a non-Microsoft HIPS product to attack surface reduction rules

### Block creation of specific files

- **Applies to**: All processes
- **Operation**: File Creation
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**:
  - .jaff
  - .krab
  - .locky
  - .lukitus
  - .odin
  - .wnry
  - .zepto
- **Attack surface reduction rules**:
  - ASR rules block attack techniques, not indicators of compromise (IOC).
  - Blocking a specific file extension isn't always useful, because it doesn't prevent a device from compromise. It only partially thwarts an attack until attackers create a new type of extension for the payload.
- **Other recommended features**:
  - We highly recommend enabling Microsoft Defender Antivirus, [cloud protection](cloud-protection-microsoft-defender-antivirus.md) and [behavioral blocking](client-behavioral-blocking.md).
  - We recommend other prevention measures, such as the attack surface reduction rule named [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware), which provides a greater level of protection against ransomware attacks.
  - Microsoft Defender for Endpoint monitors many of these registry keys, such as Autostart Extension Points (ASEP) techniques, which trigger specific alerts. The registry keys used require a minimum of Local Admin or Trusted Installer privileges. We recommended using a locked-down environment with minimum administrative accounts or rights. You can enable other system configurations, including disabling the `SeDebugPrivilege` as part of our wider security recommendations.

### Block creation of specific registry keys

- **Applies to**: All Processes
- **Processes**: N/A
- **Operation**: Registry Modifications
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**:
  - `HKCU\Environment\UserInitMprLogonScript`
  - `HKCU\Software\Microsoft\HtmlHelp Author\location`
  - `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Accessibility\ATs*\StartExe`
  - `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options*\Debugger`
  - `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SilentProcessExit*\MonitorProcess`
- **Attack Surface Reduction rules**:
  - ASR rules block attack techniques, not indicators of compromise (IOC).
  - Blocking a specific file extension isn't always useful, because it doesn't prevent a device from compromise. It only partially thwarts an attack until attackers create a new type of extension for the payload.
- **Other recommended features**:
  - We highly recommend enabling Microsoft Defender Antivirus, [cloud protection](cloud-protection-microsoft-defender-antivirus.md) and [behavioral blocking](client-behavioral-blocking.md).
  - We recommend other prevention measures, such as the attack surface reduction rule named [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware), which provides a greater level of protection against ransomware attacks.
  - Microsoft Defender for Endpoint monitors many of these registry keys, such as Autostart Extension Points (ASEP) techniques, which trigger specific alerts. The registry keys used require a minimum of Local Admin or Trusted Installer privileges. We recommended using a locked-down environment with minimum administrative accounts or rights. You can enable other system configurations, including disabling the `SeDebugPrivilege` as part of our wider security recommendations.

### Block untrusted programs from running from removable drives

- **Applies to**: Untrusted Programs from USB
- **Processes**: \*
- **Operation**: Process Execution
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**:
- **Attack Surface Reduction rules**:
  - Use the ASR rune named [Block untrusted and unsigned processes that run from USB](attack-surface-reduction-rules-reference.md#block-untrusted-and-unsigned-processes-that-run-from-usb)
- **Other recommended features**:
  - Fore more information about controls for USB devices and other removable media using Defender for Endpoint, see [Device control in Microsoft Defender for Endpoint](device-control-overview.md).

### Block Mshta from launching certain child processes

- **Applies to**: Mshta
- **Processes**: mshta.exe
- **Operation**: Process Execution
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**:
  - `cmd.exe`
  - `powershell.exe`
  - `regsvr32.exe`
- **Attack Surface Reduction rules**: There's no specific ASR rules to prevent child processes from *mshta.exe*. This type of control is available in [exploit protection](exploit-protection.md) or [application control for Windows](/windows/security/threat-protection/windows-defender-application-control/windows-defender-application-control).
- **Other recommended features**:
  - Enable Windows Defender Application Control to prevent mshta.exe from running at all. If your organization requires *mshta.exe* for line of business apps, configure a specific Windows Defender Exploit Protection rule, to prevent mshta.exe from launching child processes.

### Block Outlook from launching child processes

- **Applies to**: Outlook
- **Processes**: outlook.exe
- **Operation**: Process Execution
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: powershell.exe
- **Attack Surface Reduction rules**: attack surface reduction rules have a built-in rule to prevent Office communication apps (Outlook, Skype, and Teams) from launching child processes: *Block Office communication application from creating child processes*, GUID *26190899-1602-49e8-8b27-eb1d0a1ce869*.
- **Other recommended features**: We recommend enabling PowerShell constrained language mode to minimize the attack surface from PowerShell.

### Block Office Apps from launching child processes

- **Applies to**: Office
- **Processes**: winword.exe, powerpnt.exe, excel.exe
- **Operation**: Process Execution
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: powershell.exe, cmd.exe, wscript.exe, mshta.exe, EQNEDT32.EXE, regsrv32.exe
- **Attack Surface Reduction rules**: attack surface reduction rules have a built-in rule to prevent Office apps from launching child processes: *Block all Office applications from creating child processes*, GUID *d4f940ab-401b-4efc-aadc-ad5f3c50688a*.
- **Other recommended features**: N/A

### Block Office Apps from creating executable content

- **Applies to**: Office
- **Processes**: winword.exe, powerpnt.exe, excel.exe
- **Operation**: File Creation
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: C:\Users*\AppData**.exe, C:\ProgramData**.exe, C:\ProgramData**.com, C:\Users*AppData\Local\Temp**.com, C:\Users*\Downloads**.exe, C:\Users*\AppData**.scf, C:\ProgramData**.scf, C:\Users\Public*.exe, C:\Users*\Desktop***.exe
- **Attack Surface Reduction rules**: N/A.

### Block Wscript from reading certain types of files

- **Applies to**: Wscript
- **Processes**: wscript.exe
- **Operation**: File Read
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: C:\Users*\AppData**.js, C:\Users*\Downloads**.js
- **Attack Surface Reduction rules**: Due to reliability and performance issues, attack surface reduction rules don't have the capability to prevent a specific process from reading a certain script file type. We do have a rule to prevent attack vectors that might originate from these scenarios. The rule name is *Block JavaScript or VBScript from launching downloaded executable content* (GUID *d3e037e1-3eb8-44c8-a917-57927947596d*) and the *Block execution of potentially obfuscated scripts* (GUID * 5beb7efe-fd9a-4556-801d-275e5ffc04cc*).
- **Other recommended features**: Though there are specific attack surface reduction rules that mitigate certain attack vectors within these scenarios, it's important to mention that AV is able by default to inspect scripts (PowerShell, Windows Script Host, JavaScript, VBScript, and more) in real time, through the Antimalware Scan Interface (AMSI). More info is available here: [Antimalware Scan Interface (AMSI)](/windows/win32/amsi/antimalware-scan-interface-portal).

### Block launch of child processes

- **Applies to**: Adobe Acrobat
- **Processes**: AcroRd32.exe, Acrobat.exe
- **Operation**: Process Execution
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: cmd.exe, powershell.exe, wscript.exe
- **Attack Surface Reduction rules**: attack surface reduction rules allow blocking Adobe Reader from launching child processes. The rule name is *Block Adobe Reader from creating child processes*, GUID *7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c*.
- **Other recommended features**: N/A

### Block download or creation of executable content

- **Applies to**: CertUtil: Block download or creation of executable
- **Processes**: certutil.exe
- **Operation**: File Creation
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: *.exe
- **Attack Surface Reduction rules**: attack surface reduction rules don't support these scenarios because they're a part of Microsoft Defender Antivirus protection.
- **Other recommended features**: Microsoft Defender Antivirus prevents CertUtil from creating or downloading executable content.

### Block processes from stopping critical System components

- **Applies to**: All Processes
- **Processes**: *
- **Operation**: Process Termination
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: MsSense.exe, MsMpEng.exe, NisSrv.exe, svchost.exe*, services.exe, csrss.exe, smss.exe, wininit.exe, and more.
- **Attack Surface Reduction rules**: attack surface reduction rules don't support these scenarios because they're protected with Windows built-in security protections.
- **Other recommended features**: ELAM (Early Launch AntiMalware), PPL (Protection Process Light), PPL AntiMalware Light, and System Guard.

### Block specific launch Process Attempt

- **Applies to**: Specific Processes
- **Processes**: *Name your Process*
- **Operation**: Process Execution
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: tor.exe, bittorrent.exe, cmd.exe, powershell.exe, and more
- **Attack Surface Reduction rules**: Overall, attack surface reduction rules aren't designed to function as an Application manager.
- **Other recommended features**: To prevent users from launching specific processes or programs, it's recommended to use Windows Defender Application Control. Microsoft Defender for Endpoint File and Cert indicators, can be used in an Incident Response scenario (shouldn't be seen as an application control mechanism).

### Block unauthorized changes to Microsoft Defender Antivirus configurations

- **Applies to**: All Processes
- **Processes**: *
- **Operation**: Registry Modifications
- **Examples of Files/Folders, Registry Keys/Values, Processes, or Services**: HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware, HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager\AllowRealTimeMonitoring, and so on.
- **Attack Surface Reduction rules**: attack surface reduction rules don't cover these scenarios because they're part of the Microsoft Defender for Endpoint built-in protection.
- **Other recommended features**: Tamper Protection (opt-in, managed from Intune) prevents unauthorized changes to DisableAntiVirus, DisableAntiSpyware, DisableRealtimeMonitoring, DisableOnAccessProtection, DisableBehaviorMonitoring, and DisableIOAVProtection registry keys (and more).

See also

- [Attack surface reduction FAQ](attack-surface-reduction-faq.yml)
- [Enable attack surface reduction rules](attack-surface-reduction-rules-enable.md)
- [Evaluate attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

