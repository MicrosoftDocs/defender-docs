---
title: Create exemptions based on policies
description: Learn how to create exemptions for how policies are applied to resources in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 08/05/2025
---

# Create exemptions based on policies


Microsoft Defender for Cloud lets you create policy-based exemptions for security recommendations. Use these exemptions to exclude resources or scenarios where recommendations don't apply, you've already applied other controls, or you've accepted the risk.

This approach reduces alert fatigue, improves secure score accuracy by removing irrelevant penalties, and helps security teams focus on meaningful insights instead of generic alerts.

## Create an exemption

To tailor your security posture, you can create exemptions for recommendations that aren't applicable or already mitigated. 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings** > **Exemptions**.

    :::image type="content" source="media/exempt-resource-policy/exemptions.png" alt-text="Screenshot that shows where the exemptions button is located on the environment settings screen." lightbox="media/exempt-resource-policy/exemptions.png":::

1. Select **+ Create**.

1. Enter an Exemption name, and (Optinal) a description.

    :::image type="content" source="media/exempt-resource-policy/create-exemption.png" alt-text="Screenshot that shows the exemption creation screen." lightbox="media/exempt-resource-policy/create-exemption.png":::

1. Select a Cloud platform.

1. Select, either a Management group, subscription or resource (per subscription).

1. Select a category, <br>

    1. **Mitigated (resolved through a third-party service)** 
     
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