---
title: Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool
description: Learn how to onboard and offboard Windows devices using the Defender deployment tool.
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
ms.topic: install-set-up-deploy
author: paulinbar
ms.author: painbar
ms.custom: nextgen
ms.reviewer: pahuijbr
manager: bagol
ms.collection: 
- m365-security
- tier3
ms.subservice: onboard
search.appverid: met150
ms.date: 11/17/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---

# Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool (preview)

The Defender deployment tool is a lightweight, self-updating application designed to streamline onboarding for all Windows versions supported by Defender for Endpoint. The tool takes care of prerequisites, automates migrations from older solutions, and can remove the need for complex onboarding scripts, separate downloads, and manual installations.

Using the tool's user interface, administrators can double-click the tool and follow an interactive installation and onboarding sequence. The tool also provides automation options with advanced command-line parameters so that you can integrate with orchestration platforms or custom deployment tools that include the use of group policies.

## Supported operating systems

The Defender deployment tool supports the following operating systems: Windows 7 SP1, Windows Server 2008 R2 SP1, Windows Server 2012 R2, 2016, 2019, 2022, 2025, Windows 10 (version 1809 and newer), and all versions of Windows 11.

While the tool supports onboarding Windows 7 SP1 and Windows Server 2008 R2 SP1s devices, note the following considerations:

