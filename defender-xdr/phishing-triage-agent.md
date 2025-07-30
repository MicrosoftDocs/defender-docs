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
ms.date: 06/13/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Defender for Office 365 Plan 2
#customer intent: As a security analyst, I want to learn about the Phishing Triage Agent in Microsoft Defender so that I can triage and classify user-submitted phishing incidents efficiently.
---

# Microsoft Security Copilot Phishing Triage Agent in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here.

**Applies to:** Microsoft Defender for Office 365 Plan 2, Microsoft Defender XDR

Phishing remains one of the most prevalent and persistent entry points for cyberattacks, and a major operational burden for security operations center (SOC) teams. Every day, analysts are inundated with user-reported suspicious emails, each demanding careful investigation and triage. The sheer volume slows response, drains resources, and increases the risk of real threats slipping through the cracks.

To help security teams address this challenge, Microsoft Security Copilot introduces the Phishing Triage Agent in Microsoft Defender. This AI-powered virtual agent is designed to scale the triage and classification of user-reported phishing emails. By reducing repetitive investigation work and accelerating response, it helps security teams operate with greater speed and precision.

The Phishing Triage Agent uses advanced LLM-based analysis to perform sophisticated tasks—such as understanding the content and intent of reported emails—to autonomously determine whether a submission is a genuine phishing attempt or a false alarm. Unlike traditional rule-based systems, it does not rely on predefined input or code. Instead, it applies dynamic reasoning to analyze and act on incoming reports at scale.

By filtering out false alarms, the agent frees analysts to focus on real threats and high-impact investigations. This shift accelerates detection, sharpens response, and reinforces the organization’s overall security posture.

## Overview

Security Copilot brings together the power of AI and human expertise to help security teams respond to attacks faster and more effectively. Security Copilot is integrated into the Microsoft Defender portal to offer security teams advanced tools for investigating and responding to incidents, identifying threats, and protecting their organization using relevant threat intelligence.

The Phishing Triage Agent is a [Security Copilot agent](/copilot/security/agents-overview) in Microsoft Defender created to enhance the efficiency of security operations teams by classifying and triaging user-submitted phishing incidents. Some of the agent’s highlights include:

- **Autonomous triage:** The Phishing Triage Agent leverages advanced AI tools to perform sophisticated assessments and determine whether a submission is a real threat or a false alarm, without requiring step-by-step human input or code.
- **Transparent rationale:** It provides a transparent rationale for its classification verdicts in natural language, detailing the reasoning behind its conclusions and the evidence used to reach them. Additionally, it presents a visual representation of its reasoning process.
- **Continuous improvement:** It continuously improves based on feedback provided by analysts. Over time, this feedback loop fine-tunes the agent’s behavior, aligning it more closely with organizational nuances and reducing the need for manual verification.

## Prerequisites

The following are organizational requirements to run Phishing Triage Agent in your environment:

