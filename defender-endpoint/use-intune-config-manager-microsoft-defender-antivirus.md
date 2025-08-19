---
title: Configure Microsoft Defender Antivirus using Microsoft Intune
description: Use Microsoft Intune to configure Microsoft Defender Antivirus and Endpoint Protection
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 05/07/2025
ms.reviewer: phuijbr, yongrhee
manager: deniseb
ms.subservice: ngp
audience: ITPro
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Use Microsoft Intune to configure and manage Microsoft Defender Antivirus

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- Microsoft Defender Antivirus

## Compatibility

- Microsoft Defender Antivirus using Intune is available on the following platforms:
- Windows 10 and later

You can use the Microsoft Intune family of products to configure Microsoft Defender Antivirus settings, like [Microsoft Intune](/mem/intune/fundamentals/what-is-intune) and [Configuration Manager](/mem/configmgr/core/understand/introduction).

### Configure Microsoft Defender Antivirus settings in Intune

1. Go to the Microsoft Intune admin center ([https://intune.microsoft.com](https://intune.microsoft.com)), and sign in.

2. Navigate to **Endpoint Security**.

3. Under **Manage**, choose **Antivirus**.

4. Click **Create Policy**, choose **Windows** as the platform and **Microsoft Defender Antivirus** for the profile type then select on **Create**.

5. Enter a **Name** for the policy and optionally a description and select **Next** to go to **Configuration settings**.

6. Edit your Microsoft Defender Antivirus settings.

7. Choose **Review + save**.

You can explore the list of settings that can be configured in a **Microsoft Defender Antivirus** policy within Intune.

## Policies and settings

### Allow Archive Scanning

  CSP: [AllowArchiveScanning](/windows/client-management/mdm/policy-csp-defender#allowarchivescanning)

  This policy setting enables you to configure scans for malicious software within archive files such as .ZIP or .CAB files.

  - **Not configured** - The setting reverts to the client default, which is to scan archived files. User can disable this setting.
  - **Not allowed** - Archive files aren't scanned, instead they're always scanned during directed scans.
  - **Allowed** - Enable scans of archive files. This is the recommended configuration.

  Changes to this setting aren't applied if tamper protection is enabled.

### Allow behavior monitoring

  CSP: [AllowBehaviorMonitoring](/windows/client-management/mdm/policy-csp-defender#allowbehaviormonitoring)

  This policy setting enables you to configure behavior monitoring.

  - **Not configured** - The setting reverts to the system default (real-time behavior monitoring is enabled).
  - **Not allowed** - The setting is disabled.
  - **Allowed** - Real-time behavior monitoring is enabled. This is the recommended configuration.

    Changes to this setting aren't applied if tamper protection is enabled.

### Turn on cloud-delivered protection

  CSP: [AllowCloudProtection](/windows/client-management/mdm/policy-csp-defender#allowcloudprotection)

> [!IMPORTANT]
>[We recommend keeping cloud protection turned on, because certain security features and capabilities in Microsoft Defender for Endpoint only work when cloud protection is enabled](./enable-cloud-protection-microsoft-defender-antivirus.md).

  This policy setting enables you to join Microsoft MAPS (Microsoft Active Protection Service). Microsoft MAPS is the online community that helps you choose how to respond to potential threats. The community also helps stop the spread of new malicious software infections.

  Information about the detected items on your computer is automatically collected and sent to Microsoft. 
  
  The following information is collected about any detected malicious software, spyware, and potentially unwanted software:
  
  - The source of the software
  - The actions you apply or that are applied automatically and their success,
  - The location of the software
  - File names
  - How the software operates
  - Its impact on your computer.

#### Settings:

  - **Not configured** - The setting reverts to the system default (cloud-delivered protection is turned off).
  - **Not allowed** - Cloud-delivered protection is turned off.
  - **Allowed** - Cloud-delivered protection is turned on.

   Changes to this setting won't be applied if tamper protection is enabled.

### Allow email scanning 

  CSP: [AllowEmailScanning](/windows/client-management/mdm/policy-csp-defender#allowemailscanning)

  This policy setting enables you to configure e-mail scanning. When e-mail scanning is enabled, the engine parses the mailbox and mail files, according to their specific format, in order to analyze the mail bodies and attachments. Several e-mail formats are currently supported, for example: pst (Outlook), dbx, mbx, mime (Outlook Express), binhex (Mac). Email scanning isn't supported on modern email clients.

  - **Not configured** - The setting reverts to the system default (turn off email scanning).
  - **Not allowed** - Turn off email scanning.
  - **Allowed** - Turn on email scanning. This is the recommended configuration.
  
### Allow Full Scan On Mapped Network Drives

  CSP: [AllowFullScanOnMappedNetworkDrives](/windows/client-management/mdm/policy-csp-defender#allowfullscanonmappednetworkdrives)

  This policy setting enables you to configure scanning mapped network drives.

  - **Not configured** - The setting reverts to the system default (mapped network drives won't be scanned).
  - **Not allowed** - Mapped network drives won't be scanned.
  - **Allowed** - Enable scans of mapped network drives.

### Allow Full Scan Removable Drive Scanning

  CSP: [AllowFullScanRemovableDriveScanning](/windows/client-management/mdm/policy-csp-defender#allowfullscanremovabledrivescanning)

  This policy setting enables you to manage whether or not to scan for malicious software and unwanted software in the contents of removable drives, such as USB flash drives, when running a full scan.

  - **Not configured** - The setting reverts to the system default (removable drives won't be scanned during a full scan but they might still be scanned during quick scan and custom scan).
  - **Not allowed** - Removable drives won't be scanned during a full scan but they might still be scanned during quick scan and custom scan.
  - **Allowed** - Removable drives are scanned during any type of scan. This is the recommended configuration.

### Allow scanning of all downloaded files and attachments
  CSP: [AllowIOAVProtection](/windows/client-management/mdm/policy-csp-defender#allowioavprotection)

  This policy setting enables you to configure scanning for all downloaded files and attachments.

  - **Not configured** - The setting reverts to the system default (scanning for all downloaded files and attachments are enabled).
  - **Not allowed** - Scanning for all downloaded files and attachments are disabled.
  - **Allowed** - Scanning for all downloaded files and attachments are enabled. This is the recommended configuration.

  Changes to this setting won't be applied if tamper protection is enabled.

### Allow Real-Time Monitoring
  CSP: [AllowRealtimeMonitoring](/windows/client-management/mdm/policy-csp-defender#allowrealtimemonitoring)

  Enables or disenables Windows Defender real-time Monitoring functionality.

  - **Not configured** - The setting reverts to the system default (turns on and runs the real-time monitoring service).
  - **Not allowed** - Turns off the real-time monitoring service.
  - **Allowed** - Turns on and runs the real-time monitoring service. This is the recommended configuration.

  Changes to this setting won't be applied if tamper protection is enabled.

### Allow Scanning Network Files
  CSP: [enablescanningNetworkFiles](/windows/client-management/mdm/policy-csp-defender#enablescanningnetworkfiles)

  This policy setting enables you to configure both scheduled scans and on-demand (manually initiated) scans for files accessed over the network.
  
  - **Not configured** - The setting reverts to the system default (network files is scanned).
  - **Not allowed** - Network files isn't scanned.
  - **Allowed** - Network files are scanned. This is the recommended configuration.

### Allow Script Scanning
  CSP: [enablescriptScanning](/windows/client-management/mdm/policy-csp-defender#enablescriptscanning)

  This policy setting enables or disables the Windows Defender Script Scanning functionality.
  
  - **Not configured** - The setting reverts to the system default (script scanning is allowed).
  - **Not allowed** - The setting is disabled, scripts won't be scanned.
  - **Allowed** - The setting is enabled, scripts are scanned(enables the [Anti-malware Scan Interface](amsi-on-mdav.md)). This is the recommended configuration.

  Changes to this setting aren't applied if the tamper protection setting is enabled.

### Allow User UI Access
  CSP: [AllowUserUIAccess](/windows/client-management/mdm/policy-csp-defender#allowuseruiaccess)

  This policy setting enables you to configure whether or not to display the Microsoft Defender app UI to the users.
  
  - **Not configured** - The setting reverts to the system default (the UI and notifications are allowed).
  - **Not allowed** - The setting is disabled. Prevents users from accessing UI and the notifications are suppressed.
  - **Allowed** - The setting is enabled. The users can access the Defender UI and notifications are allowed. This is the recommended configuration.

### Avg CPU Load Factor
  CSP: [AvgCPULoadFactor](/windows/client-management/mdm/policy-csp-defender#avgcpuloadfactor)

  This policy setting enables you to specify the maximum CPU load factor for the Defender scans.
  
  - **Not configured** - The setting reverts to the system default, where CPU utilization doesn't exceed the default value of 50%.
  - **[0-100]** - CPU utilization won't exceed the specified percentage. A value of 0 means there's no throttling of CPU utilization.
 
### Archive Max Depth
  CSP: [ArchiveMaxDepth](/windows/client-management/mdm/defender-csp#configurationarchivemaxdepth)

  This policy setting enables you to specify the maximum folder depth to extract from archive files for scanning.
  
  - **Not configured** - The setting reverts to the system default (all archives are extracted up to the deepest folder for scanning).
  - **[0-4294967295]** - All archives are extracted up to the depth specified in the policy.

### Archive Max Size 
   CSP: [ArchiveMaxSize](/windows/client-management/mdm/defender-csp#configurationarchivemaxsize)

  This policy setting enables you to specify the maximum size, in KB, of archive files to be extracted and scanned.
  
  - **Not configured** - The setting reverts to the system default, where all archives are extracted and scanned regardless of size.
  - **[0-4294967295]** - Archives are extracted and scanned if their size is smaller than the maximum size specified in the policy.

### Check For Signatures Before Running Scan 
   CSP: [CheckForSignaturesBeforeRunningScan](/windows/client-management/mdm/policy-csp-defender#checkforsignaturesbeforerunningscan)

  This policy setting allows you to manage whether a check for new virus and spyware security intelligence occurs before running a scan. This is only applicable to scheduled scans.
  
  - **Not configured** - The setting reverts to the system default, where the scan starts using the current security intelligence.
  - **Disabled** - The scan begins using the existing security intelligence.
  - **Enabled** - Before running a scan, the system checks for new security intelligence. This is the recommended configuration.
  
### Cloud Block Level
   CSP: [CloudBlockLevel](/windows/client-management/mdm/policy-csp-defender#cloudblocklevel)

This policy setting controls the level of intensity that Microsoft Defender Antivirus uses when blocking and scanning suspicious files. To use this feature, **Allow cloud protection** must be enabled
  
  - **Not configured** - The setting reverts to the system default blocking level (0x0).
  - **(0x0)Default state** - Default Microsoft Defender Antivirus blocking level.
  - **(0x2)High** - High blocking level - aggressively block unknowns while optimizing client performance (greater chance of false positives). This is the recommended configuration
  - **(0x4)High Plus** - High+ blocking level - aggressively block unknowns and apply other protection measures (might affect client performance).
  - **(0x6)Zero Tolerance** - Zero tolerance blocking level - block all unknown executables
  
    Changes to this setting aren't applied if tamper protection is enabled.

### Cloud Extended time-out 
   CSP: [CloudExtendedTimeout](/windows/client-management/mdm/policy-csp-defender#cloudextendedtimeout)

  This feature allows Microsoft Defender Antivirus to block a suspicious file for up to 60 seconds, and scan it in the cloud to make sure it's safe.
  
  The default cloud check time-out is 10 seconds. To enable this feature, specify the extended time in seconds. The maximum time-out is 50 seconds.
  
  - **Not configured** - The setting reverts to the system default (cloud time out is 10 seconds).
  - **[0-50]** - The cloud time out is extended with the specified amount. The recommended value is 50.

### Days To Retain Cleaned Malware 
   CSP: [DaysToRetainCleanedMalware](/windows/client-management/mdm/policy-csp-defender#daystoretaincleanedmalware)

  This policy setting defines the number of days items should be kept in the Quarantine folder before being removed.
  
  - **Not configured** - The setting reverts to the system default. Items are kept in the quarantine folder indefinitely and won't be automatically removed.
  - **[0-90]** - Items are removed from the Quarantine folder after the number of days specified.

### Disable Catchup Full Scan
   CSP: [DisableCatchupFullScan](/windows/client-management/mdm/policy-csp-defender#disablecatchupfullscan)

  This policy setting enables you to configure catch-up scans for scheduled full scans. A catch-up scan is a scan that's initiated because a regularly scheduled scan was missed. Usually these scheduled scans are missed because the computer was turned off at the scheduled time.
  
  - **Not configured** - The setting reverts to the system default.
  - **Disabled** - Catch-up scans for scheduled full scans are turned on. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone sign-ins the computer. If there's no scheduled scan configured, there's no catch-up scan run.
  - **Enabled** - Catch-up scans for scheduled full scans is disabled.

### Disable Catchup Quick Scan
   CSP: [DisableCatchupQuickScan](/windows/client-management/mdm/policy-csp-defender#disablecatchupquickscan)

  This policy setting allows you to configure catch-up scans for scheduled quick scans. A catch-up scan is a scan that's initiated because a regularly scheduled scan was missed. Usually these scheduled scans are missed because the computer was turned off at the scheduled time.
  
  - **Not configured** - The setting reverts to the system default (catch-up scans for scheduled quick scans is turned on).
  - **Disabled** - Catch-up scans for scheduled quick scans are turned on. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone sign-ins the computer. If there's no scheduled scan configured, there's no catch-up scan run.
  - **Enabled** - Catch-up scans for scheduled quick scans is disabled.

### Enable Low CPU Priority
   CSP: [EnableLowCPUPriority](/windows/client-management/mdm/policy-csp-defender#enablelowcpupriority)

  This policy setting enables you to enable or disable low CPU priority for scheduled scans.
  
  - **Not configured** - The setting  reverts to the system default, meaning no changes is made to CPU priority for scheduled scans.
  - **Disabled** - No change is made to CPU priority for scheduled scans.
  - **Enabled** - Low CPU priority is used during scheduled scans.

### Enable Network Protection
   CSP: [EnableNetworkProtection](/windows/client-management/mdm/policy-csp-defender#enablenetworkprotection)

  Enable or disable Microsoft Defender Exploit Guard network protection to prevent employees from using applications to access dangerous domains that might host phishing scams, exploit-hosting sites, and other malicious content on the internet.
  
  - **Not configured** - The setting reverts to the system default, meaning users and applications won't be blocked from connecting to dangerous domains.
  - **Disabled** - Users and applications aren't blocked from connecting to dangerous domains.
  - **Enabled(block mode)** - Users and applications won't be able to access dangerous domains. This is the recommended configuration.
  - **Enabled(audit mode)** - Users and applications can connect to dangerous domains. However, if this feature would have blocked access when set to **Block**, a record of the event will be logged in the event logs.

### Excluded Extensions

   CSP: [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions)

  Allows administrators to specify a list of file extensions to ignore during a scan. For more details on how these exclusions can be defined you can read this article: [Exclusions based on file extension and folder location](./configure-extension-file-exclusions-microsoft-defender-antivirus.md)

### Excluded Paths

   CSP: [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths)

  Allows administrators to specify a list of directory paths to ignore during a scan. For more details on how these exclusions can be defined you can read this article: [Exclusions based on file extension and folder location](./configure-extension-file-exclusions-microsoft-defender-antivirus.md)

### Excluded Processes  

   CSP: [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses)

  Allows administrators to specify a list of files that processes can open without being scanned. For more details on how these exclusions can be defined you can read this article: [Exclusions based on file extension and folder location](./configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)

> [!NOTE]
> When tamper protection is turned on the exclusions can't be modified and new exclusions can't be added. These exclusions need to [meet some conditions](./manage-tamper-protection-intune.md) for tamper protection to work.

> [!IMPORTANT]
> Defining exclusions reduces the protection provided by Microsoft Defender Antivirus.
> It's important to carefully assess the risks associated with implementing exclusions and only create them on devices where they're necessary.
> If an exclusion isn't needed on all devices, use the dedicated policy type **Microsoft Defender Antivirus exclusions** and assign the policy only to the specific group of devices or users that require it.

### PUA Protection

   CSP: [PUAProtection](/windows/client-management/mdm/policy-csp-defender#puaprotection)

  Enable or disable detection for potentially unwanted applications. You can choose to block, audit, or allow when potentially unwanted software is being downloaded or attempts to install itself on your computer.
  
  - **Not configured** - The setting reverts to the system default, meaning potentially unwanted software won't be blocked.
  - **Disabled** - PUA protection is off, meaning potentially unwanted software won't be blocked.
  - **Block** - PUA protection is on, meaning potentially unwanted software is blocked. This is the recommended configuration.
  - **Audit mode** - Potentially unwanted software won't be blocked. However, if this feature would have blocked access when set to **Block**, a record of the event will be logged in the event logs.

### Real Time Scan Direction  

   CSP: [RealTimeScanDirection](/windows/client-management/mdm/policy-csp-defender#realtimescandirection)

  This policy setting allows you to configure monitoring for incoming and outgoing files without disabling monitoring entirely. It's recommended for servers with high volumes of file activity, where scanning needs to be disabled for a specific direction to maintain performance. The appropriate configuration should be evaluated based on the server's role.

  This configuration is only applicable to NTFS volumes. For any other file system type, full monitoring of file and program activity will be enforced on those volumes.
  
  - **Not configured** - The setting reverts to the system default, meaning, monitoring for incoming and outgoing files are enabled.
  - **Monitor all files (bi-directional)** - Scan incoming and outgoing files (default)
  - **Monitor incoming files** - Scan incoming files only.
  - **Monitor outgoing files** - Scan outgoing files only.

### Scan Parameter

   CSP: [ScanParameter](/windows/client-management/mdm/policy-csp-defender#scanparameter)

  This policy setting allows you to specify the scan type used during a scheduled scan. This setting interacts with the settings **Schedule Scan Day** and **Schedule Scan Time**.

  - **Not configured** - The setting reverts to the system default.
  - **Quick Scan (default)** - Defender runs a scheduled quick scan.
  - **Full Scan** - Defender runs a scheduled full scan.

### Schedule Quick Scan Time

   CSP: [ScheduleQuickScanTime](/windows/client-management/mdm/policy-csp-defender#schedulequickscantime)

  This policy setting allows you to specify the time of day at which to perform a daily quick scan. The time value is represented as the number of minutes past midnights. This setting doesn't interact with the settings **Scan Parameter**, **Schedule Scan Day** and **Schedule Scan Time**.

  - **Not configured** - The setting reverts to the system default, meaning, the daily quick scan controlled by this config won't run.
  - **[0-1380]** - A daily quick scan runs at the time of day specified.

### Schedule Scan Day

   CSP: [ScheduleScanDay](/windows/client-management/mdm/policy-csp-defender#schedulescanday)

  This policy setting allows you to specify the day of the week to perform a scheduled scan. The scan can also be configured to run every day or to never run at all. This setting interacts with the settings **Scan Parameter** and **Schedule Scan Time**.

  - **Not configured** - The setting reverts to the system default.
  - **Every day (default)** - A scheduled scan runs daily.
  - **Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday** - A scheduled scan runs once per week on the selected day.
  - **No scheduled scan** - No scheduled scan runs.

### Schedule Scan Time

   CSP: [ScheduleScanTime](/windows/client-management/mdm/policy-csp-defender#schedulescantime)

  This policy setting allows you to specify the time of day to perform a scheduled scan. The time is represented as the number of minutes past midnights, with the default being 120 minutes (which corresponds to 2:00 AM). This setting interacts with the **Scan Parameter** and **Schedule Scan Day settings**.

  - **Not configured** - The setting reverts to the system default (a scheduled scan runs at a default time).
  - **[0-1380]** - A scheduled scan runs at the time of day specified.

### Signature Update Fallback Order

   CSP: [SignatureUpdateFallbackOrder](/windows/client-management/mdm/policy-csp-defender#signatureupdatefallbackorder)

  This policy setting allows you to specify the order in which different security intelligence update sources are contacted. Enter the value as a pipe-separated string, listing the security intelligence update sources in the desired order. Possible values include: "InternalDefinitionUpdateServer," "MicrosoftUpdateServer," "MMPC," and "FileShares."

  - **Not configured** - The setting reverts to the system default. Meaning, security intelligence update sources are contacted in a default order.
  - **Enabled** - Security intelligence update sources are contacted in the order specified.

### Signature Update File Shares Sources

   CSP: [SignatureUpdateFileSharesSources](/windows/client-management/mdm/policy-csp-defender#signatureupdatefilesharessources)

  This policy setting allows you to configure UNC file share sources for downloading security intelligence updates. Sources are contacted in the order specified. The value of this setting should be entered as a pipe-separated string enumerating the security intelligence update sources.

  - **Not configured** - The setting reverts to the system default. Meaning, the list remains empty by default and no sources are contacted.
  - **Enabled** - The specified sources are contacted for security intelligence updates.

### Signature Update Interval

   CSP: [SignatureUpdateInterval](/windows/client-management/mdm/policy-csp-defender#signatureupdateinterval)

  This policy setting allows you to specify an interval at which to check for security intelligence updates. The time value is represented as the number of hours between update checks. The default is 8h.

  - **Not configured** - The setting reverts to the system default. Meaning, it checks for security intelligence updates occur at the default interval.
  - **[0-24]** - Checks for security intelligence updates occur at the interval specified. The recommended value is 4.

### Submit Samples Consent

   CSP: [SubmitSamplesConsent](/windows/client-management/mdm/policy-csp-defender#submitsamplesconsent)

  This policy setting configures behavior of samples submission when opt-in for MAPS telemetry is set.

  - **Not configured** - The setting reverts to the system default which is to send safe samples automatically.
  - **Always prompt** - The user is always prompted for consent before file submission.
  - **Send safe samples automatically** - Safe samples are samples considered to not commonly contain PII data (examples include .bat, .scr, .dll, and .exe). If file is likely to contain PII, the user gets a request to allow file sample submission.
  - **Never send** - Prevents **block at first sight** based on file sample analysis. Metadata is sent for detections even if sample submission is disabled.
  - **Send all samples automatically** - All samples are sent automatically. This is the recommended configuration.

### Disable Local Admin Merge

   CSP: [DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp#configurationdisablelocaladminmerge)

  When this value is set to no, it gives a local admin the ability to [specify some settings](./configure-local-policy-overrides-microsoft-defender-antivirus.md) on their devices by using the Windows Security app, local Group Policy settings, or PowerShell cmdlets (where appropriate).

  - **Not configured** - The setting reverts to the system default.
  - **Enable local admin merge (default)** - Unique items defined in preference settings that are configured by a local administrator merge into the resulting effective policy. If there are conflicts, management settings from Intune policy override local preference settings.
  - **Disable local admin merge** - Only items defined by management are used in the resulting effective policy. Managed settings override preference settings that are configured by the local administrator. This is the recommended configuration.

### Allow On Access Protection

   CSP: [AllowOnAccessProtection](/windows/client-management/mdm/policy-csp-defender#allowonaccessprotection)

  This policy setting enables you to configure monitoring for file and program activity.

  - **Not configured** - The setting reverts to the system default which is to monitoring for file and program activity is enabled.
  - **Allowed** - Monitoring for file and program activity is enabled.
  - **Not allowed** - Monitoring for file and program activity is disabled.
 
  Changes to this setting aren't applied if tamper protection is enabled.

### Threat Severity Default Action

   CSP: [ThreatSeverityDefaultAction](/windows/client-management/mdm/policy-csp-defender#threatseveritydefaultaction)

  This policy setting allows you to customize the automatic remediation action for each threat alert level. The following lists contain the valid remediation actions:

  - **Not configured** - The setting reverts to the system default which is to apply action based on the update definition.
  - **Clean** - Service tries to recover files and tries to disinfect.
  - **Quarantine** - Moves files to quarantine.
  - **Remove** - Removes files from system.
  - **Allow** - enables the file and doesn't take other actions.
  - **User defined** - The device user makes the decision on which action to take.
  - **Block** - Blocks file execution.
 
  Changes to this setting aren't applied if tamper protection is enabled.
  
### Allow Network Protection Down Level

   CSP: [AllowNetworkProtectionDownLevel](/windows/client-management/mdm/defender-csp#configurationallownetworkprotectiondownlevel)

  This setting determines whether Network Protection is allowed to be configured into block or audit mode on Windows downlevel of RS3. If false, the value of EnableNetworkProtection is ignored.

  - **Not configured** - The setting reverts to the system default which is to network protection is disabled downlevel.
  - **Enabled** - Network protection is enabled downlevel.
  - **Disabled** - Network protection is disabled downlevel.

### Allow Datagram Processing On Win Server

   CSP: [AllowDatagramProcessingOnWinServer](/windows/client-management/mdm/defender-csp#configurationallowdatagramprocessingonwinserver)

  This setting determines whether Network Protection can enable datagram processing on Windows Server. If set to false, the value of DisableDatagramProcessing is ignored, and datagram inspection is disabled by default.

  - **Not configured** - The setting reverts to the system default, meaning, datagram processing on Windows Server is disabled.
  - **Enabled** - Datagram processing on Windows Server is enabled.
  - **Disabled** - Datagram processing on Windows Server is disabled.

### Disable Dns Over Tcp Parsing 

   CSP: [DisableDnsOverTcpParsing](/windows/client-management/mdm/defender-csp#configurationdisablednsovertcpparsing)

  This setting disables DNS over TCP Parsing for Network Protection.

  - **Not configured** - The setting reverts to the system default, meaning, DNS over TCP parsing is enabled.
  - **Enabled** - DNS over TCP parsing is disabled.
  - **Disabled** - DNS over TCP parsing is enabled.
  
### Disable Http Parsing

   CSP: [DisableHttpParsing](/windows/client-management/mdm/defender-csp#configurationdisablehttpparsing)

  This setting disables HTTP Parsing for Network Protection.

  - **Not configured** - The setting reverts to the system default, meaning, HTTP parsing is enabled.
  - **Enabled** - HTTP parsing is disabled.
  - **Disabled** - HTTP parsing is enabled.

### Disable Ssh Parsing

   CSP: [DisableSshParsing](/windows/client-management/mdm/defender-csp#configurationdisablesshparsing)

  This setting disables SSH Parsing for Network Protection.

  - **Not configured** - The setting reverts to the system default (SSH parsing is enabled).
  - **Enabled** - SSH parsing is disabled.
  - **Disabled** - SSH parsing is enabled.

### Disable Tls Parsing 

   CSP: [DisableTlsParsing](/windows/client-management/mdm/defender-csp#configurationdisabletlsparsing)

  This setting disables TLS Parsing for Network Protection.

  - **Not configured** - The setting reverts to the system default, meaning, TLS parsing is enabled.
  - **Enabled** - TLS parsing is disabled.
  - **Disabled** - TLS parsing is enabled.

### Engine Updates Channel

   CSP: [EngineUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationengineupdateschannel)

  Enable this policy to specify when devices receive Microsoft Defender engine updates during the monthly gradual rollout.

  - **Not configured** - The setting reverts to the system default, meaning, the device stays up to date automatically during the gradual release cycle. Suitable for most devices.
  - **Beta Channel** - Devices set to this channel are the first to receive new updates. Select Beta Channel to participate in identifying and reporting issues to Microsoft. Devices in the Windows Insider Program are subscribed to this channel by default. For use in (manual) test environments only and a limited number of devices.
  - **Current Channel (Preview)** - Devices set to this channel is offered updates earliest during the monthly gradual release cycle. Suggested for pre-production/validation environments.
  - **Current Channel (Staged)** - Devices is offered updates after the monthly gradual release cycle. Suggested to apply to a small, representative part of your production population (~10%).
  - **Current Channel (Broad)** - Devices is offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%).
  - **Critical - Time delay** - Devices are offered updates with a 48-hour delay. Suggested for critical environments only.

### Metered Connection Updates 

   CSP: [MeteredConnectionUpdates](/windows/client-management/mdm/defender-csp#configurationmeteredconnectionupdates)

  This setting enables managed devices to update through metered connections.

  - **Not configured** - The setting reverts to the system default (not allowed).
  - **Allowed** - managed devices update through metered connections.
  - **Not allowed** - managed devices won't update through metered connections.

### Platform Updates Channel

   CSP: [EngineUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationplatformupdateschannel)

  Enable this policy to specify when devices receive Microsoft Defender platform updates during the monthly gradual rollout.

  - **Not configured** - The setting reverts to the system default, meaning, the device stays up to date automatically during the gradual release cycle. Suitable for most devices.
  - **Beta Channel** - Devices set to this channel is the first to receive new updates. Select Beta Channel to participate in identifying and reporting issues to Microsoft. Devices in the Windows Insider Program are subscribed to this channel by default. For use in (manual) test environments only and a limited number of devices.
  - **Current Channel (Preview)** - Devices set to this channel is offered updates earliest during the monthly gradual release cycle. Suggested for pre-production/validation environments.
  - **Current Channel (Staged)** - Devices is offered updates after the monthly gradual release cycle. Suggested to apply to a small, representative part of your production population (~10%).
  - **Current Channel (Broad)** - Devices is offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%).
  - **Critical - Time delay** - Devices are offered updates with a 48-hour delay. Suggested for critical environments only.

### Security Intelligence Updates Channel
   CSP: [SecurityIntelligenceUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationsecurityintelligenceupdateschannel)

  Enable this policy to specify when devices receive Microsoft Defender security intelligence updates during the daily gradual rollout.

  - **Not configured** - Microsoft will either assign the device to Current Channel (Broad) or a beta channel early in the gradual release cycle. The channel selected by Microsoft might be one that receives updates early during the gradual release cycle, which might not be suitable for devices in a production or critical environment.
  - **Current Channel (Staged)** - Same as Current Channel (Broad).
  - **Current Channel (Broad)** - Devices is offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in all populations, including production.

### Randomize Schedule Task Times
   CSP: [RandomizeScheduleTaskTimes](/windows/client-management/mdm/defender-csp#configurationrandomizescheduletasktimes)

  In Microsoft Defender Antivirus, randomize the start time of the scan to any interval from 0 to 23 hours. This can be useful in virtual machines or VDI deployments.

  - **Not configured** - The setting reverts to the system default (scheduled tasks are randomized).
  - **Widen or narrow the randomization period for scheduled scans. Specify a randomization window of between 1 and 23 hours by using the setting SchedulerRandomizationTime**
  - **Scheduled tasks won't be randomized**

### Scheduler Randomization Time 

   CSP: [SchedulerRandomizationTime](/windows/client-management/mdm/defender-csp#configurationschedulerrandomizationtime)

  This setting enables you to configure the scheduler randomization in hours. The randomization interval is [1 - 23] hours.

  - **Not configured** - The setting reverts to the system default (4 hours).
  - **[1-23]** - The randomization interval is defined by the value specified in the policy.
  
### Disable Core Service ECS Integration
   CSP: [DisableCoreServiceECSIntegration](/windows/client-management/mdm/defender-csp#configurationdisablecoreserviceecsintegration)

  Turn off ECS integration for Defender core service.

  - **Not configured** - The setting reverts to the system default, meaning, the Defender core service uses ECS.
  - **The Defender core service will use the Experimentation and Configuration Service (ECS) to rapidly deliver critical, org-specific fixes**.
  - **The Defender core service stops using the Experimentation and Configuration Service (ECS). Fixes will continue to be delivered through security intelligence updates.**

### Disable Core Service Telemetry

   CSP: [DisableCoreServiceTelemetry](/windows/client-management/mdm/defender-csp#configurationdisablecoreservicetelemetry)

  Turn off OneDsCollector telemetry for the Defender core service.

  - **Not configured** - The setting reverts to the system default, meaning, the Defender core service uses the OneDsCollector framework.
  - **The Defender core service will use the OneDsCollector framework to rapidly collect telemetry**.
  - **The Defender core service stops using the OneDsCollector framework to rapidly collect telemetry, impacting Microsoft's ability to quickly recognize and address poor performance, false positives, and other problems**.
  
> [!TIP]
> Need help? See [Manage endpoint security in Microsoft Intune](/mem/intune/protect/endpoint-security).

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/mem/intune/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## Related articles

- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Reference articles for management and configuration tools](configuration-management-reference-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)

> [!TIP]
> **Performance tip** Due to various factors, Microsoft Defender Antivirus, like other antivirus software, can cause performance issues on endpoint devices. In some cases, you might need to tune the performance of Microsoft Defender Antivirus to address these issues. Microsoft's **Performance analyzer** is a PowerShell command-line tool that helps identify which files, file paths, processes, and file extensions might be causing performance problems. Some examples include:
> 
> - Top paths that affect scan time
> - Top files that affect scan time
> - Top processes that affect scan time
> - Top file extensions that affect scan time
> - Combinations – for example:
>   - top files per extension
>   - top paths per extension
>   - top processes per path
>   - top scans per file
>   - top scans per file per process
>
> You can use the information gathered using Performance analyzer to better assess performance issues and apply remediation actions.
> See: [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
