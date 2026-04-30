---
title: Graph tool collection in Microsoft Sentinel MCP server
titleSuffix: Microsoft Security  
description: Learn about the different tools available in the Graph collection in Microsoft Sentinel 
author: poliveria
ms.topic: how-to
ms.date: 05/04/2026
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to know the different tools available to reason over multiple Microsoft Sentinel graphs
---

# Explore Microsoft Sentinel graphs with graph tool collection (preview)

> [!IMPORTANT]
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

The graph tool collection in the Microsoft Sentinel Model Context Protocol (MCP) server lets you reason over multiple Microsoft Sentinel graphs, including exposure, hunting, and data risk graphs. By using this tool, you can gather insights and make data-driven decisions while querying in natural language.

## Prerequisites

To access the graph tool collection, you must have the following prerequisites:
- [Microsoft Sentinel data lake and graph](sentinel-lake-onboarding.md)
- Microsoft Sentinel data lake onboarded to Defender portal 
- Any of the supported AI-powered code editors and agent-building platforms:
    - [Microsoft Security Copilot](sentinel-mcp-use-tool-security-copilot.md#add-a-microsoft-sentinel-tool-collection)
    - [Microsoft Copilot Studio](sentinel-mcp-use-tool-copilot-studio.md#add-a-microsoft-sentinel-tool-collection)
    - [Microsoft Foundry](sentinel-mcp-use-tool-azure-ai-foundry.md#add-a-microsoft-sentinel-tool-collection)
    - [Visual Studio Code](sentinel-mcp-use-tool-visual-studio-code.md) 

To access the graph data in Defender portal, you must have at least [read-only access](/security-exposure-management/prerequisites) in Microsoft Security Exposure Management.

## Add the graph collection

To add the graph collection, first set up Microsoft Sentinel's unified MCP server interface. Follow the step-by-step instructions for compatible [AI-powered code editors and agent-building platforms](sentinel-mcp-get-started.md#add-microsoft-sentinels-collection-of-mcp-tools).

The graph collection is hosted at the following URL:

```
https://sentinel.microsoft.com/mcp/graph 
```


## Tools in the graph collection  

### Blast radius finder (`graph_find_blastradius`) 

This tool evaluates the blast radius of a node by exploring propagation paths towards an organization's critical assets. It details the paths that start at the entity you provide, evaluates the risk, and specifies recommendations to reduce it.

| Parameters | Required? | Description | 
|----------|----------|----------|
| `sourceName`| Yes |This parameter takes in keywords to search for relevant information matching an entity in the graph. It can be a node or a group of nodes. |

### Connection and path discovery (`graph_find_walkable_paths)` 
This tool enumerates the connections between any given pairs of sources and targets. It analyzes the nature of the connections and then decides whether it can be traversed for lateral movement. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `sourceName`  | Yes |This parameter takes in keywords to match an entity within the graph for the path starting point.|
|`targetName`  |Yes |This parameter takes in keywords to match an entity within the graph for the path target. |

 
### Exposure perimeter analyzer (`graph_exposure_perimeter`) 
This tool lists the incoming connections from other entities to the specified entity. It helps you determine the risk that the entity faces. The tool might return prioritized recommendations based on the results. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `targetName` | Yes |This parameter takes in keywords to identify and match an entity in the graph; the node's name. |
| `minPathLength` | No |This parameter takes in the minimum number of hops in a path. |
| `maxPathLength` | No |This parameter takes in the maximum number of hops in a path. |
| `resultsCountLimit` | No |This parameter takes in the maximum number of paths to return. |

### Path between two entities (`graph_find_connected_nodes`) 

This tool lists traversable paths between two entities that match a criteria or characteristic that describes those entities. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `sourceNodeLabel` | Yes |This parameter takes in a valid source label to filter on. For supported labels, use the `graph_get_context` tool. |
| `sourceNodeProperties` | No |This parameter takes in a list of valid properties for the starting point entity, separated by commas. For supported properties, use the `graph_get_context` tool. |
| `targetNodeLabel` | Yes |This parameter takes in a valid target label to filter on. For supported labels, use the `graph_get_context` tool. |
| `targetNodeProperties` | No |This parameter takes in a list of valid properties for the ending point entity, separated by commas. For supported properties, use the `graph_get_context` tool. |
| `resultsCountLimit` | No |This parameter takes in the maximum number of results to return. |


### Nodes match (`graph_find_nodes`)

This tool finds and matches entities that the graph represents as nodes based on given criteria or characteristics. It returns a list of nodes that match the defined criteria.

| Parameters | Required? | Description | 
|----------|----------|----------|
| `validNodeLabel` | Yes |This parameter takes in a node label to match. For supported labels, use the `graph_get_context` tool. |
| `validNodeProperties` | No |This parameter takes in a list of properties to match, separated by commas. For supported properties, use the `graph_get_context` tool. |
| `resultsLimit` | No |This parameter takes in the maximum number of results to return. |

### General information and context for graph (`graph_get_context`)

This tool provides context for the parameters and serves as a reference to help you understand which tools, functionalities, or parameters you can use. Use it as a helper to get the graph context so you can better use the other graph MCP tools in the collection. 


## Additional information 

- To scope results to graph only, add `in my graph` to prompts. 
- Querying for identities doesn't support user principal names (UPNs).  
- When you specify the type of the entity, use it before the name. 
- Install the [data exploration collection](sentinel-mcp-data-exploration-tool.md) for increased insights and reasoning. 
- Installing and configuring the graph tool collection carries no cost. However, you invoke the graph meter when you start using the tools to query a Microsoft Sentinel graph. For more information, see:  [Plan costs and understand Microsoft Sentinel pricing and billing](../billing.md#graph-charges).

## Sample prompts 

The following sample prompts demonstrate what you can do with the graph collection: 

- Show me all internet-exposed virtual machines.
- Who are the domain admins?
- Which users are domain admins? 
- List all managed identities that have access to key vaults.
- What secrets are shared between external-facing applications and crown jewel assets? 
- List all paths from user _X_ to critical assets. 
- Find a path between _X_ and _Y_.  
    - Find a path from vulnerability affected device to critical users.
    - Find a path between user _X_ and device _Y_. 
- What is the blast radius of node _X_ if compromised?
- Find the blast radius of _X_. 
- What is the scope of impact if _X_ is compromised? 
- What is the exposure perimeter of _X_?
- Show me all devices that user _X_ frequently signs into.  
- List all virtual machines impacted by the CVE _X_.
- Show me all internet exposed virtual machines that have vulnerabilities and contain SSH keys.
- List all users with access to critical KeyVault _X_.
- What is the exposure perimeter of my critical SQL servers?
- Which of my virtual machines have the highest exposure perimeter?


## Related content
- [What is Microsoft Sentinel’s support for Model Context Protocol (MCP)?](sentinel-mcp-overview.md) 
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
