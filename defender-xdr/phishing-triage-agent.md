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

The Phishing Triage Agent is a Microsoft Security Copilot agent designed to scale security teams' response to efficiently triage and classify user-submitted phishing incidents in Microsoft Defender. It assists security operations center (SOC) teams by integrating with Microsoft security solutions to autonomously triage volumes of phishing submissions, reducing the team's manual workload and allowing them to focus on critical tasks and strategic actions.

Managing a huge volume of phishing incidents, which may include false positives, can be challenging for SOC operations. Analysts need to ensure that these incidents are triaged and resolved efficiently and reliably so they can concentrate on more critical phishing incidents.

With the Phishing Triage Agent, SOC teams can benefit from an AI-powered virtual agent capable of classifying hundreds of phishing submissions with speed and accuracy. The agent also helps remove false positives, enabling teams to resolve true positive phishing incidents more swiftly.

Phishing Triage adjusts to an organization’s context by actively seeking feedback and learning from its users. The agent provides a transparent rationale for its verdicts using natural language, using clear reasoning and explanations for its process. Through dynamic learning, the Phishing Triage ensures its alignment with your organization’s established triage parameters. It dynamically adjusts by learning from the feedback it gets to operate according to your organization’s changing needs.

## Overview

The Phishing Triage Agent is designed to scale your security operations teams' processes in the triage and classification of user-submitted phishing incidents. The agent can help you with the following tasks:

- Autonomously classify hundreds of phishing incidents based on user-submitted emails and attachments.
- Provide a transparent rationale for its classification verdicts in natural language, including the reasoning behind its decisions and the evidence it used to arrive at those conclusions.
- Learn from user feedback to improve its classification accuracy over time.
- Operate in the background to continuously triage phishing incidents without requiring constant human intervention.

### Trigger

The Phishing Triage Agent is triggered when a user in your organization submits a phishing incident. The agent automatically analyzes the submitted email and its attachments to classify them as either phishing or not phishing based on its training and the context of the organization.

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

|Components|Details|
|:---|:---|
|Licenses|- Tenant must have a license for Security Copilot. See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information </br> - Tenant must have any of the following licenses deployed: - Microsoft Defender for Office Plan 2 </br> - Microsoft 365 E5|
|Accessing the agent|- Tenant must have access to the Microsoft Defender portal </br> - Unified role-based access control (URBAC) must be enabled in your organization. See [Unified role-based access control (URBAC)](manage-rbac.md) for more information|
|Roles required|- **Security Administrator** role is required to set up the Phishing Triage Agent </br> - The following roles can access the Phishing Triage Agent output </br> - Role 1 </br> - Role 2|
|Alert policy|The alert policy **Email reported by user as malware or phish** must be turned on. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information|

The following requirements are needed when setting up the Phishing Triage Agent:

### Permissions

The Phishing Triage Agent requires the following permissions to run:

- Security data basics (read)
- Email & collaboration content (read)
- Email & collaboration metadata (read)
- Security Copilot (read)
- Alerts (manage)

### Identity

The Phishing Triage Agent requires an identity to run. You can create the Phishing Triage Agent’s identity to access plugins and services and to operate with the correct permissions.

You can also select the agent’s identity from the following options:

- [options]

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
5. Select **Deploy agent** to create the agent identity. The agent is created and deployed in the background.

## Review the Phishing Triage Agent output

Users can review the Phishing Triage Agent’s triaged agents, actions taken in an incident, and overall performance in terms of total incidents resolved and mean time to resolve.

### Review triaged incidents

After setting up the Phishing Triage Agent, it will automatically run in the background and begin to triage user-submitted phishing incidents. You can filter the incident queue for incidents with the **Agent** tag to view the incidents triaged by the agent.

[SCREENSHOT]

Select an incident to review. In the incident page, look for the Phishing Triage Agent activity in the Copilot pane.

[SCREENSHOT]

Review the agent’s classification verdict and reason. If the agent’s classification does not align with your parameters, select **Change classification**. To learn more about the agent’s actions before arriving at a classification, select **View agent activity**.

[SCREENSHOT]

### Review the agent's actions

In the **Activity** tab of an incident page, you can view all the actions taken by the agent. You can follow how the agent validates its action per step.

[SCREENSHOT]

Select the final verdict to read about the agent’s reason, investigation details, email preview, and to view other evidence the agent used for its verdict.

[SCREENSHOT]

You can **Change classification** on the final verdict card. Selecting this option opens the Manage alert pane where you can provide the classification and add comments. Tick the **Use this feedback to teach the agent** option to improve the agent’s subsequent responses.

[SCREENSHOT]

### Review the agent's performance

You can review the overall performance of the Phishing Triage Agent by navigating to the **Agents** page in the Microsoft Defender portal. The performance metrics include the total number of incidents triaged by the agent and the mean time to resolve. The numbers displayed are based on the last 30 days of data. Here's an example.

[SCREENSHOT]

## Provide feedback to the Phishing Triage Agent

The Phishing Triage Agent relies on feedback on its output to continuously improve its triage activities and ensure that it adapts to your organization's evolving security needs. You can provide feedback to the agent in the following ways:

1. You can provide feedback on the agent's classification verdict by selecting **Change classification** in the incident page. This opens the Manage alert pane where you can provide the classification and add comments. Tick the **Use this feedback to teach the agent** option to improve the agent’s subsequent responses.
2. Select the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards.](/defender/media/copilot-in-defender/copilot-defender-feedback.png) located at the bottom of the Phishing Triage Agent card in the Copilot pane. Based on your assessment, you can select **Looks right**, **Needs improvement**, or **Inappropriate**. Add comments to provide more context about your feedback.

## Frequently asked questions (FAQs)

Following are responses to commonly asked questions about the Phishing Triage Agent. For information about the agent's capabilities and requirements, navigate to the [overview](#overview) and [prerequisites](#prerequisites) sections of this article.

### Can I remove the Phishing Triage Agent?

Yes. You can disable the agent or remove it any time using the setup page.

Removing the agent does not revert any changes made to the incidents it triaged. The agent is longer able to triage new incidents, but retains the history of all incidents it triaged.

## Related content

- Microsoft Security Copilot Agents
- Responsible AI in Microsoft Security Copilot