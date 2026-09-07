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
ms.date: 07/28/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Endpoint for servers
  - Microsoft Defender for Business servers
---

# Microsoft Defender for Endpoint overview

Microsoft Defender for Endpoint is an enterprise endpoint security platform designed to help organizations prevent, detect, investigate, and respond to advanced threats on their endpoints. These endpoints include laptops, phones, tablets, PCs, access points, routers, and firewalls.
<!-- TODO: Starting June 2, update the endpoints list to include "agents" after Project Raven release. -->

As the endpoint security pillar of [Microsoft Defender](/defender-xdr/), Defender for Endpoint feeds endpoint signals into the unified Defender portal. The portal correlates these signals with alerts from identity, email, and cloud workloads to form complete incident views. Your security team can trace an attack from a phishing email to a compromised endpoint to lateral movement - all in one place.

Defender for Endpoint also integrates with the broader Microsoft security ecosystem, including:

* [Intune](/intune/intune-service/)
* [Microsoft Defender for Cloud](/azure/defender-for-cloud/)
* [Microsoft Defender for Cloud Apps](/defender-cloud-apps/)
* [Microsoft Defender for Identity](/defender-for-identity/)
* [Microsoft Defender for Office 365](/defender-office-365/)
* [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
* [Microsoft Sentinel](/azure/sentinel/)
* [Microsoft threat intelligence](threat-protection-integration.md)

## Operating systems

Microsoft Defender for Endpoint supports the following operating systems: Windows, macOS, Linux, Android, and iOS. For detailed information about capabilities on each platform, see the following articles.

- [Microsoft Defender for Endpoint on Windows](microsoft-defender-endpoint-windows.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint on Android and iOS](mtd.md)

For detailed system requirements and supported versions, see [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).

## Licensing

Defender for Endpoint is available with several licensing options, including Defender for Endpoint Plan 1, Plan 2, and Microsoft Defender for Business. Microsoft 365 E5 and Microsoft 365 E5 Security include Defender for Endpoint Plan 2. For licensing requirements, see [Minimum requirements for Microsoft Defender for Endpoint](/defender-endpoint/minimum-requirements#licensing-requirements). For full plan comparison and pricing, see [Microsoft Defender for Endpoint plans and pricing](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-endpoint#Licensing).

> [!TIP]
> The more Microsoft Defender workloads you deploy (identity, email, cloud apps, and endpoints), the stronger your overall protection becomes. Each workload contributes signals that enrich detection, correlation, and automated response in the unified Defender portal.

### Server licensing and Defender for Servers

If you're using Defender for Endpoint on servers, you might be eligible for a discount if you're also using [Microsoft Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview). Learn about [licensing discounts available when you have both Defender for Endpoint and Defender for Servers](/azure/defender-for-cloud/faq-defender-for-servers#can-i-get-a-discount-if-i-already-have-a-microsoft-defender-for-endpoint-license-).

## Defender for Endpoint capabilities

Defender for Endpoint provides a comprehensive set of capabilities, including [endpoint detection and response](overview-endpoint-detection-response.md), [autonomous protection](/defender-xdr/automatic-attack-disruption) with [automatic attack disruption](/defender-xdr/automatic-attack-disruption) and [predictive shielding](/defender-xdr/shield-predict-threats), [next-generation protection](next-generation-protection.md) with ransomware prevention, [attack surface reduction](overview-attack-surface-reduction.md), [vulnerability management](/defender-vulnerability-management/defender-vulnerability-management), [Endpoint Attack Notifications](endpoint-attack-notifications.md), and [APIs](api/management-apis.md) for integration with your existing workflows.

For guidance on planning and rolling out Defender for Endpoint in your environment, see [Plan your Defender for Endpoint deployment](mde-planning-guide.md). Before you begin, review [Minimum requirements](minimum-requirements.md) to confirm your environment is ready. To learn about new and upcoming capabilities, see [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md). To turn on preview features in your environment, see [Preview features in Microsoft Defender XDR](/defender-xdr/preview).

For a step-by-step workflow for piloting and deploying Defender for Endpoint in a production environment, including onboarding endpoints and verifying pilot groups, see [Pilot and deploy Defender for Endpoint](/defender-xdr/pilot-deploy-defender-endpoint).

For platform-specific capabilities, see the [Windows](microsoft-defender-endpoint-windows.md), [Linux](microsoft-defender-endpoint-linux.md), [macOS](microsoft-defender-endpoint-mac.md), and [Android and iOS mobile threat defense](mtd.md) documentation.

### APIs and integrations

Use these capabilities to integrate Microsoft Defender for Endpoint with your existing security tools and workflows, and automate tasks by using APIs. [Management and automation APIs](api/management-apis.md) enable you to automate workflows and integrate Defender for Endpoint into your existing processes. You can also use [partner integrations](partner-integration.md) to connect with Microsoft and non-Microsoft security solutions.

## Privacy and compliance

Defender for Endpoint is built with privacy, data protection, and regulatory compliance as core principles. For details on how Defender for Endpoint collects, stores, and protects your data, see [Data storage and privacy](data-storage-privacy.md).

Defender for Endpoint supports a [Zero Trust](zero-trust-with-microsoft-defender-endpoint.md) security model, helping you verify identities and device health before granting access. To learn more about Microsoft's data handling practices and privacy commitments, visit the [Microsoft Trust Center](https://www.microsoft.com/trust-center/privacy) and [Privacy at Microsoft](https://privacy.microsoft.com/). For an overview of how Microsoft manages data privacy and protection in compliance with global standards, see [Privacy and data management](/compliance/assurance/assurance-privacy).

## Related content

* [Pilot and deploy Defender for Endpoint](/defender-xdr/pilot-deploy-defender-endpoint)
* [Plan your Defender for Endpoint deployment](mde-planning-guide.md)
* [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md)
