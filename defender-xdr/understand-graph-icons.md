---
title: Graph icons and visualizations in Microsoft Defender
description: Learn about the different icons used in graph nodes and edges when visualizing attack paths, blast radius, and entity relationships in Microsoft Defender 
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
  - m365-security
  - m365initiative-m365-defender
  - tier1
ms.custom:
- cx-ti
- cx-ah
- seo-marvel-apr2020
ms.topic: overview
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
search.appverid: met150
ms.date: 09/30/2025

---
# Understanding graphs and visualizations in Microsoft Defender

Microsoft Defender use interactive graphs to visualize attack paths, [blast radius](investigate-incidents.md#blast-radius-analysis), and relationships between entities in your environment. These visualizations provide a bird’s eye view of a possible threat or attack, letting you and your security operations (SOC) team to investigate and [hunt](advanced-hunting-graph.md) them quickly.

The graphs generated in the Defender portal are composed of [nodes](#nodes) and [edges](#edges). This article enumerates and defines the commonly used icons for graph these elements.

## Nodes

A **node** pertains to an entity in your environment (for example, a device, user account, or IP address, among others). Defender portal graphs usually depict nodes as any of the following circular icons:

| **Icon** | **Node type** | **Entity type examples** |
|---|---|---|
| | General | App service plan |
| | Compute | Device, virtual machine, Microsoft Azure Logic App |
| | Networking | Interface, public IP address, network security group |
| | Data | SQL data store, Azure Monitor Log Analytics workspace, storage account, Azure Event Hubs |
| | Containers | Kubernetes cluster |
| | Keys & secrets | Key vault |
| | DevOps | Azure DevOps repositories |
| | APIs | Cloud applications |
| | Identity & access | User account, Microsoft Entra ID service principal |
| | IoT | |
| | Certificate | |
| | IP address | |
| | Subscriptions | |

Selecting a node opens a side panel that provides more details about the chosen entity, such as entity name, type, last updated date, and discovery source. This panel might also display additional information such as attack paths and blast radius, depending on the selected node and its relationship to other nodes in the graph.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-node-details.png" alt-text="Screenshot of the side panel in the hunting graph containing node details." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-node-details.png":::

Entities and might also appear as **grouped nodes**, which have numerical indicators (for example, to indicate the total number of user accounts). To expand and view all nodes in a grouped node, use the **ungroup** toggle.

A node might also have any of the following indicators around it:

- **Critical asset** [icon]  - Indicates that an entity is classified as business-critical or valuable, as identified in the [critical asset management](/security-exposure-management/critical-asset-management) in Microsoft Security Exposure Management. The nodes representing critical assets also have a golden halo surrounding them. 
- **Vulnerability** [icon] - Indicates that at least one vulnerability was detected on the entity.
- **Explore connected assets** [icon] - Indicates that the node can expand the hunting graph further beyond the initial results. Expanding the graph lets you explore other relationships the selected entity has with the other ones.
- **Discovery source** - Indicates the entity's data source. This indicator appears as the icon of the Defender product protecting the entity in blue (for example, [icon]).

## Edges

An **edge**  indicates the relationship or connection properties between two nodes. The Defender portal graphs depicts an edge as lines or directional arrows that might have the following icons:  

| **Icon** | **Edge type** |
|---|---|
| | Contains |
| | Routes traffic to |
| | Has permission to |
| | Can authenticate as / Can authenticate to |
| | Pushes |
| | Maintains |
| | Application |
| | Moves data to |
| | Exposed to internet |
| | Can interactive logon to |
| | Can logon over the network to |
| | Can remote interactive logon to |
| | Runs on |
| | Provisions |
| | Identified as owner of |
| | Member of |
| | Is running |
| | Generic / Affecting |
| | Created from / Used to create |

Selecting an edge opens a side panel that provides more details about the connection properties. If two nodes have more than one relationship, a number appears on the edge, in place of an icon. You can find more information about these nodes’ relationships by hovering over the number or opening the side panel.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-edge-details.png" alt-text="Screenshot of the side panel in the hunting graph containing edge details." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-edge-details.png":::

## See also
- [Hunt for threats using the hunting graph](advanced-hunting-graph.md)
- [Investigate incidents in the Microsoft Defender portal](investigate-incidents.md)