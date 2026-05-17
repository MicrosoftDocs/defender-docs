---
title: Discover and protect AI coding agents with Microsoft Defender for Endpoint
description: Learn how Microsoft Defender for Endpoint helps protect AI agents on your devices through discovery and investigation capabilities.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.custom: msecd-doc-authoring-106
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to understand how Defender for Endpoint provides visibility and protection for AI coding agents on my organization's devices.

---

# Discover and protect AI coding agents with Microsoft Defender for Endpoint

Microsoft Defender for Endpoint helps you discover and investigate AI coding agents running on your organization's devices. Microsoft Defender for Endpoint automatically detects and surfaces supported agents in the Microsoft Defender portal, which gives you visibility into AI-related assets and lets you assess their presence across your environment.

## AI agent discovery on endpoints

Defender for Endpoint automatically detects supported AI coding agents running locally on onboarded Windows 11 devices. When Microsoft Defender Antivirus identifies a supported AI coding agent, the agent is displayed as a discoverable asset in the Defender portal with full visibility into:

- **AI agent inventory**: A centralized view of all discovered local AI coding agents with device associations and discovery metadata.
- **Exposure map**: Visual relationships between AI agents, devices, identities, and cloud resources to help assess potential impact.
- **Advanced hunting**: Query agent discovery data using Kusto Query Language (KQL) to investigate agent presence across your environment.

For specific steps on discovering and viewing local AI agents, see [Discover local AI agents](/defender-endpoint/discover-local-ai-agents).

## AI agent runtime protection

Beyond discovery, Defender for Endpoint provides runtime protection for AI coding agents with Microsoft Defender Antivirus. When enabled, Defender Antivirus intercepts events in the agent's execution loop, such as user prompts, pre-tool calls, and post-tool responses, and scans them for cross-prompt injection attacks (XPIA) and sensitive data leakage.

Defender Antivirus uses two protection approaches:

- **Agent hooks protection**: Subscribes to lifecycle events exposed by agent frameworks that support hooks. Supported agents include Claude Code, GitHub Copilot CLI, and OpenAI Codex.
- **Network inspection protection**: Intercepts network traffic between agents and large language model (LLM) endpoints at the network layer. This approach covers agents that don't support hooks, such as OpenClaw.

You can configure each approach independently in one of three modes:

| Mode | Behavior |
|---|---|
| **Enabled** (Block) | Scans agent activity and blocks detected threats. Users see a notification in the agent UI and a toast message. |
| **AuditMode** | Scans agent activity and generates alerts in Microsoft Defender XDR, but doesn't block the agent. |
| **Disabled** | Turns off the protection. |

For step-by-step configuration instructions, see [Set up AI agent runtime protection with Microsoft Defender Antivirus](/defender-endpoint/configure-ai-agent-runtime-protection).

## Broader AI security capabilities

Microsoft Defender for Endpoint's discovery capabilities are part of a comprehensive AI security approach. Microsoft Defender XDR provides other capabilities across your organization's AI ecosystem:

- **Discover cloud and platform agents**: Find agents built with Microsoft Copilot Studio, Microsoft Foundry, Amazon Web Services (AWS) Bedrock, and Google Cloud Platform (GCP) Vertex AI.
- **Assess security posture**: Evaluate agent configurations, identify risks, and get prioritized recommendations.
- **Detect and investigate threats**: Correlate alerts and investigate suspicious agent behavior across your security infrastructure.

For details on these capabilities and how to apply them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).

