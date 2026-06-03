---
title: AgentsInfo table in the advanced hunting schema
description: Learn about agent information in the AgentsInfo table of the advanced hunting schema
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Defender for Cloud Apps
ms.topic: reference
ms.date: 06/03/2026
ai-usage: ai-assisted
---

# AgentsInfo (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information relates to prereleased product that may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.
> 
> The `AgentsInfo` table replaces the [`AIAgentsInfo`](advanced-hunting-aiagentsinfo-table.md) table. This table provides a unified schema with expanded coverage for all agent types, including Copilot Studio, Microsoft Foundry, Microsoft 365 Copilot, third-party, and endpoint-discovered agents. Migrate your queries from `AIAgentsInfo` to `AgentsInfo` before July 1, 2026. For more information, see [Advanced hunting schema - Naming changes](advanced-hunting-schema-changes.md).

The `AgentsInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about AI agents and their properties from various platforms. Use this reference to construct queries that return information from this table.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time the agent information was recorded |
| `AgentId` | `string` | Unique identifier for the agent |
| `AgentName` | `string` | Display name of the agent |
| `Platform` | `string` | The platform that provided the information about the agent |
| `AgentDescription` | `string` | Description of the agent as displayed in the agent's source |
| `Version` | `string` | Version of the agent |
| `SourceAgentId` | `string` | Native identifier assigned by the platform where the agent originated |
| `EntraAgentId` | `string` | The agent's unique enterprise application object identifier by Microsoft Entra ID  |
| `EntraBlueprintId` | `string` | The unique identifier by Microsoft Entra ID for the agent identity blueprint, which serves as the template from which the agent's identity was created |
| `ToolsAuthenticationType` | `dynamic` | Structured summary of agent identity, authentication, and authorization model |
| `Permissions` | `dynamic` | Permissions record of the agent, including those that have been requested and granted, their approval state, and consent enumeration |
| `PublishedStatus` | `string` | The agent's publication status; possible values: `Draft`, `Published` |
| `LifecycleStatus` | `string` | The agent's current operational state in the tenant; possible values: `Active`, `Blocked`, `Uninstalled`, `Deleted` |
| `Availability` | `string` | The deployment scope of the agent (that is, whether deployed to all users, specific groups, or individual users) |
| `CreatedDateTime` | `datetime` | Date and time when the agent was created |
| `LastPublishedDateTime` | `datetime` | Date and time when the agent was last published or deployed |
| `LastUpdatedDateTime` | `datetime` | Date and time when the agent's metadata was last modified |
| `Owners` | `dynamic` | Primary owners of the agent |
| `SharedWith` | `dynamic` | The users and security groups the agent has been shared with |
| `InstanceCount` | `int` | Number of agent instances created from the same Microsoft Entra ID agent identity blueprint |
| `Instructions` | `string` | The agent's system prompt that defines its default behavior, persona, and operating boundaries |
| `Model` | `string` | The AI model powering the agent |
| `Channels` | `dynamic` | The channels or surfaces where the agent can operate, such as Microsoft 365 applications or APIs |
| `Capabilities` | `dynamic` | The intents, actions, skills, and orchestrations of the agent |
| `DeclaredDataSources` | `dynamic` | The data repositories and knowledge sources the agent can access |
| `DeclaredTools` | `dynamic` | Functional tools the agent can invoke at runtime |
| `McpServers` | `dynamic` | The Model Context Protocol (MCP) servers connected to the agent, including server URLs and credential configuration |
| `Skills` | `dynamic` | Skills attached to the agent |
| `ConnectedAgents` | `dynamic` | List of other agents connected to the agent for multi-agent orchestration |
| `Memory` | `dynamic` | The agent's declarative memory store configuration |
| `Triggers` | `dynamic` | List of the agent's triggers |
| `Guardrails` | `dynamic` | Guardrails attached to the agent and their coverage |
| `Endpoints` | `dynamic` | List of agent runtime endpoints, including URL, transport type, and external connectivity flag |
| `ObservabilityId` | `dynamic` | Unique identifier used to correlate the agent with its usage and activity data in Microsoft Agent 365 |
| `RawAgentInfo` | `dynamic` | Additional information about the agent, in JSON format |

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
