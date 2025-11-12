---
title: Onboard Microsoft Defender for Endpoint on Linux devices using the Defender deployment tool
description: Describes how to deploy Microsoft Defender for Endpoint on Linux using the Defender deployment tool.
ms.reviewer: meghapriya
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: install-set-up-deploy
ms.subservice: linux
search.appverid: met150
ms.date: 11/11/2025
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Onboard Microsoft Defender for Endpoint on Linux devices using the Defender deployment tool

The Defender deployment tool provides an efficient, user-friendly onboarding process for Microsoft Defender for Endpoint on Linux devices. It allows users to install and onboard Microsoft Defender for Endpoint using a single package that can be downloaded from the Microsoft Defender portal. This eliminates the need to install Defender using installer script/cli commands and then, separately, to onboard the device using the onboarding package from the portal.

The defender-deployment tool package supports both manual and bulk onboarding through third-party tools such as Chef, Ansible, Puppet, and SaltStack, and consolidates all necessary onboarding related packages and documentation in one location.

## Prerequisites and system requirements

Before you get started, see Prerequisites for Defender - Linux for a description of prerequisites and system requirements. The Defender Deployment Tool enforces the following set of blocking prerequisites checks:

- Memory > 1 GB
- Available disk space > 2GB
- Glibc library version newer than 2.17
- The requested mdatp version should be one of the latest nine versions.

There is also an option to run a connectivity test, which checks if the URLs Defender for Endpoint uses are accessible or not.

Additionally, the following requirements also need to be met:

- Allow the connection to the URL: msdefender.download.prss.microsoft.com
- The endpoint should have either **wget** or **curl** installed.

## Deployment: Step-by-step guide

1. Download the Defender deployment tool from the Defender portal using the following steps.

    1. Go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

    1. In the Step 1 drop-down menu, select **Linux Server (Preview)** as the operating system.

    1. Under **Download and apply onboarding packages or files**, select the **Download package** button.
    
      >[!NOTE]
      >Since this package installs and onboards the agent, it's a tenant specific package and must not be used across tenants.

      :::image type="content" source="./media/linux-install-with-defender-deployment-tool/deployment-tool-download-package.png" alt-text="Screenshot showing the download package button.":::

1. From a command prompt, extract the contents of the archive:

   ```bash
   unzip WindowsDefenderATPOnboardingPackage.zip
   ```

   ```console
   Archive: WindowsDefenderATPOnboardingPackage.zip
   inflating: defender-deployment-tool.sh
   ```

1. Grant executable permissions to the script.

   ```bash
   chmod +x defender-deployment-tool.sh
   ```

