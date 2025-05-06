---
title: Configure Microsoft Defender Antivirus using Microsoft Intune
description: Use Microsoft Intune to configure Microsoft Defender Antivirus and Endpoint Protection
ms.service: defender-endpoint
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 05/06/2025
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

**Platforms**
- Windows

You can use the Microsoft Intune family of products to configure Microsoft Defender Antivirus settings, like [Microsoft Intune](/mem/intune/fundamentals/what-is-intune) and [Configuration Manager](/mem/configmgr/core/understand/introduction).

## Configure Microsoft Defender Antivirus settings in Intune

1. Go to the Microsoft Intune admin center ([https://intune.microsoft.com](https://intune.microsoft.com)), and sign in.

2. Navigate to **Endpoint Security**.

3. Under **Manage**, choose **Antivirus**.

4. Click on **Create Policy**, select **Windows** as the platform and **Microsoft Defender Antivirus** for the profile type then click on **Create**.

5. Enter a **Name** for the policy and optionally a description and click **Next** to go to **Configuration settings**.

6. Edit your Microsoft Defender Antivirus settings.

7. Choose **Review + save**.

You can review below the list of settings available to be configured in a **Microsoft Defender Antivirus** policy in Intune.

- **Allow Archive Scanning**  
  CSP: [AllowArchiveScanning](/windows/client-management/mdm/policy-csp-defender#allowarchivescanning)

  This policy setting allows you to configure scans for malicious software and unwanted software in archive files such as .ZIP or .CAB files.

  - **Not configured** - The setting returns to the client default, which is to scan archived files, however the user may disable setting.
  - **Not allowed** - Archive files won't be scanned. However, archives are always scanned during directed scans.
  - **Allowed** - Enable scans of archive files. This is the recommended configuration.

  Changes to this setting are not applied if tamper protection is enabled.

- **Allow behavior monitoring**  
  CSP: [AllowBehaviorMonitoring](/windows/client-management/mdm/policy-csp-defender#allowbehaviormonitoring)

  This policy setting allows you to configure behavior monitoring.

  - **Not configured** - The setting is restored to the system default (real-time behavior monitoring is enabled).
  - **Not allowed** - The setting is disabled.
  - **Allowed** - Real-time behavior monitoring is enabled. This is the recommended configuration.

  Changes to this setting are not applied if tamper protection is enabled.

- **Turn on cloud-delivered protection**  
  CSP: [AllowCloudProtection](/windows/client-management/mdm/policy-csp-defender#allowcloudprotection)

> [!IMPORTANT]
>[We recommend keeping cloud protection turned on, because certain security features and capabilities in Microsoft Defender for Endpoint only work when cloud protection is enabled](./enable-cloud-protection-microsoft-defender-antivirus.md).

  This policy setting allows you to join Microsoft MAPS (Microsoft Active Protection Service). Microsoft MAPS is the online community that helps you choose how to respond to potential threats. The community also helps stop the spread of new malicious software infections.
Information about the detected items on your computer will be automatically collected and sent to Microsoft. The following information will be collected about any detected malicious software, spyware, and potentially unwanted software: where the software came from, the actions that you apply or that are applied automatically and whether the actions were successful, the location of the software, file names, how the software operates and how it has impacted your computer.

  - **Not configured** - The setting is restored to the system default (cloud-delivered protection is turned off).
  - **Not allowed** - Cloud-delivered protection is turned off.
  - **Allowed** - Cloud-delivered protection is turned on.

 Changes to this setting are not applied if tamper protection is enabled.

- **Allow email scanning**  
  CSP: [AllowEmailScanning](/windows/client-management/mdm/policy-csp-defender#allowemailscanning)

  This policy setting allows you to configure e-mail scanning. When e-mail scanning is enabled, the engine will parse the mailbox and mail files, according to their specific format, in order to analyze the mail bodies and attachments. Several e-mail formats are currently supported, for example: pst (Outlook), dbx, mbx, mime (Outlook Express), binhex (Mac). Email scanning isn't supported on modern email clients.

  - **Not configured** - The setting is restored to the system default (turn off email scanning).
  - **Not allowed** - Turn off email scanning.
  - **Allowed** - Turn on email scanning. This is the recommended configuration.
  
- **Allow Full Scan On Mapped Network Drives**  
  CSP: [AllowFullScanOnMappedNetworkDrives](/windows/client-management/mdm/policy-csp-defender#allowfullscanonmappednetworkdrives)

  This policy setting allows you to configure scanning mapped network drives.

  - **Not configured** - The setting is restored to the system default (mapped network drives will not be scanned).
  - **Not allowed** - Mapped network drives will not be scanned.
  - **Allowed** - Enable scans of mapped network drives.

- **Allow Full Scan Removable Drive Scanning**  
  CSP: [AllowFullScanRemovableDriveScanning](/windows/client-management/mdm/policy-csp-defender#allowfullscanremovabledrivescanning)

  This policy setting allows you to manage whether or not to scan for malicious software and unwanted software in the contents of removable drives, such as USB flash drives, when running a full scan.

  - **Not configured** - The setting is restored to the system default (removable drives won't be scanned during a full scan but they may still be scanned during quick scan and custom scan).
  - **Not allowed** - Removable drives won't be scanned during a full scan but they may still be scanned during quick scan and custom scan.
  - **Allowed** - Removable drives will be scanned during any type of scan. This is the recommended configuration.

- **Allow scanning of all downloaded files and attachments**  
  CSP: [AllowIOAVProtection](/windows/client-management/mdm/policy-csp-defender#allowioavprotection)

  This policy setting allows you to configure scanning for all downloaded files and attachments.

  - **Not configured** - The setting is restored to the system default (scanning for all downloaded files and attachments will be enabled).
  - **Not allowed** - Scanning for all downloaded files and attachments will be disabled.
  - **Allowed** - Scanning for all downloaded files and attachments will be enabled. This is the recommended configuration.

  Changes to this setting are not applied if tamper protection is enabled.

- **Allow Realtime Monitoring**  
  CSP: [AllowRealtimeMonitoring](/windows/client-management/mdm/policy-csp-defender#allowrealtimemonitoring)

  Allows or disallows Windows Defender Realtime Monitoring functionality.

  - **Not configured** - The setting is restored to the system default (turns on and runs the real-time monitoring service).
  - **Not allowed** - Turns off the real-time monitoring service.
  - **Allowed** - Turns on and runs the real-time monitoring service. This is the recommended configuration.

  Changes to this setting are not applied if tamper protection is enabled.

- **Allow Scanning Network Files**  
  CSP: [AllowScanningNetworkFiles](/windows/client-management/mdm/policy-csp-defender#allowscanningnetworkfiles)

  This policy setting allows you to configure scheduled scans and on-demand (manually initiated) scans for files that are accessed over the network.
  
  - **Not configured** - The setting is restored to the system default (network files will be scanned).
  - **Not allowed** - Network files will not be scanned.
  - **Allowed** - Network files will be scanned. This is the recommended configuration.

- **Allow Script Scanning**  
  CSP: [AllowScriptScanning](/windows/client-management/mdm/policy-csp-defender#allowscriptscanning)

  This policy setting allows or disallows Windows Defender Script Scanning functionality. 
  
  - **Not configured** - The setting is restored to the system default (script scanning is allowed).
  - **Not allowed** - The setting is disabled, scripts will not be scanned.
  - **Allowed** - The setting is enabled, scripts will be scanned(it will enable the [Anti-malware Scan Interface](amsi-on-mdav.md)). This is the recommended configuration.

  Changes to this setting are not applied if tamper protection is enabled.

- **Allow User UI Access**  
  CSP: [AllowUserUIAccess](/windows/client-management/mdm/policy-csp-defender#allowuseruiaccess)

  This policy setting allows you to configure whether or not to display the Microsoft Defender app UI to the users.
  
  - **Not configured** - The setting is restored to the system default (the UI and notifications are allowed).
  - **Not allowed** - The setting is disabled, prevents users from accessing UI and the notifications are suppressed.
  - **Allowed** - The setting is enabled, the users can access the Defender UI and notifications are allowed. This is the recommended configuration.

- **Avg CPU Load Factor**  
  CSP: [AvgCPULoadFactor](/windows/client-management/mdm/policy-csp-defender#avgcpuloadfactor)

  This policy setting allows you to specify the maximum CPU load factor for the Defender scans.
  
  - **Not configured** - The setting is restored to the system default (CPU utilization won't exceed the default value which is 50).
  - **[0-100]** - CPU utilization won't exceed the percentage specified. A value of 0 indicates that there should be no throttling of CPU utilization.
 
- **Archive Max Depth**  
  CSP: [ArchiveMaxDepth](/windows/client-management/mdm/defender-csp#configurationarchivemaxdepth)

  This policy setting allows you to specify the maximum folder depth to extract from archive files for scanning.
  
  - **Not configured** - The setting is restored to the system default (all archives are extracted up to the deepest folder for scanning).
  - **[0-4294967295]** - All archives are extracted up to the depth specified in the policy.

- **Archive Max Size**  
   CSP: [ArchiveMaxSize](/windows/client-management/mdm/defender-csp#configurationarchivemaxsize)

  This policy setting allows you to specify the maximum size, in KB, of archive files to be extracted and scanned.
  
  - **Not configured** - The setting is restored to the system default (all archives are extracted and scanned regardless of size).
  - **[0-4294967295]** - Archives are extracted and scanned if their size is smaller than the maximum size specified in the policy.


- **Check For Signatures Before Running Scan**  
   CSP: [CheckForSignaturesBeforeRunningScan](/windows/client-management/mdm/policy-csp-defender#checkforsignaturesbeforerunningscan)

  This policy setting allows you to manage whether a check for new virus and spyware security intelligence will occur before running a scan and is applicable only to scheduled scans.
  
  - **Not configured** - The setting is restored to the system default (the scan will start using the existing security intelligence).
  - **Disabled** - The scan will start using the existing security intelligence.
  - **Enabled** - A check for new security intelligence will occur before running a scan. This is the recommended configuration.
 
- **Cloud Block Level**  
   CSP: [CloudBlockLevel](/windows/client-management/mdm/policy-csp-defender#cloudblocklevel)

  This policy setting determines how aggressive Microsoft Defender Antivirus will be in blocking and scanning suspicious files. This feature requires **Allow cloud protection** to be enabled.
  
  - **Not configured** - The setting is restored to the system default (Default Microsoft Defender Antivirus blocking level).
  - **(0x0)Default state** - Default Microsoft Defender Antivirus blocking level.
  - **(0x2)High** - High blocking level - aggressively block unknowns while optimizing client performance (greater chance of false positives). This is the recommended configuration
  - **(0x4)High Plus** - High+ blocking level - aggressively block unknowns and apply additional protection measures (may impact client performance).
  - **(0x6)Zero Tolerance** - Zero tolerance blocking level - block all unknown executables
  
  Changes to this setting are not applied if tamper protection is enabled.

- **Cloud Extended Timeout**  
   CSP: [CloudExtendedTimeout](/windows/client-management/mdm/policy-csp-defender#cloudextendedtimeout)

  This feature allows Microsoft Defender Antivirus to block a suspicious file for up to 60 seconds, and scan it in the cloud to make sure it's safe. The default cloud check timeout is 10 seconds. To enable the extended cloud check feature, specify the extended time in seconds, up to an additional 50 seconds.
  
  - **Not configured** - The setting is restored to the system default (cloud timeout is 10 seconds).
  - **[0-50]** - The cloud timeout will be extended with the specified amount. The recommended value is 50.

- **Days To Retain Cleaned Malware**  
   CSP: [DaysToRetainCleanedMalware](/windows/client-management/mdm/policy-csp-defender#daystoretaincleanedmalware)

  This policy setting defines the number of days items should be kept in the Quarantine folder before being removed.
  
  - **Not configured** - The setting is restored to the system default (items will be kept in the quarantine folder indefinitely and won't be automatically removed).
  - **[0-90]** - Items will be removed from the Quarantine folder after the number of days specified.

- **Disable Catchup Full Scan**  
   CSP: [DisableCatchupFullScan](/windows/client-management/mdm/policy-csp-defender#disablecatchupfullscan)

  This policy setting allows you to configure catch-up scans for scheduled full scans. A catch-up scan is a scan that's initiated because a regularly scheduled scan was missed. Usually these scheduled scans are missed because the computer was turned off at the scheduled time.
  
  - **Not configured** - The setting is restored to the system default (catch-up scans for scheduled full scans will be turned on).
  - **Disabled** - Catch-up scans for scheduled full scans will be turned on. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone logs on to the computer. If there is no scheduled scan configured, there will be no catch-up scan run.
  - **Enabled** - Catch-up scans for scheduled full scans will be disabled.

- **Disable Catchup Quick Scan**  
   CSP: [DisableCatchupQuickScan](/windows/client-management/mdm/policy-csp-defender#disablecatchupquickscan)

  This policy setting allows you to configure catch-up scans for scheduled quick scans. A catch-up scan is a scan that's initiated because a regularly scheduled scan was missed. Usually these scheduled scans are missed because the computer was turned off at the scheduled time.
  
  - **Not configured** - The setting is restored to the system default (catch-up scans for scheduled quick scans will be turned on).
  - **Disabled** - Catch-up scans for scheduled quick scans will be turned on. If a computer is offline for two consecutive scheduled scans, a catch-up scan is started the next time someone logs on to the computer. If there is no scheduled scan configured, there will be no catch-up scan run.
  - **Enabled** - Catch-up scans for scheduled quick scans will be disabled.

- **Enable Low CPU Priority**  
   CSP: [EnableLowCPUPriority](/windows/client-management/mdm/policy-csp-defender#enablelowcpupriority)

  This policy setting allows you to enable or disable low CPU priority for scheduled scans.
  
  - **Not configured** - The setting is restored to the system default (no changes will be made to CPU priority for scheduled scans).
  - **Disabled** - No changes will be made to CPU priority for scheduled scans.
  - **Enabled** - Low CPU priority will be used during scheduled scans.

- **Enable Network Protection**  
   CSP: [EnableNetworkProtection](/windows/client-management/mdm/policy-csp-defender#enablenetworkprotection)

  Enable or disable Microsoft Defender Exploit Guard network protection to prevent employees from using any application to access dangerous domains that may host phishing scams, exploit-hosting sites, and other malicious content on the Internet.
  
  - **Not configured** - The setting is restored to the system default (users and applications won't be blocked from connecting to dangerous domains).
  - **Disabled** - Users and applications won't be blocked from connecting to dangerous domains.
  - **Enabled(block mode)** - Users and applications won't be able to access dangerous domains. This is the recommended configuration.
  - **Enabled(audit mode)** - Users and applications can connect to dangerous domains, however if this feature would've blocked access if it were set to Block, then a record of the event will be in the event logs.

- **Excluded Extensions**  
   CSP: [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions)

  Allows an administrator to specify a list of file type extensions to ignore during a scan. For more details on how these exclusions can be defined you can read this article: [Exclusions based on file extension and folder location](./configure-extension-file-exclusions-microsoft-defender-antivirus.md)

- **Excluded Paths**  
   CSP: [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths)

  Allows an administrator to specify a list of directory paths to ignore during a scan. For more details on how these exclusions can be defined you can read this article: [Exclusions based on file extension and folder location](./configure-extension-file-exclusions-microsoft-defender-antivirus.md)

- **Excluded Processes**  
   CSP: [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses)

  Allows an administrator to specify a list of files opened by processes to ignore during a scan. For more details on how these exclusions can be defined you can read this article: [Exclusions based on file extension and folder location](./configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)

> [!NOTE]
> When tamper protection is turned on the exclusions cannot be modified and new exclusions cannot be added but they need to [meet some conditions](./manage-tamper-protection-intune.md) for tamper protection to work.

> [!IMPORTANT]
> Defining exclusions lowers the protection offered by Microsoft Defender Antivirus. You should always evaluate the risks that are associated with implementing exclusions and you should only create exclusions on the devices where they are needed. If an exclusion is not required on all devices then use the dedicated policy type **Microsoft Defender Antivirus exclusions** and assign the policy just to the group of devices/users that need it.

- **PUA Protection**  
   CSP: [PUAProtection](/windows/client-management/mdm/policy-csp-defender#puaprotection)

  Enable or disable detection for potentially unwanted applications. You can choose to block, audit, or allow when potentially unwanted software is being downloaded or attempts to install itself on your computer.
  
  - **Not configured** - The setting is restored to the system default (potentially unwanted software won't be blocked).
  - **Disabled** - PUA protection is off, potentially unwanted software won't be blocked.
  - **Block** - PUA protection is on, potentially unwanted software will be blocked. This is the recommended configuration.
  - **Audit mode** - Potentially unwanted software won't be blocked, however if this feature would've blocked access if it were set to Block, then a record of the event will be in the event logs.

- **Real Time Scan Direction**  
   CSP: [RealTimeScanDirection](/windows/client-management/mdm/policy-csp-defender#realtimescandirection)

  This policy setting allows you to configure monitoring for incoming and outgoing files, without having to turn off monitoring entirely. It's recommended for use on servers where there is a lot of incoming and outgoing file activity but for performance reasons need to have scanning disabled for a particular scan direction. The appropriate configuration should be evaluated based on the server role.

  Note that this configuration is only honored for NTFS volumes. For any other file system type, full monitoring of file and program activity will be present on those volumes.
  
  - **Not configured** - The setting is restored to the system default (monitoring for incoming and outgoing files will be enabled).
  - **Monitor all files (bi-directional)** - Scan incoming and outgoing files (default)
  - **Monitor incoming files** - Scan incoming files only.
  - **Monitor outgoing files** - Scan outgoing files only.

- **Scan Parameter**  
   CSP: [ScanParameter](/windows/client-management/mdm/policy-csp-defender#scanparameter)

  This policy setting allows you to specify the scan type to use during a scheduled scan. This setting interacts with the settings **Schedule Scan Day** and **Schedule Scan Time**.

  - **Not configured** - The setting is restored to the system default (the default scan type will be used).
  - **Quick Scan (default)** - Defender runs a scheduled quick scan.
  - **Full Scan** - Defender runs a scheduled full scan.

- **Schedule Quick Scan Time**  
   CSP: [ScheduleQuickScanTime](/windows/client-management/mdm/policy-csp-defender#schedulequickscantime)

  This policy setting allows you to specify the time of day at which to perform a daily quick scan. The time value is represented as the number of minutes past midnight. This setting doesn't interact with the settings **Scan Parameter**, **Schedule Scan Day** and **Schedule Scan Time**.

  - **Not configured** - The setting is restored to the system default (the daily quick scan controlled by this config will not run).
  - **[0-1380]** - A daily quick scan will run at the time of day specified.

- **Schedule Scan Day**  
   CSP: [ScheduleScanDay](/windows/client-management/mdm/policy-csp-defender#schedulescanday)

  This policy setting allows you to specify the day of the week on which to perform a scheduled scan. The scan can also be configured to run every day or to never run at all. This setting interacts with the settings **Scan Parameter** and **Schedule Scan Time**.

  - **Not configured** - The setting is restored to the system default (a scheduled scan will run at a default frequency).
  - **Every day (default)** - A scheduled scan will run daily.
  - **Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday** - A scheduled scan will run once per week on the selected day.
  - **No scheduled scan** - No scheduled scan will run.

- **Schedule Scan Time**  
   CSP: [ScheduleScanTime](/windows/client-management/mdm/policy-csp-defender#schedulescantime)

  This policy setting allows you to specify the time of day at which to perform a scheduled scan. The time value is represented as the number of minutes past midnight (the default is 120 which corresponds to 2:00 AM). This setting interacts with the settings **Scan Parameter** and **Schedule Scan Day**.

  - **Not configured** - The setting is restored to the system default (a scheduled scan will run at a default time).
  - **[0-1380]** - A scheduled scan will run at the time of day specified.

- **Signature Update Fallback Order**  
   CSP: [SignatureUpdateFallbackOrder](/windows/client-management/mdm/policy-csp-defender#signatureupdatefallbackorder)

  This policy setting allows you to define the order in which different security intelligence update sources should be contacted. The value of this setting should be entered as a pipe-separated string enumerating the security intelligence update sources in order. Possible values are: "InternalDefinitionUpdateServer", "MicrosoftUpdateServer", "MMPC", and "FileShares".

  - **Not configured** - The setting is restored to the system default (security intelligence update sources will be contacted in a default order).
  - **Enabled** - Security intelligence update sources will be contacted in the order specified. 

- **Signature Update File Shares Sources**  
   CSP: [SignatureUpdateFileSharesSources](/windows/client-management/mdm/policy-csp-defender#signatureupdatefilesharessources)

  This policy setting allows you to configure UNC file share sources for downloading security intelligence updates. Sources will be contacted in the order specified. The value of this setting should be entered as a pipe-separated string enumerating the security intelligence update sources.

  - **Not configured** - The setting is restored to the system default (the list will remain empty by default and no sources will be contacted).
  - **Enabled** - The specified sources will be contacted for security intelligence updates. 

- **Signature Update Interval**  
   CSP: [SignatureUpdateInterval](/windows/client-management/mdm/policy-csp-defender#signatureupdateinterval)

  This policy setting allows you to specify an interval at which to check for security intelligence updates. The time value is represented as the number of hours between update checks (the default is 8h).

  - **Not configured** - The setting is restored to the system default (checks for security intelligence updates will occur at the default interval).
  - **[0-24]** - Checks for security intelligence updates will occur at the interval specified. The recommended value is 4.

- **Submit Samples Consent**  
   CSP: [SubmitSamplesConsent](/windows/client-management/mdm/policy-csp-defender#submitsamplesconsent)

  This policy setting configures behavior of samples submission when opt-in for MAPS telemetry is set.

  - **Not configured** - The setting is restored to the system default (send safe samples automatically).
  - **Always prompt** - The user is always prompted for consent before file submission.
  - **Send safe samples automatically** - Safe samples are samples considered to not commonly contain PII data (examples include .bat, .scr, .dll, and .exe). If file is likely to contain PII, the user gets a request to allow file sample submission.
  - **Never send** - Prevents "block at first sight" based on file sample analysis. Metadata is sent for detections even if sample submission is disabled.
  - **Send all samples automatically** - All samples are sent automatically. This is the recommended configuration.

- **Disable Local Admin Merge**  
   CSP: [DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp#configurationdisablelocaladminmerge)

  When this value is set to no, it allows a local admin the ability to [specify some settings](./configure-local-policy-overrides-microsoft-defender-antivirus.md) on their devices by using the Windows Security app, local Group Policy settings, or PowerShell cmdlets (where appropriate).

  - **Not configured** - The setting is restored to the system default.
  - **Enable local admin merge (default)** - Unique items defined in preference settings that are configured by a local administrator merge into the resulting effective policy. If there are conflicts, management settings from Intune policy override local preference settings.
  - **Disable local admin merge** - Only items defined by management are used in the resulting effective policy. Managed settings override preference settings that are configured by the local administrator. This is the recommended configuration.

- **Allow On Access Protection**  
   CSP: [AllowOnAccessProtection](/windows/client-management/mdm/policy-csp-defender#allowonaccessprotection)

  This policy setting allows you to configure monitoring for file and program activity.

  - **Not configured** - The setting is restored to the system default (monitoring for file and program activity will be enabled).
  - **Allowed** - Monitoring for file and program activity will be enabled.
  - **Not allowed** - Monitoring for file and program activity will be disabled.
 
  Changes to this setting are not applied if tamper protection is enabled.

- **Threat Severity Default Action**  
   CSP: [ThreatSeverityDefaultAction](/windows/client-management/mdm/policy-csp-defender#threatseveritydefaultaction)

  This policy setting allows you to customize which automatic remediation action will be taken for each threat alert level. The list of valid remediation actions is below.

  - **Not configured** - The setting is restored to the system default (apply action based on the update definition).
  - **Clean** - Service tries to recover files and tries to disinfect.
  - **Quarantine** - Moves files to quarantine.
  - **Remove** - Removes files from system.
  - **Allow** - Allows the file and doesn't take other actions.
  - **User defined** - The device user makes the decision on which action to take.
  - **Block** - Blocks file execution.
 
  Changes to this setting are not applied if tamper protection is enabled.
  
- **Allow Network Protection Down Level**  
   CSP: [AllowNetworkProtectionDownLevel](/windows/client-management/mdm/defender-csp#configurationallownetworkprotectiondownlevel)

  This setting controls whether Network Protection is allowed to be configured into block or audit mode on Windows downlevel of RS3. If false, the value of EnableNetworkProtection will be ignored.

  - **Not configured** - The setting is restored to the system default (network protection will be disabled downlevel).
  - **Enabled** - Network protection will be enabled downlevel.
  - **Disabled** - Network protection will be disabled downlevel.

- **Allow Datagram Processing On Win Server**  
   CSP: [AllowDatagramProcessingOnWinServer](/windows/client-management/mdm/defender-csp#configurationallowdatagramprocessingonwinserver)

  This setting controls whether Network Protection is allowed to enable datagram processing on Windows Server. If false, the value of DisableDatagramProcessing will be ignored and default to disabling Datagram inspection.

  - **Not configured** - The setting is restored to the system default (datagram processing on Windows Server is disabled).
  - **Enabled** - Datagram processing on Windows Server is enabled.
  - **Disabled** - Datagram processing on Windows Server is disabled.

- **Disable Dns Over Tcp Parsing**  
   CSP: [DisableDnsOverTcpParsing](/windows/client-management/mdm/defender-csp#configurationdisablednsovertcpparsing)

  This setting disables DNS over TCP Parsing for Network Protection.

  - **Not configured** - The setting is restored to the system default (DNS over TCP parsing is enabled).
  - **Enabled** - DNS over TCP parsing is disabled.
  - **Disabled** - DNS over TCP parsing is enabled.

- **Disable Http Parsing**  
   CSP: [DisableHttpParsing](/windows/client-management/mdm/defender-csp#configurationdisablehttpparsing)

  This setting disables HTTP Parsing for Network Protection.

  - **Not configured** - The setting is restored to the system default (HTTP parsing is enabled).
  - **Enabled** - HTTP parsing is disabled.
  - **Disabled** - HTTP parsing is enabled.

- **Disable Ssh Parsing**  
   CSP: [DisableSshParsing](/windows/client-management/mdm/defender-csp#configurationdisablesshparsing)

  This setting disables SSH Parsing for Network Protection.

  - **Not configured** - The setting is restored to the system default (SSH parsing is enabled).
  - **Enabled** - SSH parsing is disabled.
  - **Disabled** - SSH parsing is enabled.

- **Disable Tls Parsing**  
   CSP: [DisableTlsParsing](/windows/client-management/mdm/defender-csp#configurationdisabletlsparsing)

  This setting disables TLS Parsing for Network Protection.

  - **Not configured** - The setting is restored to the system default (TLS parsing is enabled).
  - **Enabled** - TLS parsing is disabled.
  - **Disabled** - TLS parsing is enabled.

- **Engine Updates Channel**  
   CSP: [EngineUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationengineupdateschannel)

  Enable this policy to specify when devices receive Microsoft Defender engine updates during the monthly gradual rollout.

  - **Not configured** - The setting is restored to the system default (the device will stay up to date automatically during the gradual release cycle). Suitable for most devices.
  - **Beta Channel** - Devices set to this channel will be the first to receive new updates. Select Beta Channel to participate in identifying and reporting issues to Microsoft. Devices in the Windows Insider Program are subscribed to this channel by default. For use in (manual) test environments only and a limited number of devices.
  - **Current Channel (Preview)** - Devices set to this channel will be offered updates earliest during the monthly gradual release cycle. Suggested for pre-production/validation environments.
  - **Current Channel (Staged)** - Devices will be offered updates after the monthly gradual release cycle. Suggested to apply to a small, representative part of your production population (~10%).
  - **Current Channel (Broad)** - Devices will be offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%).
  - **Critical - Time delay** - Devices will be offered updates with a 48-hour delay. Suggested for critical environments only.

- **Metered Connection Updates**  
   CSP: [MeteredConnectionUpdates](/windows/client-management/mdm/defender-csp#configurationmeteredconnectionupdates)

  This setting allows managed devices to update through metered connections.

  - **Not configured** - The setting is restored to the system default (not allowed).
  - **Allowed** - managed devices will update through metered connections.
  - **Not allowed** - managed devices will not update through metered connections.

- **Platform Updates Channel**  
   CSP: [EngineUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationplatformupdateschannel)

  Enable this policy to specify when devices receive Microsoft Defender platform updates during the monthly gradual rollout.

  - **Not configured** - The setting is restored to the system default (the device will stay up to date automatically during the gradual release cycle). Suitable for most devices.
  - **Beta Channel** - Devices set to this channel will be the first to receive new updates. Select Beta Channel to participate in identifying and reporting issues to Microsoft. Devices in the Windows Insider Program are subscribed to this channel by default. For use in (manual) test environments only and a limited number of devices.
  - **Current Channel (Preview)** - Devices set to this channel will be offered updates earliest during the monthly gradual release cycle. Suggested for pre-production/validation environments.
  - **Current Channel (Staged)** - Devices will be offered updates after the monthly gradual release cycle. Suggested to apply to a small, representative part of your production population (~10%).
  - **Current Channel (Broad)** - Devices will be offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%).
  - **Critical - Time delay** - Devices will be offered updates with a 48-hour delay. Suggested for critical environments only.

- **Security Intelligence Updates Channel**  
   CSP: [SecurityIntelligenceUpdatesChannel](/windows/client-management/mdm/defender-csp#configurationsecurityintelligenceupdateschannel)

  Enable this policy to specify when devices receive Microsoft Defender security intelligence updates during the daily gradual rollout.

  - **Not configured** - Microsoft will either assign the device to Current Channel (Broad) or a beta channel early in the gradual release cycle. The channel selected by Microsoft might be one that receives updates early during the gradual release cycle, which may not be suitable for devices in a production or critical environment.
  - **Current Channel (Staged)** - Same as Current Channel (Broad).
  - **Current Channel (Broad)** - Devices will be offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in all populations, including production.

- **Randomize Schedule Task Times**  
   CSP: [RandomizeScheduleTaskTimes](/windows/client-management/mdm/defender-csp#configurationrandomizescheduletasktimes)

  In Microsoft Defender Antivirus, randomize the start time of the scan to any interval from 0 to 23 hours. This can be useful in virtual machines or VDI deployments.

  - **Not configured** - The setting is restored to the system default (scheduled tasks will be randomized).
  - **Widen or narrow the randomization period for scheduled scans. Specify a randomization window of between 1 and 23 hours by using the setting SchedulerRandomizationTime**
  - **Scheduled tasks won't be randomized**

- **Scheduler Randomization Time**  
   CSP: [SchedulerRandomizationTime](/windows/client-management/mdm/defender-csp#configurationschedulerrandomizationtime)

  This setting allows you to configure the scheduler randomization in hours. The randomization interval is [1 - 23] hours.

  - **Not configured** - The setting is restored to the system default ( 4 hours).
  - **[1-23]** - The randomization interval will be defined by the value specified in the policy.
  
- **Disable Core Service ECS Integration**  
   CSP: [DisableCoreServiceECSIntegration](/windows/client-management/mdm/defender-csp#configurationdisablecoreserviceecsintegration)

  Turn off ECS integration for Defender core service.

  - **Not configured** - The setting is restored to the system default ( the Defender core service will use ECS).
  - **The Defender core service will use the Experimentation and Configuration Service (ECS) to rapidly deliver critical, org-specific fixes**.
  - **The Defender core service stops using the Experimentation and Configuration Service (ECS). Fixes will continue to be delivered through security intelligence updates.**

- **Disable Core Service Telemetry**  
   CSP: [DisableCoreServiceTelemetry](/windows/client-management/mdm/defender-csp#configurationdisablecoreservicetelemetry)

  Turn off OneDsCollector telemetry for the Defender core service.

  - **Not configured** - The setting is restored to the system default ( the Defender core service will use the OneDsCollector framework).
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
> **Performance tip** Due to a variety of factors (examples listed below) Microsoft Defender Antivirus, like other antivirus software, can cause performance issues on endpoint devices. In some cases, you might need to tune the performance of Microsoft Defender Antivirus to alleviate those performance issues. Microsoft's **Performance analyzer** is a PowerShell command-line tool that helps determine which files, file paths, processes, and file extensions might be causing performance issues; some examples are:
>
> - Top paths that impact scan time
> - Top files that impact scan time
> - Top processes that impact scan time
> - Top file extensions that impact scan time
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
