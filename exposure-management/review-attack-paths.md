---
title: Review attack paths in Microsoft Security Exposure Management
description: Learn about to review and explore attack paths in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 03/11/2023
---

# Review attack paths

Attack paths in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) help you to proactively identify and visualize potential routes that attackers can exploit using vulnerabilities, gaps, and misconfigurations. Simulated attack paths allow you to proactively investigate and remediate potential threats.

Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes/prerelease.md)]

## Prerequisites

- [Read about attack paths](work-attack-paths-overview.md) before you start.
-- [Review required permissions](prerequisites.md#permissions) for working with attack paths.
- The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative:
  - If you don't have licenses defined for workloads integrated and represented in the attack path.
  - If you don't fully define critical assets.

## View attack paths

1. To access [attack paths](https://security.microsoft.com/attack-paths), select  **Attack surface -> Attack path**.

    :::image type="content" source="./media/review-attack-paths/attack-paths.png" alt-text="Screenshot of the Security Exposure Management attack path window" lightbox="media/review-attack-paths/attack-paths.png":::

1. To change how attack paths are displayed, you can select a heading name to sort by a specific column heading.

## Group by choke points

To group by choke point:

1. Select **Attack surface -> Attack path**.

1. Select **Group** to group by **Name**, **Entry point type**, **Target type**, **Target criticality**, **Status**, or **choke point**.

## Examine an attack path

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
