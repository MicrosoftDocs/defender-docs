---
title: Deploy Microsoft Defender for Endpoint on Linux using golden images
description: Learn how to use preconfigured virtual machine templates (golden images) for rapid, consistent Microsoft Defender for Endpoint deployment on Linux.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: meghapriya
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
ms.date: 08/27/2025
---

# Deploy Microsoft Defender for Endpoint on Linux using golden images (preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

Golden images are preconfigured virtual machine templates used to rapidly deploy consistent environments. Microsoft Defender for Endpoint on Linux supports golden image deployment across cloud and on-premises environments, with improved handling of machine identifiers and hostnames, ensuring reliable telemetry and device correlation.

This guide walks you through:

- Installing Microsoft Defender for Endpoint on a golden image.

- Preparing the image for cloning.

- Ensuring unique identifiers for each virtual machine instance.

- Specific steps for cloud and on-premises environments.

## Step 1: Install Microsoft Defender for Endpoint on a golden image

1. Prepare the case virtual machine

   - Install your preferred [supported Linux distribution](./mde-linux-prerequisites.md#supported-linux-distributions) and apply all necessary system updates.

   - INSTALL REQUIRED DEPENDENCIES FOR MICROSOFT DEFENDER FOR ENDPOINT

1. Install Microsoft Defender for Endpoint

   There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux (applicable to AMD64 and ARM64 Linux servers):

   - [Installer script based deployment](./linux-installer-script.md)

   - [Ansible based deployment](./linux-install-with-ansible.md)

   - [Chef based deployment](./linux-deploy-defender-for-endpoint-with-chef.md)

   - [Puppet based deployment](./linux-install-with-puppet.md)

   - [SaltStack based deployment](./linux-install-with-saltack.md)

   - [Manual deployment](./linux-install-manually.md)

   - [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)

   - [Guidance for Defender for Endpoint on Linux Server with SAP](./mde-linux-deployment-on-sap.md)

1. Validate Installation

   Check the health status of the product by running the following command. A return value of `true` denotes that the product is functioning as expected:

   ```bash
   mdatp health
   ```

## Step 2: Prepare the golden image for cloning

Before making a snapshot of the virtual machine, follow these steps to ensure that each clone has a unique machine identity:

### On-premises virtual machines

1. Inject a New SMBIOS UUID

   - **KVM/libvirt**: Omit the \<uuid\> element in domain XML or set a fresh UUID using: uuidgen

   - **VMware/Hyper-V**: Enable platform settings to generate a new BIOS GUID during clone or conversion.

1. Regenerate OS Machine ID

   Run the following commands:

   ```
   rm -f /etc/machine-id /var/lib/dbus/machine-id
   systemd-machine-id-setup
   dbus-uuidgen \--ensure=/var/lib/dbus/machine-id
   ```

1. Validate Metadata Post-Clone

   After cloning, verify:

   - CloudMetadata

   - dmidecode

   - sysfs values

   - Hardware GUID

   If mismatched, update the MachineInfo and save all values back to the Microsoft Defender for Endpoint state file.

### Cloud virtual machines

Cloud platforms (for example, Azure, AWS, GCP) automatically inject unique metadata and identifiers via their instance metadata services (IMDS). No manual steps are required. Microsoft Defender for Endpoint automatically detects and uses these values to generate unique machine IDs.

## Hostname Management

HOSTNAMES ARE STORED PERSISTENTLY DURING INSTALLATION. IF YOU WISH TO CHANGE THE HOSTNAME, **RESTART THE SERVICE** TO ENSURE CONSISTENT IDENTIFIER UPDATES.

## Related content

[!INCLUDE [Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
