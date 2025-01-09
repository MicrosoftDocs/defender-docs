---
title: Review attack paths in Microsoft Security Exposure Management
description: Learn about to review and explore attack paths in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Review attack paths

Attack paths in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) help you to proactively identify and visualize potential routes that attackers can exploit using vulnerabilities, gaps, and misconfigurations. Simulated attack paths allow you to proactively investigate and remediate potential threats.

## Prerequisites

- [Read about attack paths](work-attack-paths-overview.md) before you start.
-- [Review required permissions](prerequisites.md#permissions) for working with attack paths.
- The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative:
  - If you don't have licenses defined for workloads integrated and represented in the attack path.
  - If you don't fully define critical assets.

### Attack path dashboard

The dashboard provides a high-level overview of all identified attack paths within the environment. It enables security teams to gain valuable insights into the types of paths identified, top entry points, target assets, and more, helping to prioritize risk mitigation efforts effectively. The overview includes:

- Graph of attack paths over time
- Top choke points
- Top attack path scenarios
- Top targets
- Top entry points

:::image type="content" source="media/work-attack-paths-overview/attack-paths-dashboard.png" alt-text="Screenshot of attack path dashboard" lightbox="media/work-attack-paths-overview/attack-paths-dashboard.png":::

### View attack paths

1. You can access [attack paths](https://security.microsoft.com/attack-paths) from the attack path dashboard, or by selecting  **Attack surface -> Attack path**.

   :::image type="content" source="media/review-attack-paths/attack-path-list.png" alt-text="Screenshot of attack path list" lightbox="media/review-attack-paths/attack-path-list.png":::

1. To change how attack paths are displayed, you can select a heading name to sort by a specific column heading.

### Group attack paths

To group attack paths by specific criteria:

Select **Group** to group by **Attack path name**, **Entry point**,**Entry point type**, **Target type**, **Risk level**, **Status**, **Target criticality**, **Target**.

### View choke points and blast radius

1. Go the choke points tab to view a list of choke points on the attack path dashboard. By focusing on these choke points, you can reduce risk by addressing high-impact assets, thus preventing attackers from progressing through various paths.
1. Select a choke point to open the side panel, select **View blast radius** and explore the attack paths from a choke point. The blast radius provides a detailed visualization showing how the compromise of one asset could affect others. This enables security teams to assess the broader implications of an attack and prioritize mitigation strategies more effectively.
 
:::image type="content" source="media/review-attack-paths/choke points and blast radius.png" alt-text="Screenshot of choke point and blast radius " lightbox="media/review-attack-paths/choke points and blast radius.png":::

:::image type="content" source="media/review-attack-paths/choke-points on map.png" alt-text="Screenshot of choke point on attack map" lightbox="media/review-attack-paths/choke-points on map.png":::

### Examine an attack path

1. Select a specific attack path to examine it further for potential exploitable vulnerabilities.

1. In the **Attack Path** graph, hover over a node or edge (connector) icon to see additional information about how the attack path is built.

:::image type="content" source="media/review-attack-paths/attack-path-graph-details.png" alt-text="Screenshot of an Attack path graph detail screen." lightbox="media/review-attack-paths/attack-path-graph-details.png":::

## Review recommendations

1. Select the **Recommendations** tab to view the list of actionable recommendations to mitigate the identified attack paths.

1. Sort recommendations by heading or select a specific recommendation, to open the recommendation screen.

1. Review recommendation details, and then select **Manage** to remediate the recommendation in the correct workload interface.

## View an attack path asset in the exposure map

To see a broader picture of an attack path asset in the exposure map:

1. Select **Attack surface -> Attack path -> Graph -> View in map**.

    You can also search for and select an asset in the attack path from **Map** and select it. Or, select **View in map** from an asset from the **Device inventory**.

1. Explore connections as needed.

## Next steps

Learn about [critical asset management](critical-asset-management.md).
