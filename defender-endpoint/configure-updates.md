---
title: Create a custom gradual rollout process for Microsoft Defender updates
description: Learn how to use supported tools to create a custom gradual rollout process for updates
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Create a custom gradual rollout process for Microsoft Defender updates

This article describes how to create a custom gradual rollout process for Microsoft Defender updates by using Group Policy, Microsoft Intune, or PowerShell. You can control when devices receive platform, engine, and security intelligence updates by assigning them to specific update channels.

## Prerequisites

Before you configure a custom gradual rollout process, make sure the following requirement is met:

- This functionality requires Microsoft Defender Antivirus version 4.18.2106.X or newer. 


### Supported operating systems

Custom gradual rollout configuration is supported on the following operating systems:

- Windows


To create your own custom gradual rollout process for Defender updates, you can use Group Policy, Intune, and PowerShell.

<a name="group-policy-settings"></a>
The following table lists the available group policy settings for configuring update channels:

|Setting title|Description|Location|
|---|---|---|
|Select gradual Microsoft Defender monthly platform update rollout channel|Enable this policy to specify when devices receive Microsoft Defender platform updates during the monthly gradual rollout. <p> Beta Channel: Devices set to this channel are the first to receive new updates. Select Beta Channel to participate in identifying and reporting issues to Microsoft. Devices in the Windows Insider Program are subscribed to this channel by default. For use in (manual) test environments only and a limited number of devices. <p> Current Channel (Preview): Devices set to this channel are offered updates earliest during the monthly gradual release cycle. Suggested for pre-production/validation environments. <p> Current Channel (Staged): Devices are offered updates after the monthly gradual release cycle. Suggested to apply to a small, representative part of your production population (~10%). <p> Current Channel (Broad): Devices are offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%). <p> Critical- Time Delay: Devices are offered updates with a 48-hour delay. Suggested for critical environments only. <p>If you disable or don't configure this policy, the device stays up to date automatically during the gradual release cycle. Suitable for most devices.|Windows Components\Microsoft Defender Antivirus|
|Select gradual Microsoft Defender monthly engine update rollout channel|Enable this policy to specify when devices receive Microsoft Defender engine updates during the monthly gradual rollout. <p> Beta Channel: Devices set to this channel are the first to receive new updates. Select Beta Channel to participate in identifying and reporting issues to Microsoft. Devices in the Windows Insider Program are subscribed to this channel by default. For use in (manual) test environments only and a limited number of devices. <p> Current Channel (Preview): Devices set to this channel are offered updates earliest during the monthly gradual release cycle. Suggested for pre-production/validation environments. <p> Current Channel (Staged): Devices are offered updates after the monthly gradual release cycle. Suggested to apply to a small, representative part of your production population (~10%). <p> Current Channel (Broad): Devices are offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%). <p> Critical- Time Delay: Devices are offered updates with a 48-hour delay. Suggested for critical environments only.<p> If you disable or don't configure this policy, the device stays up to date automatically during the gradual release cycle. Suitable for most devices.|Windows Components\Microsoft Defender Antivirus|
|Select gradual Microsoft Defender daily security intelligence updates rollout channel|Enable this policy to specify when devices receive Microsoft Defender security intelligence updates during the daily gradual rollout. <p> Current Channel (Staged): Devices are offered updates after the release cycle. Suggested to apply to a small, representative part of production population (~10%). <p> Current Channel (Broad): Devices are offered updates only after the gradual release cycle completes. Suggested to apply to a broad set of devices in your production population (~10-100%). <p>  If you disable or don't configure this policy, the device stays up to date automatically during the daily release cycle. Suitable for most devices.|Windows Components\Microsoft Defender Antivirus|
|Disable gradual rollout of Microsoft Defender updates|Enable this policy to disable gradual rollout of Defender updates. <p> Current Channel (Broad): Devices set to this channel are offered updates last during the gradual release cycle. Best for datacenter machines that only receive limited updates. <p> Note: This setting applies to both monthly and daily Defender updates and overrides any previously configured channel selections for platform and engine updates. <p> If you disable or don't configure this policy, the device remains in Current Channel (Default) unless specified otherwise in specific channels for platform and engine updates. Stay up to date automatically during the gradual release cycle. Suitable for most devices.|Windows Components\Microsoft Defender Antivirus\MpEngine|


<a name="group-policy"></a>
## Configure a gradual rollout by using Group Policy

> [!NOTE]
> An updated Defender ADMX template is published together with the 21H2 release of Windows 10. A non-localized version is available for download at [Microsoft Defender update controls repository](https://github.com/microsoft/defender-updatecontrols) on GitHub.

You can use [Group Policy](/windows/win32/srvnodes/group-policy?redirectedfrom=MSDN) to configure and manage Microsoft Defender Antivirus on your endpoints. In general, you can use the following procedure to configure or change Microsoft Defender Antivirus group policy settings:

1. On your Group Policy management machine, open the **Group Policy Management Console**, right-click the **Group Policy Object** (GPO) you want to configure and select **Edit**.

1. Using the Group Policy Management Editor go to **Computer configuration**.

1. Select **Administrative templates**.

1. Expand the tree to **Windows components** > **Microsoft Defender Antivirus**.

1. Expand the section listed in the **Location** column of the [Group Policy settings table](#group-policy-settings) earlier in this article (for example, **Windows Components\Microsoft Defender Antivirus**) that contains the setting you want to configure, double-click the setting to open it, and make configuration changes.

1. Deploy the updated GPO as you normally do. For guidance, see [Deploying Group Policy Objects](https://msdn.microsoft.com/library/ee663280(v=vs.85).aspx).

<a name="intune"></a>
## Configure a gradual rollout by using Microsoft Intune

To create a custom policy in Intune, follow the instructions in [Add custom settings for Windows 10 devices in Microsoft Intune](/intune/intune-service/configuration/custom-settings-windows-10).

For more information on the Defender CSP used for the gradual rollout process, see [Defender CSP](/windows/client-management/mdm/defender-csp).

<a name="powershell"></a>
## Configure a gradual rollout by using PowerShell

The `Set-MpPreference` cmdlet is the Microsoft Defender Antivirus PowerShell cmdlet used to configure update and protection preferences. Use `Set-MpPreference` to configure the gradual rollout of updates.

Use the following parameters:

```powershell
Set-MpPreference
-PlatformUpdatesChannel Beta|Preview|Staged|Broad|Delayed|NotConfigured
-EngineUpdatesChannel Beta|Preview|Staged|Broad|Delayed|NotConfigured
-DisableGradualRelease 1|0
-DefinitionUpdatesChannel Staged|Broad|NotConfigured
```
Example:

Use `Set-MpPreference -PlatformUpdatesChannel Beta` to configure platform updates to arrive from the Beta Channel.

For more information on the parameters and how to configure them, see [Set-MpPreference](/powershell/module/defender/set-mppreference) (Microsoft Defender Antivirus).

<a name="registry"></a>
## Verify gradual rollout configuration in the registry

The gradual rollout channel settings can be confirmed in the registry under `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender`:

- `EngineRing`
- `PlatformRing`
- `SignaturesRing`

> [!NOTE]
> You can also use a management tool such as Microsoft Configuration Manager to run PowerShell scripts. See [Create and run PowerShell scripts from the Configuration Manager console](/intune/configmgr/apps/deploy-use/create-deploy-scripts).

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)



