---
title: ASR rules reference
description: Lists details about Microsoft Defender for Endpoint attack surface reduction rules on a per-rule basis.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
audience: ITPro
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar, ericlaw
ms.custom: asr
ms.topic: reference
ms.collection:
- m365-security
- tier2
- mde-asr
ms.date: 04/21/2026
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction (ASR) rules reference

_Attack surfaces_ are the places where your organization is vulnerable to threats and attacks. Attack surface reduction rules (ASR rules) in Microsoft Defender for Endpoint enables you to reduce the attack surface of **Microsoft Windows devices**. For more information about ASR rules, see [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md).

This article is a technical reference for ASR rules that provides the following information:

- [Operating system support for ASR rules](#operating-system-support-for-asr-rules)
- [Deployment method support for ASR rules](#deployment-method-support-for-asr-rules)
- [Alerts and notifications from ASR rule actions](#alerts-and-notifications-from-asr-rule-actions)
- [ASR rule details](#asr-rule-details)

[!Include[Prerelease information](../includes/prerelease.md)]

<a name='microsoft-defender-antivirus-exclusions-and-asr-rules'></a>

<a name='asr-rules-and-defender-for-endpoint-indicators-of-compromise-ioc'></a>

<a name='attack-surface-reduction-rules-by-type'></a>

<a name='asr-rule-to-guid-matrix'></a>

<a name='asr-rule-modes'></a>

<a name='attack-surface-reduction-rules'></a>

<a name='asr-rule-modes'></a>

<a name='asr-rules-supported-operating-systems'></a>

## Operating system support for ASR rules

ASR rules are a Microsoft Defender Antivirus feature that's available on any edition of Windows that includes Microsoft Defender Antivirus (for example, Windows 11 Home). You can configure ASR rules locally using PowerShell or Group Policy.

The following table describes the operating system support for ASR rules in Microsoft Defender for Endpoint, which provides centralized management, reporting, and alerting through Microsoft Intune, Microsoft Configuration Manager, and the Microsoft Defender portal:

|Rule name|Windows 11 or later|Windows 10|Windows Server 2019 or later|Windows Server 2016<sup>\*</sup>|Windows Server 2012 R2<sup>\*</sup>|
|---|:---:|:---:|:---:|:---:|:---:|
|**Standard protection rules**||||||
|Block abuse of exploited vulnerable signed drivers (Device)|Y|1709 or later|Y|Windows Server 1803 (SAC) or later|Y|
|Block credential stealing from the Windows local security authority subsystem|Y|1803 or later|Y|Y|Y|
|Block persistence through WMI event subscription|Y|1903 or later|Windows Server 1903 (SAC) or later|N|N|
|**Other ASR rules**||||||
|Block Adobe Reader from creating child processes|Y|1809 or later|Y|Y|Y|
|Block all Office applications from creating child processes|Y|1709 or later|Y|Y|Y|
|Block executable content from email client and webmail|Y|1709 or later|Y|Y|Y|
|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|Y|1803 or later|Y|Y|Y|
|Block execution of potentially obfuscated scripts|Y|1709 or later|Y|Y|Y|
|Block JavaScript or VBScript from launching downloaded executable content|Y|1709 or later|Y|N|N|
|Block Office applications from creating executable content|Y|1709 or later|Y|Y|Y|
|Block Office applications from injecting code into other processes|Y|1709 or later|Y|Y|Y|
|Block Office communication application from creating child processes|Y|1709 or later|Y|Y|Y|
|Block process creations originating from PSExec and WMI commands|Y|1803 or later|Y|Y|Y|
|Block rebooting machine in Safe Mode|Y|1709 or later|Y|Y|Y|
|Block untrusted and unsigned processes that run from USB|Y|1709 or later|Y|Y|Y|
|Block use of copied or impersonated system tools|Y|1709 or later|Y|Y|Y|
|Block Webshell creation for Servers|n/a|n/a|Exchange servers only|Exchange servers only|N|
|Block Win32 API calls from Office macros|Y|1709 or later|n/a|n/a|n/a|
|Use advanced protection against ransomware|Y|1803 or later|Y|Y|Y|

<sup>\*</sup> Supported ASR rules in Windows Server 2016 and Windows Server 2012 R2 require onboarding using the modern unified solution package. For more information, see [New Windows Server 2012 R2 and 2016 functionality in the modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

<a name='asr-rules-supported-configuration-management-systems'></a>

## Deployment method support for ASR rules

Although Defender for Endpoint supports ASR rules, you need a separate service to deploy the rules to devices. The supported methods for deploying ASR rules are described in the following table.

|Rule name|[Intune](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-microsoft-intune)|[Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-global-asr-rule-exclusions-in-microsoft-configuration-manager)|[MDM CSP](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-any-mdm-solution-using-the-policy-csp)|[Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-group-policy)|
|---|:---:|:---:|:---:|:---:|
|**Standard protection rules**|||||
|Block abuse of exploited vulnerable signed drivers (Device)|Y|N|Y|Y|
|Block credential stealing from the Windows local security authority subsystem|Y|1802 or later|Y|Y|
|Block persistence through WMI event subscription|Y|N|Y|Y|
|**Other ASR rules**|||||
|Block Adobe Reader from creating child processes|Y|N|Y|Y|
|Block all Office applications from creating child processes|Y|1710 or later|Y|Y|
|Block executable content from email client and webmail|Y|1710 or later|Y|Y|
|Block executable files from running unless they meet a prevalence, age, or trusted list criterion[[1](#CMS1)]|Y|1802 or later|Y|Y|
|Block execution of potentially obfuscated scripts|Y|1710 or later|Y|Y|
|Block JavaScript or VBScript from launching downloaded executable content|Y|1710 or later|Y|Y|
|Block Office applications from creating executable content|Y|1710 or later|Y|Y|
|Block Office applications from injecting code into other processes|Y|1710 or later|Y|Y|
|Block Office communication application from creating child processes|Y|N|Y|Y|
|Block process creations originating from PSExec and WMI commands|Y|N|Y|Y|
|Block rebooting machine in Safe Mode|Y|N|Y|Y|
|Block untrusted and unsigned processes that run from USB|Y|1802 or later|Y|Y|
|Block use of copied or impersonated system tools|Y|N|Y|Y|
|Block Webshell creation for Servers|Y|N|Y|Y|
|Block Win32 API calls from Office macros|Y|1710 or later|Y|Y|
|Use advanced protection against ransomware|Y|1802 or later|Y|Y|

> [!TIP]
> You can also configure ASR rules locally on individual devices using Group Policy or [PowerShell](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-powershell). All ASR rules are supported by both methods on local devices.

<a id="CMS1">1</a> Currently, this ASR rule might not be available in the Intune ASR policy configuration due to a known backend issue. But, the rule is available through the other available ASR policy configuration methods or in existing Intune ASR policies created before the issue.

<a name='per-asr-rule-alert-and-notification-details'></a>

## Alerts and notifications from ASR rule actions

The following table describes the organization and local alerts that active ASR rules can generate.

- The **EDR alerts** value indicates whether the ASR rule in **Block** or **Warn** mode generates [Endpoint Detection and Response (EDR)](overview-endpoint-detection-response.md) alerts in Defender for Endpoint.
- The **User notifications** value indicates whether the ASR rule supports user notification pop-ups in **Block** or **Warn** mode (if the rule supports **Warn** mode).

|Rule name|EDR alerts|User<br>notifications|
|---|:---:|:---:|
|**Standard protection rules**|||
|Block abuse of exploited vulnerable signed drivers (Device)|N|Y|
|Block credential stealing from the Windows local security authority subsystem[[¹](#Alert1)]|N|N|
|Block persistence through WMI event subscription|Y|Y|
|**Other ASR rules**|||
|Block Adobe Reader from creating child processes[[²](#Alert2)]|Y|Y|
|Block all Office applications from creating child processes|N|Y|
|Block executable content from email client and webmail[[²](#Alert2)]|Y|Y|
|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|N|Y|
|Block execution of potentially obfuscated scripts|Y|Y|
|Block JavaScript or VBScript from launching downloaded executable content[[²](#Alert2)]|Y|Y|
|Block Office applications from creating executable content|N|Y|
|Block Office applications from injecting code into other processes[[¹](#Alert1)]|N|Y|
|Block Office communication application from creating child processes|N|Y|
|Block process creations originating from PSExec and WMI commands|N|Y|
|Block rebooting machine in Safe Mode|N|N|
|Block untrusted and unsigned processes that run from USB|Y|Y|
|Block use of copied or impersonated system tools|N|Y|
|Block Webshell creation for Servers|N|N|
|Block Win32 API calls from Office macros|Y|N|
|Use advanced protection against ransomware|Y|Y|

<a id="Alert1">¹</a> This ASR rule doesn't support **Warn** mode.

<a id="Alert2">²</a> This ASR rule in **Block** or **Warn** mode has the following extra requirements in the [cloud protection level in Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md):

- EDR alerts are generated only when the cloud protection level on the device is **High plus** or **Zero tolerance**.
- User notification pop-ups are generated only when the cloud protection level on the device is **High**, **High plus**, or **Zero tolerance**.

<a name='per-rule-descriptions></a>

## ASR rule details

### Standard protection rules

<a name="block-abuse-of-exploited-vulnerable-signed-drivers"></a>

#### Block abuse of exploited vulnerable signed drivers (Device)

Local apps _with sufficient privileges_ can exploit vulnerable signed drivers to gain access to the operating system kernel. Vulnerable signed drivers enable attackers to disable or circumvent security solutions, eventually leading to system compromise.

This ASR rule prevents apps from saving vulnerable signed drivers on the computer. It doesn't prevent loading existing drivers already on the computer.

- **Microsoft Intune name**: `Block abuse of exploited vulnerable signed drivers (Device)`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `56a863a9-875e-4185-98a7-b882c64b5ce5`
- **Advanced hunting action type**:
  - `AsrVulnerableSignedDriverAudited`
  - `AsrVulnerableSignedDriverBlocked`
- **Dependencies**: None

> [!NOTE]
>
> - Use the following URL to submit a driver to Microsoft for analysis: <https://www.microsoft.com/wdsi/driversubmission>.
> - To further protect your Windows devices from vulnerable drivers, you should also implement these extra protection methods:
>   - [Microsoft App Control for Business](/windows/security/application-security/application-control/app-control-for-business/appcontrol)
>     - Windows 10 or later.
>     - Windows Server 2016 or later.
>   - [Microsoft Windows vulnerable driver block list](/windows/security/application-security/application-control/app-control-for-business/design/microsoft-recommended-driver-block-rules)
>     - Windows 11 or later.
>     - Windows Server 2019 (1809) or later
>   - [Microsoft AppLocker](/windows/security/application-security/application-control/app-control-for-business/applocker/understanding-applocker-allow-and-deny-actions-on-rules)
>     - Windows 8.1 or older.
>     - Windows Server 2012 R2 or older.

#### Block credential stealing from the Windows local security authority subsystem

> [!NOTE]
> If you enabled [Local Security Authority (LSA) protection](/windows-server/security/credentials-protection-and-management/configuring-additional-lsa-protection) (which we recommend, along with [Credential Guard](/windows/security/identity-protection/credential-guard)):
>
> - This ASR rule isn't required.
> - This ASR rule doesn't provide extra protection (the ASR rule and LSA protection work similarly).
> - This ASR rule is classified as _not applicable_ in Defender for Endpoint management settings in the Microsoft Defender portal.

This ASR rule helps prevent credential stealing by locking down the Local Security Authority Subsystem Service (LSASS). LSASS authenticates users who sign in on Windows computers. Typically, [Credential Guard](/windows/security/identity-protection/credential-guard) in Windows prevents attempts to extract credentials from LSASS.

Many processes make unnecessary calls to LSASS for access rights that aren't needed. This activity generates considerable ASR rule noise, but doesn't block functionality. For example, Google Chrome updates unnecessarily access LSASS, because passwords are stored in LSASS on the device. Activating this ASR rule on the device blocks Chrome updates from accessing LSASS, but doesn't block Chrome from updating. These ASR rule events are good because the Chrome software update process shouldn't access LSASS.

For information about the types of rights that are typically requested in process calls to LSASS, see [Process Security and Access Rights](/windows/win32/procthread/process-security-and-access-rights).

Some organizations can't enable Credential Guard because of compatibility issues with custom smartcard drivers or other programs that load into the LSA. In these cases, attackers can use tools like Mimikatz to scrape cleartext passwords and NTLM hashes from LSASS.

If you can't enable LSA protection and/or Credential Guard, you can configure this rule to provide equivalent protection against malware that targets `lsass.exe`.

- **Microsoft Intune name**: `Block credential stealing from the Windows local security authority subsystem`
- **Microsoft Configuration Manager name**: `Block credential stealing from the Windows local security authority subsystem`
- **GUID**: `9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2`
- **Advanced hunting action type**:
  - `AsrLsassCredentialTheftAudited`
  - `AsrLsassCredentialTheftBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
>
> - This ASR rule doesn't support **Warn** mode.
> - This ASR rule produces a large volume of audit events, almost all of which are safe to ignore when the rule is enabled in **Block** mode. You can choose to skip the audit mode evaluation and proceed to block mode deployment. We recommend starting with a small set of devices and gradually expanding to cover the rest.
> - This ASR rule suppresses alerts and user notification pop-ups for friendly processes and duplicate block actions.
> - This ASR rule blocks **access to LSASS process memory**. It doesn't block processes from **running**. When this ASR rule blocks processes like `svchost.exe`, it means the process is blocked from accessing LSASS process memory. You can often safely ignore blocking of these processes by this ASR rule.
> - Some apps enumerate all running processes and attempt to open them with exhaustive permissions. This ASR rule denies the app's open process actions and records the details to the Security log in Windows Event Viewer. This rule can generate numerous noise. If you have an app that simply enumerates LSASS, but has no real effect in functionality, there's no need to add it to the exclusion list. By itself, this event log entry doesn't necessarily indicate a malicious threat.
> - This ASR rule has issues with Quest Dirsync Password Sync. For more information, see [Dirsync Password Sync isn't working when Windows Defender is installed, error: "VirtualAllocEx failed: 5" (4253914)](https://support.quest.com/kb/4253914/dirsync-password-sync-isn-t-working-when-windows-defender-is-installed-error-virtualallocex-failed-5).
> - This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

#### Block persistence through WMI event subscription

This ASR rule prevents malware from abusing WMI to get persistence on devices.

Fileless threats use various tactics to stay hidden, to avoid being seen in the file system, and to gain periodic control. Some threats can abuse the WMI repository and event model to stay hidden.

- **Microsoft Intune name**: `Block persistence through WMI event subscription`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `e6db77e5-3df2-4cf1-b95a-636979351e5b`
- **Advanced hunting action type**:
  - `AsrPersistenceThroughWmiAudited`
  - `AsrPersistenceThroughWmiBlocked`
- **Dependencies**: Microsoft Defender Antivirus, RPC

> [!NOTE]
>
> - This rule isn't supported when deployed via Microsoft Intune to Windows Server 2012 R2 or Windows Server 2016 using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
> - If you use Microsoft Configuration Manager, we recommend extensive testing of this ASR rule in **Audit** mode before you proceed to **Block** mode. The Configuration Manager client relies heavily on WMI.
> - This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

### Other ASR rules

#### Block Adobe Reader from creating child processes

This ASR rule prevents attacks by blocking Adobe Reader from creating processes.

Malware can download and launch payloads and break out of Adobe Reader through social engineering or exploits. By blocking Adobe Reader from generating child processes, malware attempting to use Adobe Reader as an attack vector are prevented from spreading.

- **Microsoft Intune name**: `Block Adobe Reader from creating child processes`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c`
- **Advanced hunting action type**:
  - `AsrAdobeReaderChildProcessAudited`
  - `AsrAdobeReaderChildProcessBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
>
> - This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).
> - This ASR rule in **Block** or **Warn** mode has extra requirements in the [cloud protection level in Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md):
>   - EDR alerts are generated only when the cloud protection level on the device is **High plus** or **Zero tolerance**.
>   - User notification pop-ups are generated only when the cloud protection level on the device is **High**, **High plus**, or **Zero tolerance**.

#### Block all Office applications from creating child processes

This rule blocks Office apps from creating child processes. Office apps include Word, Excel, PowerPoint, OneNote, and Access.

Creating malicious child processes is a common malware strategy. Malware that abuses Office as a vector often runs VBA macros and exploit code to download and attempt to run more payloads. However, some legitimate line-of-business apps might also generate child processes for benign purposes. For example, spawning a Command Prompt or using PowerShell to configure registry settings.

- **Microsoft Intune name**: `Block all Office applications from creating child processes`
- **Microsoft Configuration Manager name**: `Block Office application from creating child processes`
- **GUID**: `d4f940ab-401b-4efc-aadc-ad5f3c50688a`
- **Advanced hunting action type**:
  - `AsrOfficeChildProcessAudited`
  - `AsrOfficeChildProcessBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
> This rule is enforced only if Office is installed in the `%ProgramFiles%` or `%ProgramFiles(x86)%` locations (By default, `C:\Program Files` and `C:\Program Files (x86)`).

#### Block executable content from email client and webmail

This rule blocks email opened with Microsoft Outlook, Outlook.com, and other popular webmail providers from propagating the following file types:

- Executable files (for example, .exe, .dll, or .scr).
- Script files (for example, .ps1, .vbs, or .js).
- Archive files (for example, .zip).

- **Microsoft Intune name**: `Block executable content from email client and webmail`
- **Microsoft Configuration Manager name**: `Block executable content from email client and webmail`
- **GUID**: `be9ba2d9-53ea-4cdc-84e5-9b1eeee46550`
- **Advanced hunting action type**:
  - `AsrExecutableEmailContentAudited`
  - `AsrExecutableEmailContentBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
>
> - This ASR rule in **Block** or **Warn** mode has extra requirements in the [cloud protection level in Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md):
>   - EDR alerts are generated only when the cloud protection level on the device is **High plus** or **Zero tolerance**.
>   - User notification pop-ups are generated only when the cloud protection level on the device is **High**, **High plus**, or **Zero tolerance**.
> - This ASR rule has the following alternative descriptions:
>   - **Intune (Configuration Profiles)**: `Execution of executable content (exe, dll, ps, js, vbs, etc.) dropped from email (webmail/mail client) (no exceptions)`
>   - **Configuration Manager**: `Block executable content download from email and webmail clients`
>   - **Group Policy**: `Block executable content from email client and webmail`

#### Block executable files from running unless they meet a prevalence, age, or trusted list criterion

> [!TIP]
> Currently, this ASR rule might not be available in the Intune ASR policy configuration due to a known backend issue. But, the rule is available through the [other available ASR policy configuration methods](attack-surface-reduction-rules-configure.md) or in existing Intune ASR policies created before the issue.

This ASR rule blocks executable files (for example, .exe, .dll, or .scr, from launching). Launching untrusted or unknown executable files can be risky, as it's not initially clear if the files are malicious.

- **Microsoft Intune name**: `Block executable files from running unless they meet a prevalence, age, or trusted list criterion`
- **Microsoft Configuration Manager name**: `Block executable files from running unless they meet a prevalence, age, or trusted list criteria`
- **GUID**: `01443614-cd74-433a-b99e-2ecdc07bfc25`
- **Advanced hunting action type**:
  - `AsrUntrustedExecutableAudited`
  - `AsrUntrustedExecutableBlocked`
- **Dependencies**: Microsoft Defender Antivirus, Cloud Protection

> [!NOTE]
>
> - To use this ASR rule, you must [enable cloud-delivered protection](/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus).
> - You specify individual files or folders by using folder paths or fully qualified resource names.
> - This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

#### Block execution of potentially obfuscated scripts

This ASR rule detects suspicious properties within an obfuscated script.

Script obfuscation is a common technique that both malware authors and legitimate applications use to hide intellectual property or decrease script loading times. Malware authors also use obfuscation to make malicious code harder to read, which hampers close scrutiny by humans and security software.

- **Microsoft Intune name**: `Block execution of potentially obfuscated scripts`
- **Microsoft Configuration Manager name**: `Block execution of potentially obfuscated scripts`
- **GUID**: `5beb7efe-fd9a-4556-801d-275e5ffc04cc`
- **Advanced hunting action type**:
  - `AsrObfuscatedScriptAudited`
  - `AsrObfuscatedScriptBlocked`
- **Dependencies**: Microsoft Defender Antivirus, Anti-malware Scan Interface (AMSI), Cloud Protection

> [!NOTE]
>
> - To use this ASR rule, you must [enable cloud-delivered protection](/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus).
> - This ASR rule supports PowerShell scripts.

#### Block JavaScript or VBScript from launching downloaded executable content

This ASR rule prevents scripts from launching potentially malicious downloaded content. Malware written in JavaScript or VBScript often acts as a downloader to fetch and launch other malware from the internet. Although not common, line-of-business apps sometimes use scripts to download and launch installers.

- **Microsoft Intune name**: `Block JavaScript or VBScript from launching downloaded executable content`
- **Microsoft Configuration Manager name**: `Block JavaScript or VBScript from launching downloaded executable content`
- **GUID**: `d3e037e1-3eb8-44c8-a917-57927947596d`
- **Advanced hunting action type**:
  - `AsrScriptExecutableDownloadAudited`
  - `AsrScriptExecutableDownloadBlocked`
- **Dependencies**: Microsoft Defender Antivirus, Antimalware Scan Interface (AMSI)

> [!NOTE]
>
> - This rule isn't supported when deployed via Microsoft Intune to Windows Server 2012 R2 or Windows Server 2016 using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
> - This ASR rule in **Block** or **Warn** mode has extra requirements in the [cloud protection level in Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md):
>
>   - EDR alerts are generated only when the cloud protection level on the device is **High plus** or **Zero tolerance**.
>   - User notification pop-ups are generated only when the cloud protection level on the device is **High**, **High plus**, or **Zero tolerance**.

#### Block Office applications from creating executable content

This ASR rule prevents Office apps (for example, Word, Excel, and PowerPoint) from being used as a vector to save malicious components to disk. These malicious components can survive a computer reboot and persist on the system. This rule defends against this persistence technique by:

- Blocking access (open/execute) to the code written to disk.
- Blocking execution of untrusted files saved by Office macros that are allowed to run in Office files.

- **Microsoft Intune name**: `Block Office applications from creating executable content`
- **Microsoft Configuration Manager name**: `Block Office applications from creating executable content`
- **GUID**: `3b576869-a4ec-4529-8536-b80a7769e899`
- **Advanced hunting action type**:
  - `AsrExecutableOfficeContentAudited`
  - `AsrExecutableOfficeContentBlocked`
- **Dependencies**: Microsoft Defender Antivirus, RPC

> [!NOTE]
> This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).
>
> This ASR rule isn't affected by the installation location of Office.

#### Block Office applications from injecting code into other processes

This ASR rule blocks code injection attempts from Office apps into other processes. Attackers might attempt to use Office apps to migrate malicious code into other processes through code injection, so the code can masquerade as a clean process. There are no known legitimate business purposes for using code injection.

- **Microsoft Intune name**: `Block Office applications from injecting code into other processes`
- **Microsoft Configuration Manager name**: `Block Office applications from injecting code into other processes`
- **GUID**: `75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84`
- **Advanced hunting action type**:
  - `AsrOfficeProcessInjectionAudited`
  - `AsrOfficeProcessInjectionBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
>
> - This ASR rule doesn't support **Warn** mode.
> - This ASR rule applies to Word, Excel, OneNote, and PowerPoint.
> - This ASR rule requires restarting Microsoft 365 Apps (Office applications) for the configuration changes to take effect.
> - This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).
> - This ASR rule is incompatible with the following apps:
>   - **BeyondTrust Privilege Guard**: For more information, see [September-2024 (Platform: 4.18.24090.11 \| Engine 1.1.24090.11)](msda-updates-previous-versions-technical-upgrade-support.md#september-2024-platform-4182409011--engine-112409011).
>   - **Heimdal security**
> - This ASR rule is enforced only if Office is installed in the `%ProgramFiles%` or `%ProgramFiles(x86)%` locations (By default, `C:\Program Files` and `C:\Program Files (x86)`).

#### Block Office communication application from creating child processes

This ASR rule prevents Outlook from creating child processes, while still allowing legitimate Outlook functions. This ASR rule protects against:

- Social engineering attacks and prevents exploiting code from abusing vulnerabilities in Outlook.
- [Outlook rules and forms exploits](https://blogs.technet.microsoft.com/office365security/defending-against-rules-and-forms-injection/) that attackers can use when a user's credentials are compromised.

- **Microsoft Intune name**: `Block Office communication application from creating child processes`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `26190899-1602-49e8-8b27-eb1d0a1ce869`
- **Advanced hunting action type**:
  - `AsrOfficeCommAppChildProcessAudited`
  - `AsrOfficeCommAppChildProcessBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
> This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).
>
> This rule is enforced only if Office is installed in the `%ProgramFiles%` or `%ProgramFiles(x86)%` locations (By default, `C:\Program Files` and `C:\Program Files (x86)`).

#### Block process creations originating from PSExec and WMI commands

> [!IMPORTANT]
> If you use [Microsoft Configuration Manager](/intune/configmgr/), don't use other available deployment methods to enable this rule on managed devices. The Configuration Manager client relies heavily on WMI.

This ASR rule blocks processes created through [PsExec](/sysinternals/downloads/psexec) and [WMI](/windows/win32/wmisdk/about-wmi) from running. PsExec and WMI can remotely execute code. Malware can use PsExec and WMI for command and control, or to spread network infections.

- **Microsoft Intune name**: `Block process creations originating from PSExec and WMI commands`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `d1e49aac-8f56-4280-b9ba-993a6d77406c`
- **Advanced hunting action type**:
  - `AsrPsexecWmiChildProcessAudited`
  - `AsrPsexecWmiChildProcessBlocked`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
> This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

#### Block rebooting machine in Safe Mode

This ASR rule prevents commonly abused commands like `bcdedit` and `bootcfg` from restarting Windows computers in Safe Mode. In Safe Mode, many security products are disabled or run with limited functionality. Safe Mode allows attackers to further launch tampering commands, or execute and encrypt all files on the machine.

Safe Mode is still manually accessible from the Windows Recovery Environment.

- **Microsoft Intune name**: `Block rebooting machine in Safe Mode`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `33ddedf1-c6e0-47cb-833e-de6133960387`
- **Advanced hunting action type**:
  - `AsrSafeModeRebootedAudited`
  - `AsrSafeModeRebootBlocked`
  - `AsrSafeModeRebootWarnBypassed`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
> Currently, Microsoft Defender Vulnerability Management doesn't recognize this rule. The [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md) shows this rule as **Not applicable**.

#### Block untrusted and unsigned processes that run from USB

This ASR rule prevents unsigned or untrusted executable files (for example, .exe, .dll, or .scr) from running from USB removable drives, including SD cards.

This ASR rule doesn't block the files from being copied from the USB drive to disk. It blocks the copied files from running from disk.

- **Microsoft Intune name**: `Block untrusted and unsigned processes that run from USB`
- **Microsoft Configuration Manager name**: `Block untrusted and unsigned processes that run from USB`
- **GUID**: `b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4`
- **Advanced hunting action type**:
  - `AsrUntrustedUsbProcessAudited`
  - `AsrUntrustedUsbProcessBlocked`
- **Dependencies**: Microsoft Defender Antivirus

#### Block use of copied or impersonated system tools

This ASR rule blocks the propagation and use of executable files identified as copies (duplicates or imposters) of Windows system tools. Some malicious programs might try to copy or impersonate Windows system tools to avoid detection or gain privileges. Allowing such executable files can lead to potential attacks.

- **Microsoft Intune name**: `Block use of copied or impersonated system tools`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb`
- **Advanced hunting action type**:
  - `AsrAbusedSystemToolAudited`
  - `AsrAbusedSystemToolBlocked`
  - `AsrAbusedSystemToolWarnBypassed`
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
> Currently, Microsoft Defender Vulnerability Management doesn't recognize this rule. The [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md) shows this rule as **Not applicable**.

#### Block Webshell creation for Servers

This ASR rule blocks web shell script creation on Windows servers running Microsoft Exchange. A web shell script is a crafted script that allows an attacker to control the compromised server. A web shell script might include the following functionality:

- Receive and run malicious commands.
- Download and run malicious files.
- Steal and exfiltrate credentials and sensitive information.
- Identify potential targets.

- **Microsoft Intune name**: `Block Webshell creation for Servers`
- **Microsoft Configuration Manager name**: n/a
- **GUID**: `a8f5898e-1dc8-49a9-9878-85004b8a61e6`
- **Advanced hunting action type**:
- **Dependencies**: Microsoft Defender Antivirus

> [!NOTE]
>
> - This rule isn't supported when deployed via Microsoft Intune to Windows Server 2012 R2 or Windows Server 2016 using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
> - If you manage ASR rules in Microsoft Defender for Endpoint, don't configure this ASR in Group Policy or other local settings (leave the value as `Not Configured`). Any other value (for example, `Enabled` or `Disabled`) can cause conflicts and prevent the rule from applying correctly.
> - Currently, Microsoft Defender Vulnerability Management doesn't recognize this rule. The [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md) shows this rule as **Not applicable**.

#### Block Win32 API calls from Office macros

Office Visual Basic for Applications (VBA) enables Win32 API calls. This ASR rule prevents VBA macros from calling Win32 APIs. Malware can abuse this capability, such as [calling Win32 APIs to launch malicious shellcode](https://www.microsoft.com/security/blog/2018/09/12/office-vba-amsi-parting-the-veil-on-malicious-macros/) without writing anything directly to disk.

Most organizations don't require Win32 API calls from VBA macros, even if they use macros in other ways.

- **Microsoft Intune name**: `Block Win32 API calls from Office macros`
- **Microsoft Configuration Manager name**: `Block Win32 API calls from Office macros`
- **GUID**: `92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b`
- **Advanced hunting action type**:
  - `AsrOfficeMacroWin32ApiCallsAudited`
  - `AsrOfficeMacroWin32ApiCallsBlocked`
- **Dependencies**: Microsoft Defender Antivirus, Antimalware Scan Interface (AMSI)

> [!NOTE]
>
> - This rule isn't supported when deployed via Microsoft Intune to Windows Server 2012 R2 or Windows Server 2016 using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
> - This rule has limited exclusion support. For details, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).
> - To use this ASR rule, you must [enable cloud-delivered protection](/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus).

This ASR rule provides an extra layer of protection against ransomware. It uses both client and cloud heuristics to determine whether a file resembles ransomware. This rule doesn't block files that have one or more of the following characteristics:

- The file is found to be unharmful in the Microsoft cloud.
- The file is a valid signed file.
- The file is prevalent enough to not be considered as ransomware.

This rule doesn't just block files with a bad reputation. Instead, the rule errs on the side of caution and also blocks files _that don't yet have a positive reputation_. Typically, blocks on benign, unknown files by this rule eventually resolve themselves. The file's reputation and trust values incrementally increase as non-problematic usage increases.

If blocks on benign, unknown files don't resolve in a timely manner, you can configure a [per-ASR rule exclusion](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules) for this rule or use the [Allow action for an indicator of compromise (IoC)](indicators-overview.md#enforcement-types-for-indicators).

- **Microsoft Intune name**: `Use advanced protection against ransomware`
- **Microsoft Configuration Manager name**: `Use advanced protection against ransomware`
- **GUID**: `c1db55ab-c21a-4637-bb3f-a12568109d35`
- **Advanced hunting action type**:
  - `AsrRansomwareAudited`
  - `AsrRansomwareBlocked`
- **Dependencies**: Microsoft Defender Antivirus, Cloud Protection

## See also

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction (ASR) rules](attack-surface-reduction-rules-deployment-implement.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Troubleshoot ASR rules](troubleshoot-asr.md)
