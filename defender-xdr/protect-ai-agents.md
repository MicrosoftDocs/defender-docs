---
title: Protect AI agents
description: Learn how Microsoft Defender protects AI agents from security threats. Learn about agent inventory, real-time protection, and threat hunting capabilities.
ms.service: defender-xdr
ms.author: abbyweisberg
author: AbbyMSFT
ms.topic: article
ms.date: 11/02/2025
appliesto:
    - Microsoft Defender for XDR
    - Microsoft Defender for Cloud Apps
    - Microsoft Defender for Cloud

#Customer intent: As a security administrator, I want to protect my organization's AI agents from security threats and maintain visibility into agent activities and configurations.
---

# Protect your AI agents (Preview)

As organizations adopt no-code and low-code AI agents to automate business processes and boost productivity, these tools can introduce significant security vulnerabilities when left unmonitored. Without proper visibility and controls, misconfigured AI agents can lead to data breaches, unauthorized system access, privilege escalation, and unintended automated actions that compromise your organization's security posture.

Microsoft Defender addresses these critical security gaps with comprehensive AI agent protection that includes real-time threat detection, configuration monitoring, and proactive risk assessment capabilities. 

Microsoft Defender includes these features to close that visibility gap, enabling proactive exposure and threat hunting.

- AI Agents Inventory
- Auditing and advanced hunting with AI agents
- Real time protection during agent runtime

## Discover your AI agents with the AI agent Threat Protection inventory

Microsoft Defender detects all of the AI agents created with Microsoft Copilot Studio and Azure AI Foundry. This inventory helps security teams discover, catalog, and continuously monitor AI agents across your organization.

:::image type="content" source="media/protect-ai-agents/ai-agent-inventory.png" alt-text="Screenshot of AI Agent inventory page in the Defender portal.":::

 - To set up AI agent inventory for agents created in Coplot Studio, see [Enable AI agent inventory for Microsoft Copilot Studio Agents](../defender-for-cloud-apps/ai-agent-protection.md#enable-ai-agent-inventory-for-microsoft-copilot-studio-agents)
 - To set up AI agent inventory for agents created in Azure AI Foundry, see [Microsoft Defender for Cloud AI Decurity posture management](/azure/defender-for-cloud/ai-security-posture).
 

## Detect threats on your AI Agents with advanced hunting
Once you've enabled AI agent protection, Microsoft Defender starts running detections and creating alerts and incidents for suspicious activity on your AI agents. AI agent data is included in Defender for Cloud Apps advanced hunting, to give you visibility into potential threats.

See [Auditing and Advanced hunting for AI agents](../defender-for-cloud-apps/ai-agent-protection.md#auditing-and-advanced-hunting-for-ai-agents).

## Protect your environment in real-time during agent runtime

AI agents empower people to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by injecting malicious prompts, triggering unintended tool executions, or exploiting data sources to escalate privileges or exfiltrate data.

 [Real-time protection during agent runtime for AI agents created using Copilot Studio (Preview)](../defender-for-cloud-apps/real-time-agent-protection-during-runtime.md) reduces these risks by inspecting tool invocations before the agent runs any actions.

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts. 

