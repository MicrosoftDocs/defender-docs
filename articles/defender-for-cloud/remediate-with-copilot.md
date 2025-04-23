---
title: Remediate recommendations with Microsoft Security Copilot
author: Elazark
ms.author: elkrieger
description: Learn how to remediate recommendations with Copilot in Microsoft Defender for Cloud and improve your security posture.
ms.topic: how-to
ms.date: 04/23/2025
#customer intent: As a security professional, I want to understand how to use Copilot to remediate recommendations in Defender for Cloud so that I can improve my security posture.
---

# Remediate recommendations with Microsoft Security Copilot

Microsoft Defender for Cloud's integration with Microsoft Security Copilot lets you remediate recommendations on the recommendations page with natural language prompts. Remediating recommendations with Microsoft Security Copilot lets you improve your security posture by addressing the risks and vulnerabilities in your environment.

Once a recommendation is summarized with Microsoft Security Copilot in Defender for Cloud, you can decide how best to handle it. Using prompts, you can have Microsoft Security Copilot assist you in the remediation process.

## Prerequisites

- [Enable Defender for Cloud on your environment](connect-azure-subscription.md).

- [Have access to Azure Copilot](/azure/copilot/overview).

- [Have Security Compute Units assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Remediate a recommendation

Copilot in Defender for Cloud can assist with the remediation process for recommendations.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Recommendations**.

1. Select a recommendation.

1. Select **Summarize with Copilot**.

1. Review the summary.

1. Select **Help me remediate this recommendation**.

    :::image type="content" source="media/remediate-with-copilot/help-remediate.png" alt-text="Screenshot that shows where the help remediate the recommendation button is located." lightbox="media/remediate-with-copilot/help-remediate.png":::

1. To remediate the recommendation, review the suggested remediation information and follow the instructions.

1. (Optional) If a script is presented, select **Run** to apply the remediation.

    :::image type="content" source="media/remediate-with-copilot/run-script.png" alt-text="Screenshot that shows where the run button is located in order to run the script.":::

If you're unable or unsure how to remediate a recommendation, you can ask Copilot for additional information to assist you with more prompts. You can also delegate the recommendation to an appropriate person if needed.

## Next step

> [!div class="nextstepaction"]
> [Delegate recommendations with Microsoft Security Copilot](delegate-with-copilot.md)
