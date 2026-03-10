---
title: Microsoft Security Copilot Security Alert Triage Agent overview in Microsoft Defender
description: Learn about the Security Alert Triage Agent, an autonomous agent in the Microsoft Defender ecosystem that helps security teams triage alerts at scale using AI-driven reasoning, prioritization, and enrichment.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: overview
search.appverid:
- MOE150
- MET150
ms.date: 01/25/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security engineer, I want to learn about the Security Alert Triage Agent in Microsoft Defender so that I can understand its capabilities and benefits for triaging security incidents at scale.
---

# Microsoft Security Copilot Security Alert Triage Agent overview (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The Microsoft Security Copilot Security Alert Triage Agent is an autonomous Microsoft Security Copilot agent that helps security teams triage alerts at scale by applying consistent reasoning, prioritization, and enrichment across supported security workloads.

The Security Alert Triage Agent evaluates alerts using AI‑driven reasoning, determines their relevance and risk, and records its conclusions directly in Microsoft Defender incidents. This reduces alert fatigue, accelerates response, and helps analysts focus on the alerts that matter most.

This article provides an overview of the Security Alert Triage Agent, how it works, and its alert triage capabilities.

> [!NOTE]
> The Security Alert Triage Agent is currently in preview. It extends the capabilities of the [Phishing Triage Agent](phishing-triage-agent.md), which is generally available and has proven highly successful with customers. It's the same agent, with a broader scope, which now includes triage of phishing and cloud alerts, so you can focus on what matters most.

## How the Security Alert Triage Agent works

The Security Alert Triage Agent is a [Security Copilot agent](/copilot/security/agents-overview) in Microsoft Defender that enhances the efficiency of security operations teams by classifying and triaging alets across Microsoft Defender workloads and alert types. The agent’s key capabilities include:

- **Autonomous triage:** Uses advanced AI tools to perform sophisticated assessments and determine whether a submission is a real threat or a false alarm, without requiring step-by-step human input or code.
- **Transparent rationale:** Provides transparent rationale for its classification verdicts in natural language, detailing the reasoning behind its conclusions and the evidence used to reach them. It also provides a visual representation of its reasoning process.
- **Learning based on feedback:** For supported alerts, the agent incorporates analyst feedback to continuously improve future triage decisions while keeping humans in control. Over time, this feedback helps refine the agent’s behavior to better reflect organizational context and reduce manual follow‑up. This capability is currently available for phishing alerts only.

## Supported workloads and alert types

The Security Alert Triage Agent currently supports these alert types in Microsoft Defender:

| Incident type | Alert type |
|:---|:---|
| **Phishing alerts (Generally Available)** | Email and collaboration alerts, including phishing. |
| **Container incident triage (Preview)** | Cloud alerts, including containers. |

## Agent trigger and flow

The Security Alert Triage Agent is triggered when a relevant alert is created. The agent autonomously analyzes the alert to determine whether the associated threat is malicious or a false alarm.

When the agent identifies a false alarms, it classifies it as **False Positive** and resolves it. Otherwise, the agent classifies the alert as a **True Positive** and the status of the associated incident remains open and in progress for an analyst to investigate and take further action.

The agent always provides a detailed explanation of its verdict to enhance transparency and enable analyst validation.

### Why the Security Alert Triage Agent is important

Security alerts often arrive in high volume, overwhelming analysts with repetitive investigations - many of which turn out to be false positives. Manual triage can consume significant time, sometimes up to 30 minutes per alert. By automating classification, prioritization, and enrichment, the Security Alert Triage Agent reduces analyst fatigue and frees up time for higher-impact investigations and proactive security work.

### How the agent differs from a standard SOAR solution

While both SOAR solutions and the Security Alert Triage Agent aim to automate aspects of security operations, their approaches are fundamentally different. SOAR tools rely on static, policy- and rule-based workflows that require predefined logic and manual tuning. In contrast, the agent uses recursive reasoning to autonomously complete tasks—learning, adapting, and improving over time.

The agent doesn't need to be reprogrammed for every new situation. Within defined boundaries, it adjusts to the task at hand, making it far more flexible than traditional automation. Rather than being rigid and reactive, it continuously evolves with your environment and threat landscape, guided by analyst feedback and grounded in real data. Purpose-built for security teams, the Security Alert Triage Agent helps accelerate responses and reduce manual workloads, freeing up analysts to focus on strategic initiatives.

## Next steps

- [Review permissions and prerequisites](alert-triage-agent-prerequisites.md)
- [Set up the Security Alert Triage Agent](alert-triage-agent-setup.md)
- [Learn how to use the agent](alert-triage-agent-usage.md)

## Related content

- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Security Copilot agents in Microsoft Defender](security-copilot-agents-defender.md)
- [Phishing Triage Agent](phishing-triage-agent.md)