---
title: Install Microsoft Defender for Endpoint on Linux
description: Describes how to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
author: KesemSharabi
ms.author: kesharab
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: article
ms.subservice: linux
search.appverid: met150
ms.date: 11/09/2025
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Install Defender for Endpoint on Linux

This article is aimed at security admins who want to install [Defender for Endpoint](microsoft-defender-endpoint.md) on Linux servers. The article covers prerequisites, and links to additional deployment and configuration documents.

## Prerequisites

This section lists the prerequisites for installing Defender for Endpoint on Linux.

### Minimum system requirements

* **CPU** - One CPU core
* **Disk Space** - 2GB
* **Memory** - 1GB of RAM

### Supported Linux distributions

The table in this section lists supported distributions. When running Defender for Endpoint on unsupported distributions, the kernel version has to be at least `3.10.0-327`.

|Distribution  |Version  |x64 (AMD64/EM64T)  |
|---------|---------|---------|
|Alma     |8.4 and higher         |         |
|Amazon Linux     |2</br>2023         |2</br>2023         |
|CentOS     |7.2 and higher, excluding CentOS Stream         |         |
|Debian     |9 - 12         |11</br>12         |
|Fedora     |33 - 42         |         |
|Mariner     |2         |         |
|Oracle Linux     |7.2 and higher         |8.x</br>9.x         |
|Red Hat Enterprise Linux     |7.2 and higher         |         |
|RHEL     |         |8.x</br>9.x         |
|Rocky     |8.7 and higher         |         |
|SUSE Linux Enterprise Server     |12.x</br>15.x         |SP5</br>SP6          |
|Ubuntu     |16.04 LTS</br>18.04 LTS</br>20.04 LTS</br>22.04 LTS</br>24.04 LTS         |20.04</br>22.04</br>24.04         |

### Permissions

To install Defender for Endpoint on Linux, you need the following permissions:

* Administrative privileges on the Linux server endpoint
* An appropriate [role](/defender-endpoint/prepare-deployment#role-based-access-control) assigned in Defender for Endpoint

### Network access

You need access to `*.endpoint.security.microsoft.com`. If needed, you can [configure static proxy access](linux-static-proxy-configuration.md).

### Management tools

Installed *systemd* system manager.

### Supported filesystems for scans

This table lists supported filesystems for [real-time protection](configure-real-time-protection-microsoft-defender-antivirus.md), and quick, full, and custom scans.

|Real-time protection and quick or full scans|Custom scans|
|---|---|
|`btrfs`|All filesystems are supported|
|`ecryptfs`|`Efs`|
|`ext2`|`S3fs`|
|`ext3`|`Blobfuse`|
|`ext4`|`Lustr`|
|`fuse`|`glustrefs`|
|`fuseblk`|`Afs`|
|`jfs`|`sshfs`|
|`nfs` (v3 only)|`cifs`|
|`overlay`|`smb`|
|`ramfs`|`gcsfuse`|
|`reiserfs`|`sysfs`|
|`tmpfs`|   |
|`udf`|   |
|`vfat`|   |
|`xfs`|   |

## Deploy Defender for Endpoint on Linux

The links in this section describe the methods you can use to deploy Defender for Endpoint on Linux.

Installing Defender for Endpoint in any location other than the default install path isn't supported.

Defender for Endpoint creates an *mdatp* user with random UID and GID values. If you want to control these values, create an *mdatp* user before installation using the `/usr/sbin/nologin` shell option. For example, `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

* [Installer script](/defender-endpoint/linux-installer-script)
* [Ansible](/defender-endpoint/linux-install-with-ansible)
* [Chef](/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef)
* [Puppet](/defender-endpoint/linux-install-with-puppet)
* [SaltStack](/defender-endpoint/linux-install-with-saltack)
* [Manual deployment](/defender-endpoint/linux-install-manually)
* [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
* [Deployment guidance for Defender for Endpoint on Linux Server with SAP](/defender-endpoint/mde-linux-deployment-on-sap)

## Configure Defender for Endpoint on Linux

After installing Defender for Endpoint on Linux, use the links in this section to configure your system.

### Security settings

To manage your Defender for Endpoint security settings, select one of these configuration options.

* [Security settings management](/defender-endpoint/mde-security-settings-management) - Use the Defender portal to configure and manage your policies.
* [Configure security settings on Linux](/defender-endpoint/linux-preferences) - Use a JSON file to configure your security settings.

### Exclusions

High input and output (I/O) workloads from certain applications can experience performance issues when Defender for Endpoint is installed. Such applications include *Jenkins*, *Jira*, and database workloads such as *OracleDB* and *Postgres*. If you see performance degradation, consider setting exclusions for trusted applications.

* [Configure and validate exclusions](/defender-endpoint/linux-exclusions)
* [Mistakes to avoid when defining exclusions](/defender-endpoint/common-exclusion-mistakes-microsoft-defender-antivirus)

## Updates

Microsoft publishes Defender for Endpoint [Linux software updates](linux-whatsnew.md) on a monthly basis. Each version of Defender for Endpoint on Linux is set to expire after nine months. To deploy new updates, follow the [deploy updates](linux-updates.md) instructions.
