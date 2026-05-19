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

# Microsoft Defender for Endpoint

Microsoft Defender for Endpoint is an enterprise endpoint security platform designed to help organizations prevent, detect, investigate, and respond to advanced threats on their endpoints — including laptops, phones, tablets, PCs, access points, routers, and firewalls.

As the endpoint security pillar of [Microsoft Defender](/defender-xdr/), Defender for Endpoint feeds endpoint signals into the unified Defender portal, where they are correlated with alerts from identity, email, and cloud workloads to form complete incident views. This means your security team can trace an attack from a phishing email to a compromised endpoint to lateral movement — all in one place.

Defender for Endpoint also [integrates](threat-protection-integration.md) with the broader Microsoft security ecosystem, including:

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

For detailed system requirements and supported versions, see [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md). To view a list of capabilities and the operating systems that support them, see [Supported Microsoft Defender for Endpoint capabilities by platform](supported-capabilities-by-platform.md).

## Licensing

Defender for Endpoint is available in three plans:

* **Microsoft Defender for Business** - An endpoint security solution designed for small and medium-sized businesses (up to 300 users).
* **Defender for Endpoint Plan 1** - Provides core endpoint protection capabilities, including next-generation antivirus, attack surface reduction, and centralized management.
* **Defender for Endpoint Plan 2** - A comprehensive endpoint protection solution that includes advanced capabilities such as endpoint detection and response, automated investigation, and vulnerability management.

Defender for Endpoint is also included in Microsoft 365 E5 and Microsoft 365 E5 Security. To onboard servers, server licenses are required. For more information, see the licensing section in [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md#licensing-requirements).

For full plan comparison and pricing, see [Microsoft Defender for Endpoint plans and pricing](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-endpoint#Licensing).

## Defender for Endpoint capabilities

Defender for Endpoint provides a comprehensive set of capabilities, including [endpoint detection and response](overview-endpoint-detection-response.md), [automated investigation and remediation](automated-investigations.md), [next-generation protection](next-generation-protection.md), [attack surface reduction](overview-attack-surface-reduction.md), [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management), [Endpoint Attack Notifications](endpoint-attack-notifications.md), and [APIs](api/management-apis.md) for integration with your existing workflows. For a detailed list of capabilities and the operating systems that support them, see [Supported Microsoft Defender for Endpoint capabilities by platform](supported-capabilities-by-platform.md).

For guidance on planning and rolling out Defender for Endpoint in your environment, see [Plan your Defender for Endpoint deployment](mde-planning-guide.md). To learn about new and upcoming capabilities, see [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md). To turn on preview features in your environment, see [Preview features in Microsoft Defender XDR](/defender-xdr/preview).

### Mobile threat defense

Microsoft Defender for Endpoint extends protection to iOS and Android devices through mobile threat defense (MTD) capabilities. For more information about supported features on mobile platforms, see [Microsoft Defender for Endpoint on mobile devices](mtd.md).

### APIs and integrations

By using these capabilities, you can integrate Microsoft Defender for Endpoint with your existing security tools and workflows. You can also automate tasks by using APIs.

| Feature | Description |
|---|---|
| [Management and automation APIs](api/management-apis.md) | Automate workflows and integrate Microsoft Defender for Endpoint into your existing processes. |
| [Partner integrations](partner-integration.md) | Integration with Microsoft and non-Microsoft security solutions. |

## Platform-specific information

Defender for Endpoint provides protection for Windows, macOS, Linux, Android, and iOS. For detailed information about capabilities, deployment, and configuration on each platform, see the following articles:

- [Defender for Endpoint on Windows](microsoft-defender-endpoint-windows.md)
- [Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)

## Privacy and compliance

* [Zero Trust](zero-trust-with-microsoft-defender-endpoint.md)
* [Microsoft Trust Center - Data protection and privacy](https://www.microsoft.com/trust-center/privacy)
* [Privacy at Microsoft](https://privacy.microsoft.com/)
* [Privacy & data management overview](/compliance/assurance/assurance-privacy)

## Related content

* [Pilot and deploy Defender for Endpoint](/defender-xdr/pilot-deploy-defender-endpoint)
* [Plan your Defender for Endpoint deployment](mde-planning-guide.md)
* [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md)
