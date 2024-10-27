---
title: Microsoft Security Copilot in Defender for Cloud (Preview)
description: Learn about the benefits of copilot in Microsoft Defender for Cloud and how it applies to analyzing your security posture.
ms.date: 08/21/2024
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
ai-usage: ai-assisted
# customer intent: As a security professional, I want to understand the benefits of Copilot in Microsoft Defender for Cloud and how it can help me analyze my security posture.
---

# Microsoft Security Copilot in Defender for Cloud (Preview)

Microsoft Defender for Cloud integrates both Microsoft Security Copilot and Microsoft Copilot for Azure into its experience. With these integrations, you can ask security-related questions, receive responses, and automatically trigger the necessary skills needed to analyze, summarize, remediate, and delegate recommendations using natural language prompts.

Both [Microsoft Security Copilot](/copilot/security/microsoft-security-copilot) and [Copilot for Azure](/azure/copilot/overview?wt.mc_id=copilot_1a_webpage_gdc) are cloud-based AI platforms that provide a natural language copilot experience. They assist security professionals in understanding the context and effect of recommendations, remediating or delegating tasks, and addressing misconfigurations in code.

Defender for Cloud's integration with Microsoft Security Copilot and Copilot for Azure on the recommendations page allows you to enhance your security posture and mitigate risks in your environments. This integration streamlines the process of understanding and implementing recommendations, making your security management more efficient and effective.

## How Copilot works in Defender for Cloud

Defender for Cloud integrates Copilot directly in to the Defender for Cloud experience. This integration allows you to analyze, summarize, remediate, and delegate your recommendations with natural language prompts

:::image type="content" source="media/copilot-security-in-defender-for-cloud/analyze-copilot.png" alt-text="Screenshot that shows where the Analyze with copilot button located on the recommendations page." lightbox="media/copilot-security-in-defender-for-cloud/analyze-copilot.png":::

When you open Copilot, you can use natural language prompts to ask questions about the recommendations. Copilot provides you with a response in natural language that helps you understand the context of the recommendation. It also explains the effect of implementing the recommendation and provides steps to take for implementation.

Some sample prompts include:

- Show critical risks for publicly exposed resources
- Show critical risks to sensitive data
- Show resources with high severity vulnerabilities

Copilot can assist with refining recommendations, providing summaries, remediation steps, and delegation. It enhances your ability to analyze and act on recommendations. 

:::image type="content" source="media/copilot-security-in-defender-for-cloud/summarize-copilot.png" alt-text="Screenshot of a recommendation that shows where the Summarize with Copilot button is located." lightbox="media/copilot-security-in-defender-for-cloud/summarize-copilot.png":::

### Data processing workflow

When you use Microsoft Security Copilot in Defender for Cloud, the following data processing workflow occurs:

1. A user enters a prompt in the Copilot interface.
1. Copilot for Azure receives the prompt.
1. Copilot for Azure evaluates the prompt and the active page, to determine the skills needed to resolve the prompt.
1. If the prompt is security related and the skill is available, Microsoft Security Copilot executes the skills and sends back a response to Copilot in Azure for presentation.
1. If a security-related prompt is received but the skill is unavailable, Azure Copilot searches all of its available skills to find the most relevant skills to resolve the prompt. A response is then sent to the user.

    :::image type="content" source="media/copilot-security-in-defender-for-cloud/data-process-workflow.png" alt-text="Diagram that shows the data process workflow of the Copilot experience in Defender for Cloud." lightbox="media/copilot-security-in-defender-for-cloud/data-process-workflow.png":::

Check out the [Microsoft Security Copilot FAQs](faq-copilot.yml).

## Copilot's capabilities in Defender for Cloud

Microsoft Security Copilot in Defender for Cloud isn't reliant on any of the available plans in Defender for Cloud and is available for all users when you:

1. [Enable Defender for Cloud on your environment](connect-azure-subscription.md).
1. [Have access to Azure Copilot](/azure/copilot/overview).
1. [Have Security Compute Units assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

However, in order to enjoy the full range of Microsoft Security Copilot's capabilities in Defender for Cloud, we recommend enabling the [Defender for Cloud Security Posture Management (DCSPM) plan](concept-cloud-security-posture-management.md#cspm-features) on your environments. The DCSPM plan includes many extra security features such as [Attack path analysis](how-to-manage-attack-path.md), [Risk prioritization](risk-prioritization.md) and more, all of which can be navigated and managed using Microsoft Security Copilot. Without the DCSPM plan, you're still able to use Microsoft Security Copilot in Defender for Cloud, but in a limited capacity.

## Monitor your usage

Microsoft Security Copilot has a usage limit. When the usage in your organization is nearing its limit, you're notified when you submit a prompt. To avoid a disruption of service, you need to contact the Azure capacity owner or contributor to increase the Security Compute Units (SCU) or limit the number of prompts.

Learn more about [usage limits](/copilot/security/manage-usage). 

## Related content

- [Analyze recommendations with Microsoft Security Copilot](analyze-with-copilot.md)
- [Summarize recommendations with Microsoft Security Copilot](summarize-with-copilot.md)
- [Remediate recommendations with Microsoft Security Copilot](remediate-with-copilot.md)
- [Delegate recommendations with Microsoft Security Copilot](delegate-with-copilot.md)
- [Remediate code with Microsoft Security Copilot](remediate-code-with-copilot.md)
