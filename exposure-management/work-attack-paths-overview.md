---
title: Overview of work with attack paths
description: This article provides an overview of how to mitigate security risks using attack paths in Microsoft Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Overview of work with attack paths

Microsoft Security Exposure Management helps you to manage your company attack surface and exposure risk. Attack paths show you how an attacker might breach your attack surface, so that you can investigate and remediate potential threats. 

> [!NOTE]
> The value of attack paths increases based on the data used as a source. If no data is available, attack paths might not appear.

[!INCLUDE [prerelease](../includes/prerelease.md)]


## Identifying and resolving attack paths

Here's how Security Exposure Management helps you to identify and resolve attack paths.

- **Attack path generation**: Security Exposure Management automatically generates attack paths based on the data collected across assets and workloads. It simulates attack scenarios, and identifies vulnerabilities and weaknesses that an attacker could exploit.
- **Attack path visibility**: You use the enterprise exposure graph view to understand how potential threats might unfold. In addition to the graph, the [enterprise exposure map](enterprise-exposure-map.md) extends how you can visualize attack paths by showing you multiple attack paths and choke points. It visualizes exposure data, allowing you to see what assets are at risk, and where to prioritize your focus.
- **Security recommendations**: Get actionable recommendations to mitigate potential attack paths.
- **Choke point identification**: A choke point is a specific node, which creates a bottleneck in the graph or map. Ensuring that chokepoints are secure protects your assets from threats.
    - Security Exposure Management highlights choke points through which multiple attack paths flow, or where multiple attack paths intersect on the way to a critical asset.
    - Chokepoint visibility enables you to focus mitigation efforts strategically, addressing multiple attack paths by securing these critical points in the network.




## Next steps

- [Review attack paths](review-attack-paths.md)
- [Mitigate attack paths](attack-paths-analysis-remediation.md)