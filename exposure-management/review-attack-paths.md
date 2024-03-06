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

[!INCLUDE [prerelease](../includes/prerelease.md)]
<!--the text here is mostly what is in the overview-->
[Attack paths](work-attack-paths-overview.md) help you proactively identify and visualize potential routes to critical assets that attackers can exploit using vulnerabilities, gaps, and misconfigurations. They allow you to investigate and remediate potential threats.

1. To access [attack paths](https://security.microsoft.com/attack-paths), select  **attack surface -> attack path** or select the attack path action card from **device**, **settings -> Microsoft defender XDR -> critical asset management**, or **initiatives -> critical asset protection initiative.**
:::image type="content" source="./media/review-attack-paths/attack-paths.png" alt-text="Screenshot of the Security Exposure Management attack path window":::

1. To change how attack paths are displayed you can select a heading name to sort by a specific column heading or select **group** to group by **name**, **entry point type**, **target type**, **target criticality**, or **status.**
<!--
- **Attack path name** - The name of the attack path.
- **Entry point** - The name of the asset vulnerable to an entry.
- **Entry point type** - The entry point type such as virtual machines, devices, or cloud computing instances.
- **Target** - The name of the target asset.
- **Target type** - The target asset type such as storage accounts, key vaults, or virtual machines.
- **Target criticality** - How critical the target threat (none, low, medium, high, and very high).
- **Affected assets** - The number of assets affected by the attack path.
- **Recommendations**- The number of recommendations related to remediate the attack path.
- **Status** - 
-->
## Examine attack path graph

1. Select a specific attack path to examine it further for potential exploitable vulnerabilities. The attack path graph displays.

1. Hover over a node or edge (connector) icon to see additional information about how the attack path is built.

## Review recommendations

1. Select the **recommendations** tab to view the list of actionable recommendations to take to mitigate the identified attack paths.

1. Sort recommendations by heading or select a specific recommendation, to open the recommendation screen.

1. Review recommendation details and recommendations and then select **manage** to remediate the recommendation in the correct workload interface.

## Group by choke points

To group by choke point:

1. Select **attack surface -> attack path**. The **graph** section opens by default.

1. Select **group** and select to group by attack path name, entry point type, target type, target criticality, or status.

## View an attack path asset in the exposure map

To see a broader picture of an attack path asset in the exposure map:

1. Select **attack surface -> attack path -> map** or **view in map** from an individual device in **device inventory**.

1. If you've browsed to the map directly, search for the asset in the search bar and select it.

1. Explore connections according to your needs.

> [!NOTE]
> The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths may also not be fully representative if your plan doesn't include all the relevant licenses or if you haven't fully defined critical assets.

## Next steps

- [Attack surface management overview](attack-surface-management-overview.md)
- [Critical asset management](critical-asset-management.md)