1. Run the script using the following command to install and onboard Microsoft Defender for Endpoint on your endpoint.

   ```bash
   sudo bash defender-deployment-tool.sh
   ```

   This command installs the latest agent version from the production channel and onboard the device. It might take 5-20 minutes for the device to show up in the [Device Inventory](https://security.microsoft.com/machines?category=all-devices).

1. You can further modify or control onboarding by passing parameters based on your requirements. Use the option `--help` to see all the available options:

   ```bash
   > ./defender-deployment-tool.sh --help
   ```

   :::image type="content" source="./media/linux-install-with-defender-deployment-tool/deployment-tool-help.png" alt-text="Screenshot showing the help command output.":::

| **Scenario** | **Command** |
|:-------------|:------------|
| Check for unmet blocking prerequisites | No special command required. Blocking prerequisite checks run by default as part of the install scenario<br>`sudo ./defender-deployment-tool.sh` |
| Check for unmet non-blocking prerequisites | `sudo ./defender-deployment-tool.sh --pre-req-non-blocking` |
| Run connectivity test | `sudo ./defender-deployment-tool.sh --connectivity-test` |
| Custom install | `sudo ./defender-deployment-tool.sh --install-path /usr/microsoft/` |
| Example for insider-slow channel | `sudo ./defender-deployment-tool.sh --channel insiders-slow` |
| Install using proxy | `sudo ./defender-deployment-tool.sh --http-proxy <http://username:password@proxy_host:proxy_port>` |
| Install a specific agent version | `sudo ./defender-deployment-tool.sh --mdatp 101.25042.0003 --channel prod` |
| Upgrade to a specific agent version | `sudo ./defender-deployment-tool.sh --upgrade --mdatp 101.24082.0004` |
| Downgrade to a specific agent version | `sudo ./defender-deployment-tool.sh --downgrade --mdatp 101.24082.0004` |
| Uninstall agent | `sudo ./defender-deployment-tool.sh --remove` |
| Only onboard in case agent is already installed | `sudo ./defender-deployment-tool.sh --only-onboard` |
| Offboard the agent | `sudo ./defender-deployment-tool.sh --offboard MicrosoftDefenderATPOffboardingLinuxServer.py`<br>*(Note: The latest offboarding file can be downloaded from the Microsoft Defender Portal)* |

## Verify deployment status

1. In the [Microsoft Defender portal](https://security.microsoft.com/), open the device inventory. It might take 5-20 minutes for the device to show up in the portal.

2. Run an antivirus detection test to verify that the device is properly onboarded and reporting to the service. Perform the following steps on the newly onboarded device:

    1. Ensure that real-time protection is enabled (denoted by a result of true from running the following command):

         ```bash
         mdatp health --field real_time_protection_enabled
         ```
      
         If it isn't enabled, execute the following command:

         ```bash
         mdatp config real-time-protection --value enabled
         ```

    1. Open a Terminal window and execute the following command to run a detection test:

         ```bash
         curl -o /tmp/eicar.com.txt https://secure.eicar.org/eicar.com.txt
         ```

    1. You can run more detection tests on zip files using either of the following commands:

         ```bash
         curl -o /tmp/eicar_com.zip https://secure.eicar.org/eicar_com.zip
         curl -o /tmp/eicarcom2.zip https://secure.eicar.org/eicarcom2.zip
         ```

    1. The files should be quarantined by Defender for Endpoint on Linux. Use the following command to list all the detected threats:
   
         ```bash
         mdatp threat list
         ```

1. Run an EDR detection test and simulate a detection to verify that the device is properly onboarded and reporting to the service. Perform the following steps on the newly onboarded device:

    1. Download and extract the [script file](https://aka.ms/MDE-Linux-EDR-DIY) to an onboarded Linux server.

    1. Grant executable permissions to the script:

         ```bash
         chmod +x mde_linux_edr_diy.sh
         ```

    1. Run the following command:

         ```bash
         ./mde_linux_edr_diy.sh
         ```

    1. After a few minutes, a detection should be raised in the Microsoft Defender XDR.

    1. Check the alert details, machine timeline, and perform your typical investigation steps.

## How to switch between channels

Defender - Linux can be deployed from one of the following channels (denoted as \[channel\]):

- insiders-fast
- insiders-slow
- prod

Each of these channels corresponds to a Linux software repository. The instructions in this document describe configuring your device to use one of these repositories.

The choice of the channel determines the type and frequency of updates that are offered to your device. Devices in insiders-fast are the first to receive updates and new features, followed later by insiders-slow and lastly by prod.

To preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either insiders-fast or insiders-slow.

For example, to change channel from insiders-fast to production, do the following:

1. Remove the insiders-fast channel version of Defender - Linux.

   ```bash
   sudo ./defender-deployment-tool.sh --remove --channel insiders-fast
   ```

2. Delete the Defender for Endpoint on the Linux insiders-fast repo.

   ```bash
   sudo ./defender-deployment-tool.sh --clean --channel insiders-fast
   ```

3. Install Microsoft Defender - Linux using the production channel.

   ```bash
   sudo ./defender-deployment-tool.sh --install --channel prod
   ```

## Check connectivity issues

If you're experiencing any connectivity issues, run this command to perform a connectivity test:

```bash
sudo ./defender-deployment-tool.sh --connectivity-test
```

This test might take some time to run as it performs checks for every URL needed by mdatp and find any issues if present. If the issue persists, refer to the troubleshooting guide.

## Troubleshoot the installation

\[add how the errors will get logged in the local log file. If prereq fails then what will happen.\]

If you experience any installation issues, try following these steps:

1. For information on how to find the log that's generated automatically when an installation error occurs, see [Log installation issues](./linux-resources.md#log-installation-issues).

1. For information about common installation issues, see [Installation issues](./linux-support-install.md).

1. If health of the device is false, see [Defender for Endpoint agent health issues](./health-status.md).

1. For product performance issues, see [Troubleshoot performance issues](./linux-support-perf.md).

1. For proxy and connectivity issues, see [Troubleshoot cloud connectivity issues](./linux-support-connectivity.md).

## Related content

- [Prerequisites for Microsoft Defender for Endpoint on Linux](./mde-linux-prerequisites.md)
- [Use installer script based deployment to deploy Microsoft Defender for Endpoint on Linux](./linux-installer-script.md)
- [Deploy Microsoft Defender for Endpoint on Linux with Ansible](./linux-install-with-ansible.md)
- [Deploy Defender for Endpoint on Linux with Chef](./linux-deploy-defender-for-endpoint-with-chef.md)
- [Deploy Microsoft Defender for Endpoint on Linux with Puppet](./linux-install-with-puppet.md)
- [Deploy Microsoft Defender for Endpoint on Linux manually](./linux-install-manually.md)
- [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint (direct onboarding using Defender for Cloud)](../defender-for-cloud/onboard-machines-with-defender-for-endpoint.md?toc=/defender-endpoint/toc.json&bc=/defender-endpoint/breadcrumb/toc.json)
- [Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP](./mde-linux-deployment-on-sap.md)
- [Enable deployment of Microsoft Defender for Endpoint to a custom location](./linux-custom-location-installation.md)
- [Deploy Microsoft Defender for Endpoint on Linux with Saltstack](./linux-install-with-saltack.md)
- [Deploy Microsoft Defender for Endpoint on Linux using golden images](./linux-deploy-defender-for-endpoint-using-golden-images.md)

[!INCLUDE Microsoft Defender for Endpoint Tech Community]