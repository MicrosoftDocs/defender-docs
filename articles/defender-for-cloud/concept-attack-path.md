---
title: Investigating risks with security explorer/attack paths in Microsoft Defender for Cloud
description: Learn about investigating risks with security explorer/attack paths in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 10/08/2024
---

# Investigating risk with security explorer/attack paths

> [!VIDEO https://aka.ms/docs/player?id=36a5c440-00e6-4bd8-be1f-a27fbd007119]

One of the biggest challenges that security teams face today is the number of security issues they face on a daily basis. There are numerous security issues that need to be resolved and never enough resources to address them all.

Defender for Cloud's contextual security capabilities assists security teams to assess the risk behind each security issue, and identify the highest risk issues that need to be resolved soonest. Defender for Cloud assists security teams to reduce the risk of an impactful breach to their environment in the most effective way.

All of these capabilities are available as part of the [Defender Cloud Security Posture Management](concept-cloud-security-posture-management.md) plan and require you to enable either [agentless scanning for VMs](concept-agentless-data-collection.md) or the [vulnerability assessment capability](deploy-vulnerability-assessment-vm.md) on the [Defender for Servers plan](apply-security-baseline.md).

## What is cloud security graph?

The cloud security graph is a graph-based context engine that exists within Defender for Cloud. The cloud security graph collects data from your multicloud environment and other data sources. For example, the cloud assets inventory, connections and lateral movement possibilities between resources, exposure to internet, permissions, network connections, vulnerabilities, and more. The data collected is then used to build a graph representing your multicloud environment.

Defender for Cloud then uses the generated graph to perform an attack path analysis and find the issues with the highest risk that exist within your environment. You can also query the graph using the cloud security explorer.  

:::image type="content" source="media/concept-cloud-map/security-map.png" alt-text="Screenshot of a conceptualized graph that shows the complexity of security graphing." lightbox="media/concept-cloud-map/security-map.png":::

## What is an attack path?

An attack path is a series of steps a potential attacker can use to breach your environment and access your assets. An attack path starts at entry point, for example a vulnerable resource. The attack path then follows the available lateral movement within your multicloud environment, for example by using attached identities that have permissions to other resources.  The attack path continues until the attacker reaches a vulnerable target, such as databases that contain sensitive data.. 

Defender for Cloud's attack path analysis feature uses the cloud security graph, and a proprietary algorithm to find exploitable entry points and the steps an attacker can take to reach your vital assets. The algorithm exposes attack paths and suggests recommendations to fix issues that break the attack path and prevent a breach. 

:::image type="content" source="media/concept-cloud-map/attack-path.png" alt-text="Image that shows a sample attack path from attacker to your sensitive data.":::

The attack path analysis feature uses the algorithm to scan each customer's unique cloud security graph for exploitable entry points. If an entry point is found, the algorithm searches for potential next steps an attacker could take to reach critical assets. These attack paths are then presented on the attack path analysis page in Defender for Cloud and in applicable recommendations. 

Each customer sees their own unique attack paths based on their unique multicloud environment. By using the attack path analysis feature in Defender for Cloud, you can identify issues that might lead to a breach. You can also remediate any found issue based on the biggest risk first. Risk is based on factors such as  internet exposure, permissions, and lateral movement. 

Learn how to use [attack path analysis](how-to-manage-attack-path.md).

## What is cloud security explorer?

By running graph-based queries on the cloud security graph with the cloud security explorer, you can proactively identify security risks in your multicloud environments. Your security team can use the query builder to search for and locate risks, while taking your organization's specific contextual and conventional information into account.

Cloud security explorer provides you with the ability to perform proactive exploration features. You can search for security risks within your organization by running graph-based path-finding queries on top the contextual security data that is already provided by Defender for Cloud, such as cloud misconfigurations, vulnerabilities, resource context, lateral movement possibilities between resources and more.

Learn how to use the [cloud security explorer](how-to-manage-cloud-security-explorer.md), or check out the [cloud security graph components list](attack-path-reference.md#cloud-security-graph-components-list).

## Next steps

- [Identify and remediate attack paths](how-to-manage-attack-path.md)
- [Enabling agentless scanning for machines](enable-vulnerability-assessment-agentless.md#enabling-agentless-scanning-for-machines)
- [Build a query with the cloud security explorer](how-to-manage-cloud-security-explorer.md)
