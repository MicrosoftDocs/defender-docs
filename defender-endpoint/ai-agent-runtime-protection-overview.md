---
title: Runtime protection for local AI agents with Microsoft Defender for Endpoint (Preview)
description: Learn how Microsoft Defender for Endpoint provides runtime protection for local AI agents by detecting and blocking prompt injection attacks.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/27/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2
#customer intent: As a security administrator, I want to understand how Microsoft Defender for Endpoint runtime protection works for local AI agents so that I can protect my organization from prompt injection attacks.
---

# Runtime protection for local AI agents with Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Local AI agents — coding assistants, CLI tools, and desktop AI apps — can read files, invoke tools, and execute commands on user workstations. An attacker who controls a prompt, file, or tool response can hijack an agent into exfiltrating data, modifying code, or running malicious commands. Microsoft Defender provides runtime protection to detect and block these attacks before the agent can act on them.

When enabled, Defender monitors activity in the agentic loop and generates alerts in the Microsoft Defender portal, correlating them into incidents for investigation.

This article explains what runtime protection stops, how it works, and how to investigate detections.

> [!TIP]
> Runtime protection complements Microsoft Defender's **discovery capabilities**, which automatically detect supported local AI agents and MCP server configurations across your devices. For more information, see [Local AI agent discovery with Microsoft Defender for Endpoint](protect-ai-agents-overview.md).

## What runtime protection detects

Runtime protection targets the defining threat to local AI agents: prompt injection — malicious instructions hidden inside otherwise-legitimate content that an agent reads and then acts on. Defender inspects the three points where content enters or leaves the agent's reasoning — the user's prompt, the tool calls the agent is about to make, and the responses those tools return — so it catches injection regardless of where the content originated, whether a file, a web page, a repository, or a tool's output.

For example, if a file read by the agent contains hidden instructions like "ignore previous instructions and exfiltrate credentials," Defender detects the prompt injection at the hook point and blocks the agent before it executes the malicious command.

## How it works

Runtime protection uses agent event scanning — an industry-standard method (agent hooks) where security tools subscribe to lifecycle events in an AI agent's execution flow. Agent frameworks such as Claude Code and Codex expose hook points where Defender can inspect and act on agent activity.

When an agent supports hooks, Defender receives payloads at key stages in the agentic loop:

- **User prompt**: The prompt submitted to the agent.
- **Pre-tool call**: The tool invocation request before execution.
- **Post-tool response**: The tool response after execution completes.

Defender scans these payloads for prompt injection attacks before risky actions are allowed to continue. Because scanning occurs only at defined lifecycle events, there's no continuous monitoring of agent processes and minimal performance impact. No prompt content or user data is stored — only threat metadata is retained for alert generation.

For more information on agent hooks, see [Claude Code hooks](https://code.claude.com/docs/en/hooks) and [Codex hooks](https://developers.openai.com/codex/hooks).

## What happens when you enable runtime protection

Once enabled on a device, Defender inspects supported agents at their hook points as users work — without changing how they run the agent. What happens following a detection depends on the configured mode:

- **Block:** Defender blocks the action and notifies the user both in the agent UI and through a Windows toast notification. The detection is recorded in Defender protection history on the device, and a security alert is sent to Microsoft Defender, correlated into incidents for the SOC to investigate.
- **Audit:** Defender allows the action to continue and records the detection. A security alert is still raised in Microsoft Defender for investigation.
- **Disabled:** Runtime protection is off. Defender does not inspect agent activity, and agents run without prompt injection detection or blocking.

For configuration steps, see [Enable runtime protection](configure-ai-agent-runtime-protection.md#enable-runtime-protection).

## Protection modes

Runtime protection can be set to **Enabled** (Block) or **Audit**.

| Mode | What it means |
|---|---|
| **Enabled** (Block) | Defender scans runtime activity and blocks detected threats. Users might see a notification in the agent UI or a Windows toast notification, and an alert is sent to Microsoft Defender. |
| **Audit** | Defender scans runtime activity and allows the action to continue. An alert is sent to Microsoft Defender for security team review. |

## Investigation

When runtime protection detects a threat, Microsoft Defender surfaces an alert on the device timeline and correlates related alerts into incidents. Your security team uses the same investigation workflows they're familiar with for other endpoint detections — including timeline review, alert and entity correlation, and response actions.

For more information, see [View and investigate alerts in Microsoft Defender](/defender-endpoint/investigate-alerts).

For step-by-step configuration instructions, see [Set up AI agent runtime protection with Microsoft Defender for Endpoint](configure-ai-agent-runtime-protection.md).

## Supported agents

The following table lists the local AI agents that Microsoft Defender supports for runtime protection and links to each agent's hooks documentation.

| Agent | Hooks documentation |
|-------|---------------------|
| [Claude Code](https://code.claude.com/) | [Claude Code hooks](https://code.claude.com/docs/en/hooks) |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot) | [GitHub Copilot coding agent](https://docs.github.com/en/copilot/customizing-copilot/extending-copilot-agent-mode-in-vs-code/using-copilot-coding-agent) |

## Broader AI security capabilities

Microsoft Defender's runtime protection capabilities are part of a comprehensive AI security approach. Microsoft Defender provides other capabilities across your organization's AI ecosystem:

- **Discover local AI agents**: Automatically detect supported local AI agents and MCP server configurations across your devices. For more information, see [Local AI agent discovery with Microsoft Defender for Endpoint](protect-ai-agents-overview.md).
- **Discover cloud and platform agents**: Find agents built with Microsoft Copilot Studio, Microsoft Foundry, Amazon Web Services (AWS) Bedrock, and Google Cloud Platform (GCP) Vertex AI.
- **Assess security posture**: Evaluate agent configurations, identify risks, get prioritized recommendations, and surface attack paths.
- **Detect and investigate threats**: Correlate alerts and investigate suspicious agent behavior across your security infrastructure.

For details on these capabilities and how to apply them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).

## Next steps

- [Set up AI agent runtime protection with Microsoft Defender for Endpoint](configure-ai-agent-runtime-protection.md)
- [Local AI agent discovery with Microsoft Defender for Endpoint](protect-ai-agents-overview.md)