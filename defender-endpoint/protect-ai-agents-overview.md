---
title: AI coding agent discovery with Microsoft Defender for Endpoint
description: Learn how Microsoft Defender for Endpoint discovers AI agents and MCP servers on your devices through automatic inventory and investigation capabilities.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.custom: msecd-doc-authoring-106
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to understand how Defender for Endpoint provides visibility into AI coding agents on my organization's devices.

---

# AI coding agent discovery with Microsoft Defender for Endpoint

> [!TIP]
> Beyond discovery, Defender for Endpoint also provides **runtime protection** for AI coding agents — including agent hooks support for Claude Code, GitHub Copilot CLI, and OpenAI Codex, and network inspection for OpenClaw. For details, see [AI coding agent runtime protection](ai-agent-runtime-protection-overview.md).

Microsoft Defender for Endpoint helps you discover and investigate AI coding agents and MCP servers running on your organization's devices. Microsoft Defender for Endpoint automatically detects and surfaces supported agents in the Microsoft Defender and Agent 365 portals, which gives you visibility into AI-related assets and lets you assess their presence across your environment.

## AI coding agent discovery on endpoints

Defender for Endpoint automatically detects supported AI coding agents and MCP servers running locally on onboarded devices. When Microsoft Defender Antivirus identifies a supported AI coding agent, the agent is displayed as a discoverable asset in the Defender portal with full visibility into:

- **AI coding agent inventory**: A centralized view of all discovered local AI coding agents with device associations and discovery metadata.
- **Exposure map**: Visual relationships between AI coding agents, devices, identities, and cloud resources to help assess potential impact.
- **Advanced hunting**: Query agent discovery data using Kusto Query Language (KQL) to investigate agent presence across your environment.

### Supported AI coding agents and MCP servers

The following local AI coding agents and MCP servers are discovered on endpoints:

| Asset | Supported type |
| --- | --- |
| ChatGPT Desktop | AI agent - Desktop |
| Claude Code | AI agent - CLI, Desktop, and VS Code extension |
| Cline | AI agent - VS Code extension |
| Codex | AI agent - CLI |
| Cursor | AI agent - Desktop |
| Gemini | AI agent - VS Code extension |
| Gemini CLI | AI agent - CLI |
| GitHub Copilot | AI agent - CLI and VS Code extension |
| Ollama Desktop | AI agent - Desktop |
| Poe Desktop | AI agent - Desktop |
| Roo Code | AI agent - VS Code extension |
| MCP servers | MCP server<!-- TODO: Confirm supported types with Spencer --> |

<!-- TODO: Spencer noted that support between Windows and Mac may differ. Also MCP servers are discovered on Mac and Windows - confirm how to represent MCPs in this table. See: Spencer comment #17 -->

For specific steps on discovering and viewing local AI agents, see [Discover local AI agents](discover-local-ai-agents.md).

For information on runtime protection for AI coding agents, see [AI coding agent runtime protection overview](ai-agent-runtime-protection-overview.md).

## Broader AI security capabilities

Microsoft Defender for Endpoint's discovery capabilities are part of a comprehensive AI security approach. Microsoft Defender provides other capabilities across your organization's AI ecosystem:

- **Discover cloud and platform agents**: Find agents built with Microsoft Copilot Studio, Microsoft Foundry, Amazon Web Services (AWS) Bedrock, and Google Cloud Platform (GCP) Vertex AI.
- **Assess security posture**: Evaluate agent configurations, identify risks, and get prioritized recommendations.
- **Detect and investigate threats**: Correlate alerts and investigate suspicious agent behavior across your security infrastructure.
- **Runtime protection**: Detect and block prompt injection attacks and sensitive data leakage in real time. For more information, see [AI coding agent runtime protection overview](ai-agent-runtime-protection-overview.md).

For details on these capabilities and how to apply them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).