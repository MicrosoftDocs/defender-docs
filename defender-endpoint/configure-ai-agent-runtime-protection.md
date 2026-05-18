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

Microsoft Defender Antivirus provides runtime protection for AI coding agents on Windows endpoints. It scans key events in the agent loop to detect cross-prompt injection attacks (XPIA) and sensitive data leakage, then audits or blocks threats and sends alerts to Microsoft Defender XDR based on your configuration.

Defender Antivirus supports two runtime protection approaches: agent hooks protection and network inspection protection.

In this article, you learn how to choose a protection method, configure runtime protection settings, deploy settings with Intune, and investigate detections.

For an overview of how each method works, see [AI agent runtime protection overview](protect-ai-agents-overview.md#ai-agent-runtime-protection).

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

## Decide on your protection method and configuration

- You can use either agent hooks protection or network inspection protection, or both together for layered protection. To choose which runtime protection method to use in your environment, see this [comparison of agent hooks protection and network inspection protection](protect-ai-agents-overview.md#protection-approaches-comparison).
- You can configure each method on individual devices for testing and validation, or deploy settings across your organization using Intune.
    - To configure settings on a single device, see [Configure agent hooks protection](#configure-agent-hooks-protection) and [Configure network inspection protection](#configure-network-inspection-protection).
    - To deploy settings across your organization, see [Deploy settings across your organization with Intune](#deploy-settings-across-your-organization-with-intune).

## Configure agent hooks protection

To enable agent hooks protection on a single device (for testing or validation):

1. Open an elevated PowerShell session.
1. Run the following command:

    ```powershell
    Set-MpPreference -EnableAiAgentProtection <mode>
    ```

1. Replace `<mode>` with either `Enabled`, `AuditMode`, or `Disabled` depending on how you want Defender Antivirus to handle detected threats. For details on each mode, see [Protection modes](protect-ai-agents-overview.md#protection-modes).

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

1. Replace `<mode>` with either `Enabled`, `AuditMode`, or `Disabled` depending on how you want Defender Antivirus to handle detected threats. For details on each mode, see [Protection modes](protect-ai-agents-overview.md#protection-modes).

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

## Enforcement methods and outcome

For enforcement details, outcomes, and admin considerations, see [Enforcement methods and outcome](/defender-endpoint/protect-ai-agents-overview#enforcement-methods-and-outcome) and [Enforcement, response and investigation considerations](/defender-endpoint/protect-ai-agents-overview#enforcement-response-and-investigation-considerations).

## View and investigate runtime protection details

When runtime protection detects a threat, details appear across the agent UI, Windows notifications, Windows Security, and the Microsoft Defender portal. Use the following tasks to review what happened and investigate the detection.

### Task 1: View the block message in the agent UI

When Defender Antivirus blocks an agent action in **Block** mode, the agent displays a block message directly in the terminal. In the following example, Defender blocked an agent that attempted to read a file containing a prompt injection payload.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-block-agent-ui.png" alt-text="Screenshot of Claude Code terminal showing a Defender block message after the agent attempted to read a malicious file." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-block-agent-ui.png":::

Review the following details in the block message:

- The action Defender blocked.
- The reason the action was blocked.
- Confirmation that the blocked action didn't run.

### Task 2: View the Windows toast notification

In addition to the in-agent message, Windows displays a toast notification to alert the user. This notification appears regardless of whether the agent terminal is in focus.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-block-toast.png" alt-text="Screenshot of a Windows toast notification from Microsoft Defender showing that an AI agent action was blocked." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-block-toast.png":::

Review the following details in the toast notification:

- The detection and block status.
- The Defender source for the notification.
- The time of the detection.

### Task 3: View Protection history in Windows Security

Users can review past detections in **Windows Security** > **Virus & threat protection** > **Protection history**. Each runtime protection detection appears as a separate entry.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-protection-history-list.png" alt-text="Screenshot of Windows Security Protection History showing a list of runtime protection detections for AI agents." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-protection-history-list.png":::

Select an entry to view details including the threat name, severity, and which agent triggered the detection.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-protection-history-detail.png" alt-text="Screenshot of Protection History detail view showing threat information for a blocked AI agent action." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-protection-history-detail.png":::

Review the following details in Protection history:

- The threat name and severity.
- The affected file, process, or content.
- The agent associated with the detection.
- The detection timestamp and remediation status.

### Task 4: View the device timeline, alerts, and incidents in the Defender portal

For security operations teams, runtime protection events appear in the Microsoft Defender portal. Each detection generates an alert that appears on the device timeline.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-portal-timeline.png" alt-text="Screenshot of the Defender portal device timeline showing an AI agent runtime protection alert." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-portal-timeline.png":::

Select the alert to view detailed information including the detection type, affected agent, and recommended actions.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-portal-alert-detail.png" alt-text="Screenshot of the Defender portal alert details for an AI agent runtime protection detection." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-portal-alert-detail.png":::

When multiple related detections occur, Defender XDR correlates them into a single incident for streamlined investigation.

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-portal-incident.png" alt-text="Screenshot of the Defender portal incident view showing correlated AI agent runtime protection alerts." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-portal-incident.png":::

Review the following details in the Defender portal:

- Device timeline events related to AI agent runtime protection.
- Alert details, including detection type, affected agent, and recommended actions.
- Incident correlation across related alerts and entities.

For more information on investigating alerts and incidents in the Defender portal, see [Investigate alerts in Microsoft Defender XDR](/defender-xdr/investigate-alerts) and [Investigate incidents in Microsoft Defender XDR](/defender-xdr/investigate-incidents).
