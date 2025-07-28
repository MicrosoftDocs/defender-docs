---
title: Protect AI agents in real time
description: Learn how to enable and manage real-time runtime protection for Microsoft Copilot Studio AI agents using Microsoft Defender.
ms.date: 07/27/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
---

# Protect AI agents in real time (Preview)


This article describes how to enable real-time agent protection in Microsoft Defender for AI agents built using the Microsoft Copilot Studio custom engine.

> [!NOTE]
> Real-time agent protection currently supports only agents created with the Copilot Studio custom engine.

## Overview

As AI agents become increasingly accessible through low-code/no‑code (LCNC) platforms like Microsoft Copilot Studio, organizations are facing new types of security risks at scale. These platforms empower non‑technical users to build and deploy custom agents—often without centralized security review or controls in place. Copilot Studio agents can perform tasks such as summarizing emails or automating workflows using Microsoft 365 and other internal data sources. During runtime, attackers attempt to manipulate these agents by injecting malicious prompts, triggering unintended tool executions, or exploiting data sources to escalate privileges or exfiltrate data.

Real-time agent protection in Microsoft Defender reduces these risks by inspecting every user message before the agent acts. This evaluation occurs during runtime and helps block suspicious behavior without disrupting the end-user experience.

If Microsoft Defender determines that a request is suspicious:

- The tool invocation is blocked before it runs.
- The agent stops processing.
- The user is notified that their message was blocked.
- An alert is generated and appears in the Microsoft Defender portal under XDR Incidents and Alerts.

If no issues are detected, the agent continues operating as intended.

Microsoft Defender uses behavioral signals to identify and block:

- Misuse of tools
- Unexpected or unauthorized execution patterns
- Cross-prompt injection attempts (XPIA)
- Attempts to manipulate the agent's operational flow

This continuous monitoring helps protect AI agents at runtime.

## Prerequisites

Before enabling real-time agent protection, make sure:

- You have a valid Microsoft Defender license (included in Microsoft 365 E5 Security).

- You have Security Administrator privileges in the Microsoft Defender portal.

- A Power Platform Administrator is available to configure the integration on the Power Platform side.

- A Microsoft Entra ID application is registered for authentication.

- You must get the App ID from your Power Platform administrator.


## Turn on real time agent protection

Follow these steps to enable real-time agent protection in the Microsoft Defender portal:

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Navigate to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Under **Microsoft 365 connector**, select:
    1. **Microsoft Entra ID Management events**.
    1. **Microsoft 365 activities**.
For more details on how to set up the Microsoft 365 App Connector, see [Connect Microsoft 365 apps to Microsoft Defender](/defender-cloud-apps/protect-office-365).
1. Verify that the Microsoft 365 App Connector status shows **Connected**.
1. **Turn on Real time protection during agent runtime**:
    1. Enter the App ID provided by your Power Platform administrator.
    1. Select **Save**.
    1. Copy the URL provided.
    1. Share the URL with the Power Platform administrator. 

:::image type="content" source="media/protect-agents-real-time/turn-on-real-time-agent-protection.png" alt-text="Screenshot that shows how to turn on real time agent protection in the Defender portal." lightbox="media/protect-agents-real-time/turn-on-real-time-agent-protection.png":::

## Finalize configuration in Power Platform

The Power Platform administrator must use the provided URL to install and activate the Microsoft Defender plugin in the relevant environments.
For more information, see: 

> [!NOTE]
> If the Microsoft 365 connector is disabled or an error occurs, Microsoft Defender won't receive notifications when an agent or user action is blocked due to suspicious activity.

## Next steps 

- [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).