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
ms.topic: concept-article
search.appverid:
- MOE150
- MET150
ms.date: 04/28/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Defender for Office 365 Plan 2
#customer intent: As a security analyst, I want to learn about the Phishing Triage Agent in Microsoft Defender so that I can triage and classify user-submitted phishing incidents efficiently.
---

# Phishing Triage Agent in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here.

Phishing remains one of the most common ways attackers gain initial access. The Phishing Triage Agent, a Microsoft Security Copilot agent designed to scale security teams' response in triaging and classifying user-submitted phishing incidents in Microsoft Defender, can help organizations address phishing efficiently. It assists security operations center (SOC) teams by autonomously triaging phishing submissions, determining whether they are genuine phishing attempts or false alarms. By alleviating the burden of reactive work, it reduces the team's manual workload and allows them to focus on critical tasks.

With the Phishing Triage Agent, SOC teams can benefit from an AI-powered virtual agent capable of classifying hundreds of phishing submissions with speed and accuracy. The agent also helps remove false alarms from the queue, enabling teams to identify and resolve true positive phishing incidents more swiftly.

Phishing Triage adjusts to an organization's context by actively seeking feedback and learning from its users. The agent provides a transparent rationale for its verdicts, ensuring its operations align with your organization's established triage parameters. It dynamically adjusts by learning from the feedback it gets to operate according to your organization's changing needs.

## Overview

The Phishing Triage Agent is designed to scale your security operations teams' processes in classifying and triaging user-submitted phishing incidents. Some of the agent’s highlights include:

- It operates autonomously. The Phishing Triage Agent leverages advanced AI tools to perform sophisticated assessments and determine whether a phishing submission is a real threat or a false alarm, without requiring step-by-step human input or code.
- It provides a transparent rationale for its classification verdicts in natural language, including the reasoning behind its decisions and the evidence it used to arrive at those conclusions. It also shows a visual representation of its reasoning process for every decision.
- It continuously learns and improves its accuracy based on feedback provided by analysts. Over time, this feedback loop fine-tunes the agent’s behavior, aligning it more closely with organizational nuances and reducing the need for manual verification.

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

### Products

The tenant must have the following products:

- Microsoft Defender for Office 365 Plan 2
- Microsoft Defender XDR

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

## Assess and provide feedback on the agent's output

Users can review the Phishing Triage Agent's triaged incidents, provide feedback on the actions taken by the agent, and assess the agent's overall performance in terms of total incidents resolved and mean time to resolve.

### Review triaged incidents

After setting up the Phishing Triage Agent, it automatically runs in the background and begins to triage user-submitted phishing incidents. You can filter the queue for incidents with the **Agent** tag to view the incidents triaged by the agent.

[SCREENSHOT]

Select an incident to review. In the incident page, look for the Phishing Triage Agent activity in the Copilot pane.

[SCREENSHOT]

### Provide feedback to the agent

Review the agent's classification verdict and reason. If the agent's classification does not align with your parameters, select **Change classification**.

[SCREENSHOT]

Selecting this option opens the Manage alert pane where you can provide the classification and add comments. You can explain your reasoning to the agent using natural language. Once you’re done, select **Use this feedback to teach the agent option** to improve the agent's subsequent responses so they’re better aligned with your organization’s context.

[SCREENSHOT]

To learn more about the agent’s actions before arriving at a classification, select **View agent activity** in the Phishing Triage Agent card.

[SCREENSHOT]

You can view all the actions taken by the agent and follow how the agent validates its action per step in the Activity pane.

[SCREENSHOT]

You can also provide feedback to Copilot in the Copilot pane by selecting the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards](/defender/media/copilot-in-defender/create-report/copilot-defender-feedback.png) located at the bottom of the Phishing Triage Agent card. Based on your assessment of Copilot's response, you can select **Looks right**, **Needs improvement**, or **Inappropriate**. Add comments to provide more context for your feedback.

### Review the agent's performance

You can review the overall performance of the Phishing Triage Agent by navigating to the **Agents** page in the Microsoft Defender portal. The performance metrics include the total number of incidents triaged by the agent and the mean time to resolve. The numbers displayed are based on the last 30 days of data. Here's an example.

[SCREENSHOT]

## Frequently asked questions (FAQs)

Following are responses to commonly asked questions about the Phishing Triage Agent. For information about the agent's capabilities and requirements, navigate to the [overview](#overview) and [prerequisites](#prerequisites) sections of this article.

### Why is the Phishing Triage Agent important?

Phishing remains one of the most common methods by which attackers gain initial access to systems. While security tools effectively block most threats, some still manage to slip through, overwhelming inboxes and leaving email users uncertain whether a suspicious email is a legitimate phishing attempt or harmless spam. This uncertainty often leads to an influx of user-submitted reports.

Consequently, managing these incidents becomes a tedious and repetitive task for SOC analysts. Each alert may require up to 30 minutes of manual triage, demanding significant effort to sift through a large volume of incidents in search of the genuine threat amidst all the noise. This effort overwhelms analysts, which have a limited amount of time to dedicate to competing and critical demands. 

By alleviating the burden of reactive work, the Phishing Triage Agent empowers analysts to focus on proactive security measures, ultimately strengthening organizations’ overall security postures.

### When is the agent triggered?

The agent runs automatically when a user submits a potential phishing email.

### How do I grant the agent access to plugins and services?

You can create an agent identity using a service principal and assign it to an appropriate Tier 1 equivalent RBAC role in your environment to manage agent access. Alternatively, you can connect it to an existing user account by logging in to manage access. Note that service principals are supported for public preview.

### Can the Phishing Triage Agent be trusted?

Microsoft AI agents follow strict Responsible AI guidelines and undergo thorough reviews to ensure compliance with all AI standards and safeguards. The Phishing Triage Agent is fully incorporated into these controls. 

During setup, the agent is assigned an identity and configured with the minimum required permissions for its operation, ensuring it is not over-permissioned. Furthermore, all agent activities are logged in detail, with the complete flow available for review by analysts and admins at any time. 

Feedback provided to the agent to help it adapt to the organization’s environment is logged, reflected in the system, and accessible for review and modification by admins as needed.

### Can I remove the Phishing Triage Agent?

Yes. You can disable the agent or remove it any time using the setup page.

Removing the agent does not revert any changes made to the incidents it triaged. The agent is longer able to triage new incidents, but retains the history of all incidents it triaged.

## Related content

- Microsoft Security Copilot Agents
- Responsible AI in Microsoft Security Copilot