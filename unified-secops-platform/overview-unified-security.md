---
title: "What is Microsoft's unified security operations platform?"
description: Provides an overview of features and functionality in the Microsoft's unified security operations platform
search.appverid: met150
ms.service: unified-secops-platform
ms.author: cwatson
author: cwatson-cat
ms.localizationpriority: medium
ms.date: 11/15/2024
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: overview

# customer intent: As a security operations center leader, I want to learn about the services and features available with Microsoft's unified security operations platform to help me determine whether it meets my organization's requirements.
---

# What is Microsoft's unified security operations platform?

Microsoft's unified security operations platform provides a single platform for end-to-end security operations (SecOps). It integrates security information and event management (SIEM), security orchestration, automation, and response (SOAR), extended detection and response (XDR), posture and exposure management, cloud security, threat intelligence, and generative AI solutions.

To cover all those capabilities, Microsoft's unified SecOps platform combines services like [Microsoft Defender XDR](/defender-xdr/microsoft-365-defender), [Microsoft Sentinel](/azure/sentinel/overview), [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management), and [Microsoft Security Copilot](/copilot/security/microsoft-security-copilot) in the Microsoft Defender portal. Integrate more Microsoft Defender services to add security and provide integrated protection against sophisticated attacks. The Defender portal provides a single location to monitor, detect, investigate, remediate, and respond against pre- and post-breach cybersecurity risks and threats.

:::image type="content" source="media/overview-unified-security/defender-portal-home.png" lightbox="media/overview-unified-security/defender-portal-home.png" alt-text="Screenshot of the home page of Microsoft's unified SecOps platform in the Defender portal.":::

## Protect assets

Protect a wide range of assets by integrating Defender XDR, Microsoft Sentinel, and other Defender services in Microsoft's unified SecOps platform.

Microsoft Defender XDR services include the following asset protection capabilities:

|Capability  |Security product  |
|---------|---------|
|Identify, detect, and investigate Microsoft Entra ID threats.|[Microsoft Defender for Identity](/defender-for-identity/what-is)|
|Protect against threats posed by email messages, URL links, and Office 365 collaboration tools.     |   [Microsoft Defender for Office 365](/defender-office-365/mdo-about)      |
|Monitor and protect endpoint devices. Monitor, detect, and investigate device breaches, and automatically respond to security threats.    |     [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint)    |
|Identify and protect operational technology (OT) and IT resources by extending Defender XDR protection to OT environments.|[Microsoft Defender for IoT](/defender-for-iot/microsoft-defender-iot)|
|Identify assets and software inventory, and assess device posture to find security vulnerabilities.|[Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)|
|Protect and control access to SaaS cloud apps.|[Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps)|

Asset protection for services not licensed with Microsoft Defender XDR includes the following capabilities:

|Capability  |Security product  |
|---------|---------|
|Monitor and protect non-Microsoft and on-premises devices, services, and solutions. | [Microsoft Sentinel](/azure/sentinel/overview) |
|Discover and assess assets, and remediate risk to reduce attack surfaces.|[Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management)|
|Improve multicloud and on-premises security posture, and protect cloud workloads against threats.|[Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)|

## Simplify security management

Combine Microsoft security services like [Defender XDR](/defender-xdr/microsoft-365-defender), [Microsoft Sentinel](/azure/sentinel/overview), and more for end-to-end pre- and post-breach protection of endpoints, identities, cloud apps and workloads, and email across your organization.

The Defender portal provides a single, centralized view of organizational security posture and threat detections and response. It provides a combined incidents queue that groups together information about security risks and breaches.

Free up analyst time as unified security dashboards enable analysts to cross organization silos, prioritize the most critical threats, and hunt effectively for attempted breaches.

The following image shows the unified incident queue in Microsoft's unified SecOps platform, with incidents from multiple service sources.

