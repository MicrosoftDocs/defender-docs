---
title: Overview of cross-workload attack surfaces
description: This article provides an overview of how to manage and visualize cross-workload attack surfaces using the enterprise exposure graph to analyze assets, findings, relationships from multiple workloads across the organization.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Overview of attack surface management

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) helps you to visualize, analyze, and manage cross-workload attack surfaces.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Enterprise exposure graph

The enterprise exposure graph is the central tool for attack surface exploration and management. The  graph gathers infomation about assets, users, workloads, and more from across your enterprise to provide a unified, comprehensive view of your organizational security posture.

## Enterprise exposure graph schemas

Graph schemas provide a framework for organizing and analyzing interconnected assets from multiple workloads across the organization.

- Schemas are made up of tables that provide either event information or information about devices, alerts, identities, and other entity types.
- You query against schemas for proactive threat hunting across data and events. you can build queries in [advanced hunting](/microsoft-365/security/defender/advanced-hunting-modes.md). 
- To understand schemas and build effective queries, you can use a built in schema reference that provides table information. Learn more about the [advanced hunting schema](/microsoft-365/security/defender/advanced-hunting-schema-tables.md).


The enterprise exposure graph and the exposure graph schemas extend the existing Defender XDR [advanced hunting schemas](/microsoft-365/security/defender/advanced-hunting-schema-tables.md).

- The enterprise exposure graph schemas provide attack surface information to help understand how poten
- Use the exposure graph schema tables and operators to query the enterprise exposure graph.
- You can query the extended enterprise exposure graph schemas and operators, and the exposure map, to visualize your data. These tools allow you to inspect and search attack surface data and retrieve exposure information to help prevent risk.
- The enterprise exposure graph currently includes assets, findings, and entity relationships from:
    - Microsoft Defender for Cloud
    - Microsoft Defender for Endpoint
    - Microsoft Defender Vulnerability Management
    - Microsoft Defender for Identity
    - Microsoft Entra ID

By correlating exposure queries with other graph data, such as incident data, you can uncover risk to a greater degree.


## Attack surface map

The attack surface map (enterprise exposure map), gives you a way to visualize the exposure data that you can query using the exposure graph schema. It allows you to explore the data, and contextualize it in a broader network. It also allows you to dig deeper into multiple attack paths to see what other assets are at risk and prioritize your focus. For instance, you want to see whether a particular asset has undesired connections. Or see whether a device has a path to the internet, and if so, what other devices are exposed.  





## Next steps

For more information, see:

- Review [enterprise exposure graph schemas and operators](schemas-operators.md)
- [Query the enterprise exposure graph](query-enterprise-exposure-graph.md)
- Explore the [attack surface map](enterprise-exposure-map.md)


