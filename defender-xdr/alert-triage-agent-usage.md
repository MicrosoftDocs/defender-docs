---
title: Use the Alert Triage Agent
description: Learn how to collaborate with the Alert Triage Agent, understand its decisions, and provide feedback to improve its performance in Microsoft Defender.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
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
ms.date: 01/25/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security analyst, I want to understand how to work with the Alert Triage Agent and provide feedback so that I can improve its effectiveness in triaging alerts.
---

# Use the Alert Triage Agent

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Once the Alert Triage Agent is set up and running, it automatically begins triaging alerts in your environment. This article explains how to collaborate with the agent, understand its decisions, and provide feedback to continuously improve its performance.

## How to collaborate with the agent

The Alert Triage Agent is designed to enhance incident response by working alongside your security team. Understanding how to effectively collaborate with the agent helps maximize its impact on your security operations.

### Agent workflow in incidents

To maintain transparency, the agent routinely updates incident fields during the triage process. When triaging starts, the agent assigns the alert to itself and adds an **Agent** tag to the corresponding incident. Analysts can filter the incident queue to see only incidents tagged by the agent, which simplifies oversight and prioritization.

> [!TIP]
> You can also filter the incident queue using the name of the identity you assigned to the Alert Triage Agent to see the incidents the agent is actively working on.

When an alert is identified as a true threat, the Alert Triage Agent marks it as a True Positive. This enables analysts to prioritize confirmed threats and respond more swiftly. With these alerts clearly flagged, analysts can easily filter the queue to focus on verified threats, resulting in significant queue reduction and minimizing the time spent sorting through false positives. This allows them to concentrate their efforts where they matter most.

:::image type="content" source="media/phishing-triage-agent/incident-queue-agent-only.png" alt-text="Screenshot of the incident queue filtered by the Phishing Triage Agent tag" lightbox="media/phishing-triage-agent/incident-queue-agent-only.png":::

## Understanding agent decisions and transparency

The Alert Triage Agent is purpose-built to clearly explain *why* and *how* it made each decision. For every alert it processes, it provides a detailed explanation in plain text along with a full graphical representation of its decision-making workflow. This level of transparency allows analysts to quickly interpret results, build trust in the agent's output, and focus their time on making informed decisions—rather than repeating manual steps in the triage process.

### Reviewing agent findings

To review the agent's findings, follow these steps:

1. Select an incident from the incident queue.
1. On the incident page, look for the Phishing Triage Agent card in the Copilot or Tasks side panel under the Guided Response Triage section. The task is marked as completed and assigned to the agent. The card presents the agent's verdict based on its classification, highlighting key pieces of incriminating evidence that informed the decision.

   :::image type="content" source="media/phishing-triage-agent/incident-main.png" alt-text="Screenshot of the incident page with the Phishing Triage Agent card highlighted" lightbox="media/phishing-triage-agent/incident-main.png":::

1. You can select the **More actions** ellipsis to view more alert details, copy the agent's classification details to the clipboard, or manage feedback.

   :::image type="content" source="media/phishing-triage-agent/more-actions-card.png" alt-text="Screenshot highlighting the more actions options within the Phishing Triage Agent card" lightbox="media/phishing-triage-agent/more-actions-card.png":::

1. To view the steps the agent took prior to reaching its classification, select **View agent activity** in the Phishing Triage Agent card. This shows the logic behind the agent's final classification.

   :::image type="content" source="media/phishing-triage-agent/view-agent-activity.png" alt-text="Screenshot highlighting the View agent activity pane." lightbox="media/phishing-triage-agent/view-agent-activity.png"::: 

## Teach the agent through feedback

The Alert Triage Agent continuously improves its decision-making based on feedback tailored to your organization's needs. Analysts can provide input in plain, natural language—no complex configurations required—making it easy to guide and shape the agent's behavior. This feedback is stored in the agent's memory, allowing it to adapt to how your organization interprets and classifies threats. Over time, this adaptation enhances the agent's accuracy and effectiveness in triaging future alerts, with your team in control.

### Providing feedback

To provide feedback and teach the agent, follow these steps:

1. In the incident page, look for the Alert Triage Agent card in the Copilot or Tasks side panel under the Guided Response triage section.
1. Review the agent's classification and reasoning displayed in the card's title and content. If the decision doesn't align with your organization's classification criteria, select **Change classification**. Alternatively, you can update the classification by selecting the specific alert from the **Alerts** tab, then choosing **Manage alert**.

   :::image type="content" source="media/phishing-triage-agent/change-classification.png" alt-text="Screenshot highlighting the Change classification option in the Phishing Triage Agent card" lightbox="media/phishing-triage-agent/change-classification.png":::

