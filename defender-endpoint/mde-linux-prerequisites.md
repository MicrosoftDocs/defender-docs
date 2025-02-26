---
title: Requirements for Microsoft Defender for Endpoint on Linux
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
ms.date: 02/26/2025
---

# Requirements for Microsoft Defender for Endpoint on Linux

>[!TIP] We're excited to share that Microsoft Defender for Endpoint on Linux now extends support for ARM64-based Linux servers in preview! For more information, see Microsoft Defender for Endpoint on Linux for ARM64-based devices (preview).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Want to experience Microsoft Defender for Endpoint? Sign up for a free trial.

This article lists hardware and software requirements for Microsoft Defender for Endpoint on Linux.

## Software Requirements 

1. Access to the Microsoft Defender portal. Configure proxy if required. Learn more 

2. Linux distribution using the systemdsystem manager 

3. Beginner-level experience in Linux and BASH scripting 

4. Administrative privileges on the device (for manual deployment) 

5. /opt/microsoft/mdatp/sbin/wdavdaemon requires executable permission 

>[!NOTE]: Linux distribution using system manager supports both SystemV and Upstart. Microsoft Defender for Endpoint on Linux agent is independent from Operation Management Suite (OMS) agent. 
>Microsoft Defender for Endpoint relies on its own independent telemetry pipeline. 

## System Requirements 

1. **CPU**: 1 CPU core minimum. For high-performance workloads, more cores are recommended. 

2. **Disk Space**: 2 GB minimum. For high-performance workloads, more disk space might be needed. 

3. **Memory**: 1 GB of RAM minimum. For high-performance workloads, more memory might be needed. 

>[!NOTE]: Performance tuning might be needed based on workloads. 
>See Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux. 

## List of Supported Linux distributions 

The following Linux server distributions and x64 (AMD64/EM64T) versions are supported: 

Red Hat Enterprise Linux 7.2 or higher 

Red Hat Enterprise Linux 8.x 

Red Hat Enterprise Linux 9.x 

CentOS 7.2 or higher, excluding CentOS Stream 

Ubuntu 16.04 LTS 

Ubuntu 18.04 LTS 

Ubuntu 20.04 LTS 

Ubuntu 22.04 LTS 

Ubuntu 24.04 LTS 

Debian 9 - 12 

SUSE Linux Enterprise Server 12.x 

SUSE Linux Enterprise Server 15.x 

Oracle Linux 7.2 or higher 

Oracle Linux 8.x 

Oracle Linux 9.x 

Amazon Linux 2 

Amazon Linux 2023 

Fedora 33-38 

Rocky 8.7 and higher 

Rocky 9.2 and higher 

Alma 8.4 and higher 

Alma 9.2 and higher 

Mariner 2 

The following Linux server distributions on ARM64 are now supported in preview: 

Ubuntu 20.04 ARM64 

Ubuntu 22.04 ARM64 

Amazon Linux 2 ARM64 

Amazon Linux 2023 ARM64 

>[!IMPORTANT]: Support for Microsoft Defender for Endpoint on Linux for ARM64-based Linux devices is now in preview. 
>For more information, see Microsoft Defender for Endpoint on Linux for ARM64-based devices (preview).

>[!NOTE]: The workstation/desktop versions of these distributions are unsupported. Distributions and versions that aren't explicitly listed are unsupported (even if they're derived from the officially supported distributions). 
>After a new package version is released, support for the previous two versions is reduced to technical support only. Versions older than that which are listed in this section are provided for technical upgrade support only. 
>Currently, Rocky and Alma distributions aren't supported in Microsoft Defender Vulnerability Management. Microsoft Defender for Endpoint for all other supported distributions and versions is kernel-version agnostic. 
>The minimal requirement for the kernel version to be 3.10.0-327 or later. 

>[!WARNING]: Running Defender for Endpoint on Linux side by side with other fanotify-based security solutions isn't supported. It can lead to unpredictable results, including hanging the operating system. 
>If there are any other applications on the system that use fanotify in blocking mode, applications are listed in the conflicting_applications field of the mdatp health command output.
>The Linux FAPolicyD feature uses fanotify in blocking mode, and is therefore unsupported when running Defender for Endpoint in active mode
>You can still safely take advantage of Defender for Endpoint on Linux EDR functionality after configuring the antivirus functionality Real Time Protection Enabled to passive mode. See Enforcement level for Microsoft Defender Antivirus. 

## List of supported filesystems for RTP, Quick, Full, and Custom Scan. 

 

RTP, Quick, Full Scan 

Custom Scan 

btrfs 

All filesystems supported for RTP, Quick, Full Scan 

ecryptfs 

Efs 

ext2 

S3fs 

ext3 

Blobfuse 

ext4 

Lustr 

fuse 

glustrefs 

fuseblk 

Afs 

jfs 

sshfs 

nfs (v3 only) 

cifs 

overlay 

smb 

ramfs 

gcsfuse 

reiserfs 

sysfs 

tmpfs 

 

udf 

 

vfat 

 

xfs 

 

 

>[!Note]: For NFS v3 mount points to be scanned thoroughly, it is required to set the no_root_squash export option on these mount points
>Without this option, scanning NFS v3 can potentially fail due to lack of permissions. 
>Starting with version 101.24082.0004, Defender for Endpoint on Linux no longer supports the Auditd event provider. We're transitioning completely to the more efficient extended Berkeley Packet Filter (eBPF) technology. 
>If eBPF isn't supported on your machines, or if there are specific requirements to remain on Auditd, and your machines are using Defender for Endpoint on Linux version 101.24072.0001 or lower, then Audit framework (auditd) must be enabled on your system. 
>If you're using Auditd, then system events captured by rules added to /etc/audit/rules.d/ adds to audit.log(s) and might affect host auditing and upstream collection. 
>Events added by Microsoft Defender for Endpoint on Linux are tagged with the mdatp key. 

/opt/microsoft/mdatp/sbin/wdavdaemon requires executable permission. For more information, see Troubleshoot installation issues for Microsoft Defender for Endpoint on Linux. 

# Installation instructions 

## Network connections 

- Ensure that connectivity is possible from your devices to Microsoft Defender for Endpoint cloud services. To prepare your environment, see STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service. 

Defender for Endpoint on Linux can connect through a proxy server by using the following discovery methods: 

Transparent proxy 

Manual static proxy configuration 

If a proxy or firewall is blocking anonymous traffic, make sure that anonymous traffic is permitted in the previously listed URLs. For transparent proxies, no another configuration is needed for Defender for Endpoint. For static proxy, follow the steps in Manual Static Proxy Configuration. 

>[!Warning]:
>PAC, WPAD, and authenticated proxies aren't supported. Ensure that only a static proxy or transparent proxy is being used. 
>SSL inspection and intercepting proxies are also not supported for security reasons. #
>Configure an exception for SSL inspection and your proxy server to directly pass through data from Defender for Endpoint on Linux to the relevant URLs without interception. 
>Adding your interception certificate to the global store won't allow for interception. 

For troubleshooting steps, see Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux. 

 

## External package dependency 

See also 

Microsoft Defender for Endpoint on Linux 

Deploy Microsoft Defender for Endpoint on Linux 

Configure security settings and policies for Microsoft Defender for Endpoint on Linux 

 