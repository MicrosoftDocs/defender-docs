---
title: Onboard Windows Server 2012 R2 or Windows Server 2016 to Microsoft Defender for Endpoint
description: Learn how to onboard Windows Server 2012 R2 and Windows Server 2016 to Defender for Endpoint.
search.appverid: met150
ms.service: defender-endpoint
author: denisebmsft
ms.author: deniseb
ms.reviewer: pahuijbr
ms.localizationpriority: medium
ms.date: 04/04/2025
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
---

# Onboard Windows Server 2012 R2 and Windows Server 2016 to Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Defender for Endpoint extends support to also include the Windows Server operating system. This support provides advanced attack detection and investigation capabilities seamlessly through the Microsoft Defender portal. Support for Windows Server provides deeper insight into server activities, coverage for kernel and memory attack detection, and enables response actions.

> [!NOTE]
> To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:
> 
> - [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) (as part of the Defender for Cloud) offering
> - Microsoft Defender for Endpoint for servers
> - [Microsoft Defender for Business servers](/defender-business/get-defender-business#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

This article describes how to onboard Windows Server 2012 R2 and Windows Server 2016 to Defender for Endpoint.

- For Windows Server, version 1803, Windows Server 2019, and later, see [Onboard Windows Server 2019 and later to Defender for Endpoint](onboard-windows-server.md).
- For guidance on how to download and use Windows Security Baselines for Windows servers, see [Windows Security Baselines](/windows/device-security/windows-security-baselines).

[!INCLUDE [MDE automated setup guide](../includes/security-analyzer-setup-guide.md)]

## Prerequisites for Windows Server 2016 and Windows Server 2012 R2

- It's recommended to install the latest available Servicing Stack Update (SSU) and Least Cumulative Update (LCU) on the server.
- The SSU from September 14, 2021 or later must be installed.
- The LCU from September 20, 2018 or later must be installed.  
- Enable the Microsoft Defender Antivirus feature and ensure it's up to date. For more information on enabling Defender Antivirus on Windows Server, see [Re-enable Defender Antivirus on Windows Server if it was disabled](enable-update-mdav-to-latest-ws.md#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-disabled) and [Re-enable Defender Antivirus on Windows Server if it was uninstalled](enable-update-mdav-to-latest-ws.md#re-enable-microsoft-defender-antivirus-on-windows-server-if-it-was-uninstalled).
- Download and install the latest platform version using Windows Update. Alternatively, download the update package manually from the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623) or from [MMPC](https://go.microsoft.com/fwlink/?linkid=870379&arch=x64).
- On Windows Server 2016, Microsoft Defender Antivirus must be installed as a feature and fully updated before installation. See [information for Windows Server 2012 R2 and Windows Server 2016](switch-to-mde-phase-2.md#are-you-using-windows-server-2012-r2-or-windows-server-2016).

## Onboarding Windows Server 2016 and Windows Server 2012 R2

The following diagram shows the general steps required to successfully onboard servers.

:::image type="content" source="media/server-onboarding-tools-methods.png" alt-text="An illustration of onboarding flow for Windows Servers and Windows 10 devices.":::

1. Download the installation package and onboarding package by following these steps:

   1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Onboarding**.
   2. **Windows Server 2016 and Windows Server 2012 R2**.
   3. Select **Download installation package** and save it on the device. The installation package contains an MSI file that installs the Defender for Endpoint agent.
   4. Select **Download onboarding package** and save the zipped folder on the device. The onboarding package contains `WindowsDefenderATPOnboardingScript.cmd`, which contains the onboarding script.

2. Follow the guidance for your preferred tool to install Defender for Endpoint:

   - **Migrate from MMA to the modern unified solution**: [Migrating servers from Microsoft Monitoring Agent to the modern unified solution](server-migration.md)
   - **Local script**: [Onboard Windows devices using a local script](configure-endpoints-script.md)
   - **Group Policy**:  [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
   - **Microsoft Configuration Manager**: [Onboard Windows devices using Configuration Manager](configure-endpoints-sccm.md)
   - **VDI scripts**: [Onboard non-persistent virtual desktop infrastructure (VDI) devices in Microsoft Defender XDR](configure-endpoints-vdi.md)
   - **Direct onboarding with Defender for Cloud**: [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
  
For Windows Server, version 1803 or Windows Server 2019 and later, see [Onboard Windows Server, version 1803, Windows Server 2019, and Windows Server 2025 to the Microsoft Defender for Endpoint service](onboard-windows-server.md).

> [!NOTE]
> Windows Hyper-V Server editions aren't supported.

## Functionality in the modern unified solution

The previous implementation (before April of 2022) of onboarding Windows Server 2016 and Windows Server 2012 R2 required the use of Microsoft Monitoring Agent (MMA). The modern, unified solution package makes it easier to onboard servers by removing dependencies and installation steps. It also provides a much expanded feature set. For more information, see the following resources:

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

- An operating system update can introduce an installation issue on machines with slower disks due to a time out with service installation. Installation fails with the message "Couldn't find c:\program files\windows defender\mpasdesc.dll, - 310 WinDefend". Use the latest installation package, and the latest [install.ps1](https://github.com/microsoft/mdefordownlevelserver) script to help clear the failed installation if necessary.

- The user interface on Windows Server 2016 and Windows Server 2012 R2 only allows for basic operations. To perform operations on a device locally, refer to [Manage Defender for Endpoint with PowerShell, WMI, and MPCmdRun.exe](preferences-setup.md). As a result, features that specifically rely on user interaction, such as where the user is prompted to make a decision or perform a specific task, may not work as expected. It's recommended to disable or not enable the user interface nor require user interaction on any managed server as it may impact protection capability.

- Not all attack surface reduction rules are applicable to all operating systems. See [Attack surface reduction rules](attack-surface-reduction-rules-reference.md).

- Operating system upgrades aren't supported. Offboard then uninstall before upgrading. The installer package can only be used to upgrade installations that haven't yet been updated with new antimalware platform or EDR sensor update packages.

- To automatically, deploy and onboard the new solution using Microsoft Endpoint Configuration Manager (MECM) you need to be on [version 2207 or later](/mem/configmgr/core/plan-design/changes/whats-new-in-version-2207#improved-microsoft-defender-for-endpoint-mde-onboarding-for-windows-server-2012-r2-and-windows-server-2016). You can still configure and deploy using version 2107 with the hotfix rollup, but this requires extra deployment steps. See [Microsoft Endpoint Configuration Manager migration scenarios](server-migration.md#microsoft-endpoint-configuration-manager-migration-scenarios) for more information.

## Important information about running Defender for Endpoint with non-Microsoft security solutions

If you intend to use a non-Microsoft anti-malware solution, you need to run Microsoft Defender Antivirus in passive mode. You must remember to set to passive mode during the installation and onboarding process.

> [!NOTE]
> If you're installing Defender for Endpoint on servers with McAfee Endpoint Security (ENS) or VirusScan Enterprise (VSE), the version of the McAfee platform might need to be updated to ensure Microsoft Defender Antivirus isn't removed or disabled. For more information including the specific version numbers required, see [McAfee Knowledge Center article](https://kcm.trellix.com/corporate/index?page=content&id=KB88214).

## Update packages for Windows Server 2016 or Windows Server 2012 R2

To receive regular product improvements and fixes for the Defender for Endpoint component, ensure Windows Update [KB5005292](https://go.microsoft.com/fwlink/?linkid=2168277) gets applied or approved. In addition, to keep protection components updated, see [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md#platform-and-engine-releases).

If you're using Windows Server Update Services (WSUS) and/or [Microsoft Endpoint Configuration Manager](/mem/configmgr/core/understand/introduction), this new "Microsoft Defender for Endpoint update for EDR Sensor" is available under the category "Microsoft Defender for Endpoint."

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

   If the result is, "The specified service doesn't exist as an installed service," then you need to install Microsoft Defender Antivirus.

2. Run the following command to verify that Defender for Endpoint is running:

   ```cmd
   sc.exe query sense
   ```

   The result should show it's running. If you encounter issues with onboarding, see [Troubleshoot onboarding](troubleshoot-onboarding.md).

## Next steps

After successfully onboarding devices to the service, you'll need to configure the individual components of Defender for Endpoint. Follow [Configure capabilities](onboard-configure.md#configure-capabilities) to be guided on enabling the various components.

## Offboard Windows servers

You can offboard Windows Server 2012 R2, Windows Server 2016, Windows Server (SAC), Windows Server 2019, Windows Server 2019 Core edition, Windows Server 2022, and Windows Server 2025 using the same method available for Windows 10 client devices.

- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using Configuration Manager](configure-endpoints-sccm.md#offboard-devices-using-configuration-manager)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)
- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)

After offboarding, you can proceed to uninstall the unified solution package on Windows Server 2016 and Windows Server 2012 R2. For other Windows server versions, you have two options to offboard Windows servers from the service:

- Uninstall the MMA agent
- Remove the Defender for Endpoint workspace configuration

> [!NOTE]
> These offboarding instructions for other Windows Server versions also apply if you're running the previous Defender for Endpoint for Windows Server 2016 and Windows Server 2012 R2 that requires the MMA. Instructions to migrate to the new unified solution are at [Server migration scenarios in Defender for Endpoint](server-migration.md).

## Related articles

- [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)
- [Onboard Windows and Mac client devices to Microsoft Defender for Endpoint](onboard-client.md)
- [Configure proxy and Internet connectivity settings](configure-proxy-internet.md)
- [Run a detection test on a newly onboarded Defender for Endpoint device](run-detection-test.md)
- [Troubleshooting Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)
- [Troubleshoot onboarding issues related to Security Management for Defender for Endpoint](troubleshoot-security-config-mgt.md#troubleshoot-onboarding-issues-related-to-security-management-for-microsoft-defender-for-endpoint)

[!INCLUDE [Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
