---
title: Discover and detect threats using the AI agents inventory (Preview)
ms.author: abbyweisberg
author: AbbyMSFT
description: Learn how to view all of the AI Agents in your organization using Microsoft Defender.
ms.date: 04/14/2026
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
ai-usage: ai-assisted
#customer-intent: As a security administrator, I want view all of the AI Agents in my organization, and detect threats on my AI agents using advanced hunting.
---

# Discover and protect your Copilot Studio AI Agents (Preview)

Microsoft Defender detects all Copilot Studio custom AI agents in your tenant and provides tools to identify misconfigured or potentially risky agents, and collects data from Copilot Studio for use in [advanced hunting](/defender-xdr/advanced-hunting-overview).

## Prerequisites

To enable AI agent inventory and detection, you must:

- Have one of the following:
  - A Microsoft Agent 365 license.
  - Both a Microsoft Defender for Cloud Apps license and a Microsoft Copilot Studio license.

- Opt in to the [Microsoft Defender preview features](https://security.microsoft.com/securitysettings/defender/preview_features) of:
  - Microsoft Defender for Cloud
  - Microsoft Defender XDR

## Enable discovery of Copilot Studio AI agents

After you enable Security for AI, Microsoft Defender automatically discovers all Copilot Studio custom AI agents in your tenant. After discovery, you can view your agents in the [AI agent inventory](/defender-xdr/security-for-ai/ai-agent-inventory) and use [advanced hunting](/defender-xdr/advanced-hunting-overview) to investigate potential threats and misconfigurations.

> [!NOTE]
> The onboarding process for the AI agent inventory requires collaboration with Power Platform administrators.

To enable the Copilot Studio AI agent inventory, follow these steps:

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)** as the System Administrator.
1. Go to **System > Settings > Security for AI**.
1. Turn on **Security for AI Agents**. Enabling Copilot Studio AI Agents confirms that you read the disclaimer and agree to use the Microsoft Defender AI agent protection features.

    :::image type="content" source="media/protect-ai-agents/security-for-ai-agents-button.png" alt-text="Screenshot of the Security for AI agents configuration toggle.":::

1. Work together with the Power Platform administrator to complete these steps in the [Power Platform Portal](https://admin.preview.powerplatform.microsoft.com/security/threatdetection):
    1. Go to **Security** -> **Threat Protection**. 
    1. Select **Microsoft Defender - Copilot Studio AI Agents**.
    1. Turn on **Enable Microsoft Defender - Copilot Studio AI Agents**.

When Copilot Studio AI Agents are connected, a green indicator appears in the **AI Agents Inventory** section in the Microsoft Defender system settings. It can take up to 30 minutes for the initial connection status to update. Depending on the size and complexity of your environment, it might take longer to see the full deployment of the AI agent inventory. 

## Related articles

- [Protect your Copilot Studio custom AI Agents (Preview)](ai-agent-protection.md)
- [Enable real-time protection for Microsoft Copilot Studio Agents](real-time-agent-protection-during-runtime.md)
