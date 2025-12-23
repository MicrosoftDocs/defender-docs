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

- [Microsoft Defender for Endpoint supported versions](microsoft-defender-endpoint-versions.md)
- [Preview features](/defender-xdr/preview)

## December 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8412.0101 |GA |Build 1.0.8412.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--december-2025--1084120101). |
|Android |Build 1.0.8321.0101 |GA |Build 1.0.8321.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--december-2025--1083210101). |
|macOS |Build 101.25102.0019 |GA |Release version 20.125102.19.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--december-2025--101251020019). |
|All |[Triage collection](/azure/sentinel/datalake/sentinel-mcp-triage-tool) |Preview |Use triage collection to prioritize incidents and hunt threats with the Sentinel Model Context Protocol (MCP) server.|

## November 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Windows Antivirus |Platform 4.18.25110.6 / Engine 1.1.25110.1 |GA |Platform 4.18.25110.6 and Engine 1.1.25110.1 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--november-2025--418251106). |
|Android |Build 1.0.8315.0101 |GA |Build 1.0.8315.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--november-2025--1083150101). |
|Android |Build 1.0.8303.0101 |GA |Build 1.0.8303.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--november-2025--1083030101). |
|macOS |Build 101.25102.0016 |GA |Release version 20.125102.16.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--november-2025--101251020016). |
|Windows |New predictive shielding response actions |Preview |Defender for Endpoint now includes the [GPO hardening](respond-machine-alerts.md#gpo-hardening) and [Safeboot hardening](respond-machine-alerts.md#safeboot-hardening) response actions. These actions are part of the [predictive shielding](/defender-xdr/shield-predict-threats) feature, which anticipates and mitigates potential threats before they materialize.|
|All |[Custom data collection](custom-data-collection.md) |Preview |Custom data collection enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. |
| Windows, Linux | Defender deployment tool<br/>- [for Windows devices](./defender-deployment-tool-windows.md)<br/>- [for Linux devices](./linux-install-with-defender-deployment-tool.md) |Preview | The new Defender deployment tool is a lightweight, self-updating application that streamlines onboarding devices to the Defender endpoint security solution. The tool takes care of prerequisites, automates migrations from older solutions, and removes the need for complex onboarding scripts, separate downloads, and manual installations. It currently supports Windows and Linux devices. |
| Windows | [Defender endpoint security solution for Windows 7 SP1 and Windows Server 2008 R2 SP1](./onboard-downlevel.md#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security) |Preview | A Defender for endpoint security solution is now available for legacy Windows 7 SP1 and Windows Server 2008 R2 SP1 devices. The solution provides advanced protection capabilities and improved functionality for these devices compared to other solutions. The new solution is available using the new [Defender deployment tool](./defender-deployment-tool-windows.md). |

## October 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8217.0101 |GA |Build 1.0.8217.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--october-2025--1082170101). |
|Android |Build 1.0.8201.0101 |GA |Build 1.0.8201.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--october-2025--1082010101). |
|macOS |Build 101.25082.0006 |GA |Release version 20.125082.6.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--october-2025--101250820006). |
|Windows Antivirus |Platform 4.18.25100.9008 / Engine 1.1.25100.9002 |GA |Platform 4.18.25100.9008 and Engine 1.1.25100.9002 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--october-2025--418251009008). |
|All |[Streamlined connectivity support for US government environments (GCC, GCC High, DoD)](configure-device-connectivity.md) |Preview |Defender for Endpoint now supports streamlined connectivity for US government cloud environments. This enhancement simplifies onboarding by reducing the number of required service endpoints and improves reliability across restricted networks. For more information, see the [required connectivity settings](gov.md#required-connectivity-settings). |
|All |Isolation exclusions |GA |The [Isolation exclusions](isolation-exclusions.md) feature is now generally available. Isolation exclusions allow designated processes or endpoints to bypass the restrictions of network isolation, ensuring essential functions continue while limiting broader network exposure. |
|Linux |Build 101.25092.0001 |GA |Release version 30.125092.0001.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--october-2025--101250920001). |

## September 2025

|Platform  |Feature  |Preview/GA  |Description  |
|----------|---------|------------|-------------|
|Android |Build 1.0.8102.0101 |GA |Build 1.0.8102.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--september-2025--1081020101). |
|macOS |Build 101.25072.0011 |GA |Release version 20.125072.11.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--september-2025--101250720011). |
|Windows Antivirus |Platform 4.18.25090.3009 / Engine 1.1.25090.3001 |GA |Platform 4.18.25090.3009 and Engine 1.1.25090.3001 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--september-2025--418250903009). |
|macOS |[Configure offline security intelligence updates for Microsoft Defender for Endpoint on macOS](./mac-support-offline-security-intelligence-update.md) |GA |Enables organizations to update security intelligence (antivirus definitions/signatures) on macOS endpoints offline from a local mirror server. |
|Linux |Build 101.25082.0003 |GA |Release version 30.125082.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--september-2025--101250820003-build-1). |
|Linux |Build 101.25072.0003 |GA |Release version 30.125072.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--september-2025--101250720003-build-2). |

## August 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
|Android |GA |Build 1.0.8018.0103 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#android--august-2025--1080180103). |
|macOS |GA |Build 101.25062.0006, Release version 20.125062.6.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--august-2025--101250620006). |
|Windows Antivirus |GA |Platform 4.18.25080.5 and Engine 1.1.25080.5 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#windows-antivirus--august-2025--418250805). |
| macOS | GA |Defender for Endpoint can now monitor process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system.<br><br>Learn more:<br> - [Behavior Monitoring in Microsoft Defender for Endpoint on macOS](behavior-monitor-macos.md)<br>- [Behavior Monitoring GA announcement blog](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/behavior-monitoring-is-now-generally-available-for-microsoft-defender-for-endpoi/4415697) |
| Linux | GA |Build 101.25062.0003, Release version 30.125062.0003.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--august-2025--101250620003). |

## July 2025

|Platform  |Preview/GA  |Features  |
|---------|------------|---------|
|Android |GA |Build 1.0.7901.0101 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#1079010101---july-2025). |
|macOS |GA |Build 101.25062.0005, Release version 20.125062.5.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#macos--july-2025--101250620005). |
|Linux |GA |Build 101.25052.0007, Release version 30.125052.0007.0 released: See [enhancements and features for this release](microsoft-defender-endpoint-versions.md#linux--july-2025--101250520007). |