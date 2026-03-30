---
title: Overview of attack surface management in Microsoft Security Exposure Management
description: Learn about attack surface management in Microsoft Security Exposure Management. s
ms.topic: overview
ms.date: 10/26/2025
---

# Overview of attack surface management

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) helps you to visualize, analyze, and remediate cross-workload attack surfaces spanning on-premises, cloud, and hybrid environments. With the integration of Defender for Cloud in the Defender portal, attack surface management includes hybrid attack paths that bridge on-premises and cloud contexts, providing comprehensive visibility across your entire digital estate.

## Enterprise exposure graph

The enterprise exposure graph is the central tool for exploring and managing attack surfaces. The graph gathers information about assets, users, workloads, and more, from across your enterprise to provide a unified, comprehensive view of your organizational security posture.

### Graph schemas

Graph schemas provide a framework for organizing and analyzing interconnected assets from multiple workloads across the organization.

- Schemas are made up of tables that provide either event information or information about devices, alerts, identities, and other entity types.
- You query against schemas for proactive threat hunting across data and events. You can build queries in [advanced hunting](/defender-xdr/advanced-hunting-modes).
- To understand schemas and build effective queries, you can use a built-in schema reference that provides table information.

### Enterprise exposure graph schemas

The enterprise exposure graph and the exposure graph schemas extend the existing Defender XDR [advanced hunting schemas](/defender-xdr/advanced-hunting-schema-tables).

- The schemas provide attack surface information to help understand how potential threats can reach and compromise valuable assets.
- You use the schema tables and operators to query the enterprise exposure graph. Queries allow you to inspect and search attack surface data, and to retrieve exposure information to help prevent risk.
- The enterprise exposure graph currently includes assets, findings, and entity relationships from:
  - Microsoft Defender for Cloud (including Azure, AWS, and GCP resources)
  - Microsoft Defender for Endpoint
  - Microsoft Defender Vulnerability Management
  - Microsoft Defender for Identity
  - Microsoft Entra ID
  - External data sources through Exposure Management connectors (ServiceNow CMDB, Tenable, Qualys, Rapid7)

By correlating exposure queries with other graph data, such as incident data, you can uncover risk to a greater degree.

## Attack surface map

The attack surface map helps you to visualize the exposure data that you query using the exposure graph schema, including cloud resources and their relationships.  

In the map you can explore the data across hybrid environments, check what assets are at risk, contextualize them in a broader network framework that spans on-premises and cloud, and prioritize security focus.

For example, you can check whether a particular asset has unwanted connections across cloud and on-premises environments, see whether a device has a path to the internet through cloud resources, identify how cloud misconfigurations might expose on-premises assets, and understand the full scope of hybrid attack paths.

## Next steps

- Review [enterprise exposure schemas and operators](schemas-operators.md).
- [Query the enterprise exposure graph](query-enterprise-exposure-graph.md).
- Explore the [attack surface map](enterprise-exposure-map.md).
- Read the blog [Microsoft Security Exposure Management Graph: unveiling the power](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/microsoft-security-exposure-management-graph-unveiling-the-power/ba-p/4148546).
