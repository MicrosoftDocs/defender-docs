---
title: Explore with the attack surface map
description: This article describes how Microsoft Exposure Management's attack surface map works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Explore with the attack surface map

[!INCLUDE [prerelease](../includes//prerelease.md)]

The Attack surface map (enterprise exposure map), allows you to use the exposure graph schema to visualize your exposure data. For more information, see [Overview of cross-workload attack surfaces](cross-workload-attack-surfaces.md). You can access the attack surface map from your device inventory, by choosing a device and selecting **View Map** or by searching directly for an asset from **Attack Surface -> Map**.

:::image type="content" source="./media/attack-surface-exposure-map.png" alt-text="Screenshot of the attack surface exposure map.":::
<!--image-->

The exposure map gives you visibility into the connections of your assets. The map has the following features that make it easy to explore:

- **Icon indicators** for node type and edge type, visual indicators like the high criticality crown or a vulnerability bug provides visual input to where critical organizational data is at risk.
- **Expandable groups** provides a way to expand similar assets when you want to view them more in depth. Expanding the view helps you to discover [choke points](get-to-know-exposure-management.md#what-is-a-choke-point) and specific assets with high vulnerability or criticality, when needed, but otherwise leave them collapsed for a more organized screen.
- **Hovering** over nodes and edges provides additional information.
- **Explore assets and their edges** by selecting the plus sign or **Explorable connected assets** from the contextual menu.
- **Asset details** are easily viewable by selecting the asset icon.
- **Focus on Asset** provides a way to refocus the graph visualization on the specific node you wish to explore, similar to the Graph view when selecting an individual attack path in [Attack paths](review-attack-paths.md).
- **Search** allows you to discover items by node type, and by selected **all results** search the particular type for specific results.

<!--Discuss exposure graph which is where the data to create the visual map comes from.
Discuss nodes, connections, indicators (crown for high value) should this be graphs and maps?-->
<!--
## Reading the map

The following sections provide information about each node type and connector type and their visual icons.

### Node type description

The following table depicts each node type and its icon:

|NodeType  | Icon  |
|---------|---------|
|SQL virtual machines| |
|Virtual machines | |

### Edge/Connector type description

The following table depicts each edge type and its icon:

|EdgeType  | Icon  |
|---------|---------|
|affecting |         |
|routes traffic to | :::image type="content" source="./media/routes-traffic-to-icon.png" alt-text="routes traffic to icon":::          |
|is running | :::image type="content" source="./media/is-running-icon.png" alt-text="is running icon":::        |
|contains | :::image type="content" source="./media/contains-icon.png" alt-text="contains icon":::        |
|pushes |         |
|can authenticate as |  :::image type="content" source="./media/can-authenticate-as-icon.png" alt-text="can authenticate as icon":::       |
|maintains |         |
|has role on |         |
|can authenticate to |         |
|moves data to |         |
|frequently logged in by |         |
|member of |         |
|can logon over the network to |         |
|can interactive logon to |         |
|can remote interactive logon to |         |
|runs on |  :::image type="content" source="./media/runs-on-icon.png" alt-text="runs on icon":::       |
|member |         |

### Indicator Name Description

The following are graph indicators:

|Indicator  | Icon  |
|---------|---------|
|Vulnerability | |
|Explorable connected assets| |
|High criticality level | |-->
<!--images -->

<!--- graph operators
send permissions
device names
nodes, edges
different types

indicators- on the map
add reference to 
graph operators
-->
## Next steps

For more information, see:

- [Attack path analysis and remediation](attack-paths-analysis-remediation.md)
