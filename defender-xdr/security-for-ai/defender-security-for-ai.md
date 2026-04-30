---
title: Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.update-cycle: 180-days
ms.date: 03/03/2026
audience: Admin
ms.topic: concept-article
description: Learn how Microsoft Defender secures AI workloads across their lifecycle - from build and configuration to runtime - and supports organizations in managing AI security risks.
---

# Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender

Adopting artificial intelligence (AI) introduces new security threats and vulnerabilities beyond the risks posed by traditional applications. AI exposes new attack surfaces across AI agents and applications, the AI models they use, plugins to these assets, and generative AI prompts and responses.

By embedding security into the fabric of AI development and operations, Microsoft lets you build AI responsibly and adopt AI with confidence, at scale. As part of Microsoft’s comprehensive approach to AI security, Microsoft Defender helps you discover AI assets and detect, block, and investigate AI‑specific threats during development, configuration, and runtime execution.

This article provides an overview of the Microsoft Defender capabilities that help secure AI assets against vulnerabilities and emerging threats.

## The AI threat landscape

AI security threats span the full AI lifecycle, from build‑time and configuration risks - such as misconfigurations and insecure dependencies - to runtime threats affecting AI agents and applications.

Key security risks to your AI assets include:

- **Model and supply-chain risks** - The models your AI assets depend on are high-value targets. A single compromised dependency in a model's supply chain can turn every agent and application that relies on it into an attack vector for exfiltrating credentials, installing backdoors, and spreading vulnerabilities across your infrastructure. 
- **Agent misconfiguration and over-privilege** - Agents with excessive permissions or improperly configured tool authentication can enable unauthorized access to sensitive resources.
- **Runtime abuse and misuse** - Agents or applications can perform unsafe actions at execution time due to malicious inputs, unexpected reasoning paths, or compromised dependencies.
- **Prompt- and content-based attacks** - Beyond malicious inputs, more subtle tactics, such as zero-click attacks using hidden instructions embedded in emails or retrieved content, can manipulate agent behavior, cause data leakage, or trigger unintended actions.

Addressing these risks requires security controls that span discovery, posture management, detection, and runtime protection.

## Secure AI assets across the AI lifecycle using Microsoft Defender

Microsoft Defender helps security teams address AI risks across the AI lifecycle by providing visibility into AI assets, assessing their security posture, detecting and blocking AI‑specific threats, and providing the signals and context needed to investigate threats - from build time through the AI application and agent lifecycle, including runtime. 

:::image type="content" source="media/defender-security-for-ai/defender-secure-ai-lifecycle.png" alt-text="Diagram of AI lifecycle risks, highlighting usage, agent misbehavior, data leaks, and model threats." lightbox="media/defender-security-for-ai/defender-secure-ai-lifecycle.png":::

The following sections describe how Microsoft Defender applies these capabilities to:

- **AI agents**, where configuration, permissions, and runtime behavior - including tool usage and agent decision‑making-introduce exposure.
- **AI applications and infrastructure**, including models, platforms, services, and integrations, where supply-chain risks, configuration, and deployment weaknesses can create broader attack paths.


## Protect AI agents using Microsoft Defender (Preview)

AI agents introduce unique security risks because of their ability to reason, invoke tools, access data, and take autonomous actions across systems. Securing agents at scale requires centralized visibility, security posture and risk management, runtime protection, and advanced investigation capabilities to detect the root cause of the attack.

[Microsoft Agent 365](/microsoft-agent-365/overview) provides an enterprise control plane for managing and governing AI agents across the organization. When you enable your Agent 365 license, Microsoft Defender integrates with Agent 365 and provides AI agent security at two levels, as described in the table below:
- **Agents onboarded to Microsoft Agent 365** - Microsoft Defender provides a core set of security capabilities, from discovery and risk-based prioritization to runtime and investigation capabilities.
- **Extended capabilities for supported agents** - Microsoft Defender provides extended security capabilities for supported agents when you enable the relevant features. These extended capabilities are available for agents built with Microsoft Copilot Studio and the following pro‑developer platforms: Microsoft Foundry, AWS Bedrock, and GCP Vertex AI. Capability availability varies by platform and scenario, as detailed in the table below.


