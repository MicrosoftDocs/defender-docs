---
title: AI agent runtime protection with Microsoft Defender for Endpoint (Preview)
description: Learn how Microsoft Defender for Endpoint provides runtime protection for local AI agents by detecting and blocking prompt injection attacks.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/27/2026
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to understand how Microsoft Defender for Endpoint runtime protection works for local AI agents so that I can protect my organization from prompt injection attacks.
---

# AI agent runtime protection with Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Local AI agents, including coding assistants, CLI tools, desktop AI apps, and autonomous agent platforms, run with user privileges on endpoints. These agents act on text from prompts, files, web content, and tool output, and can't reliably separate trusted content from hidden instructions. A single injected instruction can misuse agent access to exfiltrate data, modify code, or run harmful commands.

Microsoft Defender provides AI agent runtime protection by inspecting key points in the agent loop: user prompts, tool requests before execution, and tool responses after execution. This helps detect prompt injection and high-risk agent actions, audit them, and block supported actions before they run. Defender supports two inspection approaches: agent-native event inspection for agents that expose vendor-supported event interfaces, and network inspection for agents that communicate over supported network paths. To learn more about how runtime protection audits and blocks prompt injection, see [What runtime protection detects](#what-runtime-protection-detects) and [How it works](#how-it-works).

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png" alt-text="Screenshot showing the blocking notification displayed to the user when Defender detects and blocks a prompt injection attack on a local AI agent." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png":::

This article explains what runtime protection stops, how it works, and how to investigate detections.

> [!TIP]
> Runtime protection complements Microsoft Defender's **discovery capabilities**, which automatically detect supported local AI agents and MCP server configurations across your devices. For more information, see [Local AI agent discovery with Microsoft Defender for Endpoint](local-agent-discovery-overview.md).

## What runtime protection detects

Runtime protection targets the defining threat to local AI agents: prompt injection, which involves malicious instructions hidden inside otherwise-legitimate content that an agent reads and then acts on. Defender inspects the three points where content enters or leaves the agent's reasoning: the user's prompt, the tool calls the agent is about to make, and the responses those tools return. This approach catches injection regardless of where the content originated, whether a file, a web page, a repository, or a tool's output.

For example, a coding agent fetches a project's documentation to answer a question, and the page contains hidden text that instructs the agent to read the local _.env_ file and post its contents to an external URL. The agent treats the instruction as part of the page and is about to comply, but Defender detects the prompt injection in the tool response and blocks the action before any data leaves the device.

## How it works

Runtime protection uses two approaches to inspect agent activity:

### Agent-native event inspection

Agent-native event inspection uses vendor-supported event interfaces exposed by the agent. These interfaces provide structured checkpoints in the agent workflow, such as when a user submits a prompt, when the agent requests to use a tool, or after a tool returns a response. Agents such as Claude Code, Codex CLI, and GitHub Copilot CLI expose these event interfaces, and Defender uses them to inspect agent activity and apply audit or block decisions where supported

When an agent exposes a vendor-supported agent event interface, Defender receives payloads at key stages in the agentic loop:

- **User prompt**: The prompt submitted to the agent.
- **Pre-tool call**: The tool invocation request before execution.
- **Post-tool response**: The tool response after execution completes.

Defender scans these payloads for prompt injection and high-risk agent activity. Defender can audit or block activity at each supported event point. Depending on the event type, blocking can prevent the prompt from being processed, prevent a requested tool action from running, or prevent a tool response from continuing in the agent loop.

Each scan is a fast, inline check at one of these event points rather than continuous monitoring of the agent process, so the added latency is minimal.

For vendor documentation about these agent event interfaces, see [Claude Code documentation](https://code.claude.com/docs/en/hooks), [Codex CLI documentation](https://developers.openai.com/codex/hooks), and [GitHub Copilot documentation](https://docs.github.com/copilot/reference/hooks-reference).

### Network inspection

Network inspection extends runtime protection to agents that don't expose agent-native event interfaces. Instead of relying on structured agent events, Defender inspects supported agent-to-Large Language Model (LLM) network flows to detect prompt injection in transit.

Use network inspection when you want to protect agents that communicate with LLM services over the network but don't expose a vendor-supported event interface. This helps close the coverage gap for agents that would otherwise have no runtime protection before or during interaction with the model.

> [!NOTE]
> Network inspection doesn't support agents that use certificate pinning or HTTP/3.

## What happens when you enable runtime protection

Once enabled on a device, Defender inspects supported agents at their hook points as users work, without changing how they run the agent. What happens following a detection depends on the configured mode:

- **Block:** Defender blocks the threat and follows the notification rules configured for the device. Defender notifies the user both in the agent UI and through a Windows toast notification. The detection is recorded in Defender protection history on the device, and a security alert is sent to Defender, correlated into incidents for the SOC to investigate.
- **Audit:** Defender allows the action to continue and records the detection. A security alert is still raised in Defender for investigation.
- **Disabled:** Runtime protection is off. Defender doesn't inspect agent activity, and agents run without prompt injection detection or blocking.

Microsoft recommends starting in audit mode to observe detections and validate accuracy before switching to block mode for active enforcement. The runtime protection setting is protected by tamper protection, which prevents unauthorized changes, and works alongside your existing Defender controls.

For configuration steps, see [Enable runtime protection](configure-ai-agent-runtime-protection.md#enable-runtime-protection).

## Investigation

When runtime protection detects prompt injection, Defender raises a **Suspicious AI prompt injection** alert and correlates related activity into incidents for investigation.

:::image type="content" source="media/configure-ai-agent-runtime-protection/runtime-protection-suspicious-prompt-injection-alert.png" alt-text="Screenshot showing a Suspicious AI prompt injection alert in Microsoft Defender, including the process tree and related detection details." lightbox="media/configure-ai-agent-runtime-protection/runtime-protection-suspicious-prompt-injection-alert.png":::

For the full investigation workflow, including user and SOC experiences, see [Review and investigate detections](configure-ai-agent-runtime-protection.md#review-and-investigate-detections).

## Supported agents

The following table lists the local AI agents that Defender supports for runtime protection through agent-native event inspection.

| Agent | Hooks documentation |
|-------|---------------------|
| [Claude Code](https://code.claude.com/) | [Claude Code hooks](https://code.claude.com/docs/en/hooks) |
| [Codex CLI](https://developers.openai.com/codex/cli) | [Codex CLI hooks](https://developers.openai.com/codex/hooks) |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot) | [GitHub Copilot hooks](https://docs.github.com/copilot/how-tos/copilot-cli/customize-copilot/use-hooks) |
|[GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/getting-started) | [GitHub Copilot app hooks](https://docs.github.com/en/copilot/reference/hooks-reference) |

## Broader AI security capabilities

Defender's runtime protection capabilities are part of a comprehensive AI security approach. Defender provides other capabilities across your organization's AI ecosystem:

- **Discover local AI agents**: Automatically detect supported local AI agents and MCP server configurations across your devices. For more information, see [Local AI agent discovery with Microsoft Defender for Endpoint](local-agent-discovery-overview.md).
- **Discover cloud and platform agents**: Find agents built with Microsoft Copilot Studio, Microsoft Foundry, Amazon Web Services (AWS) Bedrock, and Google Cloud Platform (GCP) Vertex AI.
- **Assess security posture**: Evaluate agent configurations, identify risks, get prioritized recommendations, and surface attack paths.
- **Detect and investigate threats**: Correlate alerts and investigate suspicious agent behavior across your security infrastructure.

For details on these capabilities and how to apply them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).

## Next steps

- [Set up AI agent runtime protection with Microsoft Defender for Endpoint](configure-ai-agent-runtime-protection.md)
- [Local AI agent discovery with Microsoft Defender for Endpoint](local-agent-discovery-overview.md)