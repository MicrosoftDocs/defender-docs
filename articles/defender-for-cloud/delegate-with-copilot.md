---
title: Delegate recommendations with Microsoft Security Copilot
author: ElazarK
ms.author: elkrieger
description: Learn how to delegate recommendations with Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 05/28/2026
#customer intent: As a security professional, I want to understand how to use Copilot to delegate recommendations in Defender for Cloud so that I can improve my security posture.
---

# Delegate recommendations with Microsoft Security Copilot

To improve your security posture, delegate recommendations from Microsoft Defender for Cloud by using Microsoft Security Copilot prompts. You can assign a recommendation to another person or team so the right people handle the risks and vulnerabilities in your environment.

## Prerequisites

Before you delegate recommendations, make sure you have the following requirements in place:

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

## Next step

> [!div class="nextstepaction"]
> [Remediate code with Microsoft Security Copilot](remediate-code-with-copilot.md)

