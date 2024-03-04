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
[Attack paths](work-attack-paths-overview.md) provide the means to proactively identify and visualize potential routes an attacker can exploit using vulnerabilities, gaps and misconfigurations, that put critical assets at risk. They allow you to investigate and remediate the potential threats. For more information, see [Overview of work with attack paths](work-attack-paths-overview.md).

1. To access [Attack paths](https://security.microsoft.com/attack-paths) select  **attack surface -> attack path** or select the attack path action card from **device**, **settings -> Microsoft defender XDR -> critical asset management**, or **initiatives -> critical asset protection initiative**.
:::image type="content" source="./media/review-attack-paths/attack-paths.png" alt-text="Screenshot of the Security Exposure Management attack path window":::

1. To change how attack paths are displayed you can select a heading name to sort by a specific column heading or select **Group** to group by **Name**, **Entry point type**, **Target type**, or **Target criticality**.
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

1. Hover over a node or edge (connector) icon to see additional information about how the attack path is build.

## Review recommendations

1. Select the **recommendations** tab to view the list of actionable recommendations to take to mitigate the identified attack paths.
1. Sort recommendations by heading or select a specific recommendation, to open the recommendation screen and manage remediation from **recommendations**. 

> [!NOTE]
> The value of your attack paths increases based on the workload data it can use as a source. Some attack paths may not appear if there is no data to generate the path.

## Next steps

- [Attack surface management overview](attack-surface-management-overview.md)
- [Critical asset management](critical-asset-management.md)
