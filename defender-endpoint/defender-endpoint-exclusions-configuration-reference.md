---
title: Exclusions reference for Microsoft Defender for Endpoint
description: Compare how to configure Microsoft Defender for Endpoint and Microsoft Defender Antivirus exclusions with each management tool, from Intune to PowerShell.
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.service: defender-endpoint
ms.subservice: onboard
ms.topic: how-to
ms.localizationpriority: medium
ms.date: 07/01/2026
ms.custom:
  - msecd-doc-authoring-1015
  - partner-contribution
ms.collection:
- m365-security
- tier2
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to know which management tool supports each exclusion type so that I can configure exclusions with the right tool.
---

# Exclusions reference for Microsoft Defender for Endpoint

Microsoft Defender for Endpoint and Microsoft Defender Antivirus support several types of exclusions, and the tool you use to configure them depends on your environment. This reference maps each exclusion type to the management tools that support it, and points to step-by-step instructions for each combination.

Use this article when you know which exclusion you need and want to find the right tool to configure it, on Windows, Linux, or macOS. To learn what exclusions are, when to use them, and the risks they introduce, see [Overview of exclusions and indicators in Microsoft Defender for Endpoint](defender-endpoint-exclusions-overview.md).

## Manage exclusions for Windows devices

The following table shows which exclusion types are supported by each management tool. The table uses the following abbreviations:

- **Custom AV**: Custom antivirus exclusions.
- **ASR global**: Exclusions that affect all attack surface reduction rules only.
- **ASR per rule**: Per-rule attack surface reduction exclusions.
- **CFA**: Controlled folder access.
- **Automation folder**: Folder exclusions for automated investigation and remediation.
- **Automatic server role**: Disable automatic server role exclusions on Windows Server 2016 or later.

|Management tool|[Custom AV](#custom-antivirus-exclusions)|[ASR global](#attack-surface-reduction-rule-global-exclusions)|[ASR per rule](#per-asr-rule-exclusions)|[CFA](#controlled-folder-access-exclusions)|[Automation<br/>folder](#automation-folder-exclusions)|[Automatic<br/>server role](#automatic-server-role-exclusions)|
|---|:---:|:---:|:---:|:---:|:---:|:---:|
|**Enterprise management**|||||||
|Microsoft Intune admin center|Yes|Yes|Yes|Yes|No|No|
|Microsoft Defender portal|Yes|Yes|Yes|Yes|Yes|No|
|Microsoft Configuration Manager|Yes|Yes|No|Yes|No|No|
|Policy CSP|Yes|Yes|No|Yes|No|No|
|GPO|Yes|Yes|Yes|Yes|No|Yes|
|**Local configuration**|||||||
|PowerShell|Yes|Yes|No|Yes|No|Yes|
|WMI|Yes|No|No|No|No|Yes|
|Windows Security app|Yes|No|No|Yes|No|No|

The following sections show how to configure each exclusion type with each management tool.

### Custom antivirus exclusions

For more information about custom exclusions in Microsoft Defender Antivirus, see [Exclusions in Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-overview.md).

The following list shows how to manage this exclusion type with each management tool:

- **Enterprise management**:
  - **Microsoft Intune admin center**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in Microsoft Intune](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-microsoft-intune).
  - **Microsoft Defender portal**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in the Microsoft Defender portal](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-the-microsoft-defender-portal).
  - **Microsoft Configuration Manager**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in Microsoft Configuration Manager](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-microsoft-configuration-manager).
  - **Policy CSP**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in any MDM solution using the Policy CSP](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-any-mdm-solution-using-the-policy-csp).
  - **GPO**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in Group Policy](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-group-policy).
- **Local configuration**:
  - **PowerShell**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in PowerShell](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-powershell).
  - **WMI**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in WMI](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-wmi).
  - **Windows Security app**: For instructions, see [Configure Microsoft Defender Antivirus exclusions in the Windows Security app](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-the-windows-security-app).

> [!NOTE]
> The Windows Security app doesn't support [contextual exclusions](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions).
>
> Exclusion changes you make in Group Policy appear in the Windows Security app, but changes you make in the Windows Security app don't appear in Group Policy.

### Attack surface reduction rule global exclusions

For more information about global attack surface reduction (ASR) rule exclusions, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

The following list shows how to manage this exclusion type with each management tool:

