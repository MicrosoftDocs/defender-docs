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




<!--the text here is mostly what is in the overview-->
Once you identify potential attack paths, you want to reduce the risk of their use. To remediate and minimize your risk from attack paths, you will:

- Review and meet the recommendations for each attack path
- Review the exposure map to contextualize your attack path, determine and prioritize choke points, and mitigate them

[!INCLUDE [prerelease](../includes/prerelease.md)]

## Meet recommendations

You can view recommendations for each attack path by selecting it from **Attack paths** in the Attack surface section, and then selecting **Recommendations**. All Recommendations features are available, including the ability to remediate the recommendation in the appropriate workload interface by selecting **Manage** and reviewing remediation steps.

For more information about Recommendations, see [Review security recommendations](security-recommendations.md).

## Mitigate choke points

Using the attack path graph and exposure map allows you to visualize the attack path. The Attack paths section provides a map of the attack path so you can visualize the attack path. You can further view your exposed asset on the exposure map to contextualize this data and see what else to address. Visualizing the attack points helps highlight what else might be exposed and where attacks can flow. This visibility allows you to focus your mitigation efforts strategically. Additionally, by addressing choke points in the network you can address multiple attack paths at once and secure those critical points. Viewing the exposure map with specific critical vulnerability in mind, helps you see the assets that contribute to the vulnerability.
To access the attack path graph in the Attack surface section select **Attack paths**. The **Graph** section is the default. To view the exposure map select **Attack paths -> Map** or **View in map** from an individual device in **Device Inventory**.  

For more information about how to use the exposure map, see [Explore with the attack surface map](enterprise-exposure-map.md).
<!-->
Attack paths provide the means to proactively identify and visualize potential threats so you can investigate and remediate the potential threats. You can do so from [Attack paths](https://security.microsoft.com/attack-paths) in the [Microsoft Defender portal](https://security.microsoft.com/) or by selecting **Attack surface -> Attack path**.

:::image type="content" source="./media/attack-paths.png" alt-text="Screenshot of the attack path window":::

Attack path analysis and remediation:

- **Automatically generate attack paths:** It simulates various attack scenarios, identifying vulnerabilities and weaknesses in the organization’s security posture that an attack could exploit.
- **Provides visibility into attack paths with graph view:** This graph view provides a clear understanding of how potential threats could unfold aiding threat assessment and decision-making. It also allows you to navigate to the [Attack surface map](enterprise-exposure-map.md) by selecting **view in map**.
- **Provides recommendations:** Provides actionable recommendations to mitigate identified attack paths.
- **Gives visibility into choke points:** The solution highlights choke points through which many attack paths flow. This visibility enables users to focus their mitigation efforts strategically, addressing multiple attack paths by securing these critical points in the network.

You can select an attack path to see the related Graph and Recommendations in a side pane:
-->
:::image type="content" source="./media/attack-paths-graph-recommendations.png" alt-text="Screenshot of attack paths graph and recommendations":::

<!-- 
<!-- can you only see these recommendations once there is an attack path?
To ensure that you can see your attack paths, select **define critical assets** to set criticality levels for predefined critical assets or to create custom critical assets.

> [Notes:]
> In certain circumstances, attack path creation may be limited. As the ability to generate attack paths relies on visibility from solutions like Microsoft Defender for Endpoint and Microsoft Defender for Identity. When visibility is limited, path creation may be limited.
-->
## Next steps

For more information, see:

- [Attack surface management overview](attack-surface-management-overview.md)
- [Critical asset management](critical-asset-management.md)
- [!INCLUDE [support](../includes/support.md)]

