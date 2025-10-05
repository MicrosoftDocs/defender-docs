---
title: Investigate risks with security explorer/attack paths in Microsoft Defender for Cloud
description: Learn about investigating risks with security explorer/attack paths in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 09/10/2025
zone_pivot_groups: defender-portal-experience
#customer intent: As a security analyst, I want to understand attack paths so that I can mitigate risks effectively.
---

# Security explorer and attack paths

> [!VIDEO https://aka.ms/docs/player?id=36a5c440-00e6-4bd8-be1f-a27fbd007119]

One of the biggest challenges for security teams today is the number of daily security issues. Numerous security issues need resolution, but resources are insufficient.

Defender for Cloud's contextual security capabilities help security teams assess the risk behind each security issue and identify the highest-risk issues that need immediate resolution. Defender for Cloud helps security teams reduce the risk of impactful breaches effectively.

All of these capabilities are available as part of the [Defender Cloud Security Posture Management](concept-cloud-security-posture-management.md) plan and require you to enable either [agentless scanning for VMs](concept-agentless-data-collection.md) or the [vulnerability assessment capability](deploy-vulnerability-assessment-vm.md) on the [Defender for Servers plan](apply-security-baseline.md).

::: zone pivot="azure-portal"

## Access attack paths and security explorer

In the Azure portal, you can access these capabilities through:
- **Attack path analysis**: Navigate to **Microsoft Defender for Cloud** > **Attack path analysis**
- **Cloud security explorer**: Navigate to **Microsoft Defender for Cloud** > **Cloud security explorer**

::: zone-end

::: zone pivot="defender-portal"

## Access attack paths and security explorer in the Defender portal

In the Microsoft Defender portal, these capabilities are integrated into the Exposure Management experience:

### Attack paths access

Navigate to **Exposure Management** > **Attack surface** > **Attack paths** to access:

- **Attack paths overview**: View attack paths over time, top 5 choke points, top 5 attack path scenarios, top targets, and top entry points
- **Attack path list**: Dynamic, filterable view of attack paths with advanced filtering capabilities
- **Attack Path Map**: Graph-based view highlighting vulnerable nodes, entry points, and target assets with drill-down capabilities

### Enhanced attack path features

- **Choke points identification**: Nodes where multiple attack paths converge, flagged as high-risk bottlenecks for focused mitigation efforts
- **Real-time analysis**: Dynamic attack path generation based on real-time exposure data using Defender for Cloud's proprietary algorithm
- **MITRE ATT&CK mapping**: Each path shows associated MITRE tactics, techniques, and remediation status
- **Enhanced filtering**: Filter by risk level, asset type, remediation status, and time frame (e.g., last 30 days)
- **Historical tracking**: Monitor attack path evolution and incident correlation over time

### Cloud security explorer integration

- **Enhanced querying**: Access through the Exposure Management interface with improved graph-based queries
- **Cross-solution correlation**: Attack paths are correlated with incidents from Microsoft Defender XDR and other Microsoft security solutions
- **Contextual insights**: Integration with broader security context for more informed decision-making

The Defender portal provides a unified view that integrates attack path analysis with broader threat detection and incident response workflows, enabling more comprehensive security operations.

::: zone-end

## What is cloud security graph?

The cloud security graph is a graph-based context engine within Defender for Cloud. The cloud security graph collects data from your multicloud environment and other sources. For example, it includes cloud assets inventory, connections, lateral movement possibilities, internet exposure, permissions, network connections, vulnerabilities, and more. The collected data builds a graph representing your multicloud environment.

Defender for Cloud uses the generated graph to perform an attack path analysis and find the highest-risk issues in your environment. You can also query the graph using the cloud security explorer.


:::image type="content" source="media/concept-cloud-map/security-map.png" alt-text="Screenshot of a conceptualized graph that shows the complexity of security graphing." lightbox="media/concept-cloud-map/security-map.png":::

## What is an attack path?

An attack path is a series of steps a potential attacker uses to breach your environment and access your assets. Attack paths focus on real, externally-driven and exploitable threats that adversaries could use to compromise your organization. An attack path starts at an external entry point, such as an internet-exposed vulnerable resource. The attack path follows available lateral movement within your multicloud environment, such as using attached identities with permissions to other resources. The attack path continues until the attacker reaches a critical target, such as databases containing sensitive data.

Defender for Cloud's attack path analysis feature uses the cloud security graph and a proprietary algorithm to find exploitable entry points that begin outside your organization and the steps an attacker can take to reach your vital assets. This helps you cut through the noise and act faster by emphasizing only the most urgent, externally initiated, and exploitable threats. The algorithm exposes attack paths and suggests recommendations to fix issues, breaking the attack path and preventing a breach.

Attack Path expands cloud threat detection to cover a broad range of cloud resources, including storage accounts, containers, serverless environments, unprotected repositories, unmanaged APIs, and AI agents. Each attack path is built from a real, exploitable weakness such as exposed endpoints, misconfigured access settings, or leaked credentials, ensuring that identified threats reflect genuine risk scenarios. By analyzing cloud configuration data and performing active reachability scans, the system validates whether exposures are accessible from outside the environment, reducing false positives and emphasizing threats that are both real and actionable.

:::image type="content" source="media/concept-cloud-map/attack-path.png" alt-text="Image that shows a sample attack path from attacker to your sensitive data.":::

The attack path analysis feature scans each customer's unique cloud security graph for exploitable entry points. If an entry point is found, the algorithm searches for potential next steps an attacker could take to reach critical assets. These attack paths are presented on the attack path analysis page in Defender for Cloud and in applicable recommendations.

Each customer sees their unique attack paths based on their unique multicloud environment. Using the attack path analysis feature in Defender for Cloud, you can identify issues that might lead to a breach. You can also remediate any found issue based on the highest risk first. Risk is based on factors such as internet exposure, permissions, and lateral movement.

::: zone pivot="azure-portal"

Learn how to use [attack path analysis](how-to-manage-attack-path.md).

::: zone-end

::: zone pivot="defender-portal"

### Enhanced attack path capabilities in the Defender portal

The Defender portal provides additional attack path analysis capabilities:

- **Choke points identification**: The system identifies nodes where multiple attack paths converge, allowing you to focus mitigation efforts where they'll have the greatest impact by reducing the blast radius of potential breaches.

- **Top attack path insights**: View summaries of the top 5 choke points, top 5 attack path scenarios, top targets, and top entry points to prioritize your security efforts.

- **Advanced filtering and grouping**: Filter attack paths by risk level, asset type, remediation status, and time frame (such as last 30 days). Group and organize attack paths for easier triage and management.

- **Historical tracking**: Monitor attack path trends over time and track the progress of remediation efforts with historical data and incident correlation.

- **Cross-cloud attack paths**: Detect attack paths that span multiple cloud environments, identifying routes that start in one cloud provider and end in another.

Learn how to use [attack path analysis](how-to-manage-attack-path.md).

::: zone-end

## What is cloud security explorer?

Running graph-based queries on the cloud security graph with the cloud security explorer, you can proactively identify security risks in your multicloud environments. Your security team can use the query builder to search for and locate risks, considering your organization's specific contextual and conventional information.

Cloud security explorer enables proactive exploration. You can search for security risks within your organization by running graph-based path-finding queries on the contextual security data provided by Defender for Cloud, such as cloud misconfigurations, vulnerabilities, resource context, lateral movement possibilities between resources, and more.

Learn how to use the [cloud security explorer](how-to-manage-cloud-security-explorer.md), or check out the [cloud security graph components list](attack-path-reference.md#cloud-security-graph-components-list).

## Next steps

- [Identify and remediate attack paths](how-to-manage-attack-path.md)
- [Enabling agentless scanning for machines](enable-vulnerability-assessment-agentless.md#enabling-agentless-scanning-for-machines)
- [Build a query with the cloud security explorer](how-to-manage-cloud-security-explorer.md)
