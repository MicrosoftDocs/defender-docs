---
title: Set up AI agent runtime protection with Microsoft Defender for Endpoint (Preview)
description: Learn how to configure Microsoft Defender for Endpoint AI agent runtime protection to detect, audit, and block prompt injection on Windows devices.
author: lwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: how-to
ms.date: 08/13/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
#customer intent: As a security administrator, I want to configure runtime protection for local AI agents on my organization's endpoints so that I can detect and block prompt injection attacks in real time.
---

# Set up AI agent runtime protection with Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Local AI agents run with the user's privileges on the endpoints they operate on, where they can read files, invoke tools, and run commands. Malicious instructions hidden in the content an agent reads can hijack the agent through prompt injection. AI agent runtime protection helps you detect prompt injection at the device level and block or audit the agent's action before it acts on those instructions.

This article explains how to enable runtime protection in Microsoft Defender for Endpoint, deploy it throughout your organization, and investigate detections.

For an overview of how runtime protection works, see [AI agent runtime protection with Microsoft Defender for Endpoint](ai-agent-runtime-protection-overview.md).

## Prerequisites

Before you configure runtime protection, review the following requirements:

- Your organization has a Microsoft Defender for Endpoint Plan 2, Microsoft 365 E5, Microsoft Agent 365, or Microsoft 365 E7 license.
- Your devices are [onboarded to Defender for Endpoint](onboard-configure.md), and Microsoft Defender Antivirus is running in active mode with real-time protection enabled.
- Your devices are running a supported version of Windows, and Microsoft Defender Antivirus has the latest platform, engine, and security intelligence updates.
- Your devices have one or more [supported local AI agents](ai-agent-runtime-protection-overview.md#supported-agents) installed for the runtime protection approach you plan to enable.
- To deploy the settings with Microsoft Intune, your account has an Intune role with permission to create, update, and assign device configurations, such as [Policy and Profile Manager](/intune/fundamentals/role-based-access-control/ref-built-in-roles#policy-and-profile-manager).
- To review alerts, your account has a supported Microsoft Entra role, such as Security Reader, Security Operator, or Security Administrator, or a Microsoft Defender custom role with permission to read security data. For more information, see [Required permissions to investigate alerts](/defender-xdr/investigate-alerts#required-permissions-to-investigate-alerts).

## Recommended deployment approach

Microsoft recommends the following phased rollout:

1. **Test**: [Enable runtime protection](#enable-runtime-protection) in audit mode on a small set of devices where supported agents are actively used.
1. **Review**: Monitor alerts in the Microsoft Defender portal for one to two weeks. [Classify inaccurate alerts as false positives](/defender-xdr/investigate-alerts#manage-alert-status-and-classification). If a detection involves a file incorrectly identified as malicious, [submit the file to Microsoft for analysis](defender-endpoint-false-positives-negatives.md#part-4-submit-a-file-for-analysis).
1. **Deploy**: [Deploy throughout your organization](#deploy-settings-across-your-organization-with-intune) in audit mode to more device groups.
1. **Enforce**: After validating that alerts are accurate and actionable, switch to block mode on device groups where you want active enforcement.

## Enable runtime protection

To enable runtime protection on a single device:

1. Open an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**).

1. Verify that `AntivirusSignatureVersion` is `1.451.224.0` or later:

   ```powershell
   Get-MpComputerStatus | Select-Object AntivirusSignatureVersion
   ```

1. Choose which runtime protection method to enable.

   You can enable agent-native event inspection, network inspection, or both. Both methods support the same modes: `Disabled`, `Audit`, and `Block`.

   - Use `AiAgentProtection` to protect agents that expose vendor-supported agent event interfaces.
   - Use `AiAgentNetworkInspection` to extend protection to agents that don't expose vendor-supported agent event interfaces.

1. Enable the method or methods you need:

   - To enable agent-native event inspection, replace `<mode>` with `Audit` or `Block`, and then run the following command:

      ```powershell
      Set-MpPreference -AiAgentProtection <mode>
      ```

   - To enable network inspection, replace `<mode>` with `Audit` or `Block`, and then run the following command:

      ```powershell
      Set-MpPreference -AiAgentNetworkInspection <mode>
      ```

   To turn off either runtime protection method, set its mode to `Disabled`.

   For details about each mode, see [What happens when you enable runtime protection](ai-agent-runtime-protection-overview.md#what-happens-when-you-enable-runtime-protection). For more information about the runtime protection methods, see [Network inspection](ai-agent-runtime-protection-overview.md#network-inspection) and [Agent-native event inspection](ai-agent-runtime-protection-overview.md#agent-native-event-inspection).

1. Verify the current settings:

   ```powershell
   Get-MpPreference | Select-Object AiAgentProtection, AiAgentNetworkInspection
   ```

1. Close the PowerShell window and any terminal windows used to run agents. Then open a new terminal window before starting the agent.

<a name='deploy-settings-across-your-organization-with-intune'></a>

## Deploy settings throughout your organization with Microsoft Intune

The PowerShell commands in the [Enable runtime protection](#enable-runtime-protection) section configure a single device. After you confirm runtime protection behavior on a limited device group, deploy a PowerShell platform script to target device groups. The script can set agent-native event inspection, network inspection, or both to `Audit` or `Block` on devices in scope.

> [!NOTE]
> Native Microsoft Intune policy support for AI agent runtime protection isn't available. You can deploy these settings using PowerShell platform scripts. Intune normally runs a platform script once. It runs the script again only after you change the script or policy, or if a failed script is eligible for retry.

To deploy runtime protection settings with Microsoft Intune:

1. Create a PowerShell script that includes the settings you want to deploy.

   To enable agent-native event inspection:

   ```powershell
   Set-MpPreference -AiAgentProtection Audit
   ```

   To enable network inspection:

   ```powershell
   Set-MpPreference -AiAgentNetworkInspection Audit
   ```

   Replace `Audit` with `Block` when you're ready to enforce protection. You can enable either setting, or both, based on the agent coverage you need.

1. In the script settings, set **Run this script using the logged on credentials** to **No**. This setting runs the script in the system context so that it has permission to change Microsoft Defender Antivirus preferences.
1. Use Microsoft Intune to deploy the script to target device groups. For detailed steps, see [Use PowerShell scripts on Windows devices in Intune](/intune/device-management/tools/run-powershell-scripts-windows).
1. To apply a different mode later, update the script or its policy so that Intune runs the script again.

## Review and investigate detections

After you enable runtime protection, review alerts to validate detection accuracy and tune your configuration before broadening enforcement. This step is critical during the audit phase because it helps you understand what agents are encountering and whether detections represent real threats.

When runtime protection detects prompt injection, Defender raises a **Suspicious AI prompt injection** alert and takes action based on the configured mode. The alert appears on the device timeline, and related alerts are correlated into incidents for security operations center (SOC) investigation. In block mode, the alert severity is **Critical**, **High**, **Medium**, or **Low** based on assessed risk. In audit mode, the alert is **Informational**, so your team can review what would have been blocked without triaging it as an active threat.

:::image type="content" source="media/configure-ai-agent-runtime-protection/runtime-protection-suspicious-prompt-injection-alert.png" alt-text="Screenshot of a Suspicious AI prompt injection alert in Microsoft Defender, including the process tree and related detection details." lightbox="media/configure-ai-agent-runtime-protection/runtime-protection-suspicious-prompt-injection-alert.png":::

For more information about mode behavior, see [What happens when you enable runtime protection](ai-agent-runtime-protection-overview.md#what-happens-when-you-enable-runtime-protection).

### End-user experience

When Defender blocks an agent action, it follows the notification rules configured for the device. Users can receive the following notifications:

1. **In the agent terminal**: The agent displays a block message showing what was blocked, why, and confirmation that the action didn't execute.
1. **Windows toast notification**: If Windows Security notifications are enabled, a system notification appears regardless of whether the agent terminal is in focus.

The following screenshot shows an example of a blocked prompt injection in the agent terminal and the corresponding Windows toast notification:

:::image type="content" source="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png" alt-text="Screenshot of a Defender block message in the agent terminal and a Windows toast notification for a blocked prompt injection attack." lightbox="media/configure-ai-agent-runtime-protection/ai-runtime-agent-block-and-toast.png":::

Users can also review detections under **Windows Security** > **Virus & threat protection** > **Current threats** and the **Protection history**, where they can see the threat name, severity, affected agent, and remediation status.

### Security operations experience

For security operations teams, runtime protection events appear in the Microsoft Defender portal. Select an alert to view the detection type, severity, affected agent, process tree details, and recommended actions.

Your security team uses the same investigation workflows as other endpoint detections: timeline review, alert and entity correlation, and response actions.

For more information, see [Investigate alerts in Microsoft Defender](/defender-xdr/investigate-alerts) and [Investigate incidents in Microsoft Defender](/defender-xdr/investigate-incidents).
