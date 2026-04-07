---
title: Secure AI agents from build to runtime using Microsoft Defender
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.update-cycle: 180-days
ms.date: 03/03/2026
audience: Admin
ms.topic: concept-article
description: Secure AI agents throughout their lifecycle using Microsoft Defender, whether you use Defender on its own or as part of a broader Microsoft Agent 365–managed environment.
---

# Secure AI agents from build to runtime using Microsoft Defender

[Microsoft Defender](/defender-xdr/microsoft-365-defender) provides a set of capabilities to protect AI agents throughout their lifecycle, enabling security teams to:

- Gain visibility into how AI agents behave across environments
- Reduce risk from misconfigured or over‑privileged agents
- Detect and contain malicious or unintended agent activity
- Investigate and respond to AI agent threats using familiar security workflows

These capabilities integrate with [Microsoft Agent 365](/microsoft-agent-365/overview), which provides centralized security governance and lifecycle management for AI agents. 

This article explains how Microsoft Defender secures AI agents throughout their lifecycle, whether you use Defender on its own or as part of a broader Microsoft Agent 365–managed environment.


## Enable Microsoft Defender AI agent security  

This table lists the Microsoft Defender capabilities and how to enable them for each agent type.

|Microsoft Defender AI agent capability |Copilot Studio agents |Microsoft Foundry agents |Other agents onboarded to Agent 365<sup>1</sup> |
|:---|:---:|:---:|:---:|
|[Agent discovery](#agent-discovery)| ✅ | ✅ | ✅ |
|[Posture management](#agent-security-posture-management)| ✅ | ✅ | ✅ |
|[Threat detection](#threat-detection)| ✅ | ✅ | ✅ |
|[Runtime protection](#runtime-protection)| ✅ | ✅ | ✅ |
| **Enablement steps** | [Enable Copilot Studio AI agent inventory and runtime protection in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory) | [Enable Defender Cloud Security Posture Management (CSPM)](/azure/defender-for-cloud/tutorial-enable-cspm-plan) | 1. [Register agents to the Agent Registry](/entra/agent-id/identity-platform/publish-agents-to-registry)<br>2. [Enable Defender Cloud Security Posture Management (CSPM)](/azure/defender-for-cloud/tutorial-enable-cspm-plan)<br>  |

<sup>1</sup> Other Agent 365 onboarded agents include agents built or hosted outside Microsoft agent platforms and onboarded to Agent 365 for visibility and governance.

## Agent discovery

Microsoft Defender provides security teams with a centralized view of all detected AI agents along with their key attributes and security status. For more information, see [AI agent inventory page](/defender-xdr/ai-agent-inventory?tabs=azure-ai-foundry#the-ai-agent-inventory-page). 

## Agent security posture management 

AI security posture recommendations and detailed attack path analysis help security teams by identifying misconfigurations, excessive permissions, and risky agent behaviors and contextualizing how those weak spots create broader organizational risks. For more information, see [AI security posture management - Discover AI agents (preview)](/azure/defender-for-cloud/ai-security-posture#discover-ai-agents-preview). 

## Threat detection

Microsoft Defender detects known and emerging threats targeting AI agents, including agent‑specific attack patterns. It provides threat detections for agentic AI applications, addressing risks introduced when agents can reason, plan, and act across multiple systems.

## Runtime protection

Microsoft Defender runtime protection capabilities include AI agent‑specific threats. For more information, see [Protect your environment in real-time during agent runtime](/defender-cloud-apps/real-time-agent-protection-during-runtime). 




