---
title: Work with attack paths in Microsoft Security Exposure Management
description: Learn how to identify, review, and remediate attack paths in Microsoft Security Exposure Management.
ms.topic: how-to
ms.author: dlanger
author: dlanger
ms.date: 05/14/2026
ai-usage: ai-assisted
---

# Work with attack paths

Microsoft Security Exposure Management helps you manage your company attack surface and exposure risk. Attack paths combine assets and techniques to show end-to-end paths that attackers can create to get from an entry point of an organization to [critical assets](critical-asset-management.md).

> [!NOTE]
> If you use **Microsoft Defender for Cloud** in the Azure portal, Defender for Cloud also has a dedicated attack path analysis experience for cloud-only environments. See [Security explorer and attack paths in Microsoft Defender for Cloud](/azure/defender-for-cloud/concept-attack-path). The experience described in this article covers cross-workload attack paths — endpoints, cloud, and hybrid — in the Microsoft Defender portal.

> [!NOTE]
> The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative if you don't have licenses defined for workloads integrated and represented in the attack path or if you haven't fully defined critical assets.
>
> You may see an empty Attack Path page, as the experience focuses on imminent threats rather than exploratory scenarios.

## How attack paths work

- **Attack path generation**: Security Exposure Management automatically generates attack paths based on the data collected across assets and workloads. It simulates attack scenarios, and identifies vulnerabilities and weaknesses that an attacker could exploit. Key data sources include [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) for device and endpoint data, [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/) for vulnerability context, and [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) for cloud asset data.
  - The number of attack paths visible in the portal can fluctuate due to the dynamic nature of IT environments. Our system dynamically generates attack paths based on the real-time conditions of each customer's environment. Changes such as the addition or removal of assets, updates to configurations, a user logging on or off from a machine, a user added or removed to a group, and the implementation of new network segmentation or security policies can all influence the number and types of attack paths identified.
  - This approach ensures that the security posture we provide is both accurate and reflective of the latest environment state, accommodating the agility required in today's IT environments.
- **Attack path visibility**: The attack path graph view uses [enterprise exposure graph](cross-workload-attack-surfaces.md) data to visualize the attack path to understand how potential threats might unfold.
  - Hovering over each node and connector icon provides you with additional information about how the attack path is built. For instance, from an initial virtual machine containing TLS/SSL keys all the way to permissions to storage accounts.
  - The [enterprise exposure map](enterprise-exposure-map.md) extends how you can visualize attack paths. Along with other data, it shows you multiple attack paths and choke points, nodes that create bottlenecks in the graph or map where attack paths converge. It visualizes exposure data, allowing you to see what assets are at risk, and where to prioritize your focus.
- **Security recommendations**: Get actionable recommendations to mitigate potential attack paths.
- **Choke points**: The attack path dashboard highlights critical assets where multiple attack paths intersect, identifying them as key vulnerabilities.
  - **Identification**: View a list of choke points on the attack path dashboard.
  - **Grouping**: Security Exposure Management groups choke point nodes where multiple attack paths flow or intersect on the way to a critical asset.
  - **Strategic mitigation**: Choke point visibility enables you to focus mitigation efforts strategically, addressing multiple attack paths by securing these critical points.
- **Blast radius**: Allows users to visually explore the highest-risk paths from a choke point. It provides a detailed visualization showing how the compromise of one asset could affect others, enabling security teams to assess the broader implications of an attack and prioritize mitigation strategies more effectively.

## Cloud and on-premises attack paths

### Cloud attack paths

Cloud attack paths illustrate routes that adversaries could exploit to move laterally within your environment, starting from external exposure and progressing toward meaningful impact within your environment. They help security teams visualize and prioritize real-world risks across their attack surface, focusing on externally-driven, exploitable threats that adversaries could use to compromise your organization. With the integration of Defender for Cloud in the Defender portal, cloud attack paths provide enhanced visualization and analysis capabilities across Azure, AWS, and GCP environments.

Cloud attack paths reflect real, externally driven and exploitable risks, helping you cut through the noise and act faster. The paths focus on external entry points and how attackers could progress through your environment reaching business-critical targets.

**Comprehensive cloud coverage**: Attack paths expand cloud threat detection to cover a broad range of cloud resources, including storage accounts, containers, serverless environments, unprotected repositories, unmanaged APIs, and AI agents. Each attack path is built from a real, exploitable weakness such as exposed endpoints, misconfigured access settings, or leaked credentials, ensuring that identified threats reflect genuine risk scenarios.

**Advanced validation**: By analyzing cloud configuration data and performing active reachability scans, the system validates whether exposures are accessible from outside the environment, reducing false positives and emphasizing threats that are both real and actionable.

### On-premises attack paths

