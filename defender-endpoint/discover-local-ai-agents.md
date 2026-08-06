---
title: Discover local AI agents with Microsoft Defender for Endpoint (Preview)
description: Learn how to discover, view, and investigate local AI agents on Windows and macOS devices by using Microsoft Defender.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: how-to
ms.date: 05/27/2026
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to discover and monitor local AI agents on my organization's devices so that I can manage AI-related security risks on endpoints.
---

# Discover local AI agents with Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Microsoft Defender automatically discovers supported local AI agents and MCP servers configured on onboarded devices and surfaces them in the AI agent inventory and advanced hunting. To learn more about local AI agent discovery, see [Local AI agent discovery with Microsoft Defender for Endpoint](local-agent-discovery-overview.md).

In this article, you learn how to view discovered agents in the inventory, review their configuration and risk, explore their relationships with devices and identities, and investigate agent presence using advanced hunting.

## Prerequisites

Before you can discover local AI agents on endpoints, make sure you meet the following requirements:

- Your environment is in the commercial cloud. Sovereign and national clouds aren't supported.
- Your organization has a Microsoft Defender for Endpoint Plan 2, Microsoft 365 E5, Microsoft Agent 365, or Microsoft 365 E7 license.
- Your devices are [onboarded to Microsoft Defender for Endpoint](onboard-configure.md).
- Your devices run a supported version of Windows or macOS, and Microsoft Defender Antivirus is updated with current monthly platform and engine updates.
- Microsoft Defender Antivirus is running in active mode on your devices, with real-time protection enabled.

You don't need additional deployment, configuration, or scripts beyond the device onboarding requirements. If the device meets all of the prerequisites, agent discovery begins automatically.

### Licensing

Microsoft Defender for Endpoint Plan 2 is the minimum license for local AI agent discovery. Security posture capabilities for the agents that Defender discovers require another license, as described in the following table.

| Capability | Required license |
| --- | --- |
| Discover local AI agents and view them in the AI agent inventory, including the agent details, the device and account, and the configured MCP servers | Microsoft Defender for Endpoint Plan 2 |
| Query local AI agents in advanced hunting, including the `AgentsInfo` table | Microsoft Defender for Endpoint Plan 2 |
| View the risk level, risk indicators, and security recommendations for discovered local AI agents | Microsoft 365 E7, or Microsoft Agent 365 together with Microsoft Defender for Endpoint Plan 2 |

Microsoft 365 E5 and Microsoft 365 E7 both include Microsoft Defender for Endpoint Plan 2. If your organization has Microsoft Defender for Endpoint Plan 2 without Microsoft 365 E7 or Microsoft Agent 365, you can discover local AI agents, view the inventory, and query agents in advanced hunting, but the risk level, risk indicators, and security recommendations aren't available.

## View local AI agents in the inventory

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).

1. In the left navigation pane, select **Assets** > **AI agents**.

1. Select the **Local agents** tab to see the local AI agents discovered on your devices.

    :::image type="content" source="media/local-agent-discovery-overview/discovery-overview.png" alt-text="Screenshot showing the local AI agents inventory in the Microsoft Defender portal with discovered agents listed." lightbox="media/local-agent-discovery-overview/discovery-overview.png":::

The **Agents insights** cards summarize the total number of monitored agents, the number of agents at a high risk level, and the number of critical agents.

The list shows one entry for each agent installation, so an agent that runs on several devices, or under several accounts on the same device, appears more than once. Use the filters to narrow the list, select **Customize columns** to change which columns appear, or select **Export** to download the list.

| Column | Description |
| --- | --- |
| **Agent name**, **Version** | The discovered agent, and the version installed. |
| **Device name**, **Device ID**, **OS platform**, **Device type** | The device where the agent was discovered. |
| **Account name**, **Account domain** | The account that the agent runs under. |
| **Risk level** | The overall risk level of the agent. |
| **Risk indicators** | Why the agent is considered risky, such as **Running on a Critical Device** or **Used by a Critical User**. |
| **Recommendations** | The security recommendations that apply to the agent. |
| **MCP servers**, **Local MCPs** | The number of remote MCP servers, and of local MCP servers, configured for the agent. |
| **First seen** | When the agent was first discovered. |

