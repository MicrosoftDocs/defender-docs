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
| **macOS** | Preview | [Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md): Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |

## July 2025

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | Preview | Azure Stack HCI OS support (version 23H2 and later): Added support for Azure Stack HCI OS, version 23H2 and later. Support is rolling out across commercial and government clouds. |
| **Windows** | GA | [Microsoft Defender Core service](/defender-endpoint/microsoft-defender-core-service-overview): Now generally available, helps with the stability and performance of Microsoft Defender Antivirus. |

## April 2025

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | Preview | [Contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices): Containing an IP address prevents attackers from spreading attacks to other noncompromised devices. |
| **Windows** | GA | Attack Surface Reduction (ASR) Rules: Two new ASR rules are now generally available:<br>  - [Block rebooting machine in Safe Mode](/defender-endpoint/attack-surface-reduction-rules-reference)<br>  - [Block use of copied or impersonated system tools](/defender-endpoint/attack-surface-reduction-rules-reference) |
| **Linux** | GA | ARM64-based Linux server support: Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux. All product capabilities that are supported on AMD64 devices are now supported on ARM64-based Linux servers. [Learn more](microsoft-defender-endpoint-linux.md) |

## February 2025

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | GA | [Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md) is now generally available. |

## November-December 2024

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Windows** | GA | New demonstration scenarios:<br>- [AMSI demos](mde-demonstration-amsi.md)<br>- [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection)<br>- [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access)<br>- [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection)<br>- [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation) |

## August 2024

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| **Android** | GA | [Network protection](/defender-endpoint/android-configure#network-protection) feature enabled by default on Android: Users now see a network protection card in the Android app, along with App Protection and Web Protection. |

## July 2024

|Platform  |Preview/GA  |Updates  |
|---------|------------|---------|
| General | Preview | You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery).<br>- Added the **All devices** tab and renamed the **IoT devices** tab to **IoT/OT devices**.<br>- Added **Device type**, **Device subtype**, **Vendor**, **Model**, and **Site** filters and columns to the device inventory. Some filters are only visible on specific tabs and only for customers with a Defender for IoT license. [Learn more](machines-view-overview.md#use-filters-to-customize-the-device-inventory-views).<br>- Added ability to search Mac devices and Mac addresses.<br>- Added a system tag showing the production site name (read only), used for the Defender for IoT [site security](/defender-for-iot/site-security-overview) feature, as part of the [device group](/defender-for-iot/set-up-sites#add-device-group).<br> **Note**: If OT devices are discovered but a Defender for IoT license isn't set up, the device inventory displays partial data and a message indicating the number of unprotected OT devices. [Learn more about the initial device inventory view with detected OT devices](/defender-for-iot/device-discovery#device-inventory-initial-view). |
| **Learning hub** | GA | Learning hub resources moved: Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).<br>- Access Microsoft Defender XDR Ninja training, learning paths, training modules and more.<br>- Browse the [list of learning paths](/training/browse/?products=m365-ems-cloud-app-security%2Cdefender-for-cloud-apps%2Cdefender-identity%2Cm365-information-protection%2Cm365-threat-protection%2Cmdatp%2Cdefender-office365&expanded=m365%2Coffice-365), and filter by product, role, level, and subject. |

## Next steps

[Get started with Microsoft Defender for Endpoint](get-started-with-microsoft-defender-endpoint.md)