---
title: Security Copilot Phishing Triage Agent in Microsoft Defender
description: Learn about the Security Copilot Phishing Triage Agent, including requirements for setup and providing feedback to the agent.
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
ms.topic: how-to
search.appverid:
- MOE150
- MET150
ms.date: 04/28/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Defender for Office 365 Plan 2
#customer intent: As a security analyst, I want to learn about the Phishing Triage Agent in Microsoft Defender so that I can triage and classify user-submitted phishing incidents efficiently.
---

# Microsoft Security Copilot Phishing Triage Agent in Microsoft Defender

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

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

|Components|Details|
|:---|:---|
|Products|- An active subscription to Security Copilot and provision capacity in Security Compute Units (SCU) to power Security Copilot workload. See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information </br> - Microsoft Defender for Office Plan 2 deployed|
|Microsoft Defender required features|- Unified role-based access control (URBAC) must be enabled in your organization. See [Unified role-based access control (URBAC)](manage-rbac.md) for more information </br> - *Monitor reported messages in Outlook* must be turned on </br> - The alert policy **Email reported by user as malware or phish** must be turned on. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information|
|Security Copilot plugins required|The following plugins must be enabled in Security Copilot: </br> - Microsoft Defender XDR </br> - Microsoft Threat Intelligence </br> - Phishing Triage Agent|

## Set up the Phishing Triage Agent

> [!NOTE]
> Setup and management of the Phishing Triage Agent is only available to users with the **Security Administrator** role.

### Create the agent's identity and assign permissions

The Phishing Triage Agent operates in the context of the identity you associate with it. Creating the agent's identity and assigning the appropriate permissions to the agent is the required before starting the setup.

#### Identity

The Phishing Triage Agent uses as identity to access the data it needs to perform its tasks. For the agent, Microsoft recommends creating a **Microsoft Entra user** in the Microsoft Entra admin center and assigning the user the **Security Reader** role.

> [!TIP]
> Microsoft recommends creating and using a dedicated user account for the agent with the minimum required permissions.
> When creating the user account, ensure to assign a distinct display name, for example *Phishing triage agent*, to help identify the account in the Microsoft Defender portal.

Once the user is created, you can connect it to an existing user account that has the required permissions. In the initial setup, you can select **Connect an existing user account** to connect the agent to a user account and sign in to the user account.

Connecting the agent to a user account requires authentication that expires after 90 days. You must reauthenticate the agent every 90 days to maintain its access.

#### Permissions

After creating the agent's identity, you must assign it the appropriate permissions to access the data it needs to perform its tasks. To assign a role, see [Create a custom role](create-custom-rbac-roles.md#create-a-custom-role).

The Phishing Triage Agent requires the following permissions to run:

- Security data basics (read)
- Email & collaboration content (read)
- Email & collaboration metadata (read)
- Security Copilot (read)
- Alerts (manage)

> [!TIP]
> Microsoft recommends setting the agent with the aforementioned minimum required permissions.
> Users who have the same permissions as the agent can monitor the agent and view its output. However, they cannot manage the agent or change its settings.

### Begin the setup

Once the agent's identity is created and the appropriate permissions are assigned, you can begin the setup process.

You can access the Phishing Triage Agent setup from the **Incidents** queue in the Microsoft Defender portal. Select **Set up** to start the setup process.

[SCREENSHOT]

You can also access the Phishing Triage Agent setup from the **Settings > Microsoft Defender XDR** page in the Microsoft Defender portal. Under **Agents**, select **Overview**, then select **Set up** to start the setup process.

[SCREENSHOT]

Follow the steps in the setup wizard to complete the setup. The setup process includes the following steps:

1. Select the identity to assign to the agent.
2. Follow the prompts to sign in to the user account you want to connect to the agent.

   [SCREENSHOT]

3. Select **Deploy agent** to set up the agent.

   > [!NOTE]
   > You can change the agent's identity and role at any time. To do this, navigate to **Settings > Microsoft Defender XDR**. Under **Agents**, select **Identity and role**.

4. Select **View incidents** to navigate to the incidents queue. The Phishing Triage Agent is now set up and running in the background, ready to triage user-submitted phishing incidents.

   [SCREENSHOT]

### Troubleshooting setup issues

