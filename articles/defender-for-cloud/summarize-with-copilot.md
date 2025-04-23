---
title: Summarize recommendations with Microsoft Security Copilot
author: Elazark
ms.author: elkrieger
description: Learn how to summarize recommendations with Microsoft Security Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 04/23/2025
#customer intent: As a security professional, I want to understand how to use Copilot to summarize recommendations in Defender for Cloud so that I can improve my security posture.
---

# Summarize recommendations with Microsoft Security Copilot

Microsoft Defender for Cloud's integration with Microsoft Security Copilot lets you summarize a recommendation to understand the risks and vulnerabilities in your environment better.

By summarizing a recommendation, you can get a quick overview of the recommendation in natural language. This summary helps you understand the information presented in a recommendation and lets you prioritize your remediation efforts.

## Prerequisites

- [Enable Defender for Cloud on your environment](connect-azure-subscription.md).

- [Have access to Azure Copilot](/azure/copilot/overview).

- [Have Security Compute Units assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Summarize with Copilot

Once a recommendation is selected, you can summarize it with Copilot. By using prompts, you can get a better understanding of the recommendation and decide how best to handle it.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Recommendations**.

1. Select a recommendation.

1. Select **Summarize with Copilot**.

    :::image type="content" source="media/summarize-with-copilot/summarize-with-copilot.png" alt-text="Screenshot of a recommendation that shows where the Summarize with Copilot button is located." lightbox="media/summarize-with-copilot/summarize-with-copilot.png":::

1. Review the provided summary.

1. Enter more prompts as needed.

    :::image type="content" source="media/summarize-with-copilot/summarize-with-copilot-results.png" alt-text="Screenshot of the Copilot window that shows the summary of the recommendation." lightbox="media/summarize-with-copilot/summarize-with-copilot-results.png":::

Once you understand the recommendation better, you can decide how best to handle it. Copilot remains open and you can enter other prompts as needed.

## Next step

> [!div class="nextstepaction"]
> [Remediate recommendations with Microsoft Security Copilot](remediate-with-copilot.md)
