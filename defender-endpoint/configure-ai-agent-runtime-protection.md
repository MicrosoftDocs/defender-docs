---
title: Set up AI agent runtime protection with Microsoft Defender for Endpoint
description: Learn how to configure Microsoft Defender to protect local AI agents from prompt injection attacks on Windows endpoints.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: how-to
ms.date: 05/27/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 2
#customer intent: As a security administrator, I want to configure runtime protection for local AI agents on my organization's endpoints so that I can detect and block prompt injection attacks in real time.
---

# Set up AI agent runtime protection with Microsoft Defender for Endpoint

Local AI agents run with the user's privileges on the endpoints they operate on, where they can read files, invoke tools, and run commands. Malicious instructions hidden in the content an agent reads can hijack it through prompt injection. Runtime protection helps you detect prompt injection at the device level and block or audit the agent's action before it acts on those instructions.

This article explains how to enable runtime protection, deploy it across your organization, and investigate detections.

For an overview of how runtime protection works, see [Runtime protection for local AI agents with Microsoft Defender for Endpoint](ai-agent-runtime-protection-overview.md).

## Recommended deployment approach

Microsoft recommends the following phased rollout:

1. **Test**: [Enable runtime protection](#enable-runtime-protection) in **Audit** mode on a small set of devices where supported agents are actively used.
1. **Review**: Monitor alerts in the Microsoft Defender portal for 1-2 weeks. Identify any false positives before broadening enforcement.
1. **Deploy**: [Roll out across your organization](#deploy-settings-across-your-organization-with-intune) in Audit mode to additional device groups.
1. **Enforce**: After validating that alerts are accurate and actionable, switch to **Block** mode on device groups where you want active enforcement.

## Prerequisites

Before you configure runtime protection, make sure the following requirements are met:

- The device is onboarded to [Microsoft Defender](/defender-endpoint/onboard-configure) and runs on a supported Windows version with Microsoft Defender platform version <!-- TODO: Confirm platform version number with engineering --> or later.
- Microsoft Defender Antivirus is running in active mode.
- One or more [supported local AI agents](ai-agent-runtime-protection-overview.md#supported-agents) are installed on the device.
- The local AI agent must natively support a hooks framework. See [Supported agents](ai-agent-runtime-protection-overview.md#supported-agents) for the full list.

## Enable runtime protection

To enable runtime protection on a single device (for testing or validation):

1. Open an elevated PowerShell session.

1. Run the following command:

    ```powershell

    Set-MpPreference -AiAgentProtection <mode>

    ```

1. Replace `<mode>` with `Disabled`, `Audit`, or `Block`, depending on how you want Microsoft Defender to handle detected threats. For details on each mode, see [What happens when you enable runtime protection](ai-agent-runtime-protection-overview.md#what-happens-when-you-enable-runtime-protection).

1. To verify the current setting, run:

    ```powershell

    Get-MpPreference | Select-Object AiAgentProtection

    ```

## Deploy settings across your organization with Intune

After validating runtime protection on test devices, use Intune to deploy settings at scale across your organization. You deploy the same PowerShell command as a script to target device groups, setting the runtime protection mode (Audit or Block) for all devices in scope.

> [!NOTE]
> Native Intune policy support for AI agent runtime protection is planned for a future update. In the meantime, deploy settings by using PowerShell scripts in Intune.

The PowerShell command in the previous section configures a single device and is useful for testing and validation. To deploy the same settings across your organization, use Intune to run a PowerShell script on target device groups.

1. Create a PowerShell script that includes the following command, setting the mode to match your rollout phase (Audit while validating, Block for enforcement):

    ```powershell
    Set-MpPreference -AiAgentProtection Block
    ```

1. Use Intune to deploy the script to target devices. For detailed steps, see [Use PowerShell scripts on Windows devices in Intune](/mem/intune/apps/intune-management-extension).

## Review and investigate detections

After enabling runtime protection, review alerts to validate detection accuracy and tune your configuration before broadening enforcement. This step is critical during the Audit phase — it helps you understand what agents are encountering and whether detections represent real threats.

When Microsoft Defender detects a threat based on your runtime protection settings, it generates an alert in Microsoft Defender and takes action based on the configured mode (**Block** or **Audit**). Detection details appear across the agent's UI, Windows notifications, and the Microsoft Defender portal.

For more information on mode behavior, see [What happens when you enable runtime protection](ai-agent-runtime-protection-overview.md#what-happens-when-you-enable-runtime-protection).

### End-user experience

When Defender blocks an agent action, users see two notifications:

1. **In the agent terminal**: The agent displays a block message showing what was blocked, why, and confirmation that the action didn't execute.
2. **Windows toast notification**: A system notification appears regardless of whether the agent terminal is in focus.

The following screenshot shows an example of a blocked prompt injection in the agent terminal and the corresponding Windows toast notification:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png" alt-text="Screenshot showing a Defender block message in the agent terminal and a Windows toast notification for a blocked prompt injection attack.":::

Users can also review detections under **Windows Security** > **Virus & threat protection** > **Current threats** and **Protection history**, where they can see the threat name, severity, affected agent, and remediation status.

### Security operations experience

For security operations teams, runtime protection events appear in the Microsoft Defender portal:

- Each detection generates an alert on the **device timeline**.
- Related detections are correlated into a single **incident** for investigation.
- Select an alert to view detection type, affected agent, and recommended actions.

Your security team uses the same investigation workflows as other endpoint detections — timeline review, alert and entity correlation, and response actions.

For more information, see [Investigate alerts in Microsoft Defender](/defender-xdr/investigate-alerts) and [Investigate incidents in Microsoft Defender](/defender-xdr/investigate-incidents).
