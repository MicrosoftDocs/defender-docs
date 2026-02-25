---
title: Prerequisites for Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Describes the requirements needed to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
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
ms.date: 02/03/2026
---

# Prerequisites for Microsoft Defender for Endpoint on Linux

> [!TIP]
> Microsoft Defender for Endpoint on Linux now extends support for Arm64-based Linux servers in GA.

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
- For installation at a custom path, refer to [Prerequisites and system requirements for custom location installation](linux-custom-location-installation.md#prerequisites-and-system-requirements).

> [!NOTE]
> Performance tuning might be needed based on workloads. For more information, see [Performance tuning for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-perf)

## Software requirements

Linux server endpoints should have systemd (system manager) installed.

> [!NOTE] 
> Linux distributions using system manager support both SystemV and Upstart.
> The Microsoft Defender for Endpoint on Linux agent is independent from [Operation Management Suite (OMS) agent](/azure/azure-monitor/agents/azure-monitor-agent-overview#log-analytics-agent).
> Microsoft Defender for Endpoint relies on its own independent telemetry pipeline.

### External package dependencies

The following external package dependencies exist for the mdatp package:

- The mdatp RPM package requires `glibc >= 2.17`.
- For DEBIAN, the mdatp package requires `libc6 >= 2.23`.

To use the [device isolation functionality](./respond-machine-alerts.md#isolate-devices-from-the-network), the following prerequisites must be enabled:

- `iptables`
- `ip6tables`
- Linux kernel with `CONFIG_NETFILTER`, `CONFIG_IP_NF_IPTABLES`, and `CONFIG_IP_NF_MATCH_OWNER` for kernel version lower than 5.x and `CONFIG_NETFILTER_XT_MATCH_OWNER` from 5.x kernel.

If the Microsoft Defender for Endpoint installation fails due to missing dependencies errors, you can manually download the prerequisite dependencies.

## Roles and permissions

- Administrative privileges on the Linux server endpoint are required for installation.
- An appropriate role assigned in Defender for Endpoint. See [Role-based access control](/defender-endpoint/prepare-deployment#role-based-access-control).

## Supported Linux distributions

The following Linux server distributions are supported:

| Distribution | x64 (AMD64/EM64T) | ARM64 (GA) |
|---|---|---|
| Red Hat Enterprise Linux | 7.2+, 8.x, 9.x, 10.x | 8.x, 9.x, 10.x |
| CentOS | 7.2+, 8.x | — |
| CentOS Stream | 8.x, 9.x, 10.x | 8.x, 9.x, 10.x |
| Ubuntu LTS | 16.04–24.04 | 20.04, 22.04, 24.04 |
| Ubuntu Pro | 22.04, 24.04 | 22.04, 24.04 |
| Debian | 9–13 | 11, 12 |
| SUSE Linux Enterprise Server | 12.x, 15.x | 15 (SP5, SP6) |
| Oracle Linux | 7.2+, 8.x, 9.x | 8.x, 9.x |
| Amazon Linux | 2, 2023 | 2, 2023 |
| Fedora | 33–42 | — |
| Rocky Linux | 8.7+, 9.2+ | — |
| AlmaLinux | 8.4+, 9.2+ | — |
| Mariner | 2 | — |

> [!NOTE]
> Distributions and versions that aren't explicitly listed above, and custom operating systems, are unsupported (even if they're derived from the officially supported distributions).
> Microsoft Defender for Endpoint is kernel-version agnostic for all other supported distributions and versions. The minimal requirement for the kernel version is `3.10.0-327` or later.

> [!WARNING]
> Running Defender for Endpoint on Linux alongside other fanotify-based security solutions is not supported and may lead to unpredictable behavior, including system hangs.
> If any applications use fanotify in blocking mode, they will appear in the conflicting_applications field of the mdatp health command output.
> You can still safely take advantage of Defender for Endpoint on Linux by setting antivirus enforcement level to passive. See [Configure security settings in Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-preferences).
> **EXCEPTION:** The Linux `FAPolicyD` feature, which also uses Fanotify in blocking mode, is supported with Defender for Endpoint in active mode on RHEL and Fedora platforms, provided that mdatp health reports a healthy status. This exception is based on validated compatibility specific to these distributions.

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
> To scan NFS v3 mount points, make sure to set the `no_root_squash` export option. Without this option, scanning NFS v3 can potentially fail due to lack of permissions.

## Network connectivity requirements

Ensure the following URLs are allowed in network configurations:

- `https://config.edge.skype.com/config/v1` (default)
- `https://config.ecs.dod.teams.microsoft.us/config/v1`
- `https://config.ecs.gov.teams.microsoft.us/config/v1`
- `https://gccmod.ecs.office.com/config/v1`

- Linux server endpoints should be able to access the `*.endpoint.security.microsoft.com`. If necessary, [configure static proxy discovery](linux-static-proxy-configuration.md).

### Verify if devices can connect to Defender for Endpoint cloud services

1. Prepare your environment, as described in Step 1 of the following article [Configure your network environment to ensure connectivity with Defender for Endpoint service](/defender-endpoint/configure-environment).

1. Connect Defender for Endpoint on Linux through a proxy server by using the following discovery methods:

   - Transparent proxy
   - [Manual static proxy configuration](/defender-endpoint/linux-static-proxy-configuration#installation-time-configuration)

1. Permit anonymous traffic in the previously listed URLs, if a proxy or firewall blocks traffic.

> [!NOTE]
> Configuration for transparent proxies isn't needed for Defender for Endpoint. See [Manual Static Proxy Configuration.](/defender-endpoint/linux-static-proxy-configuration)

> [!WARNING]
> PAC, WPAD, and authenticated proxies aren't supported.
> Use only static or transparent proxies.
> SSL inspection and intercepting proxies aren't supported for security reasons.
> Configure an exception for SSL inspection and your proxy server to allow direct data pass-through from Defender for Endpoint on Linux to the relevant URLs without interception.
> Adding your interception certificate to the global store doesn't enable interception.

For troubleshooting steps, see [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-connectivity).

## Verify prerequisites


## Installation instructions 

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux (applicable to AMD64 and ARM64 Linux servers):

 > [!NOTE] 
 > It is recommended to use [Deployment Tool based deployment](/defender-endpoint/linux-install-with-defender-deployment-tool),  as it simplifies the onboarding process, reduces manual tasks, and supports a wide range of deployment scenarios, including new installations, upgrades, and uninstalls. Please refer to the [documentation](/defender-endpoint/linux-install-with-defender-deployment-tool) for details.

- [Deployment tool based deployment (Recommended)](./linux-install-with-defender-deployment-tool.md)
- [Installer script based deployment](/defender-endpoint/linux-installer-script)
- [Ansible based deployment](/defender-endpoint/linux-install-with-ansible)
- [Chef based deployment](/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef)
- [Puppet based deployment](/defender-endpoint/linux-install-with-puppet)
- [SaltStack based deployment](/defender-endpoint/linux-install-with-saltack)
- [Golden Image based deployment](/defender-endpoint/linux-deploy-defender-for-endpoint-using-golden-images)
- [Deployment to a custom location](/defender-endpoint/linux-custom-location-installation)
- [Manual deployment](/defender-endpoint/linux-install-manually)
- [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
- [Guidance for Defender for Endpoint on Linux Server with SAP](/defender-endpoint/mde-linux-deployment-on-sap)

> [!IMPORTANT]
> On Linux, Microsoft Defender for Endpoint creates an mdatp user with random UID and GID values. If you want to control these values, create an mdatp user before installation using the `/usr/sbin/nologin` shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

If you experience any installation issues, self-troubleshooting resources are available. See the links in the [Related content section](#related-content).

## Next steps

- [Deploy Defender for Endpoint on Linux](/defender-endpoint/linux-installer-script)
- [Configure Defender for Endpoint on Linux](/defender-endpoint/linux-preferences)
- [Deploy updates for Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

## Related content

- [Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus](mde-security-settings-management.md)
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)
- [Install Defender for Endpoint on Linux to a custom path](linux-custom-location-installation.md)


