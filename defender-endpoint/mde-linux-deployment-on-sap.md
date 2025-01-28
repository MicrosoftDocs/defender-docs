---
title: Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP 
description: Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP 
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.reviewer: cgardin  
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
ms.date: 01/06/2025
ms.custom: 
- partner-contribution
---

# Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

This article provides deployment guidance for Microsoft Defender for Endpoint on Linux for SAP. This article includes recommended SAP OSS (Online Services System) notes, the system requirements, prerequisites, important configuration settings, recommended antivirus exclusions, and guidance on scheduling antivirus scans.

Conventional security defenses that have been commonly used to protect SAP systems, such as isolating infrastructure behind firewalls and limiting interactive operating system logons, are no longer considered sufficient to mitigate modern sophisticated threats. It's essential to deploy modern defenses to detect and contain threats in real-time. SAP applications unlike most other workloads require basic assessment and validation before deploying Microsoft Defender for Endpoint. The enterprise security administrators should contact the SAP Basis team before deploying Defender for Endpoint. The SAP Basis Team should be cross trained with a basic level of knowledge about Defender for Endpoint.

## Recommended SAP OSS Notes

- [2248916 - Which files and directories should be excluded from an antivirus scan for SAP BusinessObjects Business Intelligence Platform products in Linux/Unix? - SAP ONE Support Launchpad](https://launchpad.support.sap.com/#/notes/2248916)
- [1984459 - Which files and directories should be excluded from an antivirus scan for SAP Data Services - SAP ONE Support Launchpad](https://launchpad.support.sap.com/#/notes/1984459)
- [2808515 - Installing security software on SAP servers running on Linux - SAP ONE Support Launchpad](https://launchpad.support.sap.com/#/notes/2808515)
- [1730930 - Using antivirus software in an SAP HANA appliance - SAP ONE Support Launchpad](https://launchpad.support.sap.com/#/notes/1730930)
- [1730997 - Unrecommended versions of antivirus software - SAP ONE Support Launchpad](https://launchpad.support.sap.com/#/notes/1730997)

## SAP Applications on Linux

> [!IMPORTANT]
> When you deploy Defender for Endpoint on Linux, eBPF is strongly advised. For more information, see [eBPF Documentation](https://ebpf.io/what-is-ebpf/). Defender for Endpoint has been enhanced to use the eBPF framework.
> 
> The supported distributions include all common Linux distributions but not Suse 12.x. Suse 12.x customers are advised to upgrade to Suse 15.  Suse 12.x uses an old `Audit.D` based sensor that has performance limitations.
> 
> For more information about support distributions, see [Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux](linux-support-ebpf.md).
> 

Here are some important point about SAP applications on Linux Server:

- SAP only supports Suse, Redhat, and Oracle Linux. Other distributions aren't supported for SAP S4 or NetWeaver applications.
- Suse 15.x, Redhat 9.x and Oracle Linux 9.x are strongly recommended. The supported distributions include all common Linux distributions but not Suse 12.x.
- Suse 11.x, Redhat 6.x and Oracle Linux 6.x aren't supported.
- Redhat 7.x and 8.x, and Oracle Linux 7.x and 8.x are technically supported, but are no longer tested in combination with SAP software.
- Suse and Redhat offer tailored distributions for SAP.  These "for SAP" versions of Suse and Redhat might have different packages preinstalled and possibly different kernels.
- SAP only supports certain Linux File systems. In general, XFS and EXT3 are used. Oracle Automatic Storage Management (ASM) filesystem is sometimes used for Oracle DBMS and can't be read by Defender for Endpoint.
- Some SAP applications use standalone engines, such as TREX, Adobe Document Server, Content Server, and LiveCache. These engines require specific configuration and file exclusions.
- SAP applications often have Transport and Interface directories with many thousands of small files. If the number of files is larger than 100,000, it might and affect performance. It's recommended to archive files.
- It's strongly recommended to deploy Defender for Endpoint to nonproductive SAP landscapes for several weeks before deploying to production. The SAP Basis Team should use tools, such as `sysstat`, `KSAR`, and `nmon` to verify if CPU and other performance parameters are impacted. It's also possible to configure broad exclusions with the global scope parameter and then incrementally reduce the number of directories that are excluded.

## Prerequisites for deploying Microsoft Defender for Endpoint on Linux on SAP VMs

- Microsoft Defender for Endpoint [Build: 101.24082.0004 | Release version: 30.124082.0004.0](/defender-endpoint/linux-whatsnew#oct-2024-build-101240820004--release-version-3012408200040) or later must be deployed.
- Microsoft Defender for Endpoint on Linux supports [Linux releases](microsoft-defender-endpoint-linux.md#system-requirements) used by SAP applications.
- Microsoft Defender for Endpoint on Linux requires connectivity to [specific Internet endpoints](microsoft-defender-endpoint-linux.md#network-connections) from VMs to update antivirus definitions.
- Microsoft Defender for Endpoint on Linux requires some `crontab` (or other task scheduler) entries to schedule scans, log rotation, and Microsoft Defender for Endpoint updates. Enterprise security teams normally manage these entries. For more information, see [How to schedule an update for Microsoft Defender for Endpoint on Linux](linux-update-mde-linux.md).

As of December  2024, Defender for Endpoint on Linux can safely be configured with real-time protection enabled. 

The default configuration option for deployment as an Azure Extension for Antivirus is *passive mode*. This means that Microsoft Defender Antivirus, the antivirus/anti-malware component of Microsoft Defender for Endpoint, doesn't intercept IO calls. We recommend running Defender for Endpoint in with real-time protection enabled on all SAP applications. As such:

- **Real-time protection is turned on**: Microsoft Defender Antivirus intercepts IO calls in real time.
- **On-demand scanning is turned on**: You can use scan capabilities on the endpoint.
- **Automatic threat remediation is turned on**: Files are moved and the security administrator is alerted.
- **Security intelligence updates are turned on**: Alerts are available in the [Microsoft Defender portal](https://security.microsoft.com).

Online Kernel patching tools, such as Ksplice or similar, can lead to unpredictable OS stability if Defender for Endpoint is running. It's recommended to temporarily stop the Defender for Endpoint daemon before performing online Kernel patching. After the Kernel is updated, Defender for Endpoint on Linux can be safely restarted. This action is especially important on large SAP HANA VMs with huge memory contexts.

When Microsoft Defender Antivirus is running with real-time protection, it's no longer required to schedule scans. You should run a scan at least once to set a baseline. Then, if necessary, the Linux crontab is typically used to schedule Microsoft Defender Antivirus scans and log rotation tasks. For more information, see [How to schedule scans with Microsoft Defender for Endpoint (Linux)](linux-schedule-scan-mde.md).

[Endpoint detection and response](overview-endpoint-detection-response.md) (EDR) functionality is active whenever Microsoft Defender for Endpoint on Linux is installed. EDR functionality can be disabled through command line or configuration by using [global exclusions](/defender-endpoint/linux-exclusions#supported-exclusion-scopes). For more information on troubleshooting EDR, see the sections [Useful Commands](#useful-commands) and [Useful Links](#useful-links) (in this article).

## Important configuration settings for Microsoft Defender for Endpoint on SAP on Linux  

It's recommended to check the installation and configuration of Defender for Endpoint with the command `mdatp health`.

The key parameters recommended for SAP applications are as follows:

```properties

healthy = true
release_ring = Production (Prerelease and insider rings shouldn't be used with SAP Applications.)
real_time_protection_enabled = true  (Real-time protection can be enabled for SAP NetWeaver applications and enables real-time IO interception.) 
automatic_definition_update_enabled = true
definition_status = "up_to_date" (Run a manual update if a new value is identified.)
edr_early_preview_enabled = "disabled" (If enabled on SAP systems it might lead to system instability.)
conflicting_applications = [ ] (Other antivirus or security software installed on a VM such as Clam.)
supplementary_events_subsystem = "ebpf" (Don't proceed if ebpf isn't displayed. Contact the security admin team.)

```

For information about troubleshooting installation issues, see [Troubleshoot installation issues for Microsoft Defender for Endpoint on Linux](linux-support-install.md#installation-failed).

## Recommended Microsoft Defender for Endpoint Antivirus Exclusions for SAP on Linux

Your enterprise security team must obtain a full list of antivirus [exclusions](/defender-endpoint/linux-exclusions) from the SAP Administrators (typically the SAP Basis Team). It's recommended to initially exclude:

- DBMS data files, log files, and temp files, including disks containing backup files
- The entire contents of the SAPMNT directory
- The entire contents of the SAPLOC directory
- The entire contents of the TRANS directory
- Hana – exclude /hana/shared, /hana/data, and /hana/log - see Note 1730930
- SQL Server – [Configure antivirus software to work with SQL Server](/troubleshoot/sql/database-engine/security/antivirus-and-sql-server)
- Oracle – See How To Configure Anti-Virus On Oracle Database Server (Doc ID 782354.1)
- DB2 – [IBM documentation: Which DB2 directories to exclude with antivirus software](https://www.ibm.com/support/pages/which-db2-directories-exclude-linux-anti-virus-software)
- SAP ASE – contact SAP
- MaxDB – contact SAP
- Adobe Document Server, SAP Archive Directories, TREX, LiveCache, Content Server, and other standalone engines must be tested carefully in nonproduction landscapes before deploying Defender for Endpoint in production 

Oracle ASM systems don't need exclusions as Microsoft Defender for Endpoint can't read ASM disks.

Customers with Pacemaker clusters should also configure these exclusions:

```bash

mdatp exclusion folder add --path /usr/lib/pacemaker/  (for RedHat /var/lib/pacemaker/)

```

```bash

mdatp exclusion process add --name pacemakerd

```

```bash

mdatp exclusion process add --name crm_*

```

Customers running the Azure Security security policy might trigger a scan using the Freeware Clam AV solution. It's recommended to disable Clam AV scan after a VM has been protected with Microsoft Defender for Endpoint using following commands:

```bash

sudo azsecd config  -s clamav -d "Disabled"

```

```bash

sudo service azsecd restart

```

```bash

sudo azsecd status 

```

The following articles detail how to configure antivirus exclusions for processes, files, and folders per individual VM:

- [Set up exclusions for Microsoft Defender Antivirus scans](configure-exclusions-microsoft-defender-antivirus.md)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)

## Scheduling a daily antivirus scan (optional)

The recommended configuration for SAP applications enables real-time interception of IO calls for antivirus scanning. The recommended setting is passive mode in which `real_time_protection_enabled = true`. 

SAP applications running on older versions of Linux or on hardware that's overloaded might consider using `real_time_protection_enabled = false`. In this case, antivirus scans should be scheduled.

For more information, see [How to schedule scans with Microsoft Defender for Endpoint (Linux)](linux-schedule-scan-mde.md).

Large SAP systems might have more than 20 SAP application servers, each with a connection to the SAPMNT NFS share. Twenty or more application servers simultaneously scanning the same NFS server will likely overload the NFS server. By default, Defender for Endpoint on Linux doesn't scan NFS sources.

If there's a requirement to scan SAPMNT, then this scan should be configured on one or two VMs only.

Scheduled scans for SAP ECC, BW, CRM, SCM, Solution Manager, and other components should be staggered at different times to avoid all SAP components from overloading a shared NFS storage source shared by all SAP components.

## Useful Commands

If, during manual zypper installation on Suse an error "Nothing provides 'policycoreutils'" occurs, see [Troubleshoot installation issues for Microsoft Defender for Endpoint on Linux](linux-support-install.md).

There are several command-line commands that can control the operation of mdatp. To enable passive mode, you can use the following command:

```bash

mdatp config passive-mode --value enabled

```

> [!NOTE]
> Passive mode is the default mode when installing Defender for Endpoint on Linux.

To turn on real-time protection, you can use the command:

```bash

mdatp config real-time-protection --value enabled

```

This command tells mdatp to retrieve the latest definitions from the cloud:

```bash

mdatp definitions update 

```

This command tests whether mdatp can connect to the cloud-based endpoints on the network:

```bash

mdatp connectivity test

```

These commands update the mdatp software, if needed:

```bash

yum update mdatp

```

```bash

zypper update mdatp

```

Since mdatp runs as a linux system service, you can control mdatp using the service command, for example:

```bash

service mdatp status 

```

This command creates a diagnostic file that can be uploaded to Microsoft support:

```bash

sudo mdatp diagnostic create

```

## Useful Links

- To analyze performance or other issues, see [Run the client analyzer on Linux](run-analyzer-linux.md).

- Microsoft Intune doesn't support Linux at this time. See [Learn how to use Intune endpoint security policies to manage Microsoft Defender for Endpoint on devices that are not enrolled with Intune](/mem/intune/protect/mde-security-integration).

- [Microsoft Tech Community: Microsoft Defender for Endpoint Linux - Configuration and Operation Command List](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/microsoft-defender-for-endpoint-linux-configuration-and/ba-p/1577902)

- [Microsoft Tech Community: Deploying Microsoft Defender for Endpoint on Linux Servers](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/deploying-microsoft-defender-for-endpoint-on-linux-servers/ba-p/1560326)

- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md#run-the-connectivity-test)

- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md#troubleshoot-performance-issues-using-microsoft-defender-for-endpoint-client-analyzer)

## Related articles

- [Onboard servers to Microsoft Defender for Endpoint](onboard-server.md)
- [Microsoft Defender for Endpoint on Windows Server with SAP](mde-sap-windows-server.md)
