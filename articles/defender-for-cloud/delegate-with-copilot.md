---
title: Delegate recommendations using Microsoft Security Copilot
author: Elazark
ms.author: elkrieger
description: Learn how to delegate recommendations with Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 10/15/2025
#customer intent: As a security professional, I want to understand how to use Copilot to delegate recommendations in Defender for Cloud so that I can improve my security posture.
---

# Delegate recommendations using Microsoft Security Copilot

Microsoft Defender for Cloud's integration with Microsoft Security Copilot lets you use natural language prompts to delegate security recommendations directly from the Recommendations page.

Delegating recommendations ensures that vulnerabilities and risks are handled by the appropriate owners, helping your organization maintain a stronger security posture.

## Prerequisites

Before you begin, make sure you:

- [Enable Defender for Cloud on your environment](connect-azure-subscription.md).

- [Have access to Azure Copilot](/azure/copilot/overview).

- [Have Security Compute Units assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Delegate a recommendation

Use Copilot to delegate recommendations to the right person or team for each identified risk.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Recommendations**.

1. Select a recommendation.

1. Select **Summarize with Copilot** to generate a summary of the issue.

1. Review the summary and select **Generate message with Copilot**.

1. Follow the prompt to delegate the recommendation to a person or team.

After delegating, you can monitor remediation progress from the **Recommendations** page. Copilot stays open so you can enter other prompts or summaries as needed.

## Next step

> [!div class="nextstepaction"]
> [Remediate code with Microsoft Security Copilot](remediate-code-with-copilot.md)
