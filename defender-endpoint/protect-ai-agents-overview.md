---
title: Local AI agent discovery with Microsoft Defender (preview)
description: Learn how Microsoft Defender discovers local AI agents and MCP servers configured on your devices through inventory and investigation capabilities.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/27/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2
#customer intent: As a security administrator, I want to understand how Microsoft Defender provides visibility into local AI agents on my organization's devices.
---

# Local AI agent discovery with Microsoft Defender (preview)

Microsoft Defender helps you discover and investigate local AI agents and MCP servers configured on your organization's devices. Microsoft Defender automatically detects and surfaces a closed list of known supported agents in the Microsoft Defender and Agent 365 portals, which gives you visibility into AI-related assets and lets you assess their presence across your environment.

> [!TIP]
> Microsoft Defender also provides **runtime protection** for local AI agents. When enabled, it monitors activity in the agentic loop and blocks inline when malicious instructions are identified. For details, see [Runtime protection for local AI agents with Microsoft Defender](ai-agent-runtime-protection-overview.md).

## Local AI agent discovery on endpoints (preview)

Microsoft Defender automatically detects a closed list of known supported local AI agents and MCP server configurations on onboarded devices. When Microsoft Defender Antivirus identifies a supported local AI agent, the agent is displayed as a discoverable asset in the Microsoft Defender portal with visibility into:

- **Local AI agent inventory**: A centralized view of discovered local AI agents with device associations and discovery metadata.
- **Exposure map**: Visual relationships between local AI agents, devices, identities, and cloud resources to help assess potential impact.
- **Advanced hunting**: Query agent discovery data by using Kusto Query Language (KQL) to investigate local AI agents and what they can reach with the permissions of the user running them across your environment.

### Supported local AI agents and MCP servers

Defender defines an agent as a unique combination of user, device, and agent type. For example, if Claude Code runs in 15 different project folders on the same device for the same user, it appears as a single agent entry in the inventory.

Microsoft Defender discovers supported local AI agent families across agentic IDEs, CLI agents, VS Code extensions, and desktop assistants. It also discovers MCP server configurations associated with supported agents, including local and remote MCP server configurations. The following list is not exhaustive:

- **Agentic IDEs**: Cursor
- **CLI agents**: Claude Code CLI, GitHub Copilot CLI, Codex CLI, Gemini CLI
- **VS Code extensions**: Claude Code, Cline, Gemini, GitHub Copilot, Roo Code
- **Desktop assistants**: ChatGPT Desktop, Ollama Desktop, Poe Desktop, OpenClaw
- **MCP servers**: Local and remote MCP server configurations<!-- TODO: Confirm supported types with Spencer -->

<!-- TODO: Spencer noted that support between Windows and Mac may differ. Also MCP servers are discovered on Mac and Windows - confirm how to represent MCPs in this section. See: Spencer comment #17 -->

This list expands over time as new agents are supported.

For specific steps on discovering and viewing local AI agents, see [Discover local AI agents](discover-local-ai-agents.md).

For information on runtime protection for local AI agents, see [Runtime protection for local AI agents with Microsoft Defender](ai-agent-runtime-protection-overview.md).

## Broader AI security capabilities

Microsoft Defender's discovery capabilities are part of a comprehensive AI security approach. Microsoft Defender provides other capabilities across your organization's AI ecosystem:

- **Discover cloud and platform agents**: Find agents built with Microsoft Copilot Studio, Microsoft Foundry, Amazon Web Services (AWS) Bedrock, and Google Cloud Platform (GCP) Vertex AI.
- **Assess security posture**: Evaluate agent configurations, identify risks, get prioritized recommendations, and surface attack paths to Microsoft Foundry and Microsoft Copilot Studio (MCS).
- **Runtime protection**: Monitor activity in the agentic loop and block prompt injection attacks inline. For more information, see [Runtime protection for local AI agents with Microsoft Defender](ai-agent-runtime-protection-overview.md).
- **Detect and investigate threats**: Correlate alerts and investigate suspicious agent behavior across your security infrastructure.

For details on these capabilities and how to apply them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).
