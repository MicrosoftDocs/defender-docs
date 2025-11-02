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

# Protect AI agents (Preview)

As organizations adopt AI agents to automate business processes and boost productivity, these tools can introduce significant security vulnerabilities when left unmonitored. Without proper visibility and controls, misconfigured AI agents can lead to data breaches, unauthorized system access, privilege escalation, and unintended automated actions that compromise your organization's security posture.

Microsoft Defender XDR addresses these critical security gaps with comprehensive AI agent protection that includes real-time threat detection, configuration monitoring, and proactive risk assessment capabilities. 

Microsoft Defender includes these features to close that visibility gap, enabling proactive exposure and threat hunting.

- AI Agents Inventory
- Advanced hunting with AI agents
- Real time protection during agent runtime

## AI Agents inventory

The **AI Agents** section of the **Assets** tab in the Defender portal includes an inventory of AI agents created with:
- Microsoft Copilot Studio
- Azure AI Foundry.

This inventory helps security teams discover, catalog, and continuously monitor AI agents across your organization.

## Advanced hunting with AI agents

- Use exposure hunting to identify misconfigured or potentially risky agents that may pose security or compliance risks.
- Use threat hunting to get visibility into agents’ configurations and metadata to investigate suspicious activity and detect potential threats.

## Real time protection during agent runtime

AI agents empower people to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by injecting malicious prompts, triggering unintended tool executions, or exploiting data sources to escalate privileges or exfiltrate data.

 [Real-time protection during agent runtime for AI agents created using Copilot Studio (Preview)](../defender-for-cloud-apps/real-time-agent-protection-during-runtime.md) reduces these risks by inspecting tool invocations before the agent runs any actions.

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts. 

> [!NOTE]
> Microsoft E5 and E5 Security customers can enable AI agents inventory.

## Enable AI Agent protection

> [!NOTE]
>- The onboarding process for AI Agent protection requires collaboration with Power Platform administrators.

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Navigate to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Turn on **Copilot Studio AI Agents**.
1. Coordinate with the Power Platform administrator to complete these steps:  
    1.   Go to the [Power Platform Portal](https://admin.preview.powerplatform.microsoft.com/security/threatdetection).
    1. Select **Microsoft Defender - Copilot Studio AI Agents**.
    1. Turn on **Enable Microsoft Defender - Copilot Studio AI Agents**.

It can take up to 30 minutes for the initial connection status to update. You will see a green indicator when successfully connected. It may take longer to see the full deployment of the AI agent inventory depending on the size and complexity of your environment.