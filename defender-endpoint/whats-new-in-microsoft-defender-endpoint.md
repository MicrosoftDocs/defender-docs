---
title: What's new in Microsoft Defender for Endpoint
description: This article describes new features available in Microsoft Defender for Endpoint, including both Windows and cross-platform updates.
ms.topic: whats-new
ms.service: defender-endpoint
author: lwainstein
ms.author: lwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 11/19/2025
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier1
#Customer.intent: As a security administrator or IT professional, stay up to date with the latest features, improvements, and changes in Microsoft Defender for Endpoint and related security products, so that you can ensure your organization benefits from new capabilities, stays protected against emerging threats, and takes advantage of enhancements as soon as they become available.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# What's new in Microsoft Defender for Endpoint

This article describes Microsoft Defender for Endpoint features that are in preview or generally available (GA) in the latest release.

Learn more:

- [Microsoft Defender for Endpoint supported versions](microsoft-defender-endpoint-releases.md)
- [Preview features](/defender-xdr/preview)

## December 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Triage collection](/azure/sentinel/datalake/sentinel-mcp-triage-tool) |Preview |Use triage collection to prioritize incidents and hunt threats with the Sentinel Model Context Protocol (MCP) server.|

## November 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|New predictive shielding response actions |Preview |Defender for Endpoint now includes the [GPO hardening](respond-machine-alerts.md#gpo-hardening) and [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening) response actions. These actions are part of the [predictive shielding](/defender-xdr/shield-predict-threats) feature, which anticipates and mitigates potential threats before they materialize.|
|[Custom data collection](custom-data-collection.md) |Preview |Custom data collection enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. |
| Defender deployment tool<br/>- [for Windows devices](./defender-deployment-tool-windows.md)<br/>- [for Linux devices](./linux-install-with-defender-deployment-tool.md) | Preview | The new Defender deployment tool is a lightweight, self-updating application that streamlines onboarding devices to the Defender endpoint security solution. The tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, and manual installations. It currently supports Windows and Linux devices. |
| [Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security) | Preview | A Defender for endpoint security solution is now available for legacy Windows 7 SP1 and Windows Server 2008 R2 SP1 devices. The solution provides advanced protection capabilities and improved functionality for these devices compared to other solutions. The new solution is available using the new [Defender deployment tool](./defender-deployment-tool-windows.md). |

## October 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Streamlined connectivity support for US government environments (GCC, GCC High, DoD)](configure-device-connectivity.md) |Preview |Defender for Endpoint now supports streamlined connectivity for US government cloud environments. This enhancement simplifies onboarding by reducing the number of required service endpoints and improves reliability across restricted networks. For more information, see the [required connectivity settings](gov.md#required-connectivity-settings). |
|Isolation exclusions |GA |The [Isolation exclusions](isolation-exclusions.md) feature is now generally available. Isolation exclusions allow designated processes or endpoints to bypass the restrictions of network isolation, ensuring essential functions continue while limiting broader network exposure. |

## September 2025

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md) | GA |Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |

## August 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
| **macOS** | GA |Defender for Endpoint can now monitor process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system.<br><br>Learn more:<br> - [Behavior Monitoring in Microsoft Defender for Endpoint on macOS](behavior-monitor-macos.md)<br>- [Behavior Monitoring GA announcement blog](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/behavior-monitoring-is-now-generally-available-for-microsoft-defender-for-endpoi/4415697) |

## May 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|---------|
|**Windows** |GA |Version 10.8797.25857.1000 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#108797258571000---may-2025). |

## April 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
| **Windows** | Preview | You can now [contain IP addresses of undiscovered devices](respond-machine-alerts.md#contain-ip-addresses-of-undiscovered-devices). |
| **Windows** | GA | Two new ASR rules are now generally available:<br>  - [Block rebooting machine in Safe Mode](/defender-endpoint/attack-surface-reduction-rules-reference)<br>  - [Block use of copied or impersonated system tools](/defender-endpoint/attack-surface-reduction-rules-reference) |
| **Linux** | GA | - Defender for Endpoint now supports ARM64-based Linux servers on Ubuntu, RHEL, Debian, SUSE Linux, Amazon Linux, and Oracle Linux.<br>- All product capabilities that are supported on AMD64 devices are now supported on ARM64-based Linux servers.<br><br>[Learn more](microsoft-defender-endpoint-linux.md) |

## February 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
| **Windows** | GA | [Aggregated reporting](aggregated-reporting.md) is now generally available. |

## November-December 2024

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
| **Windows** | GA | You can now use these new demonstration scenarios:<br>- [AMSI demos](mde-demonstration-amsi.md)<br>- [Cloud protection demo](/defender-endpoint/defender-endpoint-demonstration-cloud-delivered-protection)<br>- [Controlled folder access (block ransomware) demo](/defender-endpoint/defender-endpoint-demonstration-controlled-folder-access)<br>- [Endpoint detection and response (EDR) detection test](/defender-endpoint/edr-detection)<br>- [URL reputation (SmartScreen) demo](/defender-endpoint/defender-endpoint-demonstration-smartscreen-url-reputation) |

## August 2024

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
| **Android** | GA | [Network protection](/defender-endpoint/android-configure#network-protection) is now enabled by default on Android. Users now see a network protection card in the Android app, along with App Protection and Web Protection. |

## July 2024

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|Monitor OT devices in the device inventory|Preview|You can now monitor OT devices in addition to IoT devices in the device inventory, as part of the integration with [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/device-discovery).<br><br>- Added the **All devices** tab and renamed the **IoT devices** tab to **IoT/OT devices**.<br>- Added **Device type**, **Device subtype**, **Vendor**, **Model**, and **Site** filters and columns to the device inventory. Some filters are only visible on specific tabs and only for customers with a Defender for IoT license. [Learn more](machines-view-overview.md#use-filters-to-customize-the-device-inventory-views).<br>- Added ability to search Mac devices and Mac addresses.<br>- Added a system tag showing the production site name (read only), used for the Defender for IoT [site security](/defender-for-iot/site-security-overview) feature, as part of the [device group](/defender-for-iot/set-up-sites#add-device-group).<br><br> **Note**: If OT devices are discovered but a Defender for IoT license isn't set up, the device inventory displays partial data and a message indicating the number of unprotected OT devices. [Learn more about the initial device inventory view with detected OT devices](/defender-for-iot/device-discovery#device-inventory-initial-view).|
|Learning hub resources moved|GA|Learning hub resources have moved from the Microsoft Defender portal to [learn.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2273118).<br><br>- Access Microsoft Defender XDR Ninja training, learning paths, training modules and more.<br>- Browse the [list of learning paths](/training/browse/?products=m365-ems-cloud-app-security%2Cdefender-for-cloud-apps%2Cdefender-identity%2Cm365-information-protection%2Cm365-threat-protection%2Cmdatp%2Cdefender-office365&expanded=m365%2Coffice-365), and filter by product, role, level, and subject.|
