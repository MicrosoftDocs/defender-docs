---
title: Delegate recommendations with Microsoft Security Copilot
author: Elazark
ms.ms.author: elkrieger
description: Learn how to delegate recommendations with Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 09/25/2025
#customer intent: As a security professional, I want to understand how to use Copilot to delegate recommendations in Defender for Cloud so that I can improve my security posture.
---

# Delegate recommendations with Microsoft Security Copilot

Microsoft Defender for Cloud's integration with Microsoft Security Copilot lets you delegate recommendations on the recommendations page with natural language prompts. You can delegate recommendations to another person or team.

Delegating recommendations can improve your security posture by having the right people address the risks and vulnerabilities in your environment.

## Prerequisites

- [Enable Defender for Cloud on your environment](connect-azure-subscription.md).

- [Have access to Azure Copilot](/azure/copilot/overview).

- [Have Security Compute Units assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Delegate a recommendation

Use Copilot to delegate recommendations so the right person or team handles the risks and vulnerabilities in your environment.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Recommendations**.

1. Select a recommendation.

1. Select **Summarize with Copilot**.

1. Review the summary.

1. Select **Generate message with Copilot**.

1. Delegate the recommendation with the provided prompts.

After you delegate the recommendation, you can monitor the progress of the remediation on Defender for Cloud's recommendations page. Copilot stays open, and you can enter other prompts as needed.

## Next step

> [!div class="nextstepaction"]
> [Remediate code with Microsoft Security Copilot](remediate-code-with-copilot.md)
