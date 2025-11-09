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

As organizations adopt AI agents to automate business processes and boost productivity, these tools can introduce significant security vulnerabilities. Without proper visibility and controls, misconfigured AI agents can lead to data breaches, unauthorized system access, privilege escalation, and unintended automated actions that compromise your organization's security posture.

Microsoft Defender addresses these critical security gaps with comprehensive AI agent protection that includes proactive exposure and threat hunting.

## Discover your AI agents with the AI agent inventory in the Defender portal

Microsoft Defender detects all of the AI agents created with Microsoft Copilot Studio and Azure AI Foundry. This inventory helps security teams discover, catalog, and continuously monitor AI agents across your organization.

 - To set up AI agent inventory for agents created in Coplot Studio, see [Enable AI agent inventory for Microsoft Copilot Studio Agents](/defender-for-cloud-apps/ai-agent-inventory). When you've enabled AI agent inventory for Copilot Studio agents, Microsoft Defender for Cloud Apps automatically:
    - Runs detections on your AI Agents created using Copilot Studio
    - Creates alerts and incidents for suspicious activity
    - Includes [AI agent data](advanced-hunting-aiagentsinfo-table.md) in [advanced hunting](/defender-xdr/advanced-hunting-overview.md).

 - To set up AI agent inventory for agents created in Azure AI Foundry, see [Microsoft Defender for Cloud AI Security posture management](/azure/defender-for-cloud/ai-security-posture). When you've enabled AI agent inventory for Azure AI Foundry agents, Microsoft Defender for Cloud automatically:
    - Monitors your AI agents for misconfigurations and vulnerabilities
    - Provides security recommendations to improve the security posture of your AI agents
    - Includes [AI agent data](advanced-hunting-aiagentsinfo-table.md) in [advanced hunting](/defender-xdr/advanced-hunting-overview.md).

## The AI agent inventory page
The AI agent inventory page in Microsoft Defender provides a centralized view of all detected AI agents, along with their key attributes and security status. 

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.

    A list of all detected AI agents appears. 

    :::image type="content" source="media/protect-ai-agents/ai-agent-inventory.png" alt-text="Screenshot that shows the AI agent inventory in the Defender portal.":::  

1. Select **Copilot Studio** or **Azure AI Foundry** to see a filtered list of AI agents based on the tool used to create the agent.
1. To see detailed information about a specific AI agent, select the agent from the list. 

## AI agent details
When you select an AI agent from the inventory, the **Agent** pane opens, providing detailed information about the selected agent. The information displayed varies based on whether the agent was created in Azure AI Foundry or Copilot Studio.

### [Azure AI Foundry](#tab/azure-ai-foundry)

-  Select **Open agent page** to opens the [**AI Agent** page](https://learn.microsoft.com/en-us/azure/defender-for-cloud/identify-ai-workload-model). 
- Select **Go hunt** to perform [advanced hunting](advanced-hunting-overview.md).
- Select **View on map** to see the agent's [location and related attack paths](https://learn.microsoft.com/en-us/azure/defender-for-cloud/concept-attack-path).

These AI agent details are displayed:

|AI Agent Information  |Description  |
|---------|---------|
|ID     |         |
|Name     |         |
|Account     |         |
|Deployment     |         |
|Attack paths     |         |
|Risk factors |         |
|Creation time     |         |
|Project     |         |
|Model     |         |
|Recommendations     |         |


#### [Copilot Studio](#tab/copilot-studio)


- Select **Open agent page** to open the Copilot Studio AI Agent page in the Defender portal. 
- Select **Go hunt** to perform [advanced hunting](advanced-hunting-overview.md).


These AI agent details are displayed:

|AI Agent Information  |Description  |
|---------|---------|
|Description     |         |
|ID     |         |
|Environment ID     |         |
|Name     |         |
|Creator     |         |
|Authentication type |         |
|Access control     |         |
|Creation time     |         |
|Owner     |         |
|Authentication trigger     |         |
|Authorized security group IDs     |         |
|Alerts     | Notifies you of any Microsoft Defender alerts related to the AI agent. |


--- 



