---
title: Mitigate attack paths in Microsoft Security Exposure Management
description: This article describes how attack path analysis works in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 02/28/2024
---

# Mitigate attack paths

Remediate and minimize your risk from attack paths by reviewing and meeting each recommendation for an attack path and by viewing your attack path data in the exposure map.
<!-->
- Review and meet the recommendations for each attack path
- Review the exposure map to contextualize your attack path, determine and prioritize choke points, and mitigate them
-->
[!INCLUDE [prerelease](../includes/prerelease.md)]

## Meet recommendations

1. To view recommendations select **exposure management -> attack surface -> attack paths -> recommendations.**
1. Review recommendation details and recommendations and then select **manage** to remediate the recommendation in the appropriate workload interface.

## Group by choke points

<!--Using the attack path graph and exposure map allows you to visualize the attack path. The Attack paths section provides a map of the attack path so you can visualize the attack path. You can further view your exposed asset on the exposure map to contextualize this data and see what else to address. Visualizing the attack points helps highlight what else might be exposed and where attacks can flow. This visibility allows you to focus your mitigation efforts strategically. Additionally, by addressing choke points in the network you can address multiple attack paths at once and secure those critical points. Viewing the exposure map with specific critical vulnerability in mind, helps you see the assets that contribute to the vulnerability.-->
1. To access the attack path graph in the Attack surface section select **Attack paths**. The **Graph** section is the default. To view the exposure map select **Attack paths -> Map** or **View in map** from an individual device in **Device Inventory**.  

For more information about how to use the exposure map, see [Explore with the attack surface map](enterprise-exposure-map.md).

:::image type="content" source="./media/attack-paths-analysis-remediation/attack-paths-graph-recommendations.png" alt-text="Screenshot of attack paths graph and recommendations":::

## Next steps

For more information, see:

- [Attack surface management overview](attack-surface-management-overview.md)
- [Critical asset management](critical-asset-management.md)
- [!INCLUDE [support](../includes/support.md)]
