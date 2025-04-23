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

Phishing remains one of the most common ways attackers gain initial access. It also represents one of the highest-volume challenges security operations center (SOC) teams face, due to the large number of user-reported suspicious emails that must be investigated daily.

To help security teams address phishing efficiently, Microsoft Security Copilot is introducing the Phishing Triage Agent in Microsoft Defender. This AI-powered virtual agent is designed to scale security teams' response in triaging and classifying user-submitted phishing incidents, allowing organizations to improve their efficiency by reducing manual effort and streamlining their phishing response.

The Phishing Triage Agent uses advanced large language model-based analysis to understand the content of reported emails and autonomously determine whether a submission is a genuine phishing attempt or a false alarm. Unlike rule-based systems, it does not rely on predefined input or code to operate. Instead, it applies dynamic reasoning to analyze and act on incoming reports at scale.

By removing false positives from the queue, the agent significantly reduces the team's manual workload and allows them to focus on higher-priority tasks. With this automation, security teams can more efficiently process hundreds or thousands of phishing submissions, accelerating detection and response for incidents that require immediate attention

## Overview

The Phishing Triage Agent is designed to scale your security operations teams' processes in classifying and triaging user-submitted phishing incidents. Some of the agent’s highlights include:

- It operates autonomously. The Phishing Triage Agent leverages advanced AI tools to perform sophisticated assessments and determine whether a phishing submission is a real threat or a false alarm, without requiring step-by-step human input or code.
- It provides a transparent rationale for its classification verdicts in natural language, including the reasoning behind its decisions and the evidence it used to arrive at those conclusions. It also shows a visual representation of its reasoning process for every decision.
- It continuously learns and improves its accuracy based on feedback provided by analysts. Over time, this feedback loop fine-tunes the agent’s behavior, aligning it more closely with organizational nuances and reducing the need for manual verification.

### Trigger

The Phishing Triage Agent is triggered when a user in your organization submits a phishing incident. The agent automatically analyzes email content to classify them as either phishing or not phishing based on its training and the context of the organization.

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

|Components|Details|
|:---|:---|
|Licenses|- A tenant must have a license for Security Copilot. See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information </br> - A tenant must have any of the following licenses deployed: - Microsoft Defender for Office Plan 2 </br> - Microsoft 365 E5|
|Accessing the agent|- A tenant must have access to the Microsoft Defender portal </br> - Unified role-based access control (URBAC) must be enabled in your organization. See [Unified role-based access control (URBAC)](manage-rbac.md) for more information|
|Roles required|- **Security Administrator** role is required to set up and manage the Phishing Triage Agent </br> - Users with the same permissions as the agent can view the agent's output|
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

The Phishing Triage Agent requires an identity to run. You can connect it to an existing user account that has the required permissions. Connecting the agent to a user account requires authentication that expires after 90 days. You must reauthenticate the agent every 90 days to maintain its access.

> [!TIP]
> Microsoft recommends creating and using a dedicated user account for the agent with the minimum required permissions.

### Products

The tenant must have Microsoft Defender for Office 365 with *Monitor reported messages in Outlook* and submissions alert policy turned on.

### Plugins

The following plugins must be enabled in Security Copilot:

- Microsoft Defender XDR
- Microsoft Threat Intelligence
- Phishing Triage Agent

## Set up and manage the Phishing Triage Agent

> [!NOTE]
> Setup and management of the Phishing Triage Agent is only available to users with the **Security Administrator** role.

To set up the Phishing Triage Agent, follow these steps:

1. Sign in to the Microsoft Defender portal as a Security Administrator and navigate to the incidents queue.

2. Look for the Phishing Triage card above the queue, then select **Set up agent**.

   [SCREENSHOT]

3. In the **Overview** page of Agents settings, select **Set up** to start the setup process.

4. Read the information about the Phishing Triage Agent and select **Set up**.

   [SCREENSHOT]

5. Connect the agent to an identity for the agent to run with the required permissions. Select **Connect an existing user account** for the agent to run in the context of the identity you associate with it. Select **Continue**.

6. Select **Assign user** and follow the prompts to sign in to the user account you want to connect to the agent.

   [SCREENSHOT]

7. After signing in, assign the identity an appropriate role to grant it the required permissions. To create a role and manage the agent's access, see [Create a custom role](create-custom-rbac-roles.md#create-a-custom-role).

8. Select **Deploy agent** to create the agent identity.

9. Select **View incidents** to navigate to the incidents queue. The Phishing Triage Agent is now set up and running in the background, ready to triage user-submitted phishing incidents.

   [SCREENSHOT]

To manage the Phishing Triage Agent, follow these steps:

1. Select **Manage agent** in the agent card above the incident queue. Alternatively, you can navigate to **Settings > Microsoft Defender XDR**.

2. Under **Agents**, select **Overview**. You can manage the agent by selecting **Pause** or **Remove the agent**.

   [SCREENSHOT]

3. Under **Identity and role**, you can view the agent's identity, last update information, and the option to select a different identity for the agent.

    [SCREENSHOT]

4. Under **Agent feedback**, you can view all the feedback provided to the agent, including the agent's lesson, agent classification, classification change, users who provided feedback, the date of the feedback, and the incident ID.

    [SCREENSHOT]

5. To review each feedback, select the feedback item from the list. In the **Review feedback** pane, review the details and decide to keep or reject the feedback. If you keep the feedback, the agent continues to use the feedback to improve its classification. If you reject the feedback, select **Reject feedback**.

    [SCREENSHOT]

## Assess and provide feedback on the agent's output

Users can review the Phishing Triage Agent's triaged incidents, provide feedback on the actions taken by the agent, and assess the agent's overall performance in terms of total incidents resolved and mean time to resolve.

### Review triaged incidents

After setting up the Phishing Triage Agent, it automatically runs in the background and begins to triage user-submitted phishing incidents. You can filter the queue for incidents with the **Agent** tag to view the incidents triaged by the agent.

[SCREENSHOT]

Select an incident to review. In the incident page, look for the Phishing Triage Agent activity in the Copilot side panel.

[SCREENSHOT]

### Provide feedback to the agent

Review the agent's classification verdict and reason. If the agent's classification does not align with your parameters, select **Change classification**.

[SCREENSHOT]

Selecting this option opens the Manage alert pane where you can provide the classification and add comments. You can explain your reasoning to the agent using natural language. Once you’re done, select **Use this feedback to teach the agent option** to improve the agent's subsequent responses so they’re better aligned with your organization’s context.

[SCREENSHOT]

To learn more about the agent’s actions before arriving at a classification, select **View agent activity** in the Phishing Triage Agent card.

[SCREENSHOT]

You can view all the actions taken by the agent and follow how the agent validates its action step by step in the Activity pane.

[SCREENSHOT]

You can also provide feedback to Copilot in the Copilot pane by selecting the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards](/defender/media/copilot-in-defender/create-report/copilot-defender-feedback.png) located at the bottom of the Phishing Triage Agent card. Based on your assessment of Copilot's response, you can select **Looks right**, **Needs improvement**, or **Inappropriate**. Add comments to provide more context for your feedback.

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

Yes. You can pause the agent or remove it at any time in the Overview page in Agent settings. To do this, navigate to **Settings > Microsoft Defender XDR**. In the **Overview** page under **Agents**, select **Pause** or **Remove agent**.

Removing the agent does not revert any changes made to the incidents it triaged. The agent is no longer able to triage new incidents after its removal, but it retains the history of all incidents it triaged.

## Related content

- Microsoft Security Copilot Agents
- Responsible AI in Microsoft Security Copilot