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

## AI coding agent runtime protection

Beyond discovery, Defender for Endpoint provides runtime protection for AI coding agents with Microsoft Defender Antivirus. When enabled, Defender Antivirus intercepts events in the agent's execution loop, such as user prompts, pre-tool calls, and post-tool responses, and scans them for cross-prompt injection attacks (XPIA) and sensitive data leakage.

Defender Antivirus uses two protection approaches:

- **Agent hooks protection**: Subscribes to lifecycle events exposed by agent frameworks that support hooks. Supported agents include Claude Code, GitHub Copilot CLI, and OpenAI Codex.
- **Network inspection protection**: Intercepts network traffic between agents and large language model (LLM) endpoints at the network layer. This approach covers agents that don't support hooks, such as OpenClaw.

These are two parallel protection methods that work independently. Agent hooks protection is the more typical approach for supporting popular AI coding agents, while network inspection protection expands coverage to additional agents. For guidance on which method to use for your agents, see [How to decide which method to use](/defender-endpoint/configure-ai-agent-runtime-protection#how-to-decide-which-method-to-use).

### How agent hooks protection works

Agent hooks protection works at the application layer by subscribing to lifecycle events that the agent framework exposes. When an agent supports hooks, Defender Antivirus receives payloads at key stages in the agent loop:

- **User prompt**: The prompt submitted to the agent.
- **Pre-tool call**: The tool invocation request before execution.
- **Post-tool response**: The tool response after execution completes.

Defender Antivirus scans these payloads for cross-prompt injection attempts and sensitive data leakage before risky actions are allowed to continue.

### How network inspection protection works

Network inspection protection works at the network layer by inspecting traffic between the AI coding agent and LLM endpoints. This approach doesn't require the agent to support hooks, so it extends protection to additional agents that communicate over the network.

When enabled, Defender Antivirus routes relevant outbound traffic through local inspection so prompt and response content can be evaluated for the same runtime threats.

> [!NOTE]
> Network inspection protection doesn't support agents that use certificate pinning or HTTP/3.

## Protection approaches comparison

Agent hooks protection applies to agents that support hooks (such as Claude Code, GitHub Copilot CLI, and OpenAI Codex), while network inspection protection covers other agents, like OpenClaw. When both methods are enabled, Defender Antivirus uses single-path enforcement to avoid duplicate scanning, with hooks handling supported agents and network inspection protecting the remaining agents.

The following table compares the agent hooks and network inspection protection approaches. 

| Aspect | Agent hooks protection | Network inspection protection |
|--------|------------------------|-------------------------------|
| **Coverage** | Agents with hooks support framework | Any agent with network connectivity |
| **Supported agents** | Claude Code, GitHub Copilot CLI, OpenAI Codex | All agents (except those with cert pinning or HTTP/3) |
| **Detection method** | Application-layer message scanning | Network-layer traffic interception |
| **Scope** | Prompts, tool calls, tool responses | LLM API traffic between agent and model |
| **Overhead** | Lower (application-layer only) | Higher (TLS inspection required) |
| **Compatibility issues** | None | Doesn't support certificate pinning or HTTP/3 |
| **Data Protection Policy integration** | Supported (Microsoft Purview DLP) | Limited |
| **Recommended for** | Organizations with Claude Code, GitHub Copilot CLI, or OpenAI Codex | Agents without hooks support or broad coverage needed |

See the [enforcement, response and investigation considerations](configure-ai-agent-runtime-protection.md#enforcement-response-and-investigation-considerations) to learn how Defender Antivirus enforces these protections and what happens when a threat is detected.

## Protection modes

Agent runtime protection can be configured in three modes. The mode you choose determines how Defender Antivirus responds when it detects a threat in agent activity.

| Mode | Behavior |
|---|---|
| **Enabled** (Block) | Scans agent activity and blocks detected threats. Users see a notification in the agent UI and a toast message. |
| **AuditMode** | Scans agent activity and generates alerts in Microsoft Defender XDR, but doesn't block the agent. |
| **Disabled** | Turns off the protection. |

## Enforcement methods and outcome

Defender Antivirus enforces runtime protection settings based on the configured protection mode. Choose your enforcement mode based on your organization's security posture and tolerance for blocking agent actions.

| Setting | Method | Enforcement mode | Outcome |
|---------|--------|------------------|---------|
| **Agent hooks protection** | Application-layer scanning | Enabled (Block) | Defender Antivirus blocks the agent action. The user sees a notification in the agent UI and a Windows toast message. An alert is sent to Microsoft Defender XDR. |
| **Agent hooks protection** | Application-layer scanning | AuditMode | Defender Antivirus allows the action to proceed. An alert is sent to Microsoft Defender XDR for security team review. |
| **Network inspection protection** | Network-layer interception | Enabled (Block) | Defender Antivirus blocks the agent action. An alert is sent to Microsoft Defender XDR. |
| **Network inspection protection** | Network-layer interception | AuditMode | Defender Antivirus allows the action to proceed. An alert is sent to Microsoft Defender XDR for security team review. |

### Enforcement, response and investigation considerations

When a threat is detected by either protection method, the alert appears in the Microsoft Defender portal as part of the device timeline and is correlated into incidents. Your security team can investigate these alerts using familiar workflows in Microsoft Defender XDR, such as reviewing the device timeline, examining related alerts and entities, and taking response actions.

As a security administrator, here's what you need to know about how these protections work:

- **Single-path enforcement prevents duplicate scanning**: When you enable both agent hooks protection and network inspection protection, Defender Antivirus uses intelligent single-path enforcement. Hooks handle the supported agents, and network inspection protects other agents. This approach avoids redundant scanning and keeps performance overhead minimal.
- **Multiple protection layers work together**: Runtime protection works alongside your existing security controls. Both settings are protected by [tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection), which prevents unauthorized changes. If you've configured Microsoft Purview data loss prevention (DLP) policies, they act as an additional layer by evaluating payloads for sensitive data independently.
- **You control the enforcement mode**: Start with **AuditMode** to monitor threats and understand what your agents are doing without blocking them. This lets you see what would be blocked before enabling Block mode. After your security team reviews the alerts, you can switch to **Block** mode for production enforcement.
- **Detections focus on realistic threats**: Runtime protection detects meaningful threats to AI coding agents:
  - **Cross-prompt injection attacks (XPIA)**: Attempts to manipulate agents through injected instructions.
  - **Sensitive data leakage**: Agent actions that attempt to access or expose sensitive information.
- **Investigation is built into your workflow**: When threats are detected, alerts appear in the Microsoft Defender portal as part of the device timeline and are correlated into incidents. Your security team uses the same investigation workflows they're familiar with for other endpoint detections. For more information, see [View and investigate alerts in Microsoft Defender for Endpoint](/defender-endpoint/investigate-alerts).

For step-by-step configuration instructions, see [Set up AI agent runtime protection with Microsoft Defender Antivirus](/defender-endpoint/configure-ai-agent-runtime-protection).

## Broader AI security capabilities

Microsoft Defender for Endpoint's discovery capabilities are part of a comprehensive AI security approach. Microsoft Defender provides other capabilities across your organization's AI ecosystem:

- **Discover cloud and platform agents**: Find agents built with Microsoft Copilot Studio, Microsoft Foundry, Amazon Web Services (AWS) Bedrock, and Google Cloud Platform (GCP) Vertex AI.
- **Assess security posture**: Evaluate agent configurations, identify risks, and get prioritized recommendations.
- **Detect and investigate threats**: Correlate alerts and investigate suspicious agent behavior across your security infrastructure.

For details on these capabilities and how to apply them, see [Protect AI assets from emerging threats and vulnerabilities using Microsoft Defender](/defender-xdr/security-for-ai/defender-security-for-ai).

