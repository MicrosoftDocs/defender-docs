---
title: Protect folders from ransomware with controlled folder access
description: Controlled folder access in Microsoft Defender Antivirus protects your important folders from ransomware by allowing only trusted apps to change files.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 06/16/2026
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom:
  - asr
  - sfi-image-nochange
ms.subservice: asr
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to understand how controlled folder access protects important folders from ransomware so that I can decide how to deploy it in my organization.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As an IT admin, I want to understand how controlled folder access protects important folders from ransomware so that I can decide how to deploy it in my organization.
---

# Controlled folder access (CFA) overview

Controlled folder access (CFA) in Microsoft Defender Antivirus helps protect your files from ransomware threats. It's one of the [attack surface reduction](attack-surface-reduction-overview.md) capabilities in Microsoft Defender for Endpoint.

Ransomware encrypts your files and holds them hostage. CFA counters this threat by allowing only trusted apps to change files in protected folders. When an untrusted app tries to change a file in a protected folder, CFA blocks the attempt and notifies you.

CFA is based on the following elements:

- **Protected folders**: The folders that CFA guards. Untrusted apps can't modify or delete files in these folders. CFA protects an [unmodifiable set of default folders](#default-folders-protected-by-cfa), and you can [add other folders](#add-other-folders-to-cfa).
- **Trusted apps**: The apps that are allowed to change files in protected folders. Microsoft Defender Antivirus assesses every type of executable file (including `.exe`, `.scr`, and `.dll` files) and automatically trusts most apps based on their prevalence and reputation. You can [allow other apps](#allow-apps-to-modify-files-in-protected-folders) that you trust if CFA blocks them.
- **Disk sectors**: The low-level disk sectors that store the boot record on protected devices. Untrusted apps can't write directly to these sectors. This protection helps block boot-level threats such as bootkits and disk-wiper malware that try to overwrite the boot record. Unlike protected folders and trusted apps, disk sector protection rarely conflicts with everyday apps, so you can apply it on its own. For more information, see [Modes for CFA](#modes-for-cfa).

When an app with an unknown reputation triggers CFA, the following events happen:

- A pop-up notification appears on the device. For example, `Controlled folder access blocked C:\...\ApplicationName... from making changes to memory.` You can customize the information in the notification. For more information, see [Customize contact information in Windows Security](/windows/security/threat-protection/windows-defender-security-center/wdsc-customize-contact-information).
- A `Protected memory access blocked` entry appears on the [Protection History page of the Windows Security app](https://support.microsoft.com/windows/protection-history-f1e5fd95-09b4-46d1-b8c7-1059a1e09708) on the device.
- The block or audit is recorded as an event that you can [monitor](controlled-folder-access-monitor.md).

CFA works best with [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md), which provides detailed reporting on events and blocks as part of the usual [alert investigation scenarios](investigate-alerts.md).

## Requirements for CFA

CFA requires Microsoft Defender Antivirus as the primary antivirus app on Windows devices:

- Microsoft Defender Antivirus must be enabled and in Active mode. CFA doesn't work in any other modes, including:
  - Passive
  - Passive Mode with Endpoint Detection and Response (EDR) in Block Mode
  - Limited periodic scanning (LPS)
  - Off

  For more information about modes in Microsoft Defender Antivirus, see [How Microsoft Defender Antivirus affects Defender for Endpoint functionality](microsoft-defender-antivirus-compatibility.md#how-microsoft-defender-antivirus-affects-defender-for-endpoint-functionality).

- [Real-time protection in Microsoft Defender Antivirus](configure-real-time-protection-microsoft-defender-antivirus.md) must be on.

- Although CFA doesn't require [Microsoft 365 E5](https://www.microsoft.com/microsoft-365/enterprise/office-365-e5), Microsoft recommends the security capabilities of E5 or equivalent subscriptions to take advantage of the following advanced management capabilities:
  - Monitoring, analytics, and workflows in Defender for Endpoint.
  - Reporting and configuration capabilities in the Microsoft Defender XDR portal.

  Advanced management capabilities aren't available with other licenses (for example, Windows Professional or Microsoft 365 E3). However, you can develop your own monitoring and reporting tools based on the CFA events generated in Windows Event Viewer on each device (for example, [Windows Event Forwarding](/windows/security/operating-system-security/device-management/use-windows-event-forwarding-to-assist-in-intrusion-detection)).

  To learn more about Windows licensing, see [Windows Licensing](https://www.microsoft.com/licensing/product-licensing/windows) and get the [Microsoft Volume Licensing Reference Guide](https://www.microsoft.com/download/details.aspx?id=11091).

## Supported operating systems for CFA

CFA is a Microsoft Defender Antivirus feature available on any edition of Windows that includes Microsoft Defender Antivirus (for example, Windows 11 Home). For the methods you can use to turn it on, see [Deployment and configuration methods for CFA](#deployment-and-configuration-methods-for-cfa).

Centralized management, reporting, and alerting for CFA in Microsoft Defender for Endpoint are available in the following editions and versions of Windows:

- **Pro** and **Enterprise** editions of Windows 10 or later.
- Windows Server 2012 R2 or later.
- Azure Local (formerly known as Azure Stack HCI) version 23H2 or later.

> [!NOTE]
> CFA is a Windows feature. It isn't available on Linux or macOS devices, even those onboarded to Microsoft Defender for Endpoint.

## Modes for CFA

CFA is turned off by default. To use it, you turn it on and select one of the following modes:

|Mode|Code|Description|
|---|:---:|---|
|**Disabled** (default)|0|CFA is off. All apps can modify or delete files in protected folders and write to disk sectors.|
|**Enabled** or <br/> **Block**|1|Untrusted apps can't modify or delete files in protected folders or write to disk sectors.|
|**Audit Mode**|2|Untrusted apps can modify or delete files in protected folders and write to disk sectors, but these attempts are recorded. <br/><br/> Use this mode to [assess the effect of CFA](controlled-folder-access-monitor.md#use-audit-mode-to-measure-the-effect-of-cfa) on your organization without blocking apps.|
|**Block disk modification only**|3|Untrusted apps are blocked from writing to disk sectors, and these attempts are recorded. Untrusted apps can still modify or delete files in protected folders.|
|**Audit disk modification only**|4|Attempts by untrusted apps to write to disk sectors are recorded. Attempts to modify or delete files in protected folders aren't recorded, and no apps are blocked.|

For the Windows event IDs that each mode generates, see [CFA events in Windows Event Viewer](controlled-folder-access-monitor.md#cfa-events-in-windows-event-viewer).

Microsoft recommends running CFA in **Audit Mode** first to assess its effect before you move to **Enabled** (block) mode. By [monitoring audit events](controlled-folder-access-monitor.md) and [allowing the apps your users need](controlled-folder-access-configure.md), you can enable CFA without reducing productivity.

The **Block disk modification only** and **Audit disk modification only** modes act only on writes to the disk sectors that store the boot record. They don't affect files in protected folders. Consider one of these modes in the following scenarios:

- You want to protect the boot record from bootkits and disk-wiper malware, but full protected-folder protection blocks too many of your line-of-business apps or requires too much tuning. Disk sector writes rarely come from legitimate apps, so this protection generates few false positives.
- You already protect user files another way (for example, OneDrive Known Folder Move with versioning, or a separate backup or anti-ransomware control), so you only need the boot record protection that CFA adds.
- You want to limit the performance effect of evaluating file writes, especially for [shared network folders](controlled-folder-access-monitor.md#use-audit-mode-to-measure-the-effect-of-cfa).
- You want to roll out protection in stages. For example, you can turn on **Block disk modification only** in production right away while you run protected-folder protection in **Audit Mode** and build your list of allowed apps.

Use **Audit disk modification only** first to confirm that no legitimate software (for example, disk-imaging, backup, encryption, or partitioning tools) writes to disk sectors before you switch to **Block disk modification only**.

Not every configuration method for CFA supports every mode. The following table shows which modes each [deployment and configuration method](#deployment-and-configuration-methods-for-cfa) supports.

|Mode|Intune|Configuration Manager|MDM CSP|Group Policy|PowerShell|Windows Security app|
|---|:---:|:---:|:---:|:---:|:---:|:---:|
|**Disabled**|Yes|Yes|Yes|Yes|Yes|Yes|
|**Enabled** (Block)|Yes|Yes|Yes|Yes|Yes|Yes|
|**Audit Mode**|Yes|Yes|Yes|Yes|Yes|No|
|**Block disk modification only**|Yes|No|Yes|Yes|Yes|No|
|**Audit disk modification only**|Yes|No|Yes|Yes|Yes|No|

## Deployment and configuration methods for CFA

Microsoft Defender for Endpoint supports CFA but doesn't include a built-in method to deploy the settings to devices. Instead, you use a separate deployment or management tool to create and distribute CFA settings.

The following table summarizes the available methods. For detailed configuration instructions, see [Configure CFA](controlled-folder-access-configure.md).

|Method|Description|
|---|---|
|[Microsoft Intune](controlled-folder-access-configure.md#configure-cfa-in-intune-using-endpoint-security-policies)|The recommended method. Configure and deploy CFA to devices by using endpoint security policies. Requires [Microsoft Intune](/intune/intune-service/fundamentals/licenses).|
|[Any MDM solution using the Policy CSP](controlled-folder-access-configure.md#configure-cfa-in-any-mdm-solution-using-the-policy-csp)|Use the Windows [Policy configuration service provider (CSP)](/windows/client-management/mdm/policy-configuration-service-provider) with any mobile device management (MDM) solution.|
|[Microsoft Configuration Manager](controlled-folder-access-configure.md#configure-cfa-in-microsoft-configuration-manager)|Configure CFA in a Windows Defender Exploit Guard policy.|
|[Group Policy](controlled-folder-access-configure.md#configure-cfa-in-group-policy)|Use centralized Group Policy to configure and deploy CFA to domain-joined devices, or configure Group Policy locally on individual devices.|
|[PowerShell](controlled-folder-access-configure.md#enable-and-configure-cfa-in-powershell)|Configure CFA locally on individual devices.|
|[Windows Security app](controlled-folder-access-configure.md#configure-cfa-in-the-windows-security-app)|Configure CFA locally on an individual device.|

<a name="windows-system-folders-are-protected-by-default"></a>

## Default folders protected by CFA

By default, CFA protects the following locations on Windows devices:

- Hard drive boot sectors
- The following folders for user accounts and system accounts (for example, `LocalService`, `NetworkService`, and `systemprofile`):
  - `C:\Users\<username>\Documents`
  - `C:\Users\<username>\Favorites`
  - `C:\Users\<username>\Music`
  - `C:\Users\<username>\Pictures`
  - `C:\Users\<username>\Videos`
  - `C:\Users\Public\Documents`
  - `C:\Users\Public\Music`
  - `C:\Users\Public\Pictures`
  - `C:\Users\Public\Videos`

> [!NOTE]
> The previous paths are the default locations. If a folder is redirected, CFA protects the folder in its redirected location. For example, when OneDrive Known Folder Move backs up your Documents, Pictures, or Desktop folder to `C:\Users\<username>\OneDrive - <organization>\`, CFA protects the folder in OneDrive.
>
> You can't modify the list of default protected folders.

You can use either of the following methods to see the actual list of default protected folders on a Windows device:

- Open the Windows Security app as described in [Configure CFA in the Windows Security app](controlled-folder-access-configure.md#configure-cfa-in-the-windows-security-app). When CFA is turned on, the default folders appear at the bottom of the list.
- In an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**), run the following command.

  ```powershell
  (Get-MpPreference).ControlledFolderAccessDefaultProtectedFolders
  ```

  The command returns the list of default protected folders only when CFA is turned on.

<a name="view-or-change-the-list-of-protected-folders"></a>

## Add other folders to CFA

Although you can't modify or remove the default folders from protection, you can add more folders to protect. When you add a folder, its subfolders are also protected.

Add folders when you store important data in locations that aren't already covered by the default protected folders.

When you specify more protected folders, keep these points in mind:

- Network shares and mapped drives are supported.
- Environment variables are supported, but wildcards aren't.
- Don't add local share paths (loopbacks) as protected folders. Use the local path instead. For example, if you shared `C:\demo` as `\\mycomputer\demo`, use `C:\demo`, not `\\mycomputer\demo`.

> [!NOTE]
> If your workflow involves shared network folders, enabling CFA can result in significant network performance reduction when an untrusted process accesses the shared network folders, particularly because of many queries to the file share server. Make sure your file servers are optimized for increased network traffic, especially if you use shared network folders for offline files.

For instructions, see [Configure CFA](controlled-folder-access-configure.md).

## Allow apps to modify files in protected folders

You can allow specific apps that you trust to make changes to files in protected folders. Allowing an app is useful when CFA blocks a known, trusted app. For instructions, see [Configure CFA](controlled-folder-access-configure.md).

By default, Microsoft Defender Antivirus automatically trusts apps based on their prevalence and reputation, and adds them to the allowed list. The list of automatically trusted apps isn't shown in the Windows Security app or by the associated PowerShell cmdlets. You shouldn't need to add most apps. Add an app only if it's blocked and you can verify that it's trustworthy.

When you add an app, you specify the app's location. Only the app in that location is allowed to access protected folders. If an app with the same name is in a different location, it isn't added to the allowed list and might be blocked.

Unlike protected folders, allowed apps support both environment variables and wildcards (`*`) in the path. Use wildcards only in the folder portion of the path, not in the app's file name. Wildcards are useful when the executable lives in a folder whose name changes between versions or installations. The following examples show common patterns:

|Pattern|Example|What it allows|
|---|---|---|
|Environment variable|`%ProgramFiles%\Contoso\PhotoVault\PhotoVault.exe`|A fixed install location, regardless of the system drive letter.|
|Wildcard for a version folder|`%ProgramFiles%\Fabrikam\DriveManager\*\DriveService.exe`|The executable under any version subfolder (for example, `1.2.0` or `1.3.0`).|
|Environment variable and wildcard|`%LOCALAPPDATA%\Contoso\app-*\resources\helper.exe`|Per-update install folders such as `app-2.1.7` in the user's profile.|
|Multiple wildcards|`%ProgramFiles(x86)%\Adatum\*\Plugins\*\update.exe`|An executable nested under more than one variable folder name.|
|Wildcard for randomly named folders|`C:\Windows\Temp\*\Setup\installer.exe`|An installer that extracts to a randomly named temporary folder.|

> [!NOTE]
> Unlike Microsoft Defender Antivirus and attack surface reduction (ASR) rule exclusions, which support only [system environment variables](configure-extension-file-exclusions-microsoft-defender-antivirus.md#system-environment-variables), CFA allowed apps also support user environment variables such as `%LOCALAPPDATA%` and `%USERPROFILE%`. CFA resolves the path in the context of the user who runs the app.

An allowed app takes effect only when the app or service starts. For example, if you allow an update service that's already running, the update service continues to trigger CFA events until you restart the service.

You can also use Microsoft Defender for Endpoint [indicators of compromise (IoCs)](indicators-overview.md) to allow signed executable files to access protected folders. For more information, see [Create indicators based on certificates](indicator-certificates.md).

> [!NOTE]
> Script engines like PowerShell aren't trusted by CFA, even if you create an "allow" indicator by using [indicators of compromise (IoCs)](indicators-overview.md). The only way to allow script engines to modify protected folders is by adding them as an allowed app for CFA. For instructions, see [Configure CFA](controlled-folder-access-configure.md).

## Monitor CFA activity

For complete information, see [Monitor attack surface reduction (ASR) rule activity](attack-surface-reduction-rules-monitor.md).

## Related content

- [Monitor controlled folder access (CFA) activity](controlled-folder-access-monitor.md)
- [Configure controlled folder access (CFA)](controlled-folder-access-configure.md)
- [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md)
