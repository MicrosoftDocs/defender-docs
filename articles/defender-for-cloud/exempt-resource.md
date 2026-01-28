---
title: Exempt resources from recommendation in Microsoft Defender for Cloud
description: Learn how to exempt resources from recommendation in Microsoft Defender for Cloud.
ms.topic: how-to
ms.custom: ignite-2023
ms.author: elkrieger
author: Elazark
ms.date: 01/28/2026
---

# Exempt resources from recommendations

> [!IMPORTANT]
> This feature is in preview. [!INCLUDE [Legalese](./includes/defender-for-cloud-preview-legal-text.md)] This premium Azure Policy capability is offered at no extra cost for customers with Microsoft Defender for Cloud's enhanced security features enabled. For other users, charges might apply in the future.

When you investigate security recommendations in Microsoft Defender for Cloud, you review the list of affected resources. Occasionally, you find a resource that shouldn't be in the list, or you find a recommendation that appears in a scope where it doesn't belong. For example, a resource might be remediated by a process that Defender for Cloud doesn't track, or a recommendation might not apply to a specific subscription. Your organization might decide to accept the risks related to the specific resource or recommendation.

In such cases, create an exemption rule to:

- **Exempt a resource** to remove it from the list of unhealthy resources and from secure score impact. Defender for Cloud lists the resource as **Not applicable** and shows the reason as **Exempted** with the justification that you select.

- **Exempt a subscription or management group** to prevent the recommendation from affecting your secure score or appearing for that scope. The exemption applies to existing resources and to resources that you create later. Defender for Cloud marks the recommendation with the justification that you select for that scope.

For each scope, create an exemption rule to:

- Mark a specific **recommendation** as **Mitigated** or **Risk accepted** for one or more subscriptions, or for a management group.
- Mark **one or more resources** as **Mitigated** or **Risk accepted** for a specific recommendation.

[!INCLUDE [exempt-resource](./includes/exempt-resource.md)]

## Before you start

 To create exemptions, you need the following permissions:
  - **Owner** or **Security Admin** on the scope where you create the exemption.
  - To create a rule, you need permissions to edit policies in Azure Policy. [Learn more](/azure/governance/policy/overview#azure-rbac-permissions-in-azure-policy).

- You can create exemptions for recommendations that belong to Defender for Cloud's default [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) initiative or to other built-in regulatory standards.

    > [!NOTE]  
    > Defender for Cloud exemptions rely on the Microsoft Cloud Security Benchmark (MCSB) initiative to evaluate and retrieve the compliance state of resources in the Defender for Cloud portal. If the MCSB initiative isn't assigned, the portal works only partially and some resources might not appear.

- Some recommendations in the Microsoft Cloud Security Benchmark (MCSB) don't support exemptions. You can find a list of these recommendations in [the exemptions FAQ](faq-general.yml).

- You must exempt recommendations that appear in multiple policy initiatives in each initiative. For more information, see [the exemptions FAQ](faq-general.yml).

- You don't create exemptions for custom recommendations.

- If you disable a recommendation, you also exempt all of its subrecommendations.

- Besides the portal, you can create exemptions by using the Azure Policy application programming interface (API). For more information, see [Azure Policy exemption structure](/azure/governance/policy/concepts/exemption-structure).

- When you create an exemption at the management group level, ensure the *Windows Azure Security Resource Provider* has the necessary permissions by assigning it the **Reader** role on that management group. Grant this role the same way that you grant user permissions.

## Define an exemption

To create an exemption rule:

1. In the Defender for Cloud portal, open the **Recommendations** page and select the recommendation that you want to exempt.

1. Select **Exempt**.

    :::image type="content" source="media/exempt-resource/exempting-recommendation.png" alt-text="Create an exemption rule for a recommendation to be exempted from a subscription or management group." lightbox="media/exempt-resource/exempting-recommendation.png":::

1. Select the scope for the exemption.
    - If you select a management group, Defender for Cloud exempts the recommendation from all subscriptions in that group.
    - If you create this rule to exempt one or more resources from the recommendation, choose **Selected resources** and select the relevant resources from the list.

1. Enter a name.

1. (Optional) set an expiration date.

1. Select the category for the exemption:
    - **Resolved through 3rd party (mitigated)** – if you use a third-party service that Defender for Cloud doesn't identify.
 
    > [!NOTE]  
    > When you exempt a recommendation as mitigated, you don't gain points toward your secure score. However, because Defender for Cloud doesn't remove points for the unhealthy resources, your score increases.

    - **Risk accepted (waiver)** – if you decide to accept the risk of not mitigating this recommendation.

    1. Enter a description.
    
    1. Select **Create**.
    
    :::image type="content" source="media/exempt-resource/defining-recommendation-exemption.png" alt-text="Steps to create an exemption rule to exempt a recommendation from your subscription or management group."  lightbox="media/exempt-resource/defining-recommendation-exemption.png":::

## After you create the exemption

An exemption can take up to 24 hours to take effect. After it takes effect:

- The recommendation or resources don't affect your secure score.

- If you exempt specific resources, Defender for Cloud lists them in the **Not applicable** tab of the recommendation details page.

- If you exempt a recommendation, Defender for Cloud hides it by default on the **Recommendations** page. This behavior occurs because the default options of the **Recommendation status** filter on that page exclude **Not applicable** recommendations. The same behavior occurs if you exempt all recommendations in a security control.

## Next step

> [!div class="nextstep"]
> [Review exempted resources](review-exemptions.md) in Defender for Cloud.
