---
title: Enabling deployment of Microsoft Defender for Endpoint for Linux to a custom location
description: Describes how to deploy Microsoft Defender for Endpoint on Linux to a custom location instead of the default location.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: meghapriya
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: install-set-up-deploy
ms.subservice: linux
search.appverid: met150
ms.date: 08/18/2025
appliesto:
  - Microsoft Defender for Endpoint for servers
---

# Enabling deployment of Microsoft Defender for Endpoint to a custom location


> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=&country=us)

## Introduction

Microsoft Defender for Endpoint on Linux supports installation to custom locations, allowing organizations to deploy the agent to nonstandard locations based on their specific requirements. This feature is useful for environments that have:

- Custom directory structures and organizational policies
- Limited space on the root filesystem
- Specific compliance requirements for application placement

By default, Defender for Endpoint installs to the directory `/opt/microsoft/mdatp`. With custom location installation, you can choose a different base directory during the initial setup. Defender for Endpoint then uses its same internal folder structure in your specified location. After installation, the chosen location remains fixed, and subsequent upgrades will keep using your original custom location. Changing the installation location later isn't supported. If you need to use a different location, you have to uninstall Defender for Endpoint and then reinstall it to the new location.

## Prerequisites and system requirements

Before deploying Defender for Endpoint to a custom location, be sure the following requirements are met:

### Prerequisites

- The custom installation directory and its entire tree must have at least `rwxr-xr-x` (755) permissions.

- The target location must have adequate disk space (minimum 2 GB, more for high-performance workloads).

- If SELinux is enabled, the `semanage` tool must be installed to set the correct file context for the custom location.

- For reasons of security and reliability, it's highly recommended to install to a location on a persistent, permanently-mounted local filesystem. Avoid using removable media, network mounts, or filesystems that could be unmounted during system operation, as this can cause Microsoft Defender for Endpoint service failures and create security risks.

### Supported distributions and feature availability

