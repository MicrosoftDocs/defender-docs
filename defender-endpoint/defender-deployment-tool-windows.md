---
title: Deploy Microsoft Defender endpoint security to Windows devices using the Defender deployment tool (preview)
description: Learn how to onboard and offboard Windows devices using the Defender deployment tool.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: install-set-up-deploy
author: paulinbar
ms.author: painbar
ms.custom: nextgen
ms.reviewer: pahuijbr
ms.collection: 
- m365-security
- tier3
ms.subservice: onboard
ms.date: 02/12/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Deploy Microsoft Defender endpoint security to Windows devices using the Defender deployment tool (preview)

The Defender deployment tool is a lightweight, self-updating application designed to streamline onboarding for [all Windows versions supported by the Defender endpoint security solution](./minimum-requirements.md#windows-versions-supported-by-defender-for-endpoint). The tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, and manual installations, while providing onboarding visibility, customizability, and guardrails.

Using the tool's user interface, administrators can double-click the tool and follow an interactive installation and onboarding sequence. For larger deployments, the tool provides automation options with advanced command-line parameters so that you can integrate with orchestration platforms or custom deployment tools, such as Group Policy, while leaving in place the experiences that are provided through other Microsoft solution integrations such as Intune and Defender for Cloud. Currently, the tool is its own onboarding methodology, and doesn't integrate with other onboarding methods.

The following table describes some of the main features the tool supports.

| Feature | Description |
|---|---|
| **Prerequisite handling** | The tool checks for required updates and remediates blocking issues, ensuring devices are ready for Defender onboarding. |
| **Logging** | All operations are logged locally in a detailed log. |
| **Redundant installation avoidance** | If Defender is already present, the tool skips redundant installations. |
| **UI feedback** | The tool provides UI feedback with error descriptions instead of exit codes. |
| **Onboarding events** | Onboarding events are discoverable on the device timeline and in advanced hunting. |
| **Passive mode support** | On server operating systems and Windows 7, Defender Antivirus can be set to passive mode. This can be helpful when migrating from non-Microsoft anti-malware solutions. |
| **Automation** | The tool supports a wide range of command-line options. |
| **Device handling** | Virtual Desktop Infrastructure (VDI) device support ensures that devices deleted and recreated under the same hostname can appear as a single device in the Defender portal. |
| **Help** | A built-in help function displays all available command-line options. |
| **Configuration files** | You can generate reusable configuration files that make bulk deployments more efficient and less error-prone. |
| **Working without connectivity** | When connectivity is temporarily unavailable, offline onboarding and offboarding are possible. |
| **Protections for high-value assets** | The [selective response actions capability (preview)](restrict-response-actions-high-value-assets.md) allows you to restrict high-impact security operations on high-value assets (HVAs) during onboarding to reduce operational risk on critical infrastructure. |
| **Deployment key entry** | To add guardrails to the onboarding process and prevent accidental onboarding, using the Defender deployment tool requires entering a key generated in the portal onboarding page. |
| **Custom expiry** | Defender deployment packages allow you to specify when you'd like them to expire, for any time up to a year, so that the package won't remain valid forever. This prevents adversaries from exploiting any old onboarding packages they might discover. Microsoft recommends making the validity period of packages as short as possible to reduce the risk of unauthorized deployment package use. |
| **Ability to view deployment packages** | You can see key properties of your deployment packages in one place by navigating to **Settings** > **Endpoints** > **Deployment packages**. You can filter by active, expired, or hidden deployment packages. |

When the [interactive](#interactive-use), double-click experience is used, the tool automatically begins the onboarding process and asks you to input the Defender deployment tool key generated in the portal when you create your Defender deployment tool package in **Settings** > **Endpoints** > **Onboarding**. It handles the installation of most prerequisite updates and the latest Defender components, and connects the device to the Defender services. If needed, the tool asks you to reboot the device to finish installation after you sign in again.

For more [advanced and large-scale deployments](#advanced-and-large-scale-deployments), the tool offers functionality to perform additional and orchestrated steps through command-line parameters or a configuration file.

To view the complete command reference after [downloading the tool](#generate-and-download-a-new-onboarding-package), run: `DefenderDT.exe -?`.

## Supported operating systems

The Defender deployment tool supports the following operating systems: Windows 7 SP1, Windows Server 2008 R2 SP1, Windows Server 2012 R2, 2016, 2019, 2022, 2025, Windows 10 (version 1809 and newer), and all versions of Windows 11.

> [!NOTE]
> The Defender endpoint security solution that the deployment tool installs on Windows 7 SP1 and Windows Server 2008 R2 SP1 devices is **in preview**, and is different than the one for newer versions of Windows and Windows Server. For more information, see [Deploy the Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1 devices](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security).

## Prerequisites

There are prerequisites that pertain to all supported Windows and Windows Server devices, as well as prerequisites that are specific to Windows 7 SP1 and Windows Server 2008 R2 SP1 devices.

> [!NOTE]
> If you plan to use the selective response actions feature to restrict high-impact security operations on high-value assets, see also the [prerequisites for that feature](./restrict-response-actions-high-value-assets.md#prerequisites-and-supported-operating-systems).

### General prerequisites

- Administrative privileges are required for most operations.

- Preview features must be enabled on the tenant.

- Access to the domain *definitionupdates.microsoft.com*. The tool is downloaded and updated from this domain. Since the files it downloads are hosted on a content distribution platform, there will be no static or predictable IP ranges associated with it – unlike for other Defender cloud services.

- While the tool checks for connectivity against your specific tenant before proceeding, other connectivity requirements, such as access to the consolidated *\*.endpoint.security.microsoft.com/*\*, apply to (additional) functionality you might want to use with the product. See [Configure your network environment to ensure connectivity with the Defender for Endpoint service](./configure-environment.md).

- The selective response actions feature must be enabled if you plan to use that feature to restrict high-impact security operations on high-value assets. See [Enabling the selective response actions feature](./restrict-response-actions-high-value-assets.md#enabling-the-feature).

### Additional prerequisites for Windows 7 SP1 and Windows Server 2008 R2 SP1

- Devices must be running an x64 version of Windows 7 SP1 or Windows Server 2008 R2 SP1. We recommend having the latest updates installed to avoid reboots and to significantly reduce required installation time.

- For the Defender deployment tool to run on Windows 7 SP1 or Windows Server 2008 R2 SP1, at a minimum, the update KB4474419 for [SHA2 code signing](https://support.microsoft.com/topic/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus-64d1c82d-31ee-c273-3930-69a4cde8e64f) must be installed.


   - Servicing stack update (SSU) ([KB4490628](https://support.microsoft.com/help/4490628)). If you use Windows Update, the required SSU is offered to you automatically. 

   - SHA-2 update ([KB4474419](https://support.microsoft.com/help/4474419)) released September 10, 2019. If you use Windows Update, the required SHA-2 update is offered to you automatically. 

- On Server 2008 R2 SP1 devices, .NET 3.5 or a higher version of the .NET framework must also be installed.

> [!NOTE]
> For Windows 7 SP1, Windows Server 2008 R2, and Windows Server 2012, the Defender endpoint security solution that will be installed is currently in public preview. For more information about Defender endpoint security for Windows 7 SP1 and Windows Server 2008 R2 devices, see [Deploy the Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1 devices](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security).

## Generate and download a new onboarding package

The Defender deployment tool can generate two kinds of onboarding packages - a full functionality package that allows all supported response actions on devices onboarded with the package, and a restricted functionality package that can restrict certain high-impact response actions on onboarded devices. Before generating a new onboarding package, determine which mode is appropriate for your devices.

*  Generate a full functionality package if you're onboarding standard devices.
*  Generate a restricted functionality package if you're onboarding Tier-0 and high-value assets such as domain controllers, critical servers, and other sensitive devices, and you want to enforce stricter security boundaries. For more information about the selective response actions capability and the security operations modes, see [Restrict response actions on high-value assets (preview)](restrict-response-actions-high-value-assets.md).

Once you've determined which type of package you want to generate, select the relevant tab below for instructions on how to generate the package.

# [Full functionality](#tab/full-functionality)

1. In the Microsoft Defender portal (security.microsoft.com), go **System** > **Settings** > **Endpoints** > **Onboarding**.

1. In the Step 1 dropdown menu, choose **Windows (preview)**.

1. Under **Deploy by downloading and applying packages or files**, select the **Onboard** button.

   :::image type="content" source="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png" alt-text="Screenshot showing the Download package button in the Microsoft Defender portal." lightbox="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png":::

1. The **Generate Defender deployment tool with an access key** page appears.

   :::image type="content" source="./media/defender-deployment-tool-windows/configure-deployment-package.png" alt-text="Screenshot showing the how to configure a new deployment package." lightbox="./media/defender-deployment-tool-windows/configure-deployment-package.png":::

   * Provide a name for the package. Be sure to create a name that's unique and descriptive.

   * Set an expiration date for the package. You can set the expiration date for any time up to a year. It's recommended to make the validity period of packages as short as possible to reduce the risk of unauthorized deployment package use.

   * Make sure **Full functionality** is selected.

   * Select **Generate**.

1. When the package is ready, you'll see a page that has the package access key and a download button, similar to the following image.

   :::image type="content" source="./media/defender-deployment-tool-windows/deployment-package-download-page.png" alt-text="Screenshot showing the key that is generated for the deployment tool package." lightbox="./media/defender-deployment-tool-windows/deployment-package-download-page.png":::

   Copy the key and save it, as it will be needed with the deployment tool.

   After you've copied the key and saved it, select **Download deployment tool**. This downloads a *.zip* file of the Defender deployment tool executable.

# [Restricted functionality](#tab/restricted-functionality)

1. In the Microsoft Defender portal (security.microsoft.com), go **System** > **Settings** > **Endpoints** > **Onboarding**.

1. In the Step 1 dropdown menu, choose **Windows (preview)**.

1. Under **Deploy by downloading and applying packages or files**, select the **Onboard** button.

   :::image type="content" source="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png" alt-text="Screenshot showing the Download package button in the Microsoft Defender portal." lightbox="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png":::

1. The **Generate Defender deployment tool with an access key** page appears.

   :::image type="content" source="./media/defender-deployment-tool-windows/configure-deployment-package.png" alt-text="Screenshot showing the how to configure a new deployment package." lightbox="./media/defender-deployment-tool-windows/configure-deployment-package.png":::

   * Provide a name for the package. Be sure to create a name that's unique and descriptive.

   * Set an expiration date for the package. You can set the expiration date for any time up to a year. It's recommended to make the validity period of packages as short as possible to reduce the risk of unauthorized deployment package use.

   * Select **Restricted**.

      A list of high-impact security operations appears. Select the boxes next to the operations you want to allow on the onboarded device, and unselect the boxes next to the operations you want to disallow.
      
      :::image type="content" source="./media/defender-deployment-tool-windows/security-operations-mode-menu.png" alt-text="Screenshot showing the security operations mode options in the Microsoft Defender portal." lightbox="./media/defender-deployment-tool-windows/security-operations-mode-menu.png":::

      The following table describes the available security operations that you can allow or disallow when you choose restricted mode.

      [!INCLUDE [configurable-selective-response-actions](includes/configurable-selective-response-actions.md)]

      For more information about the security operations modes and the selective response actions capability, see [Restrict response actions on high-value assets (preview)](restrict-response-actions-high-value-assets.md).

      > [!NOTE]
      > Devices onboarded in restricted mode don't support the execution of Live Response scripts, even when **Live Response** is enabled in these settings. This restriction is enforced by design to ensure script-based actions remain blocked, maintaining a higher level of protection for sensitive assets.
      > 
      > Restricted mode with all response actions allowed **is not** equivalent to full functionality. When you onboard a device using a restricted package, running scripts is disabled by design, whereas onboarding with a full functionality package provides unrestricted access to all supported response actions and capabilities.

   * When you're done configuring the package, select **Generate**.

1. When the package is ready, you'll see a page that has the package access key and a download button, similar to the following image.

   :::image type="content" source="./media/defender-deployment-tool-windows/deployment-package-download-page.png" alt-text="Screenshot showing the key that is generated for the deployment tool package." lightbox="./media/defender-deployment-tool-windows/deployment-package-download-page.png":::

   Copy the key and save it, as it will be needed with the deployment tool.

   After you've copied the key and saved it, select **Download deployment tool**. This downloads a *.zip* file of the Defender deployment tool executable.

---

## Deploy Defender endpoint security on devices

The Defender deployment tool can be used interactively or non-interactively.

### Interactive use

The tool supports two interactive experiences that are suitable for deployment to one or a limited number of devices - a "double-click" quick single-machine onboarding experience without any changes to default behavior, and a manual command-line experience that provides more flexibility.

To use the quick "double-click" default installation:

1. Double-click the executable to launch it.

1. A dialog informs you that onboarding on the device will start. Select **Continue**.

   :::image type="content" source="./media/defender-deployment-tool-windows/double-click-mode.png" alt-text="Screenshot illustrating running the Defender deployment tool in double-click mode." lightbox="./media/defender-deployment-tool-windows/double-click-mode.png":::

1. Enter the Defender deployment tool key that you copied from the portal, and then select **Continue**.

   :::image type="content" source="./media/defender-deployment-tool-windows/interactive-mode.png" alt-text="Screenshot illustrating running the Defender deployment tool in interactive mode." lightbox="./media/defender-deployment-tool-windows/interactive-mode.png":::

1. Wait until installation is complete, and then select **OK**. No device reboot is required.

   :::image type="content" source="./media/defender-deployment-tool-windows/process-complete.png" alt-text="Screenshot showing the message indicating that onboarding is complete.":::

### Non-interactive use

You can also perform all the installation and onboarding operations manually through the command-line interface. In addition, the command-line interface supports various other operations, such as running prerequisite checks:

:::image type="content" source="./media/defender-deployment-tool-windows/command-line.png" alt-text="Screenshot illustrating running the Defender deployment tool in command-line mode.":::

To view the complete command reference, run: `DefenderDT.exe -?`.

### Advanced and large-scale deployments

The Defender deployment tool can be used non-interactively as part of an orchestrated sequence run by a management tool, such as Group Policy, Microsoft Configuration Manager, or other tool that your organization uses for software deployments.

For this purpose, the tool provides optional command-line parameters that allow you to customize onboarding operations to support a large variety of scenarios.

:::image type="content" source="./media/defender-deployment-tool-windows/help.png" alt-text="Screenshot showing the command reference for the Defender deployment tool." lightbox="./media/defender-deployment-tool-windows/help.png":::

For repetitive deployment scenarios in your environment, you can use a configuration file instead of the command line to pass parameters. To generate the configuration file, run the tool with the `-makeconfig` parameter. After the file is created, open it in a text editor to configure the options to suit your deployment scenario. See the [usage example](#create-config-example).

## Usage examples

The following examples illustrate how to use the tool.

- Run the Defender deployment tool without changing settings and without interacting with it:

   ```dos
   DefenderDT.exe -Quiet
   ```

- Use a *WindowsDefenderATP.onboarding* file in the same directory as the tool to run the default onboarding sequence, connect through and configure a proxy to use, and, if a reboot is required, initiate it without asking. Don't show the console window.

   ```dos
   DefenderDT.exe -Proxy:192.168.0.255:8080 -AllowReboot -Quiet
   ```

- Use a *.onboarding* file stored in a network location to perform the onboarding sequence. Don't show the console window.

   ```dos
   DefenderDT.exe -File:\\server\share\Defender.onboarding -Quiet
   ```

- Perform an offboarding operation. Don't ask for approval. Don't show console window.

   ```dos
   DefenderDT.exe -Offboard -File:c:"\Defender deployment tooltest\WindowsDefenderATPOffboardingScript_valid_until_2025-04-02.offboarding" -YES -Quiet
   ```

- Perform a prerequisite check and display verbose output without displaying a dialog box.

   ```dos
   DefenderDT.exe -PreCheck -Verbose -Quiet
   ```

- Download updates and installation files to be used for staging, to the current directory.

   ```dos
   DefenderDT.exe -Stage
   ```

  <a name="create-config-example"></a>

- Create and edit a configuration file, and then use it to pass multiple parameters to the tool to perform an installation using staged installation files.
  1. Generate a configuration file:

      ```dos
      DefenderDT.exe -MakeConfig
      ```

  2. Use Notepad to open the *MdeConfig.txt* file that was created in the directory. Specify parameters you want to use.

     For example:

     ```text
     # Only absolute paths can be used for the parameters accepting paths

     # Configures the tool to perform offboarding.

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

  3. Run the tool with the configuration file.

      ```dos
      DefenderDT.exe -File:\\server\DDT\Defenderconfig.txt
      ```

      If the *MdeConfig.txt* file is stored in the same directory as the tool, you don't need to specify a path.

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

1. Go to the **Actions** tab and select **New**. Ensure that **Start a program** is selected in the Action field. Enter the full UNC path, using the file server's fully qualified domain name (FQDN), of the shared *DefenderDT.exe* application.

1. In the **Add arguments (optional)** field, enter the [parameters](#advanced-and-large-scale-deployments) you wish to use. For example, to use an onboarding file that isn't in the working directory of the tool, specify the *-file:* parameter with the full UNC path to the onboarding file, for example `-file: \\server\share\WindowsDefenderATP.onboarding`.

1. Select **OK** and close any open GPMC windows.

1. To link the GPO to an Organization Unit (OU), right-click and select **Link an existing GPO**. In the dialogue box that is displayed, select the Group Policy Object that you wish to link and select **OK**.

## Considerations and limitations

General considerations and limitations, and additional considerations and limitations specific to Windows 7 SP1 and Windows Server 2008 R2 SP1 devices, are outlined below.

### General considerations and limitations

- When you're using the interactive experience, and a reboot is required to complete the sequence, you must sign in again after the reboot to resume. Otherwise, the device won't be fully onboarded.

- On Windows Server 2016 and later, when the Defender Antivirus feature has been uninstalled or removed, you might encounter an error during the Enabling Feature 'Windows-Defender' step. This can be observed in the user interface, in the local log, under *Sequence completion* with exit code *710* and the error description *EnableFeatureFailed*. In the local log, you'll also be able to find error 14081 with the description *0x3701 The referenced assembly could not be found*. This error isn't indicative of an issue with the Defender Antivirus feature or source files, as those would typically be resolved by the onboarding tool. Open a support case for Windows Servers if you encounter this issue.

### Known issues and limitations for Windows 7 SP1 and Windows Server 2008 R2 SP1

- You might get alerts about *mpclient.dll*, *mpcommu.dll*, *mpsvc.dll*, *msmplics.dll*, and *sense1ds.dll* loaded by either *MpCmdRun.exe* or *MsSense.exe*. These should resolve over time.

- On Windows 7 SP1 and on Windows Server 2008 R2 SP1 with the Desktop Experience pack installed, you might see a notification from Action Center *Windows did not find antivirus software on this computer*. This isn't indicative of a problem.

- The preview ("beta") version of the [client analyzer tool](https://aka.ms/betamdeanalyzer) can be used to collect logs and perform connectivity troubleshooting on Windows 7 SP1 and Windows Server 2008 R2 SP1. It requires PowerShell 5.1 or later to be installed.

- There's no local user interface for Antivirus. If you wish to manage Antivirus settings locally using PowerShell, version 5.1 or later is required.

- Configuration via Group Policy is supported using a central store with updated group policy templates on a domain controller. For local group policy configuration, templates (*WindowsDefender.admx*/*WindowsDefender.adml*) will need to be manually updated to a newer version (Windows 11) if you wish to use the local group policy editor to apply settings.

- The Defender endpoint security solution will be installed to `C:\Program Files\Microsoft Defender for Endpoint`

- You can put Defender Antivirus into passive mode on Windows 7 by passing the *-passive* parameter to the Defender deployment tool. However, it's currently not possible to switch to active mode afterwards by using the ForceDefenderPassiveMode registry key like on Windows server. To switch to active mode, it's necessary to offboard and uninstall, and then to run the Defender deployment tool again without the passive mode parameter.

## Troubleshooting

You can reference the Defender deployment tool log to understand if there were any issues during installation and onboarding. The deployment tool log is located at:

`C:\ProgramData\Microsoft\DefenderDeploymentTool\DefenderDeploymentTool-<COMPUTERNAME>.log`

Events will also be written to the following Windows event logs:

- **Onboarding**: Windows Logs \> Application \> Source: WDATPOnboarding
- **Offboarding**: Windows Logs \> Application \> Source: WDATPOffboarding

To test if the installation succeeded successfully, do the following checks:

1. Verify the services are running with the following commands:

   ```dos
   Sc.exe query sense

   Sc.exe query windefend
   ```

   You should see the following output:

   ```console
   SERVICE_NAME: sense
           TYPE               : 10  WIN32_OWN_PROCESS
           STATE              : 4  RUNNING
                                   (STOPPABLE, NOT_PAUSABLE, ACCEPTS_PRESHUTDOWN)
           WIN32_EXIT_CODE    : 0  (0x0)
           SERVICE_EXIT_CODE  : 0  (0x0)
           CHECKPOINT         : 0x0
           WAIT_HINT          : 0x0

   SERVICE_NAME: windefend
           TYPE               : 10  WIN32_OWN_PROCESS
           STATE              : 4  RUNNING
                                   (STOPPABLE, NOT_PAUSABLE, ACCEPTS_SHUTDOWN)
           WIN32_EXIT_CODE    : 0  (0x0)
           SERVICE_EXIT_CODE  : 0  (0x0)
           CHECKPOINT         : 0x0
           WAIT_HINT          : 0x0
   ```

1. For detailed log collection for Defender Antivirus, including settings and other information, see [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).

1. You can use the [client analyzer tool](run-analyzer-windows.md) to collect logs and perform connectivity troubleshooting on Windows.

## Related content

- [Deploy the Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1 devices](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security)
