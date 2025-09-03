---
title: What's new in Microsoft Defender for Endpoint
description: This article describes new features available in Microsoft Defender for Endpoint, including both Windows and cross-platform updates.
ms.topic: whats-new
ms.service: defender-endpoint
author: lwainstein
ms.author: lwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 09/03/2025
appliesto: Microsoft Defender for Endpoint Plan 1, Microsoft Defender for Endpoint Plan 2, Microsoft Defender XDR
---

# What's new in Microsoft Defender for Endpoint?

This article describes features available in Microsoft Defender for Endpoint across Windows, macOS, Linux, Android, and iOS.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

## August 2025

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **macOS** | Preview | You can now [configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md). This configuration option enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |

## July 2025

|Platform  |Preview/GA  |Release|Updates  |
|---------|------------|---------|---------|
| **Windows** | Preview |Non-release specific | Defender for Endpoint now supports Azure Stack HCI OS, version 23H2 and later. Support is rolling out across commercial and government clouds. |
| **Windows** | GA |Non-release specific | [Microsoft Defender Core service](/defender-endpoint/microsoft-defender-core-service-overview) is now generally available. This service helps with the stability and performance of Microsoft Defender Antivirus. |
| **Windows** (see [specific platforms and KBs](microsoft-defender-endpoint-releases.md#july-2025)) | GA |10.8760.27617.1006 |See [updates for this release](#release-108760276171006-updates). |

### Release 10.8760.27617.1006 updates

DLP:

- Scoped classification (Know Your Data policy): Scope classification and activity events across workloads.
- Device group discovery and scoping: Scope [Endpoint DLP](/purview/endpoint-dlp-learn-about) custom policy based on the device or device group.
- OCR URL Caching: Performance improvement for already classified images by having client side caching.

## May 2025

|Platform  |Preview/GA  |Release |Updates  |
|---------|------------|---------|---------|
|**Windows** (see [specific platforms and KBs](microsoft-defender-endpoint-releases.md#may-2025)) |GA |10.8797.25857.1000 |See [updates for this release](#release-108797258571000-updates). |

### Release 10.8797.25857.1000 updates

#### Data Loss Prevention (DLP)

- On-Demand Scan: Improved the functionality, performance, and reliability of the Cold Data Scan feature. This enhancement enables deeper, more consistent scanning of archived or infrequently accessed data, helping organizations uncover potential data risks hidden in long-term storage. 
- General Stability and Performance Improvements: Additional under-the-hood optimizations to improve overall system performance, reliability, and stability.

#### Identity 

- Entity sync enrichment: Expanded the capabilities of the SenseIdentity client to enhance Active Directory (AD) entity synchronization. This update introduces support for syncing new entity types including Group Policy Objects, Authentication Silos, and Domain Controller computer accounts for all Domain Controllers within trusted domains. Additionally, the update enriches existing synced entities (Domain, Account, and Group) with a broader set of attributes, enabling more comprehensive visibility and detection capabilities. 

#### Threat protection

- User contaminant improvements 

#### Network Detection and Response (NDR) 

- Improved data telemetry providing better visibility and insights 

#### SOC experience 

- Improved Data Completeness and Detection: Enhancements have been made to improve the completeness of data collected and reduce the time it takes to detect potential data loss incidents. These improvements enable faster and more accurate identification of data exfiltration attempts across monitored endpoints. 
- Improved Handling for Offline Network Environments: Refined the handling of scenarios where devices operate in offline or restricted network environments. Specifically addresses cases where result uploads to blob storage fail due to offline Certificate Revocation List (CRL) checks, ensuring better reliability and continuity in data collection.

## April 2025

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | Preview | You can now [contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices). |
| **Windows** | GA | Two new ASR rules are now generally available:<br>  - [Block rebooting machine in Safe Mode](/defender-endpoint/attack-surface-reduction-rules-reference)<br>  - [Block use of copied or impersonated system tools](/defender-endpoint/attack-surface-reduction-rules-reference) |
| **Linux** | GA | - Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux.<br>- All product capabilities that are supported on AMD64 devices are now supported on ARM64-based Linux servers.<br><br>[Learn more](microsoft-defender-endpoint-linux.md) |

## February 2025

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | GA | [Aggregated reporting](aggregated-reporting.md) is now generally available. |

## November-December 2024

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | GA | You can now use these new demonstration scenarios:<br>- [AMSI demos](mde-demonstration-amsi.md)<br>- [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection)<br>- [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access)<br>- [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection)<br>- [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation) |

## August 2024

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Android** | GA | [Network protection](/defender-endpoint/android-configure#network-protection) is now enabled by default on Android. Users now see a network protection card in the Android app, along with App Protection and Web Protection. |

## July 2024

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| General | Preview | You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery).<br><br>- Added the **All devices** tab and renamed the **IoT devices** tab to **IoT/OT devices**.<br>- Added **Device type**, **Device subtype**, **Vendor**, **Model**, and **Site** filters and columns to the device inventory. Some filters are only visible on specific tabs and only for customers with a Defender for IoT license. [Learn more](machines-view-overview.md#use-filters-to-customize-the-device-inventory-views).<br>- Added ability to search Mac devices and Mac addresses.<br>- Added a system tag showing the production site name (read only), used for the Defender for IoT [site security](/defender-for-iot/site-security-overview) feature, as part of the [device group](/defender-for-iot/set-up-sites#add-device-group).<br><br> **Note**: If OT devices are discovered but a Defender for IoT license isn't set up, the device inventory displays partial data and a message indicating the number of unprotected OT devices. [Learn more about the initial device inventory view with detected OT devices](/defender-for-iot/device-discovery#device-inventory-initial-view). |
| General | GA | Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).<br><br>- Access Microsoft Defender XDR Ninja training, learning paths, training modules and more.<br>- Browse the [list of learning paths](/training/browse/?products=m365-ems-cloud-app-security%2Cdefender-for-cloud-apps%2Cdefender-identity%2Cm365-information-protection%2Cm365-threat-protection%2Cmdatp%2Cdefender-office365&expanded=m365%2Coffice-365), and filter by product, role, level, and subject. |

## Next steps

[Get started with your Microsoft Defender for Endpoint deployment](mde-planning-guide.md)