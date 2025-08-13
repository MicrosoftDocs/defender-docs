---
title: Real-time protection during agent runtime for Microsoft Copilot Studio AI agents (Preview)
description: Learn how to enable and manage real-time runtime protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 08/12/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
#customer-intent: As a security administrator, I want my Copilot Studio AI agents to be protected against suspicious or harmful actions during runtime so that I can reduce security risks to my organization.
---

# Real-time protection during agent runtime for Microsoft Copilot Studio AI agents (Preview)


## Overview

As AI agents become increasingly accessible through low-code/no‑code (LCNC) platforms like Microsoft Copilot Studio, organizations face new types of security risks at scale. These platforms empower non‑technical users to build and deploy custom agents—often without centralized security review or controls in place. Attackers can attempt to manipulate these agents by injecting malicious prompts, triggering unintended tool executions, or exploiting data sources to escalate privileges or exfiltrate data.

## Capabilities

Real-time protection during agent runtime in Microsoft Defender reduces these risks by inspecting user messages before the agent runs any actions. 

If Microsoft Defender determines that a prompt is suspicious:

- The tool invocation is blocked before it runs.
- The user gets notified that their message was blocked.
- An informative alert is created and appears in the Microsoft Defender portal under XDR Incidents and Alerts.


This capability adds another security layer on top of Microsoft Copilot Studio, helping ensure AI agents remain resilient against evolving threats.

> [!NOTE]
> Real-time protection during agent runtime currently supports only AI agents created with Microsoft Copilot Studio custom engine.

## Prerequisites

Before enabling real-time agent protection during runtime, make sure:

- You have a valid Microsoft Defender for Cloud Apps license (included in Microsoft 365 E5 Security).

- You have Security Administrator privileges in the Microsoft Defender portal.

### Onboarding roles and responsibilities

A Power Platform administrator must complete onboarding steps on their side before real-time protection during agent runtime for Microsoft Copilot Studio AI agents can be enabled. The process also requires coordination with other administrator roles:

- **Microsoft Entra Administrator** — Create [a Microsoft Entra ID application](/entra/identity-platform/quickstart-register-app) and configure a Federated Identity Credential (FIC) using the URL provided in the Microsoft Defender portal. See [link].
- **Security Administrator** —  In the Microsoft Defender portal settings, enter the Application ID that you received from your Power Platform administrator.
- **Power Platform Administrator** — Enter both the Application ID and the URL from the Microsoft Defender portal in the Power Platform settings page. See [link].

> [!NOTE]
> - A Power Platform Administrator is required to complete the integration on the Power Platform side after initial configuration in Microsoft Defender.
> - [A Microsoft Entra ID application](/entra/identity-platform/quickstart-register-app) must be registered for authentication.

## Turn on real-time protection during agent runtime

Follow these steps to enable real-time protection during agent runtime in the Microsoft Defender portal:

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Navigate to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Check the Microsoft 365 App Connector status:
   - **If the connector is already connected:** Continue to step 4.
   - **If the connector isn’t connected:**
      - Under **Microsoft 365 connector**, select **Connect** or **Edit**.
      - Select **Microsoft Entra ID Management events** and **Microsoft 365 activities**. 
      - Select **Connect Microsoft 365**

    > [!IMPORTANT]
    > If the Microsoft 365 connector isn’t properly connected, real-time agent protection during runtime continues to block suspicious activity on the AI agent. Alerts and incidents related to these actions won't show in the Microsoft Defender portal.

1. Enter the App ID provided by your Power Platform administrator.
1. Select **Save**.
1. Copy the URL provided.
1. Share the URL with the Power Platform administrator. 

:::image type="content" source="media/protect-agents-real-time/turn-on-real-time-agent-protection.png" alt-text="Screenshot that shows how to turn on Real time agent protection during runtime in the Defender portal." lightbox="media/protect-agents-real-time/turn-on-real-time-agent-protection.png":::

## Finalize configuration in Power Platform

The Power Platform administrator must use the provided URL to activate the integration with Microsoft Defender. Once the integration is complete, you see a **Connected** status in the Microsoft Defender portal.
For more information, see:


