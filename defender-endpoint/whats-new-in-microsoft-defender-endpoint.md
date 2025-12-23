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

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|All |[Triage collection](/azure/sentinel/datalake/sentinel-mcp-triage-tool) |Preview |Use triage collection to prioritize incidents and hunt threats with the Sentinel Model Context Protocol (MCP) server.|

## November 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Windows |New predictive shielding response actions |Preview |Defender for Endpoint now includes the [GPO hardening](respond-machine-alerts.md#gpo-hardening) and [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening) response actions. These actions are part of the [predictive shielding](/defender-xdr/shield-predict-threats) feature, which anticipates and mitigates potential threats before they materialize.|
|All |[Custom data collection](custom-data-collection.md) |Preview |Custom data collection enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. |
| Windows, Linux | Defender deployment tool<br/>- [for Windows devices](./defender-deployment-tool-windows.md)<br/>- [for Linux devices](./linux-install-with-defender-deployment-tool.md) |Preview | The new Defender deployment tool is a lightweight, self-updating application that streamlines onboarding devices to the Defender endpoint security solution. The tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, and manual installations. It currently supports Windows and Linux devices. |
| Windows | [Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security) |Preview | A Defender for endpoint security solution is now available for legacy Windows 7 SP1 and Windows Server 2008 R2 SP1 devices. The solution provides advanced protection capabilities and improved functionality for these devices compared to other solutions. The new solution is available using the new [Defender deployment tool](./defender-deployment-tool-windows.md). |

## October 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|All |[Streamlined connectivity support for US government environments (GCC, GCC High, DoD)](configure-device-connectivity.md) |Preview |Defender for Endpoint now supports streamlined connectivity for US government cloud environments. This enhancement simplifies onboarding by reducing the number of required service endpoints and improves reliability across restricted networks. For more information, see the [required connectivity settings](gov.md#required-connectivity-settings). |
|All |Isolation exclusions |GA |The [Isolation exclusions](isolation-exclusions.md) feature is now generally available. Isolation exclusions allow designated processes or endpoints to bypass the restrictions of network isolation, ensuring essential functions continue while limiting broader network exposure. |

## September 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|macOS |[Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md) |GA |Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |

## August 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
| macOS | GA |Defender for Endpoint can now monitor process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system.<br><br>Learn more:<br> - [Behavior Monitoring in Microsoft Defender for Endpoint on macOS](behavior-monitor-macos.md)<br>- [Behavior Monitoring GA announcement blog](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/behavior-monitoring-is-now-generally-available-for-microsoft-defender-for-endpoi/4415697) |

## May 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|---------|
|Windows |GA |Version 10.8797.25857.1000 released: See [enhancements and features for this release](microsoft-defender-endpoint-releases.md#108797258571000---may-2025). |