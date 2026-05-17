---
title: Set up AI agent runtime protection - Microsoft Defender
description: Learn how to configure Microsoft Defender Antivirus to protect AI coding agents from prompt injection attacks and data leakage on Windows endpoints.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: how-to
ms.custom: msecd-doc-authoring-106
ms.date: 05/17/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

#customer intent: As a security administrator, I want to configure runtime protection for AI coding agents on my organization's endpoints so that I can detect and block prompt injection attacks and sensitive data leakage in real time.

---

# Set up AI agent runtime protection with Microsoft Defender Antivirus

Microsoft Defender Antivirus (MDAV) provides runtime protection for AI coding agents running on Windows endpoints. When enabled, MDAV intercepts events in the agent's execution loop — such as user prompts, pre-tool calls, and post-tool responses — and scans them for cross-prompt injection attacks (XPIA) and sensitive data leakage. Depending on how you configure it, MDAV can audit or block threats and send alerts to Microsoft Defender XDR.

MDAV uses two approaches to protect AI coding agents:

- **Agent hooks protection** — Integrates with agent frameworks that support hooks to scan application-layer messages exchanged between the agent, tools, and models.
- **Network inspection protection** — Intercepts network-layer traffic between the agent and large language model (LLM) endpoints, scanning HTTP/HTTPS API calls for threats.

Both approaches detect the same threat categories and generate alerts in Microsoft Defender XDR. You can enable one or both depending on the agents your organization uses.

## Prerequisites

Before you configure runtime protection, make sure the following requirements are met:

