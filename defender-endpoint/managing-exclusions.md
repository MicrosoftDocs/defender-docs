---
title:  Managing exclusions reference
description: This article describes various ways to manage exclusions for Defender for Endpoint and Microsoft Defender Antivirus
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.service: defender-endpoint
ms.subservice: onboard
ms.topic: how-to
ms.localizationpriority: medium
ms.date: 10/25/2024
ms.custom: 
- partner-contribution
ms.collection: 
- m365-security
- tier2
---

# Managing exclusions reference

Each version of Defender for Endpoint provides management of exclusions via the supported management tools. This article summarizes how you can configure exclusions using various management tools.

## Manage exclusions for Windows devices

The following table shows which exclusion types are supported by each management tool. The table uses the following abbreviations:

- **Custom AV**: Custom antivirus exclusions.
- **ASR only**: Exclusions that affect all attack surface reduction rules only.
- **ASR per rule**: Per-rule attack surface reduction exclusions.
- **CFA**: Controlled folder access.
- **Automation**: Folder exclusions for automated investigation and remediation.
- **Disable automatic**: Disable automatic antivirus exclusions on Windows Server 2016 or later.

|Management|Custom AV|ASR only|ASR per rule|CFA|Automation|Disable automatic|
|---|:---:|:---:|:---:|:---:|:---:|:---:|
|[Microsoft Defender portal](#the-microsoft-defender-portal)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|
|[Microsoft Intune admin center](#intune)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|
|[MDM CSP](#mdm-csp)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|
|[PowerShell](#powershell)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|
|[GPO](#group-policy-object-gpo)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|
|[WMI](#windows-management-instrumentation-wmi)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|
|[Configuration Manager](#configuration-manager)|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/check-mark-button-2705.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|:::image type="icon" source="media/exclusions/cross-mark-274c.svg" border="false":::|

The following sections expand on this information.

### The Microsoft Defender portal

The following table describes where you configure supported exclusions in the Microsoft Defender portal at <https://security.microsoft.com>.

|Exclusion Type|Instructions|
|---|---|
|Custom antivirus exclusions|1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Endpoints** > **Configuration Management** > **Endpoint security policies** > **Windows policies**. <br/> 2. Select **Create New Policy**. <br/> 3. For **Platform**, select **Windows 10, Windows 11, and Windows Server**. <br/>4. Select a template and define your exclusions. Both **Microsoft Defender Antivirus exclusions** and **Microsoft Defender Antivirus** support custom antivirus exclusions.|
|Global exclusions for all attack surface reduction (ASR) rules only|1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Endpoints** > **Configuration Management** > **Endpoint security policies** > **Windows policies**. <br/> 2. Select **Create New Policy** <br/> 3. For **Platform**, select **Windows 10, Windows 11, and Windows Server**. <br/> 4. Select the **Attack Surface Reduction Rules** template.<br/> 5. Scroll down to **Attack Surface Reduction Only Exclusions** and define your exclusions.|
|Per-ASR rule exclusions|1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Endpoints** > **Configuration Management** > **Endpoint security policies** > **Windows policies**. <br/> 2. Select **Create New Policy** <br/> 3. For **Platform**, select **Windows 10, Windows 11, and Windows Server**. <br/> 4. Select the **Attack Surface Reduction Rules** template.<br/> 5. Scroll down to the rule to create an exclusion.<br/>6. Change it from **Not configured** to `Block`,`Audit`, or `Warn`. <br/>7. Select **Add** to specify the path to be excluded.|
|Controlled folder access exclusion|1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Endpoints** > **Configuration Management** > **Endpoint security policies** > **Windows policies**. <br/> 2. Select **Create New Policy** <br/> 3. For **Platform**, select **Windows 10, Windows 11, and Windows Server**. <br/> 4. Select the **Attack Surface Reduction Rules** template.<br/> 5. Scroll down to **Controlled Folder Access Allowed Applications** and define your exclusions.|
|Automation folder exclusions|1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Rules** > **Automation folder exclusions** <br>2. Select **New Folder Exclusion** and define your exclusions.|
|Automatic antivirus exclusions|Not supported in the [Microsoft Defender portal](https://security.microsoft.com).|

> [!NOTE]
> You can't configure **IP Address Exclusions** in the Microsoft Defender portal.

**Learn More**:

- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus</a>
- [Add automatic folder exclusions](manage-automation-folder-exclusions.md#add-an-automation-folder-exclusion)

### Intune

Many exclusions can be managed in the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431).

|Exclusion Type|Instructions|
|---|---|
|Custom antivirus exclusions|1. In the [Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), go to **Home** > **Endpoint security** > **Antivirus**. <br/> 2. Select **Create Policy**. <br/> 3. For **Platform**, select **Windows**. <br/> 4. Select a template. Both **Microsoft Defender Antivirus exclusions** and **Microsoft Defender Antivirus** support custom antivirus exclusions|
|Global exclusions for all attack surface reduction (ASR) rules only|For complete instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).|
|Per-ASR rule exclusions|For complete instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).|
|Controlled folder access exclusion|You configure controlled folder access exclusions (**Controlled Folder Access Allowed Applications**) in the same policies where you configure ASR rules (**Attack surface reduction** endpoint security policies). For complete instructions, see [Configure ASR rules and exclusions in Intune using endpoint security policies](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies).|
|Automation folder exclusions|Not supported|
|Automatic antivirus exclusions|Not supported in the [Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431).|

**Learn More**:

- [Create Microsoft Defender antivirus exclusion policies in Intune](configure-exclusions-microsoft-defender-antivirus.md#create-microsoft-defender-antivirus-exclusion-policies-in-intune)

### MDM CSP

|Exclusion type|OMA-URI|
|--|--|
|Custom antivirus exclusion: <br/>[ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses)|`./Device/Vendor/MSFT/Policy/Config/Defender/ExcludedProcesses`|
|Custom antivirus exclusion: <br/>[ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths)|`./Device/Vendor/MSFT/Policy/Config/Defender/ExcludedPaths`|
|Custom antivirus exclusion: <br/>[ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions)|`./Device/Vendor/MSFT/Policy/Config/Defender/ExcludedExtensions`|
|Attack surface reduction only exclusions: <br/>[AttackSurfaceReductionOnlyExclusions](/windows/client-management/mdm/policy-csp-defender#attacksurfacereductiononlyexclusions)|`./Device/Vendor/MSFT/Policy/Config/Defender/AttackSurfaceReductionOnlyExclusions`|
|Controlled folder access exclusion: <br/>[ControlledFolderAccessAllowedApplications](/windows/client-management/mdm/policy-csp-defender#controlledfolderaccessallowedapplications)|`./Device/Vendor/MSFT/Policy/Config/Defender/ControlledFolderAccessAllowedApplications`|

**Learn more**:

- [Defender CSP](/windows/client-management/mdm/defender-csp)
- [Defender Policy CSP](/windows/client-management/mdm/policy-csp-defender)
- [Use custom settings for Windows client devices in Intune](/intune/intune-service/configuration/custom-settings-windows-10)

### PowerShell

Use `Set-MpPreference` or `Get-MpPreference` in the [Defender PowerShell Module](/powershell/module/defender/?view=windowsserver2022-ps&preserve-view=true).

|Exclusion type|Flag|Description|
|---|---|---|
|Custom antivirus exclusion|`ExclusionIpAddress`|[IP addresses to exclude from scheduled and real-time scanning](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-exclusionipaddress)|
|Custom antivirus exclusion|`ExclusionPath`|[File paths to exclude from scheduled and real-time scanning](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-exclusionpath)|
|Custom antivirus exclusion|`ExclusionProcess`|[Files opened by these processes are excluded from scheduled and real-time scanning](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-exclusionprocess)|
|Custom antivirus exclusion|`ExclusionExtension`|[File name extensions, such as obj or lib, to exclude from scheduled, custom, and real-time scanning](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-exclusionextension)|
|Attack surface reduction only exclusion|`AttackSurfaceReductionOnlyExclusions`|[Specifies the files and paths to exclude](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-attacksurfacereductiononlyexclusions)|
|Attack surface reduction per-rule exclusion|N/A|Not supported|
|Controlled Folder Access exception|`ControlledFolderAccessAllowedApplications`|[Specifies applications that can make changes in controlled folders](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-controlledfolderaccessallowedapplications)|
|Automation folder exclusions|N/A|Not supported|
|Automatic antivirus exclusions <br/>(*Only available on Windows Server 2016 and later*)|`DisableAutoExclusions`|[Disable automatic antivirus exclusions](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true#-disableautoexclusions)|

### Group Policy Object (GPO)

|Exclusion Type|Setting location|Reference|
|---|---|---|
|Custom antivirus exclusion - Path|**Windows components** > **Microsoft Defender Antivirus** > **Exclusions** > **Path Exclusions**|See [Use Group Policy to configure folder or file extension exclusions](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-group-policy-to-configure-folder-or-file-extension-exclusions)|
|Custom antivirus exclusions - Process|**Windows components** > **Microsoft Defender Antivirus** > **Exclusions** > **Process Exclusions**|See [Use Group Policy to exclude files that have been opened by specified processes from scans](configure-process-opened-file-exclusions-microsoft-defender-antivirus.md#use-group-policy-to-exclude-files-that-have-been-opened-by-specified-processes-from-scans)|
|Attack Surface Reduction only exclusions|**Windows components** > **Microsoft Defender Antivirus** > **Microsoft Defender Exploit Guard** > **Attack Surface Reduction** > **Exclude files and paths from Attack Surface Reduction rules**|See [Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-group-policy)|
|Attack surface reduction rule per rule exclusion|**Windows components > Microsoft Defender Antivirus > Microsoft Defender Exploit Guard > Attack surface reduction > Apply a list of exclusions to specific Attack Surface Reduction (ASR) rules**|See [Group Policy](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-group-policy)|
|Automatic antivirus exclusions|**Windows components** > **Microsoft Defender Antivirus** > **Exclusions** > **Enabled**|See [Use Group Policy to disable the auto-exclusions list on Windows Server 2016, Windows Server 2019, and later](configure-server-exclusions-microsoft-defender-antivirus.md#use-group-policy-to-disable-the-auto-exclusions-list-on-windows-server-2016-windows-server-2019-and-later)|
|Automation folder exclusions|Not supported||
|Controlled Folder Access exclusions|**Windows components** > **Microsoft Defender Antivirus** > **Windows Defender Exploit Guard** > **Controlled folder access** > **Configure allowed applications**|See [Use group policy to allow specific apps](customize-controlled-folders.md#use-group-policy-to-allow-specific-apps)|

### Windows Management Instrumentation (WMI)

|Exclusion Type|Property|
|---|---|
|Custom antivirus exclusion - Path|`ExclusionPath`|
|Custom antivirus exclusion - Extension|`ExclusionExtension`|
|Custom antivirus exclusion - Process|`ExclusionProcess`|
|Attack Surface Reduction only exclusions|Not supported|
|Attack surface reduction rule per rule exclusion|Not supported|
|Automatic antivirus exclusions|`DisableAutoExclusions`|
|Controlled Folder Access exclusions|Not supported|
|Automation folder exclusions|Not supported|

**Learn more**:

- [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

### Configuration Manager

|Exclusion Type|Reference|
|---|---|
|Custom antivirus exclusion|See [exclusion settings](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies#exclusion-settings)|
|Attack Surface Reduction only exclusions|See [Microsoft Configuration Manager](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-microsoft-configuration-manager)|
|Attack surface reduction rule per rule exclusion|Not supported|
|Controlled Folder Access exclusions|See [Microsoft Configuration Manager](enable-controlled-folders.md#microsoft-configuration-manager)|
|Automation folder exclusions|Not supported|

## Manage exclusions for Linux

You can exclude certain files, folders, processes, and process-opened files from Defender for Endpoint on Linux.

See [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md).

## Manage exclusions for macOS

You can exclude certain files, folders, processes, and process-opened files from Defender for Endpoint on Mac scans.

See [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md).

## See also

- [Add exclusions to network protection](troubleshoot-np.md#add-exclusions)
- [Important points about exclusions](configure-exclusions-microsoft-defender-antivirus.md#important-points-about-exclusions)
- [Isolation exclusions](isolation-exclusions.md)
