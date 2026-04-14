---
title: Detect, block, and investigate threats to AI agents using Microsoft Defender
description: Learn how to detect, block, and investigate threats to AI agents in real-time using Microsoft Defender.
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.update-cycle: 180-days
ms.date: 03/03/2026
audience: Admin
ms.topic: concept-article
#customer-intent: As a security administrator, I want to learn how to detect, block, and investigate threats to AI agents in real-time using Microsoft Defender.
---

# Detect, block, and investigate threats to AI agents using Microsoft Defender

Deployed AI agents operate autonomously, invoking tools, accessing data, and taking actions across systems in response to natural‑language input. This makes continuous detection, runtime protection, and investigation critical. Microsoft Defender detects suspicious and malicious agent behavior, blocks dangerous actions in real time, provides alerts in near‑real‑time, and enables security teams to investigate incidents and trace the full root cause and blast radius.

This article explains how Microsoft Defender detects, blocks, and enables security teams to investigate threats to AI agents managed through [Microsoft Agent 365](/microsoft-agent-365/overview), including the extended detection and protection capabilities available for supported agent platforms.

## Block unsafe AI agent actions in real time

Microsoft Defender provides real-time protection (RTP) to prevent AI agents from performing unsafe actions during runtime. Defender integrates directly with Microsoft Agent 365’s Agent Tooling Gateway (ATG) to evaluate supported agent-initiated tool invocations before they execute. If Defender determines that an action is risky, it blocks the action before the agent performs it, preventing harmful behavior.

Real-time protection focuses on high-confidence threats, including:

- Attempts to extract or exfiltrate system instructions or internal tool details  
- Direct attempts to leak sensitive data  
- Misuse of internal-only tools  
- Routing information to untrusted or malicious destinations  
- Use of obfuscated or hidden content to manipulate agent behavior  
- Credential leakage through legitimate channels such as email or external APIs  

> [!NOTE]
> Microsoft Defender's real-time protection evaluates agent-initiated tool invocations at runtime. It doesn't inspect raw model prompts or responses outside the tool-execution path.

When Microsoft Defender blocks an action, it generates a detailed alert that explains what was blocked, why the action was considered risky, and which agent, user, and tool were involved. This ensures security teams can investigate attempted behavior using familiar Defender workflows.

Beyond the core real‑time protection capabilities available for all Microsoft Agent 365‑managed agents, you can enable an extended set of real‑time protection capabilities for agents built with Microsoft Copilot Studio.

### Enable real-time protection

To enable real-time protection for your AI agents: 

