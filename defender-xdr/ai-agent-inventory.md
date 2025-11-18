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

As organizations embrace AI agents to streamline operations and enhance productivity, they also face new security risks that these tools can introduce.

Without strong visibility and controls, misconfigured AI agents can expose sensitive data, enable unauthorized access, escalate privileges, and trigger unintended actions that weaken your organization’s security posture.


## AI agent protection features
Microsoft Defender protects you against security threats with comprehensive AI agent protection, offering proactive exposure management and advanced threat hunting with these features: 

- Detects all of your custom AI agents created with Microsoft Copilot Studio or Azure AI Foundry, and integrates their data into [advanced hunting](advanced-hunting-overview.md) for proactive threat detection. You can use this data to create custom queries and hunt for potential threats. 
- Collects audit logs for your custom AI agents, continuously monitors the agents for suspicious activity, and enables detections and alerts. To enable this monitoring, make sure that you:
    - [Enable the AI agent inventory](#discover-your-ai-agents-with-the-ai-agent-inventory-in-the-defender-portal-preview).
    - [Enable the Microsoft 365 connector](../defender-for-cloud-apps/protect-office-365.md#connect-microsoft-365-to-microsoft-defender-for-cloud-apps).
- [Protects your environment in real-time](../defender-for-cloud-apps/real-time-agent-protection-during-runtime.md) to block suspicious or harmful actions initiated by your AI agents during agent runtime, and triggers an informative alert integrated into the XDR incidents and alerts environment.  

## Prerequisites
To enable AI agent inventory and detection you must opt in to the [Microsoft Defender preview features](https://security.microsoft.com/securitysettings/defender/preview_features) of:
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Cloud
- Microsoft Defender XDR

## Discover your AI agents with the AI agent inventory in the Defender portal (Preview)

Microsoft Defender detects all of the AI agents created with Microsoft Copilot Studio and Azure AI Foundry. This inventory helps security teams discover, catalog, and continuously monitor AI agents across your organization.

 - To set up AI agent inventory for custom agents created in Coplot Studio, see [Discover and protect your AI Agents (Preview)](../defender-for-cloud-apps/ai-agent-inventory.md).
 
    When you've enabled AI agent inventory for Copilot Studio agents, Microsoft Defender for Cloud Apps automatically:
    - Runs detections on your AI Agents created using Copilot Studio.
    - Creates alerts and incidents for suspicious activity.
    - Includes [AI agent data](advanced-hunting-aiagentsinfo-table.md) in [advanced hunting](advanced-hunting-overview.md).

 - To set up AI agent inventory for custom agents created in Azure AI Foundry, see [Microsoft Defender for Cloud AI Security posture management](/azure/defender-for-cloud/ai-security-posture).

     When you've enabled AI agent inventory for Azure AI Foundry agents, Microsoft Defender for Cloud automatically:
    - Monitors your AI agents for misconfigurations and vulnerabilitie.
    - Provides security recommendations to improve the security posture of your AI agents.
    - Includes [AI agent data](advanced-hunting-aiagentsinfo-table.md) in [advanced hunting](advanced-hunting-overview.md).

## The AI agent inventory page
The AI agent inventory page in Microsoft Defender provides a centralized view of all detected AI agents, along with their key attributes and security status. 

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.

    A list of all detected AI agents appears. 

    :::image type="content" source="media/ai-agent-inventory/ai-agent-inventory.png" alt-text="Screenshot that shows the AI agent inventory in the Defender portal.":::  

1. Select **Copilot Studio** or **Azure AI Foundry** to see a filtered list of AI agents based on the tool used to create the agent.
1. To see detailed information about a specific AI agent, select the agent from the list. 

## AI agent details
When you select an AI agent from the inventory, the **Agent** pane opens, providing detailed information about the selected agent. The information displayed varies based on whether the agent was created in Azure AI Foundry or Copilot Studio.

### [Azure AI Foundry](#tab/azure-ai-foundry)

-- Select **Open agent page** to open the [**AI Agent** page](/azure/defender-for-cloud/identify-ai-workload-model).

:::image type="content" source="media/ai-agent-inventory/foundry-agent-details.png" alt-text="Screenshot that shows the details for Foundry AI agents in the Defender portal."::: 

- Select **Go hunt** to perform [advanced hunting](advanced-hunting-overview.md).
- Select **View on map** to see the agent's [location and related attack paths](/azure/defender-for-cloud/concept-attack-path).

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

:::image type="content" source="media/ai-agent-inventory/copilot-agent-details.png" alt-text="Screenshot that shows the details for Copilot Studio AI agents in the Defender portal.":::

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