If you encounter issues during the setup process, check the following:

- Ensure that the agent's identity has the required permissions to access the data it needs to perform its tasks.
- Ensure that you have the necessary permissions to set up the agent. You must have the **Security Administrator** role to manage the agent.
- Ensure that the tenant has the required products enabled to use the agent. The tenant must have Microsoft Defender for Office 365 Plan 2 and must be provisioned with access to Security Copilot.
- Ensure that the Microsoft Defender required features are enabled in your organization. Unified role-based access control (URBAC) must be enabled, and the alert policy **Email reported by user as malware or phish** must be turned on.

## Manage the Phishing Triage Agent

The Phishing Triage Agent's settings can be managed from the **Settings > Microsoft Defender XDR** page in the Microsoft Defender portal. 

### Manage the agent settings

You can manage the agent settings from the **Overview** page under **Agents**. The following options are available:

- **Pause**: Temporarily pause the agent. The agent will not triage new incidents while paused.
- **Remove agent**: Permanently remove the agent. The agent will no longer triage new incidents, but it retains the history of all incidents it triaged.

   [SCREENSHOT]

### Manage the agent identity and role

You can manage the agent's identity and role from the **Identity and role** page under **Agents**. In this page, you can view the agent's identity, last update information, and the option to select a different identity for the agent.

   [SCREENSHOT]

### Manage feedback to the agent

You can manage feedback provided to the agent from the **Agent Feedback** page under **Agents**. In this page, you can view all the feedback provided to the agent, including the agent's lesson, agent classification, classification change, users who provided feedback, the date of the feedback, and the incident ID.

   [SCREENSHOT]

To review each feedback, select the feedback item from the list. In the **Review feedback** pane, review the details and decide to keep or reject the feedback. If you keep the feedback, the agent continues to use the feedback to improve its classification. If you reject the feedback, select **Reject feedback**.

   [SCREENSHOT]

## Working effectively with the Phishing Triage Agent

Once the Phishing Triage Agent is fully setup and running, it's triggered when a user in your organization submits a phishing incident. The agent automatically analyzes email content, classifying the incident as either phishing or not phishing based on its training and the context of the organization.

Users can review the Phishing Triage Agent's triaged incidents and continuously enhance the agent's learning capabilities by providing feedback on the actions taken by the agent.

### Reviewing the agent's triaged incidents

After setting up the Phishing Triage Agent, it automatically runs in the background and begins to triage user-submitted phishing incidents. You can review your incident queue to see all the phishing incident submissions that the agent has swiftly resolved. Filter the queue for incidents with the **Agent** tag to view the incidents triaged by the agent.

[SCREENSHOT]

To see how the agent triaged and classified a phishing incident, select an incident from the queue to review. In the incident page, look for the Phishing Triage Agent card in the Copilot side panel.

[SCREENSHOT]

The Phishing Triage Agent card provides a classification verdict and the reasoning behind it using natural language, simplifying the process of understanding the agent's decision-making.

### Refining the agent through contextual feedback

You can provide feedback to the Phishing Triage Agent to help it learn and improve its classification accuracy. This feedback is essential for the agent to adapt to your organization's specific context and enhance its performance over time.

If the agent's classification does not align with your criteria, select **Change classification** in the Phishing Triage Agent card.

[SCREENSHOT]

Selecting this option opens the Manage alert pane where you can change the classification and add additional context through comments using natural language. Select **Use this feedback to teach the agent option** to improve the agent's subsequent responses so they’re better aligned with your organization’s context.

[SCREENSHOT]

To learn more about the agent’s actions before arriving at a classification, select **View agent activity** in the Phishing Triage Agent card.

[SCREENSHOT]

You can view all the actions taken by the agent and follow how the agent validates its action step by step in the Activity pane.

[SCREENSHOT]

You can also provide feedback to Copilot in the Copilot side panel by selecting the feedback icon ![Screenshot of the feedback icon for Copilot in Defender cards](/defender/media/copilot-in-defender/create-report/copilot-defender-feedback.png) located at the bottom of the Phishing Triage Agent card. Based on your assessment of Copilot's response, you can select **Looks right**, **Needs improvement**, or **Inappropriate**. Add comments to provide more context for your feedback.

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