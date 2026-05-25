---
title: Discover local AI agents
description: Learn how to discover, view, and investigate AI coding agents running locally on Windows and macOS devices using Microsoft Defender for Endpoint.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to discover and monitor AI coding agents running on my organization's devices so that I can manage AI-related security risks on endpoints.

---

# Discover local AI agents

Microsoft Defender for Endpoint automatically discovers supported AI coding agents and MCP servers running locally on onboarded devices and surfaces them in the AI agent inventory. This article is part of the broader [AI coding agent discovery with Microsoft Defender for Endpoint](protect-ai-agents-overview.md) experience.

In this article, you learn how to view discovered agents in the inventory, explore their relationships with devices and identities, and investigate agent presence using advanced hunting.

> [!NOTE]
> Local AI coding agent discovery provides **discovery and investigation capabilities only**. It doesn't include security posture assessment, governance controls, or alerts for endpoint agents at this time.

## Prerequisites

Before you can discover local AI coding agents on endpoints, make sure the following requirements are met:

- Devices run on:
  - Windows 10 or Windows 11, Windows Server 2019 or newer, or Windows 11 virtual desktop environments
  - macOS devices<!-- TODO: Add specific macOS versions when Spencer provides them -->
- Your organization has a **Microsoft Defender for Endpoint Plan 2** license.
- Devices are [onboarded to Microsoft Defender for Endpoint](/defender-endpoint/onboard-configure).
- **Defender Antivirus** is the primary antivirus solution on the device.
- Your environment is in the **commercial cloud**. Sovereign and national clouds aren't supported.

No additional deployment, configuration, or scripts are required beyond device onboarding. Agent discovery begins automatically after your tenant is enabled.

## View local AI coding agents in the inventory

- To view a list of all local AI coding agents discovered on endpoints:

    1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
    1. In the left navigation pane, select **Assets** > **AI Agents**.
    1. Select **Local agents (Preview)** to see a filtered list of AI coding agents discovered on endpoint devices.
    <!-- TODO: Spencer comment #8 - Confirm with Moran/Michal if "Local agents" is the final page name -->

- To view a specific agent's details:

    1. From the **Local agents** list, select an agent to open the **Agent entity page**.
    1. Review the agent details, including:

        - Associated device
        - Operating system and machine context
        - Discovery timestamp

    For more information on using the AI agent inventory, see [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory).

## Query local AI coding agents using advanced hunting

### Hunt for local AI agents using Advanced Hunting

The tables you use to query local AI coding agents depend on your licensing:

- **Microsoft Defender for Endpoint Plan 2 customers**: Use the `ExposureGraphEdges` and `ExposureGraphNodes` tables in [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to query for local AI coding agents discovered on endpoint devices.
- **Agent 365 customers**: Use the `AgentInfo` table in [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to query for local AI coding agents alongside other Agent 365-managed agents.

### Get an inventory of AI agents across endpoints

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

### Map AI agents to users

This query maps AI coding agents to the users with credentials on the devices they run on:

```kusto
let accessEdges = dynamic(["contains", "has credentials of", "has permissions to",
                           "has role on", "can authenticate as", "can authenticate to"]);
ExposureGraphEdges
| where SourceNodeLabel == "endpointAiAgent"
| project AIAgent = SourceNodeName, DeviceId = TargetNodeId, Device = TargetNodeName
| join kind=inner (
    ExposureGraphEdges
    | where EdgeLabel in (accessEdges)
    | where TargetNodeLabel in ("device", "ec2.instance", "microsoft.compute/virtualmachines")
    | project UserId = SourceNodeId, User = SourceNodeName,
              UserType = SourceNodeLabel, DeviceId = TargetNodeId
) on DeviceId
| summarize AIAgents = make_set(AIAgent) by Device, User, UserType
| sort by Device asc
```

## Assess AI agent security posture

Use the following queries to assess the security posture of AI coding agents across your environment by examining the scope of user access and exposure to critical assets.

### Find AI agents on devices of users with broad access

This query identifies which users on AI agent devices have permissions to the most resources, helping you prioritize risk based on scope of access:

```kusto
let accessEdges = dynamic(["contains", "has credentials of", "has permissions to",
                           "has role on", "can authenticate as", "can authenticate to",
                           "member of", "can impersonate as"]);
let biEdges =
    ExposureGraphEdges
    | where EdgeLabel in (accessEdges)
    | project src = SourceNodeId, tgt = TargetNodeId,
              srcName = SourceNodeName, tgtName = TargetNodeName, edge = EdgeLabel
    | union (
        ExposureGraphEdges
        | where EdgeLabel in (accessEdges)
        | project src = TargetNodeId, tgt = SourceNodeId,
                  srcName = TargetNodeName, tgtName = SourceNodeName, edge = EdgeLabel
    );
let userAccess =
    ExposureGraphEdges
    | where SourceNodeLabel == "user"
    | where EdgeLabel in ("has permissions to", "has role on")
    | summarize 
        ResourceCount = dcount(TargetNodeId),
        ResourceTypes = make_set(TargetNodeLabel)
        by UserId = SourceNodeId, User = SourceNodeName;
ExposureGraphEdges
| where SourceNodeLabel == "endpointAiAgent"
| project AIAgent = SourceNodeName, n1 = TargetNodeId, Device = TargetNodeName
| join kind=inner (
    biEdges | project n1 = src, UserId = tgt, User = tgtName
) on n1
| join kind=inner userAccess on UserId
| summarize AIAgents = make_set(AIAgent) by Device, User, ResourceCount,
    tostring(ResourceTypes)
| sort by ResourceCount desc
```

### Find AI agents with paths to critical or sensitive assets

This query traces access paths from AI coding agents through the exposure graph to resources marked as critical or containing sensitive data:

```kusto
let accessEdges = dynamic(["contains", "has credentials of", "has permissions to",
                           "has role on", "can authenticate as", "can authenticate to",
                           "member of", "can impersonate as"]);
let biEdges =
    ExposureGraphEdges
    | where EdgeLabel in (accessEdges)
    | project src = SourceNodeId, tgt = TargetNodeId,
              srcName = SourceNodeName, tgtName = TargetNodeName, edge = EdgeLabel
    | union (
        ExposureGraphEdges
        | where EdgeLabel in (accessEdges)
        | project src = TargetNodeId, tgt = SourceNodeId,
                  srcName = TargetNodeName, tgtName = SourceNodeName, edge = EdgeLabel
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