- Custom location installation is supported on all [supported Linux distributions](mde-linux-prerequisites.md#supported-linux-distributions) for both x64 and ARM64 architectures.

- The custom location feature is available starting from version **101.25062.0003** of Defender for Endpoint on Linux.

## Steps for installing to a custom location

This section describes the additional steps required for deploying Defender for Endpoint to a custom location, using various supported methods.

- **Installer script**:

  The recommended method is to run the `mde_installer.sh` script with the `--install-path /your/custom/path` option at the time of installation. For details, see the [installer script deployment guide](linux-installer-script.md).

- **Third-party automation tools**:

  Solutions such as Ansible, Chef, Puppet, and SaltStack can automate deployment by running the `mde_installer.sh` script with the `--install-path /your/custom/path` option at the time of installation. For details, see the [installer script deployment guide](linux-installer-script.md).

- **Manual installation**:

  If you prefer manual setup, you must perform additional preinstallation steps to prepare your custom location. See the [next section](#manual-installation-preinstallation-setup) for step-by-step instructions.

### Manual installation: preinstallation setup

In the [manual deployment steps](linux-install-manually.md#manual-deployment-steps), you need to complete an additional preinstallation setup to enable custom location installation. Follow the steps below as part of the [preinstall setup for custom location installation](linux-install-manually.md#preinstall-setup-for-custom-location-installation).

> [!IMPORTANT]
> It's strongly recommended to choose a new, dedicated (empty) directory for the custom install path. During uninstall/cleanup, the process attempts to recursively remove that directory and all its contents - therefore, it's important not to use a shared or existing directory that contains other data you might need to retain.

1. **Set your custom path variable**:

    > [!NOTE]
    > The custom path must be an absolute path (for example, `/your/custom/path`). Relative paths aren't supported.

    ```bash
    export CUSTOM_PATH="/your/custom/path"
    ```

1. **Create required directories and config file**:

    ```bash
    sudo mkdir -p "${CUSTOM_PATH}"
    sudo mkdir -p /etc/opt/microsoft/mdatp
    echo '{"path": "'${CUSTOM_PATH}'"}' | sudo tee /etc/opt/microsoft/mdatp/mde_path.json
    ```

1. **Set permissions**:

    ```bash
    sudo chmod 755 "${CUSTOM_PATH}"
    sudo chmod 644 /etc/opt/microsoft/mdatp/mde_path.json
    ```

1. **Create symlink**:
 
   ```bash
    sudo ln -sf "${CUSTOM_PATH}/opt/microsoft/mdatp" /opt/microsoft/mdatp
    ```

Then proceed with the standard installation steps for your distribution.

## Upgrade and maintenance

Upgrades for Defender for Endpoint installed in a custom location work the same as standard installations - the installer automatically preserves your existing location and configuration.

> [!IMPORTANT]
> Changing the installation path during an upgrade isn't supported. If you need to change the installation path, you must first uninstall Defender for Endpoint and then reinstall it to the new location.

## Frequently asked questions

**Can I install Defender for Endpoint to any directory?**  
Yes, as long as the path to the installation location is an absolute path with at least 755 permissions and enough space (minimum 2 GB).

**Can I change the Defender for Endpoint installation location after installation?**  
No, you must uninstall and reinstall to use a different location.

**How do I upgrade Defender for Endpoint in a custom location?**  
Run the usual upgrade commands. The installation location remains unchanged.

**Can I change the custom location during upgrade?**  
No, installation location changes require a fresh install.

## Troubleshooting

### 1. Verify the installation location

- **Check running processes:**

   Run: `ps aux | grep wdavdaemon`. The output should contain wdavdaemon process paths for microsoft_mdatp. For example:

   ```
   root 747798 0.3 1.5 1037180 154336 ? Ssl 12:26 0:21 /var/tmp/TestInstall/microsoft_mdatp/opt/microsoft/mdatp/sbin/wdavdaemon
   root      747844  0.0  0.8 945692 79676 ?        Sl   12:26   0:04 /var/tmp/TestInstall/microsoft_mdatp/opt/microsoft/mdatp/sbin/wdavdaemon edr 16 15 --log_level info
   ```

- **Check service status:**

   Run: `systemctl status mdatp`
   
   ```
   ● mdatp.service - Microsoft Defender
           Loaded: loaded (/lib/systemd/system/mdatp.service; enabled; vendor preset: enabled)
           Active: active (running) since ...
           Main PID: 747798 (wdavdaemon)
           ...
           CGroup: /system.slice/mdatp.service
                   ‣ 747798 /var/tmp/TestInstall/microsoft_mdatp/opt/microsoft/mdatp/sbin/wdavdaemon
    ```

- **Check the custom installation path in the *mde_path.json* file:**

   - Primary: `/etc/opt/microsoft/mdatp/mde_path.json`
      - Example: `{"path": "/var/tmp/TestInstall/microsoft_mdatp"}`
      - If missing or malformed, Microsoft Defender for Endpoint fallbacks to the secondary file.
   - Secondary: `<custom_installation_path>/opt/microsoft/mdatp/conf/mde_path.json`
      - Should match the primary config.
      - This file is created at installation time.
      - Inconsistencies may indicate installation corruption.
   - Ensure the path is absolute.

### 2. Verify the symlink to the custom location

Run: `ls -ltr /opt/microsoft/mdatp`. The output should show `/opt/microsoft/mdatp` as a symlink to your custom location. For example:

```
lrwxrwxrwx 1 root root ... /opt/microsoft/mdatp -> /var/tmp/TestInstall/microsoft_mdatp/opt/microsoft/mdatp
```

## Related content

- [Prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md)

- Deployment methods:
   - [Installer script based deployment](linux-installer-script.md) 
   - [Ansible based deployment](linux-install-with-ansible.md)
   - [Chef based deployment](linux-deploy-defender-for-endpoint-with-chef.md)
   - [Puppet based deployment](linux-install-with-puppet.md)
   - [Saltstack based deployment](linux-install-with-saltack.md)
   - [Connect your non-Azure machines to Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint) (direct onboarding using Defender for Cloud)
   - [Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md)
   - [Deploy Defender for Endpoint on Linux manually](linux-install-manually.md)

[!INCLUDE [Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