- The Defender for Endpoint agent that the deployment tool installs on Windows 7 SP1 and Windows Server 2008 R2 SP1 devices is different than the agent that is installed on newer versions of Windows and Windows Server. For more information about the agent, see [Deploy the Defender for Endpoint agent for Windows 7 SP1 and Windows Server 2008 R2 SP1 devices](./onboard-downlevel.md#deploy-the-defender-for-endpoint-agent-for-windows-7-sp1-and-windows-server-2008-r2-sp1-devices).

- When using the deployment tool to onboard Windows 7 SP1 and Windows Server 2008 R2 SP1 devices, there are a number of additional prerequisites, known issues, and considerations and limitation to be aware of. See the relevant sections in this article. 

## Prerequisites

There are prerequisites that pertain to all supported Windows and Windows Server devices, as well as prerequisites that are specific to Windows 7 SP1 and Windows Server 2008 R2 SP1 devices.

### General prerequisites

- Administrative privileges are required for most operations.

- Preview features must be enabled on the tenant.

- Access to the domain *definitionupdates.microsoft.com*. The tool is downloaded and updated from this domain. It's the same domain that is required for product updates.

- Devices to be onboarded should be able to access Defender service URLs to allow the tool to run successfully. The tool checks for connectivity against your specific tenant before proceeding as well. Note that since files are hosted on a content distribution platform there will be no static or predictable IP ranges associated with it – unlike for other Defender cloud services. Regardless, for proper operation of services, see [Configure your network environment to ensure connectivity with Defender for Endpoint service](./configure-environment.md), as other connectivity requirements, such as access to the consolidated **.endpoint.security,microsoft.com*, apply to (additional) functionality you might want to use with the product.

### Additional prerequisites for Windows 7 SP1 and Windows Server 2008 R2 SP1

- Devices to be onboarded must be running an x64 version of Windows 7 SP1 or Windows Server 2008 R2 SP1 with the latest updates installed.

- For the Defender deployment tool to run on Windows 7 SP1 or Windows Server 2008 R2 SP1, at a minimum, the update KB4474419 for [SHA2 code signing](https://support.microsoft.com/topic/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus-64d1c82d-31ee-c273-3930-69a4cde8e64f) must be installed.

- On Server 2008 R2 SP1 devices, .NET 3.5 or a higher version of the .NET framework must be installed.

> [!NOTE]
> *For Windows 7 SP1, Windows Server 2008 R2, and Windows Server 2012, the Defender release that will be installed is currently in public preview. For more information about the Defender agent for Windows 7 SP1 and Windows Server 2008 R2 devices, see [Deploy the Defender for Endpoint agent for Windows 7 SP1 and Windows Server 2008 R2 SP1 devices](./onboard-downlevel.md#deploy-the-defender-for-endpoint-agent-for-windows-7-sp1-and-windows-server-2008-r2-sp1-devices).

## Download the tool

1. In the Microsoft Defender portal (security.microsoft.com), go **System** > **Settings** > **Endpoints** > **Onboarding**.

1. In the Step 1 dropdown menu, choose **Windows (preview)**.

1. Under **Deploy by downloading and applying packages or files**, select the **Download package** button. This downloads the Defender executable and the onboarding file package.

   :::image type="content" source="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png" alt-text="Screenshot showing the Download package button in the Microsoft Defender portal." lightbox="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png":::

   > [!NOTE] 
   > For offboarding, select **Offboarding** in the **Device management** section, choose **Windows 11 and 12** in the Step 1 dropdown menu, and then select the **Download package** button. This downloads the offboarding file package only - it doesn't download the Defender executable, as the executable is the same for both onboarding and offboarding.

## Deploy Defender for Endpoint on devices

The Defender deployment tool can be used interactively or non-interactively.

### Interactive use

The tool supports two interactive experiences that are suitable for deployment to one or a limited number of devices - a "one-click" quick single-machine onboarding experience without any changes to default behavior, and a manual command-line experience that provides more flexibility.

To use the quick "one-click" default installation:

1. Double-click the executable to launch it.

1. In the dialog that appears, select **Continue**.

   :::image type="content" source="./media/defender-deployment-tool-windows/interactive-mode.png" alt-text="Screenshot illustrating running the Defender deployment tool in interactive mode.":::

   The tool will look for the *WindowsDefenderATP.onboarding* file in the directory the tool is being run from and perform default installation and onboarding operations.

You can also perform all the installation and onboarding operations manually through the command-line interface. In addition, the command-line interface supports a variety of other operations, such as running prerequisite checks:

:::image type="content" source="./media/defender-deployment-tool-windows/command-line.png" alt-text="Screenshot illustrating running the Defender deployment tool in command-line mode.":::

To view the complete command reference, run: `DefenderDT.exe -?` (tool version 1.10 and later. If your tool version is 1.9, use `activateMDE.exe -?`).

:::image type="content" source="./media/defender-deployment-tool-windows/help.png" alt-text="Screenshot showing the command reference for the Defender deployment tool." lightbox="./media/defender-deployment-tool-windows/help.png":::

For repetitive deployment scenarios in your environment, you can use a configuration file instead of the command line to pass parameters. To generate the configuration file, run the tool with the `-makeconfig` parameter. After the file is created, open it in a text editor to configure the options to suit your deployment scenario. See the [usage example](#create-config-example).

### Non-interactive use

The Defender deployment tool can be used non-interactively as part of an orchestrated sequence run by a management tool, such as Group Policy, Microsoft Configuration Manager, or other tool that your organization uses for software deployments. For this purpose, the tool provides optional command-line parameters that allow you to customize onboarding operations to support a large variety of scenarios.

## Usage examples

The following examples illustrate how to use the tool.

> [!NOTE]
> If you downloaded *activateMDE.exe* instead of *DefenderDT.exe*, besure to replace the commands accordingly.

- Run the Defender deployment tool without changing settings and without interacting with it:

   ```
   DefenderDT.exe -Quiet`
   ```
- Use a *.onboarding* file in the same directory as the tool to run the default onboarding sequence, connect via a proxy, and, if a reboot is required, initiate it without asking. Don't show the console window.

   ```
   DefenderDT.exe -Proxy:192.168.0.255:8080 -AllowReboot -Quiet
   ```

- Use a *.onboarding* file stored in a network location to perform the onboarding sequence. Don't show the console window.

   ```
   DefenderDT.exe -File:\\server\share\MDE.onboarding -Quiet
   ```

- Perform an offboarding operation. Don't ask for approval. Don't show console window.

   ```
   DefenderDT.exe -Offboard -File:c:\Defender deployment tooltest\WindowsDefenderATPOffboardingScript_valid_until_2025-04-02.offboarding -YES -Quiet
   ```

- Perform a prerequisite check and display verbose output without displaying a dialog box.

   ```
   DefenderDT.exe -PreCheck -Verbose -Quiet
   ```

- Download updates and installation files to be used for staging, to the current directory.

   ```
   DefenderDT.exe -Stage
   ```
<a name="create-config-example"></a>
- Create a configuration file, edit it and then use it to pass multiple parameters to the tool to perform an installation using staged installation files.

   - Step 1: Generate a configuration file

      ```
      DefenderDT.exe -makeconfig
      ```

   - Step 2: Use a text editor such as Notepad to open the *MdeConfig.txt* file that was created in the directory and specify parameters you wish to use. Sample:

      ```
      # Only absolute paths can be used for the parameters accepting paths
      
      # Configures the tool to perform offboarding.
      # Will use the .offboarding file in the current folder if no path was specified using the -File parameter.
      # Add the parameter "YES" to proceed with offboarding without user approval.
      # Offboard: False
      
      # Used with "Offboard" and "Uninstall" parameters.
      # Yes: False
      
      # Downloads the installation files for all Windows versions supported by the tool to a specific location for staging purposes.
      # Stage:
      
      # Specifies the path to the folder containing the installation files. To stage installation files, use the "Stage" parameter.
      # Source:
      
      # Specifies the full path to the .onboarding or .offboarding file if it is not placed in the current folder.
      # File:
      
      # Proxy to use during and after installation. Empty string by default.
      Proxy:
      
      # Prevents any dialogs from displaying. False by default.
      Quiet: False
      
      # Allows device reboots if needed. False by default
      AllowReboot: False
      
      # Prevents the tool from resuming activities after a reboot. False by default.
      NoResumeAfterReboot: False
      
      # Windows Server only. Sets Defender antivirus to run in passive mode.
      Passive: False
      
      # Installs updates but does not perform onboarding, even if an onboarding file is present. False by default.
      UpdateOnly: False
      
      # Displays detailed information. False by default.
      Verbose: False
      
      # Checks for prerequisites and logs results but does not proceed with installation or onboarding. False by default.
      Precheck: False
      
      # Offboards the device and uninstalls any components that were added during onboarding.
      # Will use the .offboarding file in the current folder if no path was specified.
      # Add the parameter "YES" to proceed without user approval.
      Uninstall: False
      
      # Optionally removes the specified workspace connection used by Microsoft Monitoring Agent (MMA). Empty string by default.
      RemoveMMA:
      
      # Allows offboarding to proceed even if there is no connectivity. False by default.
      Offline: False
      ```

   - Step 3: Run the tool with the configuration file.

      ```
      DefenderDT.exe
      ```
      
      Our example assumes that the config file is stored in the same directory as the tool, so there's no need to specify it. If the config file were located somewhere else, it could be necessary to specify the path to the file.

## Using Group Policy for deployment

The following steps show how to create a scheduled task to run the tool using Group Policy:

1. Place the files *DefenderDT.exe* and *WindowsDefenderATP.onboarding* on a shared location that can be accessed by the device. If you've previously created an *MDEConfig.txt* configuration file, place it in the same location.

1. To create a new Group Policy Object (GPO), open the [Group Policy Management Console](/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11) (GPMC), right-click Group Policy Objects you want to configure and select **New**. Enter the name of the new GPO in the dialogue box that is displayed and select **OK**.

1. Open the [Group Policy Management Console](/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11), right-click the Group Policy Object (GPO) you want to configure and select **Edit**.

1. In the Group Policy Management Editor, go to **Computer configuration** > **Preferences** > **Control panel settings**.

1. Right-click **Scheduled tasks**, point to **New**, and then select **Immediate Task (At least Windows 7)**.

1. In the **Task** window that opens, go to the **General** tab.

1. Under **Security options** select **Change User or Group**, type *SYSTEM*, and then select **Check Names** and select **OK**. *NT AUTHORITY\\SYSTEM* appears as the user account the task will run as.

1. Select **Run whether user is logged on or not** and check the **Run with highest privileges** check box.

1. In the **Name** field, type an appropriate name for the scheduled task.

1. Go to the **Actions** tab and select **New**. Ensure that **Start a program** is selected in the Action field. Enter the full UNC path, using the file server's fully qualified domain name (FQDN), of the shared *DefenderDDT.exe* application.

1. In the **Add arguments (optional)** field, enter the [parameters] (# Onboarding many devices as part of a deployment at scale or for specific operations using advanced functionality) you wish to use. For example, to use an onboarding file that is not in the working directory of the tool, specify the *-file:* parameter with the full UNC path to the onboarding file, for example `-file: \\server\share\WindowsDefenderATP.onboarding`.

1. Select **OK** and close any open GPMC windows.

1. To link the GPO to an Organization Unit (OU), right-click and select **Link an existing GPO**. In the dialogue box that is displayed, select the Group Policy Object that you wish to link and select **OK**.

## Considerations and limitations

General considerations and limitations, and additional considerations and limitations specific to Windows 7 SP1 and Windows Server 2008 R2 SP1 devices, are outlined below.

### General considerations and limitations

- When using the *-proxy* parameter, it only apply to Defender deployment tool operations. Despite the parameter description in the command-line help reference, it doesn't set proxy configuration in registry for Defender for Endpoint to use after installation. Note that both the tool and Defender will use whatever proxy has been configured on a system-wide (Windows) level regardless. If you wish to specifically configure a proxy to use for the Defender for Endpoint services on the machine (static proxy), and not system-wide, see [Configure your devices to connect to the Defender for Endpoint service using a proxy](./configure-proxy-internet.md).

- On Windows Server 2016 and later, when the Defender Antivirus feature has been uninstalled or removed, you may encounter an error during the Enabling Feature 'Windows-Defender' step. This can be observed in the user interface, in the local log, under *Sequence completion* with exit code *710* and the error description *EnableFeatureFailed*. In the local log you'll also be able to find error 14081 with the description *0x3701 The referenced assembly could not be found*. This error is not indicative of an issue with the Defender Antivirus feature or source files, as those would typically be resolved by the onboarding tool. Open a support case for Windows Servers if you encounter this issue.

### Additional considerations and limitations for Windows 7 SP1 and Windows Server 2008 R2 SP1

- You may get alerts about *mpclient.dll*, *mpcommu.dll*, *mpsvc.dll*, *msmplics.dll*, and *sense1ds.dll* loaded by either *mpcmdrun.exe* or *mssense.exe*. These should resolve over time.

- On Windows 7 SP1 and on Windows Server 2008 R2 SP1 with the Desktop Experience pack installed, you might see a notification from Action Center *Windows did not find antivirus software on this computer*"*. This is not indicative of a problem.

- In Vulnerability Management – software inventory, you may see a duplicate entry for the Defender for Endpoint software.

- The preview ("beta") version of the [client analyzer tool](https://aka.ms/betamdeanalyzer) can be used to collect logs and perform connectivity troubleshooting on Windows 7 SP1 and Windows Server 2008 R2 SP1. It requires PowerShell 5.1 or later to be installed.

- There's no local user interface for Antivirus. If you wish to manage Antivirus settings locally using PowerShell, version 5.1 or later is required.

- Configuration via Group Policy is supported using a central store with updated group policy templates on a domain controller. For local group policy configuration, templates (*WindowsDefender.admx*/*WindowsDefender.adml*) will need to be manually updated to a newer version (Windows 11) if you wish to use the local group policy editor to apply settings.

- The agent will be installed to `C:\Program Files\Microsoft Defender for Endpoint`

- Windows 7 devices may show up as *Server* in the portal until you update to the latest Sense version by applying KB5005292.

- You can put Defender Antivirus into passive mode on Windows 7 by passing the -passive parameter to the Defender deployment tool. However, it's currently not possible to switch to active mode afterwards by leveraging the ForceDefenderPassiveMode registry key like on Windows server. To switch to active mode, it's necessary to offboard and uninstall, and then to run the Defender deployment tool again without the passive mode parameter.

## Troubleshooting

You can reference the Defender deployment tool log to understand if there were any issues during installation and onboarding. The deployment tool log is located at:

`C:\ProgramData\Microsoft\DefenderDeploymentTool\DefenderDeploymentTool-<COMPUTERNAME>.log`

Events will also be written to the following Windows event logs:

- Onboarding: Windows Logs > Application > Source: WDATPOnboarding

- Offboarding: Windows Logs > Application > Source: WDATPOffboarding

To test if the installation succeeded successfully, perform the following checks:

1. Check if services are running

   `Sc.exe query sense`<br>`Sc.exe query windefend`

   You should see something similar to the following for both services:

   :::image type="content" source="./media/deployment-tool-windows/services-check.png" alt-text="Screenshot of service status check.":::

1. For detailed log collection for Defender Antivirus, including settings and other information, you can run the following command:

   `C:\Program Files\Microsoft Defender for Endpoint\MpCmdRun.exe” -GetFiles -SupportLogLocation <FOLDEROFCHOICE>`

   The latest preview version of the [client analyzer tool](https://aka.ms/betamdeanalyzer) can also be used to collect logs and perform connectivity troubleshooting on Windows 7 SP1 and Windows Server 2008 R2 SP1. It requires PowerShell 5.1 or later to be installed.

## Related content
