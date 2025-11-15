---
title: Onboard Windows devices using the Defender deployment tool
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
ms.date: 11/06/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---

# Onboard Windows devices using the Defender deployment tool

The Defender deployment tool is a lightweight, self-updating application designed to streamline onboarding for all Windows versions supported by Defender for Endpoint. The tool takes care of prerequisites, automates migrations from older solutions, and can remove the need for complex onboarding scripts, separate downloads, and manual installations.

Using the tool's user interface, administrators can double-click the tool and follow an interactive installation and onboarding sequence. The tool also provides automation options with advanced command-line parameters so that you can integrate with orchestration platforms or custom deployment tools that include the use of group policies.

## Supported operating systems

The Defender deployment tool supports the following operating systems: Windows 7 SP1, Windows Server 2008 R2 SP1, Windows Server 2012 R2, 2016, 2019, 2022, 2025, Windows 10 (version 1809 and newer), and all versions of Windows 11.

While the tool supports onboarding Windows 7 SP1 and Windows Server 2008 R2 SP1s devices, note the following considerations:

- The Defender for Endpoint agent that the deployment tool installs on Windows 7 SP1 and Windows Server 2008 R2 SP1 devices is different than the agent that is installed on newer versions of Windows and Windows Server. For more information about the agent, see [Deploy the Defender for Endpoint agent for Windows 7 SP1 and Windows Server 2008 R2 SP1 devices](./onboard-downlevel.md#deploy-the-defender-for-endpoint-agent-for-windows-7-sp1-and-windows-server-2008-r2-sp1-devices).

- When using the deployment tool to onboard Windows 7 SP1 and Windows Server 2008 R2 SP1 devices, there are a number of additional prerequisites, known issues, and considerations and limitation to be aware of. See the relevant sections in this article. 

## Prerequisites

### General

- Administrative privileges are required for most operations.

- Preview features must be enabled on the tenant.

- Access to the domain *definitionupdates.microsoft.com*. The tool is downloaded and updated from this domain. It's the same domain that is required for product updates.

- Devices to be onboarded should be able to access Defender service URLs to allow the tool to run successfully. The tool will check for connectivity against your specific tenant before proceeding as well. Note that since files are hosted on a content distribution platform there will be no static or predictable IP ranges associated with it – unlike for other Defender cloud services. Regardless, for proper operation of services, see [Configure your network environment to ensure connectivity with Defender for Endpoint service](./configure-environment.md), as other connectivity requirements, such as access to the consolidated **.endpoint.security,microsoft.com*, apply to (additional) functionality you might want to use with the product.

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

## Install Defender for Endpoint on the device

The Defender deployment tool can be used interactively or non-interactively.

Interactive installation 

- Downloading the tool and the onboarding/offboarding file package.

- Running the tool to onboard the devices or devices.

## Usage examples

BRIEF INTRO TO SECTION

Note: if you downloaded "activateMDE.exe" instead of "DefenderDT.exe", replace the commands accordingly.

- Run the Defender deployment tool without changing settings and without interacting with it:

   ```
   DefenderDT.exe -Quiet`
   ```
- Use a *.onboarding* file in the same directory as the tool to run the default onboarding sequence, connect via a proxy, and, if there is a required reboot, initiate it without asking. Do not show the console window.

   ```
   DefenderDT.exe -Proxy:192.168.0.255:8080 -AllowReboot -Quiet
   ```

- Use a *.onboarding* file stored in a network location to perform the onboarding sequence. Do not show the console window.

   ```
   DefenderDT.exe -File:\\server\share\MDE.onboarding -Quiet
   ```

- Perform an offboarding operation. Do not ask for approval. Do not show console window.

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

- Create a configuration file, edit it and then use it to pass multiple parameters to the tool to perform an installation using staged installation files.

   - Step 1: Generate a configuration file

      ```
      DefenderDT.exe -GenerateConfig
      ```

   - Step 2: Use a text editor like Notepad to open the MdeConfig.txt file that was created in the directory and specify parameters you wish to use. Sample:

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


   - Step 3: Run the tool with the configuration file (in our example, stored in the same directory as the tool). NOTE: since the file is in the same directory, there's no need to specify it.

      ```
      DefenderDT.exe
      ```

## Using Group Policy for deployment

The following steps specify how to create a scheduled task to run the tool using group policy:

1. Place DefenderDT.exe and WindowsDefenderATP.onboarding on a shared location that can be accessed by the device. If you've previously created an MDEConfig.txt configuration file, place it in the same location.

1. To create a new GPO, open the [Group Policy Management Console](/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11) (GPMC), right-click Group Policy Objects you want to configure and select New. Enter the name of the new GPO in the dialogue box that is displayed and click OK.

1. Open the [Group Policy Management Console](/internet-explorer/ie11-deploy-guide/group-policy-and-group-policy-mgmt-console-ie11) (GPMC), right-click the Group Policy Object (GPO) you want to configure and select Edit.

1. In the Group Policy Management Editor, go to Computer configuration > Preferences > Control panel settings.

1. Right-click Scheduled tasks, point to New, and then select **Immediate Task (At least Windows 7)**.

1. In the Task window that opens, go to the General tab.

1. Under Security options select *Change User or Group*, type **SYSTEM** and then select **Check Names** and select **OK**. NT AUTHORITY\\SYSTEM appears as the user account the task will run as.

1. Select *Run whether user is logged on or not* and check the *Run with highest privileges* check box.

1. In the Name field, type an appropriate name for the scheduled task.

1. Go to the *Actions* tab and select New. Ensure that *Start a program* is selected in the *Action* field. Enter the full UNC path, using the file server\'s fully qualified domain name (FQDN), of the shared *DefenderDDT.exe* application.

1. In the *Add arguments (optional)* field, enter the \[parameters\](# Onboarding many devices as part of a deployment at scale or for specific operations using advanced functionality) you wish to use. For example, to use an onboarding file not in the working directory of the tool, specify the -file: parameter with the full UNC path to the onboarding file, for example -file: \\\\server\\share\\WindowsDefenderATP.onboarding.

1. Select **OK** and close any open GPMC windows.

1. To link the GPO to an Organization Unit (OU), right-click and select **Link an existing GPO**. In the dialogue box that is displayed, select the Group Policy Object that you wish to link and select *OK*.
