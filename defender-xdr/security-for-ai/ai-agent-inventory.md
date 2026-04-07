---
title: Discover AI agents and assess security posture using Microsoft Defender
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

#Customer intent: As a security administrator, I want to discover and assess the security posture of my organization's AI agents so that I can manage risks and configurations.
---

# Discover AI agents and assess security posture using Microsoft Defender (Preview)

After you onboard to [Microsoft Agent 365](/microsoft-agent-365/overview), you can discover all of the AI agents in your organization and view their configuration details using Advanced Hunting in the Microsoft Defender portal.

Microsoft Defender also provides a dedicated AI agent inventory experience in the Defender portal for agent discovery and posture management, including agent details, posture insights, risk factors, and security recommendations, where supported. This inventory is currently available for agents built with Microsoft Copilot Studio or pro‑developer platforms, including Microsoft Foundry, AWS Bedrock, and GCP Vertex. To use the inventory, you need to enable the required features.
s
This article explains how to discover AI agents, assess their security posture, and use the AI agent inventory in the Microsoft Defender portal.

## View all Agent 365-managed agents and configuration details using Advanced Hunting

The [AIAgentsInfo table](/defender-xdr/advanced-hunting-aiagentsinfo-table) in Advanced Hunting provides a complete inventory of your A365 agents along with their security-relevant properties. This table enables you to:

- Discover all AI agents registered in your Agent 365 environment.
- Assess security posture by querying authentication, access control, tools, knowledge sources, and orchestration settings.
- Hunt for risks such as unauthenticated agents, overprivileged configurations, data exposure, and misconfigurations.

> [!NOTE]
>  The `AIAgentsInfo` table provides an extended set of properties for Copilot Studio agents, which are not currently available for other AI agents.

To view all of your Agent 365-managed agents and their configuration details:

1. Open the [Microsoft Defender portal](https://security.microsoft.com/)
1. Select **Investigation & response** > **Hunting** > **Advanced hunting**.
1. Query the `AIAgentsInfo` table.

    To run prebuilt queries that Microsoft writes and manages for AI agents, select the **Queries** tab, then select **AI Agents**. For more information, see [Sample queries](/defender-xdr/advanced-hunting-aiagentsinfo-table).

    Create your own queries using Kusto Query Language (KQL). For example, run this query to get a list of all AI agents registered with Microsoft Agent 365, along with their key security information:

    ```kql
    AIAgentsInfo
    | summarize arg_max(Timestamp, *) by AIAgentId
    | where RegistrySource == "A365"
    ```

    For more information about Advanced Hunting, see [Proactively hunt for threats with Advanced Hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview).

We recommend that you reach out to the owners of the risky agents for more information, and that you consider quarantining or deleting risky agents.

## Discover and manage security posture of supported AI agents using the AI agent inventory

The AI agent inventory page in the Defender portal provides a centralized view of all agents you build with Microsoft Copilot Studio or pro‑developer platforms, including Microsoft Foundry, AWS Bedrock, and GCP Vertex, along with their key attributes and security status.

> [!NOTE]
> For Microsoft Copilot Studio agents, the AI agent inventory currently supports agent discovery, but not security posture management.  

1. Enable the required features for AI agent inventory:
    - For Copilot Studio agents, enable the [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory). 
    - For pro‑developer platforms (Microsoft Foundry, AWS Bedrock, and GCP Vertex), enable the [Microsoft Foundry integration in Microsoft Defender for Cloud](/azure/defender-for-cloud/ai-security-posture#discover-ai-agents-preview). 
1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.

    A list of all detected AI agents appears. 

    :::image type="content" source="media/ai-agent-inventory/ai-agent-inventory.png" alt-text="Screenshot that shows the AI agent inventory in the Defender portal." lightbox="media/ai-agent-inventory/ai-agent-inventory.png":::  

1. Select **Copilot Studio** or **Microsoft Foundry** to see a filtered list of AI agents based on the tool used to create the agent.
1. To see detailed information about a specific AI agent, select the agent from the list. This opens the **Agent** pane, which provides detailed information about the selected agent. The information displayed varies based on whether the agent was created in Microsoft Foundry or Copilot Studio.

    ### [Microsoft Foundry](#tab/azure-ai-foundry)

    - Select **Open agent page** to open the [**AI Agent** page](/azure/defender-for-cloud/identify-ai-workload-model).

        :::image type="content" source="media/ai-agent-inventory/foundry-agent-details.png" alt-text="Screenshot that shows the details for Foundry AI agents in the Defender portal." lightbox="media/ai-agent-inventory/foundry-agent-details.png"::: 

    - Select **Go hunt** to run [Advanced Hunting](/defender-xdr/advanced-hunting-overview) queries.
    - Select **View on map** to see the agent's [location and related attack paths](/azure/defender-for-cloud/concept-attack-path).

    These AI agent details are displayed:

    | AI Agent Information | Description |
    | --------- | --------- |
    | ID | Unique identifier for the agent as assigned to it in Microsoft Foundry |
    | Name | Display name of the agent |
    | Account | The account or tenant that the AI agent operates under, typically linked to organizational ownership. |
    | Deployment | Details about where and how the AI agent is deployed, like cloud environment, on-premises, or hybrid. |
    | Attack paths | Potential routes or methods that could be exploited to compromise the AI agent or its environment. |
    | Risk factors | Key vulnerabilities or conditions that increase the likelihood of security threats to the AI agent. |
    | Creation time | Date and time when the agent was created. |
    | Project | The associated project or initiative that the AI agent supports or belongs to. |
    | Model | The underlying AI or ML model powering the agent, including version or architecture details. |
    | Recommendations | Suggested actions or best practices to improve security, performance, or compliance for the AI agent. |

    ### [Copilot Studio](#tab/copilot-studio)

    - Select **Open agent page** to open the Copilot Studio AI Agent page in the Defender portal.
    - Select **Go hunt** to run [Advanced Hunting](/defender-xdr/advanced-hunting-overview) queries.

        :::image type="content" source="media/ai-agent-inventory/copilot-agent-details.png" alt-text="Screenshot that shows the details for Copilot Studio AI agents in the Defender portal." lightbox="media/ai-agent-inventory/copilot-agent-details.png":::

    These AI agent details are displayed:

    | AI Agent Information  | Description |
    | --------- | --------- |
    | Description | Description of the agent as displayed in the agent's source. |
    | ID | Unique identifier for the agent as assigned to it in Microsoft 365 Copilot or Copilot Studio |
    | Environment ID | Identifier of the Microsoft Power Platform environment where the agent resides. |
    | Name | Display name of the agent |
    | Creator | User principal name (UPN) of the account that created the agent. |
    | Authentication type | The agent's configured authentication type for users interacting with the agent. Possible values: None, Microsoft, Custom. |
    | Access control | Users that can interact with the agent. Possible values: Any, Copilot readers, Group membership, Any (multitenant). |
    | Creation time | Date and time when the agent was created |
    | Owner | User principal names (UPN) of all the owners of the agent. |
    | Authentication trigger | Indicates when authentication is triggered for the agent. Possible values: As Needed, Always. |
    | Authorized security group IDs | List of Microsoft Entra group IDs that are allowed to interact with the agent. |
    | Alerts | Microsoft Defender alerts related to the AI agent. |

---

## See also

- [Microsoft Defender for Cloud AI security posture management](/azure/defender-for-cloud/ai-security-posture).
