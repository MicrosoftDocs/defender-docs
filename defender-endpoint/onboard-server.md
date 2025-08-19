---
title: Onboard servers through Microsoft Defender for Endpoint's onboarding experience
description: Learn how to onboard servers running Windows Server or Linux to Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
ms.reviewer: pahuijbr
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: install-set-up-deploy
ms.subservice: onboard
search.appverid: met150
ms.date: 06/27/2025
---

# Onboard servers through Microsoft Defender for Endpoint's onboarding experience

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

## Overview

[Defender for Endpoint](microsoft-defender-endpoint.md) can help protect your organization's servers with capabilities that include posture management, threat protection, and endpoint detection and response. Defender for Endpoint provides your security team with deeper insight into server activities, coverage for kernel and memory attack detection, and the ability to take response actions when necessary. Defender for Endpoint also integrates with Microsoft Defender for Cloud, providing your organization with a comprehensive server protection solution. 

Depending on your particular environment, you can choose from several options to onboard servers to Defender for Endpoint. This article describes available options for Windows Server and Linux, important points to consider, how to run a detection test after onboarding, and how to offboard servers.

> [!TIP]
> As a companion to this article, see our [Security Analyzer setup guide](https://go.microsoft.com/fwlink/p/?linkid=2268522) to review best practices and learn to fortify defenses, improve compliance, and navigate the cybersecurity landscape with confidence. For a customized experience based on your environment, you can access the [Security Analyzer automated setup guide](https://go.microsoft.com/fwlink/p/?linkid=2268615) in the Microsoft 365 admin center.

## Server plans

To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:

- [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) (as part of the Defender for Cloud) offering
- Microsoft Defender for Endpoint for servers
- [Microsoft Defender for Business servers](/defender-business/get-defender-business#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

## Integration with Microsoft Defender for Servers

Defender for Endpoint integrates seamlessly with [Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview) (in Defender for Cloud). If your subscription includes Defender for Servers Plan 1 or Plan 2, you can:

- Onboard servers automatically
- Have servers that are monitored by Defender for Cloud appear in the Microsoft Defender portal, in the device inventory
- Conduct detailed investigations as a Defender for Cloud customer

Here are a few things to keep in mind:

- When you use Defender for Cloud to monitor servers, a Defender for Endpoint tenant is created automatically. Data collected by Defender for Endpoint is stored in the geographical location of the tenant, identified during provisioning. (For example, in the US for customers in the USA; in EU for European customers; and in the UK for customers in the United Kingdom.)
- If you use Defender for Endpoint before using Defender for Cloud, your data is stored in the location you specified when you created your tenant, even if you integrate with Defender for Cloud at a later time.
- Once configured, you can't change the location of where your data is stored. To move your data to another location, [contact support](contact-support.md) to reset your tenant.
- Server endpoint monitoring utilizing this integration isn't currently available for Office 365 GCC customers.
- Linux servers onboarded through Defender for Cloud have their initial configuration set to run Microsoft Defender Antivirus in [passive mode](/defender-endpoint/microsoft-defender-antivirus-compatibility#microsoft-defender-antivirus-and-non-microsoft-antivirusantimalware-solutions). For information on how to deploy Defender for Endpoint on Linux server, start with the [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md). 

For more information, see [Protect your endpoints with Defender for Endpoint integration with Defender for Cloud](/azure/defender-for-cloud/integration-defender-for-endpoint). 

## Important information for non-Microsoft antivirus/anti-malware solutions

If you intend to use a non-Microsoft anti-malware solution, you need to run Microsoft Defender Antivirus in passive mode. Make sure to set passive mode during the installation and onboarding process. For more information, see [Windows Server and passive mode](/defender-endpoint/microsoft-defender-antivirus-compatibility#windows-server-and-passive-mode).

> [!IMPORTANT]
> If you're installing Defender for Endpoint on servers running McAfee Endpoint Security or VirusScan Enterprise, the McAfee platform version might need to be updated to ensure that Microsoft Defender Antivirus isn't removed or disabled. For more information on specific version numbers required, see the [McAfee Knowledge Center article](https://kcm.trellix.com/corporate/index?page=content&id=KB88214).

## Server onboarding options

You can choose from several deployment methods and tools to onboard servers, as summarized in the following table:

|Operating system| Deployment method |
|---|---|
| Windows Server 2025 <br/>Windows Server 2022 <br/>Windows Server 2019<br/>Windows Server, version 1803 <br/>Windows Server 2016 <br/>Windows Server 2012 R2 | [Local script](configure-endpoints-script.md) (uses an onboarding package)<br/>[Defender for Servers](/azure/defender-for-cloud/tutorial-enable-servers-plan)<br/> [Microsoft Configuration Manager](/mem/configmgr/protect/deploy-use/defender-advanced-threat-protection) <br/> [Group Policy](configure-endpoints-gp.md) <br/>[VDI scripts](configure-endpoints-vdi.md) <br/>[Onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint) <br/>[Modern, unified solution for Windows Server 2016 and 2012 R2](#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2) |
|Linux |[Installer script based deployment](/defender-endpoint/linux-installer-script) <br/>[Ansible script based deployment](linux-install-with-ansible.md) <br/>[Chef script based deployment](linux-deploy-defender-for-endpoint-with-chef.md)<br/>[Puppet script based deployment](linux-install-with-puppet.md) <br/>[Saltstack script based deployment](linux-install-with-saltack.md)<br/> [Manual deployment](linux-install-manually.md) (uses a local script) <br/>[Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)<br/>[Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/quickstart-onboard-machines)<br/>[Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md) |

## Onboard Windows Server, version 1803, Windows Server 2019, and Windows Server 2025

:::image type="content" source="media/server-onboarding-diagram-2025.png" alt-text="Server Onboarding" lightbox="media/server-onboarding-diagram-2025.png":::

1. Make sure to review the [Minimum requirements for Defender for Endpoint](minimum-requirements.md).

2. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints**, and then, under **Device management**, select **Onboarding**.

3. In the **Select operating system to start onboarding process** list, select **Windows Server 2019, 2022, and 2025**.

   :::image type="content" source="media/mde-onboard-winserver201920222025-ui.png" alt-text="Screenshot showing the onboarding screen for Windows Server 2019 and later in Defender for Endpoint.":::

4. Under **Connectivity type**, select either **Streamlined** or **Standard**. (See [prerequisites for streamlined connectivity](/defender-endpoint/configure-device-connectivity#prerequisites).)

5. Under **Deployment method**, select an option, and then download the onboarding package. 

6. Follow the instructions in one of the following articles for your deployment method:

   - [Local script](configure-endpoints-script.md)
   - [Group Policy](configure-endpoints-gp.md)
   - [Configuration Manager](configure-endpoints-sccm.md)
   - [VDI onboarding scripts for non-persistent devices](configure-endpoints-vdi.md)
   - [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)

## Onboard Windows Server 2016 and Windows Server 2012 R2

:::image type="content" source="media/server-onboarding-tools-methods.png" alt-text="An illustration of onboarding flow for Windows Servers and Windows 10 devices." lightbox="media/server-onboarding-tools-methods.png":::

1. Make sure to review the [Minimum requirements for Defender for Endpoint](minimum-requirements.md) and [Prerequisites for Windows Server 2016 and 2012 R2](#prerequisites-for-windows-server-2016-and-2012-r2).

2. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints**, and then, under **Device management**, select **Onboarding**.

3. In the **Select operating system to start onboarding process** list, select **Windows Server 2016 and Windows Server 2012 R2**.

   :::image type="content" source="media/mde-onboard-winserver20122016-ui.png" alt-text="Screenshot showing the device onboarding page in Defender for Endpoint.":::

3. Under **Connectivity type**, select either **Streamlined** or **Standard**. (See [prerequisites for streamlined connectivity](/defender-endpoint/configure-device-connectivity#prerequisites).)

4. Under **Deployment method**, select an option, and then download the installation package and onboarding package. 

   > [!NOTE]
   > The installation package is updated monthly. Be sure to download the latest package before usage.
   > To update after installation, you don't have to run the installer package again. If you do, the installer asks you to offboard first as that is a requirement for uninstallation. See [Update packages for Defender for Endpoint on Windows Server 2012 R2 and 2016](#update-packages-for-windows-server-2016-or-windows-server-2012-r2).

5. Follow the instructions in one of the following articles for your deployment method:

   - [Local script](configure-endpoints-script.md)
   - [Group Policy](configure-endpoints-gp.md)
   - [Configuration Manager](configure-endpoints-sccm.md)
   - [VDI onboarding scripts for non-persistent devices](configure-endpoints-vdi.md)
   - [Migrate servers from Microsoft Monitoring Agent to the modern unified solution](server-migration.md)
   - [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)

### Prerequisites for Windows Server 2016 and 2012 R2

- It's recommended to install the latest available Servicing Stack Update (SSU) and Latest Cumulative Update (LCU) on the server.
- The SSU from September 14, 2021 or later must be installed.
- The LCU from September 20, 2018 or later must be installed.  
- Enable the Microsoft Defender Antivirus feature and ensure it's up to date. For more information on enabling Defender Antivirus on Windows Server, see [Re-enable Defender Antivirus on Windows Server if it was disabled](enable-update-mdav-to-latest-ws.md#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-disabled) and [Re-enable Defender Antivirus on Windows Server if it was uninstalled](enable-update-mdav-to-latest-ws.md#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-uninstalled).
- Download and install the latest platform version using Windows Update. Alternatively, download the update package manually from the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623) or from [MMPC](https://go.microsoft.com/fwlink/?linkid=870379&arch=x64).
- On Windows Server 2016, Microsoft Defender Antivirus must be installed as a feature and fully updated before installation. 

### Update packages for Windows Server 2016 or Windows Server 2012 R2

To receive regular product improvements and fixes for the Defender for Endpoint component, ensure Windows Update [KB5005292](https://go.microsoft.com/fwlink/?linkid=2168277) gets applied or approved. In addition, to keep protection components updated, see [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md#platform-and-engine-releases).

If you're using Windows Server Update Services (WSUS) and/or [Microsoft Configuration Manager](/mem/configmgr/core/understand/introduction), this new "Microsoft Defender for Endpoint update for EDR Sensor" is available under the category "Microsoft Defender for Endpoint."

## Functionality in the modern unified solution for Windows Server 2016 and Windows Server 2012 R2

The previous implementation (before April 2022) of onboarding Windows Server 2016 and Windows Server 2012 R2 required the use of Microsoft Monitoring Agent (MMA). The modern, unified solution package makes it easier to onboard servers by removing dependencies and installation steps. It also provides a much expanded feature set. For more information, see the following resources:

- [Server migration scenarios from the previous, MMA-based Microsoft Defender for Endpoint solution](server-migration.md)
- [Tech Community Blog: Defending Windows Server 2012 R2 and 2016](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/defending-windows-server-2012-r2-and-2016/ba-p/2783292)

Depending on the server that you're onboarding, the unified solution installs Defender for Endpoint and/or the EDR sensor on the server. The following table indicates what component is installed and what is built in by default.

|Server version|Microsoft Defender Antivirus|EDR sensor|
|----|----|----|
|Windows Server 2012 R2|![Yes](media/svg/check-yes.svg)|![Yes](media/svg/check-yes.svg)|
|Windows Server 2016|Built-in|![Yes](media/svg/check-yes.svg)|
|Windows Server 2019 and later|Built-in|Built-in|

### Known issues and limitations in the modern unified solution

The following points apply to Windows Server 2016 and Windows Server 2012 R2:

- Always download the latest installer package from the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) before performing a new installation and ensure prerequisites are met. After installation, ensure to regularly update using component updates described in the section [Update packages for Defender for Endpoint on Windows Server 2012 R2 and 2016](#update-packages-for-windows-server-2016-or-windows-server-2012-r2).

- An operating system update can introduce an installation issue on machines with slower disks due to a time out with service installation. Installation fails with the message `Couldn't find c:\program files\windows defender\mpasdesc.dll, - 310 WinDefend`. Use the latest installation package, and the latest [install.ps1](https://github.com/microsoft/mdefordownlevelserver) script to help clear the failed installation if necessary.

- The user interface on Windows Server 2016 and Windows Server 2012 R2 only allows for basic operations. To perform operations on a device locally, refer to [Manage Defender for Endpoint with PowerShell, WMI, and MPCmdRun.exe](preferences-setup.md). As a result, features that specifically rely on user interaction, such as where the user is prompted to make a decision or perform a specific task, might not work as expected. It's recommended to disable or not enable the user interface nor require user interaction on any managed server as it may impact protection capability.

- Not all attack surface reduction rules are applicable to all operating systems. See [Attack surface reduction rules](attack-surface-reduction-rules-reference.md).

- Operating system upgrades are supported on Windows 10 and 11, and Windows Server 2019 or later. These versions include the necessary Defender for Endpoint components. For Windows Server 2016 and earlier, you must offboard from Defender for Endpoint and uninstall Defender for Endpoint before upgrading the OS.

- To automatically deploy and onboard the new solution using Microsoft Endpoint Configuration Manager (MECM) you need to be on [version 2207 or later](/mem/configmgr/core/plan-design/changes/whats-new-in-version-2207#improved-microsoft-defender-for-endpoint-mde-onboarding-for-windows-server-2012-r2-and-windows-server-2016). You can still configure and deploy using version 2107 with the hotfix rollup, but this requires extra deployment steps. See [Microsoft Endpoint Configuration Manager migration scenarios](server-migration.md#microsoft-endpoint-configuration-manager-migration-scenarios) for more information.

## Onboard Linux servers

To onboard servers running Linux, follow these steps:

1. Make sure to review the [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md).

2. Choose a deployment method. Depending on your particular environment, you can choose from several options:

   - [Installer script based deployment](/defender-endpoint/linux-installer-script) 
   - [Ansible based deployment](linux-install-with-ansible.md) 
   - [Chef based deployment](linux-deploy-defender-for-endpoint-with-chef.md)
   - [Puppet based deployment](linux-install-with-puppet.md) 
   - [Saltstack based deployment](linux-install-with-saltack.md)
   - [Manual deployment](linux-install-manually.md) (uses a local script) 
   - [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
   - [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/quickstart-onboard-machines)
   - [Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md)

3. Configure your capabilities. See [Configure security settings in Microsoft Defender for Endpoint on Linux](linux-preferences.md).

## Run a detection test to verify onboarding

After onboarding the device, you can choose to run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Defender for Endpoint device](run-detection-test.md).

> [!NOTE]
> Running Microsoft Defender Antivirus isn't required but it's recommended. If another antivirus vendor product is the primary endpoint protection solution, you can run Defender Antivirus in Passive mode. You can only confirm that passive mode is on after verifying that Defender for Endpoint sensor (SENSE) is running.

1. On Windows Server devices that should have Microsoft Defender Antivirus installed in active mode, run the following command:

   ```cmd
   sc.exe query Windefend
   ```

   If the result is, "The specified service doesn't exist as an installed service," then you need to install Microsoft Defender Antivirus.

2. Run the following command to verify that Defender for Endpoint is running:

   ```cmd
   sc.exe query sense
   ```

   The result should show it's running. If you encounter issues with onboarding, see [Troubleshoot onboarding](troubleshoot-onboarding.md).

## Offboard Windows servers

You can offboard Windows servers by using the same methods that are available for Windows client devices:

- [Offboard devices using Configuration Manager](configure-endpoints-sccm.md#offboard-devices-using-configuration-manager)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)
- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)

After offboarding, you can proceed to uninstall the unified solution package on Windows Server 2016 and Windows Server 2012 R2. For previous versions of Windows Server, you have two options to offboard Windows servers from the service:

- Uninstall the MMA agent
- Remove the Defender for Endpoint workspace configuration

> [!NOTE]
> These offboarding instructions for other Windows Server versions also apply if you're running the previous Defender for Endpoint for Windows Server 2016 and Windows Server 2012 R2 that requires the MMA. Instructions to migrate to the new unified solution are at [Server migration scenarios in Defender for Endpoint](server-migration.md).

## Next steps

- [Configure capabilities](onboard-configure.md#configure-capabilities) 
- [View the device inventory](machines-view-overview.md)

## See also

- [Onboard Windows and Mac client devices to Microsoft Defender for Endpoint](onboard-client.md)
- [Configure proxy and Internet connectivity settings](configure-proxy-internet.md)
- [Run a detection test on a newly onboarded Defender for Endpoint device](run-detection-test.md)
- [Troubleshooting Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)
- [Troubleshoot onboarding issues related to Security Management for Defender for Endpoint](troubleshoot-security-config-mgt.md#troubleshoot-onboarding-issues-related-to-security-management-for-microsoft-defender-for-endpoint)
- [Microsoft Defender for Endpoint - Mobile Threat Defense](mtd.md) (for iOS and Android devices)
