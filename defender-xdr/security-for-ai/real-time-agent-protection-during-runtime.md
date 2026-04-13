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

Deployed AI agents operate autonomously - invoking tools, accessing data, and taking actions across systems in response to natural‑language input. This makes runtime protection and investigation critical. Microsoft Defender lets you detect threats - such as prompt‑injection attacks, data exfiltration attempts, and tool misuse - block dangerous actions in real-time, investigate incidents quickly, and provide security teams with the context to trace the root cause and full blast radius.

This article explains how Microsoft Defender detects, blocks, and enables security teams to investigate threats to AI agents managed through [Microsoft Agent 365](/microsoft-agent-365/overview), including the extended detection and protection capabilities available for supported agent platforms.

## Block unsafe AI agent actions in real time

Microsoft Defender provides real-time protection (RTP) to prevent AI agents from performing unsafe actions during runtime. Microsoft Defender integrates directly with Microsoft Agent 365’s Agent Tooling Gateway (ATG) to evaluate supported agent-initiated tool invocations before they execute. If Defender determines that an action is risky, it blocks the action before the agent performs it, preventing harmful behavior.

Real-time protection focuses on high-confidence threats, including:

- Attempts to extract or exfiltrate system instructions or internal tool details  
- Direct attempts to leak sensitive data  
- Misuse of internal-only tools  
- Routing information to untrusted or malicious destinations  
- Use of obfuscated or hidden content to manipulate agent behavior  
- Credential leakage through legitimate channels such as email or external APIs  

> [!NOTE]
>  Microsoft Defender's real-time protection evaluates agent-initiated tool invocations at runtime. It does not inspect raw model prompts or responses outside the tool-execution path.

When Microsoft Defender blocks an action, it generates a detailed alert that explains what was blocked, why the action was considered risky, and which agent, user, and tool were involved. This ensures security teams can investigate attempted behavior using familiar Defender workflows.

#### Enable extended real-time protection for Microsoft Copilot Studio and Microsoft Foundry  agents

Beyond the core real‑time protection capabilities available for all Microsoft Agent 365‑managed agents, you can enable an extended set of real‑time protection capabilities for agents built with Microsoft Copilot Studio and Microsoft Foundry.

To enable these extended capabilities:

- For **Microsoft Copilot Studio agents**, see [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory).  
- For **Microsoft Foundry agents**, see [Enable threat protection for Microsoft Foundry AI workloads](/defender-for-cloud/ai-onboarding).

## Detect AI agent threats in near-real-time

Microsoft Defender continuously monitors AI agent activity and detects suspicious and malicious behavior across all Agent 365‑managed agents. Defender analyzes agent telemetry, tool usage, and execution patterns to identify threats such as *persistent jailbreak attempts*, *suspicious user activity involving a jailbreak attempt*, and *suspicious agent execution attempts*.

Microsoft Defender surfaces detections as near‑real‑time alerts in the Defender portal and enables security teams to investigate them using familiar security operations workflows, including alert triage, incident correlation, and Advanced Hunting.

For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

#### Enable extended near-real-time detections for Microsoft Copilot Studio and Microsoft Foundry  agents

When you enable the relevant features, agents built with Microsoft Copilot Studio and Microsoft Foundry have an extended set of near-real-time detection alerts beyond the baseline available to all Agent 365 agents.

To enable these extended capabilities:

- For **Microsoft Copilot Studio agents**, see [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory).  
- For **Microsoft Foundry agents**, see [Enable threat protection for Microsoft Foundry AI workloads](/defender-for-cloud/ai-onboarding).

## Block suspicious AI agent actions with real-time protection for supported agents 

Microsoft Defender provides real-time protection (RTP) to prevent AI agents from performing unsafe actions during runtime. Microsoft Defender integrates directly with Microsoft Agent 365’s Agent Tooling Gateway (ATG) to evaluate supported agent-initiated tool invocations before they execute. If Defender determines that an action is risky, it blocks the action before the agent performs it, preventing harmful behavior.
Real-time protection focuses on high-confidence threats, including:

- Attempts to extract or exfiltrate system instructions or internal tool details  
- Direct attempts to leak sensitive data  
- Misuse of internal-only tools  
- Routing information to untrusted or malicious destinations  
- Use of obfuscated or hidden content to manipulate agent behavior  
- Credential leakage through legitimate channels such as email or external APIs  

> [!NOTE]
>  Microsoft Defender's real-time protection evaluates agent-initiated tool invocations at runtime. It does not inspect raw model prompts or responses outside the tool-execution path.

When Microsoft Defender blocks an action, it generates a detailed alert that explains what was blocked, why the action was considered risky, and which agent, user, and tool were involved. This ensures security teams can investigate attempted behavior using familiar Defender workflows.


## Investigate AI agent threats 

Microsoft Defender uses Microsoft Defender XDR incident correlation and Advanced Hunting to help security teams investigate AI agent threats across all Agent 365‑managed agents. By correlating alerts, agent activity, and related security signals into incidents, Defender helps defenders understand the full context and blast radius of AI agent‑related threats and assess their impact across the environment. For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

You can collect audit logs for all Agent 365-managed agents for deeper investigation by enabling the Microsoft 365 app connector. For more information, see [Connect Microsoft 365 to Microsoft Defender for Cloud Apps](/defender-cloud-apps/protect-office-365#connect-microsoft-365-to-microsoft-defender-for-cloud-apps).