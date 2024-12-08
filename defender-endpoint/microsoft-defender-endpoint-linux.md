---
title: Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Describes how to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
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
ms.date: 12/04/2024
---

# Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

This article describes how to install, configure, update, and use Microsoft Defender for Endpoint on Linux.

> [!CAUTION]
> Running other non-Microsoft endpoint protection products alongside Microsoft Defender for Endpoint on Linux is likely to lead to performance problems and unpredictable side effects. If non-Microsoft endpoint protection is an absolute requirement in your environment, you can still safely take advantage of Defender for Endpoint on Linux EDR functionality after configuring antivirus functionality to run in [Passive mode](linux-preferences.md#enforcement-level-for-antivirus-engine).

## How to install Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint for Linux includes anti-malware and endpoint detection and response (EDR) capabilities.

### Prerequisites

- Access to the Microsoft Defender portal
- Linux distribution using the [systemd](https://systemd.io/)system manager

  > [!NOTE]
  > Linux distribution using system manager, support both SystemV and Upstart.

- Beginner-level experience in Linux and BASH scripting
- Administrative privileges on the device (for manual deployment)

> [!NOTE]
> Microsoft Defender for Endpoint on Linux agent is independent from [OMS agent](/azure/azure-monitor/agents/agents-overview#log-analytics-agent). Microsoft Defender for Endpoint relies on its own independent telemetry pipeline.

### Installation instructions

There are several methods and deployment tools that you can use to install and configure Microsoft Defender for Endpoint on Linux. Before you begin, make sure the [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md) are met.

You can use one of the following methods to deploy Microsoft Defender for Endpoint on Linux:

- To use command-line tool, see [Manual deployment](linux-install-manually.md)
- To use Puppet, see [Deploy using Puppet configuration management tool](linux-install-with-puppet.md)
- To use Ansible, see [Deploy using Ansible configuration management tool](linux-install-with-ansible.md)
- To use Chef, see [Deploy using Chef configuration management tool](linux-deploy-defender-for-endpoint-with-chef.md)
- To use Saltstack, see [Deploy using Saltstack configuration management tool](linux-install-with-saltack.md)

If you experience any installation failures, see [Troubleshooting installation failures in Microsoft Defender for Endpoint on Linux](linux-support-install.md).

> [!IMPORTANT]
> Installing Microsoft Defender for Endpoint in any location other than the default install path is not supported.
> Microsoft Defender for Endpoint on Linux creates an `mdatp` user with random UID and GID. If you want to control the UID and GID, create an `mdatp` user prior to installation using the  `/usr/sbin/nologin` shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

### System requirements

- Disk space: 2 GB

  > [!NOTE]
  > An additional 2 GB disk space might be needed if cloud diagnostics are enabled for crash collections. Please make sure that you have free disk space in /var.

- Cores: Two minimum, four preferred

  > [!NOTE]
  > If you are on Passive or RTP ON mode, at least two Cores are required. Four Cores are preferred. If you are turning on BM, then at least four Cores are required.

- Memory: 1 GB minimum, 4 GB preferred

- The following Linux server distributions and x64 (AMD64/EM64T) and x86_64 versions are supported:
  - Red Hat Enterprise Linux 7.2 or higher
  - Red Hat Enterprise Linux 8.x
  - Red Hat Enterprise Linux 9.x
  - CentOS 7.2 or higher
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
    
  > [!NOTE]
  > Distributions and version that are not explicitly listed are unsupported (even if they are derived from the officially supported distributions).
  > After a new package version is released, support for the previous two versions is reduced to technical support only. Versions older than that which are listed in this section are provided for technical upgrade support only.
  > Microsoft Defender Vulnerability Management is not supported on Rocky and Alma currently.
  > Microsoft Defender for Endpoint for all other supported distributions and versions is kernel-version-agnostic. With a minimal requirement for the kernel version to be at or greater than 3.10.0-327.

  > [!CAUTION]
  > Running Defender for Endpoint on Linux side by side with other `fanotify`-based security solutions is not supported. It can lead to unpredictable results, including hanging the operating system. If there are any other applications on the system that use `fanotify` in blocking mode, applications are listed in the `conflicting_applications` field of the `mdatp health` command output. The Linux **FAPolicyD** feature uses `fanotify` in blocking mode, and is therefore unsupported when running Defender for Endpoint in active mode. You can still safely take advantage of Defender for Endpoint on Linux EDR functionality after configuring the antivirus functionality Real Time Protection Enabled to [Passive mode](linux-preferences.md#enforcement-level-for-antivirus-engine).

- List of supported filesystems for RTP, Quick, Full, and Custom Scan.

   |RTP, Quick, Full Scan| Custom Scan|
   |---|---|
   |`btrfs`|All filesystems supported for RTP, Quick, Full Scan|
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
   |`tmpfs`||
   |`udf`||
   |`vfat`||
   |`xfs`||
    
- Audit framework (`auditd`) must be enabled if you're using auditd as your primary event provider.

  > [!NOTE]
  > System events captured by rules added to `/etc/audit/rules.d/` will add to `audit.log`(s) and might affect host auditing and upstream collection. Events added by Microsoft Defender for Endpoint on Linux will be tagged with `mdatp` key.

- /opt/microsoft/mdatp/sbin/wdavdaemon requires executable permission. For more information, see "Ensure that the daemon has executable permission" in [Troubleshoot installation issues for Microsoft Defender for Endpoint on Linux](linux-support-install.md).

### External package dependency

If the Microsoft Defender for Endpoint installation fails due to missing dependencies errors, you can manually download the prerequisite dependencies. The following external package dependencies exist for the mdatp package:

- The mdatp RPM package requires `glibc >= 2.17`, `audit`, `policycoreutils`, `semanage` `selinux-policy-targeted`, and `mde-netfilter`
- For RHEL6 the mdatp RPM package requires `audit`, `policycoreutils`, `libselinux`, and `mde-netfilter`
- For DEBIAN the mdatp package requires `libc6 >= 2.23`, `uuid-runtime`, `auditd`, and `mde-netfilter`

The mde-netfilter package also has the following package dependencies:

- For DEBIAN the mde-netfilter package requires `libnetfilter-queue1`, and `libglib2.0-0`
- For RPM the mde-netfilter package requires `libmnl`, `libnfnetlink`, `libnetfilter_queue`, and `glib2`

### Configuring Exclusions

When adding exclusions to Microsoft Defender Antivirus, you should be mindful of [Common Exclusion Mistakes for Microsoft Defender Antivirus](common-exclusion-mistakes-microsoft-defender-antivirus.md).

### Network connections

Ensure that connectivity is possible from your devices to Microsoft Defender for Endpoint cloud services. To prepare your environment, see [STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

Defender for Endpoint on Linux can connect through a proxy server by using the following discovery methods:

- Transparent proxy
- Manual static proxy configuration

If a proxy or firewall is blocking anonymous traffic, make sure that anonymous traffic is permitted in the previously listed URLs. For transparent proxies, no another configuration is needed for Defender for Endpoint. For static proxy, follow the steps in [Manual Static Proxy Configuration](linux-static-proxy-configuration.md).

> [!WARNING]
> PAC, WPAD, and authenticated proxies are not supported. Ensure that only a static proxy or transparent proxy is being used.
> SSL inspection and intercepting proxies are also not supported for security reasons. Configure an exception for SSL inspection and your proxy server to directly pass through data from Defender for Endpoint on Linux to the relevant URLs without interception. Adding your interception certificate to the global store will not allow for interception.

For troubleshooting steps, see [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md).

## How to update Microsoft Defender for Endpoint on Linux

Microsoft regularly publishes software updates to improve performance, security, and to deliver new features. To update Microsoft Defender for Endpoint on Linux, refer to [Deploy updates for Microsoft Defender for Endpoint on Linux](linux-updates.md).

## How to configure Microsoft Defender for Endpoint on Linux

Guidance for how to configure the product in enterprise environments is available in [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md).

## Common Applications to Microsoft Defender for Endpoint can impact

High I/O workloads from certain applications can experience performance issues when Microsoft Defender for Endpoint is installed. Such applications for developer scenarios include Jenkins and Jira, and database workloads like OracleDB and Postgres. If experiencing performance degradation, consider setting exclusions for trusted applications, keeping [Common Exclusion Mistakes for Microsoft Defender Antivirus](common-exclusion-mistakes-microsoft-defender-antivirus.md) in mind. For more guidance, consider consulting documentation regarding antivirus exclusions from non-Microsoft applications.

## Resources

- For more information about logging, uninstalling, or other articles, see [Resources](linux-resources.md).

## Related articles

- [Protect your endpoints with Defender for Cloud's integrated EDR solution: Microsoft Defender for Endpoint](/azure/defender-for-cloud/integration-defender-for-endpoint)
- [Connect your non-Azure machines to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-machines)
- [Turn on network protection for Linux](network-protection-linux.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
