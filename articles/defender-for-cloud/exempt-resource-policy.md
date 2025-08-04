---
title: Create exemptions based on policies
description: Learn how to create exemptions for how policies are applied to resources in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 08/04/2025
---

# Create exemptions based on policies

In Microsoft Defender for Cloud, creating policy-based exemptions to recommendations allows organizations to tailor their security posture by excluding specific resources or scenarios where a recommendation is not applicable, already mitigated through alternative controls, or where the risk is consciously accepted. This helps reduce alert fatigue, improves the accuracy of the secure score by removing irrelevant penalties, and ensures that security teams can focus on actionable and meaningful insights rather than generic or redundant alerts.

## Create an exemption

To tailor your security posture you can create exemptions for recommendations that are not applicable or already mitigated. 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings** > **Exemptions**.

    :::image type="content" source="media/exempt-resource-policy/exemptions.png" alt-text="Screenshot that shows where the exemptions button is located on the environment settings screen." lightbox="media/exempt-resource-policy/exemptions.png":::

1. Select **+ Create**.

1. Enter an Exemption name.

1. Select a Cloud platform.

1. Select, either a Management group, subscription or resource (per subscription).

1. Select a category, <br>

    1. **Mitigated** 
     
        Or, 

    1. **Waiver (risk accepted)**.

1. (Optional) Select an expiry date.

1. Select **Next**.

1. Select either: <br>

    1. **Selected recommendations** and the specific recommendations to exempt.
    
        Or,

    1. **Recommendation category** and the  category to exempt.

1. Select **Next**.

1. Select **Create**.

The exemption is created and applied to the selected resources or recommendations.

If you want to view or manage existing exemptions, you can return to the **Exemptions** page in the Defender for Cloud menu and select the three dot button **...** next to the exemption you want to manage. From there, you can edit or delete the exemption as needed.

## Next step

> [!div class="nextstep"]
> [Remediate recommendations](implement-security-recommendations.md)  