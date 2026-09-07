---
title: Remediate recommendations with Microsoft Security Copilot
description: Learn how to remediate recommendations with Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security professional, I want to understand how to use Copilot to remediate recommendations in Defender for Cloud so that I can improve my security posture.
ai-usage: ai-assisted
---

# Remediate recommendations with Microsoft Security Copilot

Microsoft Defender for Cloud integrates with Microsoft Security Copilot so you can remediate recommendations from the recommendations page by using natural language prompts. This workflow helps you reduce risk and improve your security posture.

Once Security Copilot summarizes a recommendation in Defender for Cloud, you can choose how to handle it. You can then use prompts to guide the remediation process. Before you start, make sure you have Defender for Cloud enabled, access to Azure Copilot, and Security Compute Units assigned for Security Copilot.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- [Enable Microsoft Defender for Cloud](connect-azure-subscription.md).

- [Azure Copilot overview](/azure/copilot/overview).

- [Get started with Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Remediate a recommendation

Copilot in Defender for Cloud can help you remediate recommendations.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Recommendations**.

1. Select a recommendation.

1. Select **Summarize with Copilot**.

1. Review the summary.

1. Select **Fix with Copilot**.

1. Follow the prompts to have Copilot fix the recommendation.

1. (Optional) If a script is presented, select **Run** to apply the remediation.

If you're unable or unsure how to remediate a recommendation, you can ask Copilot for more information. You can also delegate the recommendation to an appropriate person if needed.

<a name="next-step"></a>
## Next steps

> [!div class="nextstepaction"]
> [Delegate recommendations with Microsoft Security Copilot](delegate-with-copilot.md)
