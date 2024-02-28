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

# Overview

[!INCLUDE [prerelease](../includes//prerelease.md)]

This section provides an overview of how to manage, visualize, and analyze cross-workload attack surfaces using the enterprise exposure graph. The exposure graph schemas are made up of multiple tables that provide either event information or information about devices, alerts, identities, and other entity types. The enterprise exposure graph and the exposure graph schemas extend [advanced hunting schemas](/microsoft-365/security/defender/advanced-hunting-overview.md) which support a query-based threat hunting tool. Queries cross an advanced hunting schema that’s made up of multiple tables that provide event information, or information about entities such as devices, alerts, and identities. Microsoft Security Exposure Management extends the schema with enterprise exposure graph schemas and operators and the exposure map to visualize your data. These tools allow you to inspect and search attack surface data and retrieve exposure information to help prevent risk.

## Enterprise graph schema

The enterprise exposure graph schemas provide attack surface information to help understand how potential threats can reach and compromise valuable assets across your workload. The security exposure graph schemas provide a comprehensive framework for organizing and analyzing interconnected assets entities from multiple workloads across the organization. The framework enables efficient asset graph data representation and exploration.

The enterprise exposure graph currently includes assets, findings, and entity relationships from:

- Defender for Cloud
- Defender for Endpoint
- Defender Vulnerability Management
- Defender for Identity
- Entra ID

By correlating your exposure queries with other graph data, such as incident data, you can uncover risk to a greater degree.

## Attack Surface Map

The Attack surface map (enterprise exposure map), gives you a way to visualize the exposure data that you can query using the exposure graph schema. It allows you to explore the data, and contextualize it in a broader network. It also allows you to dig deeper into multiple attack paths to see what other assets are at risk and prioritize your focus. For instance, you want to see whether a particular asset has undesired connections. Or see whether a device has a path to the internet, and if so, what other devices are exposed.  

## Schema and operators

The enterprise exposure graph schemas provide attack surface information that helps you understand how potential threats can reach and compromise valuable assets. Exposure graph tables and operators allow you to query the enterprise exposure graph. You can use the schemas to build queries in [Advanced hunting](/microsoft-365/security/defender/advanced-hunting-modes.md). For more information about Advanced Hunting schemas, see [Understanding the advanced hunting schema](/microsoft-365/security/defender/advanced-hunting-schema-tables.md).

The following sections explore the enterprise exposure graph schemas further:

- [Schemas and operators overview](schemas-operators.md)
- [Query the enterprise exposure graph](query-enterprise-exposure-graph.md)
- [Explore the attack surface map](enterprise-exposure-map.md)

## Next steps

For more information, see:

- [Schemas and operators overview](schemas-operators.md)
- [!INCLUDE [support](../includes//support.md)]
