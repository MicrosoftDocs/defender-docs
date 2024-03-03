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
Attack paths provide the means to proactively identify and visualize potential attack paths that put critical assets at risk. They allow you to investigate and remediate the potential threats. You can do so from [Attack paths](https://security.microsoft.com/attack-paths) in the [Microsoft Defender portal](https://security.microsoft.com/) or by selecting **Attack surface -> Attack path**.

:::image type="content" source="./media/review-attack-paths/attack-paths.png" alt-text="Screenshot of the Security Exposure Management attack path window":::

For each listed attack path, you can view the following information:

- **Attack path name** - The name of the attack path.
- **Entry point** - The name of the asset vulnerable to an entry.
- **Entry point type** - The entry point type such as virtual machines, devices, or cloud computing instances.
- **Target** - The name of the target asset.
- **Target type** - The target asset type such as storage accounts, key vaults, or virtual machines.
- **Target criticality** - How critical the target threat (none, low, high).
- **Affected assets** - The number of assets affected by the attack path.
- **Recommendations**- The number of recommendations related to remediate the attack path.

You can group attack paths by name, entry point type, target type, and target criticality. Grouping them gives you better depth to your insights and allows you to prioritize the steps you take.  

Selecting an attack path to examine further for potential exploitable vulnerabilities reveals the following tabs:

- **Graph**
- **Recommendations**

## Review attack path graph

The graph allows you to view the attack path that attackers can use to breach your environment and target a critical asset. This helps provide a clear understanding of how potential threats can unfold, and therefore aids in threat assessment and decision-making. Hovering over each node and connector icon provides you with additional information about how the attack path is build. For instance, from an initial virtual machine containing TLS/SSL keys all the way to permissions to storage accounts.

:::image type="content" source="./media/review-attack-paths/attack-paths-graph.png" alt-text="Screenshot of the graph visualization of attack path":::

## Review recommendations

The recommendations tab lists the actionable recommendations that you can and should take to mitigate the identified attack paths. A recommendation includes:

- **Description**
- **Asset name**
- **Asset type**

> [!NOTE]
> The value of your attack paths increases based on the workload data it can use as a source. Some attack paths may not appear if there is no data to generate the path.

## Next steps

For more information, see:

- [Attack surface management overview](attack-surface-management-overview.md)
- [Critical asset management](critical-asset-management.md)

