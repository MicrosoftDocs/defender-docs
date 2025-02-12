---
title: What's new in Microsoft Defender for Endpoint on Windows
description: Learn about the latest feature releases of Microsoft Defender for Endpoint on Windows Client and Server.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
ms.date: 10/10/2024
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: reference
---

# What's new in Microsoft Defender for Endpoint on Windows

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)


> Want to experience Defender for Endpoint? [Sign up for a free trial](https://go.microsoft.com/fwlink/p/?linkid=2225630).

This page covers the Microsoft Defender for Endpoint EDR `MsSense.exe` versions. You can also check the file information section in the monthly cumulative rollup updates in the following articles:

- [Windows 11 release information](/windows/release-health/windows11-release-information)
- [Windows 10 updates](https://support.microsoft.com/topic/windows-10-update-history-8127c2c6-6edf-4fdf-8b9f-0f7be1ef3562)
- [Windows Server 2022 updates](https://support.microsoft.com/topic/windows-server-2022-update-history-e1caa597-00c5-4ab9-9f3e-8212fe80b2ee)
- [Windows Server 2019 updates](https://support.microsoft.com/topic/windows-10-and-windows-server-2019-update-history-725fc2e1-4443-6831-a5ca-51ff5cbcb059)

For the latest updates to Microsoft Defender for Endpoint all up, see [What's new in Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md).

For the latest updates to Microsoft Defender for Endpoint Next-Generation Protection/Microsoft Defender Antivirus, see [Microsoft Defender Antivirus security intelligence and product updates](microsoft-defender-antivirus-updates.md).

All updates contain:

- Performance improvements
- Serviceability improvements
- Integration improvements (Cloud, [Microsoft Defender XDR](/defender-xdr))

## July-2024 (Release version: 10.8760)

|OS  |KB |
| -------- | -------- |
| Windows 11 24H2     | [KB5041865](https://support.microsoft.com/en-us/topic/august-27-2024-kb5041865-os-build-26100-1591-preview-5d299921-2b27-4fe0-b414-c2336371b552)  |  
| Windows 11 23H2 <br/> Windows 11 22H | [KB5041587](https://support.microsoft.com/en-us/topic/august-27-2024-kb5041587-os-builds-22621-4112-and-22631-4112-preview-9706ea0e-6f72-430e-b08a-878963dafe08) |
| Windows 11 21H2 | [KB5043067](https://support.microsoft.com/en-us/topic/september-10-2024-kb5043067-os-build-22000-3197-62287850-4f0d-4e4a-9fe8-b026bb1be994) |
| Windows 10 22H2 | [KB5041582](https://support.microsoft.com/en-us/topic/august-29-2024-kb5041582-os-build-19045-4842-preview-f4c4d191-5457-475c-80ac-e1d43cf9c941) |
| Windows Server 2022 | [KB5042881](https://support.microsoft.com/en-us/topic/september-10-2024-kb5042881-os-build-20348-2700-5b548143-9613-4e5a-9454-8ed9be8b2bd2) |
| Windows Server 2019 | [KB5043050](https://support.microsoft.com/en-us/topic/september-10-2024-kb5043050-os-build-17763-6293-66e9809a-1838-4474-a6a7-90d64f042f00) |
|Windows Server 2016 <br/>Windows Server 2012 R2 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac) |

### What's new

**Data Loss Prevention (DLP)**

- Scoped classification (Know Your Data policy): Scope classification and activity events across workloads.
- Device group discovery and scoping: Scope [Endpoint DLP](/purview/endpoint-dlp-learn-about) custom policy based on the device or device group.
- OCR URL Caching: Performance improvement for already classified images by having client side caching.

## May-2024 (Release version: 10.8750)

|OS  |KB |Release version |
| -------- | -------- | -------- |
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8750|

### What's new

**Configuration Management**

- Fixed an issue that caused empty policies to appear in the UI. 
- Configured Windows Defender Application Control(WDAC) policies to block undesired applications from running on the device. 

## Feb-2024 (Release version: 10.8735.26020.1009)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8735.26020.1009|

### What's new

- **Endpoint Detection and Response**
  - Enabled support for IPV6 connections in Live Response connection commands.
  - Fixed an issue in Downlevel Unified Agent that caused ServerRoles not to be populated.
    
- **Threat Vulnerability Management**
  - An issue related to the agent's monitoring of deleted registry keys no longer occurs.
  - Added a new capability to enable/disable registry monitoring through configuration settings.
   
- **Network Detection and Response (NDR) Performance Enhancements** 
  - Introduced performance enhancements to minimize the CPU and memory footprint of the agent.
  - Enhanced the accuracy of network detections.
    
- **Data Loss Prevention (DLP)**
   - Introduced multiple performance and stability fixes.
     
- **Security Configuration Management**
   - Policies that include special characters are now supported.   

## Dec-2023 (Release version: 10.8672.25926.1019)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8672.25926.1019|

**What's new**

- Supports Expanded User Contain capabilities

## Sept-2023 (Release version: 10.8560.25364.1036)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8560.25364.1036|

**What's new**

- Supports User Contain availability

## May-2023 (Release version: 10.8295.22621.1023)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8295.22621.1023|

**What's new**

- Supports new security settings management capabilities

## Jan/Feb-2023 (Release version: 10.8295.22621.1019)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8295.22621.1019|

**What's new**

- Improved command and control security, quality fixes

## Dec-2022 (Release version: 10.8210.22621.1016)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8210.22621.1016|

**What's new**

- Bug fixes and stability improvements

## Aug-2022 (Release version: 10.8210.*)

|OS  |KB |Release version  |
|---------|---------|---------|
|Windows Server 2012 R2, 2016 |[KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac)|10.8210.22621.1011|
|Windows 11 21H2 (Cobalt)<br> (Windows 11 SV 21H2)     | [KB5016691](https://support.microsoft.com/topic/august-25-2022-kb5016691-os-build-22000-918-preview-59097044-915a-49a0-8870-49823236adbd)        | 10.8210.22000.918        |
|Server 2022 (Iron)     | [KB5016693](https://support.microsoft.com/topic/august-16-2022-kb5016693-os-build-20348-946-preview-ee90d0bc-c162-4124-b7c6-f963ee7b17ed)        |10.8210.20348.946         |
|Windows 10 20H2/21H1/21H2<br> Windows Server 20H2  (Vibranium)     | [KB5016688](https://support.microsoft.com/topic/august-26-2022-kb5016688-os-builds-19042-1949-19043-1949-and-19044-1949-preview-ec31ebdc-067d-44dd-beb0-eabcc984d843)       | 10.8210.19041.1949        |
|Windows Server 2019 (RS5)   |[KB5016690](https://support.microsoft.com/topic/august-23-2022-kb5016690-os-build-17763-3346-preview-b81d1ac5-75c7-42c1-b638-f13aa4242f42)       |10.8210.17763.3346 |

**What's new**

- Added a fix to resolve a missing intermediate certificate issue with the use of "TelemetryProxyServer" on Windows Server 2012 R2 running the unified agent.
- Enhanced [Endpoint DLP](/purview/endpoint-dlp-learn-about) with ability to protect password protected and encrypted files and not label files.
- Enhanced Endpoint DLP with support for context data in audit telemetry (short evidence).
- Improved Microsoft Defender for Endpoint client authentication support for VDI devices.
- Enhanced Microsoft Defender for Endpoint's ability to identify and intercept ransomware and advanced attacks.
- The *Contain* feature now supports more desktop and server versions to perform contain actions and block discovered devices when such devices are contained.
- Expanded the troubleshooting mode feature to more desktop and server versions. For a complete list of supported OS versions and more information about prerequisites, see [Get started with troubleshooting mode in Microsoft Defender for Endpoint](enable-troubleshooting-mode.md).
- Live Response improvements include reduced session creation latency when using proxies, an undo remediation manual command, support for OneDrive shares in `FindFile` action, and improved isolation and stability.
- [Security Management for Microsoft Defender for Endpoint](/mem/intune/protect/mde-security-integration#configure-your-tenant-to-support-microsoft-defender-for-endpoint-security-configuration-management) now provides the ability to sync the device configuration on demand instead of waiting for a specific cadence.

 > [!NOTE] 
 > Update package KB5005292 is on a gradual rollout schedule through Windows Update. Towards the end of this schedule, the package will be published completely, including to the update catalog for manual download. For the current release, this will be in the second half of October. If you want to test the package sooner, you can use [gradual rollout controls for platform updates](configure-updates.md) to select the Preview channel.


See also: 
- [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md)
- [What's new in Defender for Endpoint on macOS](mac-whatsnew.md)
- [What's new in Defender for Endpoint on iOS](ios-whatsnew.md)
- [What's new in Defender for Endpoint on Linux](linux-whatsnew.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
