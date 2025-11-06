---
title: Protect your Microsoft Copilot Studio AI agents (Preview)
description: Learn how to enable and manage AI Agent protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 11/02/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
#customer-intent: As a security administrator, I want my Copilot Studio AI agents to be protected against suspicious or harmful actions so that I can reduce security risks to my organization.
---

# Protect your Microsoft Copilot Studio AI agents (Preview)

As no code/low code platforms become increasingly accessible, organizations face new types of security risks. These platforms empower people to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by:
- injecting malicious prompts
- triggering unintended tool executions
- exploiting data sources to escalate privileges or exfiltrate data.

Microsoft Defender AI agent protection helps you by identifying the AI agents in your environment, providing monitoring capabilities, threat protection, and real-time protection during agent runtime to block suspicious tool invocations before they can execute.

> [!NOTE]
> - Microsoft Defender protection for AI agents supports AI agents created with Microsoft Copilot Studio.
> - This feature is currently in public preview and included with your Microsoft Defender for Cloud Apps license at no extra cost. When the feature becomes generally available, licensing requirements might change.

## Prerequisites

Before enabling real-time agent protection during runtime, make sure:

- You have a valid Microsoft E5 Security license and a Microsoft Defender for Cloud Apps license.
- You have Security Administrator privileges in the Microsoft Defender portal.

## Discover your AI agents with the AI agent inventory

Microsoft Defender detects all of the AI agents created with Microsoft Copilot Studio and Azure AI Foundry. This inventory helps security teams discover, catalog, and continuously monitor AI agents across your organization.

:::image type="content" source="../defender-xdr/media/protect-ai-agents/ai-agent-inventory.png" alt-text="Screenshot that shows the AI agent inventory in the Defender portal.":::

### Enable AI Agent inventory for Microsoft Copilot Studio Agents

> [!NOTE]
> The onboarding process for AI Agent protection requires collaboration with Power Platform administrators.

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Go to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Turn on **Copilot Studio AI Agents**. Enabling Copilot Studio AI Agents allows Microsoft Defender to start discovering AI agents in your environment.

    :::image type="content" source="../defender-xdr/media/protect-ai-agents/ai-agent-configuration.png" alt-text="Screenshot of the Copilot Studio AI Agent configuration page":::

1. Work together with the Power Platform administrator to complete these steps in the [Power Platform Portal](https://admin.preview.powerplatform.microsoft.com/security/threatdetection):  
    1. Select **Microsoft Defender - Copilot Studio AI Agents**.
    1. Turn on **Enable Microsoft Defender - Copilot Studio AI Agents**.

When Copilot Studio AI Agents are connected, a green indicator appears in the **AI Agents Inventory** section. It can take up to 30 minutes for the initial connection status to update. Depending on the size and complexity of your environment, it might take longer to see the full deployment of the AI agent inventory.

## Detect threats on your Microsoft Copilot Studio AI Agents

Once you've enabled AI agent protection on your AI agents created using Copilot Studio, enable the Microsoft 365 App Connector to start:
- running detections on your AI Agents created using Copilot Studio
- creating alerts and incidents for suspicious activity
- including AI agent data in advanced hunting

### Connect Microsoft Defender for Cloud Apps to Microsoft 365 

1. [Connect Defender for Cloud Apps with Microsoft 365](protect-office-365.md#connect-microsoft-365-to-microsoft-defender-for-cloud-apps).
1. When you have completed the Microsoft 365 connector setup, sign in to the **[Microsoft Defender portal](https://security.microsoft.com)**:
1. Go to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Check the Microsoft 365 App Connector status:
      - Under **Microsoft 365 connector**, select **Connect** or **Edit**.
      - Select **Microsoft Entra ID Management events** and **Microsoft 365 activities**. 
      - Select **Connect Microsoft 365**.
1. When the Microsoft 365 connector is connected, a green **Connected** status appears in the **Microsoft 365 connector** section.


### Advanced hunting for AI agents
With the Microsoft 365 app connector enabled, Microsoft Defender starts populating the `AIAgentsInfo` table in advanced hunting with information about your AI agents created using Copilot Studio. You can use this data to create custom queries and hunt for potential threats.
See [Proactively hunt for threats with advanced hunting in Microsoft Defender](../defender-xdr/advanced-hunting-overview.md) and [AIAgentsInfo](../defender-xdr/advanced-hunting-aiagentsinfo-table.md) to learn how to use queries to proactively hunt for threats.

## Protect your environment in real-time during agent runtime
Microsoft Defender real-time protection during agent runtime reduces these risks by inspecting tool invocations before the agent runs any actions.

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts.

### Enable real-time protection for Microsoft Copilot Studio Agents during runtime

> [!NOTE]
>- The onboarding process for real-time protection during agent runtime requires configuration in Power Platform and collaboration with other administrators.

    > [!IMPORTANT]
    > If the Microsoft 365 connector isn’t properly connected, real-time agent protection during runtime continues to block suspicious activity on the AI agent, but alerts and incidents related to these actions won't appear in the Microsoft Defender portal.

1. Enter the App ID provided by your Power Platform administrator and select **Save**.
      :::image type="content" source="media/protect-ai-agents/turn-on-real-time-agent-protection.png" alt-text="Screenshot that shows how to turn on Real time agent protection during runtime in the Defender portal." lightbox="media/protect-ai-agents/turn-on-real-time-agent-protection.png":::
1. Work together with a Power Platform administrator to complete the onboarding steps [here] [Enable external threat detection and protection for Copilot Studio custom agents](/microsoft-copilot-studio/external-security-provider#step-2-configure-the-threat-detection-system).
    - The Power Platform administrator must use the same App ID as the App ID used in [Microsoft Entra ID application](/microsoft-copilot-studio/external-security-provider#step-1-configure-microsoft-entra-application).
    - To allow the Power Platform administrator to complete the onboarding steps, share the URL provided in the Defender portal with them. 
1. Once the Power Platform administrator completes the onboarding steps, a green **Connected** status appears in the **Microsoft 365 connector** section.

## Related articles

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
