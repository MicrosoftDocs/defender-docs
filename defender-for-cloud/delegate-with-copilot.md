---
title: Delegate recommendations with Microsoft Security Copilot
description: Learn how to delegate recommendations with Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security professional, I want to understand how to use Copilot to delegate recommendations in Defender for Cloud so that I can improve my security posture.
ai-usage: ai-assisted
---

# Delegate recommendations with Microsoft Security Copilot

Use Microsoft Security Copilot prompts to delegate recommendations in Defender for Cloud. Assign a recommendation to a person or team. The right people can then handle risks in your environment. This article walks you through how to use Copilot to summarize a recommendation, generate a delegation message, and track remediation progress.

## Prerequisites

Before you start, make sure you meet these requirements:

- [Enable Defender for Cloud on your environment](connect-azure-subscription.md).

- [Access to Azure Copilot](/azure/copilot/overview).

- [Security Compute Units (SCUs) assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Delegate a recommendation

To assign a recommendation to the right person or team for remediation:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Recommendations**.

1. Select a recommendation.

1. Select **Summarize with Copilot**.

1. Review the summary.

1. Select **Generate message with Copilot**.

1. Delegate the recommendation with the provided prompts.

After you delegate the recommendation, monitor remediation progress on the Recommendations page. Copilot stays open, so you can enter more prompts as needed.

<a name="next-step"></a>
## Next steps

> [!div class="nextstepaction"]
> [Remediate code with Microsoft Security Copilot](remediate-code-with-copilot.md)

