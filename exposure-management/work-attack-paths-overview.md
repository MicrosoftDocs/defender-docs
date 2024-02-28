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

[!INCLUDE [prerelease](../includes//prerelease.md)]

Microsoft Security Exposure Management uses attack surface tools to proactively identify and visualize potential threats. Attack paths and the exposure map help you investigate and remediate potential threats.

<!--You can do so from [Attack paths](https://security.microsoft.com/attack-paths) in the [Microsoft defender portal](https://security.microsoft.com/) or by selecting **Attack surface -> Attack path**.-->

:::image type="content" source="./media/security-exposure-management/attack-paths.png" alt-text="Screenshot of the attack path window":::

Your attack surface tools:

- **Automatically generate attack paths:** It simulates various attack scenarios, identifying vulnerabilities and weaknesses in the organization’s security posture that an attack could exploit.
- **Provides visibility into attack paths with graph view:** The graph view provides a clear understanding of how potential threats could unfold aiding threat assessment and decision-making. It also allows you to view the attack path visually in the [exposure map](enterprise-exposure-map.md) by selecting **view in map**.  
- **Provides recommendations:** Provides actionable recommendations to mitigate identified attack paths.
- **Gives visibility into choke points:** The solution highlights choke points through which many attack paths flow. This visibility enables users to focus their mitigation efforts strategically, addressing multiple attack paths by securing these critical points in the network.

<!--## Delegate metrics and recommendations

Microsoft Security Exposure Management provides a way to delegate risk and exposure metrics and recommendation tasks to other members of your security team. This helps appropriate team members remediate identified risks in a timely fashion.

For more information, see [Delegate metrics and recommendations](delegate-metrics-recommendations.md)
-->
## Review attack paths

Security Exposure Management generates attack paths based on data gathered from your various connected workloads. **Attack paths** lets you view how an attacker could try to breach your attack surface. It also provides the means to mitigate these risks. It allows you to group attack paths together to better identify risk and prioritize how you address issues.

The exposure map extends how you can visualize attack paths by showing you multiple attack paths and choke points. It visualizes exposure data, allows you to see what assets are at risk, and therefore to prioritize your focus.
For more about the exposure map, see [Explore the attack surface visually](enterprise-exposure-map.md).

## Resolve attack paths

Microsoft Security Exposure management resolves attack paths in the following ways:

- **Automatically generates attack paths:** It simulates various attack scenarios, identifying vulnerabilities and weaknesses in the organization’s security posture that an attack could exploit.
- **Provides visibility into attack paths with graph view:** This graph view provides a clear understanding of how potential threats could unfold aiding threat assessment and decision-making.
- **Provides recommendations:** Provides actionable recommendations to mitigate identified attack paths.
- **Gives visibility into choke points:** The solution highlights choke points through which many attack paths flow. This visibility enables users to focus their mitigation efforts strategically, addressing multiple attack paths by securing these critical points in the network.

For more information, see [Mitigate attack paths](attack-paths-analysis-remediation.md).

The following articles explore threat identification using attack surface tools:

- [Review attack paths](review-attack-paths.md)
- [Mitigate attack paths](attack-paths-analysis-remediation.md)

> [!NOTE]
> The value of your attack paths increases based on the workload data it can use as a source. Some attack paths may not appear if there is no data to generate the path.

## Next steps

For more information, see:

- [Review attack paths](review-attack-paths.md)
- [Mitigate attack paths](attack-paths-analysis-remediation.md)