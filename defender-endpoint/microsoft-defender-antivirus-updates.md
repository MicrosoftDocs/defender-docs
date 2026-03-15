---
title: Microsoft Defender Antivirus security intelligence and product updates
description: Manage how Microsoft Defender Antivirus receives protection and product updates.
ms.service: defender-endpoint
ms.localizationpriority: high
ms.date: 10/20/2025
audience: ITPro
ms.topic: reference
author: chrisda
ms.author: chrisda
ms.subservice: ngp
search.appverid: met150
appliesto:
- Microsoft Defender for Endpoint Plan 1
- Microsoft Defender for Endpoint Plan 2
---

# Microsoft Defender Antivirus security intelligence and product updates and support

Keeping Microsoft Defender Antivirus up to date is critical to assure your devices are protected against new malware and attack techniques. Update your antivirus protection, even if Microsoft Defender Antivirus is running in [passive mode](microsoft-defender-antivirus-compatibility.md). You can find the lates engine, platform, and signature date in [Security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware](https://www.microsoft.com/wdsi/defenderupdates).

This article is aimed at **Windows** devices, and includes information about [security intelligence updates](#security-intelligence-updates) and [product updates](#product-updates).

For a list of the latest **security intelligence and product versions**, see [Microsoft Defender for Endpoint supported releases](microsoft-defender-endpoint-releases.md#microsoft-defender-antivirus-releases).

## Security intelligence updates

Microsoft Defender Antivirus uses [cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md), also known as *Microsoft Advanced Protection Service*, or *MAPS*. Defender Antivirus periodically downloads dynamic security [intelligence updates](https://www.microsoft.com/en-us/wdsi/defenderupdates). These updates don't replace regular security intelligence updates. Engine updates are included with security intelligence updates and are released monthly.

Updates are released under the following KBs:

- Microsoft Defender Antivirus: KB2267602

- System Center Endpoint Protection: KB2461484

[Cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md) is always on and requires an active connection to the internet to function. Security intelligence updates occur on a scheduled cadence which you can configure using a policy.

## Product updates

Microsoft Defender Antivirus requires monthly updates (KB4052623) known as *platform updates*.

You can manage the distribution of updates using one of the following methods:

- [Windows Server Update Service (WSUS)](/intune/configmgr/protect/deploy-use/endpoint-definitions-wsus#to-synchronize-endpoint-protection-definition-updates-in-standalone-wsus)
- [Microsoft Configuration Manager](/intune/configmgr/sum/understand/software-updates-introduction)
- The usual methods you use to deploy Microsoft and Windows updates to endpoints in your network.
- UNC Share

For more information, see [Manage the sources for Microsoft Defender Antivirus protection updates](/intune/configmgr/protect/deploy-use/endpoint-definitions-wsus#to-synchronize-endpoint-protection-definition-updates-in-standalone-wsus).

### Important points about product updates

- Monthly updates are released in phases, resulting in multiple packages visible in your [Window Server Update Services](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus).

- This article lists changes that are included in the broad release channel. [See the latest broad channel release here](https://www.microsoft.com/security/encyclopedia/adlpackages.aspx?action=info).

- To learn more about the gradual rollout process, and to see more information about the next release, see [Manage the gradual rollout process for Microsoft Defender updates](manage-gradual-rollout.md).

- To learn more about security intelligence updates, see [Security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware](https://www.microsoft.com/wdsi/defenderupdates).

- If you're looking for a list of Microsoft Defender processes, see the spreadsheet provided at [Enable access to Microsoft Defender for Endpoint service URLs in the proxy server](configure-environment.md#enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server). The sheet also lists the services and their associated URLs that your network must be able to connect to.

- Platform updates can be temporarily postponed if other protection features, such as [Endpoint DLP](/Microsoft-365/compliance/endpoint-dlp-getting-started) or [Device Control](device-control-report.md) are actively monitoring running processes. Platform updates are retried after a reboot or when all monitored services are stopped.

- In the **Microsoft Configuration Manager / Windows Server Update Services** (MCM/WSUS) catalog, the category **Microsoft Defender for Endpoint** includes updates for the `MSSense` service in [KB5005292](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5005292). KB5005292 includes updates and fixes to the Microsoft Defender for Endpoint **endpoint detection and response** (EDR) sensor. For more information, see [Microsoft Defender for Endpoint update for EDR Sensor](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac) and [What's new in Microsoft Defender for Endpoint on Windows](microsoft-defender-endpoint-releases.md#windows-releases).

### Previous version updates: Technical upgrade support only

After a new package version is released, support for the previous two versions is reduced to technical upgrade support only. For more information about previous versions, see [Microsoft Defender Antivirus updates: Previous versions for technical upgrade support](msda-updates-previous-versions-technical-upgrade-support.md).

## Platform and engine releases

See [Microsoft Defender Antivirus platform and engine support](#microsoft-defender-antivirus-platform-and-engine-support).

## Microsoft Defender Antivirus platform and engine support

Platform and engine updates are provided on a monthly cadence. To be fully supported, keep current with the latest platform and engine updates. Our support structure is dynamic, evolving into two phases depending on the availability of the latest platform and engine version:

- **Security and Critical Updates servicing phase** - When running the latest platform and engine version, you're eligible to receive both Security and Critical updates to the anti-malware platform.

- **Technical Upgrade Support (Only) phase** - After a new platform and engine version is released, support for older versions (N-2) reduce to [technical upgrade support only](msda-updates-previous-versions-technical-upgrade-support.md). Platform and engine versions older than N-2 are no longer supported. Technical upgrade support continues to be provided for upgrades from the Windows 10 release version (see [Platform version included with Windows 10 releases](#platform-version-included-with-windows-10-releases)) to the latest platform version.

During the technical upgrade support (only) phase, commercially reasonable support incidents are provided through Microsoft Customer Service & Support and Microsoft's managed support offerings (such as Premier Support). If a support incident requires escalation to development for further guidance, requires a nonsecurity update, or requires a security update, customers are asked to upgrade to the latest platform version or an intermediate update (*).

> [!NOTE]
> If you're manually deploying Microsoft Defender Antivirus Platform Update, or if you're using a script or a non-Microsoft management product to deploy Microsoft Defender Antivirus Platform Update, make sure that version `4.18.2001.10` is installed from the [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=4.18.2001.10) before the latest version of Platform Update (N-2) is installed.

## How to install an update

To install the latest security intelligence and antivirus engine updates, you can use any of the following methods:

- Windows Update
- Windows Update server (WSUS)
- Software Update Point (SUP)
- [File server](/defender-endpoint/manage-protection-updates-microsoft-defender-antivirus)
- Windows Security app: See [Microsoft Defender Antivirus in the Windows Security app](/defender-endpoint/microsoft-defender-security-center-antivirus)
- Command line, as follows:   
   - `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -SignatureUpdate`
   - `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -SignatureUpdate \\FileServer\ShareName`
   - `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -SignatureUpdate -MMPC`

For more information, see [Manage the sources for Microsoft Defender Antivirus protection updates](/defender-endpoint/manage-protection-updates-microsoft-defender-antivirus).

To get the latest platform updates, you can use any of the following methods: 

- Windows Update
- Windows Update server (WSUS)
- Software Update Point (SUP)

- Windows Security app: See [Microsoft Defender Antivirus in the Windows Security app](/defender-endpoint/microsoft-defender-security-center-antivirus)
- The [Windows Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623)

## How to roll back an update

In the unfortunate event that you encounter issues after an update, you can roll back to the previous or the inbox version.

| Scenario | Command |
|--|--|
| Roll security intelligence updates back to the previous or to the original inbox version of the security intelligence version | `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -RemoveDefinitions` |
| Roll the engine version back to the previous version | `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -RemoveDefinitions -Engine` |
| Roll a platform update back to the previous version | `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -RevertPlatform` | 
| Roll updates back to the version shipped with the operating system (`%ProgramFiles%\Windows Defender`) | `"%programdata%\Microsoft\Windows Defender\Platform\<version>\MpCmdRun.exe" -ResetPlatform` |
  
## Platform version included with Windows 10 releases

The table provides the Microsoft Defender Antivirus platform and engine versions that are shipped with the latest Windows 10 releases:

|Windows 10 release  |Platform version  |Engine version |Support phase |
|:---|:---|:---|:---|
|2004  (20H1/20H2) | `4.18.1909.6` | `1.1.17000.2` | Technical upgrade support (only) |
|1909  (19H2) |`4.18.1902.5` |`1.1.16700.3` | Technical upgrade support (only) |
|1903  (19H1) |`4.18.1902.5` |`1.1.15600.4` | Technical upgrade support (only) |
|1809  (RS5) |`4.18.1807.5` |`1.1.15000.2` | Technical upgrade support (only) |
|1803  (RS4) |`4.13.17134.1` |`1.1.14600.4` | Technical upgrade support (only) |
|1709  (RS3) |`4.12.16299.15` |`1.1.14104.0` | Technical upgrade support (only) |
|1703  (RS2) |`4.11.15603.2` |`1.1.13504.0` | Technical upgrade support (only) |
|1607 (RS1) |`4.10.14393.3683` |`1.1.12805.0` | Technical upgrade support (only) |

For Windows 10 release information, see the [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).
  
> [!NOTE]  
> Windows Server 2016 ships with the same Platform version as RS1 and falls under the same support phase: Technical upgrade support (only)  
> Windows Server 2019 ships with the same Platform version as RS5 and falls under the same support phase: Technical upgrade support (only)  

## Updates for Deployment Image Servicing and Management (DISM)

To avoid a gap in protection, keep your OS installation images up to date with the latest antivirus and anti-malware updates. Updates are available for:

- Windows 10 and 11 (Enterprise, Pro, and Home editions)
- Windows Server 2012 R2 and later
- Azure Stack HCI OS, version 23H2 and later
- WIM and VHD(x) files 

Updates are released for x86, x64, and Arm64 Windows architecture.

For more information, see [Microsoft Defender update for Windows operating system installation images](https://support.microsoft.com/help/4568292/defender-update-for-windows-operating-system-installation-images).

After a new package version is released, support for the previous two versions is reduced to technical support only. To view a list of previous versions, see [Previous DISM updates](msda-updates-previous-versions-technical-upgrade-support.md#previous-dism-updates-no-longer-supported).

### 1.431.97.0

- Defender version: `1.431.97.0`
- Security intelligence version: `1.431.97.0`
- Platform version: `4.18.25050.5`
- Engine version: `1.25050.6`

#### Fixes

- None

#### Additional information

- None

### 1.431.54.0

- Defender version: `1.431.54.0`
- Security intelligence version: `1.431.54.0`
- Platform version: `4.18.25050.5`
- Engine version: `1.25050.2`

#### Fixes

- None

#### Additional information

- None


### 1.429.122.0

- Defender version: `1.429.122.0`
- Signature version: `1.429.122.0`
- Platform version: `4.18.25040.2`
- Engine version: `1.25040.1`

#### Fixes

- None

#### Additional information

- None

## More resources

| Article | Description  |
|:---|:---|
|[Microsoft Defender update for Windows operating system installation images](https://support.microsoft.com/help/4568292/defender-update-for-windows-operating-system-installation-images)  | Review anti-malware update packages for your OS installation images (WIM and VHD files). Get Microsoft Defender Antivirus updates for Windows 10 (Enterprise, Pro, and Home editions), Windows Server 2019, Windows Server 2022, Windows Server 2016, and Windows Server 2012 R2 installation images.  |
|[Manage how protection updates are downloaded and applied](manage-protection-updates-microsoft-defender-antivirus.md) | Protection updates can be delivered through many sources. |
|[Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md) | You can schedule when protection updates should be downloaded. |
|[Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md) | If an endpoint misses an update or scheduled scan, you can force an update or scan the next time a user signs in. |
|[Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md) | You can set protection updates to be downloaded at startup or after certain cloud-delivered protection events. |
|[Manage updates for mobile devices and virtual machines (VMs)](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md)| You can specify settings, such as whether updates should occur on battery power that's especially useful for mobile devices and virtual machines. |
| [Microsoft Defender for Endpoint update for EDR Sensor](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac) | You can update the EDR sensor (MsSense.exe) that's included in the new Microsoft Defender for Endpoint unified solution package released in 2021.   |

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)


