---
title: Overview of attack paths in Microsoft Security Exposure Management
description: Learn how to mitigate security risks using attack paths in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 10/15/2025

---

# Overview of attack paths

Microsoft Security Exposure Management helps you to manage your company attack surface and exposure risk. Attack paths combine assets and techniques to show end-to-end paths that attackers can create to get from an entry point of an organization to [critical assets](critical-asset-management.md).

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

## Cloud and on-premises attack paths

### Cloud attack paths

Cloud attack paths illustrate routes that adversaries could exploit to move laterally within your environment, starting from external exposure and progressing toward meaningful impact within your environment. They help security teams visualize and prioritize real-world risks across their attack surface, focusing on externally-driven, exploitable threats that adversaries could use to compromise your organization. With the integration of Defender for Cloud in the Defender portal, cloud attack paths provide enhanced visualization and analysis capabilities across Azure, AWS, and GCP environments.


Cloud attack paths reflect real, externally driven and exploitable risks, helping you cut through the noise and act faster. The paths focus on external entry points and how attackers could progress through your environment reaching business-critical targets.

**Comprehensive cloud coverage**: Attack paths expand cloud threat detection to cover a broad range of cloud resources, including storage accounts, containers, serverless environments, unprotected repositories, unmanaged APIs, and AI agents. Each attack path is built from a real, exploitable weakness such as exposed endpoints, misconfigured access settings, or leaked credentials, ensuring that identified threats reflect genuine risk scenarios.

**Advanced validation**: By analyzing cloud configuration data and performing active reachability scans, the system validates whether exposures are accessible from outside the environment, reducing false positives and emphasizing threats that are both real and actionable.


### On-premises attack paths

Attack paths now terminate automatically when they reach End Game assets (Domain Admins, Enterprise Admins, Administrators, or Domain Controllers). These assets provide full domain control if compromised. The visualization and prioritization of attack path risks for on-premises infrastructure provide consistent clarity, enabling security teams to focus on high-impact scenarios and reduce noise

## Next steps

[Review attack paths](review-attack-paths.md).
