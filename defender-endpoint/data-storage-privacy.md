---
title: Microsoft Defender for Endpoint data storage and privacy
description: Learn about how Microsoft Defender for Endpoint handles privacy and data that it collects.
keywords: Microsoft Defender for Endpoint, data storage and privacy, storage, privacy, licensing, geolocation, data retention, data
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier2
- essentials-privacy
- essentials-security
- essentials-compliance
ms.topic: concept-article
search.appverid: met150
ms.date: 01/21/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---
# Microsoft Defender for Endpoint data storage and privacy

[!INCLUDE [Microsoft 365 Defender rebranding](../includes/microsoft-defender.md)]

This article provides information about data storage and privacy for Microsoft Defender for Endpoint, including [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management).

> [!NOTE]
> This article explains the data storage and privacy details related to Defender for Endpoint (including Defender Vulnerability Management) and Defender for Business. For more information related to Defender for Endpoint and other products and services like Microsoft Defender Antivirus and Windows, see [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?linkid=827576).

## What are we collecting?

Microsoft Defender for Endpoint collects information from your configured devices and stores it in a customer-dedicated and segregated tenant specific to the service for administration, tracking, and reporting purposes.

Information collected includes:

- File data (file names, sizes, and hashes)
- Process data (running processes, hashes)
- Registry data
- Network connection data (host IPs and ports)
- Device details (device identifiers, names, and the operating system version)
- Software inventory data for Defender Vulnerability Management capabilities (installed applications, operating system versions, firmware, hardware components, and other relevant software details to identify vulnerabilities, assess risk levels, and provide actionable insights to help you secure your environment)

