---
title: Deploy Microsoft Defender endpoint security to Linux devices using the Defender deployment tool (preview)
description: Describes how to deploy Microsoft Defender endpoint security on Linux using the Defender deployment tool.
ms.reviewer: meghapriya
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: install-set-up-deploy
ms.subservice: linux
ms.date: 02/26/2026
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Deploy Microsoft Defender endpoint security to Linux devices using the Defender deployment tool (preview)

The Defender deployment tool provides an efficient, user-friendly onboarding process for Microsoft Defender for Endpoint on Linux devices. It allows users to install and onboard Microsoft Defender for Endpoint using a single package that can be downloaded from the Microsoft Defender portal. This eliminates the need to install Defender using installer script/cli commands and then, separately, to onboard the device using the onboarding package from the portal.

The defender-deployment tool supports both manual and bulk onboarding through third-party tools such as Chef, Ansible, Puppet, and SaltStack. The tool supports several parameters you can use to customize large scale deployments, making it possible to have tailored installations across diverse environments. 

## Prerequisites and system requirements

Before you get started, see [Prerequisites for Microsoft Defender for Endpoint on Linux](./mde-linux-prerequisites.md) for a description of prerequisites and system requirements. Additionally, the following requirements also need to be met:

- Allow connection to the URL: `msdefender.download.prss.microsoft.com`. Before you begin deployment, make sure to run the [connectivity test](#check-connectivity-issues), which checks if the URLs Defender for Endpoint uses are accessible or not.
- The endpoint must have either **wget** or **curl** installed.

The deployment tool enforces the following set of prerequisites checks, which if not met will abort the deployment process:

- Device memory: Greater than 1 GB
- Available disk space on the device: Greater than 2GB
- Glibc library version on the device: Newer than 2.17
- mdatp version on the device: Must be a supported version and not expired. To check product expiration date, run the command `-mdatp health`.

> [!TIP]
> Before running the deployment tool to onboard Defender onto your Linux server, it's recommended to run the tool with the `--pre-req` option to help identify and fix any potential issues that might impact the deployment.

## Deployment: Step-by-step guide

1. Download the Defender deployment tool from the Defender portal using the following steps.

    1. Go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

    1. In the Step 1 drop-down menu, select **Linux Server (Preview)** as the operating system.

    1. Under **Download and apply onboarding packages or files**, select the **Download package** button.
    
      >[!NOTE]
      >Since this package installs and onboards the agent, it's a tenant specific package and must not be used across tenants.

      :::image type="content" source="./media/linux-install-with-defender-deployment-tool/deployment-tool-download-package.png" alt-text="Screenshot showing the download package button." lightbox="./media/linux-install-with-defender-deployment-tool/deployment-tool-download-package.png":::

1. From a command prompt, extract the contents of the archive:

   ```bash
   unzip GatewayLinuxDefenderDeploymentTool.zip
   ```

   ```console
   Archive: GatewayLinuxDefenderDeploymentTool.zip
   inflating: defender_deployment_tool.sh
   ```

1. Grant executable permissions to the script.

   ```bash
   chmod +x defender_deployment_tool.sh
   ```

1. Run the script using the following command to install and onboard Microsoft Defender for Endpoint on your endpoint.

   ```bash
   sudo bash defender_deployment_tool.sh
   ```

   This command installs the latest agent version from the production channel and onboards the device to Defender portal. It might take 5-20 minutes for the device to show up in the [Device Inventory](https://security.microsoft.com/machines?category=all-devices).

   > [!NOTE]
   > If you have set up a system-wide proxy to redirect Defender for Endpoint traffic, make sure you configure the proxy using the Defender deployment tool as well. Refer to the command-line help (--help) for available proxy options.

1. You can further customize deployment by passing parameters to the tool based on your requirements. Use the option `--help` to see all the available options:

   ```bash
    ./defender_deployment_tool.sh --help
   ```

   :::image type="content" source="./media/linux-install-with-defender-deployment-tool/deployment-tool-help.png" alt-text="Screenshot showing the help command output." lightbox="./media/linux-install-with-defender-deployment-tool/deployment-tool-help.png":::

   The following table provides examples of commands for useful scenarios.
    
   | **Scenario** | **Command** |
   |:-------------|:------------|
   | Check for unmet non-blocking prerequisites | `sudo ./defender_deployment_tool.sh --pre-req-non-blocking` |
   | Run the connectivity test | `sudo ./defender_deployment_tool.sh --connectivity-test` |
   | Deploy to a custom location | `sudo ./defender_deployment_tool.sh --install-path /usr/microsoft/` |
   | Deploy from the insider-slow channel | `sudo ./defender_deployment_tool.sh --channel insiders-slow` |
   | Deploy using a proxy | `sudo ./defender_deployment_tool.sh --http-proxy <http://username:password@proxy_host:proxy_port>` |
   | Deploy a specific agent version | `sudo ./defender_deployment_tool.sh --mdatp 101.25042.0003 --channel prod` |
   | Upgrade to a specific agent version | `sudo ./defender_deployment_tool.sh --upgrade --mdatp 101.24082.0004` |
   | Downgrade to a specific agent version | `sudo ./defender_deployment_tool.sh --downgrade --mdatp 101.24082.0004` |
   | Uninstall Defender | `sudo ./defender_deployment_tool.sh --remove` For more information, see [Offboard or uninstall Microsoft Defender for Endpoint on Linux](linux-off-board-endpoints.md) |
   | Only onboard if Defender is already installed | `sudo ./defender_deployment_tool.sh --only-onboard` |
   | <a name="ddt-offboard-switch-linux">Offboard Defender</a> | `sudo ./defender_deployment_tool.sh --offboard MicrosoftDefenderATPOffboardingLinuxServer.py`<br>*(Note: Before using the --offboard option, you must first download the latest offboarding file from the Defender portal at System > Settings > Endpoints > Offboarding). For other methods of offboarding, see [Offboard or uninstall Microsoft Defender for Endpoint on Linux](linux-off-board-endpoints.md).* |

## Verify deployment status

1. In the [Microsoft Defender portal](https://security.microsoft.com/), open the device inventory. It might take 5-20 minutes for the device to show up in the portal.

1. Run an antivirus detection test to verify that the device is properly onboarded and reporting to the service. Perform the following steps on the newly onboarded device:

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

## Check connectivity issues

If you're experiencing any connectivity issues, run this command to perform a connectivity test:

```bash
sudo ./defender_deployment_tool.sh --connectivity-test
```

This test might take some time to run as it performs checks for every URL needed by mdatp and find any issues if present. If the issue persists, refer to the troubleshooting guide.

## Troubleshoot the installation

Whenever you run the Defender deployment tool, the activity gets logged in this file:

`/tmp/defender_deployment_tool.log`

If you experience any installation issues, first check the log file. If that doesn't help you resolve the issue, try following these steps:

1. For information on how to find the log that's generated automatically when an installation error occurs, see [Log installation issues](./linux-resources.md#log-installation-issues).

1. For information about common installation issues, see [Installation issues](./linux-support-install.md).

1. If health of the device is false, see [Defender for Endpoint agent health issues](./health-status.md).

1. For product performance issues, see [Troubleshoot performance issues](./linux-support-perf.md).

1. For proxy and connectivity issues, see [Troubleshoot cloud connectivity issues](./linux-support-connectivity.md).

## How to switch between channels after you have deployed from a channel

Defender for Endpoint on Linux can be deployed from one of the following channels:

- insiders-fast
- insiders-slow
- prod (production)

Each of these channels corresponds to a Linux software repository. The channel determines the type and frequency of updates that are offered to your device. Devices in insiders-fast are the first to receive updates and new features, followed later by insiders-slow and lastly by prod.

By default, the deployment tool configures your device to use the prod channel. You can use the configuration options described in this document to deploy from a different channel.

To preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either insiders-fast or insiders-slow. If you've already deployed Defender for Endpoint on Linux from a channel and want to switch to a different channel (from prod to insiders-fast, for example), you must first remove the current channel, then delete the current channel repo, and then finally install Defender from the new channel, as illustrated in the following example, where the channel is changed from insiders-fast to prod:

1. Remove the insiders-fast channel version of Defender for Endpoint on Linux..

   ```bash
   sudo ./defender_deployment_tool.sh --remove --channel insiders-fast
   ```

1. Delete the Defender for Endpoint on the Linux insiders-fast repo.

   ```bash
   sudo ./defender_deployment_tool.sh --clean --channel insiders-fast
   ```

1. Install Microsoft Defender for Endpoint on Linux using the production channel.

   ```bash
   sudo ./defender_deployment_tool.sh --channel prod
   ```

## Related content

- [Prerequisites for Microsoft Defender for Endpoint on Linux](./mde-linux-prerequisites.md)
- [Enable deployment of Microsoft Defender for Endpoint to a custom location](./linux-custom-location-installation.md)
- [Use installer script based deployment to deploy Microsoft Defender for Endpoint on Linux](./linux-installer-script.md)
- [Deploy Microsoft Defender for Endpoint on Linux with Ansible](./linux-install-with-ansible.md)
- [Deploy Defender for Endpoint on Linux with Chef](./linux-deploy-defender-for-endpoint-with-chef.md)
- [Deploy Microsoft Defender for Endpoint on Linux with Puppet](./linux-install-with-puppet.md)
- [Deploy Microsoft Defender for Endpoint on Linux with Saltstack](./linux-install-with-saltack.md)
- [Deploy Microsoft Defender for Endpoint on Linux manually](./linux-install-manually.md)
- [Deploy Microsoft Defender for Endpoint on Linux using golden images](./linux-deploy-defender-for-endpoint-using-golden-images.md)
- [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint (direct onboarding using Defender for Cloud)](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint?toc=/defender-endpoint/toc.json&bc=/defender-endpoint/breadcrumb/toc.json)
- [Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP](./mde-linux-deployment-on-sap.md)
