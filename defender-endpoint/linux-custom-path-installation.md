---
title: Enable deployment of MDE at custom installation path
description: Describes how to deploy Microsoft Defender for Endpoint on Linux to a custom installation path instead of the default location.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.reviewer: gopkr; meghapriya
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: install-set-up-deploy
ms.subservice: linux
search.appverid: met150
ms.date: 08/05/2025
---

# Enable deployment of MDE at custom installation path

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=&country=us)

## Introduction

Microsoft Defender for Endpoint (MDE) on Linux now supports installation to custom paths, allowing organizations to deploy the agent to non-standard locations based on their specific requirements. This feature is particularly useful for environments with:

- Custom directory structures and organizational policies
- Limited space on the root filesystem
- Specific compliance requirements for application placement
- Multi-tenant environments requiring isolation
- Specialized storage configurations

By default, MDE installs to the standard system path (`/opt/microsoft/mdatp`). With custom path installation, you can specify an alternative base directory while maintaining the same relative directory structure and functionality.

## Prerequisites and System Requirements

Before deploying MDE to a custom path, ensure the following requirements are met:

### Prerequisites
- The custom installation directory and its entire tree must have at least `rwxr-xr-x` (755) permissions.
- Ensure adequate disk space in the target location (minimum 2 GB, more for high-performance workloads).
- If SELinux is enabled, the `semanage` tool must be installed to set the correct file context for the custom installation path.

### Supported Distributions and Feature Availability

Custom path installation is supported on all [supported Linux distributions](mde-linux-prerequisites.md#supported-linux-distributions) for both x64 and ARM64 architectures.

> **Note:** The custom installation path feature is available starting from version **101.25062.0003** of Microsoft Defender for Endpoint on Linux.

## Steps for Installing to a Custom Path

This section describes only the extra steps needed for custom path installation:

- **Installer script**: At installation time, run the `mde_installer.sh` script with the `--install-path /your/custom/path` option to specify a custom location. For more details, see the [installer script deployment guide](linux-installer-script.md).
- **Manual installation**: Perform the following additional setup steps before running the standard manual installation commands described in [linux-install-manually.md](linux-install-manually.md).

### Manual Installation: Pre-Installation Setup

If you need to manually install Microsoft Defender for Endpoint (MDE) to a custom (non-default) location, follow these additional steps before starting the standard installation process:

1. **Set your custom path variable**:

    > [!NOTE]
    > The custom path must be an absolute path (e.g., `/your/custom/path`). Relative paths are not supported.

    ```bash
    export CUSTOM_PATH="/your/custom/path"
    ```

2. **Create required directories and config file**:
    ```bash
    sudo mkdir -p "${CUSTOM_PATH}"
    sudo mkdir -p /etc/opt/microsoft/mdatp
    echo '{"install_path": "'${CUSTOM_PATH}'"}' | sudo tee /etc/opt/microsoft/mdatp/mde_path.json
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

Upgrades for MDE installed in a custom path work the same as standard installations—the installer automatically preserves your existing path and configuration.

> [!IMPORTANT]
> Changing the installation path during an upgrade is not supported. If you need to change the installation path, you must first uninstall MDE and then reinstall it to the new location.

## Frequently Asked Questions (FAQ)

**Can I install MDE to any directory?**  
Yes, as long as it’s an absolute path with at least 755 permissions and enough space (minimum 2 GB).

**Can I change the MDE installation path after installation?**  
No, you must uninstall and reinstall to use a different path.

**How do I upgrade MDE in a custom path?**  
Run the usual upgrade commands. Installation path stays unchanged.

**Can I change the custom path during upgrade?**  
No, installation path changes require a fresh install.

## See also

- [Prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md)

- Other deployment methods:
   - [Installer script based deployment](linux-installer-script.md) 
   - [Ansible based deployment](linux-install-with-ansible.md)
   - [Chef based deployment](linux-deploy-defender-for-endpoint-with-chef.md)
   - [Puppet based deployment](linux-install-with-puppet.md)
   - [Saltstack based deployment](linux-install-with-saltack.md)
   - [Connect your non-Azure machines to Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint) (direct onboarding using Defender for Cloud)
   - [Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md)

[!INCLUDE [Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
