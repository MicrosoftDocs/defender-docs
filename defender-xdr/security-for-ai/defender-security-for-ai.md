---
title: Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.update-cycle: 180-days
ms.date: 08/07/2026
audience: Admin
ms.topic: concept-article
description: Learn how Microsoft Defender secures AI workloads across their lifecycle - from build and configuration to runtime - and supports organizations in managing AI security risks.
ai-usage: ai-assisted
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

- **AI agents**, where configuration, permissions, and runtime behavior - including tool usage and agent decision‑making - introduce exposure.
- **AI applications and infrastructure**, including models, platforms, services, and integrations, where supply-chain risks, configuration, and deployment weaknesses can create broader attack paths.


## Protect AI agents using Microsoft Defender

AI agents introduce unique security risks because of their ability to reason, invoke tools, access data, and take autonomous actions on connected systems. Securing agents at scale requires centralized visibility, security posture and risk management, runtime protection, and advanced investigation capabilities to detect the root cause of an attack.

[Microsoft Agent 365](/microsoft-agent-365/overview) provides an enterprise control plane for managing and governing AI agents in your organization. When you enable your Agent 365 license, Microsoft Defender integrates with Agent 365 to secure all managed agents, including [local AI agents on supported endpoints](/defender-endpoint/local-agent-discovery-overview), with discovery, posture management, real-time protection, and investigation. Threat detection uses observability data from Microsoft Copilot Studio, Microsoft Foundry, Microsoft 365 Copilot Agent Builder, and agents integrated through the Microsoft Agent 365 SDK.

To get started, see [Enable security for AI agents using Microsoft Defender](get-started-defender-security-for-ai.md).

| Capability | Description | Learn more |
|---|---|---|
| **AI agent discovery** | Discover all agents onboarded to Agent 365, including [local AI agents on supported endpoints](/defender-endpoint/discover-local-ai-agents) and non-Microsoft agents built using the [Microsoft Agent 365 SDK](/microsoft-agent-365/developer/). View agent details using Kusto Query Language (KQL) queries in Advanced Hunting in Microsoft Defender, or the AI Assets page in the Defender portal. | [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory) |
| **Agent security posture management** | Use Advanced Hunting in Microsoft Defender, which provides prebuilt queries to help you identify misconfigurations, risky agent settings, and excessive permissions. | [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory) |
| **Real-time protection** | Real-time protection evaluates tool invocations and responses against security policies when Agent 365 agents use Work IQ MCP and customer MCP tools onboarded to Agent 365. The default rule audits activity, while custom rules can block matching actions before they execute. Audited and blocked activity is recorded as behaviors in the `BehaviorInfo` table for hunting and automation. | [Protect AI agents in real time using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-real-time-protection) |
| **Threat detection, investigation, and hunting** | Near-real-time detections analyze Agent 365 observability data for threats such as indirect prompt injection, evasion techniques, malicious content propagation, secret leakage, LLM reconnaissance, and suspicious IP access. Microsoft Defender correlates alerts into incidents, and Advanced Hunting lets analysts query agent activity with other security data. | [Detect and investigate threats to AI agents using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-detection-protection)|

## Protect AI infrastructure using Microsoft Defender

It’s critical to protect the generative AI models, services, and infrastructure that AI applications and agents depend on. Compromised models, insecure configurations, or exposed dependencies can introduce supply‑chain risks that affect multiple AI workloads.

For information on enabling threat protection for AI infrastructure, see [Enable threat protection for AI services](/azure/defender-for-cloud/ai-onboarding).

This table lists the Microsoft Defender capabilities that help secure generative AI models and applications:

| Capability | Description | Learn more |
|---|---|---|
| **AI infrastructure discovery** | A unified view of your organization's AI infrastructure, including deployed models, services, and related AI resources. | [AI security posture management](/azure/defender-for-cloud/ai-security-posture) |
| **AI infrastructure security posture management** | Identify vulnerabilities and misconfigurations across AI artifacts, including models, dependencies, code repositories, and container images. <br><br> Use built‑in security recommendations and attack‑path analysis to prioritize remediation. <br><br> Continuously assess AI models for security risks such as malware, unsafe operators, serialization vulnerabilities, and exposed secrets throughout the AI lifecycle.  | [AI security posture management](/azure/defender-for-cloud/ai-security-posture) |
| **Threat detection** | Detect threats targeting generative AI applications built with Microsoft Foundry, including suspicious prompt activity and abnormal execution behavior, with contextual signals surfaced in security alerts. | [Alerts for AI services](/azure/defender-for-cloud/alerts-ai-workloads) |
| **Threat investigation and hunting** | Microsoft Defender incident correlation and Advanced Hunting capabilities help defenders understand the full context and blast radius of AI infrastructure threats. | [Investigate incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview) |

## Next steps

Learn more about these capabilities and how to use them to secure your AI assets:

- [Discover AI agents and assess security posture using Microsoft Defender](ai-agent-inventory.md)
- [Detect and investigate threats to AI agents using Microsoft Defender](ai-agent-detection-protection.md)

- [Protect AI agents in real time using Microsoft Defender](ai-agent-real-time-protection.md)
- [Microsoft security for AI](/security/security-for-ai)





