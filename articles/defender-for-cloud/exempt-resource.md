---
title: Exempt resources from recommendation in Microsoft Defender for Cloud
description: Learn how to exempt resources from recommendation in Microsoft Defender for Cloud.
ms.topic: how-to
ms.custom: ignite-2023
ms.author: elkrieger
author: Elazark
ms.date: 01/27/2026
---

# Exempt resources from recommendations

When you investigate security recommendations in Microsoft Defender for Cloud, you usually review the list of affected resources. Occasionally, you find a resource that shouldn't be included. Or you find a recommendation that shows in a scope where it doesn't belong. For example, a resource might be remediated by a process not tracked by Defender for Cloud, or a recommendation might be inappropriate for a specific subscription. Or your organization might decide to accept the risks related to the specific resource or recommendation.

In such cases, create an exemption to:

- **Exempt a resource** to ensure it isn't listed with the unhealthy resources in the future, and it doesn't affect your secure score. The resource is listed as not applicable and the reason is shown as "exempted" with the specific justification you select.

- **Exempt a subscription or management group** to ensure that the recommendation doesn't affect your secure score and it won't be shown for the subscription or management group in the future. This exemption relates to existing resources and any you create in the future. The recommendation is marked with the specific justification you select for the scope that you selected.

For the scope you need to create an exemption rule to:

- Mark a specific **recommendation** as "mitigated" or "risk accepted" for one or more subscriptions, or for an entire management group.
- Mark **one or more resources** as "mitigated" or "risk accepted" for a specific recommendation.

## Before you start

- You need the following permissions to create exemptions:
  - **Owner** or **Security Admin** to create an exemption.
    - To create a rule, you need permissions to edit policies in Azure Policy. [Learn more](/azure/governance/policy/overview#azure-rbac-permissions-in-azure-policy).

- You can create exemptions for recommendations included in Defender for Cloud's default [Microsoft cloud security benchmark](/security/benchmark/azure/introduction) standard, or any of the supplied regulatory standards.
>
> [!NOTE]
> Defender for Cloud exemption relies on Microsoft Cloud Security Benchmark (MCSB) initiative to evaluate and retrieve resources compliance state on the Defender for Cloud portal. If the MCSB is missing, the portal partially works and some resources might not appear.

- Some recommendations included in Microsoft cloud security benchmark don't support exemptions, a list of those recommendations can be found [here](faq-general.yml).

- Recommendations included in multiple policy initiatives must [all be exempted](faq-general.yml)

- You can't exempt custom recommendations.
- If you disable a recommendation, you also exempt all of its subrecommendations.
- In addition to working in the portal, you can create exemptions by using the Azure Policy API. For more information, see [Azure Policy exemption structure](/azure/governance/policy/concepts/exemption-structure).

- When you exempt at the management group level, ensure the *Windows Azure Security Resource Provider* has the necessary permissions by assigning it the **Reader** role on the management group. Grant this role the same way as user permissions.

## Define an exemption

To create an exemption rule:

1. In the Defender for Cloud portal, open the **Recommendations** page, and select the recommendation you want to exempt.

1. In **Take action**, select **Exempt**.

    :::image type="content" source="media/exempt-resource/exempting-recommendation.png" alt-text="Create an exemption rule for a recommendation to be exempted from a subscription or management group." lightbox="media/exempt-resource/exempting-recommendation.png":::

1. In the **Exempt** pane:
    1. Select the scope for the exemption.
        - If you select a management group, the recommendation is exempted from all subscriptions within that group.
        - If you're creating this rule to exempt one or more resources from the recommendation, choose **Selected resources** and select the relevant ones from the list.

    1. Enter a name for the exemption rule.
    1. Optionally, set an expiration date.
    1. Select the category for the exemption:
        - **Resolved through 3rd party (mitigated)** – if you're using a third-party service that Defender for Cloud hasn't identified.

            > [!NOTE]
            > When you exempt a recommendation as mitigated, you don't get points towards your secure score. But because points aren't *removed* for the unhealthy resources, the result is that your score increases.

        - **Risk accepted (waiver)** – if you decided to accept the risk of not mitigating this recommendation.
    1. Enter a description.
    1. Select **Create**.
    :::image type="content" source="media/exempt-resource/defining-recommendation-exemption.png" alt-text="Steps to create an exemption rule to exempt a recommendation from your subscription or management group."  lightbox="media/exempt-resource/defining-recommendation-exemption.png":::

## After creating the exemption

After creating the exemption, it can take up to 24 hours to take effect. After it takes effect:

- The recommendation or resources don't impact your secure score.
- If you exempted specific resources, they're listed in the **Not applicable** tab of the recommendation details page.
- If you exempted a recommendation, it's hidden by default on Defender for Cloud's recommendations page. This behavior is because the default options of the **Recommendation status** filter on that page exclude **Not applicable** recommendations. The same behavior occurs if you exempt all recommendations in a security control.

## Next step

> [!div class="nextstep"]
> [Review exempted resources](review-exemptions.md) in Defender for Cloud.