- **Enterprise management**:
  - **Microsoft Intune admin center**: For instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).
  - **Microsoft Defender portal**: For instructions, see [Configure ASR rules and exclusions in the Microsoft Defender portal](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-the-microsoft-defender-portal).
  - **Microsoft Configuration Manager**: For instructions, see [Configure ASR rules and global ASR rule exclusions in Microsoft Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-global-asr-rule-exclusions-in-microsoft-configuration-manager).
  - **Policy CSP**: For instructions, see [Configure global ASR rule exclusions in any MDM solution using the Policy CSP](attack-surface-reduction-rules-configure.md#configure-global-asr-rule-exclusions-in-any-mdm-solution-using-the-policy-csp).
  - **GPO**: For instructions, see [Configure global ASR rule exclusions in group policy](attack-surface-reduction-rules-configure.md#configure-global-asr-rule-exclusions-in-group-policy).
- **Local configuration**:
  - **PowerShell**: For instructions, see [Configure global ASR rule exclusions in PowerShell](attack-surface-reduction-rules-configure.md#configure-global-asr-rule-exclusions-in-powershell).
  - **WMI**: Not supported.
  - **Windows Security app**: Not supported.

### Per-ASR rule exclusions

For more information about per-ASR rule exclusions, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

The following list shows how to manage this exclusion type with each management tool:

- **Enterprise management**:
  - **Microsoft Intune admin center**: For instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).
  - **Microsoft Defender portal**: For instructions, see [Configure ASR rules and exclusions in the Microsoft Defender portal](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-the-microsoft-defender-portal).
  - **Microsoft Configuration Manager**: Not supported.
  - **Policy CSP**: Not supported.
  - **GPO**: For instructions, see [Configure per-ASR rule exclusions in group policy](attack-surface-reduction-rules-configure.md#configure-per-asr-rule-exclusions-in-group-policy).
- **Local configuration**:
  - **PowerShell**: Not supported.
  - **WMI**: Not supported.
  - **Windows Security app**: Not supported.

### Controlled folder access exclusions

For more information about controlled folder access (CFA) exclusions, see [Allow apps to modify files in protected folders](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders).

The following list shows how to manage this exclusion type with each management tool:

- **Enterprise management**:
  - **Microsoft Intune admin center**: For instructions, see [Configure CFA in Intune using endpoint security policies](controlled-folder-access-configure.md#configure-cfa-in-intune-using-endpoint-security-policies).
  - **Microsoft Defender portal**: For instructions, see [Configure CFA in the Microsoft Defender portal](controlled-folder-access-configure.md#configure-cfa-in-the-microsoft-defender-portal).
  - **Microsoft Configuration Manager**: For instructions, see [Configure CFA in Microsoft Configuration Manager](controlled-folder-access-configure.md#configure-cfa-in-microsoft-configuration-manager).
  - **Policy CSP**: For instructions, see [Allow apps to modify files in protected folders using the Policy CSP](controlled-folder-access-configure.md#allow-apps-to-modify-files-in-protected-folders-using-the-policy-csp).
  - **GPO**: For instructions, see [Allow apps to modify files in protected folders in Group Policy](controlled-folder-access-configure.md#allow-apps-to-modify-files-in-protected-folders-in-group-policy).
- **Local configuration**:
  - **PowerShell**: For instructions, see [Allow apps to modify files in protected folders in PowerShell](controlled-folder-access-configure.md#allow-apps-to-modify-files-in-protected-folders-in-powershell).
  - **WMI**: Not supported.
  - **Windows Security app**: For instructions, see [Allow apps to modify files in protected folders in the Windows Security app](controlled-folder-access-configure.md#allow-apps-to-modify-files-in-protected-folders-in-the-windows-security-app).

### Automation folder exclusions

An automated exclusion entry identifies the folder and (optionally) specific files within that folder to exclude from [automated investigation and remediation](automated-investigations.md). For more information, see [Automation folder exclusions](defender-endpoint-exclusions-overview.md#automation-folder-exclusions).

The following list shows how to manage this exclusion type with each management tool:

- **Enterprise management**:
  - **Microsoft Intune admin center**: Not supported.
  - **Microsoft Defender portal**: For instructions, see [Configure automation folder exclusions](automation-folder-exclusions-configure.md).
  - **Microsoft Configuration Manager**: Not supported.
  - **Policy CSP**: Not supported.
  - **GPO**: Not supported.
- **Local configuration**:
  - **PowerShell**: Not supported.
  - **WMI**: Not supported.
  - **Windows Security app**: Not supported.

### Automatic server role exclusions

Automatic server role exclusions apply to Microsoft Defender Antivirus on Windows Server 2016 and later. For more information, see [Automatic server role exclusions](microsoft-defender-antivirus-exclusions-windows-server.md#automatic-server-role-exclusions).

The following list shows how to manage this exclusion type with each management tool:

- **Enterprise management**:
  - **Microsoft Intune admin center**: Not supported.
  - **Microsoft Defender portal**: Not supported.
  - **Microsoft Configuration Manager**: Not supported.
  - **Policy CSP**: Not supported.
  - **GPO**: For instructions, see [Disable automatic exclusions in Group Policy](microsoft-defender-antivirus-exclusions-windows-server.md#disable-automatic-exclusions-in-group-policy).
- **Local configuration**:
  - **PowerShell**: For instructions, see [Disable automatic exclusions in PowerShell](microsoft-defender-antivirus-exclusions-windows-server.md#disable-automatic-exclusions-in-powershell).
  - **WMI**: For instructions, see [Disable automatic exclusions in WMI](microsoft-defender-antivirus-exclusions-windows-server.md#disable-automatic-exclusions-in-wmi).
  - **Windows Security app**: Not supported.

**Learn more**:

- [Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus](/intune/intune-service/protect/mde-security-integration)
- [Create Microsoft Defender antivirus exclusion policies in Intune](microsoft-defender-antivirus-exclusions-configure.md#configure-microsoft-defender-antivirus-exclusions-in-microsoft-intune)
- [Add automatic folder exclusions](automation-folder-exclusions-configure.md#add-an-automation-folder-exclusion)
- [Defender CSP](/windows/client-management/mdm/defender-csp)
- [Defender Policy CSP](/windows/client-management/mdm/policy-csp-defender)
- [Use custom settings for Windows client devices in Intune](/intune/intune-service/configuration/custom-settings-windows-10)
- [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

## Manage exclusions for Linux

You can exclude files, folders, processes, and process-opened files from Defender for Endpoint on Linux. For more information, see [Custom exclusions on Linux](defender-endpoint-exclusions-overview.md#custom-exclusions).

For configuration instructions, see [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md).

## Manage exclusions for macOS

You can exclude files, folders, processes, and process-opened files from Defender for Endpoint on macOS. For more information, see [Custom exclusions on macOS](defender-endpoint-exclusions-overview.md#custom-exclusions).

For configuration instructions, see [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md).

## See also

- [Add exclusions to network protection](troubleshoot-np.md#add-exclusions)
- [Important points about exclusions](microsoft-defender-antivirus-exclusions-overview.md#important-points-about-exclusions)
