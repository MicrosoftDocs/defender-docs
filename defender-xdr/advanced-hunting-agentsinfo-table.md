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
> The `AgentsInfo` table replaces the [`AIAgentsInfo`](advanced-hunting-aiagentsinfo-table.md) table on July 1, 2026. This table provides a unified schema with expanded coverage for all agent types, including Copilot Studio, Azure AI Foundry, Microsoft 365 Copilot, third-party, and endpoint-discovered agents. Migrate your queries from `AIAgentsInfo` to `AgentsInfo` before this date. For more information, see [Advanced hunting schema - Naming changes](advanced-hunting-schema-changes.md).
The `AgentsInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about AI agents and their properties from various platforms. Use this reference to construct queries that return information from this table.

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time the agent information was recorded |
| `AgentId` | `string` | Unique identifier for the agent |
| `AgentName` | `string` | Display name of the agent |
| `Platform` | `string` | The platform that provided the information about the agent |
| `AgentDescription` | `string` | Description of the agent as displayed in the agent's source |
| `Version` | `string` | Builder-defined version of the agent indicating capability changes |
| `SourceAgentId` | `string` | Native identifier assigned by the platform where the agent originated |
| `EntraAgentID` | `string` | The agent's unique enterprise application object identifier by Microsoft Entra ID |
| `EntraBlueprintID` | `string` | The unique identifier by Microsoft Entra ID for the agent identity blueprint that serves as the template for agent creation |
| `ToolsAuthType` | `dynamic` | Structured summary of agent identity, authentication, and authorization model |
| `Permissions` | `dynamic` | Permissions record of the agent, including requested, granted, approval state, and consent |
| `PublishedStatus` | `string` | The agent's publication status; possible values: `Draft`, `Published` |
| `LifecycleStatus` | `string` | The agent's current operational state; possible values: `Active`, `Blocked`, `Uninstalled`, `Deleted` |
| `Availability` | `string` | Deployment scope of the agent; possible values: all users, groups, individuals |
| `CreationTime` | `datetime` | Date and time when the agent was created |
| `LastPublishedTime` | `datetime` | Date and time when the agent was last published or deployed |
| `LastUpdated` | `datetime` | Date and time when the agent's metadata was last modified |
| `Owners` | `dynamic` | Primary owners of the agent |
| `SharedWith` | `dynamic` | Users and groups the agent is shared with |
| `InstanceCount` | `int` | Number of agent instances created from the same blueprint |
| `Instructions` | `string` | System prompt defining the agent's behavior and operating boundaries |
| `Model` | `string` | The AI model powering the agent |
| `Channels` | `dynamic` | Surfaces where the agent operates, such as Teams or M365 Chat |
| `Capabilities` | `dynamic` | Intents, actions, skills, and orchestrations the agent can perform |
| `DeclaredDataSources` | `dynamic` | Data sources the agent can access |
| `DeclaredTools` | `dynamic` | Tools the agent can invoke |
| `MCPServers` | `dynamic` | MCP servers connected to the agent, including endpoints and credentials |
| `Skills` | `dynamic` | Skills attached to the agent |
| `ConnectedAgents` | `dynamic` | Other agents connected for orchestration |
| `Memory` | `dynamic` | Declarative memory store configuration for persistent context |
| `Triggers` | `dynamic` | List of triggers configured for the agent |
| `Guardrails` | `dynamic` | Guardrails applied to the agent and their coverage |
| `AgentEndpoints` | `dynamic` | Runtime endpoints including URL, transport, and external flag |
| `ObservabilityID` | `dynamic` | Identifier used to correlate agent usage and activity data |
| `RawAgentInfo` | `dynamic` | Additional agent configuration in JSON format |

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
