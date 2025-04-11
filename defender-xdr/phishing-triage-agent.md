---
title: Phishing Triage Agent in Microsoft Defender
description: Learn about the Phishing Triage Agent, including requirements for setup and providing feedback to the agent.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: conceptual
search.appverid:
- MOE150
- MET150
ms.date: 04/28/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Defender for Office 365 Plan 2
---

# Phishing Triage Agent in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The Phishing Triage Agent in Microsoft Defender is an AI-powered agent designed to effectively manage user-submitted phishing incidents. It assists security operations center (SOC) teams in triaging phishing submissions, thereby reducing the workload and allowing them to focus on critical tasks.

Managing a huge volume of phishing incidents, which may include false alarms, can be challenging for SOC operations. Analysts need to ensure that these incidents are triaged and resolved efficiently and reliably so they can concentrate on more critical phishing incidents.

With the Phishing Triage Agent, SOC teams can benefit from a virtual agent capable of classifying hundreds of phishing submissions with speed and accuracy. The agent helps remove false alarms, enabling teams to resolve true positive phishing incidents more swiftly.

Phishing Triage adjusts to an organization’s context by actively seeking feedback and learning from its users. The agent provides a transparent rationale for its verdicts, ensuring its operations align with your organization’s established triage parameters. It dynamically adjusts by learning from the feedback it gets to operate according to your organization’s changing needs.

## What the Phishing Triage Agent does

The Phishing Triage Agent is designed to assist security operations teams in classifying and triaging user-submitted phishing incidents. The agent can help you with the following tasks:

- Classify phishing incidents based on user-submitted emails and attachments.
- Provide a transparent rationale for its classification verdicts, including the reasoning behind its decisions and the evidence it used to arrive at those conclusions.
- Learn from user feedback to improve its classification accuracy over time.
- Operate in the background, continuously triaging phishing incidents without requiring constant human intervention.

### Trigger

The Phishing Triage Agent is triggered when a user in your organization submits a phishing incident. The agent automatically analyzes the submitted email and its attachments, classifying them as either phishing or not phishing based on its training and the context of the organization.

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

- Access to Security Copilot. See purchase information to know the prerequisites for using Security Copilot
- Access to the Microsoft Defender portal
- The alert policy *Email reported by user as malware or phish* must be turned on. See Alert policies in the Microsoft Defender portal for more information

### Identity

The Phishing Triage Agent requires an identity to run. You can create the Phishing Triage Agent’s identity to access plugins and services and to operate with the correct permissions.

You can also select the agent’s identity from the following options:

- [options]

### Permissions

The Phishing Triage Agent requires the following permissions to run:

- Security data basics (read)
- Email & collaboration content (read)
- Email & collaboration metadata (read)
- Security Copilot (read)
- Alerts (manage)

### Roles

Users with Security Administrator or Microsoft Entra Admin roles are required to setup the Phishing Triage Agent. 

Users with the following roles can view the Phishing Triage Agent's output:

- [options]

### Products

The tenant must have any of the following licenses deployed:

- Microsoft Defender for Office 365 Plan 2
- Microsoft 365 E5

### Plugins

The following plugins must be enabled in Security Copilot:

- Microsoft Defender XDR
- Microsoft Threat Intelligence

## Set up the Phishing Triage Agent

To set up the Phishing Triage Agent, follow these steps:

1. Sign in to the Microsoft Defender portal as a Security Administrator and navigate to the incidents queue.
2. Look for the Phishing Triage Agent set up above the queue, then select **Set up agent**.
3. Assign permissions and roles to the agent by selecting **Create an agent identity**, then select Continue.
4. In the Agent identity roles, select a role for the agent. Ensure that the role has the required permissions to view and analyze emails.
5. Select **Deploy agent** to create the agent identity. The agent will be created and deployed in the background.

## Review the Phishing Triage Agent output

Users can review the Phishing Triage Agent’s triaged agents, actions taken in an incident, and overall performance in terms of total incidents resolved and mean time to resolve.

### Review triaged incidents

After setting up the Phishing Triage Agent, it will automatically run in the background and begin to triage user-submitted phishing incidents. You can filter the incident queue for incidents with the **Agent** tag to view the incidents triaged by the agent.

[SCREENSHOT]

Select an incident to review. In the incident page, look for the Phishing Triage Agent activity in the Copilot pane.

[SCREENSHOT]

Review the agent’s classification verdict and reason. If the agent’s classification does not align with your parameters, select **Change classification**. To learn more about the agent’s actions prior to arriving at a classification, select **View agent activity**.

[SCREENSHOT]

### Review the agent's actions

In the **Activity** tab of an incident page, you can view all the actions taken by the agent. You can follow how the agent validates its action per step.

[SCREENSHOT]

Select the final verdict to read about the agent’s reason, investigation details, email preview, and to view other evidence the agent has used for its verdict.

[SCREENSHOT]

You can **Change classification** on the final verdict card. Selecting this option opens the Manage alert pane where you can provide the classification and add comments. Tick the **Use this feedback to teach the agent** option to improve the agent’s subsequent responses.

[SCREENSHOT]

### Review the agent's performance

You can review the overall performance of the Phishing Triage Agent by navigating to the **Agents** page in the Microsoft Defender portal. The performance metrics include the total number of incidents triaged by the agent and the mean time to resolve. The numbers displayed are based on the last 30 days of data. Here's an example.

[SCREENSHOT]

## Providing feedback to the Phishing Triage Agent

The Phishing Triage Agent relies on your feedback on its output to continuously improve its triaging activities and match your triage parameters. We recommend that you regularly provide feedback to the agent to improve to ensure that it adapts to your organization’s specific needs.

There are two ways to provide feedback to the agent:

1. Select the thumbs up/thumbs down options on the Copilot card.
2. You can improve the agent's accuracy by providing feedback whenever you change an incident's classification. See [Review the agent's actions](#review-the-agents-actions) for the steps.

## Frequently asked questions (FAQs)