:::image type="content" source="media/overview-unified-security/unified-incidents.png" alt-text="Screenshot of the unified incident queue that shows incidents with multiple service sources." lightbox="media/overview-unified-security/unified-incidents.png":::

## Reduce security risk and prevent attacks

Consistently reduce security risk and prevent cybersecurity attacks as a part of your organizational risk management framework. Microsoft's unified SecOps platform offers comprehensive exposure management and cloud protection capabilities. With [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management), and [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction):

- Continuously discover organizational assets and assess their security posture.  
- Protect cloud workloads from code to runtime.
- Aggregate data and threat intelligence to discover security gaps and weaknesses, including analysis of potential attack paths.
- Investigate and query to get insights into security posture.
- Prioritize asset remediation, with the focus on critical resources, to reduce security gaps and attack surfaces.

The following image shows the overview page for exposure management in Microsoft's unified SecOps platform.

:::image type="content" source="media/overview-unified-security/exposure-management-overview.png" alt-text="Screenshot of the overview page in the exposure management of the Defender portal." lightbox="media/overview-unified-security/exposure-management-overview.png":::

## Reduce threat detection and response times

Standard cybersecurity metrics focus on the time to detect (TTD) and time to respond (TTR). Time to detect (TTD) measures how long it takes security teams to discover an incident. Time to respond (TTR) measures the amount of time it takes to respond after a threat is detected. The shorter the TTD and TTR, the more effective your detection, and response strategy is.

Microsoft's unified SecOps platform correlates millions of signals from Defender products, Microsoft Sentinel, Microsoft security research, and threat intelligence to identify attacks in progress. It initiates automatic attack disruption to automatically contain attacks, limiting lateral movement early and reducing attack impact. Automatic attack disruption helps to reduce costs associated with loss of productivity, provide control to the SecOps team control to investigate and remediate compromised assets.

Automatic attack disruption responds to threats by containing devices and containing or disabling users to mitigate attacks. 

The following image shows an example of an incident where automatic attack disruption was triggered.

:::image type="content" source="media/overview-unified-security/attack-disrupt.png" alt-text="Screenshot of the incidents attack that triggered automatic attack disruption." lightbox="media/overview-unified-security/attack-disrupt.png":::

For more information, see [Automatic attack disruption in Microsoft Defender XDR](/defender-xdr/automatic-attack-disruption).

## Transform SOC productivity with AI

Microsoft Security Copilot brings together the power of AI and human expertise to help your SOC team respond to attacks faster and more effectively. Security Copilot is embedded in the Defender portal to enable security teams to efficiently summarize incidents, analyze scripts and codes, analyze files, summarize device information, use guided responses to resolve incidents, generate KQL queries, and create incident reports. Security Copilot helps you to:

- **Reduce exposure and improve posture**. Prevent breaches with insights to uncover critical exposure risk, and risk reduction recommendations.
- **Prevent and disrupt threats**. Identify and prioritize with incident summaries MITRE ATT&CK framework mapping, and automatic alert enrichment.
- **Empower analysts**:
  - Accelerate incident resolution with guided responses, automated remediation, and summary report generation.
  - Provide intelligent assistance with tailored prompts based on best practices that analyze malicious scripts and files, and suggest KQL queries.

The following image shows the integration of Microsoft Copilot in an incident page in the Defender portal.

:::image type="content" source="media/overview-unified-security/security-copilot.png" alt-text="Screenshot that shows the incidents integration of Microsoft Copilot in the Defender." lightbox="media/overview-unified-security/security-copilot.png":::

For more information, see [Microsoft Copilot in Microsoft Defender](/defender-xdr/security-copilot-in-microsoft-365-defender).

## Related content

- Blog post: [AI-powered, unified SecOps](https://www.microsoft.com/security/business/solutions/ai-powered-unified-secops-platform)
- [Microsoft's unified security operations platform planning overview](overview-plan.md)
- [Deploy Microsoft's unified security operations platform](overview-deploy.md)