1. In the **Manage alert** pane, select the new classification from the **Classification** dropdown menu. Then, provide your reason for the change by filling out the **Why did you change this classification** field. This step records your input on the feedback management page for auditing purposes only. The agent won't use this feedback to improve its decision-making until you explicitly select **Use this feedback to teach the agent**. If you choose not to use this feedback for teaching the agent, you can select **Save**, which will only audit the feedback without inserting it into the agent's memory.

   :::image type="content" source="media/phishing-triage-agent/manage-alert-why.png" alt-text="Screenshot highlighting the classification and feedback fields in the Manage alert pane" lightbox="media/phishing-triage-agent/manage-alert-why.png":::

1. To apply your feedback, select **Use this feedback to teach the agent**. You can use the [guide to writing feedback](#best-practices-for-writing-feedback) to help you craft effective input, and then choose **Evaluate feedback** to allow you to preview how the agent translates your feedback into a lesson and assess whether the outcome aligns with your intent. Additionally, the feedback evaluation performs basic safety checks to ensure that the applied feedback is relevant for the agent to use and doesn't conflict with previous feedback.

   > [!NOTE]
   > You can only provide feedback to the agent once per alert, and it can only be used to teach the agent how to classify alerts, specifically by selecting either True Positive (threat) or False Positive (not malicious).
   > Always review your feedback and verify the AI-generated response before saving the lesson.

1. If the result meets your expectations, you can choose to insert the lesson into the agent's memory to influence its future decisions. Select **Save** to save the lesson and store it as a lesson in the agent's memory if applicable. All feedback recorded for audit purposes, and lessons added to the agent's memory, can be later reviewed in the [feedback management page](alert-triage-agent-management.md#view-and-manage-feedback-to-the-agent).

The agent utilizes stored feedback to triage and classify similar alerts in the future. When a relevant alert that matches the feedback characteristics is received, the agent applies this feedback to determine its classification, incorporating it as supporting evidence in its decision-making process.

## Best practices for writing feedback

Lessons provide systematic guidelines that help the agent determine whether an alert is a genuine threat or a false alarm. To ensure the agent effectively incorporates your feedback, follow these best practices when providing input to the Alert Triage Agent:

1. **Ensure feedback is relevant and contextual.** Feedback should pertain only to the alert currently under review. It must also align with the updated classification you've assigned.
1. **Be descriptive and specific.** Clearly explain the characteristics of the alert. Provide relevant details like the subject, message body, sender, or recipients to help the agent understand the context. Specific feedback with multiple details enhances effectiveness.
1. **Ensure clarity and decisiveness.** Avoid vague or universal statements. Give feedback that's clear and actionable. Use decisive and clear identification terms.
1. **Be consistent with previous feedback.** Ensure that new feedback aligns with what was previously provided to avoid contradictions that could confuse the agent or reduce the accuracy of its decisions. You can review all previously submitted input on the [Feedback](alert-triage-agent-management.md#view-and-manage-feedback-to-the-agent) management page.
1. **Review the agent's interpretation of your feedback.** When you submit feedback, always verify that the feedback is accurately translated into a lesson. Confirm that the lesson reflects your intent and maintains consistency with your original input. Check the validity of AI-generated responses to ensure they're applicable to the scenario.

### Examples of effective feedback

Here are examples of how you can write your feedback to the agent.

| Area                                | Examples of well-written feedback                                                                                                                                     | Examples of feedback that can lead to failure                                                                 | Comparison                                                                                                                                                                                                 |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Feedback about a sender             | Any email claiming to be from benefits providers must originate from "@benefits.company.com".                                                                        | The sender in the 2nd alert in the incident is not legitimate.                                                | Feedback must relate to the email in the current alert and its context. It will be tied to the chosen classification (even if not mentioned explicitly in the feedback) and used for similar future alerts. |
| Feedback about the sender and email body | Emails offering file sharing or document access should only come from our authorized provider Contoso.com.                                                           | Emails offering file sharing or document access should only come from our authorized providers.              | Well-written feedback clearly states specific requirements (for example, sender domain), while vague references (for example "authorized providers") do not contain actionable information.                              |
| Feedback about email subject        | Any email that its subject contains a request for billing transaction is not allowed in our organization and is considered as phishing.                              | If the subject has a positive natural sentiment, it's legitimate.                                             | Feedback that is descriptive and specific can be effectively validated, while subjective feedback may lead to unintended outcomes.                                                                         |
| Feedback about the email body       | Emails requesting credential verification should include a reference to the specific account or service. Any generic 'verify your account' request without details should be treated as phishing. | This email should be treated as phishing.                                                                     | Feedback that includes detailed information is more likely to be clearly understood, while feedback lacking detail may be interpreted in various ways and could lead to unpredictable outcomes.             |
| Feedback about a recipient and email body | This email was sent to multiple employees, and the body instructs recipients to download an 'important attachment' without describing its contents—legitimate emails always specify attachment details. | Mass internal emails with attachments are phishing.                                                           | Feedback that highlights specific missing details commonly found in legitimate emails is more effective. Feedback that contains broad generalizations (mass emails) or vague terms (such as "internal") may lead to an excessive number of true positives.  |
| Feedback about a recipient and a domain | New contractor onboarding emails should only be sent to email addresses starting with 'v-' to ensure they are directed to the correct recipients.                    | Contractor emails look different from usual, so they might be phishing.                                      | Well-written feedback clearly defines the expected recipient format, while feedback that is indecisive ("might be") and lacks clear identification criteria ("looks different from usual" without specifying what is different), makes detection unreliable.                               |

## Resolve feedback failures

When the agent takes your feedback, it translates it into a lesson. If the agent doesn't succeed in interpreting the feedback, a relevant message shows what caused the failure. You can address these failures based on the message returned by the agent.

Here are examples of failures you might encounter when writing feedback to the agent, and how you can resolve them.

| Failure message | Recommended action |
|:---|:---|
| :::image type="content" source="media/phishing-triage-agent/feedback-irrelevant.png" alt-text="Screenshot the error message about irrelevant information in the feedback provided" lightbox="media/phishing-triage-agent/feedback-irrelevant.png":::  </br> Part of the feedback provided can't be addressed as the agent currently doesn't support this type of input and therefore couldn't be translated to a lesson at all. | Rewrite your feedback and ensure that it follows the best practices. Select **Evaluate feedback** to try again.  |
|:::image type="content" source="media/phishing-triage-agent/feedback-unsupported.png" alt-text="Screenshot the error message about unsupported features in the feedback provided" lightbox="media/phishing-triage-agent/feedback-unsupported.png"::: </br> The feedback contains input that the agent can support but it's not relevant to the email at hand and therefore couldn't be translated into an actionable lesson to be saved in the memory. | Rewrite your feedback and ensure that it addresses descriptions of the email that it can support. Then select **Evaluate feedback** to try again. |
| :::image type="content" source="media/phishing-triage-agent/feedback-conflict.png" alt-text="Screenshot the error message about conflicting data in the feedback provided" lightbox="media/phishing-triage-agent/feedback-conflict.png"::: </br> The given feedback conflicts with previous feedback given to a similar email. | In the [feedback management page](alert-triage-agent-management.md#view-and-manage-feedback-to-the-agent) search for the feedback ID to view the feedback that it conflicts with. Based on your review, you can:<br>- Reject the previous feedback in the feedback management page. Thereafter, select **Evaluate** to try inserting your feedback again.<br>- Rewrite your given feedback in a way that isn't conflicting and then select **Evaluate feedback** for the agent to reevaluate your new input. |

> [!NOTE]
> You can choose not to resolve feedback failures. You can leave your feedback and select **Save** without checking the box for teaching the agent. The feedback won't be saved to the agent's memory and will only be documented on the feedback management page for your future tracking classification changes.

Once the agent is taught and equipped with organizational knowledge, it begins to refine its decision-making capabilities. This interactive teaching process ensures that the agent evolves continuously, delivering increasingly precise classifications and responses over time. By integrating feedback loops, the system adapts dynamically to the changing landscape of organizational priorities and incident patterns.

## Next steps

- [Monitor and manage the agent](alert-triage-agent-management.md)
- [Review frequently asked questions](alert-triage-agent-faq.md)

## Related content

- [Alert Triage Agent overview](alert-triage-agent-overview.md)
- [Set up the Alert Triage Agent](alert-triage-agent-setup.md)
- [Microsoft Security Copilot agents](/copilot/security/agents-overview)