---
title: Overview of attack paths in Microsoft Security Exposure Management
description: Learn how to mitigate security risks using attack paths in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/06/2024
---

# Overview of attack paths

Microsoft Security Exposure Management helps you to manage your company attack surface and exposure risk. Attack paths show you how an attacker might breach your attack surface, so that you can investigate and remediate potential threats.

> [!NOTE]
> The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative if you don't have licenses defined for workloads integrated and represented in the attack path or if you haven't fully defined critical assets.

[!INCLUDE [prerelease](../includes/prerelease.md)]
<!--:::image type="content" source="media/work-attack-paths-overview/attack-paths.png" alt-text="Screenshot of the attack path window":::
-->
## Identifying and resolving attack paths

Here's how Security Exposure Management helps you to identify and resolve attack paths.

- **Attack path generation**: Security Exposure Management automatically generates attack paths based on the data collected across assets and workloads. It simulates attack scenarios, and identifies vulnerabilities and weaknesses that an attacker could exploit.
- **Attack path visibility**: You use the enterprise exposure graph view to understand how potential threats might unfold.
  - Hovering over each node and connector icon provides you with additional information about how the attack path is build. For instance, from an initial virtual machine containing TLS/SSL keys all the way to permissions to storage accounts.
  - The [enterprise exposure map](enterprise-exposure-map.md) extends how you can visualize attack paths by showing you multiple attack paths and choke points. It visualizes exposure data, allowing you to see what assets are at risk, and where to prioritize your focus.
- **Security recommendations**: Get actionable recommendations to mitigate potential attack paths.
- **Choke point identification**: A choke point is a specific node, which creates a bottleneck in the graph or map. 
  - Security Exposure Management provides a way to group choke points through which multiple attack paths flow, or where multiple attack paths intersect on the way to a critical asset.
  - Chokepoint visibility enables you to focus mitigation efforts strategically, addressing multiple attack paths by securing these critical points in the network.
  - Ensuring that chokepoints are secure protects your assets from threats.
<!--:::image type="content" source="./media/review-attack-paths/attack-paths-graph.png" alt-text="Screenshot of the graph visualization of attack path"::: -->

## Next steps

[Review attack paths](review-attack-paths.md).
