---
title: Query the enterprise exposure graph in Microsoft Security Exposure Management
description: Learn how to query the enterprise exposure graph to understand security risk in Microsoft Security Exposure Management.
author: dlanger
ms.author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Query the enterprise exposure graph

Use the enterprise exposure graph in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) to proactively hunt for enterprise exposure threats in [advanced hunting](https://security.microsoft.com/v2/advanced-hunting)  in the Microsoft Defender portal.

This article provides some examples, tips, and hints for constructing queries in the enterprise exposure graph.

## Prerequisites

- [Read about](cross-workload-attack-surfaces.md) attack surface management.
- [Review required permissions](prerequisites.md#permissions) for working with the graph.

## Build advanced hunting queries

- Review [best practices for building advanced hunting queries](/defender-xdr/advanced-hunting-best-practices)
- Get started with [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/)

## Use the make-graph operator

Kusto's `make-graph` operator loads nodes and edges data into memory.

- Since Kusto only loads the columns that are in use, there's no need to explicitly select columns.
- However, the `NodeProperties` column contains all node information and so is large.
- In most scenarios, it's useful to extract only the information required before feeding it into the `make-graph` operator.

### Example

```kusto
let FilteredNodes = ExposureGraphNodes
| extend ContainsSensetiveData = NodeProperties has "containsSensitiveData"
| project Id, ContainsSensetiveData, Label, EntityIds, Categories;
Edges
| make-graph SourceNodeId --> TargetNodeId with FilteredNodes on Id
..
```

## Use dynamic columns and smart-indexing

`NodeProperties` and `Categories` are dynamic columns.

- Kusto knows those columns contain json-like content, and applies smart indexing.
- However, not all Kusto operators use the index. For example, `set_has_element`, `isempty`, `isnotnull` don't use the index when they're applied to a dynamic column and `isnotnull(Properties["containsSensitiveData"]` doesn't use the index.
- Instead, use the `has()` operator, which always uses the index.

### Example

In the following query the `has` operator checks for the `data` string, and `set_has_element` checks for the `data` element.

Using both operators is important as the `has()` operator returns true even for a category `prefix_data`.

`Categories has('data') and set_has_element(Categories, 'data')`

Learn more about [understanding string terms](/azure/data-explorer/kusto/query/datatypes-string-operators#understanding-string-terms).

## Example exposure queries

The following examples can help you write queries to understand the security exposure data in your tenant.

### List all node labels in your tenant

The following query groups the data in the `ExposureGraphNodes` table and uses Kusto's `summarize` operator to list it by `NodeLabel`.

```kusto
ExposureGraphNodes
| summarize by NodeLabel
```

### List all edge labels in your tenant

The following query groups the data in the `ExposureGraphEdges` table and uses Kusto's `summarize` operator to list it by edge labels (`EdgeLabel`).

```kusto
ExposureGraphEdges
| summarize by EdgeLabel
```

### List all connections from a specified node label

The following query groups the data in the `ExposureGraphEdges` table, and where the source node label is `microsoft.compute/virtualmachines`, it summarizes the virtual machine's by `EdgeLabel`. It summarizes the edges that connect assets to virtual machines in your security exposure graph.

```kusto
ExposureGraphEdges
| where SourceNodeLabel == "microsoft.compute/virtualmachines"
| summarize by EdgeLabel
```

### List all connections to a specific node label

The following query summarizes edges that connect virtual machines to other security exposure graph assets. It groups the data in the `ExposureGraphEdges` table, and where the target node label is `microsoft.compute/virtualmachines`, it uses Kusto's `summarize` operator to list the target node label by `EdgeLabel`.

```kusto
ExposureGraphEdges
| where TargetNodeLabel == "microsoft.compute/virtualmachines"
| summarize by EdgeLabel
```

### List properties of a specific node label

The following query lists properties of the virtual machine node label. It groups the data in the `ExposureGraphNodes` table, filtered to show the node label "microsoft.compute/virtualmachines" results only. With the `project-keep` operator, the query keeps the `NodeProperties` column. The data returned is limited to one row.

```kusto
ExposureGraphNodes
| where NodeLabel == "microsoft.compute/virtualmachines"
| project-keep NodeProperties
| take 1
```

## Query the exposure graph

To query the exposure graph:

1. In the [Microsoft Defender portal](https://security.microsoft.com/), select **hunting -> advanced hunting**.

1. In the Query area, type your query. Use the graph schema, functions, and operator tables or the following examples to help you build your query.

1. Select **run query**.

## Graph-oriented query examples

Use these graph-oriented query examples to help you write better security exposure queries. The examples search for patterns to expose relationships between entities that can uncover risk. They show you how to correlate context with incident/alert signals.

### List all node labels with an edge to a specific node label

The following query results in a list of all incoming node labels with a connector to the virtual machine node label. It builds a graph structure by mapping the `SourceNodeId` column data in the `ExposureGraphEdges` table to the `TargetNodeId` column in the `ExposureGraphNodes` table with the `make-graph` operator to build a graph structure.

It then uses the `graph-match` operator to make a graph pattern where the target node `TargetNode` and `NodeLabel` match `microsoft.compute/virtualmachines`. The `project` operator is used to keep only the `IncomingNodeLabels`. It lists the results by `IncomingNodeLabels`.

```kusto
ExposureGraphEdges
| make-graph SourceNodeId --> TargetNodeId with ExposureGraphNodes
on NodeId
| graph-match (SourceNode)-[edges]->(TargetNode)
       where TargetNode.NodeLabel == "microsoft.compute/virtualmachines"
       project IncomingNodeLabels = SourceNode.NodeLabel 
| summarize by IncomingNodeLabels
```

### List all node labels edging a specific node label

The following query results in a list of all the outgoing node labels with a connector to the virtual machine node label.

- It builds a graph structure by mapping the `SourceNodeId` column uses the data in the `ExposureGraphEdges` table to the `TargetNodeId` column in the `ExposureGraphNodes` table using the `make-graph` operator to build a graph structure.
- It then uses the `graph-match` operator to match the graph pattern where `SourceNode` and `NodeLabel` match `microsoft.compute/virtualmachines`.
- The `project` operator is used to keep only the `OutgoingNodeLabels`. It lists the results by `OutgoingNodeLabels`.

```kusto
ExposureGraphEdges
| make-graph SourceNodeId --> TargetNodeId with ExposureGraphNodes
on NodeId
| graph-match (SourceNode)-[edges]->(TargetNode)
       where SourceNode.NodeLabel == "microsoft.compute/virtualmachines"
       project OutgoingNodeLabels = SourceNode.NodeLabel 
| summarize by OutgoingNodeLabels
```

### Discover VMs exposed to the internet with an RCE vulnerability

The following query allows you to discover virtual machines exposed to the internet and to a Remote Code Execution (RCE) vulnerability.

- It uses the `ExposureGraphNodes` schema table.
- When both `NodeProperties` `exposedToInternet` and `vulnerableToRCE` are true, it checks that the category  (`Categories`) is virtual machines (`virtual_machine`).

```kusto
ExposureGraphNodes
| where isnotnull(NodeProperties.rawData.exposedToInternet)
| where isnotnull(NodeProperties.rawData.vulnerableToRCE)
| where Categories has "virtual_machine" and set_has_element(Categories, "virtual_machine")
```

### Discover internet facing devices with a privilege escalation vulnerability

The following query looks for internet facing devices exposed to a privilege escalation vulnerability, which could allow access to higher level privileges within the system.

- It uses the `ExposureGraphNodes` schema table.
- When `NodeProperties` is both internet facing (`IsInternetFacing`) and `VulnerableToPrivilegeEscalation`, the query checks that the items in `Categories` are actually devices (`device`).

```kusto
ExposureGraphNodes
| where isnotnull(NodeProperties.rawData.IsInternetFacing)
| where isnotnull(NodeProperties.rawData.VulnerableToPrivilegeEscalation)
| where set_has_element(Categories, "device")
```

### Show all users logged in to more than one critical device

This query results in a list of users logged into more than one critical device, along with the number of devices they're logged into.

- It creates an `IdentitiesAndCriticalDevices` table using `ExposureGraphNodes` data filtered either by devices with a criticality level above 4 or by `identity`.
- It then makes a graph structure with the `make-graph` operator, where the `EdgeLabel` is `Can Authenticate As`.
- It uses the `graph-match` operator to match instances where a `device` matches an `identity`.
- Then it uses the `project` operator to keep identity IDs and device IDs.
- The `mv-apply` operator filters device IDs and identity IDs by type. It summarizes them and displays the results in a table with the headers, `Number Of devices user is logged-in to`, and `User Id`.

```kusto
let IdentitiesAndCriticalDevices = ExposureGraphNodes
| where
 // Critical Device
 (set_has_element(Categories, "device") and isnotnull(NodeProperties.rawData.criticalityLevel) and NodeProperties.rawData.criticalityLevel.criticalityLevel < 4)
 // or identity
 or set_has_element(Categories, "identity");
ExposureGraphEdges
| where EdgeLabel == "Can Authenticate As"
| make-graph SourceNodeId --> TargetNodeId with IdentitiesAndCriticalDevices on NodeId
| graph-match (Device)-[canConnectAs]->(Identity)
       where set_has_element(Identity.Categories, "identity") and set_has_element(Device.Categories, "device")
       project IdentityIds=Identity.EntityIds, DeviceIds=Device.EntityIds
| mv-apply DeviceIds on (
    where DeviceIds.type == "DeviceInventoryId")
| mv-apply IdentityIds on (
    where IdentityIds.type == "SecurityIdentifier")
| summarize NumberOfDevicesUserLoggedinTo=count() by tostring(IdentityIds.id)
| where NumberOfDevicesUserLoggedinTo > 1
| project ["Number Of devices user is logged-in to"]=NumberOfDevicesUserLoggedinTo, ["User Id"]=IdentityIds_id
```

### Show client devices with a critical vulnerability/users that have access to high value servers

The following query results in a list of devices with RCE vulnerabilities and their device IDs, and devices with high critical vulnerabilities and their device IDs.

- It creates an `IdentitiesAndCriticalDevices` table that includes devices (`device`) with RCE vulnerabilities with criticality lower than four, and identities (`identity`) that with through filtering and pattern matching, show devices with critical vulnerabilities.
- The list is filtered to show only those connections that have edge labels `Can Authenticate As` and `CanRemoteInteractiveLogonTo`.

```kusto
let IdentitiesAndCriticalDevices = ExposureGraphNodes // Reduce the number of nodes to match
| where 
 // Critical devices & devices with RCE vulnerabilities
 (set_has_element(Categories, "device") and 
    (
        // Critical devices
        (isnotnull(NodeProperties.rawData.criticalityLevel) and NodeProperties.rawData.criticalityLevel.criticalityLevel < 4)
        or 
        // Devices with RCE vulnerability
        isnotnull(NodeProperties.rawData.vulnerableToRCE)
    )
  )
 or 
 // identity
 set_has_element(Categories, "identity");
ExposureGraphEdges
| where EdgeLabel in~ ("Can Authenticate As", "CanRemoteInteractiveLogonTo") // Reduce the number of edges to match
| make-graph SourceNodeId --> TargetNodeId with IdentitiesAndCriticalDevices on NodeId
| graph-match (DeviceWithRCE)-[CanConnectAs]->(Identity)-[CanRemoteLogin]->(CriticalDevice)
       where 
             CanConnectAs.EdgeLabel =~ "Can Authenticate As" and
             CanRemoteLogin.EdgeLabel =~ "CanRemoteInteractiveLogonTo" and
             set_has_element(Identity.Categories, "identity") and 
             set_has_element(DeviceWithRCE.Categories, "device") and isnotnull(DeviceWithRCE.NodeProperties.rawData.vulnerableToRCE) and
             set_has_element(CriticalDevice.Categories, "device") and isnotnull(CriticalDevice.NodeProperties.rawData.criticalityLevel)
       project DeviceWithRCEIds=DeviceWithRCE.EntityIds, DeviceWithRCEName=DeviceWithRCE.NodeName, CriticalDeviceIds=CriticalDevice.EntityIds, CriticalDeviceName=CriticalDevice.NodeName
```

### Provide all paths from specific node ID to a node with a specific label

This query displays the path from a specific IP node, passing through up to three assets that results in a connection to the virtual machine node label.

- It uses the `ExposureGraphNodes` and `ExposureGraphEdges` schema tables and the `make-graph` and `graph-match` operators to create a graph structure.
- With the `project` operator, it displays a list of IP IDs, IP properties, virtual machine IDs, and virtual machine properties.

```kusto
let IPsAndVMs = ExposureGraphNodes
| where (set_has_element(Categories, "ip_address") or set_has_element(Categories, "virtual_machine"));
ExposureGraphEdges
| make-graph SourceNodeId --> TargetNodeId with IPsAndVMs on NodeId
| graph-match (IP)-[anyEdge*1..3]->(VM)
       where set_has_element(IP.Categories, "ip_address") and set_has_element(VM.Categories, "virtual_machine")
       project IpIds=IP.EntityIds, IpProperties=IP.NodeProperties.rawData, VmIds=VM.EntityIds, VmProperties=VM.NodeProperties.rawData
```

## Next steps

[Explore with the attack surface map](enterprise-exposure-map.md).
