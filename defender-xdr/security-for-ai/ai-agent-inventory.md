---
title: Discover AI agents and assess security posture using Microsoft Defender
description: Learn how to discover AI agents in your organization, assess their security posture, and manage risks using Microsoft Defender's AI agent inventory and Advanced Hunting capabilities.
ms.service: microsoft-defender
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.topic: article
ms.date: 11/20/2025
ai-usage: ai-assisted

#Customer intent: As a security administrator, I want to discover and assess the security posture of my organization's AI agents so that I can manage risks and configurations.
---

# Discover AI agents and assess security posture using Microsoft Defender

Microsoft Defender lets you discover all of the Microsoft Agent 365 managed agents in your organization and view their configuration details using two experiences in the Microsoft Defender portal: 

- Advanced Hunting
- A dedicated AI agent inventory experience

This inventory includes cloud agents built with Microsoft Copilot Studio, Microsoft Foundry, and [supported non-Microsoft cloud platforms](/microsoft-agent-365/admin/agent-registry), and [local AI agents](/defender-endpoint/local-agent-discovery-overview) discovered on endpoints. 

This article explains how to discover AI agents, assess their security posture, and use the AI agent inventory in the Microsoft Defender portal. 

## Prerequisites

- Enable security for AI agents, including the Microsoft 365 app connector. See [Enable security for AI agents using Microsoft Defender](get-started-defender-security-for-ai.md).
- To discover local AI agents that run on endpoints, set up [AI agent runtime protection in Microsoft Defender for Endpoint](/defender-endpoint/configure-ai-agent-runtime-protection). Discovery requires Microsoft Defender for Endpoint and Microsoft Defender Antivirus in active mode. Local agents are onboarded separately from cloud agents.

## Discover AI agents and assess security posture using Advanced Hunting

The [AgentsInfo table](/defender-xdr/advanced-hunting-agentsinfo-table) in Advanced Hunting provides a complete inventory of your Agent 365 agents along with their security-relevant properties. This table enables you to:

- **Discover AI agents** registered in your Agent 365 environment.
- **Assess security posture and risks** by querying authentication, access control, tools, knowledge sources, and orchestration settings.

> [!NOTE]
> The `AgentsInfo` table replaces the previous `AIAgentsInfo` table as part of the Microsoft Agent 365 transition. For more information, see [Transition agent security capabilities to Microsoft Agent 365](transition-agent-security-to-agent-365.md).

To view your Agent 365-managed agents and their configuration details:

1. Open the [Microsoft Defender portal](https://security.microsoft.com/)
1. Select **Investigation & response** > **Hunting** > **Advanced hunting**.
1. Query the `AgentsInfo` table.

    **To manage security posture**, use the prebuilt queries that Microsoft provides and maintains for AI agents. To access these queries, select the **Queries** tab, then select **AI Agents**. For more information, see [Sample queries](/defender-xdr/advanced-hunting-agentsinfo-table).

    Create your own queries using Kusto Query Language (KQL). For example, run this query to get a list of all AI agents registered with Microsoft Agent 365, along with their key security information:

    ```kql
    AgentsInfo
    | summarize arg_max(Timestamp, *) by AgentId
    | where LifecycleStatus != "Deleted"
    ```

    The results show you the AI agents in your organization that are registered with Microsoft Agent 365, along with their configuration settings. 

    :::image type="content" source="media/ai-agent-inventory/advanced-hunting-ai-agents-query.png" alt-text="Screenshot of Advanced Hunting in Microsoft Defender showing the AgentsInfo table query with results displaying agent name, platform, description, version, published status, lifecycle status, and creation time." lightbox="media/ai-agent-inventory/advanced-hunting-ai-agents-query.png":::

    > [!IMPORTANT]
    > The `AgentsInfo` table stores multiple snapshots of each agent over time. Use `arg_max(Timestamp, *)` to get the latest state of each agent. For more information about the arg_max() aggregation function, see [arg_max() function](/kusto/query/arg-max-aggregation-function).

    For more information:

    - To learn how to query local AI agents discovered on endpoint devices, see [Discover local AI agents in Microsoft Defender for Endpoint](/defender-endpoint/discover-local-ai-agents).
    - To learn about advanced hunting, see [Proactively hunt for threats with Advanced Hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview).

## Discover and manage AI agents using the AI Assets page

The **AI Assets** page in the Defender portal provides a centralized view of all agents you build with Microsoft agent plaforms, supported non-Microsoft cloud platforms, and [local AI agents](/defender-endpoint/local-agent-discovery-overview) discovered on endpoints.

To view your AI agent inventory:
 
1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
1. In the left navigation pane, select **Assets** > **AI Agents**.

    The **AI Assets** page opens. Select the **Agents** tab to see cloud-based agents, or the **Local agents** tab to see agents discovered on endpoints.

    :::image type="content" source="media/ai-agent-inventory/ai-agent-inventory.png" alt-text="Screenshot that shows the AI Assets page in the Defender portal with the Agents tab selected, displaying agent name, platform, publish status, MCP servers count, discovered tools, active alerts, and creation time columns." lightbox="media/ai-agent-inventory/ai-agent-inventory.png":::  

1. Use the filter bar to narrow the list by **Agent name**, **Platform**, **Publish status**, **Model**, **Version**, or **Creation time**.
1. To see detailed information about an AI agent, select the agent from the list. This opens the **Agent** pane, which provides detailed information about the selected agent. 

    :::image type="content" source="media/ai-agent-inventory/ai-agent-details-pane.png" alt-text="Screenshot of the AI agent inventory in the Defender portal showing the agent details pane for a selected Copilot Studio agent, including description, version, publish status, creation time, model, tools, channels, and MCP servers." lightbox="media/ai-agent-inventory/ai-agent-details-pane.png":::

    - Select **Open agent page** to open the **AI Agent** page.
    - Select **Go hunt** to run [Advanced Hunting](/defender-xdr/advanced-hunting-overview) queries.

## Next steps

- [Detect and investigate threats to AI agents using Microsoft Defender](ai-agent-detection-protection.md)

- [Protect AI agents in real time using Microsoft Defender](ai-agent-real-time-protection.md)
- [Protect AI agents from emerging threats and vulnerabilities using Microsoft Defender](defender-security-for-ai.md)
- [Microsoft Defender for Cloud AI security posture management](/azure/defender-for-cloud/ai-security-posture).
