---
title: What's new in Microsoft Defender for Endpoint
description: Learn about the latest Microsoft Defender for Endpoint preview and generally available (GA) features, and security features in Windows 10 and Windows Server.
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 11/19/2025
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier1
ms.topic: whats-new
#Customer.intent: As a security administrator or IT professional, stay up to date with the latest features, improvements, and changes in Microsoft Defender for Endpoint and related security products, so that you can ensure your organization benefits from new capabilities, stays protected against emerging threats, and takes advantage of enhancements as soon as they become available.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# What's new in Microsoft Defender for Endpoint

This article describes Microsoft Defender for Endpoint features that are in preview or generally available (GA) in the latest release.

Learn more:

- [What's new in Microsoft Defender for Endpoint on other operating systems and services](#whats-new-in-defender-for-endpoint-on-other-operating-systems-and-services)
- [Preview features](/defender-xdr/preview)

## April 2026

|Feature  |Preview/GA  |Description  |
|---------|------------|-------------|
|[View action status in the Activities tab](/defender-xdr/autoad-results#track-the-action-status-in-the-activities-tab) |Preview |You can now view the current status of automatic attack disruption and predictive shielding actions related to a specific incident. You view this data in the **Activities** tab of the incident page. The data applies to the [Contain user](respond-machine-alerts.md#contain-user-from-the-network), [GPO hardening](respond-machine-alerts.md#gpo-hardening), [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening) response actions. |

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
