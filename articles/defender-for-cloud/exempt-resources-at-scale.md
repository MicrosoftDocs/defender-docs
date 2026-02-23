---
title: Exempt resources at scale
description: Learn how to create exemptions for how policies are applied to resources in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 02/05/2026
---

# Exempt resources at scale

Microsoft Defender for Cloud presents a list of affected resources to investigate through recommendations. Occasionally, a resource doesn't need to be included, or a recommendation appears in a scope where it's not relevant.

For example, Defender for Cloud might not track the process that remediates a resource, or a specific subscription might not require a recommendation. Organizations might accept the risks for specified resources or recommendations. In these cases, create exemptions at scale to:

- Prevent a resource from being listed as unhealthy or affecting the secure score by excluding it. Defender for Cloud marks it as "not applicable" and displays the selected justification.

- Prevent a recommendation from affecting the secure score or appearing again by excluding a subscription or management group.

- Prevent a recommendation or resource from being listed as unhealthy. Apply the rule to the required scope and mark the item as "mitigated" or "risk accepted".

[!INCLUDE [exempt-resource](./includes/exempt-resource.md)]


## Create exemptions at scale

To tailor your security posture, create exemptions for recommendations that aren't applicable or are already mitigated. 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Environment settings** > **Exemptions**.

    :::image type="content" source="media/exempt-resources-at-scale/exemptions.png" alt-text="Screenshot that shows where the exemptions button is located on the environment settings screen." lightbox="media/exempt-resources-at-scale/exemptions.png":::

1. Select **+ Create**.

1. Enter an Exemption name, and (Optional) a description.

    :::image type="content" source="media/exempt-resources-at-scale/create-exemption.png" alt-text="Screenshot that shows the exemption creation screen." lightbox="media/exempt-resources-at-scale/create-exemption.png":::

1. Select a cloud platform.

1. Select a management group, subscription, or resource (per subscription).

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

To view or manage existing exemptions, return to the **Exemptions** page in the Defender for Cloud menu. Select the three dot button **...** next to the exemption you want to manage. From there, you can edit or delete the exemption as needed.

## Next step

> [!div class="nextstep"]
> [Remediate recommendations](implement-security-recommendations.md)  