| Capability | Description | Learn more |
|---|---|---|
| **AI agent discovery** | <ul><li>**All Agent 365-managed agents** - Discover all agents onboarded to Agent 365 using the [Microsoft Agent 365 SDK](/microsoft-agent-365/developer/)  and view agent details and configuration attributes using Kusto Query Language (KQL) queries in Advanced Hunting in Microsoft Defender.</li><li>**Extended capabilities for supported agents** - The AI agent inventory in the Defender portal shows supported agents in a unified UI. This is currently supported for agents built with Microsoft Copilot Studio, Microsoft Foundry, AWS Bedrock, and GCP Vertex AI.</li></ul> | [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory) |
| **Agent security posture management** | <ul><li>**All Agent 365-managed agents** - Use Advanced Hunting in Microsoft Defender, which provides a set of prebuilt queries to help you identify misconfigurations, risky agent settings, and excessive permissions. </li><li>**Extended capabilities for supported agents** - The AI agent inventory in the Defender portal lets you assess security posture through risk factors, attack paths, and prioritized security recommendations. This is currently supported for agents built with Microsoft Foundry, AWS Bedrock, and GCP Vertex AI.</li></ul> | [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory) |
| **Agent threat detection and blocking** | <ul><li>**All Agent 365-managed agents** - **Near‑real‑time detections** surface alerts based on Agent 365 observability data. **Real‑time protection** evaluates actions before an agent invokes a tool and can block unsafe behavior. Microsoft Defender reports blocked actions in alerts for further investigation.<br>These capabilities help protect against prompt‑based attacks, unsafe tool usage, credential exposure, data exfiltration, and anomalous execution patterns.</li><li> **Extended capabilities for supported agents** - Agents built with Microsoft Copilot Studio have an extended set of real‑time protection capabilities and near‑real‑time detection alerts. Agents built with Microsoft Foundry have an extended set of near‑real‑time detection alerts.</li></ul>| [Detect, block, and investigate threats to AI agents using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-detection-protection) |
| **Agent threat investigation and hunting**| <ul><li>**All Agent 365-managed agents** - Microsoft Defender correlates signals from all of your Defender products into incidents. Analysts see the full context of a potential attack, including the relationships between involved entities and the blast radius of AI agent threats, using the incident graph and investigation experience. Use Advanced Hunting to query agent activity alongside other security data to support investigation and threat hunting.</li><li>**Extended investigation capabilities** - Enable the Microsoft 365 app connector to collect Agent 365 observability data, which provides deeper investigation and more flexible threat hunting by exposing detailed records of agent actions.</li></ul> | [Detect, block, and investigate threats to AI agents using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-detection-protection)|

## Protect AI infrastructure using Microsoft Defender

It’s critical to protect the generative AI models, services, and infrastructure that AI applications and agents depend on. Compromised models, insecure configurations, or exposed dependencies can introduce supply‑chain risks that affect multiple AI workloads.

For information on enabling threat protection for AI infrastructure, see [Enable threat protection for AI services](/azure/defender-for-cloud/ai-onboarding).

This table lists the Microsoft Defender capabilities that help secure generative AI models and applications:

| Capability | Description | Learn more |
|---|---|---|
| **AI infrastructure discovery** | A unified view of your organization's AI infrastructure, including deployed models, services, and related AI resources. | [AI security posture management](/azure/defender-for-cloud/ai-security-posture) |
| **AI infrastructure security posture management** | Identify vulnerabilities and misconfigurations across AI artifacts, including models, dependencies, code repositories, and container images. <br><br> Use built‑in security recommendations and attack‑path analysis to prioritize remediation. <br><br> Continuously assess AI models for security risks such as malware, unsafe operators, serialization vulnerabilities, and exposed secrets throughout the AI lifecycle.  | [AI security posture management](/azure/defender-for-cloud/ai-security-posture) |
| **Threat detection** | Detect threats targeting generative AI applications built with Microsoft Foundry, including suspicious prompt activity and abnormal execution behavior, with contextual signals surfaced in security alerts. | [Alerts for AI services](/azure/defender-for-cloud/alerts-ai-workloads) |
| **Threat investigation and hunting** | Microsoft Defender XDR incident correlation and Advanced Hunting capabilities help defenders understand the full context and blast radius of AI infrastructure threats. | [Investigate incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview) |

## Next steps

Learn more about these capabilities and how to use them to secure your AI assets:

- [Discover AI agents and assess security posture using Microsoft Defender](ai-agent-inventory.md)
- [Detect, block, and investigate threats to AI agents using Microsoft Defender](ai-agent-detection-protection.md)
- [Microsoft security for AI](/security/security-for-ai)






