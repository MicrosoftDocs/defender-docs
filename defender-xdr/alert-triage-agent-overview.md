---
title: Alert Triage Agent overview in Microsoft Defender
description: Learn about the Alert Triage Agent, an autonomous agent in the Microsoft Defender ecosystem that helps security teams triage alerts at scale using AI-driven reasoning, prioritization, and enrichment.
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
#customer intent: As a security analyst, I want to learn about the Alert Triage Agent in Microsoft Defender so that I can understand its capabilities and benefits for triaging security incidents at scale.
---

# Alert Triage Agent overview (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The Alert Triage Agent is an autonomous Microsoft Security Copilot agent that helps security teams triage alerts at scale by applying consistent reasoning, prioritization, and enrichment across supported security workloads.

The Alert Triage Agent evaluates alerts using AI‑driven reasoning, determines their relevance and risk, and records its conclusions directly in Microsoft Defender incidents. This reduces alert fatigue, accelerates response, and helps analysts focus on the alerts that matter most.

This article provides an overview of the Alert Triage Agent model, its benefits, and its alert triage capabilities.

> [!NOTE]
> The Alert Triage Agent is currently in preview. It builds on the same capabilities as the [Phishing Triage Agent](phishing-triage-agent.md), which is generally available and has proven highly successful with customers. The Alert Triage Agent extends the same underlying technology to support additional alert types beyond phishing.

## How the Alert Triage Agent works

The Alert Triage Agent follows a common triage model that applies across supported alert types:

- **Classify alerts:** Evaluate incoming alerts and determine whether they represent a true security concern or benign activity.
- **Prioritize risk:** Help surface the alerts that require immediate attention by assessing context, severity signals, and supporting evidence.
- **Enrich incidents with reasoning:** Add natural‑language explanations and supporting details to the associated incident so analysts can quickly understand why an alert was classified.
- **Integrate with existing response workflows:** Complement existing investigation and response capabilities, such as automated investigation and response (AIR), rather than replacing them.
- **Learn from feedback:** Incorporate analyst feedback to continuously improve future triage decisions while keeping humans in control. 

   This capability is currently available for phishing alerts only.

This shared triage model ensures consistent behavior and transparency, regardless of the alert source or workload.

## Supported workloads and alert types

The Alert Triage Agent currently supports these alert types in Microsoft Defender:

| Incident type | Product | Alert type |
|:---|:---|:---|
| **Phishing incidents** | Microsoft Defender for Office 365 | User‑reported phishing alerts. |
| **Container incident triage (Preview)** | Microsoft Defender for Cloud |  |

## Agent trigger and flow

Once fully set up and running, the Alert Triage Agent is automatically triggered when a relevant alert is created. The agent then autonomously analyzes the alert using sophisticated AI tools and your organization's context to determine whether the associated threat is malicious or just a false alarm.

If the alert is determined to be a false alarm, the agent classifies it as a False Positive and resolves it accordingly. If the alert is deemed malicious, it's classified as a True Positive, and the status of the associated incident remains open and in progress for an analyst to investigate and take further action.

For every alert it processes, the agent provides a detailed explanation of its verdict—enhancing transparency and building analyst confidence in the corresponding incident.

## Benefits

The Alert Triage Agent is designed to help security teams manage the overwhelming volume of alerts organizations receive daily. Acting as a force multiplier for SOC teams, the agent offloads time-consuming triage tasks, reduces alert fatigue, and accelerates incident response by autonomously identifying true threats. This enables analysts to cut through the noise and focus their attention on the threats that truly matter.

### Why the Alert Triage Agent is important

Security alerts often arrive in high volume, overwhelming analysts with repetitive investigations—many of which turn out to be false positives. This manual triage can consume significant time, sometimes up to 30 minutes per alert. By automating classification, prioritization, and enrichment, the Alert Triage Agent reduces analyst fatigue and frees up time for higher-impact investigations and proactive security work.

### How the agent differs from a standard SOAR solution

While both SOAR solutions and the Alert Triage Agent aim to automate aspects of security operations, their approaches are fundamentally different. SOAR tools rely on static, policy- and rule-based workflows that require predefined logic and manual tuning. In contrast, the agent uses recursive reasoning to autonomously complete tasks—learning, adapting, and improving over time.

The agent doesn't need to be reprogrammed for every new situation. Within defined boundaries, it adjusts to the task at hand, making it far more flexible than traditional automation. Rather than being rigid and reactive, it continuously evolves with your environment and threat landscape, guided by analyst feedback and grounded in real data. Purpose-built for security teams, the Alert Triage Agent helps accelerate responses and reduce manual workloads, freeing up analysts to focus on strategic initiatives.

## Next steps

- [Review permissions and prerequisites](alert-triage-agent-prerequisites.md)
- [Set up the Alert Triage Agent](alert-triage-agent-setup.md)
- [Learn how to use the agent](alert-triage-agent-usage.md)

## Related content

- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Security Copilot agents in Microsoft Defender](security-copilot-agents-defender.md)
- [Phishing Triage Agent](phishing-triage-agent.md)