---
title: Protect your agents in real-time during runtime (Preview)
description: Learn how to Protect your environment in real-time during agent runtime using Microsoft Defender for Cloud Apps.
ms.date: 11/02/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
#customer-intent: As a security administrator, I want my Copilot Studio AI agents to be protected against suspicious or harmful actions so that I can reduce security risks to my organization.
---

# Protect your environment in real-time during agent runtime
As AI agents become increasingly accessible through low-code/no‑code (LCNC) platforms like Microsoft Copilot Studio, organizations face new types of security risks at scale. These platforms empower non‑technical users to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by injecting malicious prompts, triggering unintended tool executions, or exploiting data sources to escalate privileges or exfiltrate data.

Real-time protection during agent runtime in Microsoft Defender reduces these risks by inspecting tool invocations before the agent runs any actions.

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An informative alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts.

## Enable real-time protection for Microsoft Copilot Studio agents during runtime

> [!NOTE]
> - The onboarding process for real-time protection during agent runtime requires configuration in Power Platform and collaboration with other administrators.
> - If the Microsoft 365 connector isn’t properly connected, real-time agent protection during runtime continues to block suspicious activity on the AI agent, but alerts and incidents related to these actions won't appear in the Microsoft Defender portal.

1. Sign in to the **[Microsoft Defender portal](https://security.microsoft.com)**:
1. Navigate to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Check the Microsoft 365 App Connector status:
   - **If the connector is already connected:** Continue to step 5.
   - **If the connector isn’t connected:**
      - Under **Microsoft 365 connector**, select **Connect** or **Edit**.
      - Select **Microsoft Entra ID Management events** and **Microsoft 365 activities**. 
      - Select **Connect Microsoft 365**.
1. Enter the App ID provided by your Power Platform administrator and select **Save**.
      
    :::image type="content" source="media/protect-ai-agents/turn-on-real-time-agent-protection.png" alt-text="Screenshot that shows how to turn on Real time agent protection during runtime in the Defender portal." lightbox="media/protect-ai-agents/turn-on-real-time-agent-protection.png":::

1. Work together with a Power Platform administrator to complete the onboarding steps [here] [Enable external threat detection and protection for Copilot Studio custom agents](/microsoft-copilot-studio/external-security-provider#step-2-configure-the-threat-detection-system).
    - The Power Platform administrator must use the same App ID as the App ID used in [Microsoft Entra ID application](/microsoft-copilot-studio/external-security-provider#step-1-configure-microsoft-entra-application).
    - To allow the Power Platform administrator to complete the onboarding steps, share the URL provided in the Defender portal with them. 

    Once the Power Platform administrator completes the onboarding steps, a green **Connected** status appears in the **Microsoft 365 connector** section.

## Related articles

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
