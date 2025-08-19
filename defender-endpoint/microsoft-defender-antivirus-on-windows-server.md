---
title: Microsoft Defender Antivirus on Windows Server
description: Learn how to enable and configure Microsoft Defender Antivirus on Windows Server 2016, Windows Server 2019, Windows Server 2022, and Windows Server 2025.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: emmwalshh
ms.author: ewalsh
ms.reviewer: pahuijbr
manager: deniseb
ms.topic: how-to
ms.date: 06/16/2025
ms.collection: 
- m365-security
- tier2
- m365initiative-defender-endpoint
- mde-ngp
---

# Microsoft Defender Antivirus on Windows Server

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender Antivirus

Microsoft Defender Antivirus is available in the following editions/versions of Windows Server:

- Windows Server 2025
- Windows Server 2022
- Windows Server 2019
- Windows Server, version 1803 or later
- Windows Server 2016
- Windows Server 2012 R2 (Requires Microsoft Defender for Endpoint)

## Overview

By default, Microsoft Defender Antivirus is installed and functional on Windows Server 2016 and later. For Windows Server 2012 R2, Microsoft Defender Antivirus is installed when the device is onboarded to Defender for Endpoint using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2). 

This article describes how to enable the user interface, install or reinstall Microsoft Defender Antivirus, verify that Microsoft Defender Antivirus is running, and update your antimalware security intelligence. This article also describes how to set Microsoft Defender Antivirus to passive mode if you're using a non-Microsoft antivirus/anti-malware solution on Windows Server.

## Enable the user interface on Windows Server

On Windows Server, the Microsoft Defender Antivirus user interface (GUI) is installed by default, and other times it has to be enabled. The GUI isn't required; you can use PowerShell, Group Policy, or other methods to manage Microsoft Defender Antivirus. If your organization prefers to use the GUI, use one of the procedures in the following table to enable it:

