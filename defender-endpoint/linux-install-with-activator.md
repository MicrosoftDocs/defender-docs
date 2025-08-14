---
title: Activator based deployment for Microsoft Defender for Endpoint on Linux 
description: Describes how to deploy Microsoft Defender for Endpoint on Linux using Activator.
ms.reviewer: dmcwee, gopkr
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: install-set-up-deploy
ms.subservice: linux
search.appverid: met150
ms.date: 08/11/2025
---

# Activator based deployment for Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

## Introduction

This article introduces a new, efficient, and user-friendly onboarding experience for [Microsoft Defender for Endpoint for Linux](./microsoft-defender-endpoint-linux.md). The new onboarding process allows user to install and onboard Microsoft Defender for Endpoint for Linux using a single package, available for download from the [Microsoft Defender Portal](https://security.microsoft.com/). This eliminates the need to download installer script from GitHub and onboarding packages from the portal separately. The package supports both manual and bulk onboarding through third-party tools such as Chef, Ansible, Puppet, and SaltStack. The portal also features an improved user experience, consolidating all necessary onboarding related packages and documentations in one convenient location.

## Prerequisites and system requirements

Before you get started, see [Prerequisites for Defender for Endpoint on Linux](./mde-linux-prerequisites.md) for a description of prerequisites and system requirements. These checks are also performed by the activator script and give you a warning if any of the checks aren't met.

Additionally, the following requirements also need to be met:

- Allow the connection to the URL: `msdefender.download.prss.microsoft.com`

- The endpoint should have either **wget** or **curl** installed.

## Step-by-step guide

1. Download the simplified onboarding package from [Microsoft Defender portal](https://security.microsoft.com/) by following these steps.

    1. Go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

    1. In the first drop-down menu, select **Linux Server(Preview)** as the operating system.

    1. Select the **Download Package** button under **Download and run the activator**.

        > [!NOTE]
        > Since this package installs and onboards the agent, it's a tenant specific package and must not be used across tenants.

    :::image type="content" source="./media/linux-install-with-activator/activator-download-package.png" alt-text="Screenshot of Device management onboarding page, showing activator download package":::

1. From a command prompt, extract the contents of the archive:

    ```bash
    unzip WindowsDefenderATPOnboardingPackage.zip
    ```

    ```console
    Archive: WindowsDefenderATPOnboardingPackage.zip
    inflating: mde_linux_activator.sh
    ```

1. Grant executable permissions to the activator script.

    ```bash
    chmod +x mde_linux_activator.sh
    ```

1. Run the script using the following command to install and onboard Microsoft Defender for Endpoint on your Linux Server.

    This command installs the latest agent version from the production channel and onboard the device. It might take 5-20 minutes for the device to show up in the [Device Inventory](https://security.microsoft.com/machines?category=all-devices).

    ```bash
    sudo bash mde_linux_activator.sh
    ```

5. You can further modify/control onboarding by passing parameters based on your requirements. Check help for all the available options:

    ```bash
    ./mde_linux_activator.sh --help
    ```

    :::image type="content" source="./media/linux-install-with-activator/activator-help.png" alt-text="Screenshot showing the activator help options":::

    | **Scenario**                                   | **Command**                                                                                                                                                                                                                       |
    |------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Install using proxy                            | `sudo ./mde_linux_activator.sh --http-proxy <http://username:password@proxy_host:proxy_port>`                                                                                                                                     |
    | Install a specific agent version               | `sudo ./mde_linux_activator.sh --mdatp 101.25042.0003 --channel prod`                                                                                                                                                             |
    | Upgrade to the latest agent version            | `sudo ./mde_linux_activator.sh --upgrade`                                                                                                                                                                                         |
    | Upgrade to a specific agent version            | `sudo ./mde_linux_activator.sh --upgrade --mdatp 101.24082.0004`                                                                                                                                                                 |
    | Downgrade to a specific agent version          | `sudo ./mde_linux_activator.sh --downgrade --mdatp 101.24082.0004`                                                                                                                                                               |
    | Uninstall agent                               | `sudo ./mde_linux_activator.sh --remove`                                                                                                                                                                                          |
    | Only onboard in case agent is already installed | `sudo ./mde_linux_activator.sh --only-onboard`                                                                                                                                                                                    |
    | Offboard the agent                             | `sudo ./mde_linux_activator.sh --offboard MicrosoftDefenderATPOffboardingLinuxServer.py`<br>*(Note: The latest offboarding file can be downloaded from the [Microsoft Defender Portal](https://security.microsoft.com/))*           |

## Verify Deployment Status

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
      curl -o /tmp/eicar.com.txt
      https://secure.eicar.org/eicar.com.txt
      ```

   1. You can run more detection tests on zip files using either of the following commands:

      ```bash
      curl -o /tmp/eicar_com.zip
      https://secure.eicar.org/eicar_com.zip
      curl -o /tmp/eicarcom2.zip
      https://secure.eicar.org/eicarcom2.zip
      ```

   1. The files should be quarantined by Defender for Endpoint on Linux. Use the following command to list all the detected threats:

      ```bash
      mdatp threat list
      ```

1. Run an EDR detection test and simulate a detection to verify that the device is properly onboarded and reporting to the service. Perform the following steps on the newly onboarded device:

   1. Download and extract the [script file](https://aka.ms/MDE-Linux-EDR-DIY) to an onboarded Linux server.

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

Defender for Endpoint on Linux can be deployed from one of the following
channels (denoted as [channel]):

- insiders-fast

- insiders-slow

- prod

Each of these channels corresponds to a Linux software repository. The instructions in this document describe configuring your device to use one of these repositories.

The choice of the channel determines the type and frequency of updates that are offered to your device. Devices in insiders-fast are the first to receive updates and new features, followed later by insiders-slow and lastly by prod.

To preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either insiders-fast or insiders-slow.

For example, to change channel from insiders-fast to production, do the following:

1. Remove the insiders-fast channel version of Defender for Endpoint on Linux.

   ```bash
   sudo ./mde_linux_activator.sh --remove --channel insiders-fast
   ```

1. Delete the Defender for Endpoint on the Linux insiders-fast repo.

   ```bash
   sudo ./mde_linux_activator.sh --clean --channel insiders-fast
   ```

1. Microsoft Defender for Endpoint on Linux using the production channel.

   ```bash
   sudo ./mde_linux_activator.sh --install --channel insiders-fast
   ```

## Check Connectivity Issues

If you're experiencing any connectivity issues, run this command to
perform a connectivity test:

```bash
sudo ./mde_linux_activator.sh --connectivity-test
```

This test might take some time to run as it performs checks for every
URL needed by mdatp and find any issues if present. If the issue
persists, refer to the troubleshooting guide.

## Troubleshooting installation issues

If you experience any installation issues, try following these steps:

1.  For information on how to find the log that's generated automatically when an installation error occurs, see [Log installation issues](./linux-resources.md#log-installation-issues).

1. For information about common installation issues, see [Installation issues](./linux-support-install.md).

1. If health of the device is false, see [Defender for Endpoint agent health issues](./health-status.md).

1. For product performance issues, see [Troubleshoot performance issues](./linux-support-perf.md).

1. For proxy and connectivity issues, see [Troubleshoot cloud connectivity issues](./linux-support-connectivity.md).

## Related content

- [SALT Project documentation](https://docs.saltproject.io/en/latest/topics/about_salt_project.html)
- [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md)
- [Use installer script based deployment to deploy Defender for Endpoint on Linux](linux-installer-script.md) 
- [Deploy Defender for Endpoint on Linux with Ansible](linux-install-with-ansible.md)
- [Deploy Defender for Endpoint on Linux with Chef](linux-deploy-defender-for-endpoint-with-chef.md)
- [Deploy Defender for Endpoint on Linux with Puppet](linux-install-with-puppet.md)
- [Deploy Defender for Endpoint on Linux manually](linux-install-manually.md)
- [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint) (direct onboarding using Defender for Cloud)
- [Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md)
- [!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
