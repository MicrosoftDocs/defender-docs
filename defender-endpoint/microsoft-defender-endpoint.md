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
ms.topic: overview
ms.date: 05/19/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Microsoft Defender for Endpoint overview

Microsoft Defender for Endpoint is an enterprise endpoint security platform designed to help organizations prevent, detect, investigate, and respond to advanced threats on their endpoints. These endpoints include laptops, phones, tablets, PCs, access points, routers, and firewalls.

As the endpoint security pillar of [Microsoft Defender](/defender-xdr/), Defender for Endpoint feeds endpoint signals into the unified Defender portal. The portal correlates these signals with alerts from identity, email, and cloud workloads to form complete incident views. Your security team can trace an attack from a phishing email to a compromised endpoint to lateral movement - all in one place.

Defender for Endpoint also [integrates](threat-protection-integration.md) with the broader Microsoft security ecosystem, including:

* [Intune](/intune/intune-service/)
* [Microsoft Defender for Cloud](/azure/defender-for-cloud/)
* [Microsoft Defender for Cloud Apps](/defender-cloud-apps/)
* [Microsoft Defender for Identity](/defender-for-identity/)
* [Microsoft Defender for Office](/defender-office-365/)
* [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
* [Microsoft Sentinel](/azure/sentinel/)

## Operating systems

Microsoft Defender for Endpoint supports the following operating systems: Windows, macOS, Linux, Android, and iOS. For detailed information about capabilities on each platform, see the following articles.

- [Defender for Endpoint on Windows](microsoft-defender-endpoint-windows.md)
- [Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)
- [Android and iOS](mtd.md)

For detailed system requirements and supported versions, see [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).

## Licensing

Defender for Endpoint is available in three plans:

* **Microsoft Defender for Business** - An endpoint security solution designed for small and medium-sized businesses (up to 300 users).
* **Defender for Endpoint Plan 1** - Provides core endpoint protection capabilities, including next-generation antivirus, attack surface reduction, and centralized management.
* **Defender for Endpoint Plan 2** - A comprehensive endpoint protection solution that includes advanced capabilities such as endpoint detection and response, automated investigation, and vulnerability management.

Microsoft 365 E5 and Microsoft 365 E5 Security include Defender for Endpoint. To onboard servers, you need server licenses. For more information, see the licensing section in [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md#licensing-requirements).

For full plan comparison and pricing, see [Microsoft Defender for Endpoint plans and pricing](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-endpoint#Licensing).

## Defender for Endpoint capabilities

Defender for Endpoint provides a comprehensive set of capabilities, including [endpoint detection and response](overview-endpoint-detection-response.md), [automated investigation and remediation](automated-investigations.md), [next-generation protection](next-generation-protection.md), [attack surface reduction](overview-attack-surface-reduction.md), [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management), [Endpoint Attack Notifications](endpoint-attack-notifications.md), and [APIs](api/management-apis.md) for integration with your existing workflows.

For guidance on planning and rolling out Defender for Endpoint in your environment, see [Plan your Defender for Endpoint deployment](mde-planning-guide.md). To learn about new and upcoming capabilities, see [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md). To turn on preview features in your environment, see [Preview features in Microsoft Defender XDR](/defender-xdr/preview).

For platform-specific capabilities, see the [Windows](microsoft-defender-endpoint-windows.md), [Linux](microsoft-defender-endpoint-linux.md), [macOS](microsoft-defender-endpoint-mac.md), and [mobile threat defense](mtd.md) documentation.

### Mobile threat defense

Microsoft Defender for Endpoint extends protection to iOS and Android devices through mobile threat defense (MTD) capabilities. For more information about supported features on mobile platforms, see [Microsoft Defender for Endpoint on mobile devices](mtd.md).

### APIs and integrations

Use these capabilities to integrate Microsoft Defender for Endpoint with your existing security tools and workflows, and automate tasks by using APIs. [Management and automation APIs](api/management-apis.md) enable you to automate workflows and integrate Defender for Endpoint into your existing processes. You can also use [partner integrations](partner-integration.md) to connect with Microsoft and non-Microsoft security solutions.

## Privacy and compliance

* [Zero Trust](zero-trust-with-microsoft-defender-endpoint.md)
* [Microsoft Trust Center - Data protection and privacy](https://www.microsoft.com/trust-center/privacy)
* [Privacy at Microsoft](https://privacy.microsoft.com/)
* [Privacy & data management overview](/compliance/assurance/assurance-privacy)

## Related content

* [Pilot and deploy Defender for Endpoint](/defender-xdr/pilot-deploy-defender-endpoint)
* [Plan your Defender for Endpoint deployment](mde-planning-guide.md)
* [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md)
