---
title: What's new in Microsoft Defender for Endpoint
description: This article describes new features available in Microsoft Defender for Endpoint, including both Windows and cross-platform updates.
ms.topic: whats-new
ms.service: defender-endpoint
author: lwainstein
ms.author: lwainstein
author: limwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 09/03/2025
---

# What's new in Microsoft Defender for Endpoint?

This article describes features available in Microsoft Defender for Endpoint across Windows, macOS, Linux, Android, and iOS.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

## August 2025

|Platform  |Updates  |
|---------|---------|
| **macOS** | - [Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md): Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |

## July 2025

|Platform  |Updates  |
|---------|---------|
| **Windows** | - Azure Stack HCI OS support (version 23H2 and later): Added support for Azure Stack HCI OS, version 23H2 and later. Support is rolling out across commercial and government clouds. |
| **Windows** | - [Microsoft Defender Core service](/defender-endpoint/microsoft-defender-core-service-overview): Now generally available, helps with the stability and performance of Microsoft Defender Antivirus. |

## April 2025

|Platform  |Updates  |
|---------|---------|
| **Windows** | - [Contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices): Containing an IP address prevents attackers from spreading attacks to other noncompromised devices. |
| **Windows** | - Attack Surface Reduction (ASR) Rules: Two new ASR rules are now generally available:<br>  - [Block rebooting machine in Safe Mode](/defender-endpoint/attack-surface-reduction-rules-reference)<br>  - [Block use of copied or impersonated system tools](/defender-endpoint/attack-surface-reduction-rules-reference) |
| **Linux** | - ARM64-based Linux server support: Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux. All product capabilities that are supported on AMD64 devices are now supported on ARM64-based Linux servers. [Learn more](microsoft-defender-endpoint-linux.md) |

## February 2025

|Platform  |Updates  |
|---------|---------|
| **Windows** | - [Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md): Aggregated reporting is now generally available. |

## November-December 2024

|Platform  |Updates  |
|---------|---------|
| **Windows** | - New demonstration scenarios:<br>- [AMSI demos](mde-demonstration-amsi.md)<br>- [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection)<br>- [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access)<br>- [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection)<br>- [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation) |

## August 2024

|Platform  |Updates  |
|---------|---------|
| **Android** | - [Network protection](/defender-endpoint/android-configure#network-protection) feature enabled by default on Android: Users now see a network protection card in the Android app, along with App Protection and Web Protection. |

## July 2024

|Service area  |Updates  |
|---------|---------|
| **IoT/OT** | - Monitor OT devices in the device inventory: You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery).<br>- Added the **All devices** tab and renamed the **IoT devices** tab to **IoT/OT devices**.<br>- Added **Device type**, **Device subtype**, **Vendor**, **Model**, and **Site** filters and columns to the device inventory. Some filters are only visible on specific tabs and only for customers with a Defender for IoT license. [Learn more](machines-view-overview.md#use-filters-to-customize-the-device-inventory-views).<br>- Added ability to search Mac devices and Mac addresses.<br>- Added a system tag showing the production site name (read only), used for the Defender for IoT [site security](/defender-for-iot/site-security-overview) feature, as part of the [device group](/defender-for-iot/set-up-sites#add-device-group).<br> **Note**: If OT devices are discovered but a Defender for IoT license isn't set up, the device inventory displays partial data and a message indicating the number of unprotected OT devices. [Learn more about the initial device inventory view with detected OT devices](/defender-for-iot/device-discovery#device-inventory-initial-view). |
| **Learning hub** | - Learning hub resources moved: Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).<br>- Access Microsoft Defender XDR Ninja training, learning paths, training modules and more.<br>- Browse the [list of learning paths](/training/browse/?products=m365-ems-cloud-app-security%2Cdefender-for-cloud-apps%2Cdefender-identity%2Cm365-information-protection%2Cm365-threat-protection%2Cmdatp%2Cdefender-office365&expanded=m365%2Coffice-365), and filter by product, role, level, and subject. |

## Next steps

