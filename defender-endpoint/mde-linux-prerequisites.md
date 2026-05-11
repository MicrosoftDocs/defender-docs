---
title: Prerequisites for Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Describes the requirements needed to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: article
ms.subservice: linux
ms.date: 04/30/2026
---

# Prerequisites for Microsoft Defender for Endpoint on Linux

This article lists the prerequisites for deploying and onboarding Defender for Endpoint on Linux servers.

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
> Performance tuning might be needed based on workloads. For more information, see [Performance tuning for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)

## Software requirements

- Linux server endpoints should have systemd (system manager) installed.

> [!NOTE]
> Linux distributions using system manager support both SystemV and Upstart.
> The Microsoft Defender for Endpoint on Linux agent is independent from [Operation Management Suite (OMS) agent](/azure/azure-monitor/agents/azure-monitor-agent-overview#log-analytics-agent).
> Microsoft Defender for Endpoint relies on its own independent telemetry pipeline.

- To use [device isolation functionality](./respond-machine-alerts.md#isolate-devices-from-the-network), the following must be enabled:

   - `iptables`
   - `ip6tables`
   - Linux kernel with `CONFIG_NETFILTER`, `CONFIG_IP_NF_IPTABLES`, and `CONFIG_IP_NF_MATCH_OWNER` for kernel version lower than 5.x and `CONFIG_NETFILTER_XT_MATCH_OWNER` from 5.x kernel.


> [!NOTE]
> **Hostname**
>
> Defender for Endpoint reads the device host name from the kernel host name, which Linux distributions initialize from `/etc/hostname` at boot. Make sure
`/etc/hostname` contains the correct host name before you install — it's used to identify the device in the Defender portal, so an empty or incorrect value reports the device under the wrong name.
>
> To display the host name that Defender for Endpoint will use, run:
>
> ```bash
> hostname
> ```
>
> If the value is empty or incorrect, set it before installing:
>
> ```bash
> sudo hostnamectl set-hostname <your-host-name>
> ```

## Network requirements

Linux server endpoints should be able to access the endpoints documented in:
- [Microsoft Defender for Endpoint streamlined connectivity URLs - commercial](./streamlined-device-connectivity-urls-commercial.md) (commercial customers)
- [Microsoft Defender for Endpoint streamlined connectivity URLs - US government environments](./streamlined-device-connectivity-urls-gov.md) (US Government customers).

If necessary, [configure static proxy discovery](./linux-static-proxy-configuration.md).

> [!WARNING]
> PAC, WPAD, and authenticated proxies aren't supported. Use only static or transparent proxies.
> SSL/TLS inspection and intercepting proxies aren't supported and **must be disabled** for Defender for Endpoint service URLs. They break the certificate chain that the agent relies on and prevent it from connecting to the cloud service.
> Configure an exception so traffic from Defender for Endpoint on Linux to the relevant URLs passes through without interception. Adding your interception certificate to the global store doesn't enable interception.

### Verify if devices can connect to Defender for Endpoint cloud services

1. Prepare your environment, as described in Step 1 of the following article [Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

1. Connect Defender for Endpoint on Linux through a proxy server by using the following discovery methods:

   - Transparent proxy
   - [Manual static proxy configuration](linux-static-proxy-configuration.md#installation-time-configuration)

1. Permit anonymous traffic in the previously listed URLs, if a proxy or firewall blocks traffic.

> [!NOTE]
> Configuration for transparent proxies isn't needed for Defender for Endpoint. See [Manual Static Proxy Configuration.](linux-static-proxy-configuration.md)

For troubleshooting steps, see [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md).

## Supported Linux distributions

The following Linux server distributions are supported:

| Distribution | x64 (AMD64/EM64T) | ARM64 |
|---|---|---|
| Red Hat Enterprise Linux | 7.2+, 8.x, 9.x, 10.x | 8.x, 9.x, 10.x |
| CentOS | 7.2+, 8.x | - |
| CentOS Stream | 8.x, 9.x, 10.x | 8.x, 9.x, 10.x |
| Ubuntu LTS | 16.04, 18.04, 20.04, 22.04,24.04 | 20.04, 22.04, 24.04 |
| Ubuntu Pro | 22.04, 24.04 | 22.04, 24.04 |
| Debian | 9–13 | 11, 12, 13 |
| SUSE Linux Enterprise Server | 12.x, 15.x | 15 (SP5, SP6) |
| Oracle Linux | 7.2+, 8.x, 9.x | 8.x, 9.x |
| Amazon Linux | 2, 2023 | 2, 2023 |
| Fedora | 33–42 | - |
| Rocky Linux | 8.7+, 9.2+ | 8.7+, 9.2+ |
| Alma Linux | 8.4+, 9.2+ | 8.4+, 9.2+ |
| Mariner | 2 | 2 |

> [!NOTE]
> Distributions and versions that aren't explicitly listed above are unsupported
> Microsoft Defender for Endpoint is kernel-version agnostic for all other supported distributions and versions. The minimal requirement for the kernel version is `3.10.0-327` or later.
> 
> Microsoft Defender for Endpoint on Linux **can be installed and may function** on customized operating systems that meet minimal kernel requirements and are derived from known, standard, vendor‑provided Linux distributions that Microsoft supports. Customers are free to onboard and run Defender for Endpoint on such environments; Microsoft doesn't block onboarding or execution.
> However, these customized environments aren't part of Microsoft's validated or maintained support baseline. As a result, they're treated as custom OS configurations from a support perspective.
> Customers are expected to validate Defender for Endpoint within these custom environments and, if needed, reproduce issues on a supported, standard (unmodified) Linux distribution. If an issue can't be reproduced on a supported standard base distribution, Microsoft might not be able to proceed with further investigation or remediation.
> For full support coverage and a predictable support experience, customers are recommended to run Defender for Endpoint on a supported, vendor-provided Linux distribution as outlined in the official prerequisites.

> [!WARNING]
> Running Defender for Endpoint on Linux alongside other Fanotify-based security solutions isn't supported and may lead to unpredictable behavior, including system hangs.
> If any applications use Fanotify in blocking mode, they'll appear in the conflicting_applications field of the mdatp health command output.
> You can still safely take advantage of Defender for Endpoint on Linux by setting antivirus enforcement level to passive. See [Configure security settings in Microsoft Defender for Endpoint on Linux](linux-preferences.md).
> **EXCEPTION:** The Linux `FAPolicyD` feature, which also uses Fanotify in blocking mode, is supported with Defender for Endpoint in active mode on RHEL and Fedora platforms, provided that mdatp health reports a healthy status. This exception is based on validated compatibility specific to these distributions.

## Supported filesystems for real-time protection and quick, full, and custom scans

|Real-time protection and quick/full scans|Custom scans|
|---|---|
|`btrfs`|All filesystems that are supported for real-time protection and quick/full scans are also supported for custom scans. In addition, the filesystems listed below are also supported for custom scans.|
|`ecryptfs`|`Efs`|
|`ext2`|`S3fs`|
|`ext3`|`Blobfuse`|
|`ext4`|`Lustr`|
|`fuse`|`glustrefs`|
|`fuseblk`|`Afs`|
|`jfs`|`sshfs`|
|`nfs` (v3)|`cifs`|
|`nfs4`|`smb`|
|`overlay`|`gcsfuse`|
|`ramfs`|`sysfs`|
|`reiserfs`||
|`tmpfs`||
|`udf`||
|`vfat`||
|`xfs`||

> [!NOTE]
> To scan NFS v3 mount points, make sure to set the `no_root_squash` export option. Without this option, scanning NFS v3 can potentially fail due to lack of permissions.

## Roles and permissions

- Administrative privileges on the Linux server endpoint are required for installation.
- An appropriate role assigned in Defender for Endpoint. See [Role-based access control](prepare-deployment.md#role-based-access-control).

## Installation methods and tools

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on [supported Linux servers](#supported-linux-distributions).

It's recommended to use Deployment Tool based deployment, as it simplifies the onboarding process, reduces manual tasks, and supports a wide range of deployment scenarios, including new installations, upgrades, and uninstalls. For more information, see [Deploy Microsoft Defender endpoint security to Linux devices using the Defender deployment tool (preview)](linux-install-with-defender-deployment-tool.md).

Before you install, validate the prerequisites with the installer's built-in prerequisite-check mode. This runs the kernel, glibc, fanotify, disk, memory, supported-distro, and filesystem checks without installing anything:

```bash
curl -o mde_installer.sh "https://go.microsoft.com/fwlink/?linkid=2313015"
chmod +x mde_installer.sh
sudo ./mde_installer.sh --pre-req
```
- [Deployment tool based deployment (Recommended)](./linux-install-with-defender-deployment-tool.md)
- [Installer script based deployment](linux-installer-script.md)
- [Ansible based deployment](linux-install-with-ansible.md)
- [Chef based deployment](linux-deploy-defender-for-endpoint-with-chef.md)
- [Puppet based deployment](linux-install-with-puppet.md)
- [SaltStack based deployment](linux-install-with-saltack.md)
- [Golden Image based deployment](linux-deploy-defender-for-endpoint-using-golden-images.md)
- [Deployment to a custom location](linux-custom-location-installation.md)
- [Manual deployment](linux-install-manually.md)
- [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
- [Guidance for Defender for Endpoint on Linux Server with SAP](mde-linux-deployment-on-sap.md)

> [!IMPORTANT]
> On Linux, Microsoft Defender for Endpoint creates a mdatp user with random UID and GID values. If you want to control these values, create a mdatp user before installation using the `/usr/sbin/nologin` shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

If you experience any installation issues, self-troubleshooting resources are available. See the links in the [Related content section](#related-content).

## Next steps

- [Deploy Defender for Endpoint on Linux](./linux-install-with-defender-deployment-tool.md)
- [Configure Defender for Endpoint on Linux](linux-preferences.md)
- [Deploy updates for Defender for Endpoint on Linux](linux-updates.md)

## Related content

- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus</a>
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)
- [Install Defender for Endpoint on Linux to a custom path](linux-custom-location-installation.md)
