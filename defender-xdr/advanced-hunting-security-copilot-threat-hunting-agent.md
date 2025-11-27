---
title: Microsoft Security Copilot threat hunting agent
description: Learn how Microsoft Security Copilot threat hunting agent can help you investigate threats using natural language.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - security-copilot
  - magic-ai-copilot
ms.custom:
- cx-ti
- cx-ah
ms.topic: how-to
ms.date: 12/01/2025
appliesto:
- Microsoft Defender
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Threat Hunting Agent

The Threat Hunting Agent is a GenAI-powered agent that revolutionizes threat hunting by enabling you to investigate threats using natural language from start to finish. Unlike traditional hunting methods that rely heavily on KQL expertise, the Threat Hunting Agent transforms complex data into actionable insights quickly and intuitively helping you driving the investigation into actions.

The Threat Hunting Agent goes beyond query generation by delivering a complete, conversational threat hunting experience. It not only generates queries but also interprets results, surfaces insights, and guides you through full hunting sessions - empowering analysts of all levels to hunt threats faster, more accurately, and with greater confidence.

## Key capabilities
- Natural language question to natural language answer. Ask any data-related question in natural language and receive direct conversational answers backed by KQL queries and tabular results. 
Example: "Which devices communicated with IPs in France in the last 24 hours?"

- Conversational flow. The agent maintains context throughout your hunting session and supports follow-up questions that build on previous queries, and the agent understands the session context.
- Observations. The Threat Hunting Agent provides natural language observations and charts (pie, timeline, vertical bar) to simplify result analysis. It automatically selects relevant chart fields, and you can change the chart type or grouping afterward.
- Insight generation. 
The agent surfaces additional contextual insights from related data sources to enrich your investigation, helping you discover connections and patterns that might otherwise be missed.

- Smart suggestions. Threat Hunting Agent provides dynamic follow-up questions and remediation actions recommendations, in the context of the investigation, to drive your hunting session forward. The suggestions are available for selection only after the response generation. When asking a new question, they would be disabled for selection.

- This is an integrated experience. Threat Hunting Agent outputs are directly added to Advanced hunting components, with generated KQL placed in the editor and results displayed as usual. This gives users full access to all Advanced hunting features during investigations, ensuring maximum flexibility.

## Getting started
1.	Open Advanced Hunting in Microsoft Defender portal.
2.	Look for the Copilot panel on the right side of the page.
3.	Ensure the Threat Hunting Agent mode is enabled, by clicking the 3 dots menu at the right side of the pane. 
4.	Start your hunting session by:
a.	Typing a question in natural language in the prompt bar, or
b.	Selecting a suggested prompt
c.	Using the Threat Hunting Agent

## Begin a hunting session
You can begin by asking a question in natural language. For example:
•	"Give me the list of users who sent more than 100 emails in the last 30 days"
•	"Show me all failed login attempts for admin accounts this week"
•	"Which devices communicated with suspicious domains today?"

The agent supports all types of hunting scenarios, including:
- Investigating an alert or incident
- Investigating a suspicious indicator of compromise (IOC)
- Investigating the impact of an attack reviewed in a threat intelligence report
- Proactively validating a security hypothesis

## Understand the response
When the Threat Hunting Agent responds to your question, you'll receive a comprehensive answer that includes:
- Direct conversational answer - A natural language response to your question displayed in the Copilot side pane

- KQL query and results - The underlying KQL query is automatically generated and executed, with results displayed in the Advanced Hunting results pane and seamlessly integrated into the experience
	 
- Explanation of how the query was built - To check how Copilot came up with the query, you can select See the logic behind the query below the query text to expand the explanation behind the query. Select it again to minimize.
	 
- Observations – above the results, data highlights and a chart will be displayed to simplify results analysis.

    It is possible to change the chart type or field grouping.
 
- Contextual insights - Additional insights derived from various appropriate resources, displayed in the side pane as part of the natural language response
	 
- Smart follow-up suggestions - Recommended next questions or actions displayed at the bottom of the side pane to help drive your hunt in the right direction

    - Follow-up question suggestions – appear and the bottom of the side pane, above the prompt. When clicking one of the suggestions it will be automatically executed. 

    - Action suggestions – Action suggestions won’t be provided for each response. Only in cases a remediation action is recommended and needed in the context of the investigation. When clicking on applying the suggestion the Take actions wizard would be opened, and auto-filled with the action type and targeted entities. The wizard would need to be completed to apply the action. 

        Note: action suggestions would be available for selection only for the last response in the conversation. After sending another question, the previous action suggestions would be disabled.  
 
## Continue your investigation
After receiving the initial response, you can continue your hunting session in several ways:
- Ask follow-up questions - The agent maintains context from your session history
- Request query modifications - Ask the agent to modify the generated query
- Select suggested actions - Choose from the follow-up questions or actions suggested by the agent
- Use Advanced Hunting features - Continue with any Advanced Hunting feature since the KQL query is in the editor and results are displayed: save your query, export results, create detection rule, and more

## Starting a new session
To start a fresh hunting session, click the + button at the top of the Copilot side pane.
>[!NOTE]
> Starting a new session will delete all chat history, which will not be saved.

## Provide feedback
You can provide feedback directly in the portal by selecting the feedback icon and choosing your response. Your feedback helps improve the Threat Hunting Agent's capabilities and accuracy.

>[!TIP]
> Providing detailed feedback about what worked well or what could be improved helps us continuously enhance the Threat Hunting Agent experience.
