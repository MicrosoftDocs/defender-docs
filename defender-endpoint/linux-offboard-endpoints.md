---
title: Offboard Microsoft Defender for Endpoint on Linux
description: Describes how to offboard Linux servers from Microsoft Defender for Endpoint and optionally uninstall the agent.
ms.service: defender-endpoint
ms.subservice: linux
ms.topic: article
author: paulinbar
ms.author: painbar
ms.reviewer: gopkr, pahuijbr, megphapriya
manager: bagol
audience: ITPro
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
search.appverid: met150
ms.date: 03/23/2026
---

# Offboard or uninstall Microsoft Defender for Endpoint on Linux

This article explains the difference between offboarding and unstalling Microsoft Defender for Endpoint on a Linux device. In addition, it shows how to perform these operations, and provides guidance about how to choose between offboarding and unstalling. to offboard and when to uninstall.

 a Linux device Microsoft Defender and uninstalling the Defender application from the Linux device. how to offboard and uninstall Microsoft Defender for Endpoint from a Linux server.

There are important differences between offboarding and uninstalling Microsoft Defender for Endpoint on Linux. Review the following descriptions and choose the option that best fits your scenario.

- **Offboarding**

    Use offboarding when you want to temporarily stop Defender from communicating with the Defender service while keeping the Defender application installed on the Linux server. This option is recommended if you plan to reenable Defender later without reinstalling the agent. For example, you might want to offboard if you need to troubleshoot an issue with the Defender application or if you want to temporarily stop Defender while performing maintenance on the server.

- **Uninstalling**

   Uninstall when you want to completely remove the Defender application from the Linux server, for example, when changing the installation ring (Prod/Insider Slow/Insider Fast), or when you no longer plan to use Microsoft Defender on the device.

After a device has been successfully offboarded, the Defender application behaves as follows:

- The Defender application stops sending telemetry (such as alerts and vulnerabilities) to the Microsoft Defender portal.
- The Defender application becomes unlicensed and nonfunctional.
- Security policies applied through Microsoft Defender are removed.

You can verify the offboarding state by running the following command:

```bash
mdatp health --field health_issues
```
Expected output
```console
ATTENTION: No license found. Contact your administrator for help. ["missing license"]
```

The Defender application remains installed on the device unless it's manually uninstalled.

 ## Offboarding steps

Short overview Two methods are available to offboard a Linux server from Microsoft Defender for Endpoint: Offboard using a script or offboard using an offboarding JSON file. Both methods achieve the same result, so you can choose the one that best fits your scenario.

### Offboard using a script 

1. Go to the Microsoft Defender portal (https://security.microsoft.com), and sign in.

1. In the navigation pane, choose **Settings** > **Endpoints**, and then, under **Device management**, choose **Offboarding**.
1. Select **Linux Server** as the operating system, and then in the **Deployment method** section, choose **Local script**.
1. Select **Download package** and then select **Download**. The zipped folder that is downloaded is named *WindowsDefenderATPOffboardingPackage_valid_until_YYYY-MM-DD.zip* (where YYYY-MM-DD is the expiry date of the package).
1. On your Linux Server, extract the contents of the ZIP file to a local directory.
1. Open a terminal, and navigate to the directory where the *MicrosoftDefenderATPOffboardingLinuxServer_valid_until_YYYY-MM-DD* file is located.
1. Type `sudo python3 MicrosoftDefenderATPOffboardingLinuxServer_valid_until_YYYY-MM-DD.py` in the terminal. This runs the offboarding script, which offboards the device from Microsoft Defender for Endpoint.

### Offboard using an offboarding json file  

> [!NOTE]
This method can be performed either manually or automatically using your preferred Linux configuration management tool.

1. Go to the Microsoft Defender portal (https://security.microsoft.com), and sign in.
1. In the navigation pane, choose **Settings** > **Endpoints**, and then, under **Device management**, choose **Offboarding**.
1. Select **Linux Server** as the operating system, and then in the **Deployment method** section, choose **Your preferred Linux configuration management tool**.
1. Select **Download package** and then select **Download**. The zipped folder is named *WindowsDefenderATPOffboardingPackage_valid_until_YYYY-MM-DD.zip* (where YYYY-MM-DD is the expiry date of the package).  
1. Extract the contents of the ZIP file and locate the *mdatp_offboard.json* file.
1. Copy *mdatp_offboard.json* to the following location on the Linux server: `/etc/opt/microsoft/mdatp/mdatp_offboard.json`
 
## Uninstall Defender application

Two methods are available to uninstall the Defender application from a Linux server: Uninstall using the Defender deployment tool (Recommended) or manual uninstallation. Both methods achieve the same result, so you can choose the one that best fits your scenario.

### Uninstall using Defender deployment tool (Recommended) 

This is the recommended method, as it allows you to uninstall the Defender application in a single step.

1. Go to the Microsoft Defender portal → Settings → Endpoints → Device Management → Onboarding.
1. Select **Linux** as the operating system.
1. Go to Defender deployment tool as the deployment method and select **Download package** (a ZIP file is downloaded).
1. Extract the package and run the following command. This removes the Defender application and cleans up the repository: 

   ```bash
   ./defender_deployment_tool.sh --remove --clean 
   ```

### Manual uninstallation 
 
To manually remove the Defender application and clean up the repository, run one of the following commands (whichever is appropriate, depending on your Linux distribution):  

Red Hat Enterprise Linux (RHEL) and variants (CentOS and Oracle Linux)
```bash
sudo yum remove mdatp
``` 

SUSE Linux Enterprise Server (SLES) and variants
```bash
sudo zypper remove mdatp
``` 

Ubuntu and Debian
```bash
sudo apt-get purge mdatp
``` 

Mariner 
```bash
sudo dnf remove mdatp
```
## Visibility into offboarded and uninstalled devices on the Defender Portal  

- The offboarded and uninstalled device's status transitions to 'Inactive' after seven days of no telemetry.
- Offboarded and uninstalled devices remain visible in the Defender portal for up to 180 days. For more information, see [Microsoft Defender for Endpoint data storage and privacy](./data-storage-privacy.md).
- Historical data (alerts, timeline, software inventory) remains accessible during the retention period.
- No explicit *Offboarded* or *Uninstalled* label is shown in the portal.  

## Related content

- [Offboard devices from Microsoft Defender for Endpoint](offboard-machines.md)
- [Deploy Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Troubleshoot Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)