- [What's new in Defender for Endpoint on Windows](windows-whatsnew.md)
- [What's new in Defender for Endpoint on macOS](mac-whatsnew.md)
- [What's new in Defender for Endpoint on Linux](linux-whatsnew.md)
- [What's new in Defender for Endpoint on Android](android-whatsnew.md)
- [What's new in Defender for Endpoint on iOS](ios-whatsnew.md)
- [What's new in Microsoft Defender XDR](/defender-xdr/whats-new)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)
- [What's new in Microsoft Defender Vulnerability Management](/defender-vulnerability-management/whats-new-in-microsoft-defender-vulnerability-management)

## August 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md) |Preview |Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |

## July 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|Azure Stack HCI OS support (version 23H2 and later) |Preview |Added support for Azure Stack HCI OS, version 23H2 and later. Support for Azure Stack HCI OS is rolling out across commercial and government clouds. |
|[Microsoft Defender Core service](/defender-endpoint/microsoft-defender-core-service-overview) |GA |Microsoft Defender Core service, now in GA, helps with the stability and performance of Microsoft Defender Antivirus.|

## April 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices) |Preview     |Containing an IP address prevents attackers from spreading attacks to other noncompromised devices. |
|Attack Surface Reduction (ASR) Rules |GA         |Two new ASR rules are now generally available:<br>  - [Block rebooting machine in Safe Mode](/defender-endpoint/attack-surface-reduction-rules-reference): Prevents the execution of commands to restart machines in Safe Mode.<br>  - [Block use of copied or impersonated system tools](/defender-endpoint/attack-surface-reduction-rules-reference): Blocks the use of executable files that are identified as copies of Windows system tools. These files are either duplicates or impostors of the original system tools. |
|ARM64-based Linux server support |GA  |- Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux.<br>- All product capabilities that are supported on AMD64 devices are now supported on ARM64-based Linux servers. <br><br>For more information, see:<br>  - [Tech Community Blog: Defender for Endpoint extends support to ARM-based Linux servers](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/defender-for-endpoint-extends-support-to-arm-based-linux-servers/4364066)<br>  - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) |

## February 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Aggregated reporting in Microsoft Defender for Endpoint](aggregated-reporting.md)|GA|Aggregated reporting extends signal reporting intervals to significantly reduce the size of reported events while preserving essential event properties.|

## November-December 2024

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|New demonstration scenarios|GA|Five new demonstration scenarios are available:<br>- [AMSI demos](mde-demonstration-amsi.md)<br>- [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection)<br>- [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access)<br>- [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection)<br>- [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation)|

## August 2024

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Network protection](/defender-endpoint/android-configure#network-protection) feature enabled by default on Android|GA|Users now see a network protection card in the Android app, along with App Protection and Web Protection. |

## July 2024

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|Monitor OT devices in the device inventory|Preview|You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery).<br><br>- Added the **All devices** tab and renamed the **IoT devices** tab to **IoT/OT devices**.<br>- Added **Device type**, **Device subtype**, **Vendor**, **Model**, and **Site** filters and columns to the device inventory. Some filters are only visible on specific tabs and only for customers with a Defender for IoT license. [Learn more](machines-view-overview.md#use-filters-to-customize-the-device-inventory-views).<br>- Added ability to search Mac devices and Mac addresses.<br>- Added a system tag showing the production site name (read only), used for the Defender for IoT [site security](/defender-for-iot/site-security-overview) feature, as part of the [device group](/defender-for-iot/set-up-sites#add-device-group).<br><br> **Note**: If OT devices are discovered but a Defender for IoT license isn't set up, the device inventory displays partial data and a message indicating the number of unprotected OT devices. [Learn more about the initial device inventory view with detected OT devices](/defender-for-iot/device-discovery#device-inventory-initial-view).|
|Learning hub resources moved|GA|Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).<br><br>- Access Microsoft Defender XDR Ninja training, learning paths, training modules and more.<br>- Browse the [list of learning paths](/training/browse/?products=m365-ems-cloud-app-security%2Cdefender-for-cloud-apps%2Cdefender-identity%2Cm365-information-protection%2Cm365-threat-protection%2Cmdatp%2Cdefender-office365&expanded=m365%2Coffice-365), and filter by product, role, level, and subject.|

## What's new in Defender for Endpoint on other operating systems and services

|Platform/service  |Link  |
|------------------|------|
|Windows           |[What's new in Defender for Endpoint on Windows](windows-whatsnew.md)|
|macOS             |[What's new in Defender for Endpoint on macOS](mac-whatsnew.md)|
|Linux             |[What's new in Defender for Endpoint on Linux](linux-whatsnew.md)|
|Android           |[What's new in Defender for Endpoint on Android](android-whatsnew.md)|
|iOS               |[What's new in Defender for Endpoint on iOS](ios-whatsnew.md)|
|Microsoft Defender XDR |[What's new in Microsoft Defender XDR](/defender-xdr/whats-new)|
|Microsoft Defender for Office 365 |[What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)|
|Microsoft Defender for Identity |[What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)|
|Microsoft Defender for Cloud Apps |[What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)|
|Microsoft Defender Vulnerability Management |[What's new in Microsoft Defender Vulnerability Management](/defender-vulnerability-management/whats-new-in-microsoft-defender-vulnerability-management)|