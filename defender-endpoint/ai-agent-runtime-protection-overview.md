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

Local AI agents — coding assistants, CLI tools, desktop AI apps, and autonomous agent platforms — run with the user's privileges on the endpoints they operate on, where they can read files, invoke tools, and run commands. To complete a task, an agent acts on whatever text enters its loop, whether that's the user's prompt, a file it reads, a web page it fetches, or the output a tool returns, and it can't reliably tell trustworthy data from an instruction hidden inside that content. A single injected instruction, wherever it comes from, can turn the agent's own access against the user: exfiltrating data, modifying code, or running harmful commands. Microsoft Defender provides runtime protection that inspects the agent at each point in its loop — the prompt it receives, the tool calls it's about to make, and the responses those tools return — to detect prompt injection and dangerous actions, and block or audit them.

When configured to block, Defender stops the agent's action on the device and notifies the user — both in the agent UI and through a Windows toast notification — explaining why it blocked the action. In both block and audit modes, Defender triggers a security alert with the full context, and the alert is then correlated into incidents for the SOC to investigate.

This article explains what runtime protection stops, how it works, and how to investigate detections.

> [!TIP]
> Runtime protection complements Microsoft Defender's **discovery capabilities**, which automatically detect supported local AI agents and MCP server configurations across your devices. For more information, see [Local AI agent discovery with Microsoft Defender for Endpoint](protect-ai-agents-overview.md).

## What runtime protection detects

Runtime protection targets the defining threat to local AI agents: prompt injection — malicious instructions hidden inside otherwise-legitimate content that an agent reads and then acts on. Defender inspects the three points where content enters or leaves the agent's reasoning — the user's prompt, the tool calls the agent is about to make, and the responses those tools return — so it catches injection regardless of where the content originated, whether a file, a web page, a repository, or a tool's output.

For example, a coding agent fetches a project's documentation to answer a question, and the page contains hidden text that instructs the agent to read the local `.env` file and post its contents to an external URL. The agent treats the instruction as part of the page and is about to comply, but Defender detects the prompt injection in the tool response and blocks the action before any data leaves the device.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png" alt-text="Screenshot showing the blocking notification displayed to the user when Defender detects and blocks a prompt injection attack on a local AI agent." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png":::

## How it works

Runtime protection uses agent hooks — defined points in an agent's execution where an external tool can inspect and act on the agen'ts actions. Agents such as Claude Code and GitHub Copilot CLI expose these hook points, and Defender uses them to inspect agent activity.

When an agent supports hooks, Defender receives payloads at key stages in the agentic loop:

- **User prompt**: The prompt submitted to the agent.
- **Pre-tool call**: The tool invocation request before execution.
- **Post-tool response**: The tool response after execution completes.

Defender scans these payloads for prompt injection before a risky action is allowed to continue. Each scan is a fast, inline check at one of these points rather than continuous monitoring of the agent process, so the added latency is minimal.

For more information on agent hooks, see [Claude Code hooks](https://code.claude.com/docs/en/hooks) and [GitHub Copilot hooks](https://docs.github.com/copilot/how-tos/copilot-cli/customize-copilot/use-hooks).

## What happens when you enable runtime protection

Once enabled on a device, Defender inspects supported agents at their hook points as users work — without changing how they run the agent. What happens following a detection depends on the configured mode:

- **Block:** Defender blocks the action and notifies the user both in the agent UI and through a Windows toast notification. The detection is recorded in Defender protection history on the device, and a security alert is sent to Microsoft Defender, correlated into incidents for the SOC to investigate.
- **Audit:** Defender allows the action to continue and records the detection. A security alert is still raised in Microsoft Defender for investigation.
- **Disabled:** Runtime protection is off. Defender does not inspect agent activity, and agents run without prompt injection detection or blocking.

Microsoft recommends starting in Audit mode to observe detections and validate accuracy before switching to Block for active enforcement. The runtime protection setting is protected by tamper protection, which prevents unauthorized changes, and works alongside your existing Defender controls.

For configuration steps, see [Enable runtime protection](configure-ai-agent-runtime-protection.md#enable-runtime-protection).

## Investigation

When runtime protection detects prompt injection, Microsoft Defender raises an alert named **Suspicious AI prompt injection** and correlates related alerts into incidents. The alert also appears on the device timeline. In **Block** mode, the alert carries a severity — Critical, High, Medium, or Low — reflecting the assessed risk of the detection. In **Audit** mode, the alert is **Informational**, so your team can review what would have been blocked without triaging it as an active threat.

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