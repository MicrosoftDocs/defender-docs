---
title: Remediate Recommendations
description: Improve the security posture of your environments by remediating security recommendations in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
ms.date: 05/19/2025
ai-usage: ai-assisted
#customer intent: As a security professional, I want to understand how to remediate security recommendations in Microsoft Defender for Cloud so that I can improve my security posture.
---

# Remediate recommendations in Microsoft Defender for Cloud

When you protect your resources and workloads with Microsoft Defender for Cloud, they're assessed against built-in and custom security standards enabled in your Azure subscriptions, Amazon Web Services (AWS) accounts, and Google Cloud Platform (GCP) projects. Based on those assessments, security recommendations provide practical steps to remediate security issues and improve security posture.

This article describes how to remediate security recommendations in your Defender for Cloud deployment.

Before you attempt to remediate a recommendation, you should review it in detail. Learn how to [review security recommendations](review-security-recommendations.md).

## <a name = "remediate-recommendations"></a> Remediate a recommendation

By default, recommendations are prioritized based on the risk level of the security issue.

In addition to risk level, we recommend that you prioritize the security controls in the default [Microsoft cloud security benchmark](concept-regulatory-compliance.md) standard in Defender for Cloud. These controls affect your [Microsoft Secure Score](secure-score-security-controls.md).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

    :::image type="content" source="media/implement-security-recommendations/recommendations-page.png" alt-text="Screenshot of the recommendations page that shows all of the affected resources by their risk level." lightbox="media/implement-security-recommendations/recommendations-page.png":::

1. Select a recommendation.

1. Select **Take action**.

1. Locate the **Remediate** section and follow the remediation instructions.

    :::image type="content" source="./media/implement-security-recommendations/remediate-recommendation.png" alt-text="Screenshot that shows manual remediation steps for a recommendation." lightbox="./media/implement-security-recommendations/remediate-recommendation.png":::

## Use the Fix option

To simplify the remediation process, a button labeled **Fix** might appear in a recommendation. The **Fix** button helps you quickly remediate a recommendation on multiple resources. If there isn't a **Fix** button in the recommendation, then you can't apply a quick fix, so you must follow the presented remediation steps to address the recommendation.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Select a recommendation to remediate.

1. Select **Take action** > **Fix**.

    :::image type="content" source="./media/implement-security-recommendations/microsoft-defender-for-cloud-recommendations-fix-action.png" alt-text="Screenshot that shows recommendations with the Fix action." lightbox="./media/implement-security-recommendations/microsoft-defender-for-cloud-recommendations-fix-action.png":::

1. Follow the rest of the remediation steps.

After remediation completes, it can take several minutes for the change to take place.

## <a name = "use-the-automated-remediation-scripts"></a> Use automated remediation scripts

Security admins can also fix issues at scale with automatic script generation in AWS and GCP CLI script language. When you select **Take action** > **Fix** on a recommendation where an automated script is available, the following window opens.

:::image type="content" source="./media/implement-security-recommendations/automated-remediation-scripts.png" alt-text="Screenshot that shows recommendations with the automated remediation script." lightbox="./media/implement-security-recommendations/automated-remediation-scripts.png":::

To remediate the recommendation, copy and run the script.

## Next step

> [!div class="nextstepaction"]
> [Governance rules in your remediation processes](governance-rules.md)
