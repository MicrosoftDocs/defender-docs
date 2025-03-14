---
title: Prerequisites for Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Describes the requirements needed to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
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
ms.date: 03/14/2025
---

# Prerequisites for Microsoft Defender for Endpoint on Linux

> [!TIP] 
> Microsoft Defender for Endpoint on Linux now extends support for Arm64-based Linux servers in preview! For more information, see [Microsoft Defender for Endpoint on Linux for Arm64-based devices (preview)](/defender-endpoint/mde-linux-arm)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Want to experience Microsoft Defender for Endpoint?
[Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

This article lists hardware and software requirements for Microsoft Defender for Endpoint on Linux.

## License requirements

To onboard servers to Defender for Endpoint, server licenses are required. You can choose from the following options:

- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender for Endpoint for servers
- [Microsoft Defender for Business servers](/defender-business/get-defender-business?tabs=findpartner#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

For more detailed information about licensing requirements for Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint licensing information](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint).

For detailed licensing information, see [Product Terms: Microsoft Defender for Endpoint]( https://www.microsoft.com/licensing/terms/productoffering/MicrosoftDefenderforEndpoint/EAEAS) and work with your account team to learn more about the terms and conditions.

## System Requirements

- **CPU**: One CPU core minimum. For high-performance workloads, more cores are recommended.
- **Disk Space**: 2 GB minimum. For high-performance workloads, more disk space might be needed.
- **Memory**: 1 GB of RAM minimum. For high-performance workloads, more memory might be needed.

> [!NOTE]
> Performance tuning might be needed based on workloads. For more information, see [Performance tuning for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-perf)

## Software requirements

- Linux server endpoints should be able to access the [Microsoft Defender portal](https://security.microsoft.com). If necessary, [configure static proxy discovery](linux-static-proxy-configuration.md).
- Linux server endpoints should have systemd (system manager) installed.
- Administrative privileges on the Linux server endpoint are required for installation.

> [!NOTE] 
> Linux distributions using system manager support both SystemV and Upstart.
> The Microsoft Defender for Endpoint on Linux agent is independent from [Operation Management Suite (OMS) agent](/azure/azure-monitor/agents/azure-monitor-agent-overview#log-analytics-agent).
> Microsoft Defender for Endpoint relies on its own independent telemetry pipeline.

## Supported Linux distributions

The following Linux server distributions and x64 (AMD64/EM64T) versions are supported:

- Red Hat Enterprise Linux 7.2 or higher 
- Red Hat Enterprise Linux 8.x 
- Red Hat Enterprise Linux 9.x 
- CentOS 7.2 or higher, excluding CentOS Stream 
- Ubuntu 16.04 LTS 
- Ubuntu 18.04 LTS 
- Ubuntu 20.04 LTS 
- Ubuntu 22.04 LTS 
- Ubuntu 24.04 LTS 
- Debian 9 - 12 
- SUSE Linux Enterprise Server 12.x 
- SUSE Linux Enterprise Server 15.x 
- Oracle Linux 7.2 or higher 
- Oracle Linux 8.x 
- Oracle Linux 9.x 
- Amazon Linux 2 
- Amazon Linux 2023 
- Fedora 33-38 
- Rocky 8.7 and higher 
- Rocky 9.2 and higher 
- Alma 8.4 and higher 
- Alma 9.2 and higher 
- Mariner 2 

**The following Linux server distributions on Arm64 are now supported in preview:**

- Ubuntu 20.04 Arm64 
- Ubuntu 22.04 Arm64 
- Amazon Linux 2 Arm64 
- Amazon Linux 2023 Arm64 

Support for [Microsoft Defender for Endpoint on Linux for Arm64-based devices](/defender-endpoint/mde-linux-arm) is now in preview. 

> [!NOTE]
> The workstation and desktop versions of these distributions are unsupported
> Distributions and versions that aren't explicitly listed are unsupported (even if they're derived from the officially supported distributions).
> After a new package version is released, support for the previous two versions is reduced to technical support only. Versions older than that which are listed in this section are provided for technical upgrade support only.
> Currently, Rocky and Alma distributions aren't supported in Microsoft Defender Vulnerability Management. However, Microsoft Defender for Endpoint is kernel-version agnostic for all other supported distributions and versions.
> The minimal requirement for the kernel version is `3.10.0-327` or later.

> [!WARNING]
> Running Defender for Endpoint on Linux with other fanotify-based security solutions isn't supported. It can lead to unpredictable results, including hanging the operating system.
> If there are any other applications on the system that use fanotify in blocking mode, applications are listed in the conflicting_applications field of the mdatp health command output. 
> The Linux FAPolicyD feature uses fanotify in blocking mode, and is therefore unsupported when running Defender for Endpoint in active mode. You can still safely take advantage of Defender for Endpoint on Linux EDR functionality after configuring the antivirus functionality Real Time Protection Enabled to passive mode. See [Enforcement level for Microsoft Defender Antivirus](/defender-endpoint/linux-preferences#enforcement-level-for-microsoft-defender-antivirus). 

## Supported filesystems for real-time protection and quick, full, and custom scans 

|Real-time protection and quick/full scans|Custom scans|
|---|---|
|`btrfs`|All filesystems are supported for real-time protection and quick/full scans|
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
|`tmpfs`|
|`udf`|
|`vfat`|
|`xfs`|

> [!NOTE]
> NFS v3 mount points to be scanned thoroughly and are required to set the `no_root_squash` export option on these mount points.
> Without this option, scanning NFS v3 can potentially fail due to lack of permissions. 

## Network connections

- Verify that your devices can connect to Microsoft Defender for Endpoint cloud services.
- Prepare your environment, as described in Step 1 of the following article [Configure your network environment to ensure connectivity with Defender for Endpoint service](/defender-endpoint/configure-environment)
- Connect Defender for Endpoint on Linux through a proxy server by using the following discovery methods:
   1. Transparent proxy
   2. Manual static proxy configuration 
- Permit anonymous traffic in the previously listed URLs, if a proxy or firewall blocks traffic.

> [!NOTE] 
> Configuration for transparent proxies isn't needed for Defender for Endpoint. See [Manual Static Proxy Configuration.](/defender-endpoint/linux-static-proxy-configuration)

> [!WARNING]
> PAC, WPAD, and authenticated proxies are not supported. 
> Use only static or transparent proxies. 
> SSL inspection and intercepting proxies are also not supported for security reasons.
> Configure an exception for SSL inspection and your proxy server to allow direct data pass-through from Defender for Endpoint on Linux to the relevant URLs without interception.
> Adding your interception certificate to the global store will not enable interception.

For troubleshooting steps, see [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-connectivity)

## External package dependency

For information on external package dependencies, see the following articles:

- [Microsoft Defender for Endpoint on Linux](/defender-endpoint/microsoft-defender-endpoint-linux)
- [Configure security settings and policies for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-preferences)

## Installation instructions 

There are several methods and deployment tools that you can use to install and configure Microsoft Defender for Endpoint on Linux. Before you begin, make sure the [Minimum requirements for Microsoft Defender for Endpoint](/defender-endpoint/minimum-requirements) are met.

You can use one of the following methods to deploy Microsoft Defender for Endpoint on Linux: 

1. Command-line tool, see [Manual deployment](/defender-endpoint/linux-install-manually)

2. Puppet, see [Deploy using Puppet configuration management too](/defender-endpoint/linux-install-with-puppet)

3. Ansible, see [Deploy using Ansible configuration management tool](/defender-endpoint/linux-install-with-ansible) 

4. Chef, see [Deploy using Chef configuration management tool](/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef) 

5. SaltStack, see [Deploy using SaltStack configuration management tool](/defender-endpoint/linux-install-with-saltack)

6. Arm64-based Linux servers, see [Microsoft Defender for Endpoint on Linux for Arm64-based devices (preview)](/defender-endpoint/mde-linux-arm)

If you experience any installation failures, see [Troubleshooting installation failures in Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-install)

> [!IMPORTANT]
> Installing Microsoft Defender for Endpoint in any location other than the default install path isn't supported.
> Microsoft Defender for Endpoint on Linux creates a mdatp user with random UID and GID.
> If you want to control the UID and GID, create a mdatp user before installation using the /usr/sbin/nologin shell option.
> Here's an example: mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin.

