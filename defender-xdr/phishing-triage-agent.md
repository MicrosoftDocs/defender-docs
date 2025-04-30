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
ms.topic: concept-article
search.appverid:
- MOE150
- MET150
ms.date: 05/12/2025
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

The Phishing Triage Agent uses advanced large language model (LLM)-based analysis to understand the content of reported emails and autonomously determine whether a submission is a genuine phishing attempt or a false alarm. Unlike rule-based systems, it doesn't rely on predefined input or code to operate. Instead, it applies dynamic reasoning to analyze and act on incoming reports at scale.

By removing false alarms from the queue, the agent significantly reduces the team's manual workload and allows them to focus on higher-priority tasks. With this automation, security teams can more efficiently process hundreds or thousands of phishing submissions, accelerating detection and response for incidents that require immediate attention.

## Overview

Security Copilot brings together the power of AI and human expertise to help security teams respond to attacks faster and more effectively. Security Copilot is embedded in the Microsoft Defender portal to help provide security teams with enhanced capabilities to investigate and respond to incidents, hunt for threats, and protect their organization with relevant threat intelligence.

The Phishing Triage Agent is a [Security Copilot agent](/copilot/security/agents-overview) in Microsoft Defender designed to scale your security operations teams' processes in classifying and triaging user-submitted phishing incidents. Some of the agent’s highlights include:

- It operates autonomously. The Phishing Triage Agent leverages advanced AI tools to perform sophisticated assessments and determine whether a phishing submission is a real threat or a false alarm, without requiring step-by-step human input or code.
- It provides a transparent rationale for its classification verdicts in natural language, including the reasoning behind its decisions and the evidence it used to arrive at those conclusions. It also shows a visual representation of its reasoning process for every decision.
- It continuously learns and improves its accuracy based on feedback provided by analysts. Over time, this feedback loop fine-tunes the agent’s behavior, aligning it more closely with organizational nuances and reducing the need for manual verification.

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

