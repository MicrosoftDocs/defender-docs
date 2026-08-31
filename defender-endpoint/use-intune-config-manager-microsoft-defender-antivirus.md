---
title: Configure Microsoft Defender Antivirus using Microsoft Intune
description: Learn how to use Microsoft Intune to configure Microsoft Defender Antivirus policies, including catch-up scan behavior, on managed Windows devices.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.date: 08/21/2026
ms.reviewer: phuijbr, yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure Microsoft Defender Antivirus settings in Intune so that managed Windows devices use the intended protection settings.
---

# Configure Microsoft Defender Antivirus using Microsoft Intune

Security administrators can use Microsoft Intune to configure Microsoft Defender Antivirus on managed Windows devices. This article explains how to create an antivirus policy and describes the available policy settings, values, defaults, and recommended configurations.

<a name="compatibility"></a>
## Supported platforms and Intune compatibility

You can manage Microsoft Defender Antivirus through Intune on the following platforms:

- Windows devices enrolled in Intune
- Windows Server devices managed through [Microsoft Defender for Endpoint security settings management](/intune/intune-service/protect/mde-security-integration)

You can configure Microsoft Defender Antivirus settings by using [Microsoft Intune](/intune/intune-service/fundamentals/what-is-intune) or [Configuration Manager](/intune/configmgr/core/understand/introduction).

> [!IMPORTANT]
> [Windows 10 reached end of support](/lifecycle/announcements/windows-10-end-of-support) on October 14, 2025. Windows 10 devices can still enroll in Intune and use eligible features, but functionality isn't guaranteed and can vary.

> [!NOTE]
> Microsoft Intune is a separate product from Microsoft Defender for Endpoint and isn't included in every subscription. You need a subscription that includes Intune, or you can buy Intune as a standalone subscription or add-on. For licensing details, see [Microsoft Intune licensing](/intune/intune-service/fundamentals/licenses). If you don't use Intune, see [Reference articles for management and configuration tools](configuration-management-reference-microsoft-defender-antivirus.md) for other ways to configure Microsoft Defender Antivirus.

<a name="configure-microsoft-defender-antivirus-settings-in-intune"></a>

## Configure Microsoft Defender Antivirus settings in Intune

