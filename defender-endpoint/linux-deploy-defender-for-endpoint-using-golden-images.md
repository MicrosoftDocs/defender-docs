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
ms.date: 009/01/2025
---

# Deploy Microsoft Defender for Endpoint on Linux using golden images

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

Golden images are preconfigured virtual machine templates used to rapidly deploy consistent environments. Microsoft Defender for Endpoint on Linux supports golden image deployment across cloud and on-premises environments, with improved handling of machine identifiers and hostnames, ensuring reliable telemetry and device correlation.

This guide walks you through:

- Deploying Microsoft Defender for Endpoint on a golden image.

- Preparing the image for cloning.

- Ensuring unique identifiers for each virtual machine instance.

- Specific steps for cloud and on-premises environments.

## Step 1: Deploy Microsoft Defender for Endpoint on a golden image

1. Prepare the base virtual machine

   - Install your preferred [supported Linux distribution](./mde-linux-prerequisites.md#supported-linux-distributions) and apply all necessary system updates.

1. Deploy Microsoft Defender for Endpoint on a golden image

   There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux (applicable to AMD64 and ARM64 Linux servers):

   - [Installer script based deployment](./linux-installer-script.md)

   - [Ansible based deployment](./linux-install-with-ansible.md)

   - [Chef based deployment](./linux-deploy-defender-for-endpoint-with-chef.md)

   - [Puppet based deployment](./linux-install-with-puppet.md)

   - [SaltStack based deployment](./linux-install-with-saltack.md)

   - [Manual deployment](./linux-install-manually.md)

   - [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)

   - [Guidance for Defender for Endpoint on Linux Server with SAP](./mde-linux-deployment-on-sap.md)

1. Validate the deployment

   Check the health status of the product by running the following command. A return value of `true` denotes that the product is functioning as expected:

   ```bash
   mdatp health
   ```

After you've successfully deployed Defender on the golden image, there is no need to deploy it separately on each virtual machine clone.

## Step 2: Prepare the golden image for cloning

Before making a snapshot of the virtual machine, follow these steps to ensure that each virtual machine clone gets a unique hardware UUID:

### On-premises machines

For on-premises virtual machines, make sure that the golden image generated from it is configured in such a way that when it is cloned, each virtual machine clone will have a unique hardware UUID.

If you're using **KVM/libvirt** or **VMware/Hyper-V** as the virtualization platform, it's recommended to use the following instructions:

- **KVM/libvirt**: Omit the \<uuid\> element in domain XML or set a fresh UUID using: uuidgen

- **VMware/Hyper-V**: Enable platform settings to generate a new BIOS GUID during clone or conversion.

### Cloud virtual machines

Cloud platforms (for example, Azure, AWS, GCP) automatically inject unique metadata and identifiers via their instance metadata services (IMDS). No manual steps are required. Microsoft Defender for Endpoint automatically detects and uses these values to generate unique machine IDs.

## Hostname Management

If the hostname of a Linux server is changed after successful deployment of Defender, then you must restart the `mdatp` service to ensure the new hostname is correctly recognized by product.

## Related content

[!INCLUDE [Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
