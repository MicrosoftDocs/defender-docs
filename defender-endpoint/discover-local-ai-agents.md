---
title: Discover local AI agents
description: Learn how to discover, view, and investigate AI coding agents running locally on Windows 11 devices using Microsoft Defender for Endpoint.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to discover and monitor AI coding agents running on my organization's Windows 11 devices so that I can manage AI-related security risks on endpoints.

---

# Discover local AI agents

Microsoft Defender for Endpoint automatically discovers supported AI coding agents running locally on onboarded Windows 11 devices. Discovered agents appear as assets in the Defender portal's AI agent inventory, where you can view agent details, explore device and identity relationships using the exposure map, and investigate agent presence using advanced hunting.

Local AI coding agent discovery on endpoints is one component of Microsoft Defender's comprehensive AI security approach. For details on broader capabilities such as discovery of cloud and platform agents, security posture assessment, threat detection, and runtime protection across your organization, see [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory).

> [!NOTE]
> Local AI coding agent discovery provides **discovery and investigation capabilities only**. It doesn't include security posture assessment, governance controls, or alerts for endpoint agents at this time.

## Prerequisites

Before you can discover local AI coding agents on endpoints, make sure the following requirements are met:

- Devices run **Windows 11**. macOS support is planned for a future release.
- Devices are [onboarded to Microsoft Defender for Endpoint](/defender-endpoint/onboard-configure).
- **Microsoft Defender Antivirus** is the primary antivirus solution on the device.
- Your environment is in the **commercial cloud**. Sovereign and national clouds aren't supported.

No additional deployment, configuration, or scripts are required beyond device onboarding. Agent discovery begins automatically after your tenant is enabled.

## Supported AI coding agents

The following local AI coding agents are discovered on endpoints:

| Agent | Supported type |
|---|---|
| ChatGPT Desktop | Desktop |
| Claude Code | CLI, Desktop, and VS Code extension |
| Cline | VS Code extension |
| Codex | CLI |
| Cursor | Desktop |
| Gemini | VS Code extension |
| Gemini CLI | CLI |
| GitHub Copilot | CLI and VS Code extension |
| Ollama Desktop | Desktop |
| Poe Desktop | Desktop |
| Roo Code | VS Code extension |

## View local AI coding agents in the inventory

- To view a list of all local AI coding agents discovered on endpoints:

    1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).
    1. In the left navigation pane, select **Assets** > **AI Agents**.
    1. Select **Local AI Agents (Preview)** to see a filtered list of AI coding agents discovered on endpoint devices.

- To view a specific agent's details:

    1. From the **Local AI Agents** list, select an agent to open the **Agent entity page**.
    1. Review the agent details, including:

        - Associated device
        - Operating system and machine context
        - Discovery timestamp

    For more information on using the AI agent inventory, see [Discover AI agents and assess security posture using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-inventory).

## Query local AI coding agents using advanced hunting

### Hunt for local AI agents using Advanced Hunting

Use the `ExposureGraphEdges` and `ExposureGraphNodes` tables in [Advanced Hunting](/defender-xdr/advanced-hunting-overview) to query for local AI coding agents discovered on endpoint devices.

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