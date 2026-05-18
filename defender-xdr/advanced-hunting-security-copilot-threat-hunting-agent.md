---
title: Microsoft Security Copilot Threat Hunting Agent in advanced hunting
description: Learn how Microsoft Security Copilot threat hunting agent can help you investigate threats using natural language.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - security-copilot
  - magic-ai-copilot
ms.custom:
- cx-ti
- cx-ah
ms.topic: how-to
ms.date: 12/08/2025
appliesto:
- Microsoft Defender
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Microsoft Security Copilot Threat Hunting Agent in advanced hunting (preview)

[!INCLUDE [Prerelease](../includes/prerelease.md)]

The Microsoft Security Copilot Threat Hunting Agent is an AI-powered agent that revolutionizes threat hunting by enabling you to investigate threats using natural language from start to finish. Unlike traditional hunting methods that rely heavily on Kusto query language (KQL) expertise, the Threat Hunting Agent transforms complex data into actionable insights quickly and intuitively, helping you drive the investigation into actions.

The Threat Hunting Agent goes beyond query generation by delivering a complete, conversational threat hunting experience. It not only generates queries but also interprets results, surfaces insights, and guides you through full hunting sessions. These capabilities empower analysts of all levels to hunt threats faster, more accurately, and with greater confidence.

Watch this video to get an overview of the Threat Hunting Agent:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=74ef2c98-5dc7-406b-9b30-25e158ced334]

## Key capabilities
- **Natural language question to natural language answer.** Ask any data-related question in natural language (for example, *Which devices communicated with IPs in France in the last 24 hours?*) and receive direct conversational answers backed by KQL queries and tabular results. 

- **Conversational flow.** The agent keeps track of context throughout your hunting session, enabling you to ask follow-up questions that build on previous ones and ensuring continuity across the entire session.

- **Observations.** The agent provides natural language observations and charts (pie, timeline, or vertical bar) to simplify result analysis. It selects relevant chart fields automatically, but you can change the chart type or grouping afterward.

- **Insight generation.** The agent surfaces additional contextual insights from related data sources to enrich your investigation, helping you discover connections and patterns that might otherwise be missed.

- **Smart suggestions.** The agent provides dynamic follow-up questions and remediation actions recommendations, in the context of the investigation, to drive your hunting session forward. These suggestions are available for selection only after the response generation. They're not available for selection when you ask a new question.

- **Integrated experience.** The agent's outputs are directly added to Advanced hunting components, with generated KQL placed in the editor and results displayed as usual. This gives users full access to all advanced hunting features during investigations, ensuring maximum flexibility.

## Try your first request
To start using the Threat Hunting Agent, follow these steps:

>[!NOTE]
> Make sure that the Threat Hunting Agent mode is active. [Learn more](advanced-hunting-security-copilot.md#get-access)

1. Open the **Advanced hunting** page from the navigation bar in Microsoft Defender portal. The Security Copilot side pane for advanced hunting appears at the right hand side.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-pane-big.png" alt-text="Screenshot of the Copilot pane in advanced hunting." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-pane-big.png":::

    You can also reopen Copilot by selecting **Copilot** at the top of the query editor.

1.	Start your hunting session by selecting a suggested prompt or typing a question in natural language in the prompt bar and pressing :::image type="icon" source="./media/advanced-hunting-security-copilot/Send.png" border="false"::: or Enter.


**Sample questions you can ask the agent:**
  - Give me the list of users who sent more than 100 emails in the last 30 days.
  - Show me all failed sign-in attempts for admin accounts this week.
  - Which devices communicated with suspicious domains today?

The agent supports all types of hunting scenarios, including:
- Investigating an alert or incident
- Investigating a suspicious indicator of compromise (IOC)
- Investigating the impact of an attack reviewed in a threat intelligence report
- Proactively validating a security hypothesis

## Understand the response
When the Threat Hunting Agent responds to your question, you get a comprehensive answer that includes:

- **Direct conversational answer:** A natural language response to your question is displayed in the Copilot side pane.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-answer.png" alt-text="Screenshot of the Copilot pane in advanced hunting with the answer highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-answer.png":::

- **KQL query and results:** The underlying KQL query is generated and run automatically, with the results displayed in the advanced hunting results pane and seamlessly integrated into the experience.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-query.png" alt-text="Screenshot of the advanced hunting page with query and results highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-query.png"::: 

- **Explanation of how the query was built:** To check how Copilot came up with the query, select **See the logic behind the query** below the query.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-logic.png" alt-text="Screenshot of the Copilot pane in advanced hunting with the logic behind the query highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-logic.png":::

- **Observations:** Data highlights and a chart are displayed above the results, simplifying results analysis. You can change the chart type or field grouping.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-chart.png" alt-text="Screenshot of the advanced hunting page with Copilot-generated chart highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-chart.png":::

- **Contextual insights:** Additional insights derived from various appropriate resources are displayed in the Copilot side pane as part of the natural language response.

    :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-insights.png" alt-text="Screenshot of the Copilot pane in advanced hunting with insights highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-insights.png":::

- **Smart follow-up suggestions:** Recommended next questions or actions are displayed at the bottom of the Copilot side pane to help drive your hunt in the right direction:

    - **Follow-up question suggestions** appear and the bottom of the side pane, above the prompt. Select one of the questions to run it automatically. 

      :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-suggestions.png" alt-text="Screenshot of the Copilot pane in advanced hunting with follow-up suggestions highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-suggestions.png":::

    - You might also get **Action suggestions** in case a remediation action is recommended and needed in the context of your investigation. When you select a suggestion, the **Take actions** wizard opens with the action type and targeted entities already filled out. Complete the wizard to apply the suggested action. 

      :::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-take-action.png" alt-text="Screenshot of the Copilot pane in advanced hunting with action suggestion highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-take-action.png":::

      >[!NOTE]
      >You can only select the action suggestions for the last response in the conversation. If you send another question, the previous action suggestions are disabled.  
 
## Continue your investigation
After receiving a response, you can continue your hunting session in several ways:
- **Ask follow-up questions:** The agent maintains context from your session history.
- **Request query modifications:** Ask the agent to modify the generated query.
- **Select suggested actions:** Choose from the follow-up questions or actions suggested by the agent.
- **Use advanced hunting features:** Save your query, export results, create a detection rule, or use any of the other advanced hunting features for the KQL query displayed in the editor and the generated results.

## Start a new session
To start a new hunting session, select the **New chat (+)** icon at the top of the Copilot side pane.

>[!NOTE]
> Starting a new session deletes all chat history, which isn't saved.

## Provide feedback
You can provide feedback directly in the portal by selecting the feedback icon and choosing your response. Your feedback helps improve the Threat Hunting Agent's capabilities and accuracy.

:::image type="content" source="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-feedback.png" alt-text="Screenshot of the advanced hunting page with Copilot feedback buttons highlighted." lightbox="./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-agent-feedback.png":::

>[!TIP]
> Providing detailed feedback about what worked well or what could be improved helps us continuously enhance the Threat Hunting Agent experience.