---
title: Enable security for AI agents using Microsoft Defender
ms.author: guywild
author: guywi-ms
ms.reviewer: itaicohen
ms.service: microsoft-defender
ms.date: 07/01/2026
audience: Admin
ms.topic: how-to
ai-usage: ai-assisted
description: Enable Microsoft Defender security for AI agents by configuring data sources, connecting Microsoft 365, and onboarding Copilot Studio.
---

# Enable security for AI agents using Microsoft Defender

Microsoft Defender integrates with [Microsoft Agent 365](/microsoft-agent-365/overview) to secure the AI agents in your organization. After you onboard to Agent 365, enable security for AI agents to discover, protect, and respond to threats targeting agents in your tenant. For an overview of the agent security capabilities, see [Protect AI agents using Microsoft Defender](defender-security-for-ai.md#protect-ai-agents-using-microsoft-defender).

Onboarding includes enabling data collection, connecting the Microsoft 365 app connector, and onboarding Copilot Studio for real-time protection.

## Prerequisites

Before you start, make sure you have:

- [Onboard to Microsoft Agent 365](/microsoft-agent-365/overview).
- Local agents are onboarded separately from cloud agents. To include local AI agents that run on endpoints, set up [AI agent runtime protection in Microsoft Defender for Endpoint](/defender-endpoint/configure-ai-agent-runtime-protection). Microsoft Defender for Endpoint must run in **active mode**.
- Security Administrator role or higher in Microsoft Entra ID.
- For Copilot Studio real-time protection, you need collaboration with a Power Platform administrator.

## Connect data sources

To configure the data sources that Microsoft Defender uses to surface, investigate, and protect AI agents in your tenant:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
1. Go to **Settings** > **Security for AI** > **Get started**.

   When you onboard to Agent 365, security for AI agents is enabled automatically, including AI agent discovery, security posture assessment, and threat detection. The **Enable** toggle is on by default. To stop collecting data for AI agents, switch it to **Off**.

   A setup checklist shows the status of required and optional data sources. **Agent 365** provides unified visibility into AI agents and is marked as **Done** automatically.

   :::image type="content" source="media/get-started-defender-security-for-ai/security-for-ai-setup-checklist.png" alt-text="Screenshot of the Security for AI setup checklist showing Agent 365 marked Done, the Microsoft 365 connector marked Connected, Copilot Studio marked Not connected, and a list of identified Power Platform admins." lightbox="media/get-started-defender-security-for-ai/security-for-ai-setup-checklist.png":::

1. Enable the Microsoft 365 connector to get [investigation and advanced hunting capabilities](ai-agent-detection-protection.md) for AI agent activity:

   1. In the **Get started** page, select the **Microsoft 365 connector** step.
   1. On the **Select Microsoft 365 components** step, select at least the two components required for AI agent monitoring:
      - **Microsoft Entra ID Management events**: audit admin activities performed in Microsoft Entra ID.
      - **Microsoft 365 activities**: audit activities performed by users in your Microsoft 365 apps.

      **Microsoft Entra Users and groups** is a prerequisite for all monitoring capabilities and is selected by default.
   1. Select **Connect Microsoft 365** to complete the connector setup.

      :::image type="content" source="media/get-started-defender-security-for-ai/microsoft-365-connector-components.png" alt-text="Screenshot of the Select Microsoft 365 components step with Microsoft Entra ID Management events, Sign-in events, Apps, and Microsoft 365 activities selected." lightbox="media/get-started-defender-security-for-ai/microsoft-365-connector-components.png":::

   When the connector is active, its status shows as **Connected**.

   > [!NOTE]
   > For Copilot Studio agents, if the Microsoft 365 connector isn't connected, real-time protection continues to block suspicious activity during runtime, but alerts and incidents related to these actions don't appear in the Microsoft Defender portal.

1. Connect Copilot Studio to enable real-time protection for Copilot Studio agents:

   1. In the **Get started** page, select the **Copilot Studio** step. The **Copilot Studio real-time protection** pane opens.
   1. Toggle **Real-time protection** to on.

      This integration allows Microsoft Defender to scan agent tool invocations in real time, detect security risks (suspicious behavior or cross-prompt injection attacks), and block malicious actions. If suspicious behavior is detected, the response is blocked and an alert is triggered in the Microsoft Defender alerts and incidents queues.

      :::image type="content" source="media/get-started-defender-security-for-ai/copilot-studio-real-time-protection.png" alt-text="Screenshot of the Copilot Studio real-time protection pane in the Microsoft Defender portal with the Real-time protection toggle on." lightbox="media/get-started-defender-security-for-ai/copilot-studio-real-time-protection.png":::

   1. Under **Enable Power Platform Integration**, copy the URL provided and share it with your Power Platform administrator.
   1. Work with your Power Platform administrator to complete the onboarding steps in Power Platform. For detailed instructions, see [Enable external threat detection and protection for Copilot Studio custom agents](/microsoft-copilot-studio/external-security-provider#step-2-configure-the-threat-detection-system).

      Make sure that the Power Platform administrator uses the same App ID as the App ID used in the [Microsoft Entra ID application](/microsoft-copilot-studio/external-security-provider#step-1-configure-microsoft-entra-application).

   1. Get the App ID from the Power Platform administrator, paste it into the **App ID** field in the Defender portal, then select **Save**.

   > [!NOTE]
   > If you recently changed the App ID in Power Platform, it can take up to one minute for the update to propagate. If you encounter a validation error when saving the updated value, wait a short time and try again.

   When the Power Platform administrator completes the onboarding steps, the Copilot Studio step shows a **Connected** status in the **Get started** page.

   The **Get started** page also shows a list of **Identified Power Platform Admins** who have permission to complete the setup in Power Platform.

## Next steps

After onboarding is complete, explore these capabilities:

- [Discover AI agents and assess security posture using Microsoft Defender](ai-agent-inventory.md)
- [Detect and investigate threats to AI agents using Microsoft Defender](ai-agent-detection-protection.md)

- [Protect AI agents in real time using Microsoft Defender](ai-agent-real-time-protection.md)
