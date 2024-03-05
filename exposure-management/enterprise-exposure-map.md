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

Use the attack surface map (enterprise exposure map) in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) together with the enterprise exposure graph schema to visualize exposure data.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Map

The exposure map gives you visibility into the connections of your assets.

:::image type="content" source="./media/enterprise-exposure-map/attack-surface-exposure-map.png" alt-text="Screenshot of the attack surface exposure map.":::

The map provides:

- **Icon indicators** for node type and edge type, visual indicators like the high criticality crown or a vulnerability bug provides visual input to where critical organizational data is at risk.
- **Expandable groups** provides a way to expand similar assets when you want to view them more in depth. Expanding the view helps you to discover [choke points](get-to-know-exposure-management.md#what-is-a-choke-point) and specific assets with high vulnerability or criticality, when needed, but otherwise leave them collapsed for a more organized screen.
- **Hovering** over nodes and edges provides additional information.
- **Explore assets and their edges** by selecting the plus sign or **Explorable connected assets** from the contextual menu.
- **Asset details** are easily viewable by selecting the asset icon.
- **Focus on Asset** provides a way to refocus the graph visualization on the specific node you wish to explore, similar to the Graph view when selecting an individual attack path in [Attack paths](review-attack-paths.md).
- **Search** allows you to discover items by node type, and by selected **all results** search the particular type for specific results. You can also filter your search by devices, identity, or cloud assets from the initial screen.

## Accessing the map

You can access the attack surface map from your device inventory, by choosing a device and selecting **View Map** or by searching directly for an asset from **attack surface -> map**.

## Next steps

[Analyze and remediate attack paths](attack-paths-analysis-remediation.md)
