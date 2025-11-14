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

- When using the deployment tool to onboard Windows 7 SP1 and Windows Server 2008 R2 SP1 devices there are a number of additional prerequisites, known issues, and considerations and limitation to be aware of. See the relevant sections in this article. 

## Prerequisites

### General

- Administrative privileges are required for most operations.

- Preview features must be enabled on the tenant.

- Access to the domain *definitionupdates.microsoft.com*. The tool is downloaded and updated from this domain. It is the same domain that is required for product updates.

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

1. Under **Deploy by downloading and applying packages or files**, select the **Download package** button. This will download the Defender executable and the onboarding file package.

   :::image type="content" source="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png" alt-text="Screenshot showing the Download package button in the Microsoft Defender portal." lightbox="./media/defender-deployment-tool-windows/defender-deployment-tool-windows-download-package.png":::

   > [!NOTE] 
   > For offboarding, select **Offboarding** in the **Device management** section, choose **Windows 11 and 12** in the Step 1 dropdown menu, and then select the **Download package** button. This downloads the offboarding file package only - it does not download the Defender executable, as the executable is the same for both onboarding and offboarding.

## Install Defender for Endpoint on the device

The Defender deployment tool can be used interactively or non-interactively.

Interactive installation 

- Downloading the tool and the onboarding/offboarding file package.

- Running the tool to onboard the devices or devices.

## Usage examples

## Using Group Policy for deployment

## Considerations and limitations

## Known issues

## Troubleshooting

You can reference the Defender deployment tool log to understand if there were any issues during installation and onboarding. The deployment tool log is located at:

`C:\ProgramData\Microsoft\DefenderDeploymentTool\DefenderDeploymentTool-<COMPUTERNAME>.log`

Events will also be written to the following Windows event logs:

- Onboarding: Windows Logs > Application > Source: WDATPOnboarding

- Offboarding: Windows Logs > Application > Source: WDATPOffboarding

If you cannot resolve the issue based on the information provided, please send us the log and your feedback.

To test if the installation succeeded successfully, you can perform the following checks:

1. Check if services are running

   `Sc.exe query sense`<br>`Sc.exe query windefend`

   You should see something similar to the following for both services:

   :::image type="content" source="{source}" alt-text="{alt-text}":::

1. For detailed log collection for Defender Antivirus, including settings and other information, you can run the following command:

   `C:\Program Files\Microsoft Defender for Endpoint\MpCmdRun.exe” -GetFiles -SupportLogLocation <FOLDEROFCHOICE>`

   The latest preview version of the [client analyzer tool](https://aka.ms/betamdeanalyzer) can also be used to collect logs and perform connectivity troubleshooting on Windows 7 and 2008 R2. It requires PowerShell 5.1 or later to be installed.

## Related content



