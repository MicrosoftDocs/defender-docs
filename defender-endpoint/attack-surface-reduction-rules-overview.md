---
title: ASR rules overview
description: Learn about attack surface reduction (ASR) rules in Microsoft Defender Antivirus, including requirements, configuration methods, modes, exclusions, and policy conflict resolution.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.date: 04/22/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction (ASR) rules overview

[!INCLUDE [MDE automated setup guide](../includes/security-analyzer-setup-guide.md)]

Attack surface reduction (ASR) rules in Microsoft Defender Antivirus are a key component in reducing your organization's _attack surface_ (entry points that could give attackers access to your organization). For more information about attack surface reduction, see [Attack surface reduction in Microsoft Defender for Endpoint](attack-surface-reduction-overview.md).

ASR rules target risky software behavior on Windows devices. For example:

- Launching executable files and scripts that attempt to download or run files.
- Running obfuscated or otherwise untrusted scripts.
- Creating child processes from other, potentially vulnerable processes.
- Injecting code into other processes.

Although some legitimate apps might also do these actions, the actions are considered risky because attackers use malware that behaves the same way. ASR rules can constrain risky software behavior on Windows devices to help keep your organization safe.

See the following series of articles to plan, test, implement, and monitor ASR rules:

- [ASR rules deployment overview](attack-surface-reduction-rules-deployment.md)
  - [Plan your ASR rules deployment](attack-surface-reduction-rules-deployment-plan.md)
  - [Test ASR rules](attack-surface-reduction-rules-deployment-test.md)
  - [Enable ASR rules](attack-surface-reduction-rules-deployment-implement.md)
  - [Manage and monitor ASR rules](attack-surface-reduction-rules-deployment-operationalize.md)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
>
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## ASR rules

ASR rules are grouped into the following categories:

- **Standard protection rules** offer such great security benefits that we recommend enabling them in **Block** mode without the need for extensive testing. Typically, these rules have minimal or no noticeable effect on users, but there are exceptions:

  - [Block persistence through WMI event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription): If you use Microsoft Configuration Manager to manage devices, don't use other available deployment methods (for example, Group Policy or PowerShell) to activate this rule in **Block** or **Warn** mode on the device without extensive testing in **Audit** mode. The Configuration Manager client relies heavily on WMI.
  - [Block credential stealing from the Windows local security authority subsystem](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem): If you enabled [Local Security Authority (LSA) protection](/windows-server/security/credentials-protection-and-management/configuring-additional-lsa-protection) (which we recommend, along with [Credential Guard](/windows/security/identity-protection/credential-guard)), this rule is redundant.

- **Other ASR rules** provide important protection, but require testing in **Audit** mode before you activate them in **Block** or **Warn** mode as described in the [Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md).

The available ASR rules, their corresponding GUID values, and their categories are described in the following table:

- Links in the rule names take you to detailed rule descriptions in the [ASR rules reference](attack-surface-reduction-rules-reference.md) article.
- Other than [endpoint security policies in Microsoft Intune](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies) and [Microsoft Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-global-asr-rule-exclusions-in-microsoft-configuration-manager), all other ASR rule configuration methods identify rules by GUID value.

  Any ASR rule name differences between Microsoft Intune and Microsoft Configuration Manager are described in the table.

  > [!TIP]
  > Microsoft Configuration Manager was previously known by other names:
  >
  > - **Microsoft System Center Configuration Manager**: version 1511 to 1906 (November 2015 to July 2019)
  > - **Microsoft Endpoint Configuration Manager**: version 1910 to 2211 (December 2019 to December 2022)
  > - **Microsoft Configuration Manager**: version 2303 (April 2023) or later
  >
  > For support and update information, see [Updates and servicing for Configuration Manager](/intune/configmgr/core/servers/manage/updates).