|Components|Details|
|:---|:---|
|Products|- Security Copilot and provisioned capacity in Security Compute Units (SCU). See [Get started with Security Copilot](/copilot/security/get-started-security-copilot) for more information </br> - Microsoft Defender for Office 365 Plan 2 deployed|
|Microsoft Defender required features|- Unified role-based access control (URBAC) enabled for Defender for Office 365. See [Activate URBAC settings](#activate-urbac-settings) for more information. </br> - *Monitor reported messages in Outlook* is configured. See [User reported settings](/defender-office-365/submissions-user-reported-messages-custom-mailbox) for more information </br> - The alert policy **Email reported by user as malware or phish** must be turned on. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information|

### Plugins 

The Phishing Triage Agent automatically activates these Security Copilot plugins: 

- Microsoft Defender XDR
- Microsoft Threat Intelligence 
- Phishing Triage Agent

### Activate URBAC settings

Activate the Defender for Office 365 workload in the Microsoft Defender XDR settings:

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/activate-defender-for-office-365-workloads.png" alt-text="Screenshot of the Activate unified role-based access control page showing the Defender for Office 365 toggle, which needs to be enabled for the Phishing Triage Agent.":::

For more information, see [Activate workloads in Microsoft Defender XDR settings](activate-defender-rbac.md#activate-in-microsoft-defender-xdr-settings).

### Configure user reported settings

The Phishing Triage Agent requires specific settings for how users report potentially malicious messages in Microsoft Outlook. Follow the steps in [Use the Microsoft Defender portal to configure user reported settings](/defender-office-365/submissions-user-reported-messages-custom-mailbox).

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/configure-user-reported-settings.png" alt-text="Screenshot of the User reported settings page showing the the Outlook report button and reported message destinations configurations.":::

If you’re using a third-party email reporting tool, review [Options for third-party reporting tools](/defender-office-365/submissions-user-reported-messages-custom-mailbox), and view your vendor’s options to integrate reported messages with Microsoft Defender XDR.

### Add alert policy

The Phishing Triage Agent addresses phishing incidents that include alerts with the type **Email reported by user as malware or phish**. Ensure that you have the corresponding alert policy enabled. See [Alert policies in the Microsoft Defender portal](alert-policies.md) for more information.

## Set up the Phishing Triage Agent

> [!NOTE]
> Setting up of the Phishing Triage Agent is only available to users with the **Security Administrator** role. Ensure that all [prerequisites](#prerequisites) are met before setting up the agent.

### Create the agent’s identity and assign permissions

The Phishing Triage Agent operates under the identity you assign to it. Before setup, you’ll need to create this identity and ensure it has the appropriate permissions to perform triage actions.

#### Identity

> [!IMPORTANT]
> Ensure that your conditional access policies for Security Copilot are in place, enabling the agent to function based on the user account created for it. For more information, see [Troubleshoot Conditional Access policies for Microsoft Security Copilot](/entra/identity/conditional-access/troubleshoot-security-copilot-policies).

Currently, the Phishing Triage Agent supports the following identity types:

- **Microsoft Entra user:** Create a user account in the Microsoft Entra admin center. For more information, see [Create a new user](/entra/fundamentals/how-to-create-delete-users#create-a-new-user).

When you connect the agent to an account, Microsoft recommends setting a long account expiration date and closely monitoring its authentication status to ensure continuous operation of the agent. If authentication expires, the agent stops functioning until it’s renewed.

> [!TIP]
> Microsoft recommends creating and using a dedicated identity account with the minimum required permissions for the agent. When creating the account, assign a distinct display name like *Phishing Triage Agent* to easily identify it in the Microsoft Defender portal.

The agent's specified user identity isn't compatible with PIM or TAP, as they don't support long-term background operations.

#### Permissions

The agent’s identity must be granted the required permissions to access emails and to analyze their content. Since the agent is operationally aligned with the construct of an SOC analyst, it needs the ability to review user reported phishing emails for triage. The agent uses similar access models while ensuring parity around permissions.

The Phishing Triage Agent role requires the following permissions:

- **Alerts (manage):** Used to classify the alert and monitor the alert’s state, preventing override of the alert status.
- **Security Copilot (read):** Used to access Security Copilot capabilities.
- **Email & collaboration content (read):** Used to read the content of user reported emails needed to do the analysis.

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/agent-permissions.png" alt-text="Screenshot of required permissions for Phishing Triage":::

To assign the appropriate permissions to the agent, follow these steps:

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/agent-permissions-sources.png" alt-text="Screenshot of required data sources for Phishing Triage":::

1. Ensure that the relevant Defender workloads are activated to allow the agent to effectively analyze alerts with comprehensive context. Follow the steps in [Activate URBAC settings](activate-defender-rbac.md).
2. [Create a role](../defender-xdr/create-custom-rbac-roles.md#create-a-custom-role) with the required permissions or assign an existing role with these permissions to the agent.
3. Assign the role to the agent.

> [!TIP]
> Microsoft advises assigning a role to the agent's identity that includes only the minimum permissions necessary. After assigning the agent its permissions, ensure the user group monitoring the agent has equal or higher permissions to oversee its activity and output. To do this, compare the permissions of the user group to the agent in the Permissions page in the Microsoft Defender portal.

### Begin the setup

Once all prerequisites are met, the agent's identity created, and permissions assigned, you can start the setup process.

You can access the Phishing Triage Agent setup in two ways:

- From the **Incidents** queue in the Microsoft Defender portal, select **Set up agent**.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-setup-incident.png" alt-text="Screenshot of the incident queue with the Phishing Triage card where Set up agent is highlighted" lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-setup-incident.png":::

- Alternatively, go to **Settings > Microsoft Defender XDR**. Under **Agents**, select **Overview**, then select **Set up** to start the process.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-setup.png" alt-text="Screenshot of the Overview page for the Phishing Triage set up":::   

Follow the steps in the setup wizard, which includes:

1. Select the [identity](#identity) type to assign to the agent.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/select-identity.png" alt-text="Screenshot of the identity picker for Phishing Triage":::

2. Follow the prompts to sign in to the account you created for the agent.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/setup-assign-user.png" alt-text="Screenshot of the account assignment for Phishing Triage":::

   > [!NOTE]
   > After setup, you can change the agent's identity and role at any time. To do this, navigate to **Settings > Microsoft Defender XDR**. Under **Agents**, select **Identity and role**.

3. Select **Deploy agent** to activate it.
4. Select **View incidents** to navigate back to the incidents queue or **Manage agent** to manage its settings.

> [!TIP]
> If you encounter any issues during the setup process, refer to the [Troubleshoot agent issues](#troubleshoot-agent-issues) section for more information.

The Phishing Triage Agent is now set up and running in the background, ready to triage user-reported phishing incidents coming in. Your incident queue now contains the Phishing Triage Agent card with the agent’s relevant metrics. This data helps demonstrate the agent’s impact and can be used to inform broader strategic conversations, highlight return on investment, or support decisions around scaling automation across your organization.

The card currently contains the following data:

- **Incidents addressed:** Incidents containing user-reported phishing alerts that were classified by the agent as true phishing threats or false alarms.
- **Incidents resolved:** Incidents that no longer require further handling, like false alarms.

Metrics are calculated based on the agent’s activity, beginning either from its first recorded incident or from the last 30 days—whichever is more recent.

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/incident-queue-with-agent.png" alt-text="Screenshot of the incident queue with the Phishing Triage Agent active" lightbox="/defender/media/agents-in-defender/phishing-triage/incident-queue-with-agent.png":::

## Enhance incident response with the Phishing Triage Agent

> [!TIP]
> Only users with permissions equal to or higher than the agent’s can monitor its activity and view its output.

The agent is designed to help security teams manage the overwhelming volume of suspicious emails organizations receive daily. Acting as a force multiplier for SOC teams, it offloads time-consuming triage tasks, reduces alert fatigue, and accelerates incident response by autonomously identifying true phishing threats. This enables analysts to cut through the noise and focus their attention on the threats that truly matter.

### Agent trigger and flow

Once fully set up and running, the Phishing Triage Agent is automatically triggered when a user reports a suspicious phishing email and an alert is created. The agent then autonomously analyzes the alert leveraging sophisticated AI tools and your organization’s context to determine whether the associated threat is malicious or just a false alarm.

If the alert is determined to be a false alarm, the agent classifies it as a False Positive and resolves it accordingly. If the alert is deemed malicious, it is classified as a True Positive, and the status of the associated incident remains open and in progress for an analyst to investigate and take further action.

For every alert it processes, the agent provides a detailed explanation of its verdict—enhancing transparency and building analyst confidence in the corresponding incident.

### Collaborate with the agent

To maintain transparency, the agent routinely updates incident fields during the triage process. When triaging starts, the agent assigns the alert to itself and adds an **Agent** tag to the corresponding incident. Analysts can filter the incident queue to see only those tagged by the agent, which simplifies oversight and prioritization.

> [!TIP]
> You can also filter the incident queue using the name of the identity you assigned to the Phishing Triage Agent to see the incidents the agent is actively working on.

When an alert is identified as a true phishing threat, the Phishing Triage Agent marks it as a True Positive. This enables analysts to prioritize confirmed phishing threats and respond more swiftly. With these alerts clearly flagged, analysts can easily filter the queue to focus on verified threats, resulting in significant queue reduction and minimizing the time spent sorting through false positives. This allows them to concentrate their efforts where they matter most.

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/incident-queue-agent-only.png" alt-text="Screenshot of the incident queue filtered by the Phishing Triage Agent tag" lightbox="/defender/media/agents-in-defender/phishing-triage/incident-queue-agent-only.png":::

### Transparency and explainability in phishing triage

The Phishing Triage Agent is purpose-built to clearly explain *why* and *how* it made each decision. For every alert it processes, it provides a detailed explanation in plain text along with a full graphical representation of its decision-making workflow. This level of transparency allows analysts to quickly interpret results, build trust in the agent’s output, and focus their time on making informed decisions—rather than repeating manual steps in the phishing triage process.

To review the agent’s findings, follow these steps:

1. Select an incident from the incident queue.
2. On the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under the Guided Response Triage section. The task is marked as completed and assigned to the agent. The card presents the agent’s verdict based on its classification, highlighting key pieces of incriminating evidence that informed the decision.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/incident-main.png" alt-text="Screenshot of the incident page with the Phishing Triage Agent card highlighted" lightbox="/defender/media/agents-in-defender/phishing-triage/incident-main.png":::

3. You can select the **More actions** ellipsis to view more alert details, copy the agent’s classification details to the clipboard, or manage feedback.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/more-actions-card.png" alt-text="Screenshot highlighting the more actions options within the Phishing Triage Agent card":::

4. To view the steps the agent took prior to reaching its classification, select **View agent activity** in the Phishing Triage Agent card. This provides complete transparency into the data analyzed and the logic behind the agent’s final classification.

Alternatively, you can navigate to the **Activities** tab and search for the Agents. In the Activities tab, a graphical representation illustrates the agent’s step-by-step thought process during the triage. Each step is clearly documented, highlighting the task taken, how it was performed, and collected evidence. This provides complete transparency into the data analyzed and the logic behind the agent’s final classification.

## Teach the agent your organization’s context through feedback

The Phishing Triage Agent continuously improves its decision-making based on feedback tailored to your organization’s needs. Analysts can provide input in plain, natural language—no complex configurations required—making it easy to guide and shape the agent’s behavior. This feedback is stored in the agent’s memory, allowing it to adapt to how your organization interprets and classifies phishing threats. Over time, this adaptation enhances the agent’s accuracy and effectiveness in triaging future alerts, with your team in control.

To provide feedback and teach the agent, follow these steps:

1. In the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under the Guided Response triage section.
2. Review the agent’s classification and reasoning displayed in the card’s title and content. If the decision doesn’t align with your organization’s classification criteria, select **Change classification**. Alternatively, you can update the classification by selecting the specific alert from the **Alerts** tab, then choosing **Manage alert**.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/change-classification.png" alt-text="Screenshot highlighting the Change classification option in the Phishing Triage Agent card":::

3. In the **Manage alert** pane, select the new classification from the **Classification** dropdown menu. Then, provide your reason for the change by filling out the **Why did you change this classification** field. This step records your input on the feedback management page for auditing purposes only. The agent will not use this feedback to improve its decision-making until you explicitly select **Use this feedback to teach the agent**. If you choose not to use this feedback for teaching the agent, you can select **Save**, which will only audit the feedback without inserting it into the agent’s memory.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/manage-alert-why.png" alt-text="Screenshot highlighting the classification and feedback fields in the Manage alert pane":::

4. To apply your feedback, select **Use this feedback to teach the agent**. You can use the [guide to writing feedback](#best-practices-for-writing-feedback) to help you craft effective input, and then choose **Evaluate feedback** to allow you to preview how the agent translates your feedback into a lesson and assess whether the outcome aligns with your intent. Additionally, the feedback evaluation performs basic safety checks to ensure that the applied feedback is relevant for the agent to use and doesn’t conflict with previous feedback.

   > [!NOTE]
   > You can only provide feedback to the agent once per alert, and it can only be used to teach the agent how to classify phishing alerts, specifically by selecting either True Positive (phishing) or False Positive (not malicious).
   > Always review your feedback and verify the AI-generated response before saving the lesson.

5. If the result meets your expectations, you can choose to insert the lesson into the agent’s memory to influence its future decisions. Select **Save** to save the lesson and store it as a lesson in the agent’s memory if applicable. All feedback recorded for audit purposes, as well as lessons added to the agent’s memory, can be later reviewed in the [feedback management page](#view-and-manage-feedback-to-the-agent).

The agent utilizes stored feedback to triage and classify similar alerts in the future. When a relevant alert that matches the feedback characteristics is received, the agent applies this feedback to determine its classification, incorporating it as supporting evidence in its decision-making process.

### Best practices for writing feedback

Lessons provide systematic guidelines that help the agent determine whether an alert is a genuine phishing threat or a false alarm. To ensure the agent effectively incorporates your feedback, Microsoft recommends following these best practices when providing input to the Phishing Triage Agent:

1. **Ensure feedback is relevant and contextual.** Feedback should pertain only to the email currently under review. It must also align with the updated classification you’ve assigned.
2. **Be descriptive and specific.** Clearly explain the characteristics of the email. Provide relevant details like the email subject, message body, sender, or recipients to help the agent understand the context. Specific feedback with multiple details enhances effectiveness.
3. **Ensure clarity and decisiveness.** Avoid vague or universal statements. Give feedback that is clear and actionable. Use decisive and clear identification terms.
4. **Be consistent with previous feedback.** Ensure that new feedback aligns with what has been previously provided to avoid contradictions that could confuse the agent or reduce the accuracy of its decisions. You can review all previously submitted input on the [Feedback](#view-and-manage-feedback-to-the-agent) management page.
5. **Review the agent’s interpretation of your feedback.** After submitting it, always verify that the feedback is accurately translated into a lesson. Confirm that it reflects your intent and maintains consistency with your original input. Checking the validity of AI-generated responses ensures these are applicable to the scenario.

Here are examples of how you can write your feedback to the agent.

| Area | Examples of well-written feedback | Examples of feedback that can lead to failure | Comparison |
|:---|:---|:---|:---|
| Feedback about email subject | Any email that its subject contains a request for billing transaction is not allowed in our organization and considered as phishing. | If the subject has a positive natural sentiment it’s legitimate. | Concrete feedback that can be grounded against email subject while the sample feedback is vague and subjective and may lead to excessive false positives. |
|  | This is not a malicious email.<br>The sender from the 2nd alert in the incident is legitimate. | Feedback can only be on the email of the alert at hand. |
| Feedback about a sender | Any email claiming to be from benefits providers must originate from “@benefits.company.com”. | Benefits emails could be phishing if they look suspicious. | Well-written feedback provides a specific sender domain requirement, while the sample feedback lacks actionable criteria, making detection unreliable. |
|  | Emails offering file sharing or document access should only come from our authorized provider (e.g., Dropbox.com). |  | Well-written feedback explicitly sets a trusted provider requirement. |
| Feedback about the email body | Emails requesting credential verification should include a reference to the specific account or service. Any generic 'verify your account' request without details should be treated as phishing. | This email asks me to verify my account, so it must be phishing. | Well-written feedback defines when verification requests are legitimate, while the sample feedback assumes all similar emails are phishing without analyzing context. |
| Feedback about a recipient and email body | This email was sent to multiple employees, and the body instructs recipients to download an 'important attachment' without describing its contents—legitimate internal emails always specify attachment details. | Mass emails with attachments are phishing. | Well-written feedback focuses on missing details that legitimate emails provide, while the sample feedback makes an overly broad generalization. |
| Feedback about a recipient and a domain | New contractor onboarding emails should only be sent to email addresses starting with 'v-' to ensure they are directed to the correct recipients. | Contractor emails look different from usual, so they might be phishing. | Well-written feedback clearly defines the expected recipient format, while the sample feedback is vague and lacks clear identification. |

### Resolve feedback failures

When the agent takes your feedback, it translates it into a lesson. If the agent doesn’t succeed in interpreting the feedback, a relevant message shows what caused the failure. You can address these failures based on the message returned by the agent.

Here are examples of failures you might encounter when writing feedback to the agent, and how you can resolve them.

| Failure message | Recommended action |
|:---|:---|
| :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/feedback-unsupported.png" alt-text="Screenshot the error message about unsupported features in the feedback provided" lightbox="/defender/media/agents-in-defender/phishing-triage/feedback-unsupported.png"::: </br> Part of the feedback provided can’t be addressed as the agent currently doesn’t support this type of input and therefore could not be translated to a lesson at all. | Rewrite your feedback and ensure that it addresses descriptions of the email that it can support. Then select **Evaluate feedback** to try again. |
| :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/feedback-irrelevant.png" alt-text="Screenshot the error message about irrelevant information in the feedback provided" lightbox="/defender/media/agents-in-defender/phishing-triage/feedback-irrelevant.png"::: </br> The feedback contains input that the agent can support but it’s not relevant to the email at hand and therefore could not be translated into an actionable lesson to be saved in the memory. | Rewrite your feedback and ensure that it follows the best practices. Select **Evaluate feedback** to try again. |
| :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/feedback-conflict.png" alt-text="Screenshot the error message about conflicting data in the feedback provided" lightbox="/defender/media/agents-in-defender/phishing-triage/feedback-conflict.png"::: </br> The given feedback conflicts with previous feedback given to a similar email. | In the [feedback management page](#view-and-manage-feedback-to-the-agent) search for the feedback ID to view the feedback that it conflicts with. Based on your review, you can:<br>- Reject the previous feedback in the feedback management page. Thereafter, select **Evaluate** to try inserting your feedback again.<br>- Rewrite your given feedback in a way that is not conflicting and then select **Evaluate feedback** for the agent to reevaluate your new input. |

> [!NOTE]
> You can choose not to resolve feedback failures. You can leave your feedback and select **Save** without checking the box for teaching the agent. The feedback won’t be saved to the agent’s memory and will only be documented on the feedback management page for your future tracking classification changes.

Once the agent is taught and equipped with organizational knowledge, it begins to refine its decision-making capabilities. This interactive teaching process ensures that the agent evolves continuously, delivering increasingly precise classifications and responses over time. By integrating feedback loops, the system adapts dynamically to the changing landscape of organizational priorities and incident patterns.

## Manage the Phishing Triage Agent

> [!NOTE]
> Viewing and managing the Phishing Triage Agent settings is only available to users with the **Security Copilot (read)** and **Security data basics (read)** permissions.

You can manage the Phishing Triage Agent’s settings, review its activity, and review user interaction with the agent. To do so, select **Manage agent** in the card above the incident queue. Alternatively, you can navigate to **Settings > Microsoft Defender XDR > Agents**.

### View agent’s previous activity

To view all previous runs by the agent:

1. Navigate to the **Overview** page under **Agents** in the Defender portal.
2. Select **View agent activity**. Once selected, the Security Copilot portal opens in a new tab. The tab opens to a table listing all the agent’s recent activities and details.

### View and manage feedback to the agent

> [!NOTE]
> Managing feedback is only available to users with the **Security Copilot (read)**, **Security data basics (read)**, and **Email & collaboration metadata (read)** permissions.

The Phishing Triage Agent uses feedback to improve its performance over time. It stores applicable feedback in its memory as lessons. You can view and manage user-submitted feedback for the Phishing Triage Agent by navigating to the Feedback management page.

This page provides a comprehensive list of all feedback submitted to the agent. You can review key details for each piece of feedback, including:

- The agent’s original classification and the user-applied change
- The original feedback provided by the user, when changing the classification
- The translated lesson generated by the agent (if applicable)
- Feedback status: in use, not in use, or conflict
- The user who provided the feedback
- Feedback submission date, feedback ID, alert ID, and the incident ID

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-feedback-management.png" alt-text="Screenshot of the Feedback management page" lightbox="/defender/media/agents-in-defender/phishing-triage/phishing-triage-feedback-management.png":::

Feedback status can mean:

| Status | Description |
|:---|:---|
| In use | The feedback was successfully converted into a lesson in the agent’s memory and is actively used to triage and classify similar incidents. |
| Conflict | The feedback provided conflicted with previously provided feedback in a similar incident. Learn how you can [resolve feedback failures](#resolve-feedback-failures). |
| Not in use | The feedback was either not incorporated into the agent's memory or not marked by the user for teaching. Rejected lessons appear as "not in use" and are saved only for auditing, not for triaging and classifying incidents. For more details, click the details panel. |

> [!TIP]
> Feedback can only be managed individually. Bulk management of multiple feedback entries is not currently supported.

To review the details of a specific feedback, select an entry from the feedback list. In the **Review feedback** pane, check the details of the feedback provided, the agent’s lesson, the classification changes, and other important details. You can use these details to decide whether to retain the feedback in the agent’s memory or reject it.

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/review-feedback-pane.png" alt-text="Screenshot of the Review feedback pane" lightbox="/defender/media/agents-in-defender/phishing-triage/review-feedback-pane.png":::

> [!NOTE]
> Rejecting feedback provided to the agent is only available to users with the **Security Administrator** role.

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-identity-management.png" alt-text="Screenshot of the Identity and role management page":::

To reject specific feedback, open the Review feedback pane and select **Reject feedback**. When you do so, the agent records it as rejected and stops using it in future triage decisions.

:::image type="content" source="/defender/media/agents-in-defender/phishing-triage/feedback-rejected.png" alt-text="Screenshot of rejected feedback" lightbox="/defender/media/agents-in-defender/phishing-triage/feedback-rejected.png":::

### Change the agent’s identity and role

> [!NOTE]
> Changing the Phishing Triage Agent’s identity is only available to users with the **Security Administrator** role.

The agent’s identity and role can be managed at any time by navigating to the **Identity and role** page under **Agents**. On this page, users can view the agent's current identity, access details about the last update, and select a new identity type for the agent if required. The process of changing an identity is similar to the initial setup of the agent’s identity and role.

### Pause or resume the agent

> [!NOTE]
> Pausing the Phishing Triage Agent is only available to users with the **Security Administrator** role.

Pausing the agent temporarily stops all triage activity, including any in-progress triage tasks. The agent doesn’t process new incidents until it’s resumed. Resuming the agent resumes all its activities, allowing it to start triaging and classifying incoming alerts again.

To pause or resume the agent:

1. Navigate to the **Overview** page under **Agents** in Defender portal.
2. Select **Pause** to temporarily stop the agent. Once paused, the button updates to **Resume**, which you can select when you’re ready to reactivate the agent’s activities.

   :::image type="content" source="/defender/media/agents-in-defender/phishing-triage/phishing-triage-overview.png" alt-text="Screenshot of the Agents Overview page highlighting the pause agent option":::

### Remove the agent

> [!NOTE]
> Removing the Phishing Triage Agent is only available to users with the **Security Administrator** role.

Removing the agent permanently disables it. Once removed, triage and classification of new incidents stop, and all feedback is deleted. However, the history of previously triaged incidents is retained for your reference.

To remove the agent, navigate to the **Overview** page under **Agents**, then select **Remove agent**.

## Frequently asked questions

Following are responses to commonly asked questions about the Phishing Triage Agent. For information about the agent's capabilities and requirements, navigate to the [overview](#overview) and [prerequisites](#prerequisites) sections of this article.

### When is the agent triggered?

The agent automatically runs when a user reports a potential phishing attempt, and an alert is created.

### Why is the Phishing Triage Agent important?

Phishing remains one of the most common methods by which attackers gain initial access to systems. While security tools effectively block most threats, some still manage to slip through, overwhelming inboxes and leaving email users uncertain whether a suspicious email is a legitimate phishing attempt or harmless spam. This uncertainty often leads to an influx of user-submitted reports. Consequently, managing these incidents becomes a tedious and repetitive task for Security Operations Center (SOC) analysts. Each alert may require up to 30 minutes of manual triage, demanding significant effort to sift through a large volume of incidents in search of the genuine threat amidst all the noise. This effort overwhelms analysts, who have a limited amount of time to dedicate to completing critical demands. By alleviating the burden of reactive work, the Phishing Triage Agent empowers analysts to focus on proactive security measures, ultimately strengthening organizations’ overall security postures.

### Can the Phishing Triage Agent be trusted?

Microsoft AI agents follow strict Responsible AI guidelines and undergo thorough reviews to ensure compliance with all AI standards and safeguards. Security Copilot’s Phishing Triage Agent is fully incorporated into these controls. During setup, the agent is assigned an identity and configured with the minimum required permissions for its operation, ensuring that it doesn’t have unnecessary permissions. Furthermore, all agent activities are logged in detail, with the complete flow available for review by analysts and admins at any time. Feedback provided to the agent to help it adapt to the organization’s environment is logged, reflected in the system, and accessible for review and modification by admins as needed.

### How does the agent differ from a standard SOAR solution?

While both SOAR solutions and the Phishing Triage Agent aim to automate aspects of security operations, their approaches are fundamentally different. SOAR tools rely on static, policy- and rule-based workflows that require predefined logic and manual tuning. In contrast, the agent uses recursive reasoning to autonomously complete tasks—learning, adapting, and improving over time.

The agent doesn’t need to be reprogrammed for every new situation. Within defined boundaries, it adjusts to the task at hand, making it far more flexible than traditional automation. Rather than being rigid and reactive, it continuously evolves with your environment and threat landscape, guided by analyst feedback and grounded in real data. Purpose-built for security teams, the Phishing Triage Agent helps accelerate responses and reduces manual workloads, freeing up analysts to focus on strategic initiatives.

### What level of visibility and control do I have over the agent?

Microsoft provides tools for organizations to maintain visibility into and control over the Phishing Triage Agent from deployment through ongoing operations. [The agent adheres to Microsoft’s Responsible AI (RAI) standards](/copilot/security/rai-faqs-security-copilot-agents) for fairness, reliability, safety, privacy, security, inclusiveness, transparency, and accountability.

Administrators configure the agent’s identity and access levels during installation, following least-privilege principles. Security and IT teams can authorize specific actions, monitor performance, and review outputs directly in Microsoft Defender. Capacity consumption and data access limits are also configurable by administrators.

The Phishing Triage Agent operates within a zero-trust environment. The system enforces organizational policies on every agent action by evaluating the intent and scope of each operation. All decisions, reasoning, and actions taken by the agent are transparently documented as a decision tree within Defender and recorded in Microsoft Purview audit logs for traceability and compliance.

## Related content

- [Microsoft Security Copilot agents](/copilot/security/agents-overview)
- [Responsible AI FAQs for Security Copilot Agent](/copilot/security/rai-faqs-security-copilot-agents)