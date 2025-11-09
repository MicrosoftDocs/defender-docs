---
title: Real-time protection during agent runtime for Microsoft Copilot Studio AI agents (Preview)
description: Learn how to enable and manage real-time runtime protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 10/26/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
#customer-intent: As a security administrator, I want my Copilot Studio AI agents to be protected against suspicious or harmful actions during runtime so that I can reduce security risks to my organization.
---

# Real-time protection during agent runtime for Microsoft Copilot Studio AI agents (Preview)


## Overview

As AI agents become increasingly accessible through low-code/no‑code (LCNC) platforms like Microsoft Copilot Studio, organizations face new types of security risks at scale. These platforms empower non‑technical users to build and deploy custom agents without centralized security review or controls in place. Attackers can attempt to manipulate these agents by injecting malicious prompts, triggering unintended tool executions, or exploiting data sources to escalate privileges or exfiltrate data.

## Capabilities

Real-time protection during agent runtime in Microsoft Defender reduces these risks by inspecting tool invocations before the agent runs any actions.

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An informative alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts.


This capability adds another security layer on top of Microsoft Copilot Studio, helping ensure AI agents remain resilient against evolving threats.

> [!NOTE]
> Real-time protection during agent runtime currently supports only AI agents created with Microsoft Copilot Studio custom agents.


## Prerequisites

Before enabling real-time agent protection during runtime, make sure:

- You have a valid Microsoft Defender for Cloud Apps license.

- You have Security Administrator privileges in the Microsoft Defender portal.


> [!NOTE]
> The onboarding process for real-time protection during agent runtime involves configuration in Power Platform and collaboration with other administrators.
> 
> [!IMPORTANT]
> This feature is currently in preview and included with your Microsoft Defender for Cloud Apps license at no extra cost. Licensing requirements might change when the feature becomes generally available. If that happens, the feature will be disabled, and you'll be notified should you wish to re-enable it under the new license.

## Turn on real-time protection during agent runtime

The following steps describe the Security Administrator’s required actions to enable real-time protection during agent runtime.

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Navigate to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Check the Microsoft 365 App Connector status:
   - **If the connector is already connected:** Continue to step 5.
   - **If the connector isn’t connected:**
      - Under **Microsoft 365 connector**, select **Connect** or **Edit**.
      - Select **Microsoft Entra ID Management events** and **Microsoft 365 activities**. 
      - Select **Connect Microsoft 365**.

    > [!IMPORTANT]
    > If the Microsoft 365 connector isn’t properly connected, real-time agent protection during runtime continues to block suspicious activity on the AI agent. Alerts and incidents related to these actions won't show in the Microsoft Defender portal.

1. Enter the App ID provided by your Power Platform administrator and select **Save**.
      :::image type="content" source="media/protect-agents-real-time/turn-on-real-time-agent-protection.png" alt-text="Screenshot that shows how to turn on Real time agent protection during runtime in the Defender portal." lightbox="media/protect-agents-real-time/turn-on-real-time-agent-protection.png":::

    > [!IMPORTANT]
    > - Completing the onboarding process requires collaboration with a Power Platform administrator. The onboarding instructions on the Power Platform side are specified here: [Enable external threat detection and protection for Copilot Studio custom agents](/microsoft-copilot-studio/external-security-provider#step-2-configure-the-threat-detection-system).
    > - The application ID that the Power Platform administrator needs to provide is this [Microsoft Entra ID application](/microsoft-copilot-studio/external-security-provider#step-1-configure-microsoft-entra-application).
    > - To allow the Power Platform administrator to complete the onboarding steps, share the URL provided in the Defender portal with them.
    
1. No further action is needed on your part. Once the Power Platform administrator completes the onboarding steps on their side, you’ll see a green **Connected** status.


## Related articles

- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/fundamentals-get-started)