|Rule name in Microsoft Intune|Rule name in Microsoft Configuration Manager|GUID|Category|
|---|---|---|---|
|**Standard protection rules**||||
|[Block abuse of exploited vulnerable signed drivers (Device)](attack-surface-reduction-rules-reference.md#block-abuse-of-exploited-vulnerable-signed-drivers)|n/a|56a863a9-875e-4185-98a7-b882c64b5ce5|Misc|
|[Block credential stealing from the Windows local security authority subsystem](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem)|same|9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2|Lateral movement & credential theft|
|[Block persistence through WMI event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription)|n/a|e6db77e5-3df2-4cf1-b95a-636979351e5b|Lateral movement & credential theft|
|**Other ASR rules**||||
|[Block Adobe Reader from creating child processes](attack-surface-reduction-rules-reference.md#block-adobe-reader-from-creating-child-processes)|n/a|7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c|Productivity apps|
|[Block all Office applications from creating child processes](attack-surface-reduction-rules-reference.md#block-all-office-applications-from-creating-child-processes)|Block Office application from creating child processes|d4f940ab-401b-4efc-aadc-ad5f3c50688a|Productivity apps|
|[Block executable content from email client and webmail](attack-surface-reduction-rules-reference.md#block-executable-content-from-email-client-and-webmail)|same|be9ba2d9-53ea-4cdc-84e5-9b1eeee46550|Email|
|[Block executable files from running unless they meet a prevalence, age, or trusted list criterion](attack-surface-reduction-rules-reference.md#block-executable-files-from-running-unless-they-meet-a-prevalence-age-or-trusted-list-criterion)|Block executable files from running unless they meet a prevalence, age, or trusted list criteria|01443614-cd74-433a-b99e-2ecdc07bfc25|Polymorphic threats|
|[Block execution of potentially obfuscated scripts](attack-surface-reduction-rules-reference.md#block-execution-of-potentially-obfuscated-scripts)|same|5beb7efe-fd9a-4556-801d-275e5ffc04cc|Script|
|[Block JavaScript or VBScript from launching downloaded executable content](attack-surface-reduction-rules-reference.md#block-javascript-or-vbscript-from-launching-downloaded-executable-content)|same|d3e037e1-3eb8-44c8-a917-57927947596d|Script|
|[Block Office applications from creating executable content](attack-surface-reduction-rules-reference.md#block-office-applications-from-creating-executable-content)|same|3b576869-a4ec-4529-8536-b80a7769e899|Productivity apps|
|[Block Office applications from injecting code into other processes](attack-surface-reduction-rules-reference.md#block-office-applications-from-injecting-code-into-other-processes)|same|75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84|Productivity apps|
|[Block Office communication application from creating child processes](attack-surface-reduction-rules-reference.md#block-office-communication-application-from-creating-child-processes)|n/a|26190899-1602-49e8-8b27-eb1d0a1ce869|Email, Productivity apps|
|[Block process creations originating from PSExec and WMI commands](attack-surface-reduction-rules-reference.md#block-process-creations-originating-from-psexec-and-wmi-commands)|n/a|d1e49aac-8f56-4280-b9ba-993a6d77406c|Lateral movement & credential theft|
|[Block rebooting machine in Safe Mode](attack-surface-reduction-rules-reference.md#block-rebooting-machine-in-safe-mode)|n/a|33ddedf1-c6e0-47cb-833e-de6133960387|Misc|
|[Block untrusted and unsigned processes that run from USB](attack-surface-reduction-rules-reference.md#block-untrusted-and-unsigned-processes-that-run-from-usb)|same|b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4|Polymorphic threats|
|[Block use of copied or impersonated system tools](attack-surface-reduction-rules-reference.md#block-use-of-copied-or-impersonated-system-tools)|n/a|c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb|Misc|
|[Block Webshell creation for Servers](attack-surface-reduction-rules-reference.md#block-webshell-creation-for-servers)|n/a|a8f5898e-1dc8-49a9-9878-85004b8a61e6|Misc|
|[Block Win32 API calls from Office macros](attack-surface-reduction-rules-reference.md#block-win32-api-calls-from-office-macros)|same|92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b|Productivity apps|
|[Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware)|same|c1db55ab-c21a-4637-bb3f-a12568109d35|Polymorphic threats|

## Requirements for ASR rules

ASR rules require Microsoft Defender Antivirus as the primary anti-virus app on Windows devices:

- Microsoft Defender Antivirus must be enabled and in Active mode. Specifically, Microsoft Defender Antivirus can't be in any of the following modes:
  - Passive
  - Passive Mode with Endpoint Detection and Response (EDR) in Block Mode
  - Limited periodic scanning (LPS)
  - Off

  For more information about modes in Microsoft Defender Antivirus, see [How Microsoft Defender Antivirus affects Defender for Endpoint functionality](microsoft-defender-antivirus-compatibility.md#how-microsoft-defender-antivirus-affects-defender-for-endpoint-functionality).

- [Real-time protection in Microsoft Defender Antivirus](configure-real-time-protection-microsoft-defender-antivirus.md) must be on.
- [Cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md) (also referred to as Microsoft Advanced Protection Service or MAPS) is critical to ASR rule functionality. Cloud protection enhances standard real-time protection and is a critical component of preventing breaches from malware. Some ASR rules specifically have [Cloud-delivery Protection](/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus) requirements for [Endpoint Detection and Response (EDR)](overview-endpoint-detection-response.md) alerts in Defender for Endpoint and user notification pop-ups. For details, see [Alerts and notifications from ASR rule actions](attack-surface-reduction-rules-reference.md#alerts-and-notifications-from-asr-rule-actions).

  For the same reason, your environment must allow [connections to the Microsoft Defender Antivirus cloud service](configure-network-connections-microsoft-defender-antivirus.md).

- Microsoft Defender Antivirus component versions must be no more than two versions older than the most currently available version:
  - **Platform update version**: Updated monthly.
  - **MEngine version**: Updated monthly.
  - **Security intelligence**: Microsoft continually updates security intelligence (also known as definitions and signatures) to address the latest threats and to refine detection logic.

  Keeping Microsoft Defender Antivirus versions current helps reduce ASR rule false positives and improves Microsoft Defender Antivirus detection capabilities. For more information about the current versions and how to update the different Microsoft Defender Antivirus components, see [Microsoft Defender Antivirus platform support](microsoft-defender-antivirus-updates.md).

- Although ASR rules don't require [Microsoft 365 E5](https://www.microsoft.com/microsoft-365/enterprise/office-365-e5), we recommend the security capabilities of E5 in equivalent subscriptions to take advantage of the following advanced management capabilities:
  - Monitoring, analytics, and workflows in Defender for Endpoint.
  - Reporting and configuration capabilities in the Microsoft Defender XDR portal.

  Advanced management capabilities aren't available with other licenses (for example, Windows Professional or Microsoft 365 E3). However, you can develop your own monitoring and reporting tools on top of the ASR rule events that are generated in Windows Event Viewer on each device (for example, [Windows Event Forwarding](/windows/security/operating-system-security/device-management/use-windows-event-forwarding-to-assist-in-intrusion-detection)).

  To learn more about Windows licensing, see [Windows Licensing](https://www.microsoft.com/licensing/product-licensing/windows) and get the [Microsoft Volume Licensing Reference Guide](https://www.microsoft.com/download/details.aspx?id=11091).

### Supported operating systems for ASR rules

ASR rules are a Microsoft Defender Antivirus feature found on any edition of Windows that includes Microsoft Defender Antivirus (for example, Windows 11 Home). You can configure ASR rules locally on devices using PowerShell or Group Policy.

Centralized management, reporting, and alerting for ASR rules in Microsoft Defender for Endpoint are available in the following editions and versions of Windows:

- **Pro** and **Enterprise** editions of Windows 10 or later.
- Windows Server 2012 R2 or later.
- Azure Local (formerly known as Azure Stack HCI) version 23H2 or later.

For more operating system support information, see [Operating system support for ASR rules](attack-surface-reduction-rules-reference.md#operating-system-support-for-asr-rules).

<a name='audit-mode-for-evaluation'></a>

<a name='audit-mode'></a>

<a name='warn-mode-for-users'></a>

## Modes for ASR rules

An ASR rule can be in one of the following modes as described in the following table:

|Rule mode|Code|Description|
|---|:---:|---|
|**Off** or <br/> **Disabled**|0|The ASR rule is explicitly disabled. <br/><br/> This value can cause conflicts when the same device is assigned the same ASR rule in different modes by different policies.|
|**Block** or <br/> **Activated**|1|The ASR rule is enabled in **Block** mode.|
|**Audit** or <br/> **Audit mode**|2|The ASR rule is enabled as if in **Block** mode, but without taking action. <br/><br/> Detections for ASR rules in **Audit** mode are available in the following locations: <ul><li>Event IDs 1122, 1125, 1132, and 1134 in [Windows Event Viewer](attack-surface-reduction-windows-events.md#browse-attack-surface-reduction-events-in-windows-event-viewer).</li><li>[Advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview): <br><code>DeviceEvent<br>&#124; where ActionType startswith "Asr"<br>&#124; where ActionType endswith "Audited"</code></li><li>The [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md).</li></ul>|
|**Not configured**|5|The ASR rule isn't explicitly enabled. <br/><br/> This value is functionally equivalent to **Disabled** or **Off**, but without the potential for rule conflicts.|
|**Warn** or <br/> **Warning**|6|The ASR rule is enabled as if in **Block** mode, but users can select **Unblock** in the warning notification pop-up to bypass the block for 24 hours. After 24 hours, the user needs to bypass the block again. <br/><br/> **Warn** mode is supported in Windows 10 version 1809 (November 2018) or later. ASR rules in **Warn** mode on unsupported versions of Windows are effectively in **Block** mode (bypass isn't available). <br/><br/> **Warn** mode isn't available in Microsoft Configuration Manager. <br/><br/> **Warn** mode has the following Microsoft Defender Antivirus version requirements: <ul><li>**Platform release**: 4.18.2008.9 (August 2020) or later.</li><li>**Engine release**: 1.1.17400.5 (August 2020) or later.</li></ul> <br/> The following ASR rules don't support **Warn** mode: <ul><li>[Block credential stealing from the Windows local security authority subsystem](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem)</li><li>[Block Office applications from injecting code into other processes](attack-surface-reduction-rules-reference.md#block-office-applications-from-injecting-code-into-other-processes)</li></ul>|

We recommend **Block** mode for the standard protection rules, and initial testing in **Audit** mode for other ASR rules before activating them in **Block** or **Warn** mode.

Many line-of-business applications are written with limited security concerns, and they might act in ways that seem similar to malware. By monitoring data from ASR rules in **Audit** mode and [adding exclusions](attack-surface-reduction-rules-deployment-test.md#add-exclusions) for required apps, you can deploy ASR rules without reducing productivity.

Before enabling ASR rules in **Block** mode, assess their effects in **Audit** mode and security recommendations. For more information, see [Test ASR rules](attack-surface-reduction-rules-deployment-test.md).

<a name='assess-rules-before-deployment'></a>

## Deployment and configuration methods for ASR rules

Microsoft Defender for Endpoint supports ASR rules but doesn't include a built-in method to deploy ASR rule settings to devices. Instead, you use a separate deployment or management tool to create and distribute ASR rule policies to devices. Not all deployment methods support every ASR rule. For per-rule details, see [Deployment method support for ASR rules](attack-surface-reduction-rules-reference.md#deployment-method-support-for-asr-rules).

The following table summarizes the available methods. For detailed configuration instructions, see [Configure attack surface reduction (ASR) rules and exclusions](attack-surface-reduction-rules-configure.md).

|Method|Description|
|---|---|
|[Microsoft Intune endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies)|The recommended method for configuring and distributing ASR rule policies to devices. Requires Microsoft Intune Plan 1 (included in subscriptions like Microsoft 365 E3 or available as a standalone add-on).|
|[Microsoft Intune custom profiles with OMA-URIs](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-intune-using-custom-profiles-with-oma-uris-and-csps)|An alternative method for configuring ASR rules in Intune using Open Mobile Alliance – Uniform Resource (OMA-URI) profiles.|
|[Any MDM solution using the Policy CSP](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-any-mdm-solution-using-the-policy-csp)|Use the Windows [Policy configuration service provider (CSP)](/windows/client-management/mdm/policy-configuration-service-provider) with any MDM solution.|
|[Microsoft Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-global-asr-rule-exclusions-in-microsoft-configuration-manager)|Uses the Microsoft Defender Antivirus policy in the **Assets and compliance** workspace.|
|[Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-group-policy)|Use Centralized Group Policy to configure and distribute ASR rules to domain-joined devices. Or you can configure Group Policy locally on individual devices.|
|[PowerShell](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-powershell)|Configure ASR rules locally on individual devices. PowerShell support all ASR rules.|

## File and folder exclusions for ASR rules

> [!IMPORTANT]
> Excluding files or folders can severely reduce ASR rule protection. Excluded files are allowed to run, and no reports or events about the file are recorded. If ASR rules detect files that shouldn't be detected, [use Audit mode to test the rule](attack-surface-reduction-rules-deployment-test.md#step-1-test-attack-surface-reduction-rules-using-audit).

You can exclude specific **files** and **folders** from being evaluated by ASR rules. Even if an ASR rule determines the file or folder contains malicious behavior, it doesn't block the excluded files from running.

You can use the following methods to exclude files and folders from ASR rules:

- **Microsoft Defender Antivirus exclusions**: Not all ASR rules honor these exclusions. For more information about Microsoft Defender Antivirus exclusions, see [Configure custom exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md).

  > [!TIP]
  > All ASR rules honor **process** exclusions in Microsoft Defender Antivirus.

- **Global ASR rule exclusions**: These exclusions apply to all ASR rules. All ASR rule configuration methods also support configuring global ASR rule exclusions.
- **Per-ASR rule exclusions**: Assign different exclusions selectively to different ASR rules. Only the following ASR rule configuration methods also support configuring per-ASR rule exclusions:
  - [Group Policy](attack-surface-reduction-rules-configure.md#configure-per-asr-rule-exclusions-in-group-policy) (and the corresponding registry settings)
  - [Endpoint security policies in Microsoft Intune](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).
- **Indicators of compromise (IoCs)**: Most ASR rules honor IoCs for blocked files and blocked certificates. For more information about IoCs, see [Overview of indicators in Microsoft Defender for Endpoint](indicators-overview.md).

The enforcement of different types of exclusions for ASR rules is summarized in the following table:

|Rule name|Honors MDAV file and<br>folder exclusions|Honors global ASR<br>exclusions|Honors per‑ASR rule<br>exclusions|Honors IoCs for<br>files|Honors IoCs for<br>certificates|
|---|:---:|:---:|:---:|:---:|:---:|
|**Standard protection rules**||||||
|Block abuse of exploited vulnerable signed drivers (Device)|Y|Y|Y|Y|Y|
|Block credential stealing from the Windows local security authority subsystem|N|Y|Y|N|N|
|Block persistence through WMI event subscription|N|Y|Y|N|N|
|**Other ASR rules**||||||
|Block Adobe Reader from creating child processes|N|Y|Y|Y|Y|
|Block all Office applications from creating child processes|Y|Y|Y|Y|Y|
|Block executable content from email client and webmail|Y|Y|Y|Y|Y|
|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|Y|Y|Y|Y|Y|
|Block execution of potentially obfuscated scripts|Y|Y|Y|Y|Y|
|Block JavaScript or VBScript from launching downloaded executable content|Y|Y|Y|Y|Y|
|Block Office applications from creating executable content|N|Y|Y|Y|Y|
|Block Office applications from injecting code into other processes|N|Y|Y|N|N|
|Block Office communication application from creating child processes|N|Y|Y|Y|Y|
|Block process creations originating from PSExec and WMI commands|N|Y|Y|Y|Y|
|Block rebooting machine in Safe Mode|Y|Y|Y|Y|Y|
|Block untrusted and unsigned processes that run from USB|Y|Y|Y|Y|Y|
|Block use of copied or impersonated system tools|Y|Y|Y|Y|Y|
|Block Webshell creation for Servers|Y|Y|Y|Y|Y|
|Block Win32 API calls from Office macros|Y|Y|Y|Y|N|
|Use advanced protection against ransomware|Y|Y|Y|Y|Y|

When you add exclusions, keep these points in mind:

- Exclusion paths can use environment variables and wildcards. For more information, see [Use wildcards in the file name and folder path or extension exclusion lists](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists).

  > [!TIP]
  > Don't use **user** environment variables as wildcards in folder and process exclusions. Only use the following types of environment variables as wildcards:
  >
  > - System environment variables.
  > - Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.
  >
  > For a list of system environment variables, see [System environment variables](configure-extension-file-exclusions-microsoft-defender-antivirus.md#system-environment-variables).

  - Wildcards can't define a drive letter.
  - To exclude more than one folder in a path, use multiple instances of `\*\` to indicate multiple nested folders. For example, `c:\Folder\*\*\Test`.
  - Microsoft Configuration Manager supports wildcards (`*` or `?`).
  - To exclude a file that contains random characters (for example, from automated file generation), use `?` symbol. For example, `C:\Folder\fileversion?.docx`.
- Exclusions apply only when the application or service starts. For example, if you add an exclusion for an update service that's already running, the update service continues to trigger ASR rule detections until you restart the service.

## Policy conflicts in ASR rules

If the same device is assigned two different ASR rule policies, potential conflicts can occur based on the following elements:

- Whether the same ASR rules are assigned in different modes.
- Whether conflict management is in place.
- Whether the result is an error.

Nonconflicting ASR rules don't result in errors. The first rule is applied, and subsequent nonconflicting rules are merged into the policy.

If a [mobile device management (MDM) solution](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-any-mdm-solution-using-the-policy-csp) and [Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-group-policy) apply different ASR rule settings to the same device, the Group Policy settings take precedence.

For information about how ASR rule setting conflicts are handled for the available deployment methods in Microsoft Intune, see [Devices managed by Intune](/intune/intune-service/protect/endpoint-security-asr-policy#devices-managed-by-intune).

## Notifications and alerts for ASR rules

When an ASR rule in **Block** or **Warn** mode is triggered on a device, a notification is displayed on the device. You can customize the information in the notifications. For more information, see [Customize contact information in Windows Security](/windows/security/threat-protection/windows-defender-security-center/wdsc-customize-contact-information).

[Endpoint Detection and Response (EDR)](overview-endpoint-detection-response.md) alerts in Defender for Endpoint are generated when supported ASR rules are triggered.

For specific details about notification and alert functionality, see [Alerts and notifications from ASR rule actions](attack-surface-reduction-rules-reference.md#alerts-and-notifications-from-asr-rule-actions).

To view ASR alert activity in the Microsoft Defender portal and on devices in Windows Event Viewer, see [Monitor attack surface reduction (ASR) rule activity](attack-surface-reduction-rules-monitor.md)

<a name='review-attack-surface-reduction-events-in-the-microsoft-365-defender-portal'></a>

## Monitor ASR rule activity

For complete information, see [Monitor attack surface reduction (ASR) rule activity](attack-surface-reduction-rules-monitor.md)

## See also

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction (ASR) rules](attack-surface-reduction-rules-deployment-implement.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Monitor attack surface reduction (ASR) rule activity](attack-surface-reduction-rules-monitor.md)
- [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
