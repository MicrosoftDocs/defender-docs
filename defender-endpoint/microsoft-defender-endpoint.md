---
title: Microsoft Defender for Endpoint
description: Learn about Microsoft Defender for Endpoint, an enterprise endpoint security platform that helps defend against advanced persistent threats.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.localizationpriority: high
ms.collection: 
- m365-security
- tier1
- essentials-overview
ms.custom: intro-overview
ms.topic: article
ms.date: 11/05/2025
#customer intent:  As an IT security leader or SOC engineer responsible for endpoint protection, I want a concise overview of Microsoft Defender for Endpoint's capabilities, integrations, and deployment considerations, so I can evaluate its fit for my organization and plan onboarding and operations.
---

# Microsoft Defender for Endpoint

Microsoft Defender for Endpoint is an enterprise endpoint security platform designed to help enterprises prevent, detect, investigate, and respond to advanced threats on their endpoints. Endpoints include laptops, phones, tablets, PCs, access points, routers, and firewalls.

Defender for Endpoint is part of [Microsoft Defender XDR](/defender-xdr/) and can be [integrated](threat-protection-integration.md) with other Microsoft solutions, including:

* [Intune](/intune/intune-service/)
* [Microsoft Defender for Cloud](/azure/defender-for-cloud/)
* [Microsoft Defender for Cloud Apps](/defender-cloud-apps/)
* [Microsoft Defender for Identity](/defender-for-identity/)
* [Microsoft Defender for Office](/defender-office-365/)
* [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
* [Microsoft Sentinel](/azure/sentinel/)

## Operating systems

Defender for Endpoint supports the following operating systems:

* Windows
* macOS
* Linux
* Android
* iOS

## Licensing

Defender for Endpoint is available in three plans. You can find more information about these plans and additional Defender licenses in [Microsoft 365 guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance).

* [Microsoft Defender for Business](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-business) - An endpoint security solution designed for small and medium-sized businesses.
* [Defender for Endpoint Plan 1](defender-endpoint-plan-1.md) - Provides core endpoint protection capabilities.
* [Defender for Endpoint Plan 2](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#which-licenses-provide-the-rights-for-users-to-benefit-from-the-service-1) - A comprehensive endpoint protection solution that includes advance capabilities.

## Defender for Endpoint capabilities

This section lists key Defender for Endpoint capabilities and provides links to more detailed information. To view a list of core capabilities and the operating systems that support them, see [Supported Microsoft Defender for Endpoint capabilities by platform](supported-capabilities-by-platform.md).

| Capability | Description |
|---|---|
|[APIs](api/management-apis.md) |Automate Defender for Endpoint and integrate it into your existing workflows. |
|[Attack surface reduction](attack-surface-reduction-overview.md) |Ensures endpoint settings are properly configured and secure, and that vulnerabilities are mitigated. Includes [network protection](network-protection.md) and [web protection](web-protection-overview.md), which regulate access to malicious IP addresses, domains, and URLs. |
|[Automated investigation and remediation](automated-investigations.md) |Automatic investigation and remediation capabilities. |
|[Endpoint Attack Notifications](endpoint-attack-notifications.md) |Proactive hunting, prioritization, and insights that help identify and respond to threats. |
|[Endpoint detection and response](overview-endpoint-detection-response.md) |Detect, investigate, and respond to advanced threats. Includes [advanced hunting](/defender-xdr/advanced-hunting-overview) which provides a query-based threat-hunting tool that lets you proactively find breaches and create custom detections. |
|[Microsoft Secure Score for Devices](/defender-vulnerability-management/tvm-microsoft-secure-score-devices) |Assess the security state of your network, identify unprotected systems, and take actions to improve your organization's security. |
|[Next-generation protection](next-generation-protection.md) |Catch and block all types of emerging threats. |
|[AI coding agent discovery](/defender-xdr/security-for-ai/ai-agent-inventory#discover-local-ai-coding-agents-on-endpoints-preview) (Preview) |Automatically discover supported AI coding agents running locally on endpoint devices and surface them in the Microsoft Defender portal's AI agent inventory, exposure map, and Advanced Hunting. |
|[Predictive shielding](/defender-xdr/shield-predict-threats) (Preview) |Proactively anticipates attacker progression during an active attack and applies targeted hardening — such as GPO restrictions, Safeboot enforcement, and user containment — to at-risk assets before attackers reach them. Extends [automatic attack disruption](/defender-xdr/automatic-attack-disruption). |

## Privacy and compliance

Follow these links to learn more about privacy and compliance at Microsoft, and Defender for Endpoint.

* [Zero Trust](zero-trust-with-microsoft-defender-endpoint.md)
* [Microsoft Trust Center - Data protection and privacy](https://www.microsoft.com/trust-center/privacy)
* [Privacy at Microsoft](https://privacy.microsoft.com/)
* [Privacy & data management overview](/compliance/assurance/assurance-privacy)
