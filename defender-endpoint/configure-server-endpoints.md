---
title: Onboard Windows servers to the Microsoft Defender for Endpoint service
description: Onboard Windows servers so that they can send sensor data to the Microsoft Defender for Endpoint sensor.
search.appverid: met150
ms.service: defender-endpoint
author: denisebmsft
ms.author: deniseb
ms.reviewer: pahuijbr
ms.localizationpriority: medium
ms.date: 03/17/2025
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
---

# Onboard Windows servers to the Microsoft Defender for Endpoint service

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Defender for Endpoint extends support to also include the Windows Server operating system. This support provides advanced attack detection and investigation capabilities seamlessly through the Microsoft Defender portal. Support for Windows Server provides deeper insight into server activities, coverage for kernel and memory attack detection, and enables response actions.

This article describes how to onboard specific Windows servers to Defender for Endpoint.

For guidance on how to download and use Windows Security Baselines for Windows servers, see [Windows Security Baselines](/windows/device-security/windows-security-baselines).

[!INCLUDE [MDE automated setup guide](../includes/security-analyzer-setup-guide.md)]

## Windows Server onboarding overview

The following diagram shows the general steps required to successfully onboard servers.

:::image type="content" source="media/server-onboarding-tools-methods.png" alt-text="An illustration of onboarding flow for Windows Servers and Windows 10 devices.":::

> [!NOTE]
> Windows Hyper-V Server editions aren't supported.

### Integration with Microsoft Defender for Servers

Defender for Endpoint integrates seamlessly with Microsoft Defender for Servers and Microsoft Defender for Cloud. You can onboard servers automatically, have servers monitored by Defender for Cloud appear in Defender for Endpoint, and conduct detailed investigations as a Defender for Cloud customer. For more information, see [Protect your endpoints with Defender for Endpoint integration with Defender for Cloud](/azure/defender-for-cloud/integration-defender-for-endpoint?tabs=windows)

