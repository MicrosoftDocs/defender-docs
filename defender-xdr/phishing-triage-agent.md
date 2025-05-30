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
ms.date: 06/03/2025
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
> Setting up up and management of the Phishing Triage Agent is only available to users with the **Security Administrator** role. Ensure that all [prerequisites](#prerequisites) are met before setting up the agent.

### Create the agent's identity and assign permissions

The Phishing Triage Agent operates in the context of the identity you associate with it. Creating the identity you want to assign to the agent and assigning it the appropriate permissions is required before starting the setup.

#### Identity

> [!IMPORTANT]
> Ensure that your conditional access policies for Security Copilot are in place, enabling the agent to function based on the user account created for it.

The Phishing Triage Agent requires an identity to perform its tasks. Currently, the agent supports the following identity types:

- **Microsoft Entra user**: Create a user account in the Microsoft Entra admin center and assign the user the Security Reader role. For more information, see [Create a new user](/entra/fundamentals/how-to-create-delete-users#create-a-new-user).

When connecting the agent to an account, Microsoft recommends setting a long account expiration date and ensuring that you monitor the account authentication closely to maintain continuous access for the agent. If authentication expires, the agent stops functioning properly.

> [!TIP]
> Microsoft recommends creating and using a dedicated identity account with the minimum required permissions for the agent.
> When creating the account, assign a distinct display name like *Phishing Triage Agent* to easily identify the account in the Microsoft Defender portal.

#### Permissions

Verify first that you’re using the [unified role-based access (URBAC)](manage-rbac.md) model with all Microsoft Defender workloads enabled before creating a role and applying permissions for the agent. To know more about turning on URBAC, see [Activate Microsoft Defender URBAC](activate-defender-rbac.md). 

The agent’s identity must be assigned the necessary permissions by creating or assigning a role to access the data required and perform its tasks. To learn how to create a role and assign permissions in Microsoft Defender, see [Create a custom role](create-custom-rbac-roles.md#create-a-custom-role).

The Phishing Triage Agent requires a role that includes all the following permissions and data sources:

[SCREENSHOT]

[SCREENSHOT]

> [!TIP]
> Microsoft recommends creating or assigning a role to the identity of the agent with only the minimum required permissions. 
> If a role with the necessary permissions for this type of task already exists in your role directory, it can be assigned as the agent's role.
> Only users with equal or higher permissions than the agent can monitor its activity and view its output. 

### Begin the setup

Once all prerequisites were met, the agent's identity has been created and the appropriate permissions assigned, you can begin the setup process.

You can access the Phishing Triage Agent setup in two ways:

- From the **Incidents** queue in the Microsoft Defender portal, select **Set up agent** to start setting up the agent.

  [SCREENSHOT]

- Alternatively, you can navigate to **Settings > Microsoft Defender XDR**. Under **Agents**, select **Overview**, then select **Set up** to start the process.

  [SCREENSHOT]

Follow the steps in the setup wizard, which includes:

1. Select the [identity](#identity) type to assign to the agent.
  
   [SCREENSHOT]

2. Follow the prompts to sign in to the account you created for the agent.

   [SCREENSHOT]

   > [!NOTE]
   > You can change the agent's identity and role at any time. To do this, navigate to **Settings > Microsoft Defender XDR**. Under **Agents**, select **Identity and role**.

3. Select **Deploy agent** to activate the agent.

4. Select **View incidents** to navigate back to the incidents queue or **Manage agent** to manage its settings.
   > [!TIP]
   > If you encounter any issues during the setup process, refer to the [Troubleshoot agent issues](#troubleshoot-agent-issues) section for more information.

The Phishing Triage Agent is now set up and running in the background, ready to triage user-reported phishing incidents coming in. Your incident queue now contains the Phishing Triage Agent card with the agent’s relevant metrics. This data helps demonstrate the agent’s impact and can be used to inform broader strategic conversations, highlight return on investment, or support decisions around scaling automation across your organization.

The card currently contains the following metrics:

- Incidents addressed: incidents containing user-reported phishing alerts that were classified by the agent as true phishing threats or false alarms
- Incidents resolved: incidents that no longer require further handling, like false alarms

All metrics are calculated from the time the agent addressed its first incident, or in the last 30 days.

[SCREENSHOT]

## Enhance incident response with the Phishing Triage Agent

> [!TIP]
> Only users with equal or higher permissions than the agent can monitor the agent activity and view its output. To manage the agent or change its settings, users need to have Security Administrator permissions.

The agent is designed to help security teams manage the overwhelming volume of suspicious emails organizations receive daily. Acting as a force multiplier for SOC teams, the agent offloads time-consuming triage tasks, reduces alert fatigue, and accelerates incident response by autonomously distinguishing true phishing threats. This enables analysts to cut through the noise and focus their attention on the threats that truly matter.

### Agent trigger and flow

Once fully set up and running, the Phishing Triage Agent is automatically triggered when a user reports a suspicious phishing email and an alert is created. The agent then autonomously analyzes the alert leveraging sophisticated AI tools and your organization’s context to determine whether the associated threat is malicious or just a false alarm.

If the alert is a false alarm, the agent then classifies it as false positive and resolves the alert accordingly. If the alert is malicious, the agent classifies the alert as True Positive and the related incident’s status remains open and in progress for the analyst to investigate and resolve. For each alert it triages, the agent provides a detailed explanation for its verdict to support transparency and analyst confidence in the incident the alert is connected to.

### Collaborate with the agent

To ensure transparency, the agent actively updates incident fields. throughout the triage process. When it begins triage, the agent assigns the alert to itself and adds an **Agent** tag to the corresponding incident. Analysts can easily filter the incident queue to view only those tagged by the agent, streamlining oversight and prioritization.

The Phishing Triage Agent flags your attention to incidents and alerts that require further action by classifying these as true phishing. You can filter the incident queue to view all **True positive** incidents assigned to the **Agent**. Here’s an example.

> [!TIP]
> You can also filter the incident queue using the name of the identity you assigned to the Phishing Triage Agent to see the incidents the agent is actively working on.

When an alert is determined as a true phishing threat, the Phishing Triage Agent marks it as a true positive. This allows analysts to prioritize these phishing threats effectively and take swift action. Analysts can now easily filter the queue, focusing on verified phishing alerts and dedicating their attention where it’s most needed, rather than managing numerous alerts.

[SCREENSHOT]

### Transparency and explainability in Phishing Triage

The Phishing Triage agent is purpose-built to clearly explain why and how it made each decision. It provides detailed reasoning, including explanation on its verdict reasoning in plaintext and a full graphical representation of its workflow. This transparency helps analysts quickly interpret results, build confidence in the agent’s output, and help them spend their time efficiently on making decisions based on the agent’s results instead of doing repetitive tasks for phishing incident triage.

To review the agent’s findings, follow these steps:

1. Select an incident in the incident queue.

2. On the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under the Guided Response triage section. The task is marked as completed and assigned to the agent. The card contains the agent’s verdict reasoning on the basis of its classification, highlighting specific incriminating evidence.

   [SCREENSHOT]

3. You can select the **More actions** ellipsis to view more the details about the alert, copy the agent’s classification details to clipboard, or to manage the specific feedback.

   [SCREENSHOT]

4. To view the steps the agent took prior to reaching its classification, select View agent activity in the Phishing Triage Agent card. This provides complete transparency into the data analyzed and the logic behind the agent’s final classification.

   [SCREENSHOT]

## Teach the agent your organization’s context through feedback

The Phishing Triage Agent refines its decision-making through feedback tailored to your organization’s needs. Analysts can provide feedback in simple, natural language without the need for complex input or configurations, making it easy to guide the agent’s behavior. This feedback is incorporated into the agent’s memory, enabling it to adapt to how your organization interprets and classifies phishing threats, improving the agent’s effectiveness in handling future alerts.

To teach the agent through feedback, follow these steps:

1. In the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under the Guided Response triage section.

2. Review the agent’s classification and reason in the title and content of the card. If its decision doesn’t align with your classification criteria, select **Change classification**. Alternatively, you can change the alert’s classification by selecting the specific alert from the Alerts tab, then select **Manage alert**.

   [SCREENSHOT]

3. In the **Manage alert** pane, select the new classification from the **Classification** dropdown menu. After selecting the classification, add your reason for changing it and explain your feedback in the **Why did you change this classification** field. These actions only store your feedback in the feedback management page for auditing and won't be incorporated into the active teaching of the agent until you select **Use this feedback to teach the agent**.

   [SCREENSHOT]

4. To have the agent apply your feedback in classifying future incidents, select **Use this feedback to teach the agent** and then choose **Evaluate**. Use the guide to writing feedback to help you compose your feedback. These options give you a preview of how the agent processes feedback into a lesson and evaluates if it meets your expectations. If it does, you can then decide to insert the lesson into the agent’s memory.

   > [!NOTE]
   > Providing feedback to the agent can only be done once. You can teach the agent only on how to classify phishing alerts, which means selecting between classifications of True positive – phish or False positive – not malicious.
   > Always check your feedback and the validity of AI responses before saving the lesson as sometimes the responses might not be applicable to the scenario.

5. Select **Save** to save the feedback and add the lesson to the agent’s memory if applicable.

The agent utilizes stored feedback to triage and classify similar alerts in the future. When a relevant alert is received, the agent applies this feedback to determine the classification of the new alert, incorporating it as supporting evidence in its decision-making process.

### Best practices for writing feedback

Lessons provide systematic guidelines that help the agent determine whether an alert is a genuine phishing threat or a false alarm. The agent acquires these lessons from the feedback it receives. 

To ensure effective integration of this feedback by the agent, Microsoft recommends adhering to the following guidelines when providing feedback to the Phishing Triage Agent:

1. **Ensure feedback is relevant and contextual**. Feedback should pertain only to the email currently under review. It must align with the updated classification you’ve assigned.

2. **Be descriptive and specific**. Clearly explain the characteristics of the email. Provide relevant details like the email subject, message body, sender, or recipients to help the agent understand the context. Specific feedback with multiple details enhances effectiveness, so avoid broad generalizations or generic statements.

3. **Ensure clarity and decisiveness**. Avoid vague or universal statements. Give feedback that is clear and actionable. Use decisive and clear identification terms.

4. **Be consistent with previous feedback**. Ensure your feedback aligns with previous feedback to avoid contradictions or confusion. You can review all previously submitted feedback on the [Feedback](#view-and-manage-feedback-to-the-agent) page.

5. **Review the agent’s interpretation of your feedback**. After submitting it, always verify that the feedback is accurately translated into a lesson. Confirm that it reflects your intent and maintains consistency with your original input. Checking the validity of AI responses ensures the responses are applicable to the scenario.

Here are examples of how you can write your feedback to the agent.

|Area|Examples of well-written feedback|Examples of feedback that can lead to failure|Comparison|
|:---|:---|:---|:---|
|Feedback about a recipient|*New contractor onboarding emails should only be sent to email addresses starting with 'v-' to ensure they are directed to the correct recipients.*|*Contractor emails look different from usual, so they might be phishing*|Well-written feedback clearly defines the expected recipient format, compared to the sample of feedback that’s vague and lacks clear identification.|
|Feedback about a sender|*Any email claiming to be from benefits providers must originate from “@benefits.company.com”.*|*Benefits emails could be phishing if they look suspicious.*|Well-written feedback provides a specific sender domain requirement, while the other feedback lacks actionable criteria, making detection unreliable.|
|Feedback about a sender|*Emails offering file sharing or document access should only come from our authorized provider (e.g., Dropbox.com).*|*File-sharing emails that seem unfamiliar should be flagged.*|Well-written feedback explicitly sets a trusted provider requirement, while the other feedback is subjective and may lead to excessive false positives.|
|Feedback about the email body|*Emails requesting credential verification should include a reference to the specific account or service. Any generic 'verify your account' request without details should be treated as phishing.*|*This email asks me to verify my account, so it must be phishing.*|Well-written feedback defines when verification requests are legitimate, while the other feedback assumes all similar emails are phishing without analyzing context.|
|Feedback about the email body|*This email was sent to multiple employees, and the body instructs recipients to download an 'important attachment' without describing its contents—legitimate internal emails always specify attachment details.*|*TMass emails with attachments are phishing.*|Well-written feedback focuses on missing details that legitimate emails provide, while the other feedback makes an overly broad generalization.|

### Resolve feedback failures

When the agent takes your feedback, it translates it into a lesson. If the agent doesn’t succeed in interpreting the feedback, a relevant message shows what caused the failure. You can address these failures based on the message returned by the agent.

Here are examples of failures you might encounter when writing feedback to the agent, and how you can resolve them.

|Failure message|Recommended action|
|:---|:---|
|[SCREENSHOT] Part of the feedback provided can't be addressed as the agent currently doesn't support teaching this type of feedback.|Rewrite your feedback and ensure that the feedback addresses descriptions of the email that it can support. Then select Evaluate before saving the feedback.|
|[SCREENSHOT] The feedback includes content that’s irrelevant to the email being reviewed.|Rewrite your feedback and ensure that your feedback contains details that are not related to the email being reviewed or vague statements that are hard to apply to similar emails in the future. Select Evaluate before saving the feedback.|
|[SCREENSHOT] The given feedback conflicts with previous feedback given to a similar email.|Review your given feedback against the feedback it conflicts with in the [feedback management page](#view-and-manage-feedback-to-the-agent). Based on your review, you can:</br> - Rewrite your given feedback then select Evaluate for the agent to reevaluate your new feedback. </br>
-	Reject the previous feedback in the feedback management page. Select Evaluate to try again.|

> [!NOTE]
> You can choose not to resolve feedback failures. You can leave your feedback and select Save without checking the box for teaching the agent. The feedback won’t be saved to the agent’s memory and is only documented in the feedback management page for your future tracking classification changes.

Once the agent is taught and equipped with organizational knowledge, it begins to refine its decision-making capabilities. This interactive teaching process ensures that the agent evolves continuously, delivering increasingly precise classifications and responses over time. By continuously integrating feedback loops, the system adapts dynamically to the changing landscape of organizational priorities and incident patterns.

## Manage the Phishing Triage Agent

> [!NOTE]
> Viewing and managing the Phishing Triage Agent settings is only available to users with the **Security Copilot (read)** and **Security data basics (read)** permissions.

You can manage the Phishing Triage Agent’s settings, review agent activity, and review user interaction with the agent. To do so, select **Manage agent** in the agent card above the incident queue. Alternatively, you can navigate to **Settings > Microsoft Defender XDR > Agents**.

### View and manage feedback to the agent

> [!NOTE]
> Managing feedback is only available to users with the **Security Copilot (read)**, **Security data basics (read)**, and **Email & collaboration metadata (read)** permissions.

The Phishing Triage Agent uses feedback to improve its performance over time. It stores applicable feedback in its memory as lessons. You can view and manage user-submitted feedback for the Phishing Triage Agent by navigating to the Agent Feedback page.

This page provides a comprehensive list of all feedback submitted to the agent. You can review key details for each feedback including:

- The original feedback provided by the user
- The translated lesson generated by the agent
- Feedback status - in use, not in use, or conflict
- The agent’s original classification and the user-applied change 
- The user who provided the feedback 
- Feedback submission date, feedback ID, alert ID and the incident ID

[SCREENSHOT]

Feedback status can be one of the following:

|Status|Description|
|:---|:---|
|In use|The feedback is converted successfully into a lesson in the agent’s memory, and is actively used by the agent to triage and classify similar incidents.|
|Conflict|The feedback conflicts with previously provided feedback in a similar incident. To resolve conflicting feedback, see [Resolve feedback failures](#resolve-feedback-failures).|
|Not in use|The feedback provided failed to incorporate into the agent’s memory or was marked by the user as feedback that should not be used to teach the agent. As a result, it’s not used by the agent to triage and classify incidents and is saved only for auditing purposes. For more details, click on the details panel.|

> [!TIP]
> Feedback can only be managed individually. Bulk management of multiple feedback entries is not currently supported.

To review the details of a specific feedback, select an entry from the feedback list. In the **Review feedback** pane, check the details of the feedback provided, the agent’s lesson, the classification changes, and other important details about the feedback. You can use these details to decide whether to retain the feedback in the agent’s memory or reject it.

[SCREENSHOT]

> [!NOTE]
> Rejecting feedback provided to the agent is only available to users with the **Security Administrator** role.

To reject specific feedback, open the Review feedback pane and select Reject feedback. When you reject feedback, the agent records it as rejected and stops using it in future triage decisions. Here’s an example.

[SCREENSHOT]

### Change the agent's identity and role

> [!IMPORTANT]
> Changing the Phishing Triage Agent’s identity is only available to users with the **Security Administrator** role.

You can manage the agent's identity and role at any time by navigating to the **Identity and role** page under **Agents**. This page is similar to when you initially set up the agent’s identity and role. Here, you can view the agent's current identity, see details about the last update, and select a new identity  type if needed.

[SCREENSHOT]

### Pause or resume the agent

> [!IMPORTANT]
> Pausing the Phishing Triage Agent is only available to users with the **Security Administrator** role.

**Pausing the agent** temporarily stops all triage activity, including any in-progress triage tasks. The agent doesn’t process new incidents until it’s resumed. **Resuming the agent** resumes all the agent’s activities, allowing it to start triaging and classifying incoming alerts again.

To pause or resume the agent:

1. Navigate to the **Overview** page under **Agents**.

2. Select **Pause** to temporarily stop the agent. Once paused, the same option becomes **Resume**, which you can select when you’re ready to reactivate the agent's activities.

   [SCREENSHOT]
   [SCREENSHOT]

### Remove the agent

> [!IMPORTANT]
> Removing the Phishing Triage Agent is only available to users with the **Security Administrator** role.

**Removing the agent** permanently disables it. Once removed, triage and classification of new incidents stop, and all feedback are deleted. However, the history of previously triaged incidents is retained for your reference. 

To remove the agent, navigate to the **Overview** page under **Agents**, then select **Remove agent**.

## Troubleshoot agent issues

Below are responses to common issues for the Phishing Triage Agent, including guidance on setup issues and expected output.

### What incidents should I look for?

You can apply the **Agent** tag to filter the incident queue and see all incidents that the agent addressed. The agent addresses all incidents that contain user reported alerts and analyzes each alert in those incidents. To find the incidents that the agent is currently working on, search for the agent’s identity name *Assigned to* column.

### I don’t see the Phishing Triage Agent running

The agent only runs when a user reports a potential phishing email and an alert is created. If there are no reported phishing incidents, the agent remains idle. To test the agent’s functionality, report an email as phishing to trigger it. See [User reported settings](/defender-office-365/submissions-user-reported-messages-custom-mailbox) for more information.

The Phishing Triage Agent addresses phishing incidents that include the alert type: Email reported by user as malware or phish. Ensure that you have the corresponding alert policy enabled. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information.

### The agent is not failing after setup

You can check the agent’s card in the Guided Response section to ensure it’s working properly. If the agent fails, verify the following:

1. Confirm that the tenant meets all [prerequisites](#prerequisites) to run the agent.
2. Ensure the agent’s [identity and role](#create-the-agents-identity-and-assign-permissions)has the [minimum required permissions](#permissions).
3. Verify the authentication status of the agent’s identity. If using a user identity, check that its properly authenticated and is not expired. See the [identity](#identity) section for more information.
4. Ensure your conditional access policies for Security Copilot are in place, enabling the agent to function based on the user account created for it.

### Giving feedback to the agent is failing

If you encounter failures while giving feedback to the agent, check the agent’s card for the specific reason. See [Resolve feedback failures](#resolve-feedback-failures) for more information.

### Can the agent override an alert’s classification?

The agent doesn’t override existing alerts that have been previously classified. The agent will still show a card, but it won’t change the classification. You can check the alert fields changes in the **Comments and history** section.

### Can I remove the Phishing Triage Agent?

Yes. You can pause the agent or remove it at any time in the Agents Overview page.

Removing the agent does not revert any changes made to the incidents it has triaged. The agent is no longer able to triage new incidents after its removal, but it retains the history of all incidents it triaged.

## Frequently asked questions

Following are responses to commonly asked questions about the Phishing Triage Agent. For information about the agent's capabilities and requirements, navigate to the [overview](#overview) and [prerequisites](#prerequisites) sections of this article.

### When is the agent triggered?

The agent automatically runs when a user reports a potential phishing attempt, and an alert is created.

### How do I grant the agent access to plugins and services?

You can create an agent identity using a service principal and assign it to an appropriate Tier 1 equivalent URBAC role in your environment to manage access. Note that service principals are only supported for public preview. Alternatively, you can connect it to an existing user account by signing in to manage access.

To learn more about the agent's identity and permissions, see [Create the agent's identity and assign permissions](#create-the-agents-identity-and-assign-permissions).

### Why is the Phishing Triage Agent important?

Phishing remains one of the most common methods by which attackers gain initial access to systems. While security tools effectively block most threats, some still manage to slip through, overwhelming inboxes and leaving email users uncertain whether a suspicious email is a legitimate phishing attempt or harmless spam. This uncertainty often leads to an influx of user-submitted reports. Consequently, managing these incidents becomes a tedious and repetitive task for Security Operations Center (SOC) analysts. Each alert may require up to 30 minutes of manual triage, demanding significant effort to sift through a large volume of incidents in search of the genuine threat amidst all the noise. This effort overwhelms analysts, who have a limited amount of time to dedicate to completing critical demands. By alleviating the burden of reactive work, the Phishing Triage Agent empowers analysts to focus on proactive security measures, ultimately strengthening organizations’ overall security postures.

### Can the Phishing Triage Agent be trusted?

Microsoft AI agents follow strict Responsible AI guidelines and undergo thorough reviews to ensure compliance with all AI standards and safeguards. Security Copilot’s Phishing Triage Agent is fully incorporated into these controls. During setup, the agent is assigned an identity and configured with the minimum required permissions for its operation, ensuring that it doesn't have unnecessary permissions. Furthermore, all agent activities are logged in detail, with the complete flow available for review by analysts and admins at any time. Feedback provided to the agent to help it adapt to the organization’s environment is logged, reflected in the system, and accessible for review and modification by admins as needed.

### How does the agent differ from a standard SOAR solution?

While both SOAR solutions and the Phishing Triage Agent aim to automate aspects of security operations, their approaches are fundamentally different. SOAR tools rely on static, policy- and rule-based workflows that require predefined logic and manual tuning. In contrast, the agent uses recursive reasoning to autonomously complete tasks –learning, adapting, and improving over time.

The agent doesn’t need to be reprogrammed for every new situation. Within defined boundaries, it adjusts to the task at hand, making it far more flexible than traditional automation. Rather than being rigid and reactive, it continuously evolves with your environment and threat landscape, guided by analyst feedback and grounded in real data. Purpose-built for security teams, the Phishing Triage Agent helps accelerate responses and reduces manual workloads, freeing up analysts to focus on strategic initiatives.

### What level of visibility and control do I have over the agent?

Microsoft provides tools for organizations to maintain visibility into and control over the Phishing Triage Agent from deployment through ongoing operations. The agent adheres to Microsoft’s Responsible AI (RAI) standards for fairness, reliability, safety, privacy, security, inclusiveness, transparency, and accountability.

Administrators configure the agent’s identity and access levels during installation, following least-privilege principles. Security and IT teams can authorize specific actions, monitor performance, and review outputs directly in Microsoft Defender. Capacity consumption and data access limits are also configurable by administrators.

The Phishing Triage Agent operates within a zero-trust environment. The system enforces organizational policies on every agent action by evaluating the intent and scope of each operation. All decisions, reasoning, and actions taken by the agent are transparently documented as a decision tree within Defender and recorded in Microsoft Purview audit logs for traceability and compliance.

## Related content

- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Responsible AI FAQs for Security Copilot](/copilot/security/rai-faqs-security-copilot)
