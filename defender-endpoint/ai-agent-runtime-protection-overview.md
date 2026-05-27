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

Microsoft Defender provides runtime protection for local AI agents. When enabled, Defender monitors activity in the agentic loop and blocks prompt injection attacks before the agent can act on them. Runtime protection generates alerts in the Microsoft Defender portal and correlates them into incidents for investigation.

This article explains how runtime protection works, describes the two protection methods (agent event scanning (agent hooks) and network inspection), and covers enforcement modes and investigation workflows.

> [!TIP]
> Runtime protection complements Microsoft Defender's **discovery capabilities**, which automatically detect supported local AI agents and MCP server configurations across your devices. For more information, see [Local AI agent discovery with Microsoft Defender for Endpoint](protect-ai-agents-overview.md).

## Runtime protection methods

Runtime protection for local AI agents uses two methods:

- **Event scanning** (also known as **agent hooks**): Uses lifecycle events exposed by supported agent frameworks to inspect prompts, tool calls, and tool responses at defined points in the agentic loop.
- **Network inspection**: Inspects relevant traffic between the agent and large language model (LLM) endpoints when event scanning isn't available.

These methods work independently. Event scanning is the primary option for agents that expose a supported hooks framework (such as Claude Code, GitHub Copilot CLI, and Codex CLI), while network inspection expands coverage to agents that communicate over the network but don't support hooks. For guidance on which method to use, see [Decide which method to use](configure-ai-agent-runtime-protection.md#decide-which-method-to-use).

## Performance and privacy

Runtime protection is designed for minimal performance impact. When event scanning is used, scanning occurs only at defined lifecycle events in the agentic loop, with no continuous monitoring of agent processes. Network inspection adds overhead only for agents that don't support hooks. No prompt content or user data is stored by Defender. Only threat metadata is retained for alert generation.

## How agent event scanning (agent hooks) protection works

Agent hooks are an industry-standard method that allows security tools to subscribe to lifecycle events in an AI agent's execution flow. Agent frameworks such as Anthropic's Claude Code and OpenAI's Codex expose hook points where external tools can inspect and act on agent activity. For more information, see [Claude Code hooks](https://code.claude.com/docs/en/hooks) and [Codex hooks](https://developers.openai.com/codex/hooks).

When an agent supports hooks, Microsoft Defender Antivirus receives payloads at key stages in the agentic loop:

- **User prompt**: The prompt submitted to the agent.
- **Pre-tool call**: The tool invocation request before execution.
- **Post-tool response**: The tool response after execution completes.

Defender Antivirus scans these payloads for prompt injection attacks before risky actions are allowed to continue.

## How network inspection protection works

Network inspection protection works at the network layer by inspecting traffic between the local AI agent and LLM endpoints. This approach doesn't require the agent to support hooks, so it extends protection to additional agents that communicate over the network.

When enabled, Microsoft Defender Antivirus routes relevant outbound traffic through local inspection so prompts and responses can be evaluated for prompt injection attacks.

> [!NOTE]
> Network inspection doesn't support agents that use certificate pinning or HTTP/3.

## Protection modes and enforcement outcomes

Both runtime protection methods can be set to **Enabled** (Block) or **Audit**.

| Mode | What it means |
|---|---|
| **Enabled** (Block) | Defender Antivirus scans runtime activity and blocks detected threats. Users might see a notification in the agent UI or a Windows toast notification, and an alert is sent to Microsoft Defender. |
| **Audit** | Defender Antivirus scans runtime activity and allows the action to continue. An alert is sent to Microsoft Defender for security team review. |

### Enforcement, response, and investigation considerations

When either protection method detects a threat, Microsoft Defender surfaces an alert on the device timeline and correlates related alerts into incidents. Security teams can investigate these detections by using Microsoft Defender XDR workflows, including timeline review, alert and entity correlation, and response actions.

The following considerations describe how enforcement, response, and investigation work for local AI agent runtime protection:

- **Multiple protection layers work together**: Runtime protection works alongside your existing security controls. Both settings are protected by [tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection), which prevents unauthorized changes. If [Microsoft Purview data loss prevention (DLP)](/purview/dlp-learn-about-dlp) policies are active on the same device, Purview independently evaluates payloads for sensitive data.
- **You control the enforcement mode**: Start with **Audit** to monitor threats and understand what your agents are doing without blocking them. This lets you see what would be blocked before enabling Block mode. After your security team reviews the alerts, you can switch to **Enabled** for production enforcement.
- **Detections focus on realistic threats**: Runtime protection detects meaningful threats to local AI agents:
  - **Prompt injection attacks**: Attempts to manipulate agents through injected instructions.
  - **Malicious inline instructions**: Attempts to redirect the agent's behavior through content in prompts, files, or tool output.
- **Investigation is built into your workflow**: When threats are detected, alerts appear in the Microsoft Defender portal as part of the device timeline and are correlated into incidents. Your security team uses the same investigation workflows they're familiar with for other endpoint detections. For more information, see [View and investigate alerts in Microsoft Defender](/defender-endpoint/investigate-alerts).

For step-by-step configuration instructions, see [Set up AI agent runtime protection with Microsoft Defender for Endpoint](configure-ai-agent-runtime-protection.md).

## Supported agents

The following table lists the local AI agents that Microsoft Defender supports for runtime protection, the protection method used for each agent, and links to the agent's hooks documentation (where applicable).

| Agent | Protection method | Hooks documentation |
|-------|-------------------|---------------------|
| [Claude Code](https://code.claude.com/) | Agent event scanning (hooks) | [Claude Code hooks](https://code.claude.com/docs/en/hooks) |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot) | Agent event scanning (hooks) | [GitHub Copilot coding agent](https://docs.github.com/en/copilot/customizing-copilot/extending-copilot-agent-mode-in-vs-code/using-copilot-coding-agent) |
| [Codex CLI](https://developers.openai.com/codex/) | Agent event scanning (hooks) | [Codex hooks](https://developers.openai.com/codex/hooks) |
| [OpenClaw](https://github.com/nickclaw/openclaw) | Network inspection | N/A |

<!-- TODO: Spencer noted support between Windows and Mac may differ. Also need to confirm how to handle MCP support in this table. See Spencer comment #17 -->
<!-- TODO: Spencer asked Eitan if runtime protection has OS version restrictions to call out. See Spencer comment #21 -->

> [!NOTE]
> Network inspection can protect additional agents that communicate over the network, but Microsoft Defender documents only supported agents. Network inspection doesn't support agents that use certificate pinning or HTTP/3.

For guidance on choosing a protection method, see [Decide which method to use](configure-ai-agent-runtime-protection.md#decide-which-method-to-use).

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