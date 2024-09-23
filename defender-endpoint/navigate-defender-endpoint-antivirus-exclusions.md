---
title: Exclusions overview
description: Learn how to navigate exclusions for Defender for Endpoint and Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.topic: how-to
author: denisebmsft
ms.author: deniseb
ms.custom: nextgen
ms.date: 09/23/2024
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

**Applies to:**

- Microsoft Defender Antivirus
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

> [!NOTE]
> As a Microsoft MVP, [Fabian Bader](https://cloudbrothers.info) contributed to and provided material feedback for this article.

[Microsoft Defender for Endpoint](microsoft-defender-endpoint.md) includes a wide range of capabilities to prevent, detect, investigate, and respond to advanced cyberthreats. These capabilities include [Next-generation protection](next-generation-protection.md) (which includes Microsoft Defender Antivirus). 

As with any endpoint protection or antivirus solution, sometimes files, folders, or processes that aren't actually a threat can be detected as malicious by Defender for Endpoint or Microsoft Defender Antivirus. These entities can be blocked or sent to quarantine, even though they're not really a threat. 

This article explains the various types of exclusions that can be defined or actions that can be taken for Defender for Endpoint and Microsoft Defender Antivirus to help manage these situations. 

> [!CAUTION]
> **Defining exclusions reduces the level of protection offered by Defender for Endpoint and Microsoft Defender Antivirus**. Use exclusions as a last resort, and make sure to define only the exclusions that are necessary. Make sure to review your exclusions periodically, and remove the ones you no longer need. See [Important points about exclusions](configure-exclusions-microsoft-defender-antivirus.md#important-points-about-exclusions) and [Common mistakes to avoid](common-exclusion-mistakes-microsoft-defender-antivirus.md).

## Types of exclusions

The following table summarizes the different exclusion types and capabilites in Defender for Endpoint and Microsoft Defender Antivirus. Select each type to see more information about it. 

> [!TIP]
>
> - [Defender for Endpoint Plan 1](defender-endpoint-plan-1.md) is available as a standalone plan, and is included in Microsoft 365 E3.
> - [Defender for Endpoint Plan 2](microsoft-defender-endpoint.md) is available as a standalone plan, and is included in Microsoft 365 E5.
> - If you have Microsoft 365 E3 or E5, make sure to [set up your Defender for Endpoint capabilities](deployment-strategy.md).

| Exclusion types | Configuration | Description | 
|:---|:----| :----| 
| [Automatic Microsoft Defender Antivirus exclusions](#automatic-exclusions) | Automatic | Automatic Exclusions for server roles and features in Windows Server. When you install a role on Windows Server 2016 or later, Microsoft Defender Antivirus includes automatic exclusions for the server role and any files that are added while installing the role. <br/> _Note: for active roles on Windows Server 2016 and later_. |
| [Built-in Microsoft Defender Antivirus exclusions](#built-in-exclusions) | Automatic |Microsoft Defender Antivirus includes built in exclusions for operating system files on all versions of Windows.|
| [Custom Microsoft Defender Antivirus exclusions](#custom-exclusions) | Customer | You can add an exclusion for a file, folder, or process that was detected and identified as malicious, even though it isn't a threat. The files, folders, or processes you exclude will be skipped by scheduled scans, on-demand scans, and real-time protection. |
| [Defender for Endpoint attack surface reduction exclusions](#attack-surface-reduction-exclusions) | Customer | If attack surface reducion rules cause ununexpected behavior in your organization, you can define exclusions for certain files and folders. Such exclusions are applied to all attack surface reduction rules.|
| [Defender for Endpoint Indicators](#defender-for-endpoint-indicators) | Customer | You can define indicators with specific actions for entities, such as files, IP addresses, URLs/domains, and certificates. When you define your indicators, you can specify actions such as "Allow" where Defender for Endpoint won't block files, IP addresses, URLs/domains, or certificates that have Allow indicators. |
| [Defender for Endpoint controlled folder access exclusions](#controlled-folder-access-exclusions) | Customer | You can allow certain apps or signed executables to access protected folders by defining exclusions.|
| [Defender for Endpoint automation folder exclusions](#automation-folder-exclusions) | Customer | Automated investigation and remediation in Defender for Endpoint examines alerts and takes immediate action to automatically resolve detected breaches. You can specify folders, file extensions in a specific directory, and file names to be excluded from automated investigation and remediation capabilities.|
 
> [!Note] 
> Microsoft Defender Antivirus exclusions can apply to antivirus scans and/or to real-time protection. 

> [!Note] 
> The standalone versions of Defender for Endpoint Plan 1 and Plan 2 don't include server licenses. To onboard servers, you need another license, such as Microsoft Defender for Endpoint for Servers or [Microsoft Defender for Servers Plan 1 or 2](/azure/defender-for-cloud/defender-for-servers-introduction). To learn more, see [Defender for Endpoint onboarding Windows Server](onboard-windows-server.md). <br/><br/> If you're a small or medium-sized business using [Microsoft Defender for Business](/defender-business/mdb-overview), you can get [Microsoft Defender for Business servers](/defender-business/get-defender-business#how-to-get-microsoft-defender-for-business-servers).|

The following sections describe these exclusions in more detail.

### Automatic exclusions

[Automatic exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#automatic-server-role-exclusions) (also referred to as *automatic server role exclusions*) include exclusions for server roles and features in Windows Server. These exclusions aren't scanned by [real-time protection](configure-protection-features-microsoft-defender-antivirus.md) but are still subject to [quick, full, or on-demand antivirus scans](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan). 

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

### Built-in exclusions

[Built-in exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#built-in-exclusions) include certain operating system files that are excluded by Microsoft Defender Antivirus on all versions of Windows (including Windows 10, Windows 11, and Windows Server). 

Examples include:

- `%windir%\SoftwareDistribution\Datastore\*\Datastore.edb` 
- `%allusersprofile%\NTUser.pol`
- Windows Update files
- Windows Security files 
- ... and more.

The list of built-in exclusions in Windows is kept up to date as the threat landscape changes. To learn more about these exclusions, see [Microsoft Defender Antivirus exclusions on Windows Server: Built-in exclusions](configure-server-exclusions-microsoft-defender-antivirus.md#built-in-exclusions).

### Custom exclusions

[Custom exclusions](configure-exclusions-microsoft-defender-antivirus.md) include files and folders that you specify. Exclusions for files, folders, and processes will be skipped by scheduled scans, on-demand scans, and real-time protection. Exclusions for process-opened files won't be scanned by [real-time protection](configure-protection-features-microsoft-defender-antivirus.md) but are still subject to [quick, full, or on-demand antivirus scans](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan).

### Custom remediation actions

When Microsoft Defender Antivirus detects a potential threat while running a scan, it attempts to remediate or remove the detected threat. You can define custom remediation actions to configure how Microsoft Defender Antivirus should address certain threats, whether a restore point should be created before remediating, and when threats should be removed. [Configure remediation actions for Microsoft Defender Antivirus detections](configure-remediation-microsoft-defender-antivirus.md).

### Attack surface reduction exclusions

[Attack surface reduction rules](attack-surface-reduction.md) (also known as ASR rules) target certain software behaviors, such as:

- Launching executable files and scripts that attempt to download or run files
- Running scripts that seem to be obfuscated or otherwise suspicious
- Performing behaviors that apps don't usually initiate during normal day-to-day work

Sometimes, legitimate applications exhibit software behaviors that could be blocked by attack surface reduction rules. If that's occurring in your organization, you can define exclusions for certain files and folders. Such exclusions are applied to all attack surface reduction rules. See [Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md#exclude-files-and-folders).

Also note that while most ASR rules exclusions are independent from Microsoft Defender Antivirus exclusions, some ASR rules do honor some Microsoft Defender Antivirus exclusions. See [Attack surface reduction rules reference - Microsoft Defender Antivirus exclusions and ASR rules](attack-surface-reduction-rules-reference.md#microsoft-defender-antivirus-exclusions-and-asr-rules).

### Defender for Endpoint indicators

You can define [indicators](manage-indicators.md) with specific actions for entities, such as files, IP addresses, URLs/domains, and certificates. In Defender for Endpoint, indicators are referred to as Indicators of Compromise (IoCs), and less often, as custom indicators. When you define your indicators, you can specify one of the following actions:

- **Allow** – Defender for Endpoint won't block files, IP addresses, URLs/domains, or certificates that have Allow indicators. (*Use this action with caution.*)

- **Audit** – Files, IP addresses, and URLs/domains with Audit indicators are monitored, and when they're accessed by users, informational alerts are generated in the Microsoft Defender portal.

- **Block and Remediate** – Files or certificates with Block and Remediate indicators are blocked and quarantined when detected.

- **Block Execution** – IP addresses and URLs/domains with Block Execution indicators are blocked. Users can't access those locations.

- **Warn** – IP addresses and URLs/domains with Warn indicators cause a warning message to be displayed when a user attempts to access those locations. Users can choose to bypass the warning and proceed to the IP address or URL/domain.

> [!IMPORTANT]
> You can have up to 15,000 indicators in your tenant.

The following table summarizes IoC types and available actions:

| Indicator type | Available actions |
|:---|:---|
| [Files](indicator-file.md) | - Allow <br/> - Audit <br/> - Warn <br/> - Block execution <br/> - Block and remediate |
| [IP addresses and URLs/domains](indicator-ip-domain.md) | - Allow <br/> - Audit <br/> - Warn <br/> - Block execution |
| [Certificates](indicator-certificates.md) | - Allow <br/> - Block and remediate |

> [!TIP]
> See the following resources to learn more about indicators:
>
> - [Create indicators](manage-indicators.md)
> - [Create indicators for files](indicator-file.md)
> - [Create indicators for IP addresses and URLs/domains](indicator-ip-domain.md)
> - [Create indicators based on certificates](indicator-certificates.md)
> - [Manage indicators](indicator-manage.md)

### Controlled folder access exclusions

[Controlled folder access](controlled-folders.md) monitors apps for activities that are detected as malicious and protects the contents of certain (protected) folders on Windows devices. Controlled folder access allows only trusted apps to access protected folders, such as common system folders (including boot sectors) and other folders that you specify. You can allow certain apps or signed executables to access protected folders by defining exclusions. See [Customize controlled folder access](customize-controlled-folders.md).

### Automation folder exclusions

Automation folder exclusions apply to [automated investigation and remediation](automated-investigations.md) in Defender for Endpoint, which is designed to examine alerts and take immediate action to resolve detected breaches. As alerts are triggered, and an automated investigation runs, a verdict (Malicious, Suspicious, or No threats found) is reached for each piece of evidence investigated. Depending on the [automation level](automation-levels.md) and other security settings, remediation actions can occur automatically or only upon approval by your security operations team.

You can specify folders, file extensions in a specific directory, and file names to be excluded from automated investigation and remediation capabilities. Such automation folder exclusions apply to all devices onboarded to Defender for Endpoint. These exclusions are still subject to antivirus scans. See [Manage automation folder exclusions](manage-automation-folder-exclusions.md).

## How exclusions and indicators are evaluated

Most organizations have several different types of exclusions and indicators to determine whether users should be able to access and use a file or process. Exclusions and indicators are processed in a particular order so that [policy conflicts are handled systematically](indicator-file.md#policy-conflict-handling).

The following image summarizes how exclusions and indicators are handled across Defender for Endpoint and Microsoft Defender Antivirus:

:::image type="content" source="media/mdav-mde-flow.png" alt-text="Screenshot that Shows the order in which exclusions and indicators are evaluated." lightbox="media/mdav-mde-flow.png":::

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

The following diagram shows how [automated investigation and remediation works with indicators](manage-indicators.md#automated-investigation-and-remediation-engine):

:::image type="content" source="media/air-exclusions.png" alt-text="Screenshot that Shows automated investigation and remediation and indicators." lightbox="media/air-exclusions.png":::

## Other server workloads and exclusions

If your organization is using other server workloads, such as Exchange Server, SharePoint Server, or SQL Server, be aware that only built-in server roles (that could be prerequisites for software you install later) on Windows Server are excluded by [automatic exclusions](#automatic-exclusions) feature (and only when using their default installation location). You'll likely need to define antivirus exclusions for these other workloads, or for all workloads if you disable automatic exclusions.

Here are some examples of technical documentation to identify and implement the exclusions you need:

- [Running antivirus software on Exchange Server](/exchange/antispam-and-antimalware/windows-antivirus-software?view=exchserver-2019&preserve-view=true)
- [Folders to exclude from antivirus scans on SharePoint Server](https://support.microsoft.com/office/certain-folders-may-have-to-be-excluded-from-antivirus-scanning-when-you-use-file-level-antivirus-software-in-sharepoint-01cbc532-a24e-4bba-8d67-0b1ed733a3d9)
- [Choosing antivirus software for SQL Server](https://support.microsoft.com/topic/how-to-choose-antivirus-software-to-run-on-computers-that-are-running-sql-server-feda079b-3e24-186b-945a-3051f6f3a95b)

Depending on what you're using, you might need to refer to the documentation for that server workload.

> [!TIP]
> **Performance tip** Due to a variety of factors, Microsoft Defender Antivirus, like other antivirus software, can cause performance issues on endpoint devices. In some cases, you might need to tune the performance of Microsoft Defender Antivirus to alleviate those performance issues. Microsoft's **Performance analyzer** is a PowerShell command-line tool that helps determine which files, file paths, processes, and file extensions might be causing performance issues; some examples are: 
>
> - Top paths that impact scan time
> - Top files that impact scan time
> - Top processes that impact scan time
> - Top file extensions that impact scan time
> - Combinations, such as:
>   - top files per extension
>   - top paths per extension
>   - top processes per path
>   - top scans per file
>   - top scans per file per process
>
> You can use the information gathered using Performance analyzer to better assess performance issues and apply remediation actions. 
> See: [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md).

## See also

- [Submissions, suppressions and exclusions](submissions-suppressions-exclusions.md)
- [Important points about exclusions](configure-exclusions-microsoft-defender-antivirus.md#important-points-about-exclusions)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
