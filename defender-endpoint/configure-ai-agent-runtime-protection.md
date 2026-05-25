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

Microsoft Defender Antivirus provides runtime protection for AI coding agents on Windows endpoints. It scans key events in the agent loop to detect cross-prompt injection attacks (XPIA) and sensitive data leakage, then audits or blocks threats and sends alerts to Microsoft Defender based on your configuration.

Defender Antivirus supports two runtime protection approaches: agent hooks protection and network inspection protection.

Discovery visibility and runtime protection alerting are currently presented in separate workflows. A discovered local AI coding agent device in inventory doesn't necessarily appear in the same investigation view context as a runtime protection block alert.

In this article, you learn how to choose a protection method, configure runtime protection settings, deploy settings with Intune, and investigate detections.

For an overview of how each method works, see [AI coding agent runtime protection overview](ai-agent-runtime-protection-overview.md).

## Prerequisites

Before you configure runtime protection, make sure the following requirements are met:

- The device runs **Windows 10 or Windows 11**, **Windows Server 2019 or newer**, or **Windows 11 virtual desktop environments**, and is onboarded to Microsoft Defender for Endpoint. macOS support is available in public preview<!-- TODO: Add specific macOS versions when Spencer provides them -->.
- Defender Antivirus is in active mode (not passive mode). Runtime protection settings aren't enforced when Defender Antivirus runs in passive mode.
- One or more [supported AI coding agents](ai-agent-runtime-protection-overview.md#supported-agents) are installed on the device.
- For network inspection protection, the device requires a Microsoft Defender for Endpoint Plan 2 license. <!-- TODO: Verify exact license tier required for network inspection with engineering team -->
- For agent hooks protection, the AI coding agent must natively support a hooks framework. See [Supported agents](ai-agent-runtime-protection-overview.md#supported-agents) for the full list.

> [!NOTE]
> Network inspection protection works with any agent that communicates over the network. However, network inspection doesn't support agents that use certificate pinning or HTTP/3. If your organization uses agents with these restrictions, use agent hooks protection if available for those agents.

## Decide which method to use

You can use agent hooks protection, network inspection protection, or both together for layered coverage. The following table compares both approaches to help you choose.

As a best practice, enable agent hooks protection for supported agents. If you also need to protect agents that don't support hooks, enable network inspection protection alongside it. When both methods are enabled, Defender Antivirus uses single-path enforcement, where hooks handle supported agents, and network inspection protects the rest, with no need for duplicate scanning.

| Aspect | Agent hooks protection | Network inspection protection |
| --- | --- | --- |
| **Coverage** | Agents with hooks support | Any agent with network connectivity |
| **Supported agents** | Claude Code, GitHub Copilot CLI, OpenAI Codex | All agents (except those with cert pinning or HTTP/3) |
| **Detection method** | Application-layer message scanning | Network-layer traffic interception |
| **Scope** | Prompts, tool calls, tool responses | LLM API traffic between agent and model |
| **Overhead** | Lower (application-layer only) | Higher (TLS inspection required) |
| **Compatibility issues** | None | Doesn't support certificate pinning or HTTP/3 |
| **Microsoft Purview DLP integration** | Supported | Limited |
| **Recommended for** | Organizations using Claude Code, GitHub Copilot CLI, or OpenAI Codex | Agents without hooks support, or when broad coverage is needed |

For a full list of supported agents and which method applies to each, see [Supported agents](ai-agent-runtime-protection-overview.md#supported-agents).

### Configuration options

You can configure each method on individual devices for testing and validation, or deploy settings across your organization using Intune:

- To configure settings on a single device, see [Configure agent hooks protection](#configure-agent-hooks-protection) and [Configure network inspection protection](#configure-network-inspection-protection).
- To deploy settings across your organization, see [Deploy settings across your organization with Intune](#deploy-settings-across-your-organization-with-intune).

## Configure agent hooks protection

To enable agent hooks protection on a single device (for testing or validation):

1. Open an elevated PowerShell session.
1. Run the following command:

    ```powershell
    Set-MpPreference -EnableAiAgentProtection <mode>
    ```

1. Replace `<mode>` with either `Enabled`, `AuditMode`, or `Disabled` depending on how you want Defender Antivirus to handle detected threats. For details on each mode, see [Protection modes and enforcement outcomes](ai-agent-runtime-protection-overview.md#protection-modes-and-enforcement-outcomes).

1. To verify the current setting, run:

    ```powershell
    Get-MpPreference | Select-Object EnableAiAgentProtection
    ```

## Configure network inspection protection

To enable network inspection protection on a single device (for testing or validation):

1. Open an elevated PowerShell session.
1. Run the following command:

    ```powershell
    Set-MpPreference -EnableAiAgentLoopInspection <mode>
    ```

1. Replace `<mode>` with either `Enabled`, `AuditMode`, or `Disabled` depending on how you want Defender Antivirus to handle detected threats. For details on each mode, see [Protection modes and enforcement outcomes](ai-agent-runtime-protection-overview.md#protection-modes-and-enforcement-outcomes).

1. To verify the current setting, run:

    ```powershell
    Get-MpPreference | Select-Object EnableAiAgentLoopInspection
    ```

## Deploy settings across your organization with Intune

The PowerShell commands in the previous sections configure a single device and are useful for testing and validation. To deploy the same settings across your organization, use Intune to run a PowerShell script on target device groups.

1. Create a PowerShell script that includes the commands for the protection methods you chose. For example:

    - To enable agent hooks protection only:

        ```powershell
        Set-MpPreference -EnableAiAgentProtection Enabled
        ```

    - To enable both agent hooks and network inspection protection:

        ```powershell
        Set-MpPreference -EnableAiAgentProtection Enabled
        Set-MpPreference -EnableAiAgentLoopInspection Enabled
        ```

1. Use Intune to deploy the script to target devices. For detailed steps, see [Use PowerShell scripts on Windows devices in Intune](/mem/intune/apps/intune-management-extension).

## Review and investigate runtime protection detections and outcomes

When Defender Antivirus detects a threat based on your runtime protection settings, it generates an alert in Microsoft Defender and takes action based on the configured mode (Block, AuditMode, or Disabled). Detection details appear across a specific agent's UI, Windows notifications on the device, and the Microsoft Defender portal.

For more information on mode behavior and enforcement outcomes, see [Protection modes and enforcement outcomes](ai-agent-runtime-protection-overview.md#protection-modes-and-enforcement-outcomes) and [Enforcement, response and investigation considerations](ai-agent-runtime-protection-overview.md#enforcement-response-and-investigation-considerations).

Use the following tasks to review what happened and investigate the detection.

### View the block message in the agent UI (end-user experience)

When Defender Antivirus blocks an agent action in **Block** mode, the agent displays a block message directly in the terminal. In the following example, Defender blocks an agent that attempts to read a file containing a prompt injection payload.

Here's an example of a flagged prompt injection payload in a file that an agent might attempt to read:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-flagged-prompt-injection-agent-ui.png" alt-text="Screenshot of Claude Code terminal showing a Defender block message after the agent attempted to read a malicious file.":::

Users can review the following details in the block message:

- The action Defender blocked.
- The reason Defender blocked the action.
- Confirmation that the blocked action didn't run.

### View the Windows toast notification (end-user experience)

In addition to the in-agent message, Windows displays a toast notification to alert the user. This notification appears regardless of whether the agent terminal is in focus.

Here's an example of a Windows toast notification that appears when an agent action is blocked by Defender Antivirus:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-block-toast.png" alt-text="Screenshot of a Windows toast notification from Microsoft Defender showing that an AI agent action was blocked.":::

Here's an example of a Windows toast notification that shows an interaction that was blocked due to sensitive information sharing:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-block-sensitive-information-toast.png" alt-text="Screenshot of a Windows toast notification from Microsoft Defender showing that an AI agent action was blocked due to sensitive information sharing.":::

Users can review the following details in the toast notification:

- The detection and block status.
- The Defender source for the notification.
- The time of the detection.

### View current threats and protection history in Windows Security (end-user experience)

Users can review current threats under **Windows Security** > **Virus & threat protection**, and protected threats under the **Protection history**.

Here's an example of a prompt injection attack detected as a current threat:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-current-threats.png" alt-text="Screenshot of the current threats in Windows Security showing that a threat injection attempt was detected.":::

Here's an example of the same prompt injection attack, listed in the protection history after Defender has blocked the threat:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-protection-history.png" alt-text="Screenshot of the protection history in Windows Security showing that a threat injection attempt was blocked and the file was quarantined.":::

Users can select an entry to view details including the threat name, severity, and which agent triggered the detection.

Users can review the following details in the protection history:

- The threat name and severity.
- The affected file, process, or content.
- The agent associated with the detection.
- The detection timestamp and remediation status.

### View the device timeline, alerts, and incidents in the Defender portal (security operations/administrator experience)

For security operations teams, runtime protection events appear in the Microsoft Defender portal. Each detection generates an alert that appears on the device timeline.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-portal-timeline.png" alt-text="Screenshot of the device timeline in the Microsoft Defender portal showing runtime protection events.":::

Select the alert to view detailed information including the detection type, affected agent, and recommended actions.

When multiple related detections occur, Defender correlates them into a single incident for detailed investigation.

Review the following details in the Defender portal:

- Device timeline events related to AI agent runtime protection.
- Alert details, including detection type, affected agent, and recommended actions.
- Incident correlation across related alerts and entities.

For more information on investigating alerts and incidents in the Defender portal, see [Investigate alerts in Microsoft Defender](/defender-xdr/investigate-alerts) and [Investigate incidents in Microsoft Defender](/defender-xdr/investigate-incidents).
