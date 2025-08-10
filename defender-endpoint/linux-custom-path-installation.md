---
title: Enable deployment of MDE at custom installation path
description: Describes how to deploy Microsoft Defender for Endpoint on Linux to a custom installation path instead of the default location.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: meghapriya
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
ms.date: 11/08/2025
---

# Enable deployment of Microsoft Defender for Endpoint to a custom installation path

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=&country=us)

## Introduction

Microsoft Defender for Endpoint (MDE) on Linux supports installation to custom paths, allowing organizations to deploy the agent to nonstandard locations based on their specific requirements. This feature is useful for environments with:

- Custom directory structures and organizational policies
- Limited space on the root filesystem
- Specific compliance requirements for application placement

By default, Defender for Endpoint installs to `/opt/microsoft/mdatp`. With custom path installation, you can choose a different base directory during the initial setup—Defender for Endpoint will use the same internal folder structure in your specified location. After installation, the chosen path remains fixed: upgrades keep using your original custom path, and changing the installation path later isn't supported. If you need to use a different path, you must uninstall Defender for Endpoint and reinstall it to the new location.

## Prerequisites and System Requirements

Before deploying Defender for Endpoint to a custom path, be sure the following requirements are met:

### Prerequisites
- The custom installation directory and its entire tree must have at least `rwxr-xr-x` (755) permissions.
- Ensure adequate disk space in the target location (minimum 2 GB, more for high-performance workloads).
- If SELinux is enabled, the `semanage` tool must be installed to set the correct file context for the custom installation path.

### Supported Distributions and Feature Availability

- Custom path installation is supported on all [supported Linux distributions](mde-linux-prerequisites.md#supported-linux-distributions) for both x64 and ARM64 architectures.

- The custom installation path feature is available starting from version **101.25062.0003** of Defender for Endpoint on Linux.

## Steps for Installing to a Custom Path

This section describes the additional steps required to deploy Defender for Endpoint to a custom installation path, using various supported methods.

- **Installer script**:

  The recommended method is to run the `mde_installer.sh` script with the `--install-path /your/custom/path` option at the time of installation. For details, see the [installer script deployment guide](linux-installer-script.md).

- **Third-party automation tools**:

  Solutions such as Ansible, Chef, Puppet, and SaltStack can automate deployment by running the `mde_installer.sh` script with the `--install-path /your/custom/path` option at the time of installation. For details, see the [installer script deployment guide](linux-installer-script.md).

- **Manual installation**:

  If you prefer manual setup, you must perform additional preinstallation steps to prepare your custom path. See the next section for step-by-step instructions.

### Manual Installation: Pre-Installation Setup

In the [Manual deployment steps](linux-install-manually.md#manual-deployment-steps), you must complete an additional preinstallation setup to enable custom path installation. Follow the steps below as part of the [Preinstall Setup for Custom Path Installation](linux-install-manually.md#pre-install-setup-for-custom-path-installation).

1. **Set your custom path variable**:

    > [!NOTE]
    > The custom path must be an absolute path (for example, `/your/custom/path`). Relative paths aren't supported.

    ```bash
    export CUSTOM_PATH="/your/custom/path"
    ```

2. **Create required directories and config file**:
    ```bash
    sudo mkdir -p "${CUSTOM_PATH}"
    sudo mkdir -p /etc/opt/microsoft/mdatp
    echo '{"path": "'${CUSTOM_PATH}'"}' | sudo tee /etc/opt/microsoft/mdatp/mde_path.json
    ```

3. **Set permissions**:
    ```bash
    sudo chmod 755 "${CUSTOM_PATH}"
    sudo chmod 644 /etc/opt/microsoft/mdatp/mde_path.json
    ```

4. **Create symlink**:
    ```bash
    sudo ln -sf "${CUSTOM_PATH}/opt/microsoft/mdatp" /opt/microsoft/mdatp
    ```

Then proceed with the standard installation steps for your distribution.

## Upgrade and Maintenance

Upgrades for Defender for Endpoint installed in a custom path work the same as standard installations—the installer automatically preserves your existing path and configuration.

> [!IMPORTANT]
> Changing the installation path during an upgrade isn't supported. If you need to change the installation path, you must first uninstall Defender for Endpoint and then reinstall it to the new location.

## Frequently Asked Questions (FAQ)

**Can I install Defender for Endpoint to any directory?**  
Yes, as long as it’s an absolute path with at least 755 permissions and enough space (minimum 2 GB).

**Can I change the Defender for Endpoint installation path after installation?**  
No, you must uninstall and reinstall to use a different path.

**How do I upgrade Defender for Endpoint in a custom path?**  
Run the usual upgrade commands. Installation path stays unchanged.

**Can I change the custom path during upgrade?**  
No, installation path changes require a fresh install.

## See also

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
