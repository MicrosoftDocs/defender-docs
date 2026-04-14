---
title: Protect AI agents
description: Learn how Microsoft Defender protects AI agents from security threats. Learn about agent inventory, real-time protection, and threat hunting capabilities.
ms.service: defender-xdr
ms.author: abbyweisberg
author: AbbyMSFT
ms.topic: article
ms.date: 11/20/2025
appliesto:
    - Microsoft Defender for XDR
    - Microsoft Defender for Cloud Apps
    - Microsoft Defender for Cloud

#Customer intent: As a security administrator, I want to protect my organization's AI agents from security threats and maintain visibility into agent activities and configurations.
---

# Protect your AI agents (Preview)

As organizations embrace AI agents to streamline operations and enhance productivity, they also face new security risks that these tools can introduce.

Without strong visibility and controls, misconfigured AI agents can expose sensitive data, enable unauthorized access, escalate privileges, and trigger unintended actions that weaken your organization’s security posture.

To provide comprehensive threat protection, Microsoft Defender includes both posture management to minimize the attack threat landscape, while at the same time operating under the assumption that a breach can occur.

## AI agent protection features
Microsoft Defender protects you against security threats with comprehensive AI agent protection, offering proactive exposure management and advanced threat hunting with these features:

- Detects all of your AI agents created with Microsoft Copilot Studio or Azure AI Foundry.
- Collects audit logs for your AI agents, continuously monitors the agents for suspicious activity, and enables detections and alerts. 
- For Copilot Studio AI agents, Microsoft Defender:  
  - Integrates data from Copilot Studio AI agents into [advanced hunting](advanced-hunting-overview.md) for proactive threat detection. You can use this data to create custom queries and hunt for potential threats.
  - [Protects your environment in real-time](/defender-cloud-apps/real-time-agent-protection-during-runtime) to block suspicious or harmful actions initiated by your Copilot Studio AI agents during agent runtime, and triggers an informative alert integrated into the XDR incidents and alerts environment.  
- For Azure AI Foundry AI agents, Microsoft Defender:  
  - Monitors your AI agents for misconfigurations and vulnerabilities, and identifies potential attack paths.
  - Provides security recommendations to improve the security posture of your AI agents.

## Set up the AI agent inventory (Preview)

The AI agent inventory helps security teams discover, catalog, and continuously monitor AI agents across your organization. Microsoft Defender detects all AI agents created with Microsoft Copilot Studio and Azure AI Foundry.

To enable the AI agent inventory, complete these steps:

1. [Enable the Microsoft 365 connector](/defender-cloud-apps/protect-office-365#connect-microsoft-365-to-microsoft-defender-for-cloud-apps) to allow Defender to collect audit logs and monitor your AI agents for suspicious activity.
1. Set up inventory for your AI agents:
   - For **Copilot Studio** AI agents: See [Discover and protect your AI agents (Preview)](/defender-for-cloud-apps/ai-agent-inventory).
   - For **Azure AI Foundry** AI agents: See [Microsoft Defender for Cloud AI Security posture management](/azure/defender-for-cloud/ai-security-posture).

## View the AI agent inventory

After you complete the setup, the AI agent inventory page in Microsoft Defender provides a centralized view of all detected AI agents, along with their key attributes and security status.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.

    A list of all detected AI agents appears. 

    :::image type="content" source="media/ai-agent-inventory/ai-agent-inventory.png" alt-text="Screenshot that shows the AI agent inventory in the Defender portal.":::  

1. Select **Copilot Studio** or **Azure AI Foundry** to see a filtered list of AI agents based on the tool used to create the agent.
1. To see detailed information about a specific AI agent, select the agent from the list. 

## AI agent details
When you select an AI agent from the inventory, the **Agent** pane opens, providing detailed information about the selected agent. The information displayed varies based on whether the agent was created in Azure AI Foundry or Copilot Studio.

### [Azure AI Foundry](#tab/azure-ai-foundry)

- Select **Open agent page** to open the [**AI Agent** page](/azure/defender-for-cloud/identify-ai-workload-model).

:::image type="content" source="media/ai-agent-inventory/foundry-agent-details.png" alt-text="Screenshot that shows the details for Foundry AI agents in the Defender portal."::: 

- Select **Go hunt** to perform [advanced hunting](advanced-hunting-overview.md).
- Select **View on map** to see the agent's [location and related attack paths](/azure/defender-for-cloud/concept-attack-path).

These AI agent details are displayed:

|AI Agent Information  |Description  |
|---------|---------|
|ID     |Unique identifier for the agent as assigned to it in Azure AI Foundry         |
|Name     |Display name of the agent         |
|Account     |The account or tenant under which the AI agent operates, typically linked to organizational ownership.         |
|Deployment     |Details about where and how the AI agent is deployed (e.g., cloud environment, on-premises, hybrid).         |
|Attack paths     |Potential routes or methods that could be exploited to compromise the AI agent or its environment.         |
|Risk factors |Key vulnerabilities or conditions that increase the likelihood of security threats to the AI agent.         |
|Creation time     |Date and time when the agent was created         |
|Project     |The associated project or initiative that the AI agent supports or belongs to.         |
|Model     |The underlying AI/ML model powering the agent, including version or architecture details.         |
|Recommendations     | Suggested actions or best practices to improve security, performance, or compliance for the AI agent.        |


#### [Copilot Studio](#tab/copilot-studio)

- Select **Open agent page** to open the Copilot Studio AI Agent page in the Defender portal.
- Select **Go hunt** to perform [advanced hunting](advanced-hunting-overview.md).

:::image type="content" source="media/ai-agent-inventory/copilot-agent-details.png" alt-text="Screenshot that shows the details for Copilot Studio AI agents in the Defender portal.":::

These AI agent details are displayed:

|AI Agent Information  |Description  |
|---------|---------|
|Description     |Description of the agent as displayed in the agent's source         |
|ID     | Unique identifier for the agent as assigned to it in Microsoft 365 Copilot or Copilot Studio        |
|Environment ID     |The identifier of the Microsoft Power Platform environment the agent resides in.         |
|Name     |Display name of the agent         |
|Creator     | User principal name (UPN) of the account that created the agent        |
|Authentication type | The agent’s configured authentication type for users interacting with the agent; possible values: None, Microsoft, Custom.        |
|Access control     |Users that can interact with the agent; possible values: Any, Copilot readers, Group membership, Any (multitenant)         |
|Creation time     | Date and time when the agent was created        |
|Owner     |User principal names (UPN) of all the owners of the agent         |
|Authentication trigger     | Indicates when authentication is triggered for the agent; possible values: As Needed, Always        |
|Authorized security group IDs     |List of Azure Active Directory Group IDs that are allowed to interact with the agent         |
|Alerts     | Notifies you of any Microsoft Defender alerts related to the AI agent. |


--- 

## See also
 - [Discover and protect your Copilot Studio AI agents (Preview)](/defender-for-cloud-apps/ai-agent-inventory).
 - [Microsoft Defender for Cloud AI Security posture management](/azure/defender-for-cloud/ai-security-posture).
