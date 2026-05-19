---
title: Microsoft Defender for Endpoint on macOS
ms.reviewer: joshbregman
description: Learn about Microsoft Defender for Endpoint on macOS capabilities, including threat protection, EDR, vulnerability management, and deployment options for Mac devices.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: overview
ms.subservice: macos
ms.date: 05/19/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals

---
# Microsoft Defender for Endpoint on macOS

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## What's new in the latest release

[What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md)

[What's new in Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-releases.md#macos-releases)

> [!TIP]
> If you have any feedback that you would like to share, submit it by opening Microsoft Defender for Endpoint on Mac on your device and navigating to **Help** \> **Send feedback**.

To get the latest features, including preview capabilities, configure your macOS device running Defender for Endpoint to use the Beta channel (formerly `Insider-Fast`).

## Overview

Microsoft Defender for Endpoint on macOS helps organizations prevent, detect, investigate, and respond to advanced threats on Mac devices. Built natively on Apple's system extension architecture, it delivers enterprise-grade protection optimized for macOS workloads—from software development to content creation—with seamless integration into your existing security operations through the Microsoft Defender portal.

The following table describes capabilities in Defender for Endpoint on macOS:

| Category | Description |
|---|---|
| **Posture management** | Defender for Endpoint on macOS provides risk-based [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management) with intelligent prioritization, remediation, and tracking to help you manage and secure your Mac devices. Your security team gains a comprehensive view of your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score), [security recommendations](/defender-vulnerability-management/tvm-security-recommendation), [remediation activities](/defender-vulnerability-management/tvm-remediation), and [software inventory](/defender-vulnerability-management/tvm-software-inventory) for your macOS fleet. |
| **Threat protection** | Defender for Endpoint on macOS includes [next-generation antivirus protection](next-generation-protection.md) powered by local and cloud-based machine learning, behavioral monitoring, and heuristics. Cloud protection provides near-instant detection and blocking of new and emerging threats, including infostealers, supply chain attacks, and other threats targeting macOS. You can [configure security settings](mac-preferences.md) including antivirus, cloud protection, and scan options, [detect and block potentially unwanted applications](mac-pua.md), and define custom [indicators of compromise](indicator-ip-domain.md) for IP addresses and URLs. <br/><br/> [Network protection](network-protection-macos.md) and [web protection](web-protection-overview.md) help protect your Mac devices from web-based threats by controlling connections to malicious or unwanted sites. [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) safeguards security settings from unauthorized changes. <br/><br/> [Device control](mac-device-control-overview.md) lets you monitor and restrict access to removable media—including USB storage, Bluetooth, and other peripherals—with granular policies deployed through [Intune](mac-device-control-intune.md) or [JAMF](mac-device-control-jamf.md). |
| **Endpoint detection and response** | Defender for Endpoint on macOS uses AI and advanced analytics to [detect and respond to threats](overview-endpoint-detection-response.md) close to real time. The Microsoft Defender portal at <https://security.microsoft.com> provides a central location to view detections and manage your organization's devices. <br/><br/> You can use [advanced hunting](/defender-xdr/advanced-hunting-overview) to query raw event data and gain deeper insight into activity on your Mac endpoints. [Response actions](respond-machine-alerts.md) include running antivirus scans, isolating devices, collecting investigation packages, and collecting files for deep analysis. [Live response](live-response.md) provides remote shell connections for in-depth investigations directly on macOS devices. |
| **Streamlined management and operations** | Defender for Endpoint on macOS integrates with the management tools your organization already uses, including [Microsoft Intune](mac-install-with-intune.md), [JAMF](mac-install-with-jamf.md), and [other MDM solutions](mac-install-with-other-mdm.md). You can [configure security settings](mac-preferences.md) centrally, and [security settings management](/intune/intune-service/protect/mde-security-integration) lets you manage security policies directly from the Microsoft Defender portal without requiring full Intune enrollment. <br/><br/> Software updates are delivered through [Microsoft AutoUpdate (MAU)](mac-updates.md), ensuring your Mac fleet stays current with the latest protection. Defender for Endpoint also provides a comprehensive set of [management APIs](api/management-apis.md) for programmatic access to device management, vulnerability management, and threat intelligence. |
| **Enterprise-grade performance and reliability** | Microsoft Defender for Endpoint on macOS is built on [system extensions](mac-support-sys-ext.md), fully aligned with Apple's security architecture for long-term stability and compatibility. The sensor is optimized for macOS workloads, with native support for both Intel and Apple Silicon (Mx) processors. <br/><br/> Defender for Endpoint integrates seamlessly with the broader Microsoft Defender suite, offering extensibility through [API integration](api/apis-intro.md), SIEM connectors, [Power BI support](api/api-power-bi.md), and role-based access control (RBAC). |

> [!TIP]
> For a detailed comparison of supported features for all Defender for Endpoint platforms (Windows, macOS, and Linux), see [Supported Microsoft Defender for Endpoint capabilities by platform](supported-capabilities-by-platform.md).

## Next steps

- [Review the prerequisites for Defender for Endpoint on macOS](microsoft-defender-endpoint-mac-prerequisites.md)
- [Deploy Defender for Endpoint on macOS](mac-install-with-intune.md)
- [Configure Defender for Endpoint on macOS](mac-preferences.md)
- [Deploy updates for Defender for Endpoint on macOS](mac-updates.md)

## See also

- [Resources for Microsoft Defender for Endpoint on macOS](mac-resources.md)
- [Privacy for Microsoft Defender for Endpoint on macOS](mac-privacy.md)
- [Turn on Network protection for macOS](network-protection-macos.md)