| Procedure | What to do |
|:---|:---|
| Turn on the GUI using the Add Roles and Features Wizard | 1. See [Install roles, role services, and features by using the add Roles and Features Wizard](/windows-server/administration/server-manager/install-or-uninstall-roles-role-services-or-features#install-roles-role-services-and-features-by-using-the-add-roles-and-features-wizard), and use the **Add Roles and Features Wizard**. <br/><br/>2. When you get to the **Features** step of the wizard, under **Windows Defender Features**, select the **GUI for Windows Defender** option. |
| Turn on the GUI using PowerShell (Windows Server 2016 only)| 1. On Windows Server 2016, open Windows PowerShell as an administrator. <br/><br/>2. Run the following PowerShell cmdlet: `Install-WindowsFeature -Name Windows-Defender-GUI` |

> [!IMPORTANT]
> If you're using Windows Server 2012 R2, see [Onboard Windows Server 2016 and Windows Server 2012 R2](onboard-server.md#onboard-windows-server-2016-and-windows-server-2012-r2).

## Install Microsoft Defender Antivirus on Windows Server

If you need to install or reinstall Microsoft Defender Antivirus on Windows Server, use one of the procedures in the following table:

| Procedure | What to do |
|:---|:---|
| Use the Add Roles and Features Wizard | 1. See [Install or Uninstall Roles, Role Services, or Features](/windows-server/administration/server-manager/install-or-uninstall-roles-role-services-or-features#install-roles-role-services-and-features-by-using-the-add-roles-and-features-wizard), and use the **Add Roles and Features Wizard**. <br/><br/>2. When you get to the **Features** step of the wizard, select the Microsoft Defender Antivirus option. Also select the **GUI for Windows Defender** option. |
| Use PowerShell to install Microsoft Defender Antivirus | 1. On your Windows Server, open Windows PowerShell as an administrator. <br/><br/>2. Run the following PowerShell cmdlet: `Install-WindowsFeature -Name Windows-Defender` |

> [!NOTE]
> Event messages for the antimalware engine included with Microsoft Defender Antivirus can be found in [Microsoft Defender Antivirus Events](/defender-endpoint/troubleshoot-microsoft-defender-antivirus/).

## Verify Microsoft Defender Antivirus is running

After you've installed (or reinstalled) Microsoft Defender Antivirus, your next step is to verify that it's running. You can use either PowerShell or Command Prompt.

- PowerShell: `Get-Service -Name windefend`
- Command Prompt: `sc query Windefend`

To verify that firewall protection is turned on using PowerShell, run the following command: `Get-Service -Name mpssvc`.

To view verify the state of all services using Command Prompt, run the following command: `sc query state= all`.

> [!IMPORTANT]
> Beginning with [platform version 4.18.2208.0 and later](/defender-endpoint/msda-updates-previous-versions-technical-upgrade-support#september-2022-platform-41822097--engine-11197003), if a server is onboarded to Defender for Endpoint, the "Turn off Windows Defender" setting in [Group Policy](configure-endpoints-gp.md#update-endpoint-protection-configuration) no longer completely disables Windows Defender Antivirus on Windows Server 2012 R2 and later. Instead, it places Microsoft Defender Antivirus into passive mode. In addition, the [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) feature allows Microsoft Defender Antivirus to switch to active mode but not to passive mode.
>
> If "Turn off Windows Defender" is already set before onboarding the device to Defender for Endpoint, there's no change and Microsoft Defender Antivirus remains disabled.
>
> To switch Microsoft Defender Antivirus to passive mode, even if it was disabled before onboarding, you can apply the [ForceDefenderPassiveMode configuration](switch-to-mde-phase-2.md#manually-set-microsoft-defender-antivirus-to-passive-mode-on-windows-server) with a value of `1`. To place it into active mode, switch this value to `0` instead.
>
> Note the modified logic for `ForceDefenderPassiveMode` when tamper protection is enabled: Once Microsoft Defender Antivirus is toggled to active mode, tamper protection will prevents Microsoft Defender Antivirus from going into passive mode, even if `ForceDefenderPassiveMode` is set to `1`.

## Update antimalware security intelligence

To get your regular security intelligence updates, the Windows Update service must be running. If you use an update management service, like Windows Server Update Services (WSUS), make sure Microsoft Defender Antivirus Security intelligence updates are approved for the computers you manage.

By default, Windows Update doesn't download and install updates automatically on Windows Server 2016, Windows Server 2019, Windows Server 2022, and Windows Server 2025. You can change this configuration by using one of the following methods:

| Method | Description |
|---|---|
| **Windows Update** in Control Panel | **Install updates automatically** results in all updates being automatically installed, including Windows Defender Security intelligence updates. <br/><br/> **Download updates but let me choose whether to install them** allows Windows Defender to download and install Security intelligence updates automatically, but other updates aren't automatically installed. |
| **Group Policy** | You can set up and manage Windows Update by using the settings available in Group Policy, in the following path: **Administrative Templates\Windows Components\Windows Update\Configure Automatic Updates** |
| The **AUOptions** registry key | The following two values allow Windows Update to automatically download and install Security intelligence updates: <br/><br/> **4** - **Install updates automatically**. This value results in all updates being automatically installed, including Windows Defender Security intelligence updates. <br/><br/> **3** - **Download updates but let me choose whether to install them**. This value allows Windows Defender to download and install Security intelligence updates automatically, but other updates aren't automatically installed. |

To ensure that protection from malware is maintained, enable the following services:

- Windows Error Reporting service
- Windows Update service

The following table lists the services for Microsoft Defender Antivirus and the dependent services.

| Service Name | File Location | Description |
|---|---|---|
| Windows Defender Service (`WinDefend`) | `C:\Program Files\Windows Defender\MsMpEng.exe` | This service is the main Microsoft Defender Antivirus service that needs to be running always.|
| Windows Error Reporting Service (`Wersvc`) | `C:\WINDOWS\System32\svchost.exe -k WerSvcGroup` | This service sends error reports back to Microsoft. |
| Windows Firewall (`MpsSvc`) | `C:\WINDOWS\system32\svchost.exe -k LocalServiceNoNetwork` | We recommend keeping the Windows Firewall service enabled. |
| Windows Update (`Wuauserv`) | `C:\WINDOWS\system32\svchost.exe -k netsvcs`| Windows Update is needed to get Security intelligence updates and antimalware engine updates |

## Additional settings to consider

- [Turn on cloud protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md)
- [Configure Microsoft Defender Antivirus exclusions on Windows Server](configure-server-exclusions-microsoft-defender-antivirus.md)
- [Learn more about Windows Server and passive mode](microsoft-defender-antivirus-compatibility.md#windows-server-and-passive-mode)

## What happens if a non-Microsoft antivirus product is uninstalled?

If a non-Microsoft antivirus product was installed on Windows Server, Microsoft Defender Antivirus was probably set to passive mode. When the non-Microsoft antivirus product is uninstalled, Microsoft Defender Antivirus should switch to active mode automatically. However, that might not occur on certain versions of Windows Server, such as Windows Server 2016. Use the following procedure to check the status of Microsoft Defender Antivirus, and if necessary, set it to active mode:

1. Check the status of Microsoft Defender Antivirus by following the guidance in [Verify Microsoft Defender Antivirus is running](#verify-microsoft-defender-antivirus-is-running) (in this article).

2. If necessary, set Microsoft Defender Antivirus to active mode manually by following these steps:

   1. On your Windows Server device, open Registry Editor as an administrator.

   2. Go to `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection`.

   3. Set or define a `REG_DWORD` entry called `ForceDefenderPassiveMode`, and set its value to `0`.

   4. Reboot the device.

> [!TIP]
> If you still need help, see the following troubleshooting items:
> 
> - [Microsoft Defender Antivirus seems to be stuck in passive mode](switch-to-mde-troubleshooting.md#microsoft-defender-antivirus-seems-to-be-stuck-in-passive-mode).
> - [I'm having trouble re-enabling Microsoft Defender Antivirus on Windows Server 2016](switch-to-mde-troubleshooting.md#i-am-having-trouble-re-enabling-microsoft-defender-antivirus-on-windows-server-2016).

## See also

- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender Antivirus compatibility with other security products](microsoft-defender-antivirus-compatibility.md)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Troubleshoot performance issues related to real-time protection](troubleshoot-performance-issues.md)
- [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