Microsoft stores this data securely in Microsoft Azure and maintains it in accordance with Microsoft privacy practices and  [Microsoft Trust Center policies](https://go.microsoft.com/fwlink/?linkid=827578).

This data lets Defender for Endpoint:

- Proactively identify indicators of attack (IOAs) in your organization
- Generate alerts if a possible attack was detected
- Provide your security operations with a view into devices, files, and URLs related to threat signals from your network, enabling you to investigate and explore the presence of security threats on the network.

Microsoft doesn't use your data for advertising.

## Data location

Defender for Endpoint (including Defender Vulnerability Management) operates in the Microsoft Azure data centers in the European Union, the United Kingdom, the United States, Australia, Switzerland, India, or the United Arab Emirates (UAE). Customer data collected by the service might be stored in: (a) the geolocation of the tenant as identified during provisioning or, (b) the geolocation as defined by the data storage rules of an online service if this online service is used by Defender for Endpoint to process such data. For more information, see [Where your Microsoft 365 customer data is stored](/microsoft-365/enterprise/o365-data-locations).

(a) the geolocation of the tenant as identified during provisioning; or

(b) the geolocation as defined by the data storage rules of an online service if this online service is used by Defender for Endpoint to process such data.

## Data retention

Data from Microsoft Defender for Endpoint is retained for 180 days, visible across the portal. 

Your data is kept and is available to you while the license is under grace period or suspended mode. At the end of this period, that data will be erased from Microsoft's systems to make it unrecoverable, no later than 180 days from contract termination or expiration.

In the advanced hunting investigation experience, it's accessible via a query for 30 days.

### Data retention for Defender Vulnerability Management inventory data

Inventory entries in Defender Vulnerability Management expire after **7 days** or **31 days** depending on the source as described in the following table:

|Data source|Retention period|Details|
|---|---|---|
|Android apps|7 days or 31 days|Depends on source event category.|
|Browser extensions<sup>\*</sup>|7 days|User-scoped and volatile. Expires quickly without refresh.|
|Certificates<sup>\*</sup>|Up to two days before latest report (fallback is seven days)|Retention aligns to certificate reporting timestamps.|
|Deleted registry products|30 days|Grace window after a product is marked deleted in the registry.|
|Firmware and hardware<sup>\*</sup>|31 days|Expires if the machine didn't report within 31 days or becomes unmanaged.|
|iOS apps|7 days or 31 days|Depends on source event category.|
|Linux packages|7 days or 31 days|Depends on source event category: <ul><li>**User/file scan**: 7 days.</li><li>**System-scoped**: 31 days.</li></ul>|
|Software components from user/file scan sources|7 days|Transient file/handle scans and other volatile sources.|
|User-scoped file paths (paths containing USERS)|7 days|User profile locations.|
|User-scoped registry keys (HKU)|7 days|User-specific hive data.|
|Default (all other sources)|31 days|System-scoped and stable sources.|

<sup>\*</sup> This data source isn't included in Microsoft Defender for Endpoint Plan 2. To get it, you need one of the following options:

- The Defender Vulnerability Management Add-on for Microsoft Defender for Endpoint Plan 2.
- Microsoft Defender Vulnerability Management Standalone if you don't already have Microsoft Defender for Endpoint Plan 2.

## Data recovery

Defender for Endpoint (including Defender Vulnerability Management) incorporates a regional disaster recovery strategy aligned with Microsoft's broader resiliency framework. For more information, see [Resiliency and continuity - Microsoft Service Assurance | Microsoft Learn](/compliance/assurance/assurance-resiliency-and-continuity). In the event of a service disruption, all MDE components are designed to fail over to a paired region within the same geographic boundary, thereby maintaining data residency requirements.

However, due to current service limitations in the United Arab Emirates, MDE components that depend on Azure Synapse workloads are supported with zonal resiliency only. At this time, for the workloads, there is no cross-region business continuity and disaster recovery (BCDR) capability available. For more information on Synapse’s disaster recovery capabilities, refer to the official documentation.

## Data sharing for Microsoft Defender for Endpoint

Defender for Endpoint (including Defender Vulnerability Management) shares data, including customer data, among the following Microsoft products, also licensed by the customer. For customers in the Government Community Cloud (GCC), data sharing between government and commercial cloud environments may occur, depending on the location of the service offering.

- Microsoft Defender XDR
- Microsoft Defender for Cloud Apps
- Microsoft Sentinel
- Microsoft Tunnel for Mobile Application Management - Android
- Microsoft Defender for Cloud
- Microsoft Defender for Identity
- Microsoft Security Exposure Management (public preview)

## Data visibility for Defender Vulnerability Management

Data visibility refers to what you see in the Microsoft Defender portal. If a device or specific software on the device stops reporting signals, Microsoft Defender Vulnerability Management stops showing related device or software vulnerabilities after **30 consecutive days**.

The following table describes how Defender Vulnerability Management retains and displays data for different scenarios:

|Retention scenario|Description|Learn more|
|---|---|---|
|Inactive devices|A device can be listed as inactive for several reasons:<br>- The device wasn't used for more than seven days.<br>- The device was reinstalled or renamed. The previous device entity remains and is marked as **Inactive**.<br>- The device was offboarded from Defender for Endpoint. After seven days, the health state of the device changes to **Inactive**.<br>- The device didn't send signals to Microsoft Defender for Endpoint for more than seven days. <br><br>Defender Vulnerability Management continues to display the last vulnerability snapshot for **up to 30 days** from the time the device stopped reporting. **After 30 days**, the device is marked as **Inactive** and associated vulnerabilities are no longer shown in the Defender portal. <br><br>Defender for Endpoint retains data on inactive devices for up to 180 days for compliance and forensics. |- [Inactive devices in Microsoft Defender for Endpoint](fix-unhealthy-sensors.md#inactive-devices) <br/>- [Exclude devices](exclude-devices.md)|
|Uninstalled or inactive software|If specific software on an **active** device stops sending signals **for 30 consecutive days**, Defender Vulnerability Management assumes the software was removed or is inactive. Defender Vulnerability Management automatically stops flagging software vulnerabilities for the software on the device in the Defender portal.|[Software inventory](/defender-vulnerability-management/tvm-software-inventory)|

> [!NOTE]
> For more information related to privacy in Defender Vulnerability Management and other products and services like Microsoft Defender Antivirus and Windows, see [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/p/?linkid=827576).
