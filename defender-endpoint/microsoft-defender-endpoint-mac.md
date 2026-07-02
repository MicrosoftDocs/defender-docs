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
ai-usage: ai-assisted
ms.date: 05/19/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals

---
# Microsoft Defender for Endpoint on macOS

Microsoft Defender for Endpoint on macOS helps organizations prevent, detect, investigate, and respond to advanced threats on Mac devices. Built natively on Apple's system extension architecture, it delivers enterprise-grade protection optimized for macOS workloads - from software development to content creation - with seamless integration into your existing security operations through the Microsoft Defender portal.

## Security capabilities for macOS environments

The following table describes the core security capabilities offered by Microsoft Defender for Endpoint on macOS.

| Capability | Description |
|---|---|
| **Next-generation protection** | Provides real-time prevention against malware and emerging threats using cloud-based machine learning, behavioral monitoring, and heuristics. |
| **Endpoint detection and response (EDR)** | Delivers deep visibility into endpoint activity and enables rapid investigation and response to advanced attacks. |
| **Posture management** | Provides risk-based vulnerability management with intelligent prioritization, remediation, and tracking. |
| **Streamlined management and operations** | Simplifies deployment, configuration, and management through existing MDM tools and the Defender portal. |
| **Seamless integration and extensibility** | Extends visibility and response through native macOS architecture alignment, APIs, SIEM connectors, and the broader Defender suite. |

### Next-generation protection

Protect macOS endpoints from malware and advanced threats using real-time, behavior-based, and cloud-powered protection capabilities.

| Capability | Description |
|---|---|
| **Real-time protection** | [Next-generation antivirus protection](next-generation-protection.md) powered by local and cloud-based machine learning, behavioral monitoring, and heuristics. |
| **Cloud-delivered protection** | Provides near-instant detection and blocking of new and emerging threats, including infostealers, supply chain attacks, and other threats targeting macOS. |
| **[Security settings configuration](mac-preferences.md)** | Configure antivirus, cloud protection, and scan options, [detect and block potentially unwanted applications](mac-pua.md), and define custom [indicators of compromise](indicator-ip-domain.md) for IP addresses and URLs. |
| **[Network protection](network-protection-macos.md) and [web protection](web-protection-overview.md)** | Helps protect Mac devices from web-based threats by controlling connections to malicious or unwanted sites. |
| **[Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md)** | Safeguards security settings from unauthorized changes. |
| **[Device control](mac-device-control-overview.md)** | Monitors and restricts access to removable media - including USB storage, Bluetooth, and other peripherals - with granular policies deployed through [Intune](mac-device-control-intune.md) or [JAMF](mac-device-control-jamf.md). |

### Endpoint detection and response (EDR)

Detect, investigate, and respond to sophisticated attacks powered by AI-driven analytics and Microsoft Threat Intelligence.

| Capability | Description |
|---|---|
| **AI-driven detection** | Uses AI and advanced analytics to [detect and respond to threats](overview-endpoint-detection-response.md) in close to real time. |
| **Centralized management** | The Microsoft Defender portal at <https://security.microsoft.com> provides a central location to view detections and manage your organization's devices. |
| **[Advanced hunting](/defender-xdr/advanced-hunting-overview)** | Enables proactive threat hunting by querying raw event data for deeper insight into activity on Mac endpoints. |
| **[Response actions](respond-machine-alerts.md)** | Includes running antivirus scans, isolating devices, collecting investigation packages, and collecting files for deep analysis. |
| **[Live response](live-response.md)** | Provides remote shell connections for in-depth investigations directly on macOS devices. |

### Posture management

Continuously assess vulnerabilities and security posture to reduce risk exposure and prioritize remediation.

| Capability | Description |
|---|---|
| **[Vulnerability management](/defender-vulnerability-management/defender-vulnerability-management)** | Provides risk-based vulnerability management with intelligent prioritization, remediation, and tracking to help you manage and secure your Mac devices. |
| **[Exposure score](/defender-vulnerability-management/tvm-exposure-score)** | Provides a comprehensive view of your organization's risk exposure for your macOS fleet. |
| **[Security recommendations](/defender-vulnerability-management/tvm-security-recommendation)** | Provides actionable guidance to reduce endpoint risk. |
| **[Remediation tracking](/defender-vulnerability-management/tvm-remediation)** | Tracks remediation activities and exposure reduction. |
| **[Software inventory](/defender-vulnerability-management/tvm-software-inventory)** | Provides visibility into installed software on your macOS fleet. |

## Streamlined management and operations

Microsoft Defender for Endpoint on macOS provides flexible deployment and centralized management capabilities designed to simplify configuration, monitoring, and integration with other security tools in macOS environments.

| Capability | Description |
|---|---|
| **MDM integration** | Integrates with the management tools your organization already uses, including [Microsoft Intune](mac-install-with-intune.md), [JAMF](mac-install-with-jamf.md), and [other MDM solutions](mac-install-with-other-mdm.md). |
| **[Security settings configuration](mac-preferences.md)** | Centrally configure security settings, and [security settings management](/intune/intune-service/protect/mde-security-integration) lets you manage security policies directly from the Microsoft Defender portal without requiring full Intune enrollment. |
| **[Software updates](mac-updates.md)** | Delivered through Microsoft AutoUpdate (MAU), ensuring your Mac fleet stays current with the latest protection. |
| **[Management APIs](api/management-apis.md)** | Provides programmatic access to device management, vulnerability management, and threat intelligence. |

## Seamless integration and extensibility

Microsoft Defender for Endpoint on macOS integrates with existing security tools and workflows, extending into the broader Microsoft Defender ecosystem for unified visibility and coordinated security operations.

| Capability | Description |
|---|---|
| **[System extensions](mac-support-sys-ext.md)** | Built on Apple's system extension architecture for long-term stability and compatibility, with native support for both Intel and Apple Silicon (Mx) processors. |
| **[API integration](api/apis-intro.md)** | Integrates seamlessly with the broader Microsoft Defender suite through API integration. |
| **SIEM connectors** | Enables connectivity with SIEM solutions for centralized monitoring and automated response. |
| **[Power BI support](api/api-power-bi.md)** | Extends visibility through Power BI reporting and role-based access control (RBAC). |

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## What's new in the latest release

To learn about what's new in endpoint security, see the latest updates in [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md). To learn about the latest macOS updates, see [What's new in Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-releases.md#macos-releases).

If you have feedback to share, open Microsoft Defender for Endpoint on your Mac device, and then go to **Help** > **Send feedback**. 
To get the latest features, including preview capabilities, configure your macOS device running Defender for Endpoint to use the Beta channel (formerly `Insider-Fast`).

## Related content

- [Review the prerequisites for Defender for Endpoint on macOS](microsoft-defender-endpoint-mac-prerequisites.md)
- [Resources for Microsoft Defender for Endpoint on macOS](mac-resources.md)
- [Configure Defender for Endpoint on macOS](mac-preferences.md)

