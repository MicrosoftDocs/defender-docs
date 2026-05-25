---
title: AI coding agent runtime protection with Microsoft Defender for Endpoint
description: Learn how Microsoft Defender for Endpoint provides runtime protection for AI coding agents, detecting and blocking prompt injection attacks and sensitive data leakage.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.custom: msecd-doc-authoring-106
ms.date: 05/14/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1

#customer intent: As a security administrator, I want to understand how Defender for Endpoint runtime protection works for AI coding agents so that I can protect my organization from prompt injection attacks and data leakage.

---

# AI coding agent runtime protection with Microsoft Defender for Endpoint

Microsoft Defender for Endpoint provides runtime protection for AI coding agents with Microsoft Defender Antivirus. When enabled, Defender Antivirus intercepts events in the agent's execution loop, such as user prompts, pre-tool calls, and post-tool responses, and scans them for cross-prompt injection attacks (XPIA) and sensitive data leakage.

Defender Antivirus uses two protection approaches:

- **Agent hooks protection**: Subscribes to lifecycle events exposed by agent frameworks that support hooks. Supported agents include Claude Code, GitHub Copilot CLI, and OpenAI Codex.
- **Network inspection protection**: Intercepts network traffic between agents and large language model (LLM) endpoints at the network layer. This approach covers agents that don't support hooks, such as OpenClaw.

These are two parallel protection methods that work independently. Agent hooks protection is the more typical approach for supporting popular AI coding agents, while network inspection protection expands coverage to additional agents. For guidance on which method to use for your agents, see [Decide which method to use](configure-ai-agent-runtime-protection.md#decide-which-method-to-use).

For information on agent discovery capabilities, see [Discover AI coding agents with Microsoft Defender for Endpoint](protect-ai-agents-overview.md).

## How agent hooks protection works

Agent hooks protection works at the application layer by subscribing to lifecycle events that the agent framework exposes. When an agent supports hooks, Defender Antivirus receives payloads at key stages in the agent loop:

- **User prompt**: The prompt submitted to the agent.
- **Pre-tool call**: The tool invocation request before execution.
- **Post-tool response**: The tool response after execution completes.

Defender Antivirus scans these payloads for cross-prompt injection attempts and sensitive data leakage before risky actions are allowed to continue.

## How network inspection protection works

Network inspection protection works at the network layer by inspecting traffic between the AI coding agent and LLM endpoints. This approach doesn't require the agent to support hooks, so it extends protection to additional agents that communicate over the network.

When enabled, Defender Antivirus routes relevant outbound traffic through local inspection so prompt and response content can be evaluated for the same runtime threats.

> [!NOTE]
> Network inspection protection doesn't support agents that use certificate pinning or HTTP/3.

## Protection modes and enforcement outcomes

Agent runtime protection can be configured in three modes. The mode you choose determines how Defender Antivirus enforces protection and what users and security teams see when a threat is detected.

| Protection mode | Protection method | Enforcement and outcome |
|---|---|---|
| **Enabled** (Block) | Agent hooks protection | Defender Antivirus scans agent events and blocks detected threats. Users see a notification in the agent UI and a Windows toast message. An alert is sent to Microsoft Defender. |
| **Enabled** (Block) | Network inspection protection | Defender Antivirus inspects agent network traffic and blocks detected threats. An alert is sent to Microsoft Defender. |
| **AuditMode** | Agent hooks protection | Defender Antivirus scans agent events and allows the action to proceed. An alert is sent to Microsoft Defender for security team review. |
| **AuditMode** | Network inspection protection | Defender Antivirus inspects agent network traffic and allows the action to proceed. An alert is sent to Microsoft Defender for security team review. |
| **Disabled** | Agent hooks protection or network inspection protection | Defender Antivirus doesn't scan runtime activity for the disabled method. No runtime protection blocking or alerting occurs for that method. |

### Enforcement, response and investigation considerations

When either protection method detects a threat, Microsoft Defender surfaces an alert on the device timeline and correlates related alerts into incidents. Security teams can investigate these detections using Microsoft Defender XDR workflows, including timeline review, alert and entity correlation, and response actions.

The following considerations describe how enforcement, response, and investigation work for AI agent runtime protection:

- **Single-path enforcement prevents duplicate scanning**: When you enable both agent hooks protection and network inspection protection, Defender Antivirus uses intelligent single-path enforcement. Hooks handle the supported agents, and network inspection protects other agents. This approach avoids redundant scanning and keeps performance overhead minimal.
- **Multiple protection layers work together**: Runtime protection works alongside your existing security controls. Both settings are protected by [tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection), which prevents unauthorized changes. If you've configured Microsoft Purview data loss prevention (DLP) policies, they act as an additional layer by evaluating payloads for sensitive data independently.
- **You control the enforcement mode**: Start with **AuditMode** to monitor threats and understand what your agents are doing without blocking them. This lets you see what would be blocked before enabling Block mode. After your security team reviews the alerts, you can switch to **Block** mode for production enforcement.
- **Detections focus on realistic threats**: Runtime protection detects meaningful threats to AI coding agents:
  - **Cross-prompt injection attacks (XPIA)**: Attempts to manipulate agents through injected instructions.
  - **Sensitive data leakage**: Agent actions that attempt to access or expose sensitive information.
- **Investigation is built into your workflow**: When threats are detected, alerts appear in the Microsoft Defender portal as part of the device timeline and are correlated into incidents. Your security team uses the same investigation workflows they're familiar with for other endpoint detections. For more information, see [View and investigate alerts in Microsoft Defender for Endpoint](/defender-endpoint/investigate-alerts).

For step-by-step configuration instructions, see [Set up AI agent runtime protection with Microsoft Defender Antivirus](configure-ai-agent-runtime-protection.md).

## Supported agents

The following table lists the AI coding agents that Defender for Endpoint supports for runtime protection, the protection method used for each agent, and links to the agent's hooks documentation (where applicable).

| Agent | Protection method | Hooks documentation |
|-------|-------------------|---------------------|
| [Claude Code](https://code.claude.com/) | Agent hooks | [Claude Code hooks](https://code.claude.com/docs/en/hooks) |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot) | Agent hooks | [GitHub Copilot coding agent](https://docs.github.com/en/copilot/customizing-copilot/extending-copilot-agent-mode-in-vs-code/using-copilot-coding-agent) |
| [OpenAI Codex](https://developers.openai.com/codex/) | Agent hooks | [Codex hooks](https://developers.openai.com/codex/hooks) |
| [OpenClaw](https://github.com/nickclaw/openclaw) | Network inspection | N/A |

<!-- TODO: Spencer noted support between Windows and Mac may differ. Also need to confirm how to handle MCP support in this table. See Spencer comment #17 -->
<!-- TODO: Spencer asked Eitan if runtime protection has OS version restrictions to call out. See Spencer comment #21 -->

> [!NOTE]
> Network inspection protection can also protect other agents that communicate over the network, even if they aren't listed here. However, network inspection doesn't support agents that use certificate pinning or HTTP/3.

For guidance on choosing a protection method, see [Decide which method to use](configure-ai-agent-runtime-protection.md#decide-which-method-to-use).

## Next steps

- [Set up AI agent runtime protection with Microsoft Defender Antivirus](configure-ai-agent-runtime-protection.md)
- [Discover AI coding agents with Microsoft Defender for Endpoint](protect-ai-agents-overview.md)
