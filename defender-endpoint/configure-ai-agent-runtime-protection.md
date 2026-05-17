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

Microsoft Defender Antivirus provides runtime protection for AI coding agents running on Windows endpoints. When enabled, Defender Antivirus intercepts events in the agent's execution loop — such as user prompts, pre-tool calls, and post-tool responses — and scans them for cross-prompt injection attacks (XPIA) and sensitive data leakage. Depending on how you configure it, Defender Antivirus can audit or block threats and send alerts to Microsoft Defender XDR.

Defender Antivirus provides two runtime protection approaches for AI coding agents: agent hooks protection and network inspection protection.

For an overview of how each method works, see [AI agent runtime protection](protect-ai-agents-overview.md#ai-agent-runtime-protection).

## Prerequisites

Before you configure runtime protection, make sure the following requirements are met:

- The device runs Windows and is onboarded to Microsoft Defender for Endpoint.
- Defender Antivirus is in active mode (not passive mode). Runtime protection settings aren't enforced when Defender Antivirus runs in passive mode.
- One or more [supported AI coding agents](#supported-agents) are installed on the device.
- For network inspection protection, the device requires a Microsoft Defender for Endpoint Plan 2 license.
- For agent hooks protection, the AI coding agent must natively support a hooks framework. The following agents support hooks:
  - [Claude Code](https://code.claude.com/docs/en/hooks)
  - [GitHub Copilot CLI](https://docs.github.com/en/copilot/customizing-copilot/extending-copilot-agent-mode-in-vs-code/using-copilot-coding-agent)
  - [OpenAI Codex](https://developers.openai.com/codex/hooks)

> [!NOTE]
> Network inspection protection works with any agent that communicates over the network. However, network inspection doesn't support agents that use certificate pinning or HTTP/3. If your organization uses agents with these restrictions, use agent hooks protection if available for those agents.

## Decide which method to use

Agent hooks protection is the recommended starting point for most organizations because it provides protection for popular AI coding agents (Claude Code, GitHub Copilot CLI, and OpenAI Codex) with lower performance overhead. If your organization uses agents that don't support hooks, or needs broader coverage for additional agents, you can also enable network inspection protection.

The following table compares both approaches to help you choose. For general information on how each method works, see [AI agent runtime protection](protect-ai-agents-overview.md#ai-agent-runtime-protection).

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

**Configuration approach:** Enable agent hooks protection for supported agents. If you need to protect additional agents not covered by hooks, also enable network inspection protection. When both methods are enabled, Defender Antivirus uses single-path enforcement to avoid duplicate scanning—hooks will handle supported agents, and network inspection will protect other agents.

## Configure agent hooks protection

To enable agent hooks protection on a device:

1. Open an elevated PowerShell session.
1. Run the following command:

    ```powershell
    Set-MpPreference -EnableAiAgentProtection <mode>
    ```

1. Replace `<mode>` with one of the following values:

    | Value | Behavior |
    |---|---|
    | `Enabled` | Scans agent events and blocks detected threats. The user sees a notification in the agent UI and a toast message. |
    | `AuditMode` | Scans agent events and generates alerts, but doesn't block the agent. |
    | `Disabled` | Turns off agent hooks protection. |

1. To verify the current setting, run:

    ```powershell
    Get-MpPreference | Select-Object EnableAiAgentProtection
    ```

## Configure network inspection protection

To enable network inspection protection on a device:

1. Open an elevated PowerShell session.
1. Run the following command:

    ```powershell
    Set-MpPreference -EnableAiAgentLoopInspection <mode>
    ```

1. Replace `<mode>` with one of the following values:

    | Value | Behavior |
    |---|---|
    | `Enabled` | Inspects agent network traffic and blocks detected threats. |
    | `AuditMode` | Inspects agent network traffic and generates alerts, but doesn't block the agent. |
    | `Disabled` | Turns off network inspection protection. |

1. To verify the current setting, run:

    ```powershell
    Get-MpPreference | Select-Object EnableAiAgentLoopInspection
    ```

## Deploy settings with Intune

To deploy AI agent runtime protection settings across your organization using Intune:

1. Create a PowerShell script with the Defender Antivirus settings you want to deploy. For example:

    ```powershell
    Set-MpPreference -EnableAiAgentProtection Enabled
    Set-MpPreference -EnableAiAgentLoopInspection Enabled
    ```

1. Use Intune to deploy the script to target devices. For detailed steps, see [Use PowerShell scripts on Windows devices in Intune](/mem/intune/apps/intune-management-extension).

## Enforcement methods and outcome

For enforcement details, outcomes, and admin considerations, see [Enforcement methods and outcome](/defender-endpoint/protect-ai-agents-overview#enforcement-methods-and-outcome) and [Enforcement, response and investigation considerations](/defender-endpoint/protect-ai-agents-overview#enforcement-response-and-investigation-considerations).
