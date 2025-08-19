---
title: Server migration scenarios for the new version of Microsoft Defender for Endpoint
description: Read this article to get an overview of how to migrate your servers from the previous, MMA-based solution to the current Defender for Endpoint unified solution package.
search.appverid: met150
ms.service: defender-endpoint
author: emmwalshh
ms.author: ewalsh
ms.localizationpriority: medium
ms.date: 04/16/2025
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.subservice: onboard
---


# Server migration scenarios from the previous, MMA-based Microsoft Defender for Endpoint solution

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> [!NOTE]
> On Windows Server 2016, always ensure the operating system and Microsoft Defender Antivirus are fully updated before proceeding with installation or upgrade. To receive regular product improvements and fixes for the EDR Sensor component, ensure Windows Update [KB5005292](https://go.microsoft.com/fwlink/?linkid=2168277) gets applied or approved after installation. In addition, to keep protection components updated, please reference [Manage Microsoft Defender Antivirus updates and apply baselines](/defender-endpoint/microsoft-defender-antivirus-updates/#platform-and-engine-releases).

These instructions apply to the new unified solution and installer (MSI) package of Defender for Endpoint for Windows Server 2012 R2 and Windows Server 2016. This article contains high-level instructions for various possible migration scenarios from the previous to the current solution. These high-level steps are intended as guidelines to be adjusted to the deployment and configuration tools available in your environment.

**If you are using Microsoft Defender for Cloud to perform deployment, you can automate installation and upgrade. See [Defender for Servers Plan 2 now integrates with MDE unified solution](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/defender-for-servers-plan-2-now-integrates-with-mde-unified/ba-p/3527534)**

> [!NOTE]
> Operating system upgrades with Defender for Endpoint installed aren't supported. Offboard, uninstall, upgrade the operating system, and then proceed with installation.

## Installer script

> [!NOTE]
> Make sure the machines you run the script on isn't blocking the execution of the script. The recommended execution policy setting for PowerShell is Allsigned. This requires importing the script's signing certificate into the Local Computer Trusted Publishers store if the script is running as SYSTEM on the endpoint.

To facilitate upgrades when Microsoft Endpoint Configuration Manager isn't yet available or updated to perform the automated upgrade, you can use this [upgrade script](https://github.com/microsoft/mdefordownlevelserver/archive/refs/heads/main.zip). Download it by selection the "Code" button and downloading the .zip file, then extracting install.ps1. It can help automate the following required steps:

1. Remove the OMS workspace for Defender for Endpoint (OPTIONAL).

2. Remove System Center Endpoint Protection (SCEP) client if installed.

3. Review the [Prerequisites for Windows Server 2016 and 2012 R2](onboard-server.md#prerequisites-for-windows-server-2016-and-2012-r2).

4. Enable and update the Microsoft Defender Antivirus feature on Windows Server 2016.

5. Install Defender for Endpoint.

6. Apply the onboarding script **for use with Group Policy** downloaded from the [Microsoft Defender portal](https://security.microsoft.com).

   To use the script, download it to an installation directory where you have also placed the installation and onboarding packages (see [Onboard servers](onboard-server.md)).

   EXAMPLE: `.\install.ps1 -RemoveMMA <YOUR_WORKSPACE_ID> -OnboardingScript ".\WindowsDefenderATPOnboardingScript.cmd"`

For more information on how to use the script, use the PowerShell command `get-help .\install.ps1`.

## Microsoft Endpoint Configuration Manager migration scenarios

> [!NOTE]
> You'll need Configuration Manager, version 2107 or later to perform Endpoint Protection policy configuration. From [version 2207 or later](/mem/configmgr/core/plan-design/changes/whats-new-in-version-2207#improved-microsoft-defender-for-endpoint-mde-onboarding-for-windows-server-2012-r2-and-windows-server-2016) deployment and upgrades can be fully automated.

For instructions on how to migrate using Configuration Manager older than version 2207, see [Migrating servers from Microsoft Monitoring Agent to the unified solution.](application-deployment-via-mecm.md)

## If you are running a non-Microsoft antivirus solution

1. Fully update the machine including Microsoft Defender Antivirus (Windows Server 2016) ensuring [Prerequisites for Windows Server 2016 and 2012 R2](onboard-server.md#prerequisites-for-windows-server-2016-and-2012-r2) are met.

2. Ensure your non-Microsoft antivirus management solution no longer pushes antivirus agents to these machines.

3. Author your policies for the protection capabilities in Defender for Endpoint and target those to the machine in the tool of your choice.

4. Install the Defender for Endpoint package for Windows Server 2012 R2 and Windows Server 2016, and set it to passive mode. 

5. Apply the onboarding script **for use with Group Policy** downloaded from the [Microsoft Defender portal](https://security.microsoft.com).

6. Apply updates.

7. Remove your non-Microsoft antivirus software by either using the non-Microsoft antivirus console or by using Configuration Manager as appropriate. Make sure to remove passive mode configuration.

   To move a machine out of passive mode, set the following key:

   Path: `HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection`
   Name: `ForceDefenderPassiveMode`
   Type: `REG_DWORD`
   Value: `0`

> [!TIP]
> You can use the [installer-script](server-migration.md#installer script) as part of your application to automate the above steps. To enable passive mode, apply the -Passive flag. For example, `.\install.ps1 -RemoveMMA <YOUR_WORKSPACE_ID> -OnboardingScript ".\WindowsDefenderATPOnboardingScript.cmd" -Passive`.

In the preceding procedure, steps 2 and 7 apply only if you intend to replace your non-Microsoft antivirus solution. See [Better together: Microsoft Defender Antivirus and Microsoft Defender for Endpoint](why-use-microsoft-defender-antivirus.md).

## If you are running System Center Endpoint Protection but aren't managing the machine using Configuration Manager (MECM/ConfigMgr)

1. Fully update the device, including Microsoft Defender Antivirus (on Windows Server 2016) ensuring [Prerequisites for Windows Server 2016 and 2012 R2](onboard-server.md#prerequisites-for-windows-server-2016-and-2012-r2) are met.

2. Create and apply policies using Group Policy, PowerShell, or a non-Microsoft management solution.

3. Uninstall System Center Endpoint Protection (Windows Server 2012 R2).

4. Install Microsoft Defender for Endpoint (see [Onboard Windows Server 2012 R2 and Windows Server 2016 to Microsoft Defender for Endpoint](onboard-server.md))

5. Apply the onboarding script **for use with Group Policy** downloaded from the [Microsoft Defender portal](https://security.microsoft.com).

6. Apply updates.

> [!TIP]
> You can use the installer script to automate the steps in the preceding procedure.

## Microsoft Defender for Cloud scenarios

### You're using Microsoft Defender for Cloud. The Microsoft Monitoring Agent (MMA) and/or Microsoft Antimalware for Azure (SCEP) are installed and you want to upgrade.

If you're using Microsoft Defender for Cloud, you can use the automated upgrade process. See [Protect your endpoints with Defender for Cloud's integrated EDR solution: Microsoft Defender for Endpoint](/azure/security-center/security-center-wdatp#enable-the-microsoft-defender-for-endpoint-integration).

## Group Policy configuration

For configuration using Group Policy, ensure you're using the latest ADMX files in your central store to access the correct Defender for Endpoint policy options. For reference, see [How to create and manage the Central Store for Group Policy Administrative Templates in Windows](/troubleshoot/windows-client/group-policy/create-and-manage-central-store) and download the latest files **for use with Windows 10**.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
