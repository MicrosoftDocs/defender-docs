---
title: Deploy Microsoft Defender for Endpoint on Linux manually
description: Describes how to deploy Microsoft Defender for Endpoint on Linux manually from the command line.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.reviewer: gopkr
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 02/11/2025
---

# Deploy Microsoft Defender for Endpoint on Linux manually

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

> [!TIP]
> Looking for advanced guidance on deploying Microsoft Defender for Endpoint on Linux? See [Advanced deployment guide on Defender for Endpoint on Linux](comprehensive-guidance-on-linux-deployment.md).

This article describes how to deploy Microsoft Defender for Endpoint on Linux manually. 

## Prerequisites and system requirements

Before you get started, see [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) for a description of prerequisites and system requirements for the current software version.

> [!WARNING]
> Upgrading your operating system to a new major version after the product installation requires the product to be reinstalled. You need to [Uninstall](linux-resources.md#uninstall-defender-for-endpoint-on-linux) the existing Defender for Endpoint on Linux, upgrade the operating system, and then reconfigure Defender for Endpoint on Linux following the below steps.

## Configure the Linux software repository

Defender for Endpoint on Linux can be deployed from one of the following channels (denoted as *[channel]*): *insiders-fast*, *insiders-slow*, or `prod`. Each of these channels corresponds to a Linux software repository. The instructions in this article describe configuring your device to use one of these repositories.

The choice of the channel determines the type and frequency of updates that are offered to your device. Devices in *insiders-fast* are the first ones to receive updates and new features, followed later by *insiders-slow* and lastly by `prod`.

In order to preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either *insiders-fast* or *insiders-slow*.

> [!WARNING]
> Switching the channel after the initial installation requires the product to be reinstalled. To switch the product channel: uninstall the existing package, reconfigure your device to use the new channel, and follow the steps in this document to install the package from the new location.

## Application installation

### RHEL and variants (CentOS, Fedora, Oracle Linux, Amazon Linux 2, Rocky, and Alma)

```bash
sudo yum install mdatp
```

> [!NOTE]
> If you have multiple Microsoft repositories configured on your device, you can be specific about which repository to install the package from. The following example shows how to install the package from the `production` channel if you also have the `insiders-fast` repository channel configured on this device. This situation can happen if you're using multiple Microsoft products on your device. Depending on the distribution and the version of your server, the repository alias might be different than the one in the following example.

```bash
# list all repositories
yum repolist
```

```console
...
packages-microsoft-com-prod               packages-microsoft-com-prod        316
packages-microsoft-com-prod-insiders-fast packages-microsoft-com-prod-ins      2
...
```

```bash
# install the package from the production repository
sudo yum --enablerepo=packages-microsoft-com-prod install mdatp
```

### SLES and variants

```bash
sudo zypper install mdatp
```

> [!NOTE]
> If you have multiple Microsoft repositories configured on your device, you can be specific about which repository to install the package from. The following example shows how to install the package from the `production` channel if you also have the `insiders-fast` repository channel configured on this device. This situation can happen if you're using multiple Microsoft products on your device.

```bash
zypper repos
```

```console
...
#  | Alias | Name | ...
XX | packages-microsoft-com-insiders-fast | microsoft-insiders-fast | ...
XX | packages-microsoft-com-prod | microsoft-prod | ...
...
```

```bash
sudo zypper install packages-microsoft-com-prod:mdatp
```

### Ubuntu and Debian systems

```bash
sudo apt-get install mdatp
```

> [!NOTE]
> If you have multiple Microsoft repositories configured on your device, you can be specific about which repository to install the package from. The following example shows how to install the package from the `production` channel if you also have the `insiders-fast` repository channel configured on this device. This situation can happen if you're using multiple Microsoft products on your device.

```bash
cat /etc/apt/sources.list.d/*
```

```console
deb [arch=arm64,armhf,amd64] https://packages.microsoft.com/config/ubuntu/18.04/prod insiders-fast main
deb [arch=amd64] https://packages.microsoft.com/config/ubuntu/18.04/prod bionic main
```

```bash
sudo apt -t bionic install mdatp
```

> [!NOTE]
> Reboots are NOT required after installing or updating Microsoft Defender for Endpoint on Linux except when you're running auditD in immutable mode.

### Mariner

```bash
sudo dnf install mdatp
```

> [!NOTE]
> If you have multiple Microsoft repositories configured on your device, you can be specific about which repository to install the package from. The following example shows how to install the package from the `production` channel if you also have the `insiders-slow` repository channel configured on this device. This situation can happen if you're using multiple Microsoft products on your device.

```bash
sudo dnf config-manager --disable mariner-official-extras-preview
sudo dnf config-manager --enable mariner-official-extras
```

## Download the onboarding package

Download the onboarding package from Microsoft Defender portal.

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

> [!IMPORTANT]
> If you miss this step, any command executed shows a warning message indicating that the product is unlicensed. Also the `mdatp health` command returns a value of `false`.

1. In the Microsoft Defender portal, go to **Settings > Endpoints > Device management > Onboarding**.
2. In the first drop-down menu, select **Linux Server** as the operating system. In the second drop-down menu, select **Local Script** as the deployment method.
3. Select **Download onboarding package**. Save the file as WindowsDefenderATPOnboardingPackage.zip.

   :::image type="content" source="media/portal-onboarding-linux.png" alt-text="Downloading an onboarding package in the Microsoft Defender portal":::

4. From a command prompt, verify that you have the file, and extract the contents of the archive:

   ```bash
   ls -l
   ```

   ```console
   total 8
   -rw-r--r-- 1 test  staff  5752 Feb 18 11:22 WindowsDefenderATPOnboardingPackage.zip
   ```

   ```bash
   unzip WindowsDefenderATPOnboardingPackage.zip
   ```

   ```console
   Archive:  WindowsDefenderATPOnboardingPackage.zip
   inflating: MicrosoftDefenderATPOnboardingLinuxServer.py
   ```

## Client configuration

1. Copy MicrosoftDefenderATPOnboardingLinuxServer.py to the target device.

   > [!NOTE]
   > Initially the client device isn't associated with an organization and the *orgId* attribute is blank.

   ```bash
   mdatp health --field org_id
   ```

2. Run MicrosoftDefenderATPOnboardingLinuxServer.py.

   > [!NOTE]
   > To run this command, you must have `python` or `python3` installed on the device depending on the distro and version. If needed, see [Step-by-step Instructions for Installing Python on Linux](https://opensource.com/article/20/4/install-python-linux).

   > [!NOTE]
   > To onboard a device that was previously offboard, you must remove the mdatp_offboard.json file located at /etc/opt/microsoft/mdatp.

   If you're running RHEL 8.x or Ubuntu 20.04 or higher, you need to use `python3`.

   ```bash
   sudo python3 MicrosoftDefenderATPOnboardingLinuxServer.py
   ```

   For the rest of distros and versions, you need to use `python`.

   ```bash
   sudo python MicrosoftDefenderATPOnboardingLinuxServer.py
   ```

3. Verify that the device is now associated with your organization and reports a valid organization identifier:

   ```bash
   mdatp health --field org_id
   ```

4. Check the health status of the product by running the following command. A return value of `true` denotes that the product is functioning as expected:

   ```bash
   mdatp health --field healthy
   ```

   > [!IMPORTANT]
   > When the product starts for the first time, it downloads the latest anti-malware definitions. This process might take up to a few minutes depending on the network connectivity. During this time, the command mentioned earlier returns a value of `false`. You can check the status of the definition update using the following command:
   >
   > `mdatp health --field definitions_status`
   >
   > You might also need to configure a proxy after completing the initial installation. See [Configure Defender for Endpoint on Linux for static proxy discovery: Post-installation configuration](linux-static-proxy-configuration.md#post-installation-configuration).

1. Run an AV detection test to verify that the device is properly onboarded and reporting to the service. Perform the following steps on the newly onboarded device:

   - Ensure that real-time protection is enabled (denoted by a result of `true` from running the following command):

     ```bash
     mdatp health --field real_time_protection_enabled
     ```

     If it isn't enabled, execute the following command:

     ```bash
     mdatp config real-time-protection --value enabled
     ```

   - Open a Terminal window and execute the following command to run a detection test:
   
     ``` bash
     curl -o /tmp/eicar.com.txt https://secure.eicar.org/eicar.com.txt
     ```
     
   - You can run more detection tests on zip files using either of the following commands:
      
      ```bash
      curl -o /tmp/eicar_com.zip https://secure.eicar.org/eicar_com.zip
      curl -o /tmp/eicarcom2.zip https://secure.eicar.org/eicarcom2.zip
      ```
      
   - The files should be quarantined by Defender for Endpoint on Linux. Use the following command to list all the detected threats:
   
     ```bash
     mdatp threat list
     ```
     
1. Run an EDR detection test and simulate a detection to verify that the device is properly onboarded and reporting to the service. Perform the following steps on the newly onboarded device:

   - Verify that the onboarded Linux server appears in Microsoft Defender XDR. If this is the first onboarding of the machine, it can take up to 20 minutes until it appears.

   - Download and extract the [script file](https://aka.ms/MDE-Linux-EDR-DIY) to an onboarded Linux server and run the following command: `./mde_linux_edr_diy.sh`

   - After a few minutes, a detection should be raised in Microsoft Defender XDR.

   - Look at the alert details, machine timeline, and perform your typical investigation steps.

## Microsoft Defender for Endpoint package external package dependencies

The following external package dependencies exist for the mdatp package:

- The mdatp RPM package requires `glibc >= 2.17`, `policycoreutils`, `selinux-policy-targeted`, `mde-netfilter`
- For DEBIAN the mdatp package requires `libc6 >= 2.23`, `uuid-runtime`, `mde-netfilter`
- For Mariner the mdatp package requires `attr`,  `diffutils`, `libacl`, `libattr`, `libselinux-utils`, `selinux-policy`, `policycoreutils`, `mde-netfilter`

> [!NOTE]
> Starting with version `101.24082.0004`, Defender for Endpoint on Linux no longer supports the `Auditd` event provider. We're transitioning completely to the more efficient eBPF technology.
> If eBPF isn't supported on your machines, or if there are specific requirements to remain on Auditd, and your machines are using Defender for Endpoint on Linux version `101.24072.0001` or lower, the following other dependencies on the auditd package exist for mdatp:
> - The mdatp RPM package requires `audit`, `semanage`.
> - For DEBIAN, the mdatp package requires `auditd`.
> - For Mariner, the mdatp package requires `audit`.

The `mde-netfilter` package also has the following package dependencies:

- For DEBIAN, the `mde-netfilter` package requires `libnetfilter-queue1`, `libglib2.0-0`
- For RPM, the `mde-netfilter` package requires `libmnl`, `libnfnetlink`, `libnetfilter_queue`, `glib2`
- For Mariner, the `mde-netfilter` package requires `libnfnetlink`, `libnetfilter_queue`

If the Microsoft Defender for Endpoint installation fails due to missing dependencies errors, you can manually download the prerequisite dependencies.


## Troubleshoot installation issues

- For details on how to find the log that's generated when an installation error occurs, see [Log installation issues](/defender-endpoint/linux-resources#log-installation-issues). 

- For information about common installation issues, see [Installation issues](/defender-endpoint/linux-support-install).

- If the health of the device is false, see [Investigate agent health issues](health-status.md). 

- For product performance issues, see [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md).

- For proxy and connectivity issues, see [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md). 

- To get support from Microsoft, open a support ticket, and provide the log files created by using the [Microsoft Defender for Endpoint client analyzer tool](run-analyzer-linux.md). 


## How to switch between channels

For example, to change channel from Insiders-Fast to Production, do the following:

1. Uninstall the `Insiders-Fast channel` version of Defender for Endpoint on Linux.

   ```bash
   sudo yum remove mdatp
   ```

2. Disable the Defender for Endpoint on Linux Insiders-Fast repo.

   ```bash
   sudo yum repolist
   ```

   > [!NOTE]
   > The output should show `packages-microsoft-com-fast-prod`.

   ```bash
   sudo yum-config-manager --disable packages-microsoft-com-fast-prod
   ```

3. Redeploy Microsoft Defender for Endpoint on Linux using the Production channel.

Defender for Endpoint on Linux can be deployed from one of the following channels (denoted as [channel]): 

- `insiders-fast`
- `insiders-slow`
- `prod` 

Each of these channels corresponds to a Linux software repository. This article describes how to configure your device to use one of these repositories.

The choice of channel determines the type and frequency of updates that are offered to your device. Devices in insiders-fast are the first to receive updates and new features, followed later by insiders-slow and lastly by prod.

In order to preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either `insiders-fast` or `insiders-slow`. 

> [!WARNING]
> Switching channels after the initial installation requires the product to be reinstalled. To switch the product channel: uninstall the existing package, reconfigure your device to use the new channel, and follow the steps in this document to install the package from the new location. 

## How to configure policies for Microsoft Defender for Endpoint on Linux

You can configure antivirus and EDR settings on your endpoints. For more information, see the following articles:

- [Set preferences for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-preferences) describes the available settings
- [Security settings management](/mem/intune/protect/mde-security-integration) describes how to configure settings in the Microsoft Defender portal.

## Uninstall Microsoft Defender for Endpoint on Linux

For manual uninstallation, execute the below command as per your Linux distribution.

- `sudo yum remove mdatp` for RHEL and variants(CentOS and Oracle Linux).
- `sudo zypper remove mdatp` for SLES and variants.
- `sudo apt-get purge mdatp` for Ubuntu and Debian systems.
- `sudo dnf remove mdatp` for Mariner


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