|Components|Details|
|:---|:---|
|Products|- An active subscription to Security Copilot and provisioned capacity in Security Compute Units (SCU) to power Security Copilot workload. See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information </br> - Microsoft Defender for Office 365 Plan 2 deployed|
|Microsoft Defender required features|- Unified role-based access control (URBAC) must be enabled in your organization. See [Unified role-based access control (URBAC)](manage-rbac.md) for more information </br> - *Monitor reported messages in Outlook* is configured. See [User reported settings](/defender-office-365/submissions-user-reported-messages-custom-mailbox) for more information </br> - The alert policy **Email reported by user as malware or phish** must be turned on. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information|
|Security Copilot plugins required|The following [Microsoft plugins](/copilot/security/plugin-overview#microsoft-plugins) must be enabled in Security Copilot: </br> - Microsoft Defender XDR </br> - Microsoft Threat Intelligence </br> - Phishing Triage Agent|

## Set up the Phishing Triage Agent

> [!IMPORTANT]
> Setup and management of the Phishing Triage Agent is only available to users with the **Security Administrator** role.

### Create the agent's identity and assign permissions

The Phishing Triage Agent operates in the context of the identity you associate with it. Creating the agent's identity and assigning the appropriate permissions to the agent is the required before starting the setup.

#### Identity

The Phishing Triage Agent uses as identity to access the data it needs to perform its tasks. The agent can use the following identities:

- **Microsoft Entra user**: Create a user account in the Microsoft Entra admin center and assign the user the Security Reader role.

- **Service principal**: coming soon!

> [!TIP]
> Microsoft recommends creating and using a dedicated user account for the agent with the minimum required permissions.
> When creating the user account, ensure to assign a distinct display name, for example *phishing triage agent*, to help identify the account in the Microsoft Defender portal.

Once the user is created, you can connect it to an existing user account that has the required permissions. In the initial setup, select **Connect an existing user account** to connect the agent to a user account and sign in to the user account.

[SCREENSHOT]

Connecting the agent to a user account requires authentication that expires after 90 days. You must reauthenticate the agent every 90 days to maintain its access.

#### Permissions

After creating the agent's identity, you must assign it the appropriate permissions to access the data it needs to perform its tasks. To assign a role, see [Create a custom role](create-custom-rbac-roles.md#create-a-custom-role).
The Phishing Triage Agent requires a role that have all the following permissions:

- Security data basics (read)
- Email & collaboration content (read)
- Email & collaboration metadata (read)
- Security Copilot (read)
- Alerts (manage)

> [!TIP]
> Microsoft recommends setting the agent with the minimum required permissions.
> Users who have the same permissions as the agent can monitor the agent and view its output. However, they cannot manage the agent or change its settings.

### Begin the setup

Once the agent's identity is created and the appropriate permissions are assigned, you can begin the setup process.

You can access the Phishing Triage Agent setup from the **Incidents** queue in the Microsoft Defender portal. Select **Set up** to start the setup process.

[SCREENSHOT]

You can also access the Phishing Triage Agent setup from the **Settings > Microsoft Defender XDR** page. Under **Agents**, select **Overview** then select **Set up** to start the setup process.

[SCREENSHOT]

Follow the steps in the setup wizard to complete the setup. The setup process includes the following steps:

1. Select the agent's [identity](#identity).

2. Follow the prompts to sign in to the user account you created for the agent.
 
   [SCREENSHOT]
 
   > [!NOTE]
   > You can change the agent's identity and role at any time. To do this, navigate to Settings > Microsoft Defender XDR. Under Agents, select Identity and role.

3. Select **Deploy agent** to activate the agent.

4. Select **View incidents** to navigate back to the incidents queue.

The Phishing Triage Agent is now set up and running in the background, ready to triage user-submitted phishing incidents. Your incident queue now contains the Phishing Triage Agent card with the total number of incidents handled.

[SCREENSHOT]

#### Troubleshooting agent issues

Following are responses to common issues about the Phishing Triage Agent, including issues on setup and expected output.

##### The agent is not running after setup

If the agent is not running after setup, check the following:

1. Check the agent’s [identity and role](#create-the-agents-identity-and-assign-permissions). Ensure that it has the minimum required permissions.
2. Ensure that the tenant meets all the [prerequisites](#prerequisites) to run the agent.

##### I don’t see the Phishing Triage Agent running

The agent runs automatically when a user submits a potential phishing email. The agent doesn’t run if there are no submissions. To test the agent, you can submit a phishing incident to trigger it.

##### What incidents should I look for?

Phishing incidents that contain the alert *Email reported by user as malware or phish* are addressed by the Phishing Triage Agent. Ensure that you have the alert policy **Email reported by user as malware or phish** turned on in your organization. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information.

##### The agent is fully set up but there’s no change in an alert's classification

It's possible that another party, either manually by a user or through automation, changed the alert's classification. The agent doesn’t change a previously classified alert.

## Manage the Phishing Triage Agent

You can manage the Phishing Triage Agent's settings and review and manage feedback provided to it. To do these, select **Manage agent** in the agent card above the incident queue. Alternatively, you can navigate to **Settings > Microsoft Defender XDR > Agents**.

### Pause or remove the agent

> [!IMPORTANT]
> Pausing or removing the Phishing Triage Agent is only available to users with the **Security Administrator** role.

Pausing the agent stops the agent from triaging incidents without removing it entirely. The agent stops triaging incidents, including incidents that are in progress of triaging. Resuming the agent resumes all the agent’s activities.

Removing the agent permanently removes the agent. When the agent is removed, the agent stops triaging new incidents and all feedback are deleted. However, it retains the history of all incidents it triaged.

To pause, resume, or remove the agent:

1. Navigate to the **Overview** page under **Agents**.

2. Select **Pause** to temporarily stop the agent. Once paused, the same option becomes **Resume**, which you can select when you’re ready to resume the agent's activities.

   [SCREENSHOT]

3. To remove the agent, select **Remove agent**.

### Change the agent's identity and role

> [!IMPORTANT]
> Changing the Phishing Triage Agent’s identity is only available to users with the **Security Administrator** role.

You can manage the agent's identity and role at any time by navigating to the **Identity and role** page under **Agents**. You can view the agent's current identity, last update information, and the option to select a different identity for the agent.

[SCREENSHOT]

### View and manage feedback to the agent

You can view and manage feedback provided by users to the Phishing Triage Agent by navigating to the Agent feedback page. The feedback page includes a list of all feedback provided to the agent. The feedback information includes what is stored in the agent memory, the agent's lessons, users who provided feedback, feedback submission date, and the incident ID. The Phishing Triage Agent uses all feedback provided to it to triage user-submitted phishing incidents. It stores all feedback in its memory as lessons.

[SCREENSHOT]

> [!TIP]
> You can only manage feedback one at a time. Managing multiple feedback is not supported.

Review each feedback by selecting an item from the feedback list. In the **Review feedback** pane, check the details and decide to keep feedback in the agent’s memory or reject the feedback. The agent continues to use all feedback that you decide to keep for triaging user-submitted phishing incidents in the future.

> [!NOTE]
> Rejecting feedback provided to the agent is only available to users with the **Security Administrator** role.

When you reject feedback, the agent takes note of the rejected feedback to discontinue use of the feedback for future triaging. In the Review feedback pane, select Reject feedback to reject a specific feedback. Here’s an example of rejected feedback.

[SCREENSHOT]

### Track the agent's performance

You can review the overall performance of the Phishing Triage Agent by navigating to the agent card in the incident queue. The agent card contains the total number of incidents triaged by the agent. The total number of incidents are tracked either from the agent’s first deployment date or based on the last 30 days of data of the agent’s work. Here's an example.

[SCREENSHOT]

## Maximize efficiency with the Phishing Triage Agent

Once the Phishing Triage Agent is fully set up and running, it is triggered automatically when a user in your organization submits a suspicious phishing email, and an alert is created. The agent autonomously analyzes these submissions leveraging sophisticated AI tools and your organizational knowledge. When the agent arrives at a conclusion, it classifies and resolves the related alerts and incidents as either malicious or false alarms. The agent provides a detailed explanation for its verdict for each submission it triages.

### Collaborate with the agent

The Phishing Triage Agent is designed to help manage the overwhelming volume of suspicious emails submitted within organizations. It works seamlessly alongside SOC teams to enhance productivity, boost protection, and minimize the time spent on triaging phishing incidents.

By autonomously triaging incidents and resolving alerts, the agent helps reduce the queue and allows you to focus your attention on the most critical alerts. Instead of manually addressing every single item in the queue, you can easily track the agent's progress and decide which alerts require deeper investigation.

The agent ensures transparency by updating the incident fields. When an agent starts handling an alert, it assigns the alert to itself and adds an **Agent** tag to the alert. You can filter the incident queue to view only the alerts tagged by the agent, making it even easier for you to monitor its work and prioritize effectively.

The Phishing Triage Agent flags your attention to incidents and alerts that require further action by classifying these as true phishing. You can filter the incident queue to view all **True positive** incidents assigned to the **Agent**. Here’s an example.

[SCREENSHOT]

The agent supports teams to move faster through the queue, understanding the agent’s work and arriving quicker to a triage decision. Rather than the user independently performing numerous triage analysis activities, the agent now surfaces that data for the user to decide.

### Evaluate the agent's findings

Once the agent is done triaging an alert in an incident, it provides clear reasoning for its verdict, including supporting evidence in clear plaintext and a full graphical representation of its thought process how it came to that decision.

To review the agent’s findings, follow these steps:

1. Select the incident in the incident queue.
 
2. In the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under Guided Response triage section. The task is marked as a completed task by the agent.

   [SCREENSHOT]

3. To learn more about the agent's actions prior to arriving at a classification, select **View agent activity** in the Phishing Triage Agent card. Alternatively, you can navigate to the **Activity** tab.

   [SCREENSHOT]

The Activity tab opens to a full graphical representation of the agent’s thought process while doing the triage. Each step highlights the action performed, how the actions were done, and the corresponding results to provide full transparency into the evidence collected and the reasoning behind the agent’s decision. 

### Train the agent about your organization's context

The agent interacts with the user to learn and adapt itself to your organization’s context, impacting how it classifies future incidents. Agents can be given feedback in natural language. All feedback given to the agent are turned into the agent’s lessons and stored in the agent’s memory for future triaging and classification.

On its first run, the Phishing Triage Agent might make decisions based on limited context or without insight into your organization’s specific environment. Providing feedback to the agent helps it learn from your input and incorporate those organizational nuances into future decisions, improving decision-making over time.

To train the agent, follow these steps:

1. In the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under Guided Response triage section.

2. Review the agent's classification verdict and reason. If its decision doesn’t align with your classification criteria, select **Change classification**.

   [SCREENSHOT]

3. In the **Manage alert** pane, provide the correct classification and add your comment. You can use natural language to explain the reason for the change in classification. Select **Save**.

   [SCREENSHOT]
   > [!NOTE]
   > You can only change the alert’s classification to **true positive – phishing** or **false positive – not malicious**.

4. Select **Use this feedback to teach the agent** and then **Evaluate**. Using these options adds the feedback to the agent’s memory and improves the agent's subsequent responses to be  better aligned with your organization’s context.

   [SCREENSHOT]
   > [!NOTE]
   > Not selecting the **Use this feedback to teach the agent** just logs the feedback in the management page for auditing purposes.

The agent then translates the given feedback into a lesson and output back what it learned from the feedback given to it.


## Related content

- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Responsible AI FAQs for Security Copilot](/copilot/security/rai-faqs-security-copilot)