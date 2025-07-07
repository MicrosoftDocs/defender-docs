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
ms.date: 06/30/2025
---

# Prerequisites for Microsoft Defender for Endpoint on Linux

> [!TIP]
> Microsoft Defender for Endpoint on Linux now extends support for Arm64-based Linux servers in GA.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article lists hardware and software requirements for Defender for Endpoint on Linux. For more information about Defender for Endpoint on Linux, such as what's included in this offering, see the following articles:

- [Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) 

- [What's new in Defender for Endpoint on Linux](linux-whatsnew.md) 

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## License requirements

To onboard servers to Defender for Endpoint, server licenses are required. You can choose from the following options:

- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender for Endpoint for servers
- [Microsoft Defender for Business servers](/defender-business/get-defender-business?tabs=findpartner#how-to-get-microsoft-defender-for-business-servers) (for small and medium-sized businesses only)

For more detailed information about licensing requirements for Microsoft Defender for Endpoint, see [Microsoft Defender for Endpoint licensing information](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint).

For detailed licensing information, see [Product Terms: Microsoft Defender for Endpoint]( https://www.microsoft.com/licensing/terms/productoffering/MicrosoftDefenderforEndpoint/EAEAS) and work with your account team to learn more about the terms and conditions.

## System requirements

- **CPU**: One CPU core minimum. For high-performance workloads, more cores are recommended.
- **Disk Space**: 2 GB minimum. For high-performance workloads, more disk space might be needed.
- **Memory**: 1 GB of RAM minimum. For high-performance workloads, more memory might be needed.

> [!NOTE]
> Performance tuning might be needed based on workloads. For more information, see [Performance tuning for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-perf)

## Software requirements

- Linux server endpoints should be able to access the `*.endpoint.security.microsoft.com`. If necessary, [configure static proxy discovery](linux-static-proxy-configuration.md).
- Linux server endpoints should have systemd (system manager) installed.
- Administrative privileges on the Linux server endpoint are required for installation.
- An appropriate role assigned in Defender for Endpoint. See [Role-based access control](/defender-endpoint/prepare-deployment#role-based-access-control).

> [!NOTE] 
> Linux distributions using system manager support both SystemV and Upstart.
> The Microsoft Defender for Endpoint on Linux agent is independent from [Operation Management Suite (OMS) agent](/azure/azure-monitor/agents/azure-monitor-agent-overview#log-analytics-agent).
> Microsoft Defender for Endpoint relies on its own independent telemetry pipeline.

## Supported Linux distributions

The following Linux server distributions and x64 (AMD64/EM64T) versions are supported:

- Red Hat Enterprise Linux 7.2 and higher 

- Red Hat Enterprise Linux 8.x 
- Red Hat Enterprise Linux 9.x 
- CentOS 7.2 and higher, excluding CentOS Stream 

- CentOS 8.x

- Ubuntu 16.04 LTS 
- Ubuntu 18.04 LTS 
- Ubuntu 20.04 LTS 
- Ubuntu 22.04 LTS 
- Ubuntu 24.04 LTS 
- Debian 9 - 12 
- SUSE Linux Enterprise Server 12.x 
- SUSE Linux Enterprise Server 15.x 
- Oracle Linux 7.2 and higher 

- Oracle Linux 8.x 
- Oracle Linux 9.x 
- Amazon Linux 2 
- Amazon Linux 2023 
- Fedora 33-42
- Rocky 8.7 and higher 
- Rocky 9.2 and higher 
- Alma 8.4 and higher 
- Alma 9.2 and higher 
- Mariner 2 

**The following Linux server distributions on ARM64 are now GA:**

- Ubuntu 20.04 ARM64 
- Ubuntu 22.04 ARM64 
- Ubuntu 24.04 ARM64
- Debian 11, 12 ARM64
- Amazon Linux 2 ARM64 
- Amazon Linux 2023 ARM64 
- RHEL 8.x ARM64
- RHEL 9.x ARM64
- Oracle Linux 8.x ARM64
- Oracle Linux 9.x ARM64
- SUSE Linux Enterprise Server 15 (SP5, SP6) ARM64

> [!NOTE]
> The workstation and desktop versions of these distributions are unsupported
> Distributions and versions that aren't explicitly listed are unsupported (even if they're derived from the officially supported distributions).
> After a new package version is released, support for the previous two versions is reduced to technical support only. Versions older than that which are listed in this section are provided for technical upgrade support only.
> Microsoft Defender for Endpoint is kernel-version agnostic for all other supported distributions and versions. The minimal requirement for the kernel version is `3.10.0-327` or later.

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

## Verify if devices can connect to Defender for Endpoint cloud services

1. Prepare your environment, as described in Step 1 of the following article [Configure your network environment to ensure connectivity with Defender for Endpoint service](/defender-endpoint/configure-environment).

2. Connect Defender for Endpoint on Linux through a proxy server by using the following discovery methods:

   - Transparent proxy
   - [Manual static proxy configuration](/defender-endpoint/linux-static-proxy-configuration#installation-time-configuration) 

3. Permit anonymous traffic in the previously listed URLs, if a proxy or firewall blocks traffic.

> [!NOTE] 
> Configuration for transparent proxies isn't needed for Defender for Endpoint. See [Manual Static Proxy Configuration.](/defender-endpoint/linux-static-proxy-configuration)

> [!WARNING]
> PAC, WPAD, and authenticated proxies aren't supported. 
> Use only static or transparent proxies. 
> SSL inspection and intercepting proxies aren't supported for security reasons.
> Configure an exception for SSL inspection and your proxy server to allow direct data pass-through from Defender for Endpoint on Linux to the relevant URLs without interception.
> Adding your interception certificate to the global store doesn't enable interception.

For troubleshooting steps, see [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-connectivity)

## External package dependency

If the Microsoft Defender for Endpoint installation fails due to missing dependencies errors, you can manually download the prerequisite dependencies. The following external package dependencies exist for the mdatp package:

- The mdatp RPM package requires `glibc >= 2.17`.
- For DEBIAN the mdatp package requires `libc6 >= 2.23`.

> [!NOTE]
> Beginning with version `101.24082.0004`, Defender for Endpoint on Linux no longer supports the `Auditd` event provider. We're transitioning completely to the more efficient eBPF technology.
> If eBPF isn't supported on your machines, or if there are specific requirements to remain on Auditd, and your machines are using Defender for Endpoint on Linux version `101.24072.0001` or older, the following additional dependency on the auditd package exists for mdatp:
> - The mdatp RPM package requires `audit`, `semanage`.
> - For DEBIAN, the mdatp package requires `auditd`.
> - For Mariner, the mdatp package requires `audit`.
> 
> For versions older than `101.25032.0000`, the following requirements apply:
> - RPM package needs: `mde-netfilter` and `pcre`
> - DEBIAN package needs: `mde-netfilter` and `libpcre3`
>
> Beginning with version `101.25042.0003`, uuid-runtime is no longer required as an external-dependency.
> The `mde-netfilter` package also has the following package dependencies:
> - For DEBIAN, the `mde-netfilter` package requires `libnetfilter-queue1` and `libglib2.0-0`
> - For RPM, the `mde-netfilter` package requires `libmnl`, `libnfnetlink`, `libnetfilter_queue`, and `glib2`

## Installation instructions 

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux (applicable to AMD64 and ARM64 Linux servers):

- [Installer script based deployment](/defender-endpoint/linux-installer-script)
- [Ansible based deployment](/defender-endpoint/linux-install-with-ansible)
- [Chef based deployment](/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef)
- [Puppet based deployment](/defender-endpoint/linux-install-with-puppet)
- [SaltStack based deployment](/defender-endpoint/linux-install-with-saltack)
- [Manual deployment](/defender-endpoint/linux-install-manually)
- [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
- [Guidance for Defender for Endpoint on Linux Server with SAP](/defender-endpoint/mde-linux-deployment-on-sap)

> [!IMPORTANT]
> Installing Microsoft Defender for Endpoint in any location other than the default install path isn't supported. On Linux, Microsoft Defender for Endpoint creates an mdatp user with random UID and GID values. If you want to control these values, create an mdatp user before installation using the `/usr/sbin/nologin` shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

If you experience any installation issues, self-troubleshooting resources are available. See the links in the [See also](#see-also) section.

## Next steps

- [Deploy Defender for Endpoint on Linux](/defender-endpoint/linux-installer-script)
- [Configure Defender for Endpoint on Linux](/defender-endpoint/linux-preferences)
- [Deploy updates for Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

## See also

- [Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus](mde-security-settings-management.md)
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)

> [!TIP]
> Do you want to learn more? Engage with the Microsoft Security community in our Tech Community: [Microsoft Defender for Endpoint Tech Community](https://techcommunity.microsoft.com/category/microsoft-defender-for-endpoint/discussions/microsoftdefenderatp)
