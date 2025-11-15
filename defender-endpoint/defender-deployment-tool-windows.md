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

The deployment tool offers the following functionality:

- Prerequisite handling: The tool checks for required updates and remediates blocking issues, ensuring that devices are ready for onboarding to Defender.
- Log: All operations are logged locally in a detailed log.
- Avoidance of redundant installations: If Defender for Endpoint is already present, the tool skips redundant installations.
- UI feedback: Provides UI feedback with error descriptions instead of exit codes.
- Passive mode support: On server operating systems and Windows 7, Defender Antivirus can be set to passive mode. This can be helpful when migrating from non-Microsoft antimalware solutions.
- Automation: The tool supports a wide range of command-line options.
- Device handling: Virtual Desktop Infrastructure (VDI) device support ensures that devices deleted and recreated under the same hostname can appear as a single device in the Defender portal.
- Help: Built-in help function.
- Configuration files: You can generate reusable configuration files which make bulk deployments more efficient and less error-prone.
- The ability to work without connectivity: When connectivity is temporarily unavailable, offline onboarding and offboarding is possible.

## Prerequisites and system requirements

- To download the tool, you need an account that has the manage portal settings permission.
- A Defender for Endpoint tenant with public preview features enabled.
- To run the tool, you need to be an administrator (add here the least privileged admin role).
- [Network connectivity to Microsoft Defender cloud services](./configure-environment.md), including the definitionupdates.microsoft.com URL.

### Operating systems

- Windows 11
- Windows 10, version 1607 and newer
- Windows Server 2019 and newer
- Windows Server 2012*, 2012 R2 and 2016 (with minimum November 2018 monthly update rollup installed)
- Windows 7 SP1* and Windows Server 2008 R2* with the KB4474419 update for SHA2 code signing [2019 SHA-2 Code Signing Support requirement for Windows and WSUS - Microsoft Support](https://support.microsoft.com/en-us/topic/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus-64d1c82d-31ee-c273-3930-69a4cde8e64f) and .NET framework 3.5 or later installed

> [!NOTE]
> *For Windows 7 SP1, Windows Server 2008 R2, and Windows Server 2012, the Defender release that will be installed is currently in public preview. For more information, please reference [New Defender on legacy Windows operating systems]

## Using the deployment tool to onboard and offboard devices

### Scenario 1: Standard deployment for single devices

#### Onboarding

#### Offboarding

### Scenario 2: Customized or large-scale deployment

## Options

The DDT is a lightweight, self-updating application designed to streamline onboarding for all Windows versions supported by Defender for Endpoint. Whether you're managing Windows 7, Windows Server 2008 R2 or Windows 11, the tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, or manual installations.

With a basic yet powerful user interface, administrators can double-click the tool and follow an interactive installation and onboarding sequence. For larger deployments, the tool provides robust automation options with advanced command-line parameters, making it easy to integrate with orchestration platforms or custom deployment tools, inclusive of Group Policy, while leaving in place seamless experiences that are provided through other Microsoft solution integrations such as Intune and Defender for Cloud.

A double-click experience is provided for simple, interactive, single-device onboarding -- but enterprise deployment scenarios are facilitated with advanced options through command line parameters and configuration files, to provide flexibility needed for adaptation to any deployment tool or method.

## Features

The following features are provided by the tool in release 0.0.1.9:

### Standard functionality

The following capabilities support most situations where the tool can be run without any specific configuration apart from providing the relevant onboarding file:

- Basic user interface for a double-click interactive installation/onboarding sequence.

- Automatic tool update on launch.

- Prerequisite checks, automatic remediation of (potentially) blocking issues.

- Automatic download of prerequisite updates and installation files as needed.

- Automatic installation of updates and installation packages and the ability to resume after a (manual or if allowed, automatic) reboot if this is required

- Automatic logging of events to a locally created verbose log (Defender deployment tool.log) and the Windows event log.

>[!NOTE]
> The tool expects to be able to connect to Microsoft Defender for Endpoint cloud services to perform the functions mentioned above, and by default, will not proceed with operations if the connectivity check fails. There are, however, advanced command line features that provide solutions for scenarios where connectivity is (temporarily) unavailable; Note, however, that for proper Microsoft Defender for Endpoint operation, the connectivity to Microsoft Defender for Endpoint cloud servicesis needed regardless.

### Advanced functionality

These capabilities, provided through command line parameters, support automation/orchestration through software deployment tools and other methods that can execute scripts or executables with administrative permissions on devices:

- Ability to perform a prerequisite check, logging results without proceeding with installation or onboarding steps.

- Ability to install any required updates but not proceed with further installation or onboarding steps

- Ability to download all installation files and updates to support staging (central storage and distribution scenarios)

- Ability to point to a specific (staging) location to use previously downloaded installation files and updates for installation

- Option to use onboarding/offboarding files stored in a different folder or network location

- Controls to allow automatic reboots and disallow resuming after a required reboot

- The ability to force an offline offboarding operation

- Support for placing Defender Antivirus in passive mode on server operating systems, to support migration scenarios where a non-Microsoft antimalware solution is still in use.

- "VDI" option to ensure devices that are deleted and created again with the same hostname, show as a single device in the portal.

- Ability to configure a proxy for use during installation

- Ability to generate a configuration file to allow definition of multiple parameters for reuse in tool runs ("answer file"). Check to ensure the configuration file is properly formatted before proceeding.

- Option to remove a workspace connection in the Microsoft Monitoring Agent (MMA) if this was previously in use as the agent for legacy versions of MDE.

- Verbose console output, and suppression of console windows.

A full command line reference can be found by running:

`activateMDE.exe -?` (version 1.9)

`DefenderDT.exe -?` (version 1.10 and later)

:::image type="content" source="./media/defender-deployment-tool-windows/help.png" alt-text="Screenshot of the tool help output.":::

## Usage examples

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

- Perform an offboarding operation. Do not ask for approval. Do not show console window.

   ```

- Perform a prerequisite check and display verbose output without displaying a dialog box.

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