On devices running Windows Server 2016 or Windows Server 2012 R2, you can either manually install/upgrade the [modern unified solution](#functionality-in-the-modern-unified-solution), or use the integration with Defender for Servers to automatically deploy or upgrade servers covered by your respective Defender for Server plan. For more information, see [Protect your endpoints with Defender for Endpoint integration with Defender for Cloud](/azure/defender-for-cloud/integration-defender-for-endpoint?tabs=windows#enable-the-integration).

When you use Defender for Cloud to monitor servers, a Defender for Endpoint tenant is automatically created (in the US for US users, in the EU for European users, and in the UK for UK users). Data collected by Defender for Endpoint is stored in the geo-location of the tenant as identified during provisioning.

If you start using Defender for Endpoint before using Defender for Cloud, your data is stored in the location you specified when you created your tenant, even if you integrate with Defender for Cloud at a later time. Once configured, you can't change the location where your data is stored. If you need to move your data to another location, you need to contact Microsoft Support to reset the tenant.

Server endpoint monitoring utilizing the integration between Defender for Servers and Defender for Endpoint is not available to Office 365 GCC customers.

Previously, the use of the Microsoft Monitoring Agent (MMA) on Windows Server 2016, Windows Server 2012 R2, and earlier versions of Windows Server allowed for the OMS / Log Analytics gateway to provide connectivity to Defender cloud services. The new solution, like Defender for Endpoint on Windows Server 2019 and later, and Windows 10 or later, doesn't support this gateway.

Linux servers onboarded through Defender for Cloud have their initial configuration set to run Microsoft Defender Antivirus in [passive mode](microsoft-defender-antivirus-compatibility.md#microsoft-defender-antivirus-and-non-microsoft-antivirusantimalware-solutions).

### Windows Server 2016 and Windows Server 2012 R2

- Download installation and onboarding packages
- Apply the installation package
- Follow the onboarding steps for the corresponding tool

### Windows Server Semi-Annual Enterprise Channel and Windows Server 2019 or later

- Download the onboarding package
- Follow the onboarding steps for the corresponding tool

### Functionality in the modern unified solution

The previous implementation (before April of 2022) of onboarding Windows Server 2016 and Windows Server 2012 R2 required the use of Microsoft Monitoring Agent (MMA).

The new unified solution package makes it easier to onboard servers by removing dependencies and installation steps. It also provides a much expanded feature set. For more information, see [Defending Windows Server 2012 R2 and 2016](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/defending-windows-server-2012-r2-and-2016/ba-p/2783292).

Depending on the server that you're onboarding, the unified solution installs Defender for Endpoint and/or the EDR sensor. The following table indicates what component is installed and what is built in by default.

|Server version|AV|EDR|
|----|----|----|
|Windows Server 2012 R2|![Yes](media/svg/check-yes.svg)|![Yes](media/svg/check-yes.svg)|
|Windows Server 2016|Built-in|![Yes](media/svg/check-yes.svg)|
|Windows Server 2019 and later|Built-in|Built-in|

If you've previously onboarded your servers using MMA, follow the guidance provided in [Server migration](server-migration.md) to migrate to the new solution.

> [!IMPORTANT]
> Before proceeding with onboarding, see the section [Known issues and limitations in the new, unified solution package for Windows Server 2012 R2 and Windows Server 2016](#known-issues-and-limitations-in-the-modern-unified-solution).

### Prerequisites

#### Prerequisites for Windows Server 2016 and Windows Server 2012 R2

- It's recommended to install the latest available Servicing Stack Update (SSU) and Least Cumulative Update (LCU) on the server.
- The SSU from September 14, 2021 or later must be installed.
- The LCU from September 20, 2018 or later must be installed.  
- Enable the Microsoft Defender Antivirus feature and ensure it's up to date. For more information on enabling Defender Antivirus on Windows Server, see [Re-enable Defender Antivirus on Windows Server if it was disabled](enable-update-mdav-to-latest-ws.md#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-disabled) and [Re-enable Defender Antivirus on Windows Server if it was uninstalled](enable-update-mdav-to-latest-ws.md#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-uninstalled).
- Download and install the latest platform version using Windows Update. Alternatively, download the update package manually from the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623) or from [MMPC](https://go.microsoft.com/fwlink/?linkid=870379&arch=x64).

#### Prerequisites for running Defender for Endpoint with non-Microsoft security solutions

If you intend to use a non-Microsoft anti-malware solution, you need to run Microsoft Defender Antivirus in passive mode. You must remember to set to passive mode during the installation and onboarding process.

> [!NOTE]
> If you're installing Defender for Endpoint on servers with McAfee Endpoint Security (ENS) or VirusScan Enterprise (VSE), the version of the McAfee platform might need to be updated to ensure Microsoft Defender Antivirus isn't removed or disabled. For more information including the specific version numbers required, see [McAfee Knowledge Center article](https://kcm.trellix.com/corporate/index?page=content&id=KB88214).

#### Update packages for Windows Server 2016 or Windows Server 2012 R2

To receive regular product improvements and fixes for the Defender for Endpoint component, ensure Windows Update [KB5005292](https://go.microsoft.com/fwlink/?linkid=2168277) gets applied or approved. In addition, to keep protection components updated, see [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md#platform-and-engine-releases).

If you're using Windows Server Update Services (WSUS) and/or [Microsoft Endpoint Configuration Manager](/mem/configmgr/core/understand/introduction), this new "Microsoft Defender for Endpoint update for EDR Sensor" is available under the category "Microsoft Defender for Endpoint."

### Onboarding steps summary

- STEP 1: [Download the installation and onboarding packages](#step-1-download-installation-and-onboarding-packages)
- STEP 2: [Apply the installation and onboarding package](#step-2-apply-the-installation-and-onboarding-package)
- STEP 3: [Complete the onboarding steps](#step-3-complete-the-onboarding-steps)

### STEP 1: Download installation and onboarding packages

You need to download both the **installation** and **onboarding** packages from the portal.

> [!NOTE]
> The installation package is updated monthly. Be sure to download the latest package before usage.
> To update after installation, you don't have to run the installer package again. If you do, the installer asks you to offboard first as that is a requirement for uninstallation. See [Update packages for Defender for Endpoint on Windows Server 2012 R2 and 2016](#update-packages-for-windows-server-2016-or-windows-server-2012-r2).

:::image type="content" alt-text="Image of onboarding dashboard" source="media/install-agent-onboard.png" lightbox="media/install-agent-onboard.png":::

> [!NOTE]
> On Windows Server 2016, Microsoft Defender Antivirus must be installed as a feature (see [Switch to Defender for Endpoint](switch-to-mde-phase-2.md#are-you-using-windows-server-2012-r2-or-windows-server-2016)) first and fully updated before proceeding with the installation.
> 
> If you're running a non-Microsoft anti-malware solution, make sure to add exclusions for Microsoft Defender Antivirus ([from this list of Microsoft Defender Processes on the Defender Processes tab](https://aka.ms/MDE-standard-urls)) to the non-Microsoft solution before installation.  It's also recommended to add non-Microsoft security solutions to the Defender Antivirus exclusion list.

The **installation package** contains an MSI file that installs the Defender for Endpoint agent.

The **onboarding package** contains `WindowsDefenderATPOnboardingScript.cmd`, which contains the onboarding script.

Follow these steps to download the packages:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings > Endpoint > Onboarding**.

1. Select **Windows Server 2016 and Windows Server 2012 R2**.

3. Select **Download installation package** and save the .msi file.

4. Select **Download onboarding package** and save the .zip file.

5. Install the installation package using any of the options to install Microsoft Defender Antivirus. The installation requires administrative permissions.

> [!IMPORTANT]
> A local onboarding script is suitable for a proof of concept but shouldn't be used for production deployment. For a production deployment, we recommend using Group Policy, or Microsoft Endpoint Configuration Manager.

### STEP 2: Apply the installation and onboarding package

In this step, you'll install the prevention and detection components required before onboarding your device to the Defender for Endpoint cloud environment, to prepare the machine for onboarding. Ensure all [prerequisites](#prerequisites) have been met.

> [!NOTE]
> Microsoft Defender Antivirus gets installed and will be active unless you set it to passive mode.

#### Options to install the Defender for Endpoint packages

In the previous section, you downloaded an installation package. The installation package contains the installer for all Defender for Endpoint components.

You can use any of the following options to install the agent:

- [Install using the command line](#install-defender-for-endpoint-using-the-command-line)
- [Install using a script](#install-defender-for-endpoint-using-a-script)
- [Apply the installation and onboarding packages using Group Policy](#apply-installation-and-onboarding-packages-using-group-policy)

##### Install Defender For Endpoint using the command line

Use the installation package from the previous step to install Defender for Endpoint.

Run the following command to install Defender for Endpoint:

```console
Msiexec /i md4ws.msi /quiet
```

To uninstall, ensure the machine is offboarded first using the appropriate offboarding script. Then, use Control Panel \> Programs \> Programs and Features to perform the uninstall.

Alternatively, run the following uninstall command to uninstall Defender for Endpoint:

```console
Msiexec /x md4ws.msi /quiet
```

You must use the same package you used for installation for the above command to succeed.

The `/quiet` switch suppresses all notifications.

> [!NOTE]
> Microsoft Defender Antivirus doesn't automatically go into passive mode. You can choose to set Microsoft Defender Antivirus to run in passive mode if you're running a non-Microsoft antivirus/antimalware solution. For command line installations, the optional `FORCEPASSIVEMODE=1` immediately sets the Microsoft Defender Antivirus component to Passive mode to avoid interference. Then, to ensure Defender Antivirus remains in passive mode after onboarding to support capabilities like EDR Block, set the "ForceDefenderPassiveMode" registry key.

Support for Windows Server provides deeper insight into server activities, coverage for kernel and memory attack detection, and enables response actions.

##### Install Defender for Endpoint using a script

You can use the [installer helper script](server-migration.md#installer-script) to help automate installation, uninstallation, and onboarding.

> [!NOTE]
> The installation script is signed. Any modifications to the script invalidate the signature. When you download the script from GitHub, the recommended approach to avoid inadvertent modification is to download the source files as a zip archive then extract it to obtain the install.ps1 file (on the main Code page, select the Code dropdown menu and select "Download ZIP").

This script can be used in various scenarios, including those scenarios described in [Server migration scenarios from the previous, MMA-based Defender for Endpoint solution](server-migration.md) and for deployment using Group Policy as described below.

## Apply installation and onboarding packages using Group Policy

If you're using Group Policy, apply Defender for Endpoint installation and onboarding packages with an installer script.

1. Create a group policy by following these steps:

   1. Open the [Group Policy Management Console](/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11).
   
   2. Right-click **Group Policy Objects** you want to configure, and then select **New**. 
   
   3. Specify the name of the new Group Policy Object (GPO), and then select **OK**.

2. In your [Group Policy Management Console](/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11), right-click the Group Policy Object (GPO) you want to configure, and then select **Edit**.

3. In the **Group Policy Management Editor**, go to **Computer configuration**, then **Preferences**, and then **Control panel settings**.

4. Right-click **Scheduled tasks**, point to **New**, and then select **Immediate Task (At least Windows 7)**.

5. In the **Task** window that opens, go to the **General** tab. Under **Security options** select **Change User or Group** and type SYSTEM and then select **Check Names** then **OK**. `NT AUTHORITY\SYSTEM` appears as the user account the task runs as.

6. Select **Run whether user is logged on or not** and check the **Run with highest privileges** check box.

7. In the Name field, type an appropriate name for the scheduled task (for example, *Defender for Endpoint Deployment*).

8. Go to the **Actions** tab and select **New...** Ensure that **Start a program** is selected in the **Action** field. The [installer script](server-migration.md#installer-script) handles the installation, and immediately perform the onboarding step after installation completes. Select *C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe* then provide the arguments:

   ```powershell
   -ExecutionPolicy RemoteSigned \\servername-or-dfs-space\share-name\install.ps1 -OnboardingScript \\servername-or-dfs-space\share-name\windowsdefenderatponboardingscript.cmd
   ```

   > [!NOTE]
   > The recommended execution policy setting is `Allsigned`. This requires importing the script's signing certificate into the Local Computer Trusted Publishers store if the script is running as SYSTEM on the endpoint.

   Replace `\\servername-or-dfs-space\share-name` with the UNC path, using the file server's fully qualified domain name (FQDN), of the shared `install.ps1` file. The installer package md4ws.msi must be placed in the same directory. Ensure that the permissions of the UNC path allow write access to the computer account that is installing the package, to support creation of log files. If you wish to disable the creation of log files (not recommended), you can use the `-noETL -noMSILog` parameters.

   For scenarios where you want Microsoft Defender Antivirus to coexist with non-Microsoft antimalware solutions, add the $Passive parameter to set passive mode during installation.

9. Select **OK** and close any open Group Policy Management Console windows.

10. To link the GPO to an Organization Unit (OU), right-click and select **Link an existing GPO**. In the dialogue box that is displayed, select the Group Policy Object that you wish to link. Select **OK**.

For more configuration settings, see [Configure sample collection settings](configure-endpoints-gp.md#configure-sample-collection-settings) and [Other recommended configuration settings](configure-endpoints-gp.md#other-recommended-configuration-settings).

### STEP 3: Complete the onboarding steps

The following steps are only applicable if you're using a non-Microsoft anti-malware solution. You need to apply the following Microsoft Defender Antivirus passive mode setting. Verify that it was configured correctly:

1. Set the following registry entry:

   - Path: `HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection`
   - Name: `ForceDefenderPassiveMode`
   - Type: `REG_DWORD`
   - Value: `1`

   :::image type="content" source="media/atp-verify-passive-mode.png" alt-text="Screenshot of the passive mode verification result.":::

#### Known issues and limitations in the modern unified solution

The following points apply to Windows Server 2016 and Windows Server 2012 R2:

- Always download the latest installer package from the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) before performing a new installation and ensure prerequisites are met. After installation, ensure to regularly update using component updates described in the section [Update packages for Defender for Endpoint on Windows Server 2012 R2 and 2016](#update-packages-for-windows-server-2016-or-windows-server-2012-r2).

- An operating system update can introduce an installation issue on machines with slower disks due to a time out with service installation. Installation fails with the message "Couldn't find c:\program files\windows defender\mpasdesc.dll, - 310 WinDefend". Use the latest installation package, and the latest [install.ps1](https://github.com/microsoft/mdefordownlevelserver) script to help clear the failed installation if necessary.

- The user interface on Windows Server 2016 and Windows Server 2012 R2 only allows for basic operations. To perform operations on a device locally, refer to [Manage Defender for Endpoint with PowerShell, WMI, and MPCmdRun.exe](preferences-setup.md). As a result, features that specifically rely on user interaction, such as where the user is prompted to make a decision or perform a specific task, may not work as expected. It's recommended to disable or not enable the user interface nor require user interaction on any managed server as it may impact protection capability.

- Not all Attack Surface Reduction rules are applicable to all operating systems. See [Attack surface reduction rules](attack-surface-reduction-rules-reference.md).

- Operating system upgrades aren't supported. Offboard then uninstall before upgrading. The installer package can only be used to upgrade installations that haven't yet been updated with new antimalware platform or EDR sensor update packages.

- To automatically, deploy and onboard the new solution using Microsoft Endpoint Configuration Manager (MECM) you need to be on [version 2207 or later](/mem/configmgr/core/plan-design/changes/whats-new-in-version-2207#improved-microsoft-defender-for-endpoint-mde-onboarding-for-windows-server-2012-r2-and-windows-server-2016). You can still configure and deploy using version 2107 with the hotfix rollup, but this requires extra deployment steps. See [Microsoft Endpoint Configuration Manager migration scenarios](server-migration.md#microsoft-endpoint-configuration-manager-migration-scenarios) for more information.

## Windows Server Semi-Annual Enterprise Channel (SAC), Windows Server 2019, and Windows Server 2022, and Windows Server 2025

### Download package

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Device Management** > **Onboarding**.

2. Select **Windows Server 1803, 2019, and 2022**.

3. Select **Download package**. Save it as `WindowsDefenderATPOnboardingPackage.zip`.

4. Follow the steps provided in the [Complete the onboarding steps](#step-3-complete-the-onboarding-steps) section.

## Verify the onboarding and installation

Verify that Microsoft Defender Antivirus and Defender for Endpoint are running.

## Run a detection test to verify onboarding

After onboarding the device, you can choose to run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Defender for Endpoint device](run-detection-test.md).

> [!NOTE]
> Running Microsoft Defender Antivirus isn't required but it's recommended. If another antivirus vendor product is the primary endpoint protection solution, you can run Defender Antivirus in Passive mode. You can only confirm that passive mode is on after verifying that Defender for Endpoint sensor (SENSE) is running.

1. Run the following command to verify that Microsoft Defender Antivirus is installed:

   > [!NOTE]
   > This verification step is only required if you're using Microsoft Defender Antivirus as your active antimalware solution.

   ```cmd
   sc.exe query Windefend
   ```

   If the result is 'The specified service doesn't exist as an installed service', then you need to install Microsoft Defender Antivirus.

   For information on how to use Group Policy to configure and manage Microsoft Defender Antivirus on your Windows servers, see [Use Group Policy settings to configure and manage Microsoft Defender Antivirus](use-group-policy-microsoft-defender-antivirus.md).

2. Run the following command to verify that Defender for Endpoint is running:

   ```cmd
   sc.exe query sense
   ```

   The result should show it's running. If you encounter issues with onboarding, see [Troubleshoot onboarding](troubleshoot-onboarding.md).

## Run a detection test

Follow the steps in [Run a detection test on a newly onboarded device](run-detection-test.md) to verify that the server is reporting to Defender for the Endpoint service.

## Next steps

After successfully onboarding devices to the service, you'll need to configure the individual components of Defender for Endpoint. Follow [Configure capabilities](onboard-configure.md#configure-capabilities) to be guided on enabling the various components.

## Offboard Windows servers

You can offboard Windows Server 2012 R2, Windows Server 2016, Windows Server (SAC), Windows Server 2019, Windows Server 2019 Core edition, Windows Server 2022, and Windows Server 2025 using the same method available for Windows 10 client devices.

- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using Configuration Manager](configure-endpoints-sccm.md#offboard-devices-using-configuration-manager)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)
- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)

After offboarding, you can proceed to uninstall the unified solution package on Windows Server 2016 and Windows Server 2012 R2.

For other Windows server versions, you have two options to offboard Windows servers from the service:

- Uninstall the MMA agent
- Remove the Defender for Endpoint workspace configuration

> [!NOTE]
> These offboarding instructions for other Windows Server versions also apply if you're running the previous Defender for Endpoint for Windows Server 2016 and Windows Server 2012 R2 that requires the MMA. Instructions to migrate to the new unified solution are at [Server migration scenarios in Defender for Endpoint](server-migration.md).

## Related articles

- [Onboard Windows devices using Configuration Manager](configure-endpoints-sccm.md)
- [Onboard previous versions of Windows](onboard-downlevel.md)
- [Onboard Windows 10 devices](onboard-windows-client.md)
- [Onboard non-Windows devices](configure-endpoints-non-windows.md)
- [Configure proxy and Internet connectivity settings](configure-proxy-internet.md)
- [Run a detection test on a newly onboarded Defender for Endpoint device](run-detection-test.md)
- [Troubleshooting Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)
- [Microsoft Entra seamless single sign-on](/azure/active-directory/hybrid/how-to-connect-sso-quick-start)
- [Troubleshoot onboarding issues related to Security Management for Defender for Endpoint](troubleshoot-security-config-mgt.md#troubleshoot-onboarding-issues-related-to-security-management-for-microsoft-defender-for-endpoint)

[!INCLUDE [Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
