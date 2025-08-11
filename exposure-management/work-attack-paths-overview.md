---
title: Overview of attack paths in Microsoft Security Exposure Management
description: Learn how to mitigate security risks using attack paths in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 08/11/2025

---

# Overview of attack paths

Microsoft Security Exposure Management helps you to manage your company attack surface and exposure risk. Attack paths illustrate potential routes that adversaries could exploit to move laterally within your environment, starting from external exposure and progressing toward meaningful impact within your environment. They help security teams visualize and prioritize real-world risks across their attack surface, focusing on externally-driven, exploitable threats that adversaries could use to compromise your organization.

Attack paths reflect real, externally driven and exploitable risks, helping you cut through the noise and act faster. The paths focus on external entry points and how attackers could progress through your environment reaching business-critical targets.

> [!NOTE]
> The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative if you don't have licenses defined for workloads integrated and represented in the attack path or if you haven't fully defined critical assets.
> 
> You may see an empty Attack Path page, as the experience focuses on imminent threats rather than exploratory scenarios. 

## Attack path dashboard

The attack path dashboard provides a high-level view of the attack paths in your organization. It shows the number of attack paths, the number of choke points, and the number of critical assets. You can use this information to understand the security posture of your organization and to prioritize your security efforts. From the dashboard, you can drill down into the details of the attack paths, choke points, and critical assets.

:::image type="content" source="media/work-attack-paths-overview/attack-paths-dashboard.png" alt-text="Screenshot of attack path dashboard" lightbox="media/work-attack-paths-overview/attack-paths-dashboard.png":::

## Identifying and resolving attack paths

Here's how Exposure Management helps you to identify and resolve attack paths.

- **Attack path generation**: Security Exposure Management automatically generates attack paths based on the data collected across assets and workloads. It simulates attack scenarios, and identifies vulnerabilities and weaknesses that an attacker could exploit.
  - The number of attack paths visible in the portal can fluctuate due to the dynamic nature of  IT environments. Our system dynamically generates attack paths based on the real-time conditions of each customer's environment. Changes such as the addition or removal of assets, updates to configurations, a user logging on or off from a machine, a user added or removed to a group, and the implementation of new network segmentation or security policies can all influence the number and types of attack paths identified. 
  - This approach ensures that the security posture we provide is both accurate and reflective of the latest environment state, accommodating the agility required in today's IT environments.
- **Attack path visibility**: The attack path graph view uses [enterprise exposure graph](cross-workload-attack-surfaces.md) data to visualize the attack path to understand how potential threats might unfold.
  - Hovering over each node and connector icon provides you with additional information about how the attack path is build. For instance, from an initial virtual machine containing TLS/SSL keys all the way to permissions to storage accounts.
  - The [enterprise exposure map](enterprise-exposure-map.md) extends how you can visualize attack paths. Along with other data, it shows you multiple attack paths and choke points, nodes that create bottlenecks in the graph or map where attack paths converge. It visualizes exposure data, allowing you to see what assets are at risk, and where to prioritize your focus.
- **Security recommendations**: Get actionable recommendations to mitigate potential attack paths.
- **Choke points**: The attack path dashboard highlights critical assets where multiple attack paths intersect, identifying them as key vulnerabilities. By focusing on these choke points, security teams can efficiently reduce risk by addressing high-impact assets.

  - **Identification**: View a list of choke points on the attack path dashboard.
  - **Grouping**: Security Exposure Management groups choke point nodes where multiple attack paths flow or intersect on the way to a critical asset.
  - **Strategic Mitigation**: Choke point visibility enables you to focus mitigation efforts strategically, addressing multiple attack paths by securing these critical points.
  - **Protection**: Ensuring that choke points are secure protects your assets from threats.
- **Blast radius**: Allows users to visually explore the highest-risk paths from a choke point. It provides a detailed visualization showing how the compromise of one asset could affect others, enabling security teams to assess the broader implications of an attack and prioritize mitigation strategies more effectively.

## Cloud and on-premises attack path 

### Cloud attack paths
- **Focus**: Highlights only the most urgent, externally initiated, and exploitable threats, reducing noise and improving efficiency.
- **External entry points**: Emphasizes attack routes that begin outside your organization and map adversary movement through cloud infrastructure.
- **Actionable risks**: Shows real, exploitable vulnerabilities with sharper definition, while actionability remains the same for now, with future improvements planned.

### On-premises attack paths
- **End game asset termination**: Attack paths are now configured to terminate automatically when they reach any of the following asset types: Domain Admins, Enterprise Admins, Administrators, or Domain Controllers. These assets are classified as End Game meaning that if an attacker compromises any of them, they effectively gain full control over your domain.
- **Greater Clarity**: This update improves consistency and clarity to the way attack path risks are visualized and prioritized for on-premises infrastructure, helping security teams focus on high-impact scenarios and reduce noise.

## Next steps

[Review attack paths](review-attack-paths.md).
