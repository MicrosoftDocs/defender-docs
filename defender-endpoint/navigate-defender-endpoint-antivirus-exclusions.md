---
title: Exclusions overview
description: Learn how to navigate exclusions for Defender for Endpoint and Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.topic: how-to
author: emmwalshh
ms.author: ewalsh
ms.custom: nextgen
ms.date: 01/09/2025
ms.reviewer: joshbregman
manager: deniseb
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
---

# Exclusions overview 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[Microsoft Defender for Endpoint](microsoft-defender-endpoint.md) and [Defender for Business](/defender-business/mdb-overview) includes a wide range of capabilities to prevent, detect, investigate, and respond to advanced cyberthreats. Microsoft preconfigures the product to perform well on the operating system that it's installed. No other changes should be needed. Despite preconfigured settings, sometimes unexpected behaviors occur. Here are some examples:

- **False positives**: Files, folders, or processes that aren't actually a threat can be detected as malicious by Defender for Endpoint or Microsoft Defender Antivirus. These entities can be blocked or sent to quarantine, even though they're not a threat. 
- **Performance issues**: Systems experience an unexpected performance impact when running with Defender for Endpoint
- **Application compatibility issues**: Applications experience unexpected behavior when running with Defender for Endpoint 

Creating an exclusion is one possible approach for addressing these types of issues. But often there are other steps you can take. In addition to providing an overview of indicators and exclusions, this article includes [Alternatives to creating exclusions and allow indicators](#alternatives-to-creating-exclusions-and-allow-indicators).  

> [!NOTE]
> Creating an indicator or an exclusion should only be considered after thoroughly understanding the root cause of the unexpected behavior.

## Examples of issues and steps to consider

| Example scenario | Steps to consider |
|:---|:----|
| [False positive](defender-endpoint-false-positives-negatives.md): An entity, such as a file or a process, was detected and identified as malicious, even though the entity isn't a threat. | 1. [Review and classify alerts](defender-endpoint-false-positives-negatives.md#part-1-review-and-classify-alerts) that were generated as a result of the detected entity. <br/>2. [Suppress an alert](defender-endpoint-false-positives-negatives.md#suppress-an-alert) for a known entity. <br/>3. [Review remediation actions](defender-endpoint-false-positives-negatives.md#part-2-review-remediation-actions) that were taken for the detected entity. <br/>4. [Submit the false positive to Microsoft](/defender-xdr/submission-guide) for analysis. <br/>5. [Define an indicator or an exclusion](defender-endpoint-false-positives-negatives.md#part-3-review-or-define-exclusions) for the entity (only if necessary). |
| [Performance issues](troubleshoot-performance-issues.md) such as one of the following issues:<br/>- A system is having high CPU usage or other performance issues.<br/>- A system is having memory leak issues.<br/>- An app is slow to load on devices.<br/>- An app is slow to open a file on devices. | 1. [Collect diagnostic data](collect-diagnostic-data.md) for Microsoft Defender Antivirus.<br/>2. If you're using a non-Microsoft antivirus solution, [Check with the vendor for known issues with antivirus products](troubleshoot-performance-issues.md#check-with-the-vendor-for-known-issues-with-antivirus-products).<br/>3. Review performance logs (see [Troubleshoot Microsoft Defender Antivirus performance issues with WPRUI](troubleshoot-av-performance-issues-with-wprui.md)) to determine the estimated performance impact. For performance-specific issues related to Microsoft Defender Antivirus, use the [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).<br/>4. [Define an exclusion for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md) (if necessary).<br/>5. [Create an indicator for Defender for Endpoint](indicators-overview.md) (only if necessary). |
| [Compatibility issues](microsoft-defender-antivirus-compatibility.md) with non-Microsoft antivirus products. <br/>Example: Defender for Endpoint relies on security intelligence updates for devices, whether they're running Microsoft Defender Antivirus or a non-Microsoft antivirus solution.  | 1. If you're using a non-Microsoft antivirus product as your primary antivirus/antimalware solution, [set Microsoft Defender Antivirus to passive mode](microsoft-defender-antivirus-compatibility.md#requirements-for-microsoft-defender-antivirus-to-run-in-passive-mode).<br/>2. If you're switching from a non-Microsoft antivirus/antimalware solution to Defender for Endpoint, see [Make the switch to Defender for Endpoint](switch-to-mde-overview.md). This guidance includes:<br/>- [Exclusions you might need to define for the non-Microsoft antivirus/antimalware solution](switch-to-mde-phase-2.md#step-3-add-microsoft-defender-for-endpoint-to-the-exclusion-list-for-your-existing-solution);<br/>- [Exclusions you might need to define for Microsoft Defender Antivirus](switch-to-mde-phase-2.md#step-4-add-your-existing-solution-to-the-exclusion-list-for-microsoft-defender-antivirus); and <br/>- [Troubleshooting information](switch-to-mde-troubleshooting.md) (just in case something goes wrong while migrating). |
| Compatibility with applications. <br/>Example: Applications are crashing or experiencing unexpected behaviors after a device is onboarded to Microsoft Defender for Endpoint.  |  See [Address unwanted behaviors in Microsoft Defender for Endpoint with exclusions, indicators, and other techniques](address-unwanted-behaviors-mde.md). |

## Alternatives to creating exclusions and allow indicators

Creating an exclusion or an allow indicator creates a protection gap. These techniques should only be used after determining the root cause of the issue. Until that determination is made, consider these alternatives:

- Submit a file to Microsoft for analysis
- Suppress an alert

### Submitting files for analysis

If you have a file that you think is wrongly detected as malware (a false positive), or a file that you suspect might be malware even though it wasn't detected (a false negative), you can submit the file to Microsoft for analysis. Your submission is scanned immediately, and will then be reviewed by Microsoft security analysts. You're able to check the status of your submission on the [submission history page](https://www.microsoft.com/wdsi/submissionhistory).

Submitting files for analysis helps reduce false positives and false negatives for all customers. To learn more, see the following articles:

- [Submit files for analysis](/microsoft-365/security/intelligence/submission-guide) (available to all customers)
- [Submit files using the new unified submissions portal in Defender for Endpoint](admin-submissions-mde.md) (available to customers who have Defender for Endpoint Plan 2 or Microsoft Defender XDR)

### Suppressing alerts

If you're getting alerts in the Microsoft Defender portal for tools or processes that you know aren't actually a threat, you can suppress those alerts. To suppress an alert, you create a suppression rule, and specify what actions to take for that on other, identical alerts. You can create suppression rules for a specific alert on a single device, or for all alerts that have the same title across your organization.

To learn more, see the following articles:

- [Suppress alerts](manage-alerts.md#suppress-alerts)
- [Tech Community Blog: Introducing the new alert suppression experience](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/introducing-the-new-alert-suppression-experience/ba-p/3562719) (for Defender for Endpoint)

## Types of exclusions

There are several different types of exclusions to consider. Some types of exclusions affect multiple capabilities in Defender for Endpoint, whereas other types are specific to Microsoft Defender Antivirus. 

- **[Custom exclusions](#custom-exclusions)**: These are exclusions that you define for specific use cases or scenarios, and for certain operating systems, such as [Mac](#exclusions-on-mac), [Linux](#exclusions-on-linux), and [Windows](#exclusions-on-windows).
- **[Preconfigured antivirus exclusions](#antivirus-preconfigured-exclusions)**: These are exclusions that you don't have to define, such as [automatic server role exclusions](#automatic-server-role-exclusions) and [built-in antivirus exclusions](#built-in-antivirus-exclusions). Even though you don't have to define these, it's helpful to know what they are and how they work.
- **[Attack surface reduction exclusions](#attack-surface-reduction-exclusions)**: These are exclusions to prevent attack surface reduction capabilities from blocking legitimate applications that your organization might be using. 
- **[Automation folder exclusions](#automation-folder-exclusions)**: These are exclusions that you define to prevent automated investigation and remediation capabilities from applying to specific files or folders.
- **[Controlled folder access exclusions](#controlled-folder-access-exclusions)**: These are exclusions to allow certain apps or executables to access protected folders.
- **[Custom remediation actions](#custom-remediation-actions)**: These are actions that you specify for Microsoft Defender Antivirus when certain types of detections.

For information about indicators, see [Overview of indicators in Microsoft Defender for Endpoint](indicators-overview.md).

### Custom exclusions

Microsoft Defender for Endpoint allows you to configure custom exclusions to optimize performance and avoid false positives. The types of exclusions you can set vary by Defender for Endpoint capabilities and by operating systems. 

The following table summarizes types of custom exclusions that you can define. Note the scope for each exclusion type. 

| Exclusion types | Scope |Use cases |
|---| ----| -------- |
|[Custom Defender for Endpoint exclusions](#custom-exclusions) | Antivirus<br/>Attack surface reduction rules<br/>Defender for Endpoint<br/>Network Protection |A file, folder, or process is identified as malicious, even though it's not a threat.<br/><br/> An application encounters unexpected performance or application compatibility issue when running with Defender for Endpoint|
|[Defender for Endpoint attack surface reduction exclusions](#attack-surface-reduction-exclusions) | Attack surface reduction rules|An attack surface reduction rule causes unexpected behavior. |
|[Defender for Endpoint automation folder exclusions](#automation-folder-exclusions) | Automated investigation and response|Automated investigation and remediation take action on a file, extension, or directory that should be done manually.|
|[Defender for Endpoint controlled folder access exclusions](#controlled-folder-access-exclusions) | Controlled folder access|Controlled folder access blocks an application from accessing a protected folder.|
|[Defender for Endpoint File and Certificate Allow Indicators](/defender-endpoint/indicator-certificates)| Antivirus<br/>Attack surface reduction rules<br/>Controlled folder access |A file or process signed by a certificate is identified as malicious even through it's not.|
|[Defender for Endpoint Domain/URL and IP address Indicators](/defender-endpoint/indicator-ip-domain) | Network Protection<br/>SmartScreen<br/>Web Content Filtering | SmartScreen reports a false positive. <br/><br/>You want to override a Web Content Filtering block on a specific site.|


> [!NOTE]
> [Network protection](network-protection.md) is directly impacted by process exclusions on all platforms. A process exclusion on any OS (Windows, MacOS, Linux) results in preventing Network Protection from inspecting traffic or enforcing rules for that specific process.

#### Exclusions on Mac

For macOS, you can define exclusions that apply to on-demand scans, real-time protection, and monitoring. The supported exclusion types include:

- **File extension**: Exclude all files with a specific extension.
- **File**: Exclude a specific file identified by its full path.
- **Folder**: Exclude all files under a specified folder recursively.
- **Process**: Exclude a specific process and all files opened by it.

For more information, see [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md).

#### Exclusions on Linux

On Linux, you can configure both antivirus and global exclusions.

- **Antivirus exclusions**: Apply to on-demand scans, real-time protection (RTP), and behavior monitoring (BM).
- **Global exclusions**: Apply to real-time protection (RTP), behavior monitoring (BM), and endpoint detection and response (EDR), stopping all associated antivirus detections and EDR alerts.

For more information, see [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md).

#### Exclusions on Windows

Microsoft Defender Antivirus can be configured to exclude combinations of processes, files, and extensions from scheduled scans, on-demand scans, and real-time protection. See [Configure custom exclusions for Microsoft Defender Antivirus](/defender-endpoint/configure-exclusions-microsoft-defender-antivirus).

For more granular control that helps minimize protection gaps, consider using [Contextual file and process exclusions](/defender-endpoint/configure-contextual-file-folder-exclusions-microsoft-defender-antivirus).  

### Antivirus preconfigured exclusions

These exclusion types are preconfigured in Microsoft Defender for Endpoint for Microsoft Defender Antivirus. 

| Exclusion types | Configuration | Description |
|---|----|----|
| [Automatic Microsoft Defender Antivirus exclusions](#automatic-server-role-exclusions) | Automatic | Automatic Exclusions for server roles and features in Windows Server. When you install a role on Windows Server 2016 or later, Microsoft Defender Antivirus includes automatic exclusions for the server role and any files that are added while installing the role. <br/> These exclusions are only for active roles on Windows Server 2016 and later. |
| [Built-in Microsoft Defender Antivirus exclusions](#built-in-antivirus-exclusions) | Automatic |Microsoft Defender Antivirus includes built-in exclusions for operating system files on all versions of Windows.|

#### Automatic server role exclusions

[Automatic server role exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#automatic-server-role-exclusions) include exclusions for server roles and features in Windows Server 2016 and later. These exclusions aren't scanned by [real-time protection](configure-protection-features-microsoft-defender-antivirus.md) but are still subject to [quick, full, or on-demand antivirus scans](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan). 

Examples include:

- File Replication Service (FRS)
- Hyper-V
- SYSVOL
- Active Directory
- DNS Server
- Print Server
- Web Server
- Windows Server Update Services
- ...and more.

> [!NOTE]
> Automatic exclusions for server roles aren't supported on Windows Server 2012 R2. For servers running Windows Server 2012 R2 with the Active Directory Domain Services (AD DS) server role installed, exclusions for domain controllers must be specified manually. See [Active Directory exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#active-directory-exclusions). 

For more information, see [Automatic server role exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#automatic-server-role-exclusions).

#### Built-in antivirus exclusions

[Built-in antivirus exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#built-in-exclusions) include certain operating system files that are excluded by Microsoft Defender Antivirus on all versions of Windows (including Windows 10, Windows 11, and Windows Server). 

Examples include:

- `%windir%\SoftwareDistribution\Datastore\*\Datastore.edb` 
- `%allusersprofile%\NTUser.pol`
- Windows Update files
- Windows Security files 
- ... and more.

The list of built-in exclusions in Windows is kept up to date as the threat landscape changes. To learn more about these exclusions, see [Microsoft Defender Antivirus exclusions on Windows Server: Built-in exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#built-in-exclusions).

### Attack surface reduction exclusions

[Attack surface reduction rules](attack-surface-reduction.md) (also known as ASR rules) target certain software behaviors, such as:

- Launching executable files and scripts that attempt to download or run files
- Running scripts that seem to be obfuscated or otherwise suspicious
- Performing behaviors that apps don't usually initiate during normal day-to-day work

Sometimes, legitimate applications exhibit software behaviors that could be blocked by attack surface reduction rules. If that's occurring in your organization, you can define exclusions for certain files and folders. Such exclusions are applied to all attack surface reduction rules. See [Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md#exclude-files-and-folders).

> [!NOTE]
> Attack surface reduction rules honor process exclusions, but not all attack surface reduction rules honor Microsoft Defender Antivirus exclusions. See [Attack surface reduction rules reference - Microsoft Defender Antivirus exclusions and ASR rules](attack-surface-reduction-rules-reference.md#microsoft-defender-antivirus-exclusions-and-asr-rules). 

### Automation folder exclusions

Automation folder exclusions apply to [automated investigation and remediation](automated-investigations.md) in Defender for Endpoint, which is designed to examine alerts and take immediate action to resolve detected breaches. As alerts are triggered, and an automated investigation runs, a verdict (Malicious, Suspicious, or No threats found) is reached for each piece of evidence investigated. Depending on the [automation level](automation-levels.md) and other security settings, remediation actions can occur automatically or only upon approval by your security operations team.

You can specify folders, file extensions in a specific directory, and file names to be excluded from automated investigation and remediation capabilities. Such automation folder exclusions apply to all devices onboarded to Defender for Endpoint. These exclusions are still subject to antivirus scans. 

For more information, see [Manage automation folder exclusions](manage-automation-folder-exclusions.md).

### Controlled folder access exclusions

[Controlled folder access](controlled-folders.md) monitors apps for activities that are detected as malicious and protects the contents of certain (protected) folders on Windows devices. Controlled folder access allows only trusted apps to access protected folders, such as common system folders (including boot sectors) and other folders that you specify. You can allow certain apps or signed executables to access protected folders by defining exclusions. 

For more information, See [Customize controlled folder access](customize-controlled-folders.md).

### Custom remediation actions

When Microsoft Defender Antivirus detects a potential threat while running a scan, it attempts to remediate or remove the detected threat. You can define custom remediation actions to configure how Microsoft Defender Antivirus should address certain threats, whether a restore point should be created before remediating, and when threats should be removed. 

For more information, see [Configure remediation actions for Microsoft Defender Antivirus detections](configure-remediation-microsoft-defender-antivirus.md).

## How exclusions and indicators are evaluated

Most organizations have several different types of exclusions and indicators to determine whether users should be able to access and use a file or process. Exclusions and indicators are processed in a particular order so that [policy conflicts are handled systematically](indicator-file.md#policy-conflict-handling).

Here's how it works:

1. If a detected file/process isn't allowed by Windows Defender Application Control and AppLocker, it's blocked. Otherwise, it proceeds to Microsoft Defender Antivirus.

2. If the detected file/process isn't part of an exclusion for Microsoft Defender Antivirus, it's blocked. Otherwise, Defender for Endpoint checks for a custom indicator for the file/process.

3. If the detected file/process has a Block or Warn indicator, that action is taken. Otherwise, the file/process is allowed, and proceeds to evaluation by attack surface reduction rules, controlled folder access, and SmartScreen protection.

4. If the detected file/process isn't blocked by attack surface reduction rules, controlled folder access, or SmartScreen protection, it proceeds to Microsoft Defender Antivirus.

5. If the detected file/process isn't allowed by Microsoft Defender Antivirus, it's checked for an action based on its threat ID.

## How policy conflicts are handled

In cases where Defender for Endpoint indicators conflict, here's what to expect:

- If there are conflicting file indicators, the indicator that uses the most secure hash is applied. For example, SHA256 takes precedence over SHA-1, which takes precedence over MD5.

- If there are conflicting URL indicators, the more strict indicator is used. For [Microsoft Defender SmartScreen](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview), an indicator that uses the longest URL path is applied. For example, `www.dom.ain/admin/` takes precedence over `www.dom.ain`. ([Network protection](network-protection.md) applies to domains, rather than subpages within a domain.)

- If there are similar indicators for a file or process that have different actions, the indicator that is scoped to a specific device group takes precedence over an indicator that targets all devices.

## How automated investigation and remediation works with indicators

[Automated investigation and remediation capabilities](automated-investigations.md) in Defender for Endpoint first determine a verdict for each piece of evidence, and then take an action depending on Defender for Endpoint indicators. Thus, a file/process could get a verdict of "good" (which means no threats were found) and still be blocked if there's an indicator with that action. Similarly, an entity could get a verdict of "bad" (which means it's determined to be malicious) and still be allowed if there's an indicator with that action.

For more information, see [automated investigation and remediation and indicators](indicators-overview.md#automated-investigation-and-remediation-engine).

## Other server workloads and exclusions

If your organization is using other server workloads, such as Exchange Server, SharePoint Server, or SQL Server, keep in mind that only built-in server roles (that could be prerequisites for software you install later) on Windows Server are excluded by [automatic server role exclusions](#automatic-server-role-exclusions) feature (and only when using their default installation location). You'll likely need to define antivirus exclusions for these other workloads, or for all workloads if you disable automatic exclusions.

Here are some examples of technical documentation to identify and implement the exclusions you need:

- [Running antivirus software on Exchange Server](/exchange/antispam-and-antimalware/windows-antivirus-software?view=exchserver-2019&preserve-view=true)
- [Folders to exclude from antivirus scans on SharePoint Server](https://support.microsoft.com/office/certain-folders-may-have-to-be-excluded-from-antivirus-scanning-when-you-use-file-level-antivirus-software-in-sharepoint-01cbc532-a24e-4bba-8d67-0b1ed733a3d9)
- [Choosing antivirus software for SQL Server](https://support.microsoft.com/topic/how-to-choose-antivirus-software-to-run-on-computers-that-are-running-sql-server-feda079b-3e24-186b-945a-3051f6f3a95b)

Depending on what you're using, you might need to refer to the documentation for that server workload.

## See also

- [Address common false-positive scenarios with exclusions](address-unwanted-behaviors-mde.md)
- [Configure exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)
- [Overview of indicators in Microsoft Defender for Endpoint](indicators-overview.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
