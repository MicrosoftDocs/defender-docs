---
title: Explore with the attack surface map in Microsoft Security Exposure Management
description: Learn how to use the attack surface map in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/06/2024
---

# Explore with the attack surface map

Use the exposure (attack surface) map in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md), together with the enterprise exposure graph schema, to visualize exposure data.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Access the map

1. In your device inventory, select a device.
1. Select **View Map**.

You can also search for an asset from **Attack surface -> Map**.

## Explore the map

The exposure map gives you visibility into the connections of your assets.

1. Open the map as described in the previous procedure.
1. In **Attack surface map**, explore assets and connections as follows:

    - **Icon indicators** for node type and edge type, visual indicators like the high criticality crown or a vulnerability bug provides visual input to where critical organizational data is at risk.
    - **Expandable groups** provides a way to expand similar assets when you want to view them more in depth. Expanding the view helps you to discover [choke points](get-to-know-exposure-management.md#what-is-a-choke-point) and specific assets with high vulnerability or criticality, when needed, but otherwise leave them collapsed for a more organized screen.
    - **Hovering** over nodes and edges provides additional information.
    - **Explore assets and their edges** by selecting the plus sign or **Explorable connected assets** from the contextual menu.
    - **Asset details** are easily viewable by selecting the asset icon.
    - **Focus on Asset** provides a way to refocus the graph visualization on the specific node you wish to explore, similar to the Graph view when selecting an individual attack path in [Attack paths](review-attack-paths.md).
    - **Search** allows you to discover items by node type, and by selected **all results** search the particular type for specific results. You can also filter your search by devices, identity, or cloud assets from the initial screen.

    :::image type="content" source="./media/enterprise-exposure-map/attack-surface-exposure-map.png" alt-text="Screenshot of the attack surface exposure map." lightbox="./media/enterprise-exposure-map/attack-surface-exposure-map.png":::


## Next steps

[Analyze and remediate attack paths](attack-paths-analysis-remediation.md)
