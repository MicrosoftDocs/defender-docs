---
title: Discover and detect threats on your AI agents (Preview)
ms.author: abbyweisberg
author: AbbyMSFT
description: Learn how to view all of the AI Agents in your organization using Microsoft Defender.
ms.date: 11/02/2025
ms.topic: how-to
ms.service: defender-for-cloud-apps
ms.reviewer: gayasalomon
#customer-intent: As a security administrator, I want view all of the AI Agents in my organization, and detect threats on my AI agents using advanced hunting.
---

# Discover and protect your Copilot Studio custom AI Agents (Preview)

Microsoft Defender detects all Copilot Studio custom AI Agents in your tenant and identify misconfigured or potentially risky agents.

When you enable detection of your AI agents, Microsoft Defender for Cloud Apps populates the [AIAgentsInfo table](/defender-xdr/advanced-hunting-aiagentsinfo-table) which can be used in [advanced hunting](/defender-xdr/advanced-hunting-overview).

## Enable AI agent detection for Microsoft Copilot Studio custom agents

> [!NOTE]
> The onboarding process for AI Agent protection requires collaboration with Power Platform administrators.
To enable AI agent detection for your Microsoft Copilot Studio agents, follow these steps:

1. **Sign in to the [Microsoft Defender portal](https://security.microsoft.com)**:
1. Go to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. Turn on **Copilot Studio AI Agents**. Enabling Copilot Studio AI Agents allows Microsoft Defender to start discovering AI agents in your environment.

    :::image type="content" source="media/protect-ai-agents/copilot-studio-ai-agents-button.png" alt-text="Screenshot of the Copilot Studio AI Agent configuration toggle.":::

1. Work together with the Power Platform administrator to complete these steps in the [Power Platform Portal](https://admin.preview.powerplatform.microsoft.com/security/threatdetection):  
    1. Select **Microsoft Defender - Copilot Studio AI Agents**.
    1. Turn on **Enable Microsoft Defender - Copilot Studio AI Agents**.

When Copilot Studio AI Agents are connected, a green indicator appears in the **AI Agents Inventory** section. It can take up to 30 minutes for the initial connection status to update. Depending on the size and complexity of your environment, it might take longer to see the full deployment of the AI agent inventory.

## Detect threats on your Microsoft Copilot Studio AI agents 

Once you enable AI agent protection on your AI agents created using Copilot Studio, enable the Microsoft 365 App Connector to:
- Run detections on your AI Agents created using Copilot Studio
- Create alerts and incidents for suspicious activity

To enable threat detection and alerts, connect Microsoft Defender for Cloud Apps to Microsoft 365:

1. Complete the steps in Microsoft 365 to [Connect Defender for Cloud Apps with Microsoft 365](protect-office-365.md#connect-microsoft-365-to-microsoft-defender-for-cloud-apps).
1. When you complete the Microsoft 365 connector setup, sign in to the **[Microsoft Defender portal](https://security.microsoft.com)**, and go to **System > Settings > Cloud Apps > Copilot Studio AI Agents**.
1. In the **Microsoft 365 connector** section, select **Connect** or **Edit**.
1. Select **Microsoft Entra ID Management events** and **Microsoft 365 activities**. 
1. Select **Connect Microsoft 365**.
    
    When the Microsoft 365 connector is connected, a green **Connected** status appears in the **Microsoft 365 connector** section.


## Use Advanced Hunting on your AI agents

When the Microsoft 365 app connector is enabled, you can use advanced hunting to help identify misconfigured or risky agents and minimize organizational exposure to potential threats.

1. Sign in to the Defender portal, ang go to **Advanced hunting**.
1. In the **Apps & identities** section, the [AIAgentsInfo](/defender-xdr/advanced-hunting-aiagentsinfo-table) contains data for all your custom AI agents created using Copilot Studio. You can use this data to create custom queries.
1. In the **Queries** tab, see the **MCS AI Agents** section for pre-defined KQL queries to help identify misconfigured or risky agents.

    For example, you can use queries to: :
    - locate agents that use maker authentication mechanisms, which might allow access to data users shouldn't have
    - locate agents that haven't been used for over 30 days, as these may create unnecessary exposure without contributing to productivity. 

We recommend deleting risky agents or reaching out to their owners for further information.
 
See [Proactively hunt for threats with advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview) to learn how to use queries to proactively hunt for threats.

 