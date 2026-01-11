---
title: Schemas and operators in Microsoft Security Exposure Management
description: This article describes the enterprise exposure graph schemas and operators in Microsoft Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Schemas and operators overview

[Enterprise exposure graph schemas](cross-workload-attack-surfaces.md#enterprise-exposure-graph-schemas) in Microsoft Security Exposure Management provide attack surface information, to help you understand how potential threats might reach, and compromise, valuable assets. This article summarizes the exposure graph schema tables and operators.

## Schema tables

The exposure graph relies on the following tables:

- *ExposureGraphNodes*
- *ExposureGraphEdges*

### ExposureGraphNodes

*ExposureGraphNodes* contains organizational entities and their properties. These include entities like devices, identities, user groups, and cloud assets such as virtual machines (VMs), storage, and containers. Each node corresponds to an individual entity and encapsulates information about its characteristics, attributes, and security related insights within the organizational structure.

The following are *ExposureGraphNodes* column names, types, and descriptions:

- `NodeId` (`string`) - A unique node identifier. Example: "650d6aa0-10a5-587e-52f4-280bfc014a08"
- `NodeLabel` (`string`)- The node label. Examples: "microsoft.compute/virtualmachines", "elasticloadbalancing.loadbalancer"
- `NodeName` (`string`)- The node display name. Example: "nlb-test" (a network load balancer name)
- `Categories` (`Dynamic` (json)) - The categories of the node.
Example:

```json
[
  "compute",
  "virtual_machine"
] 
```

- `NodeProperties` (`Dynamic` (json)) - Properties of the node, including insights related to the resource, such as whether the resource is exposed to the internet, or vulnerable to remote code execution. Values are in raw data format (unstructured). Example:

```json
{   
"rawData": {
"osType": "linux",   
"exposed to the internet": 
{     
"routes": [ { … } ]   
}
} 
}
```

- EntityIds (`Dynamic` (json)) - All the known node identifiers. Example:

```json
{ 
"AzureResourceId": "A1",  
"MdeMachineId": "M1", 
}
```

### ExposureGraphEdges

The *ExposureGraphEdges* schema, along with the complementing *ExposureGraphNodes* schema, provides visibility into relationships between entities and assets in the graph.
Many hunting scenarios require exploration of entity relationships and attack paths. For example, when hunting for devices exposed to a specific critical vulnerability, knowing the relationship between entities, can uncover critical organizational assets.

The following are *ExposureGraphEdges* column names, labels, and descriptions:

- `EdgeId` (`string`) - The unique identifier for the relationship/edge.
- `EdgeLabel` (`string`) - The edge label. Examples: "affecting," "routes traffic to," "is running," and "contains." You can view a list of edge labels by querying the graph. For more information, see [List all edge labels in your tenant](query-enterprise-exposure-graph.md#list-all-edge-labels-in-your-tenant).
- `SourceNodeId` (`string`) - Node ID of the edge's source. Example: "12346aa0-10a5-587e-52f4-280bfc014a08"
- `SourceNodeName` (`string`) - The source node display name. Example: "mdvmaas-win-123"
- `SourceNodeLabel` (`string`) - The source node label. Example: "microsoft.compute/virtualmachines"
- `SourceNodeCategories` (`Dynamic` (json)) - The categories list of the source node.
- `TargetNodeId` (`string`) - The node ID of the edge's target. Example: "45676aa0-10a5-587e-52f4-280bfc014a08"
- `TargetNodeName` (`string`) - Display name of the target node. Example: gke-test-cluster-1
- `TargetNodeLabel` (`string`) - The target node label. Example: "compute.instances"
- `TargetNodeCategories` (`Dynamic` (json)) - The categories list of the target node.
- `EdgeProperties` (`Dynamic` (json)) - Optional data relevant for the relationship between the nodes. Example: For the `EdgeLabel` "routes traffic to" with `EdgeProperties` of `networkReachability`, provide information about the port and protocol ranges that are used to transfer traffic from point A to B.

```json
{   
 "rawData": {
  "networkReachability": {
    "type": "NetworkReachability",
    "routeRules": [
      {
        "portRanges": [
          "8083"
        ],
        "protocolRanges": [
          "6"
        ]
      },
      {
        "portRanges": [
          "80"
        ],
        "protocolRanges": [
          "6"
        ]
      },
      {
        "portRanges": [
          "443"
        ],
        "protocolRanges": [
          "6"
        ]
      }
    ]
  }
}
}
```

## Graph Kusto Query Language (KQL) operators

Microsoft Security Exposure Management relies on exposure graph tables and unique exposure graph operators to enable operations over graph structures. The graph is built from tabular data using the `make-graph` operator, and then queried using graph operators.

### The make-graph operator

The `make-graph operator` builds a graph structure from tabular inputs of edges and nodes. For more information about its use and syntax, see [make-graph operator](/azure/data-explorer/kusto/query/make-graph-operator).

### The graph-match operator

The `graph-match` operator searches for all occurrences of a graph pattern in an input graph source. For more information, see [graph-match operator](/azure/data-explorer/kusto/query/graph-match-operator).

## Next steps

[Query the enterprise exposure graph](query-enterprise-exposure-graph.md).