Create an antivirus policy by following <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). Use the following settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Basics**: Enter a name and optional description for the policy.
- **Configuration settings**: Expand each group of settings, and configure the settings you want to manage with this policy. For descriptions of the available settings and options, see [Policies and settings](#policies-and-settings).
- **Scope tags**: If your organization uses [scope tags](/intune/intune-service/fundamentals/scope-tags), select the tags you want to use.
- **Assignments**: Select the users or groups to receive this policy. For more information, see [Assign policies in Microsoft Intune](/intune/intune-service/configuration/device-profile-assign).

For more information, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

## Policies and settings

The following sections list the Microsoft Defender Antivirus policy settings that you can configure in Intune. Each entry includes a configuration service provider (CSP) reference and the available options.

### Allow Archive Scanning

CSP: [AllowArchiveScanning](/windows/client-management/mdm/policy-csp-defender#allowarchivescanning)

Use this setting to configure scans for malicious software in archive files, such as ZIP or CAB files.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus scans archive files. Device users can disable archive scanning.
- **Not allowed**: Archive files aren't scanned during regular scans but are scanned during directed scans.
- **Allowed**: Archive files are scanned. This option is recommended.

Changes to this setting don't apply when tamper protection is enabled.

### Allow behavior monitoring

CSP: [AllowBehaviorMonitoring](/windows/client-management/mdm/policy-csp-defender#allowbehaviormonitoring)

Use this setting to configure behavior monitoring.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus enables real-time behavior monitoring.
- **Not allowed**: Behavior monitoring is disabled.
- **Allowed**: Real-time behavior monitoring is enabled. This option is recommended.

Changes to this setting don't apply when tamper protection is enabled.

### Turn on cloud-delivered protection

CSP: [AllowCloudProtection](/windows/client-management/mdm/policy-csp-defender#allowcloudprotection)

> [!IMPORTANT]
> Microsoft recommends that you [keep cloud protection turned on](enable-cloud-protection-microsoft-defender-antivirus.md) because certain Microsoft Defender for Endpoint features work only when cloud protection is enabled.

This setting controls membership in Microsoft Active Protection Service (MAPS). MAPS is an online service that helps determine how to respond to potential threats and stop the spread of new malware.

Information about items detected on the device is automatically collected and sent to Microsoft.

The following information is collected about detected malware, spyware, and potentially unwanted software:

- The source of the software.
- The actions that you or Microsoft Defender Antivirus apply, and whether the actions succeed.
- The location of the software.
- File names.
- How the software operates.
- The effect of the software on the device.

<a name="settings"></a>
#### Cloud-delivered protection options

The following options are available for cloud-delivered protection:

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus turns on cloud-delivered protection.
- **Not allowed**: Cloud-delivered protection is turned off.
- **Allowed**: Cloud-delivered protection is turned on.

Changes to this setting don't apply when tamper protection is enabled.

### Allow email scanning

CSP: [AllowEmailScanning](/windows/client-management/mdm/policy-csp-defender#allowemailscanning)

Use this setting to configure email scanning. When email scanning is enabled, Microsoft Defender Antivirus parses supported mailbox and email files during on-demand and scheduled scans. Supported formats include DBX, MBX, and MIME. Non-Unicode PST files from Outlook 2003 or earlier can also be scanned, but detected threats inside PST files can't be remediated. Modern email clients don't support email scanning.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus turns off email scanning.
- **Not allowed**: Email scanning is turned off.
- **Allowed**: Email scanning is turned on. This option is recommended.

### Allow Full Scan On Mapped Network Drives

CSP: [AllowFullScanOnMappedNetworkDrives](/windows/client-management/mdm/policy-csp-defender#allowfullscanonmappednetworkdrives)

Use this setting to configure scans of mapped network drives.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus doesn't scan mapped network drives.
- **Not allowed**: Mapped network drives aren't scanned.
- **Allowed**: Mapped network drives are scanned.

### Allow Full Scan Removable Drive Scanning

CSP: [AllowFullScanRemovableDriveScanning](/windows/client-management/mdm/policy-csp-defender#allowfullscanremovabledrivescanning)

Use this setting to control whether full scans check removable drives, such as USB flash drives, for malware and unwanted software.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus doesn't check removable drives during full scans. Quick and custom scans might still check removable drives.
- **Not allowed**: Full scans don't check removable drives, but quick and custom scans might.
- **Allowed**: All scan types check removable drives. This option is recommended.

### Allow scanning of all downloaded files and attachments

CSP: [AllowIOAVProtection](/windows/client-management/mdm/policy-csp-defender#allowioavprotection)

Use this setting to configure scanning of downloaded files and attachments.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus scans all downloaded files and attachments.
- **Not allowed**: Downloaded files and attachments aren't scanned.
- **Allowed**: Downloaded files and attachments are scanned. This option is recommended.

Changes to this setting don't apply when tamper protection is enabled.

### Allow Real-Time Monitoring

CSP: [AllowRealtimeMonitoring](/windows/client-management/mdm/policy-csp-defender#allowrealtimemonitoring)

Use this setting to enable or disable Microsoft Defender Antivirus real-time monitoring.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus runs the real-time monitoring service.
- **Not allowed**: The real-time monitoring service is turned off.
- **Allowed**: The real-time monitoring service is turned on. This option is recommended.

Changes to this setting don't apply when tamper protection is enabled.

### Allow Scanning Network Files

CSP: [AllowScanningNetworkFiles](/windows/client-management/mdm/policy-csp-defender#allowscanningnetworkfiles)

Use this setting to configure scheduled and on-demand scans of files accessed over the network.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus scans network files.
- **Not allowed**: Network files aren't scanned.
- **Allowed**: Network files are scanned. This option is recommended.

### Allow Script Scanning

CSP: [AllowScriptScanning](/windows/client-management/mdm/policy-csp-defender#allowscriptscanning)

Use this setting to enable or disable Microsoft Defender Antivirus script scanning.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus allows script scanning.
- **Not allowed**: Script scanning is disabled.
- **Allowed**: Script scanning and the [Antimalware Scan Interface](amsi-on-mdav.md) are enabled. This option is recommended.

Changes to this setting don't apply when tamper protection is enabled.

### Allow User UI Access

CSP: [AllowUserUIAccess](/windows/client-management/mdm/policy-csp-defender#allowuseruiaccess)

Use this setting to control whether device users can access the Microsoft Defender user interface and notifications.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus allows access to the user interface and notifications.
- **Not allowed**: Device users can't access the user interface, and notifications are suppressed.
- **Allowed**: Device users can access the user interface and receive notifications. This option is recommended.

### Avg CPU Load Factor

CSP: [AvgCPULoadFactor](/windows/client-management/mdm/policy-csp-defender#avgcpuloadfactor)

Use this setting to specify the maximum CPU load factor for Microsoft Defender Antivirus scans.

- **Not configured**: The policy doesn't set a value. By default, the maximum CPU load factor in Microsoft Defender Antivirus is 50%.
- **[0-100]**: Set the target maximum average CPU use for scans. The value is guidance for the scanning engine, not a hard limit. Values of 0 or 100 disable CPU throttling. Manual scans ignore this setting.

### Archive Max Depth

CSP: [ArchiveMaxDepth](/windows/client-management/mdm/defender-csp#configurationarchivemaxdepth)

Use this setting to specify the maximum folder depth to extract from archive files for scanning.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus extracts all archives to the deepest folder for scanning.
- **[0-4294967295]**: Archives are extracted to the folder depth specified in the policy.

### Archive Max Size

CSP: [ArchiveMaxSize](/windows/client-management/mdm/defender-csp#configurationarchivemaxsize)

Use this setting to specify the maximum size, in KB, of archive files to extract and scan.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus extracts and scans all archives regardless of size.
- **[0-4294967295]**: Archives smaller than the specified maximum size are extracted and scanned.

### Check For Signatures Before Running Scan

CSP: [CheckForSignaturesBeforeRunningScan](/windows/client-management/mdm/policy-csp-defender#checkforsignaturesbeforerunningscan)

Use this setting to control whether Microsoft Defender Antivirus checks for new security intelligence before a scheduled scan.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus starts the scan with the existing security intelligence.
- **Disabled**: The scan starts with the existing security intelligence.
- **Enabled**: Microsoft Defender Antivirus checks for new security intelligence before starting the scan. This option is recommended.

### Cloud Block Level

CSP: [CloudBlockLevel](/windows/client-management/mdm/policy-csp-defender#cloudblocklevel)

> [!IMPORTANT]
> Enable **Allow cloud protection** before you configure this setting.

This policy setting controls the level of intensity that Microsoft Defender Antivirus uses when blocking and scanning suspicious files.

- **Not configured**: The policy doesn't set a value. By default, the Microsoft Defender Antivirus blocking level is `0x0`.
- **(0x0) Default state**: Use the default Microsoft Defender Antivirus blocking level.
- **(0x2) High**: Aggressively block unknown files while optimizing client performance. This option increases the chance of false positives and is recommended.
- **(0x4) High Plus**: Aggressively block unknown files and apply more protection measures. This option might affect client performance.
- **(0x6) Zero Tolerance**: Block all unknown executable files.

Changes to this setting don't apply when tamper protection is enabled.

<a name="cloud-extended-time-out"></a>

### Cloud Extended Timeout

CSP: [CloudExtendedTimeout](/windows/client-management/mdm/policy-csp-defender#cloudextendedtimeout)

Use this setting to extend the time that Microsoft Defender Antivirus blocks a suspicious file while scanning it in the cloud. The default cloud-check timeout is 10 seconds. You can add up to 50 seconds for a maximum timeout of 60 seconds.

- **Not configured**: The policy doesn't set a value. By default, the Microsoft Defender Antivirus cloud-check timeout is 10 seconds.
- **[0-50]**: Add the specified number of seconds to the default timeout. The recommended value is 50.

### Days To Retain Cleaned Malware

CSP: [DaysToRetainCleanedMalware](/windows/client-management/mdm/policy-csp-defender#daystoretaincleanedmalware)

Use this setting to specify how many days to keep items in quarantine before removing them.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus keeps items in quarantine for 90 days.
- **0**: Items remain in quarantine indefinitely and aren't removed automatically.
- **[1-90]**: Items are removed from quarantine after the specified number of days.

### Disable Catchup Full Scan

CSP: [DisableCatchupFullScan](/windows/client-management/mdm/policy-csp-defender#disablecatchupfullscan)

Use this setting to control whether catch-up full scans run after missed scheduled full scans. Because the setting name begins with **Disable**, enabling the setting disables catch-up full scans, and disabling the setting enables them.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus disables catch-up full scans.
- **Disabled**: Catch-up full scans are enabled. If a device misses two consecutive scheduled full scans, a catch-up full scan starts the next time someone signs in. Catch-up scans require a configured scheduled scan.
- **Enabled (Default)**: Catch-up full scans are disabled.

### Disable Catchup Quick Scan

CSP: [DisableCatchupQuickScan](/windows/client-management/mdm/policy-csp-defender#disablecatchupquickscan)

Use this setting to control whether catch-up quick scans run after missed scheduled quick scans. Because the setting name begins with **Disable**, enabling the setting disables catch-up quick scans, and disabling the setting enables them.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus disables catch-up quick scans.
- **Disabled**: Catch-up quick scans are enabled. If a device misses two consecutive scheduled quick scans, a catch-up quick scan starts the next time the device powers on or resumes from sleep or hibernation. Catch-up scans require a configured scheduled scan.
- **Enabled (Default)**: Catch-up quick scans are disabled.

### Enable Low CPU Priority

CSP: [EnableLowCPUPriority](/windows/client-management/mdm/policy-csp-defender#enablelowcpupriority)

Use this setting to control whether scheduled scans use low CPU priority.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus doesn't change the CPU priority for scheduled scans.
- **Disabled**: The CPU priority for scheduled scans isn't changed.
- **Enabled**: Scheduled scans use low CPU priority.

### Enable Network Protection

CSP: [EnableNetworkProtection](/windows/client-management/mdm/policy-csp-defender#enablenetworkprotection)

Use this setting to configure network protection, which prevents applications from accessing dangerous domains that might host phishing scams, exploits, or other malicious content.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus doesn't block users or applications from connecting to dangerous domains.
- **Disabled**: Users and applications aren't blocked from connecting to dangerous domains.
- **Enabled (block mode)**: Users and applications are blocked from accessing dangerous domains. This option is recommended.
- **Enabled (audit mode)**: Users and applications can access dangerous domains. Events that network protection would block in block mode are recorded in the event log.

### Excluded Extensions

CSP: [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions)

Use this setting to specify file extensions to exclude from scans. For more information, see [Exclusions based on file extension and folder location](microsoft-defender-antivirus-exclusions-configure.md).

### Excluded Paths

CSP: [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths)

Use this setting to specify directory paths to exclude from scans. For more information, see [Exclusions based on file extension and folder location](microsoft-defender-antivirus-exclusions-configure.md).

### Excluded Processes

CSP: [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses)

Use this setting to specify files that processes can open without being scanned. For more information, see [Exclusions based on file extension and folder location](microsoft-defender-antivirus-exclusions-configure.md).

> [!NOTE]
> When tamper protection is turned on, existing exclusions can't be changed and new exclusions can't be added unless they [meet the conditions for tamper protection](manage-tamper-protection-intune.md).

> [!IMPORTANT]
> Defining exclusions reduces the protection provided by Microsoft Defender Antivirus. Assess the risks before you create exclusions, and apply them only to devices where they're needed. If an exclusion isn't needed on all devices, use the **Microsoft Defender Antivirus exclusions** policy type and assign it only to the specific groups that require the exclusion.

### PUA Protection

CSP: [PUAProtection](/windows/client-management/mdm/policy-csp-defender#puaprotection)

Use this setting to configure detection of potentially unwanted applications (PUAs). You can block, audit, or allow potentially unwanted software when it's downloaded or attempts to install on a device.

- **Not configured**: The policy doesn't set a value. The Microsoft Defender Antivirus default depends on the Windows version, security intelligence version, Smart App Control availability, and whether the device is onboarded to Defender for Endpoint. For details, see [Default PUA protection settings](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md#microsoft-defender-antivirus-and-pua-protection).
- **Disabled**: PUA protection is turned off, and potentially unwanted software isn't blocked.
- **Block**: PUA protection is turned on, and potentially unwanted software is blocked. This option is recommended.
- **Audit mode**: Potentially unwanted software isn't blocked. Events that PUA protection would block in block mode are recorded in the event log.

### Real Time Scan Direction

CSP: [RealTimeScanDirection](/windows/client-management/mdm/policy-csp-defender#realtimescandirection)

Use this setting to configure monitoring of incoming and outgoing files without disabling monitoring entirely. This setting is useful for servers with high volumes of file activity when scanning must be disabled in one direction to maintain performance. Evaluate the appropriate configuration based on the server role.

This configuration applies only to NTFS volumes. Microsoft Defender Antivirus enforces full monitoring of file and program activity on other file-system types.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus monitors incoming and outgoing files.
- **Monitor all files (bi-directional)**: Scan incoming and outgoing files. This option is the default.
- **Monitor incoming files**: Scan incoming files only.
- **Monitor outgoing files**: Scan outgoing files only.

### Scan Parameter

CSP: [ScanParameter](/windows/client-management/mdm/policy-csp-defender#scanparameter)

Use this setting to specify the scan type for scheduled scans. This setting interacts with **Schedule Scan Day** and **Schedule Scan Time**.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus uses quick scans.
- **Quick Scan (default)**: Microsoft Defender Antivirus runs a scheduled quick scan.
- **Full Scan**: Microsoft Defender Antivirus runs a scheduled full scan.

### Schedule Quick Scan Time

CSP: [ScheduleQuickScanTime](/windows/client-management/mdm/policy-csp-defender#schedulequickscantime)

Use this setting to specify the time of day for a daily quick scan. Enter the number of minutes after midnight. This setting doesn't interact with **Scan Parameter**, **Schedule Scan Day**, or **Schedule Scan Time**.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus doesn't run the daily quick scan controlled by this setting.
- **[0-1380]**: The daily quick scan runs at the specified time.

### Schedule Scan Day

CSP: [ScheduleScanDay](/windows/client-management/mdm/policy-csp-defender#schedulescanday)

Use this setting to specify the day of the week for a scheduled scan. You can also configure the scan to run every day or not run. This setting interacts with [**Scan Parameter**](#scan-parameter), which controls the scan type, and **Schedule Scan Time**.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus runs scheduled scans every day.
- **Every day (default)**: A scheduled scan runs daily.
- **Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday**: A scheduled scan runs once per week on the selected day.
- **No scheduled scan**: A scheduled scan doesn't run.

### Schedule Scan Time

CSP: [ScheduleScanTime](/windows/client-management/mdm/policy-csp-defender#schedulescantime)

Use this setting to specify the time of day for a scheduled scan. Enter the number of minutes after midnight. The default value is 120 minutes, which corresponds to 2:00 AM. This setting interacts with **Scan Parameter** and **Schedule Scan Day**.

- **Not configured**: The policy doesn't set a value. By default, the Microsoft Defender Antivirus scan time is 2:00 AM.
- **[0-1380]**: A scheduled scan runs at the specified time.

### Signature Update Fallback Order

CSP: [SignatureUpdateFallbackOrder](/windows/client-management/mdm/policy-csp-defender#signatureupdatefallbackorder)

Use this setting to specify the order in which security intelligence update sources are contacted. Enter a pipe-separated string that lists the sources in the desired order. Available values include `InternalDefinitionUpdateServer`, `MicrosoftUpdateServer`, `MMPC`, and `FileShares`.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus contacts security intelligence update sources in the default order.
- **Enabled**: Security intelligence update sources are contacted in the specified order.

### Signature Update File Shares Sources

CSP: [SignatureUpdateFileSharesSources](/windows/client-management/mdm/policy-csp-defender#signatureupdatefilesharessources)

Use this setting to configure Universal Naming Convention (UNC) file-share sources for security intelligence updates. Enter a pipe-separated string that lists the sources in the order in which Microsoft Defender Antivirus should contact them.

- **Not configured**: The policy doesn't set a value. By default, the Microsoft Defender Antivirus source list is empty, and no file-share sources are contacted.
- **Enabled**: The specified file-share sources are contacted in order.

### Signature Update Interval

CSP: [SignatureUpdateInterval](/windows/client-management/mdm/policy-csp-defender#signatureupdateinterval)

Use this setting to specify the number of hours between checks for security intelligence updates. The default interval is eight hours.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus checks for updates every eight hours.
- **0**: Microsoft Defender Antivirus doesn't run scheduled checks for new security intelligence.
- **[1-24]**: Microsoft Defender Antivirus checks for updates at the specified interval. The recommended value is 4.

### Submit Samples Consent

CSP: [SubmitSamplesConsent](/windows/client-management/mdm/policy-csp-defender#submitsamplesconsent)

Use this setting to configure sample submission when MAPS telemetry is enabled.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus sends safe samples automatically.
- **Always prompt**: Device users are prompted for consent before files are submitted.
- **Send safe samples automatically**: Files that typically don't contain personally identifiable information (PII), such as `.bat`, `.scr`, `.dll`, and `.exe` files, are sent automatically. Device users are prompted before files that might contain PII are submitted.
- **Never send**: File samples aren't sent. This option prevents block at first sight based on file-sample analysis. Detection metadata is still sent.
- **Send all samples automatically**: All samples are sent automatically. This option is recommended.

### Disable Local Admin Merge

CSP: [DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp#configurationdisablelocaladminmerge)

When this setting is disabled, local administrators can [configure local policy overrides for Microsoft Defender Antivirus](configure-local-policy-overrides-microsoft-defender-antivirus.md) by using the Windows Security app, Local Group Policy Editor, or PowerShell cmdlets, where supported.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus enables local administrator merge.
- **Enable local admin merge (default)**: Unique preference items configured by a local administrator are merged into the effective policy. If settings conflict, managed Intune policy settings override local preferences.
- **Disable local admin merge**: Only settings defined by management are used in the effective policy. Managed settings override local preferences. This option is recommended.

### Allow On Access Protection

CSP: [AllowOnAccessProtection](/windows/client-management/mdm/policy-csp-defender#allowonaccessprotection)

Use this setting to configure monitoring of file and program activity.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus monitors file and program activity.
- **Allowed**: File and program activity is monitored.
- **Not allowed**: File and program activity isn't monitored.

Changes to this setting don't apply when tamper protection is enabled.

### Threat Severity Default Action

CSP: [ThreatSeverityDefaultAction](/windows/client-management/mdm/policy-csp-defender#threatseveritydefaultaction)

Use this setting to customize the automatic remediation action for each threat alert level.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus applies the action specified in the security intelligence update.
- **Clean**: Attempt to recover and disinfect files.
- **Quarantine**: Move files to quarantine.
- **Remove**: Remove files from the device.
- **Allow**: Allow the file without taking another action.
- **User defined**: Let the device user select the action.
- **Block**: Block file execution.

Changes to this setting don't apply when tamper protection is enabled.

### Allow Network Protection Down Level

CSP: [AllowNetworkProtectionDownLevel](/windows/client-management/mdm/defender-csp#configurationallownetworkprotectiondownlevel)

Use this setting to control whether network protection can use block or audit mode on Windows versions earlier than RS3. When this setting is disabled, the **Enable Network Protection** value is ignored.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus disables network protection on earlier Windows versions.
- **Enabled**: Network protection is enabled on earlier Windows versions.
- **Disabled**: Network protection is disabled on earlier Windows versions.

### Allow Datagram Processing On Win Server

CSP: [AllowDatagramProcessingOnWinServer](/windows/client-management/mdm/defender-csp#configurationallowdatagramprocessingonwinserver)

Use this setting to control whether network protection can enable datagram processing on Windows Server. When this setting is disabled, the **Disable Datagram Processing** value is ignored, and datagram inspection is disabled.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus disables datagram processing on Windows Server.
- **Enabled**: Datagram processing is enabled on Windows Server.
- **Disabled**: Datagram processing is disabled on Windows Server.

### Disable Dns Over Tcp Parsing

CSP: [DisableDnsOverTcpParsing](/windows/client-management/mdm/defender-csp#configurationdisablednsovertcpparsing)

Use this setting to disable DNS over TCP parsing for network protection.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus enables DNS over TCP parsing.
- **Enabled**: DNS over TCP parsing is disabled.
- **Disabled**: DNS over TCP parsing is enabled.

### Disable Http Parsing

CSP: [DisableHttpParsing](/windows/client-management/mdm/defender-csp#configurationdisablehttpparsing)

Use this setting to disable HTTP parsing for network protection.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus enables HTTP parsing.
- **Enabled**: HTTP parsing is disabled.
- **Disabled**: HTTP parsing is enabled.

### Disable Ssh Parsing

CSP: [DisableSshParsing](/windows/client-management/mdm/defender-csp#configurationdisablesshparsing)

Use this setting to disable Secure Shell (SSH) parsing for network protection.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus enables SSH parsing.
- **Enabled**: SSH parsing is disabled.
- **Disabled**: SSH parsing is enabled.

### Disable Tls Parsing

CSP: [DisableTlsParsing](/windows/client-management/mdm/defender-csp#configurationdisabletlsparsing)

Use this setting to disable Transport Layer Security (TLS) parsing for network protection.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus enables TLS parsing.
- **Enabled**: TLS parsing is disabled.
- **Disabled**: TLS parsing is enabled.

### Engine Updates Channel

CSP: [EngineUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationengineupdateschannel)

Use this setting to specify when devices receive Microsoft Defender Antivirus engine updates during the monthly gradual rollout.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus keeps devices up to date automatically during the gradual rollout. This option is suitable for most devices.
- **Beta Channel**: Devices receive updates first. Use this channel on a limited number of test devices to identify and report issues to Microsoft. Devices in the Windows Insider Program use this channel by default.
- **Current Channel (Preview)**: Devices receive updates early in the monthly gradual rollout. This channel is recommended for preproduction or validation environments.
- **Current Channel (Staged)**: Devices receive updates after the early rollout stages. Apply this channel to a small, representative group of production devices, such as 10%.
- **Current Channel (Broad)**: Devices receive updates after the gradual rollout is complete. Apply this channel broadly to production devices.
- **Critical - Time delay**: Devices receive updates after a 48-hour delay. Use this channel only for critical environments.

### Metered Connection Updates

CSP: [MeteredConnectionUpdates](/windows/client-management/mdm/defender-csp#configurationmeteredconnectionupdates)

Use this setting to control whether managed devices can get updates through metered connections.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus doesn't allow updates through metered connections.
- **Allowed**: Managed devices can get updates through metered connections.
- **Not allowed**: Managed devices can't get updates through metered connections.

### Platform Updates Channel

CSP: [PlatformUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationplatformupdateschannel)

Use this setting to specify when devices receive Microsoft Defender Antivirus platform updates during the monthly gradual rollout.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus keeps devices up to date automatically during the gradual rollout. This option is suitable for most devices.
- **Beta Channel**: Devices receive updates first. Use this channel on a limited number of test devices to identify and report issues to Microsoft. Devices in the Windows Insider Program use this channel by default.
- **Current Channel (Preview)**: Devices receive updates early in the monthly gradual rollout. This channel is recommended for preproduction or validation environments.
- **Current Channel (Staged)**: Devices receive updates after the early rollout stages. Apply this channel to a small, representative group of production devices, such as 10%.
- **Current Channel (Broad)**: Devices receive updates after the gradual rollout is complete. Apply this channel broadly to production devices.
- **Critical - Time delay**: Devices receive updates after a 48-hour delay. Use this channel only for critical environments.

### Security Intelligence Updates Channel

CSP: [SecurityIntelligenceUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationsecurityintelligenceupdateschannel)

Use this setting to specify when devices receive Microsoft Defender Antivirus security intelligence updates during the daily gradual rollout.

- **Not configured**: The policy doesn't set a value. By default, Microsoft assigns the device to **Current Channel (Broad)** or to a beta channel early in the gradual rollout. A beta channel might not be suitable for production or critical devices.
- **Current Channel (Staged)**: Use the same rollout timing as **Current Channel (Broad)**.
- **Current Channel (Broad)**: Devices receive updates after the gradual rollout is complete. Apply this channel broadly, including to production devices.

### Randomize Schedule Task Times

CSP: [RandomizeScheduleTaskTimes](/windows/client-management/mdm/defender-csp#configurationrandomizescheduletasktimes)

Use this setting to randomize scan start times across an interval from 0 through 23 hours. Randomization can help distribute resource use in virtual machine or virtual desktop infrastructure (VDI) deployments.

- **Not configured**: The policy doesn't set a value. By default, Microsoft Defender Antivirus randomizes scheduled tasks.
- **Widen or narrow the randomization period for scheduled scans (Default)**: Use **Scheduler Randomization Time** to specify a randomization window from 1 through 23 hours.
- **Scheduled tasks won't be randomized**: Scheduled tasks run without randomization.

### Scheduler Randomization Time

CSP: [SchedulerRandomizationTime](/windows/client-management/mdm/defender-csp#configurationschedulerrandomizationtime)

Use this setting to configure the scheduler randomization interval in hours.

- **Not configured**: The policy doesn't set a value. By default, the Microsoft Defender Antivirus randomization interval is four hours.
- **[1-23]**: Scheduled tasks are randomized across the specified number of hours.

### Disable Core Service ECS Integration

CSP: [DisableCoreServiceECSIntegration](/windows/client-management/mdm/defender-csp#configurationdisablecoreserviceecsintegration)

Use this setting to control Experimentation and Configuration Service (ECS) integration for the Defender core service.

- **Not configured**: The policy doesn't set a value. By default, the Defender core service uses ECS.
- **The Defender core service will use the Experimentation and Configuration Service (ECS) to rapidly deliver critical, org-specific fixes**: ECS integration is enabled.
- **The Defender core service stops using the Experimentation and Configuration Service (ECS). Fixes will continue to be delivered through security intelligence updates.**: ECS integration is disabled.

### Disable Core Service Telemetry

CSP: [DisableCoreServiceTelemetry](/windows/client-management/mdm/defender-csp#configurationdisablecoreservicetelemetry)

Use this setting to control OneDsCollector telemetry for the Defender core service.

- **Not configured**: The policy doesn't set a value. By default, the Defender core service uses the OneDsCollector framework.
- **The Defender core service will use the OneDsCollector framework to rapidly collect telemetry**: OneDsCollector telemetry is enabled.
- **The Defender core service stops using the OneDsCollector framework to rapidly collect telemetry, impacting Microsoft's ability to quickly recognize and address poor performance, false positives, and other problems**: OneDsCollector telemetry is disabled.

> [!TIP]
>
> - For help managing endpoint security policies, see [Manage endpoint security in Microsoft Intune](/intune/intune-service/protect/endpoint-security).
>
> - For Microsoft Defender Antivirus information for other platforms, see:
>   - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
>   - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
>   - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
>   - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
>   - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
>   - [Configure Defender for Endpoint on Android features](android-configure.md)
>   - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
>
> - Microsoft Defender Antivirus, like other antivirus software, can affect endpoint performance. Use the Microsoft Defender Antivirus performance analyzer to identify files, paths, processes, and file extensions that might cause performance problems. The analyzer reports:
>   - Top paths that affect scan time
>   - Top files that affect scan time
>   - Top processes that affect scan time
>   - Top file extensions that affect scan time
>   - Combinations, for example:
>     - Top files per extension
>     - Top paths per extension
>     - Top processes per path
>     - Top scans per file
>     - Top scans per file per process
>
>   Use the results to assess performance issues and select remediation actions. For more information, see [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

<a name="related-articles"></a>
## Related content

- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Reference articles for management and configuration tools](configuration-management-reference-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)