> [!NOTE]
> Risk levels, risk indicators, and security recommendations require Microsoft 365 E7 or Microsoft Agent 365. Without one of these licenses, you can still view the inventory and the details of each agent. For more information, see [Licensing](#licensing).

### View the details of a local AI agent

From the **Local agents** list, select an agent to open its details pane:

- **Details** shows the agent name, vendor, model, related process, whether the host process is trusted, whether the agent automatically approves its own actions, and the source agent ID.
- **Risk** shows the risk level, the risk indicators, and the security recommendations that apply to the agent.
- **Device details** shows the device where the agent was discovered, including the OS platform and version, the device type and roles, and the Microsoft Entra device ID.
- **User details** shows the ID, name, and domain of the account that the agent runs under.
- **MCP servers** lists the MCP servers configured for the agent, with the name, type, and endpoint of each server.
- **Local MCP servers** lists the local MCP entries discovered on the device.

To investigate further, select **Go hunt** to query the agent in advanced hunting, **View on map** to see the agent in the attack surface map, or **Open Agent page** to open the full agent page.

### Review an agent's attack surface and recommendations

The agent page has an **Overview** tab and a **Security recommendations** tab. The **Attack surface** map on the **Overview** tab shows the other agents, devices, identities, and resources associated with the agent.

For more information on using the AI agent inventory, see [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory).

## Query local AI agents using advanced hunting

Use advanced hunting to proactively investigate local AI agent presence, understand how agents are configured, and identify the agents and users that carry the most risk. These queries help you inventory agents, review the MCP servers they connect to, and trace access to critical or sensitive assets.

### Understand the tables

Three advanced hunting tables describe local AI agents. Each answers a different question, and they're most useful together.

| Table | What it contains | Use it to answer |
| --- | --- | --- |
| [AgentsInfo](/defender-xdr/advanced-hunting-agentsinfo-table) | A profile record for every AI agent that Microsoft Defender discovers, across all agent platforms. For local AI agents, the record includes the publisher, version, host process, trust and auto-approve settings, configured MCP servers, and the device and account where the agent was seen. | What is this agent, and how is it configured? |
| [ExposureGraphNodes](/defender-xdr/advanced-hunting-exposuregraphnodes-table) | Every entity in your organization as a node, including AI agents, devices, identities, and cloud resources, along with properties such as asset criticality and whether the entity holds sensitive data. | What is this entity, and how much does it matter? |
| [ExposureGraphEdges](/defender-xdr/advanced-hunting-exposuregraphedges-table) | The relationships between nodes, such as the device an agent runs on, or the resources an identity can access. | What can this agent reach? |

In short, `AgentsInfo` describes what an agent *is*, and the exposure graph describes what an agent can *reach*.

Both data sources contain agents from every platform, including cloud agents, so each one needs its own filter.

In `AgentsInfo`, filter on the `Platform` column:

```kusto
AgentsInfo
| where Platform == "LocalAgents"
```

In `ExposureGraphNodes`, AI agents use the `ai-agent` node label. Filter on the platform reported in the node properties:

```kusto
ExposureGraphNodes
| where NodeLabel == "ai-agent"
| where tostring(NodeProperties.rawData.aiAgentMetadata.platform) == "LocalAgents"
```

> [!IMPORTANT]
> The `ExposureGraphEdges` table doesn't include a property that identifies local AI agents. Filtering only on `SourceNodeLabel == "ai-agent"` returns edges for every AI agent in your tenant, including cloud agents. Always resolve the local agent set from `ExposureGraphNodes` first, and then join to `ExposureGraphEdges` on the node ID, as shown in the following queries.

### Combine the tables

An agent has two identifiers, and queries that combine the tables need both:

- `AgentId` identifies the agent profile in `AgentsInfo`. The exposure graph stores the same value in the agent node, as `NodeProperties.rawData.aiAgentMetadata.id`.
- `NodeId` identifies the agent's node in the exposure graph. This is the value that `ExposureGraphEdges` refers to, in `SourceNodeId` and `TargetNodeId`.

| To go from | To | Match on |
| --- | --- | --- |
| `AgentsInfo` | `ExposureGraphNodes` | `tostring(AgentId)` and `tostring(NodeProperties.rawData.aiAgentMetadata.id)` |
| `ExposureGraphNodes` | `ExposureGraphEdges` | `NodeId` and `SourceNodeId` or `TargetNodeId` |

> [!NOTE]
> `AgentId` is a `guid` column in `AgentsInfo`, but the exposure graph stores the same value as a string. Convert it with `tostring()` on both sides of the join. A join between columns of different types doesn't match any rows.

Local AI agent nodes connect to the rest of the exposure graph through the following edges:

| Edge label | Target node label | Description |
| --- | --- | --- |
| `runs on` | `device`, `ec2.instance`, `microsoft.compute/virtualmachines` | The device where the agent was discovered. |
| `uses` | `mcp/server` | An MCP server that's configured for the agent. |
| `used by` | `user` | The identity that uses the agent. |

Cloud AI agents also use a `can authenticate as` edge that points to a service principal or a Microsoft Entra OAuth app. Local AI agents don't use that edge, so use `used by` to resolve the identity behind a local AI agent.

Asset criticality is stored in `ExposureGraphNodes`, in `NodeProperties.rawData.criticalityLevel.criticalityLevel`, where `0` is the highest level (very high) and `3` is the lowest (low). The `ruleNames` property lists the classification rules that made the asset critical.

### Work with local AI agent profiles

`AgentsInfo` adds a record each time an agent profile is updated, so a single agent usually has several records. To return only the most recent record for each agent, summarize with `arg_max` on `Timestamp`:

```kusto
AgentsInfo
| where Platform == "LocalAgents"
| summarize arg_max(Timestamp, Name, Version, LifecycleStatus, RawAgentInfo) by AgentId
```

`LifecycleStatus` reports whether the agent is still present on the device. An agent that's reinstalled can also be reissued with a new `AgentId`, which leaves the earlier record marked as `Deleted`, so filter out `Deleted` and `Uninstalled` records when you want a current inventory.

Many `AgentsInfo` columns describe cloud agents and are empty for local AI agents. The columns that carry local AI agent data are `AgentId`, `Name`, `Version`, `PublishedStatus`, `LifecycleStatus`, `LastUpdatedDateTime`, `McpServers`, `DeclaredTools`, and `RawAgentInfo`.

Local AI agent posture is nested in the `RawAgentInfo` column, under `localAgentMetadata`:

| Property | Description |
| --- | --- |
| `vendor` | The publisher of the agent, such as Anthropic, Google, or OpenAI. |
| `relatedProcess` | The process that hosts the agent, such as `code.exe`. |
| `trustedProcess` | Whether the host process is trusted. Reported as the string `"true"` or `"false"`. |
| `autoApprove` | Whether the agent acts without prompting the user for approval. Reported as the string `"true"` or `"false"`. |
| `deviceName`, `aadDeviceId` | The device where the agent was discovered. |
| `accountName`, `accountDomain`, `accountSid` | The account that the agent ran under. |
| `localMcps` | MCP servers that run locally on the device, including the command that starts each one. |

> [!NOTE]
> `trustedProcess` and `autoApprove` are reported as strings, not as boolean values. Compare them to `"true"` or `"false"` rather than using `tobool()`.

Each of the following queries is self-contained. The queries that use the exposure graph start with a set of `let` statements that resolve local AI agents and the devices they run on.

### Get an inventory of local AI agents

This query lists the local AI agents discovered in your organization, together with the publisher, the host process, the versions in use, and how widely each agent is deployed:

```kusto
AgentsInfo
| where Platform == "LocalAgents"
| summarize arg_max(Timestamp, Name, Version, LifecycleStatus, RawAgentInfo)
    by AgentId
| where LifecycleStatus !in~ ("Deleted", "Uninstalled")
| extend AgentMetadata = RawAgentInfo.localAgentMetadata
| extend Vendor = tostring(AgentMetadata.vendor),
         Process = tostring(AgentMetadata.relatedProcess),
         Device = tostring(AgentMetadata.deviceName),
         Account = tostring(AgentMetadata.accountName)
| summarize Installations = count(),
            DeviceCount = dcount(Device),
            Devices = make_set(Device, 100),
            Versions = make_set(Version, 20),
            Accounts = make_set_if(Account, isnotempty(Account), 50)
    by Agent = Name, Vendor, Process
| sort by DeviceCount desc, Installations desc
```

Each `AgentId` represents one agent profile, which is a single agent on a single device for a single account. `Installations` counts those profiles, so an agent that two people use on the same device counts twice, while `DeviceCount` counts the device once.

### Review the MCP servers and tools that local AI agents use

This query lists the MCP servers and tools configured for local AI agents, the agents and devices that use them, and where each one runs:

```kusto
let localAgentProfiles =
    AgentsInfo
    | where Platform == "LocalAgents"
    | extend AgentMetadata = RawAgentInfo.localAgentMetadata
    | project Timestamp,
              Agent = Name,
              Device = tostring(AgentMetadata.deviceName),
              Account = tostring(AgentMetadata.accountName),
              McpServers,
              DeclaredTools,
              LocalServers = AgentMetadata.localMcps;
let remoteMcpServers =
    localAgentProfiles
    | mv-expand Server = McpServers
    | project Timestamp, Agent, Device, Account,
              McpServer = tostring(Server.name),
              Origin = "Remote MCP server",
              Transport = tostring(Server.type),
              Location = tostring(Server.endpoint);
let agentDeclaredTools =
    localAgentProfiles
    | mv-expand Tool = DeclaredTools
    | project Timestamp, Agent, Device, Account,
              McpServer = tostring(Tool.name),
              Origin = "Declared tool",
              Transport = tostring(Tool.type),
              Location = tostring(Tool.endpoint);
let localMcpServers =
    localAgentProfiles
    | mv-expand Server = LocalServers
    | project Timestamp, Agent, Device, Account,
              McpServer = tostring(Server.name),
              Origin = "Local MCP server",
              Transport = tostring(Server.transportType),
              Location = tostring(Server.commandName);
remoteMcpServers
| union agentDeclaredTools, localMcpServers
| where isnotempty(McpServer)
| summarize LastSeen = max(Timestamp),
            Agents = make_set(Agent, 20),
            Devices = make_set(Device, 20),
            Accounts = make_set_if(Account, isnotempty(Account), 20)
    by McpServer, Origin, Transport, Location
| sort by McpServer asc, Origin asc
```

The `Origin` column distinguishes the three ways a server or tool is reported:

- A **remote MCP server** is reached over the network, and `Location` holds its endpoint.
- A **local MCP server** runs as a process on the device, and `Location` holds the command that starts it. Local MCP servers are reported only in `AgentsInfo`.
- A **declared tool** is a tool the agent advertises. Declared tools are often backed by an MCP server, but they don't always report an endpoint.

Unlike the other queries, this one reads every profile record for each agent, so that MCP servers reported at any point are included. The `LastSeen` column shows when each server was last reported.

### Find local AI agents with risky configurations

This query returns local AI agents that act without asking the user for approval, or that run in a host process that isn't trusted:

```kusto
AgentsInfo
| where Platform == "LocalAgents"
| summarize arg_max(Timestamp, Name, Version, LifecycleStatus, RawAgentInfo)
    by AgentId
| where LifecycleStatus !in~ ("Deleted", "Uninstalled")
| extend AgentMetadata = RawAgentInfo.localAgentMetadata
| extend AutoApprove = tostring(AgentMetadata.autoApprove),
         TrustedProcess = tostring(AgentMetadata.trustedProcess),
         Vendor = tostring(AgentMetadata.vendor),
         Process = tostring(AgentMetadata.relatedProcess),
         Device = tostring(AgentMetadata.deviceName),
         Account = tostring(AgentMetadata.accountName)
| where AutoApprove =~ "true" or TrustedProcess =~ "false"
| extend RiskReason = case(
    AutoApprove =~ "true" and TrustedProcess =~ "false",
        "Acts without approval, and the host process isn't trusted",
    AutoApprove =~ "true",
        "Acts without approval",
    "The host process isn't trusted")
| project Agent = Name, Vendor, Version, Process, Device, Account,
          AutoApprove, TrustedProcess, RiskReason, LastSeen = Timestamp
| sort by Device asc, Agent asc
```

An agent that auto-approves its own actions runs tools and reaches resources without a person confirming each step, so the account and device that the agent runs on define what it can do unsupervised.

### Find risky local AI agents on critical devices

This query combines agent configuration from `AgentsInfo` with asset criticality from the exposure graph, so you can start with the agents that both act unsupervised and run on business-critical devices:

```kusto
let deviceLabels = dynamic(["device", "ec2.instance",
                            "microsoft.compute/virtualmachines"]);
let riskyAgentProfiles =
    AgentsInfo
    | where Platform == "LocalAgents"
    | summarize arg_max(Timestamp, Name, Version, LifecycleStatus, RawAgentInfo)
        by AgentId
    | where LifecycleStatus !in~ ("Deleted", "Uninstalled")
    | extend AgentMetadata = RawAgentInfo.localAgentMetadata
    | extend AutoApprove = tostring(AgentMetadata.autoApprove),
             TrustedProcess = tostring(AgentMetadata.trustedProcess)
    | where AutoApprove =~ "true" or TrustedProcess =~ "false"
    | project AgentId = tostring(AgentId),
              Agent = Name,
              Version,
              Vendor = tostring(AgentMetadata.vendor),
              Account = tostring(AgentMetadata.accountName),
              AutoApprove,
              TrustedProcess;
let localAgentNodes =
    ExposureGraphNodes
    | where NodeLabel == "ai-agent"
    | where tostring(NodeProperties.rawData.aiAgentMetadata.platform) == "LocalAgents"
    | project AgentNodeId = NodeId,
              AgentId = tostring(NodeProperties.rawData.aiAgentMetadata.id);
let agentDeviceEdges =
    ExposureGraphEdges
    | where SourceNodeLabel == "ai-agent"
    | where EdgeLabel =~ "runs on"
    | where TargetNodeLabel in (deviceLabels)
    | project AgentNodeId = SourceNodeId, DeviceId = TargetNodeId,
              Device = TargetNodeName, DeviceType = TargetNodeLabel;
let criticalDevices =
    ExposureGraphNodes
    | where NodeLabel in (deviceLabels)
    | where NodeProperties has "criticalityLevel"
    | extend CriticalityLevel =
        toint(NodeProperties.rawData.criticalityLevel.criticalityLevel)
    | where CriticalityLevel between (0 .. 3)
    | extend Criticality = case(
        CriticalityLevel == 0, "Very high",
        CriticalityLevel == 1, "High",
        CriticalityLevel == 2, "Medium",
        "Low")
    | project DeviceId = NodeId, CriticalityLevel, Criticality,
              CriticalityReason =
                  tostring(NodeProperties.rawData.criticalityLevel.ruleNames);
riskyAgentProfiles
| join kind=inner localAgentNodes on AgentId
| join kind=inner agentDeviceEdges on AgentNodeId
| join kind=inner criticalDevices on DeviceId
| project Device, DeviceType, Criticality, CriticalityReason,
          Agent, Vendor, Version, Account, AutoApprove, TrustedProcess,
          CriticalityLevel
| sort by CriticalityLevel asc, Device asc, Agent asc
| project-away CriticalityLevel
```

To review every local AI agent on a critical device instead of only the risky ones, remove the `where AutoApprove =~ "true" or TrustedProcess =~ "false"` line.

### Rank the users whose local AI agents reach critical or sensitive assets

This query ranks the identities that use local AI agents by how many critical or sensitive resources they can reach, so you can prioritize the users with the widest blast radius. The `UserCriticality` column shows whether the identity is itself classified as a critical asset, such as a Global Administrator:

```kusto
let deviceLabels = dynamic(["device", "ec2.instance",
                            "microsoft.compute/virtualmachines"]);
let localAgents =
    ExposureGraphNodes
    | where NodeLabel == "ai-agent"
    | where tostring(NodeProperties.rawData.aiAgentMetadata.platform) == "LocalAgents"
    | project AgentNodeId = NodeId, AIAgent = NodeName;
let agentDeviceEdges =
    ExposureGraphEdges
    | where SourceNodeLabel == "ai-agent"
    | where EdgeLabel =~ "runs on"
    | where TargetNodeLabel in (deviceLabels)
    | project AgentNodeId = SourceNodeId, DeviceId = TargetNodeId,
              Device = TargetNodeName;
let agentUserEdges =
    ExposureGraphEdges
    | where SourceNodeLabel == "ai-agent"
    | where EdgeLabel =~ "used by"
    | project AgentNodeId = SourceNodeId, UserId = TargetNodeId,
              User = TargetNodeName;
let userReach =
    ExposureGraphEdges
    | where EdgeLabel in~ ("has permissions to", "has role on")
    | project UserId = SourceNodeId, AssetId = TargetNodeId
    | union (
        ExposureGraphNodes
        | where NodeLabel == "user"
        | project UserId = NodeId, AssetId = NodeId
    );
let sensitiveAssets =
    ExposureGraphNodes
    | extend CriticalityLevel = toint(NodeProperties.rawData.criticalityLevel.criticalityLevel)
    | extend HasSensitiveData = iff(isnotempty(NodeProperties.rawData.containsSensitiveData),
        "Yes", "No")
    | extend CriticalityReason = tostring(NodeProperties.rawData.criticalityLevel.ruleNames)
    | where CriticalityLevel > 0 or HasSensitiveData == "Yes"
    | extend Criticality = case(
        CriticalityLevel == 1, "Critical",
        CriticalityLevel == 2, "High",
        CriticalityLevel == 3, "Medium",
        CriticalityLevel == 4, "Low",
        "Sensitive Data"
    )
    | project AssetId = NodeId, AssetName = NodeName, AssetType = NodeLabel,
              Criticality, HasSensitiveData, CriticalityReason;
ExposureGraphEdges
| where SourceNodeLabel == "endpointAiAgent"
| project AIAgent = SourceNodeName, n1 = TargetNodeId, Device = TargetNodeName
| join kind=inner (
    biEdges | project n1 = src, n2 = tgt, Hop1 = tgtName, Via1 = edge
) on n1
| join kind=inner (
    biEdges | project n2 = src, n3 = tgt, Via2 = edge
) on n2
| join kind=inner (
    sensitiveAssets | project n3 = AssetId, AssetName, AssetType,
                             Criticality, HasSensitiveData, CriticalityReason
) on n3
| summarize ExposedVia = make_set(Hop1) by
    AIAgent, Device, AssetName, AssetType,
    Criticality, HasSensitiveData, CriticalityReason
| sort by Criticality asc, HasSensitiveData desc
```