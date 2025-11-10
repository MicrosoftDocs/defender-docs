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

As no code/low code platforms become increasingly accessible, organizations face new types of security risks. These platforms empower people to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by:
- injecting malicious prompts
- triggering unintended tool executions
- exploiting data sources to escalate privileges or exfiltrate data.

## AI agent threat protection features

Microsoft Defender addresses critical security gaps with comprehensive AI agent protection that includes proactive exposure and threat hunting. With AI agent protection, Microsoft Defender:

- Detects all of your AI agents created with Microsoft Copilot Studio. See [Discover and protect your AI agents (Preview)](ai-agent-inventory.md) to learn how to set up AI agent inventory.
- Continuously monitors your AI agents for suspicious activity, enabling detections and alerts on your AI agents created with Copilot Studio.
- Integrates AI Agent data into advanced hunting for proactive threat detection. You can use this data to create custom queries and hunt for potential threats.
 See [Proactively hunt for threats with advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview) and [AIAgentsInfo](/defender-xdr/advanced-hunting-aiagentsinfo-table) to learn how to use queries to proactively hunt for threats.
- Provides real-time protection to block suspicious or harmful actions initiated by your AI agents. See [Enable real-time protection for Microsoft Copilot Studio Agents](/defender-for-cloud-apps/ai-agent-real-time-protection) to learn how to set up real-time protection.


> [!NOTE]
> - Microsoft Defender protection for AI agents supports AI agents created with Microsoft Copilot Studio.
> - This feature is currently in public preview and included with your Microsoft Defender for Cloud Apps license at no extra cost. When the feature becomes generally available, licensing requirements might change.

## Related articles

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
