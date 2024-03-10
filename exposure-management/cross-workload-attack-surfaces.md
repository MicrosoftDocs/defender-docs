---
title: Overview of attack surface management in Microsoft Security Exposure Management
description: Learn about attack surface management in Microsoft Security Exposure Management. s
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/04/2024
---

# Overview of attack surface management

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) helps you to visualize, analyze, and remediate cross-workload attack surfaces.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Enterprise exposure graph

The enterprise exposure graph is the central tool for attack surface exploration and management. The graph gathers information about assets, users, workloads, and more from across your enterprise to provide a unified, comprehensive view of your organizational security posture.

## Enterprise exposure graph schemas

Graph schemas provide a framework for organizing and analyzing interconnected assets from multiple workloads across the organization.

- Schemas are made up of tables that provide either event information or information about devices, alerts, identities, and other entity types.
- Query against schemas for proactive threat hunting across data and events. You can build queries in [advanced hunting](/microsoft-365/security/defender/advanced-hunting-modes).
- To understand schemas and build effective queries, you can use a built-in schema reference that provides table information. Learn more about the [advanced hunting schema](/microsoft-365/security/defender/advanced-hunting-schema-tables).

The enterprise exposure graph and the exposure graph schemas extend the existing Defender XDR [advanced hunting schemas](/microsoft-365/security/defender/advanced-hunting-schema-tables).

- The enterprise exposure graph schemas provide attack surface information to help understand how potential threats can reach and compromise valuable assets.
- Use the exposure graph schema tables and operators to query the enterprise exposure graph.
- You can query the extended enterprise exposure graph schemas and operators, and the exposure map, to visualize your data. These tools allow you to inspect and search attack surface data and retrieve exposure information to help prevent risk.
- The enterprise exposure graph currently includes assets, findings, and entity relationships from:
  - Microsoft Defender for Cloud
  - Microsoft Defender for Endpoint
  - Microsoft Defender Vulnerability Management
  - Microsoft Defender for Identity
  - Microsoft Entra ID

By correlating exposure queries with other graph data, such as incident data, you can uncover risk to a greater degree.

## Exposure map

The exposure (attack surface) map helps you to visualize the exposure data that you query using the exposure graph schema.

In the map you can explore the data, check what assets are at risk, contextualize them in a broader network framework, and prioritize security focus.

For example, you can check whether a particular asset has unwanted connections, or see whether a device has a path to the internet, and if so, what other devices are exposed.  

## Next steps

- Review [enterprise exposure schemas and operators](schemas-operators.md)
- [Query the enterprise exposure graph](query-enterprise-exposure-graph.md)
- Explore the [attack surface map](enterprise-exposure-map.md)
