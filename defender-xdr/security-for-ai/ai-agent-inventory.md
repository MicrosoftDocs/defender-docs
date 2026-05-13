---
title: Discover AI agents and assess security posture using Microsoft Defender (Preview)
description: Learn how to discover AI agents in your organization, assess their security posture, and manage risks using Microsoft Defender's AI agent inventory and Advanced Hunting capabilities.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
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

Microsoft Defender also provides a dedicated AI agent inventory experience in the Defender portal for agent discovery and posture management, including agent details, posture insights, risk factors, and security recommendations, where supported. This inventory is currently available for agents built with Microsoft Copilot Studio, Microsoft Foundry, AWS Bedrock, and GCP Vertex AI. To use the inventory, you need to enable the required features.

Microsoft Defender for Endpoint also automatically discovers supported [local AI coding agents](#discover-local-ai-coding-agents-on-endpoints-preview) running on endpoint devices and surfaces them in the AI agent inventory, exposure map, and Advanced Hunting.

This article explains how to discover AI agents, assess their security posture, and use the AI agent inventory in the Microsoft Defender portal.

## View all Agent 365-managed agents and configuration details using Advanced Hunting

The [AIAgentsInfo table](/defender-xdr/advanced-hunting-aiagentsinfo-table) in Advanced Hunting provides a complete inventory of your Agent 365 agents along with their security-relevant properties. This table enables you to:

- **Discover AI agents** registered in your Agent 365 environment.
- **Assess security posture and risks** by querying authentication, access control, tools, knowledge sources, and orchestration settings.

> [!NOTE]
> The `AIAgentsInfo` table provides an extended set of properties for Copilot Studio agents.

To view all of your Agent 365-managed agents and their configuration details:

1. Open the [Microsoft Defender portal](https://security.microsoft.com/)
1. Select **Investigation & response** > **Hunting** > **Advanced hunting**.
1. Query the `AIAgentsInfo` table.

    **To manage security posture**, use the prebuilt queries that Microsoft provides and maintains for AI agents. To access these queries, select the **Queries** tab, then select **AI Agents**. For more information, see [Sample queries](/defender-xdr/advanced-hunting-aiagentsinfo-table).

    Create your own queries using Kusto Query Language (KQL). For example, run this query to get a list of all AI agents registered with Microsoft Agent 365, along with their key security information:

    ```kql
    AIAgentsInfo
    | summarize arg_max(Timestamp, *) by AIAgentId
    | where RegistrySource == "A365"
    | where AgentStatus != "Deleted"
    ```

    The results show you all of the AI agents in your organization that are registered with Microsoft Agent 365, along with their configuration settings. 

    :::image type="content" source="media/ai-agent-inventory/advanced-hunting-ai-agents-query.png" alt-text="Screenshot of Advanced Hunting in Microsoft Defender showing a KQL query editor, Run query button, and agent results table." lightbox="media/ai-agent-inventory/advanced-hunting-ai-agents-query.png":::

    > [!IMPORTANT]
    > The `AIAgentsInfo` table stores multiple snapshots of each agent over time. Use `arg_max(Timestamp, *)` to get the latest state of each agent. For more information about the arg_max() aggregation function, see [arg_max() function](/kusto/query/arg-max-aggregation-function).

    For more information about Advanced Hunting, see [Proactively hunt for threats with Advanced Hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview).

## Discover and manage security posture of supported AI agents using the AI agent inventory UI

The AI agent inventory page in the Defender portal provides a centralized view of all agents you build with Microsoft Copilot Studio, Microsoft Foundry, AWS Bedrock, and GCP Vertex AI, along with their key attributes and security status.

For Microsoft Foundry agents, Microsoft Defender also surfaces security posture recommendations. For a complete list of AI security posture recommendations that can apply to Microsoft Foundry workloads, see [AI security recommendations](/azure/defender-for-cloud/recommendations-reference-ai#azure-recommendations).

1. Enable the required features for AI agent inventory:
    - For Copilot Studio agents, enable the [Copilot Studio integration in Microsoft Defender for Cloud Apps](/defender-cloud-apps/ai-agent-inventory). 
    - For Microsoft Foundry, AWS Bedrock, and GCP Vertex AI, enable the [Microsoft Foundry integration in Microsoft Defender for Cloud](/azure/defender-for-cloud/ai-security-posture#discover-ai-agents-preview). 
1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.

    A list of all detected AI agents appears. 

    :::image type="content" source="media/ai-agent-inventory/ai-agent-inventory.png" alt-text="Screenshot that shows the AI agent inventory in the Defender portal." lightbox="media/ai-agent-inventory/ai-agent-inventory.png":::  

1. Select **Microsoft Foundry**, **Copilot Studio**, **AWS Bedrock**, or **GCP Vertex AI** to see a filtered list of AI agents based on the tool used to create the agent.
1. To see detailed information about an AI agent, select the agent from the list. This opens the **Agent** pane, which provides detailed information about the selected agent. The information displayed varies based on whether the agent was created in Microsoft Copilot Studio, Microsoft Foundry, AWS Bedrock, or GCP Vertex AI.

    :::image type="content" source="media/ai-agent-inventory/ai-agent-details-pane.png" alt-text="Screenshot of the AI agent inventory in the Defender portal showing agent list, filters, and detailed information for a selected Microsoft Foundry agent." lightbox="media/ai-agent-inventory/ai-agent-details-pane.png":::

    > [!NOTE]
    > For Microsoft Copilot Studio agents, the AI agent inventory currently supports agent discovery, but not security posture management. To manage security posture for Copilot Studio agents, use [Advanced Hunting](#view-all-agent-365-managed-agents-and-configuration-details-using-advanced-hunting).

    - Select **Open agent page** to open the **AI Agent** page.

        :::image type="content" source="media/ai-agent-inventory/foundry-agent-details.png" alt-text="Screenshot that shows the details for Microsoft Foundry AI agents in the Defender portal." lightbox="media/ai-agent-inventory/foundry-agent-details.png"::: 

    - Select **Go hunt** to run [Advanced Hunting](/defender-xdr/advanced-hunting-overview) queries.
    - Select **View on map** to see the agent's location and related attack paths.


## Discover local AI coding agents on endpoints (Preview)

Microsoft Defender for Endpoint automatically discovers supported AI coding agents running locally on onboarded endpoint devices. Discovered agents appear as assets in the Defender portal's AI agent inventory, where you can view agent details, explore device and identity relationships using the exposure map, and investigate agent presence using Advanced Hunting.

> [!NOTE]
> Local AI coding agent discovery provides **discovery and investigation capabilities only**. It doesn't include security posture assessment, governance controls, alerts, or runtime protection for endpoint agents at this time.

### Prerequisites

Before you can discover local AI coding agents on endpoints, make sure the following requirements are met:

- Devices run **Windows 11**. macOS support is planned for a future release.
- Devices are [onboarded to Microsoft Defender for Endpoint](/defender-endpoint/onboard-configure).
- **Microsoft Defender Antivirus** is the primary antivirus solution on the device.
- Your environment is in the **commercial cloud**. Sovereign and national clouds aren't supported.

No additional deployment, configuration, or scripts are required beyond device onboarding. Agent discovery begins automatically after your tenant is enabled.

### Supported AI coding agents

The following local AI coding agents are discovered on endpoints:

| Agent | Type |
|---|---|
| Claude Code | CLI and Desktop |
| Codex | CLI |
| Cursor | Desktop |
| GitHub Copilot CLI | CLI |
| ChatGPT Desktop | Desktop |
| Gemini CLI | CLI |
| Ollama Desktop | Desktop |
| Poe Desktop | Desktop |

The following VS Code extensions are also discovered:

- Claude Code
- Cline
- Gemini
- GitHub Copilot
- Roo Code

### View local AI coding agents in the inventory

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.
1. Select **Local AI Agents (Preview)** to see a filtered list of AI coding agents discovered on endpoint devices.

### View agent details

1. From the **Local AI Agents** list, select an agent to open the **Agent entity page**.
1. Review the agent details, including:

    - Associated device
    - Operating system and machine context
    - Discovery timestamp

### Explore the exposure map

From the agent entity page, select the related **Device** entity, and then select **Map** to view relationships across:

- Devices
- Identities
- Cloud resources
- Other connected assets

Use the exposure map to understand the potential blast radius and prioritize investigation for devices where AI coding agents are present.

### Hunt for local AI agents using Advanced Hunting

Use the `ExposureGraphEdges` and `ExposureGraphNodes` tables in [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to query for local AI coding agents discovered on endpoint devices.

#### Get an inventory of AI agents across endpoints

This query lists all discovered AI coding agents and the devices they run on:

```kusto
ExposureGraphEdges
| where SourceNodeLabel == "endpointAiAgent"
| where EdgeLabel =~ "runs on"
| summarize Devices = make_set(TargetNodeName),
            DeviceCount = dcount(TargetNodeName)
    by AIAgent = SourceNodeName
| sort by DeviceCount desc
```

#### Map AI agents to users

This query maps AI coding agents to the users associated with the devices they run on:

```kusto
let accessEdges = dynamic(["contains", "has credentials of", "has permissions to",
                           "has role on", "can authenticate as", "can authenticate to"]);
ExposureGraphEdges
| where SourceNodeLabel == "endpointAiAgent"
| project AIAgent = SourceNodeName, DeviceId = TargetNodeId
| join kind=inner (
    ExposureGraphEdges
    | where EdgeLabel in (accessEdges)
    | project User = SourceNodeName, DeviceId = TargetNodeId
) on DeviceId
```

## Next steps

- [Detect, block, and investigate threats to AI agents using Microsoft Defender](ai-agent-detection-protection.md)
- [Protect AI agents from emerging threats and vulnerabilities using Microsoft Defender](defender-security-for-ai.md)
- [Microsoft Defender for Cloud AI security posture management](/azure/defender-for-cloud/ai-security-posture).
