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
ms.date: 08/26/2025
---

# Deploy Microsoft Defender for Endpoint on Linux using golden images (preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:** ??Do we need applies to?

Golden images are preconfigured virtual machine templates used to rapidly deploy consistent environments. Microsoft Defender for Endpoint on Linux supports golden image deployment with improved handling of machine identifiers and hostnames, ensuring reliable telemetry and device correlation.

This guide walks you through:

- Installing Microsoft Defender for Endpoint on a golden image.

- Preparing the image for cloning.

- Ensuring unique identifiers for each VM instance.

- Specific steps for cloud and on-premises environments

## Step-by-Step: Installing MDE on a Golden Image

1. Prepare the Base VM

   - Install your preferred Linux distribution.

   - Apply all necessary system updates.

   - Install required dependencies for MDE.

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

   Ensure MDE is running and registered:

   ```bash
   mdatp health
   ```

## Preparing the Golden Image for Cloning

Before snapshotting the VM, follow these steps to ensure each clone will have a unique machine identity:

**On-Premises VMs**

**A. Inject a New SMBIOS UUID**

- **KVM/libvirt**: Omit the \<uuid\> element in domain XML or set a fresh UUID using:

- uuidgen

- **VMware/Hyper-V**: Enable platform settings to generate a new BIOS GUID during clone or conversion.

**B. Regenerate OS Machine ID**

Run the following commands:

rm -f /etc/machine-id /var/lib/dbus/machine-id

systemd-machine-id-setup

dbus-uuidgen \--ensure=/var/lib/dbus/machine-id

**C. Validate Metadata Post-Clone**

After cloning, verify:

- CloudMetadata

- dmidecode

- sysfs values

- Hardware GUID

If mismatched, update the MachineInfo and save all values back to the MDE state file.

**Cloud VMs**

Cloud platforms (e.g., Azure, AWS, GCP) automatically inject unique metadata and identifiers via their instance metadata services (IMDS). No manual steps are required.

MDE will automatically detect and use these values to generate unique machine IDs.

**Hostname Management**

- Hostnames are now stored persistently during installation.

- If you wish to change the hostname, **restart the service** to ensure consistent identifier updates.

**Summary**

By following this guide, you can confidently deploy MDE on Linux using golden images across cloud and on-premises environments. This ensures:

- Unique and consistent device identifiers

- Reliable telemetry

- Smooth device correlation in the security portal



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