- The device runs Windows and is onboarded to Microsoft Defender for Endpoint.
- Microsoft Defender Antivirus is in active mode (not passive mode). Runtime protection settings aren't enforced when MDAV runs in passive mode.
- One or more [supported AI coding agents](#supported-agents) are installed on the device.
- For network inspection protection, the device requires a Microsoft Defender for Endpoint Plan 2 license. <!-- TODO: Confirm final licensing — ME7/A365 requirement for network inspection vs. free for hooks. -->

## How agent hooks protection works

Agent hooks protection works at the application layer by subscribing to lifecycle events that the agent framework exposes. When an AI coding agent supports hooks, MDAV registers as a hook consumer and receives event payloads at key points in the agentic loop:

- **User prompt** — The prompt that a user submits to the agent.
- **Pre-tool call** — The agent's request to invoke a tool, before execution.
- **Post-tool response** — The tool's response, after execution completes.

MDAV sends these payloads to Microsoft Defender for scanning using signature matching and machine learning models. If Microsoft Purview integration is configured, payloads are also evaluated for data protection policy violations.

Agent hooks protection requires that the AI coding agent natively supports a hooks framework. The following agents support hooks:

- [Claude Code](https://code.claude.com/docs/en/hooks)
- [GitHub Copilot CLI](https://docs.github.com/en/copilot/customizing-copilot/extending-copilot-agent-mode-in-vs-code/using-copilot-coding-agent)
- [OpenAI Codex](https://developers.openai.com/codex/hooks)

## How network inspection protection works

Network inspection protection works at the network layer by intercepting traffic between the AI coding agent and LLM endpoints. This approach doesn't require the agent to support hooks — it inspects traffic from any agent that communicates over the network.

When enabled, MDAV uses a kernel-level network redirector to route outbound connections through a local inspection proxy. The proxy performs TLS inspection using Windows-native cryptographic APIs (SSPI/SChannel) and parses the underlying HTTP traffic. It then extracts prompt and response content and sends it through a scan pipeline that includes pattern-based scanning and machine learning inference.

Network inspection protection provides broader coverage than hooks because it can protect agents that don't have a hooks framework. However, it's a more intrusive approach that involves TLS inspection of agent traffic.

> [!NOTE]
> Network inspection doesn't support agents that use certificate pinning or HTTP/3.

## Configure agent hooks protection

Use the `Set-MpPreference` PowerShell cmdlet to enable agent hooks protection. This setting controls whether MDAV scans application-layer messages from AI coding agents that support hooks.

Run the following command in an elevated PowerShell session:

```powershell
Set-MpPreference -EnableAiAgentProtection <mode>
```

Replace `<mode>` with one of the following values:

| Value | Behavior |
|---|---|
| `Enabled` | Scans agent events and blocks detected threats. The user sees a notification in the agent UI and a toast message. |
| `AuditMode` | Scans agent events and generates alerts, but doesn't block the agent. |
| `Disabled` | Turns off agent hooks protection. |

To check the current setting:

```powershell
Get-MpPreference | Select-Object EnableAiAgentProtection
```

## Configure network inspection protection

Use the `Set-MpPreference` PowerShell cmdlet to enable network inspection protection. This setting controls whether MDAV inspects network-layer traffic between AI coding agents and LLM endpoints.

Run the following command in an elevated PowerShell session:

```powershell
Set-MpPreference -EnableAiAgentLoopInspection <mode>
```

Replace `<mode>` with one of the following values:

| Value | Behavior |
|---|---|
| `Enabled` | Inspects agent network traffic and blocks detected threats. |
| `AuditMode` | Inspects agent network traffic and generates alerts, but doesn't block the agent. |
| `Disabled` | Turns off network inspection protection. |

To check the current setting:

```powershell
Get-MpPreference | Select-Object EnableAiAgentLoopInspection
```

## Deploy settings with Intune

To deploy runtime protection settings across your organization, create an Intune policy that runs a PowerShell script on target devices.

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Scripts and remediations** > **Platform scripts**.
1. Select **Add** > **Windows 10 and later**.
1. Enter a name for the script, such as *Enable AI agent runtime protection*.
1. Upload a PowerShell script with the settings you want. For example, to enable both protections in block mode:

    ```powershell
    Set-MpPreference -EnableAiAgentProtection Enabled
    Set-MpPreference -EnableAiAgentLoopInspection Enabled
    ```

1. Under **Script settings**, set **Run this script using the logged on credentials** to **No** (runs as SYSTEM).
1. Assign the script to the device groups you want to protect.

For more information about deploying PowerShell scripts with Intune, see [Use PowerShell scripts on Windows devices in Intune](/mem/intune/apps/intune-management-extension).

## Enforcement behavior

When both agent hooks protection and network inspection protection are enabled, MDAV uses single-path enforcement to avoid duplicate scanning:

- If agent hooks protection handles a message from a supported agent, network inspection doesn't scan the same message.
- Network inspection processes traffic only from agents that aren't covered by hooks, or from traffic that hooks don't intercept.

Both settings are protected by [tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection), which prevents unauthorized changes.

> [!NOTE]
> If Microsoft Purview data loss prevention (DLP) policies are configured, Purview acts as an additional enforcement layer. Purview evaluates payloads for sensitive data independently of Defender's threat scanning.

## Detection and response

When MDAV detects a threat in an AI agent's execution loop, the response depends on the enforcement mode:

| Mode | What happens |
|---|---|
| **Block** (`Enabled`) | MDAV blocks the agent action. The user sees a notification in the agent's UI and a Windows toast message. An alert is sent to Microsoft Defender XDR. |
| **Audit** (`AuditMode`) | MDAV allows the action to proceed. An alert is sent to Microsoft Defender XDR for security team review. |

In both modes, alerts appear in the Microsoft Defender portal as part of the device timeline and are correlated into incidents. Security teams can investigate these alerts using the same workflows they use for other endpoint detections.

Runtime protection detects threats including:

- **Cross-prompt injection attacks (XPIA)** — Attempts to manipulate the agent through injected instructions in tool responses or external content.
- **Sensitive data leakage** — Agent actions that attempt to access or exfiltrate sensitive information.

## Supported agents

The following table lists the AI coding agents that MDAV runtime protection supports and the protection methods available for each:

| Agent | Agent hooks protection | Network inspection protection |
|---|---|---|
| Claude Code | ✔ | ✔ |
| GitHub Copilot CLI | ✔ | ✔ |
| OpenAI Codex | ✔ | — |
| OpenClaw | — | ✔ |

> [!NOTE]
> OpenAI Codex and OpenClaw support is available approximately one week after the initial release of runtime protection for Claude Code and GitHub Copilot CLI.

## Related content

- [Discover and protect AI coding agents with Microsoft Defender for Endpoint](/defender-endpoint/protect-ai-agents-overview)
- [Discover local AI coding agents](/defender-endpoint/discover-local-ai-agents)
- [Detect, block, and investigate threats to AI agents using Microsoft Defender](/defender-xdr/security-for-ai/ai-agent-detection-protection)
