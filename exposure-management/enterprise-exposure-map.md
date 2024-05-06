---
title: Explore with the attack surface map in Microsoft Security Exposure Management
description: Learn how to use the attack surface map in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 03/11/2024
---

# Explore with the attack surface map

To visualize exposure data, use the attack surface map in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md), together with the enterprise exposure graph schema.

Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Prerequisites

- [Read about](cross-workload-attack-surfaces.md) attack surface management.
- [Review required permissions](prerequisites.md#permissions) for working with the graph.

## Access the map

1. In the device inventory, select a device.
1. Select **View Map**.

You can also search for an asset from **Attack surface -> Map**, from **Identities**, or from the **Overview** dashboard.

## Explore the map

The exposure map gives you visibility into asset connections.

1. In **Attack surface map**, explore assets and connections.
1. Use the map features to explore.
    - **Indicators**: Icon indicators show node type and edge type. Visual indicators show information such as the high criticality crown or a vulnerability bug, providing visual input to where critical organizational data is at risk.
    - **Expandable groups**: Provide a way to expand similar assets when you want to view them more in depth. Expanding the view helps you to discover choke points and specific highly vulnerable or critical assets. If not needed, leave them collapsed for a more organized screen.
    - **Hovering**: Hover over nodes and edges to get additional information.
    - **Explore assets and their edges**. To explore assets and edge, select the plus sign. Or select the option to explore connected assets from the contextual menu.
    - **Asset details**: To view details, select the asset icon.
    - **Focus on asset**: Provides a way to refocus the graph visualization on the specific node you want to explore, similar to the **Graph** view when selecting an individual [attack path](review-attack-paths.md).
    - **Search**: Helps you to discover items by node type. By selecting **all results**, search the particular type for specific results. You can also filter your search by devices, identity, or cloud assets from the initial screen.


    :::image type="content" source="./media/enterprise-exposure-map/attack-surface-exposure-map.png" alt-text="Screenshot of the attack surface exposure map." lightbox="./media/enterprise-exposure-map/attack-surface-exposure-map.png":::

## Next steps

[Work with attack paths](work-attack-paths-overview.md).
