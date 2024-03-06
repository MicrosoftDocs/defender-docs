---
title: Review attack paths
description: This article describes how to review Microsoft Exposure Management's attack paths including with the exposure map.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Review attack paths

Attack paths help you proactively identify and visualize potential routes to critical assets that attackers can exploit using vulnerabilities, gaps, and misconfigurations. They allow you to investigate and remediate potential threats.

[!INCLUDE [prerelease](../includes/prerelease.md)]

## Prerequisites

[Read about attack paths](work-attack-paths-overview.md) before you start.

> [!NOTE]
> The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative if you don't have licenses defined for workloads integrated and represented in the attack path or if you haven't fully defined critical assets.

## View attack paths

1. To access [attack paths](https://security.microsoft.com/attack-paths), select  **Attack surface -> Attack path**.
:::image type="content" source="./media/review-attack-paths/attack-paths.png" alt-text="Screenshot of the Security Exposure Management attack path window" lightbox="media/review-attack-paths/attack-paths.png":::

1. To change how attack paths are displayed you can select a heading name to sort by a specific column heading.

> [!NOTE]
> You can also select the attack path action card from **Device**, **Settings -> Microsoft defender XDR -> Critical asset management**, or **Initiatives -> Critical asset protection Initiative.**

## Group by choke points

To group by choke point:

1. Select **Attack surface -> Attack path**.

1. Select **Group** to group by **Name**, **Entry point type**, **Target type**, **Target criticality**, or **Status.**

## Examine attack path graph

1. Select a specific attack path to examine it further for potential exploitable vulnerabilities. The attack path graph displays.

1. Hover over a node or edge (connector) icon to see additional information about how the attack path is built.

:::image type="content" source="media/review-attack-paths/attack-path-graph-details.png" alt-text="Screenshot of an Attack path graph detail screen." lightbox="media/review-attack-paths/attack-path-graph-details.png":::


## Review recommendations

1. Select the **Recommendations** tab to view the list of actionable recommendations to take to mitigate the identified attack paths.

1. Sort recommendations by heading or select a specific recommendation, to open the recommendation screen.

1. Review recommendation details and recommendations and then select **Manage** to remediate the recommendation in the correct workload interface.

## View an attack path asset in the exposure map

To see a broader picture of an attack path asset in the exposure map:

1. Select **Attack surface -> Attack path -> Graph -> View in map**. You can also:
    1. Search for and select an asset in the attack path from **Map** and select it.
    1. Select **View in map** from an asset in the attack path  from the **Device inventory**.

1. Explore connections according to your needs.

## Next steps

- Review the [Attack surface management overview](attack-surface-management-overview.md).
- Explore [Critical asset management](critical-asset-management.md).
