---
title: Protect your Microsoft Copilot Studio AI agents (Preview)
description: Learn how to enable and manage AI Agent protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 11/02/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
#customer-intent: As a security administrator, I want my Copilot Studio AI agents to be protected against suspicious or harmful actions so that I can reduce security risks to my organization.
---

# Protect your Microsoft Copilot Studio AI agents (Preview)

As No code/Low code platforms become increasingly accessible, organizations face new types of security risks. These platforms empower non-technical users to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by:
- Injecting malicious prompts
- Triggering unintended tool executions
- Exploiting data sources to escalate privileges or exfiltrate data.

## AI agent protection features

Microsoft Defender addresses critical security gaps with comprehensive AI agent protection that includes proactive exposure, threat hunting, real time protection, and alerts. With AI agent protection, Microsoft Defender:

- Detects all of your custom AI agents created with Microsoft Copilot Studio, and integrates their data into advanced hunting for proactive threat detection. You can use this data to create custom queries and hunt for potential threats. See [Copilot Studio AI agent inventory (Preview)](ai-agent-inventory.md) to learn how to set up and make use of the AI agent inventory.
- Collects audit logs for your custom AI agents created with Copilot Studio, continuously monitors the agents for suspicious activity, and enables detections and alerts. To enable this monitoring, make sure that you:
    - [Enable the AI agent inventory](ai-agent-inventory.md#enable-discovery-of-copilot-studio-ai-agents).
    - [Enable the Microsoft 365 app connector](protect-office-365.md#connect-microsoft-365-to-microsoft-defender-for-cloud-apps).
- Provides real-time protection to block suspicious or harmful actions initiated by your AI agents, and triggers an informative alert integrated into the XDR incidents and alerts environment. See [Enable real-time protection for Microsoft Copilot Studio Agents](real-time-agent-protection-during-runtime.md) to learn how to set up real-time protection.

## Related articles

- [Discover and protect your Copilot Studio custom AI Agents (Preview)](ai-agent-inventory.md)
- [Enable real-time protection for Microsoft Copilot Studio Agents](real-time-agent-protection-during-runtime.md)    