1. Open the [Microsoft Defender portal](https://security.microsoft.com/)
1. Select **System** > **Settings** > **Security for AI agents**.  This opens the [Security for AI agents settings page](https://security.microsoft.com/securitysettings/security_for_ai).
1. Make sure that **Security for AI agents** is toggled on.
1. Make sure that **Agent 365** is connected under **AI real-time protection & investigation**. 

    :::image type="content" source="media/ai-agent-detection-protection/enable-ai-real-time-protection.png" alt-text="Screenshot of Security for AI agents settings showing toggled on switch and connected status for Agent 365 and Copilot Studio." lightbox="media/ai-agent-detection-protection/enable-ai-real-time-protection.png":::

1. To enable the extended real-time protection capabilities for Microsoft Copilot Studio agents, make sure that **Copilot Studio** is connected under **AI real-time protection & investigation**. 

    For more information, see [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory).


## Detect AI agent threats in near-real-time

Microsoft Defender continuously monitors AI agent activity and detects suspicious and malicious behavior across all Agent 365‑managed agents. Defender analyzes agent telemetry, tool usage, and execution patterns to identify threats such as *persistent jailbreak attempts*, *suspicious user activity involving a jailbreak attempt*, and *suspicious agent execution attempts*.

Microsoft Defender surfaces detections as near‑real‑time alerts in the Defender portal and enables security teams to investigate them using familiar security operations workflows, including alert triage, incident correlation, and Advanced Hunting.

For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

Near-real-time detections rely on AI agent audit logs, which also provide valuable context for [investigating incidents and threat hunting](#investigate-ai-agent-threats-and-hunt-for-risks-using-advanced-hunting). Microsoft Defender analyzes these audit logs to identify suspicious agent behavior and generate alerts.

#### Enable near-real-time detections and advanced threat hunting

To enable near-real-time alerts and threat hunting: 

1. Enable the Microsoft 365 app connector to collect detailed audit logs for AI agent actions. For more information, see [Connect Microsoft 365 to Microsoft Defender for Cloud Apps](/defender-for-cloud-apps/protect-office-365#connect-microsoft-365-to-microsoft-defender-for-cloud-apps).
1. Ensure that your AI agent emits audit logs to Microsoft 365. 
    - Agents built with Microsoft Copilot Studio send audit logs to Microsoft 365 by default.
    - For AI agents built on other platforms, integrate the [Microsoft Agent 365 SDK](/microsoft-agent-365/developer/) to emit audit logs to Microsoft 365.

### Enable extended near-real-time detections for Microsoft Copilot Studio and Microsoft Foundry agents

When you enable the relevant features, agents built with Microsoft Copilot Studio and Microsoft Foundry have an extended set of near-real-time detection alerts beyond the baseline available to all Microsoft Agent 365‑managed agents.

To enable these extended capabilities:

- For **Microsoft Copilot Studio agents**, see [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory).  
- For **Microsoft Foundry agents**, see [Enable threat protection for Microsoft Foundry AI workloads](/azure/defender-cloud/ai-onboarding).

## Investigate AI agent threats and hunt for risks using Advanced Hunting

Microsoft Defender correlates AI agent alerts into incidents and surfaces the related context so security teams can quickly assess impact and prioritize response. Advanced Hunting then lets analysts query agent activity and audit logs by using Kusto Query Language (KQL) to investigate incidents and hunt for risks across their environment.

### Investigate incidents and alerts

Microsoft Defender correlates AI agent alerts, including near‑real‑time detections and alerts generated when real‑time protection blocks an action, into incidents.

Security analysts can use the incident graph and investigation experience to understand the full context of a potential attack, including relationships between involved entities and the blast radius of AI agent threats. For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

### Correlate alerts and AI agent audit logs and hunt for risks using Advanced Hunting

Advanced Hunting in Microsoft Defender enables security teams to query AI agent activity alongside other security data, including agent audit logs, by using Kusto Query Language (KQL). This supports proactive threat hunting, incident investigation, and root‑cause analysis across agents, applications, identities, and devices.

For example, use Advanced Hunting to:
- Trace specific agent tool invocations and correlate them with related alerts or block events  
- Investigate the root cause and scope of a detected AI agent threat  
- Identify anomalous execution patterns or risky agent behavior across environments  
- Build custom detection rules based on agent activity signals  

### Advanced Hunting tables for AI agent investigation

The following Advanced Hunting tables provide visibility into [AI agent configuration](/defender-xdr/security-ai/ai-agent-inventory#view-all-agent-365-managed-agents-and-configuration-details-using-advanced-hunting), alerts, and activity. You can query these tables individually or correlate them to investigate incidents and hunt for agent-related risks.

| Table name | Description | Common use cases |
|-----------|-------------|------------------|
| [AlertInfo](/defender-xdr/advanced-hunting-alertinfo-table) | Contains alert metadata generated by Microsoft Defender, including alerts related to near-real-time detections and real-time protection block events. | Investigate AI agent alerts, understand alert context, and pivot into related incidents and entities. |
| [CloudAppEvents](/defender-xdr/advanced-hunting-cloudappevents-table) | Contains Microsoft 365 audit logs for AI agent activity, including agent actions, tool invocations, and data access events. | Hunt for suspicious agent behavior, trace agent actions, and perform root-cause analysis using audit logs. |
| [AIAgentsInfo](/defender-xdr/advanced-hunting-aiagentsinfo-table) | Contains inventory and configuration details for AI agents, including agent identity, platform, ownership, and metadata. | Review agent posture, identify risky or misconfigured agents, and correlate agent identity with alerts and activity. |
| [AlertEvidence](/defender-xdr/advanced-hunting-alertevidence-table) | Contains entities and artifacts associated with alerts, such as agents, users, tools, URLs, or resources. | Understand the scope of an alert and identify related entities involved in an AI agent incident. |