Attack paths now terminate automatically when they reach End Game assets (Domain Admins, Enterprise Admins, Administrators, or Domain Controllers). These assets provide full domain control if compromised. The visualization and prioritization of attack path risks for on-premises infrastructure provide consistent clarity, enabling security teams to focus on high-impact scenarios and reduce noise.

> [!NOTE]
> For on-premises attack paths, you might occasionally see an attack path highlighted without a directly associated recommendation in the same view. In these scenarios, the attack paths are still generated based on observed risk signals, while device-related vulnerabilities and security recommendations remain available under the **Devices Experience** for the specific device involved in the attack path.

## Prerequisites

- [Review required permissions](prerequisites.md#permissions) for working with attack paths.
- The value of attack paths increases based on the data used as a source. If no data is available or the data doesn't reflect your organization's environment, attack paths might not appear. Attack paths might not be fully representative:
  - If you don't have licenses defined for workloads integrated and represented in the attack path.
  - If you don't fully define critical assets.
- You may see an empty Cloud Attack Path page, as attack paths focus on real, externally-driven and exploitable threats rather than exploratory scenarios. This helps reduce noise and prioritize imminent risks.

## Attack path dashboard

The dashboard provides a high-level overview of all identified attack paths within the environment. It enables security teams to gain valuable insights into the types of paths identified, top entry points, target assets, and more, helping to prioritize risk mitigation efforts effectively. The overview includes:

- Graph of attack paths over time
- Top choke points
- Top attack path scenarios
- Top targets
- Top entry points

:::image type="content" source="media/work-attack-paths-overview/attack-paths-dashboard.png" alt-text="Screenshot of attack path dashboard" lightbox="media/work-attack-paths-overview/attack-paths-dashboard.png":::

## View attack paths

1. Access [attack paths](https://security.microsoft.com/attack-paths) from the attack path dashboard, or by selecting **Attack surface** > **Attack path**.

   :::image type="content" source="media/review-attack-paths/attack-path-list.png" alt-text="Screenshot of attack path list" lightbox="media/review-attack-paths/attack-path-list.png":::

1. To change how attack paths are displayed, select a heading name to sort by that column.

## Group attack paths

Select **Group** to group by **Attack path name**, **Entry point**, **Entry point type**, **Target type**, **Risk level**, **Status**, **Target criticality**, or **Target**.

## View choke points and blast radius

1. Go to the **Choke points** tab to view a list of choke points on the attack path dashboard. By focusing on these choke points, you can reduce risk by addressing high-impact assets, thus preventing attackers from progressing through various paths.
1. Select a choke point to open the side panel, select **View blast radius**, and explore the attack paths from a choke point. The blast radius provides a detailed visualization showing how the compromise of one asset could affect others. This enables security teams to assess the broader implications of an attack and prioritize mitigation strategies more effectively.

:::image type="content" source="media/review-attack-paths/choke points and blast radius.png" alt-text="Screenshot of choke point and blast radius" lightbox="media/review-attack-paths/choke points and blast radius.png":::

:::image type="content" source="media/review-attack-paths/choke-points on map.png" alt-text="Screenshot of choke point on attack map" lightbox="media/review-attack-paths/choke-points on map.png":::

## Examine an attack path

1. Select a specific attack path to examine it further for potential exploitable vulnerabilities.
1. In the **Attack Path** graph, hover over a node or edge (connector) icon to see additional information about how the attack path is built. With the integration of Defender for Cloud in the Defender portal, you might see attack paths that span multiple environments — for example, an attack path that starts from a compromised cloud VM, pivots through an associated identity, and reaches an on-premises domain controller. The portal displays these hybrid paths in the graph view, and you can select each node for details and follow remediation steps for each exposure along the path.

:::image type="content" source="media/review-attack-paths/attack-path-graph-details.png" alt-text="Screenshot of an Attack path graph detail screen." lightbox="media/review-attack-paths/attack-path-graph-details.png":::

## Review recommendations

1. Select the **Recommendations** tab to view the list of actionable recommendations to mitigate the identified attack paths.
1. Sort recommendations by heading or select a specific recommendation to open the recommendation screen.
1. Review recommendation details, and then select **Manage** to remediate the recommendation in the correct workload interface.

> [!NOTE]
> For on-premises attack paths, you might occasionally see an attack path highlighted without a directly associated recommendation in the same view. In these scenarios, the attack paths are still generated based on observed risk signals, while device-related vulnerabilities and security recommendations remain available under the Devices Experience for the specific device involved in the attack path.

## View an attack path asset in the exposure map

1. Select **Attack surface** > **Attack path** > **Graph** > **View in map**.

    You can also search for and select an asset in the attack path from **Map** and select it. Or, select **View in map** from an asset from the **Device inventory**.

1. Explore connections as needed.

## Next steps

- [Identify and manage critical assets](critical-asset-management.md)
- [Review security recommendations](security-recommendations.md)
