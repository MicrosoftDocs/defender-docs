---
title: Copilot for Security in Defender for Cloud (Preview)
description: Learn about the benefits of copilot in Microsoft Defender for Cloud and how it applies to analyzing your security posture.
ms.date: 08/14/2024
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
# customer intent: As a security professional, I want to understand the benefits of Copilot in Microsoft Defender for Cloud and how it can help me analyze my security posture.
---

# Copilot for Security in Defender for Cloud (Preview)

Microsoft Copilot for Security is a cloud-based AI platform that provides natural language copilot experience. It can help support security professionals to understand the context of a recommendation, the effect of implementing a recommendation, assist with remediating or delegating a recommendation, and assist with the remediation of misconfigurations in code. For more information about what Copilot for Security can do, go to [What is Microsoft Copilot for Security?](/copilot/security/microsoft-security-copilot)

Microsoft Defender for Cloud's embedded integration with Copilot for Security on the recommendations page, allows you to improve your security posture and reduce risks found in your environments. The integration can assist you with understanding the context of a recommendation, and assist you with the remediation process.

## How Copilot works in Defender for Cloud

Defender for Cloud has integrated Copilot directly in to the Defender for Cloud experience. This integration allows you to analyze, summarize, remediate, and delegate your recommendations with natural language prompts

:::image type="content" source="media/copilot-security-in-defender-for-cloud/analyze-copilot.png" alt-text="Screenshot that shows where the Analyze with copilot button located on the recommendations page." lightbox="media/copilot-security-in-defender-for-cloud/analyze-copilot.png":::

When you open Copilot, you can use natural language prompts to ask questions about the recommendations. Copilot provides you with a response in natural language that helps you understand the context of the recommendation, the effect of implementing the recommendation, and the steps to take to implement the recommendation.

Some sample prompts include:

- Show critical risks for publicly exposed resources
- Show critical risks to sensitive data
- Show resources with high severity vulnerabilities

Copilot can also assist with each recommendation and can refine your recommendations, provide a summary of individual recommendations, remediation steps for recommendations, and allow you to delegate recommendations.

:::image type="content" source="media/copilot-security-in-defender-for-cloud/summarize-copilot.png" alt-text="Screenshot of a recommendation that shows where the Summarize with Copilot button is located." lightbox="media/copilot-security-in-defender-for-cloud/summarize-copilot.png":::

### Data processing workflow

When you use Copilot for Security in Defender for Cloud, the following data processing workflow occurs:

1. A user enters a prompt in the Copilot interface.
1. The prompt is received by the Azure orchestrator, which is a part of Copilot for Azure.
1. Copilot for Azure evaluates the prompt and the active page, to determine the skills needed to resolve the prompt.
1. If the prompt is security related and the skill is available, the orchestrator sends the prompt to Copilot for Security which executes the skills, and sends back an appropriate response to Copilot in Azure to be presented to you.
1. If the prompt is security related but the skill is unavailable, Azure Copilot will search all of its available skills to find the most relevant skills to resolve the prompt, and sends back an appropriate response to Copilot in Azure to be presented to you.

    :::image type="content" source="media/copilot-security-in-defender-for-cloud/data-process-workflow.png" alt-text="Conceptual image that shows the data process workflow of the Copilot experience in Defender for Cloud." lightbox="media/copilot-security-in-defender-for-cloud/data-process-workflow.png":::

Check out the Copilot for Securtiy [FAQs](faq-copilot).

## Copilot's capabilities in Defender for Cloud

Copilot for Security in Defender for Cloud isn't reliant on any of the available plans in Defender for Cloud and is available for all users when you:

1. [Enable Defender for Cloud on your environment](connect-azure-subscription.md).
1. [Have access to Azure Copilot](/azure/copilot/overview).
1. [Have Security Compute Units assigned for Copilot for Security](/copilot/security/get-started-security-copilot).

However, in order to enjoy the full range of Copilot for Security's capabilities in Defender for Cloud, we recommend enabling the [Defender for Cloud Security Posture Management (DCSPM) plan](concept-cloud-security-posture-management.md#cspm-features) on your environments. The DCSPM plan includes many extra security features such as [Attack path analysis](how-to-manage-attack-path.md), [Risk prioritization](risk-prioritization.md) and more, all of which can be navigated and managed using Copilot for Security. Without the DCSPM plan, you're still able to use Copilot for Security in Defender for Cloud, but in a limited capacity.

## Monitor your usage

Copilot for Security has a usage limit. When the usage in your organization is nearing its limit, you're notified when you submit a prompt. To avoid a disruption of service, you need to contact the Azure capacity owner or contributor to increase the Security Compute Units (SCU) or limit the number of prompts.

Learn more about [usage limits](/copilot/security/manage-usage). 

## Related content

- [Analyze recommendations with Copilot for Security](analyze-with-copilot.md)
- [Summarize recommendations with Copilot for Security](summarize-with-copilot.md)
- [Remediate recommendations with Copilot for Security](remediate-with-copilot.md)
- [Delegate recommendations with Copilot for Security](delegate-with-copilot.md)
- [Remediate code with Copilot for Security](remediate-code-with-copilot.md)
