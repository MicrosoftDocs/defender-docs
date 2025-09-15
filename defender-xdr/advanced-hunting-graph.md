---
title: Hunting graph in advanced hunting
description: Learn about the hunting graph in Microsoft Defender and how to use it to rendering threat scenarios as interactive graphs
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
# Hunt for threats using the hunting graph

The **hunting graph** provides visualization capabilities in [advanced hunting](advanced-hunting-overview.md) by rendering threat scenarios as interactive graphs. This feature allows security operations center (SOC) analysts, threat hunters, and security researchers conduct threat hunting and incident response easily and more intuitively, improving their efficiency and ability to assess possible security issues. 

Analysts often rely on [Kusto Query Language](/azure/kusto/query/) (KQL) queries to uncover relationships between entities—an approach that could be both time-consuming and prone to oversights. Hunting graph makes exploration of security data simpler and faster by visualizing these relationships, letting you trace paths and possible choke points, as well as surface insights and take various actions based on the results that tabular queries might miss. 

## Get access

To use hunting graph, advanced hunting, or other [Microsoft Defender XDR](microsoft-365-defender.md) capabilities, you need an appropriate role in Microsoft Entra ID. [Read about required roles and permissions for advanced hunting](custom-roles.md).

You must also have the following access or permissions:

- [Microsoft Sentinel data lake](/azure/sentinel/datalake/sentinel-lake-overview)
- At least [read-only](/security-exposure-management/prerequisites) access in Microsoft Security Exposure Management

## Where to find hunting graph

You can find the **hunting graph** page by going to the left navigation bar in the Microsoft Defender portal and selecting **Investigation & response** > **Hunting** > **Hunting graph**. 

The hunting graph page also appears in the **advanced hunting** page by selecting the hunting graph icon ![Screenshot of the hunting graph icon.](/defender-xdr/media/ah-hunting-graph/hunting-graph-icon.png) at the top of the page or selecting the **Create new** icon ![Screenshot of the Create new icon.](/defender-xdr/media/ah-hunting-graph/hunting-graph-create-icon.png) and choosing **Hunting graph**.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-new.png" alt-text="Screenshot of the Create new Hunting graph option in the advanced hunting page." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-new.png":::

A new hunting graph page appears as tab labeled **New hunt** in the advanced hunting page.

## Hunting graph features

The interactive graphs generated in the hunting graph are composed of [**nodes**](#nodes) and [**edges**](#edges). The lower right-hand corner of the graph also has control buttons that let you **Zoom in** and **Zoom out**, and view the graph's **Layers**.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-render.png" alt-text="Screenshot of a rendered graph in the hunting graph page." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-render.png":::

### Nodes

A **node** pertains to an entity in your environment (for example, a device, user account, or IP address, among others). The hunting graph depicts nodes as any of the following circular icons:

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

Selecting a node opens a side panel that provides more details about the chosen entity, including entity name, type, last updated date, and discovery source. This panel might also display additional information such as attack paths and blast radius, depending on the selected node and its relationship to other nodes in the graph.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-node-details.png" alt-text="Screenshot of the side panel in the hunting graph containing node details." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-node-details.png":::

A node might also have any of the following indicators around it:

- **Critical asset** [icon]  - Indicates that an entity is classified as business-critical or valuable, as identified in the [critical asset management](/security-exposure-management/critical-asset-management) in Microsoft Security Exposure Management. The nodes representing critical assets also have a golden halo surrounding them. If the entity has more than one critical asset, the number of assets appears next to the indicator.
- **Vulnerability** [icon] - Indicates that at least one vulnerability was detected on the entity.
- **Explore connected assets** [icon] - Indicates that the node can expand the hunting graph further beyond the initial results. Expanding the graph lets you explore other relationships the selected entity has with the other ones.
- **Discovery source** - Indicates the entity's data source. This indicator appears as the icon of the Defender product protecting the entity in blue (for example, [icon]).

    >[!TIP]
    >You can turn off this indicator by selecting **Layers** at lower right-hand corner of the hunting graph and toggling the **Discovery Source** switch.   

### Edges

An **edge** indicates the relationship or connection properties between two nodes. The hunting graph depicts an edge as lines with the following icons: 

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

Selecting an edge opens a side panel that provides more details about the connection properties. If two nodes have more than one relationship, a number appears on the edge, in place of an icon. You can find more information about these nodes' relationships by hovering over the number or opening the side panel.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-edge-details.png" alt-text="Screenshot of the side panel in the hunting graph containing edge details." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-edge-details.png":::

## Get started with hunting graph

### Use predefined scenarios in the hunting graph

The hunting graph lets you search with predefined scenarios, which are prebuilt advanced hunting queries that could help you answer specific and common questions for specific use cases.

To start hunting using a predefined scenario, on a new hunting graph page, select **Search with Predefined scenarios**. A side panel appears where you can then perform the following steps: 

1. [Select a scenario and enter the required inputs](#step-1-select-a-scenario-and-enter-scenario-inputs)
1. [Apply filters on the graph](#step-2-apply-filters)
1. [Render the graph](#step-3-render-the-graph)

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-predefined-scenarios.png" alt-text="Screenshot of the hunting graph page highlighting the Search with Predefined scenarios button." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-predefined-scenarios.png":::

#### Step 1: Select a scenario and enter scenario inputs

The following table describes the predefined scenarios in the hunting graph and their respective required scenario inputs, if applicable. For scenarios that require inputs, you can type or search and select for them in the search boxes provided.

| **Scenario** | **Description** | **Inputs** |
|---|---|---|
| **Paths between two entities** | Provide two entities (nodes) to view the paths between them. |<ul><li>Start Entity<li>End Entity</ul>**Note:** Make sure to identify and input the correct start and end entities, as the generated graph will be directional. |
| **Entities that have access to a key vault** | Provide a specific key vault to view paths from various entities (devices, virtual machines, containers, servers, and others) that have direct or indirect access to it. | Target key vault |
| **Users with access to sensitive data** | Provide any sensitive data storage of interest to view users that have access to it. | Target storage account |
| **Critical users with access to storage accounts containing sensitive data** | This scenario identifies critical users with access to storage resources containing sensitive data. | (None) |
| **Data exfiltration by a device** | Provide a device ID to view paths to storage accounts it has access to; for instance, to check what storage accounts a certain device can access in a bring your own device (BYOD) environment. | Source device |
| **Paths to a highly critical Kubernetes cluster** | Provide a Kubernetes cluster with high criticality to view users, virtual machines, and containers that have access to it. | Target Kubernetes cluster |
| **Identities with access to Azure DevOps repositories** | Provide an Azure DevOps (ADO) repository name to view users that have read and/or write access to said repository. | Target ADO repository |
| **Identify nodes in the highest number of paths to SQL data stores** | This scenario identifies the nodes that appear in the highest number of paths leading to SQL data stores. The scenario discovers paths in the graph where users have roles or permissions to access the SQL data stores. | (None) |

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-select-scenario.png" alt-text="Screenshot of the predefined scenarios side panel highlighting the available options." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-select-scenario.png":::

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-input.png" alt-text="Screenshot of the predefined scenarios side panel highlighting the required scenario inputs." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-input.png":::

#### Step 2: Apply filters

You can add relevant filters to make the map view of your selected scenario more precise. For example, if you want to **Show only the shortest paths**, tick this option.

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-filter.png" alt-text="Screenshot of the predefined scenarios side panel highlighting the Show only the shortest paths filter." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-filter.png":::

##### Advanced filters

By default, the predefined scenarios automatically apply certain filters, which you can view in the **Advanced Filters** section of the side panel. You can remove these filters or add new ones to further refine the graph you want to generate. 

To remove filters, select the **Remove filter** icon ![Screenshot of the remove filter icon.](/defender-xdr/media/ah-hunting-graph/hunting-graph-remove-filter-icon.png) beside each filter or select **Clear all** to remove them all at once.

To add a filter, select **Add filter** then the select any of the supported node or edge filters. The following table lists these supported operators and filters. Depending on your chosen scenario, some of these filters not might not be available as options.  

| **Filter type** | **Operator** | **Filters** |
|---|---|---|
| **Source Node** | equals |<ul><li>Is critical<li>Is vulnerable<li>Is exposed to the internet</ul> |
| **Target Node** | equals |<ul><li>Has sensitive data<li>Has risk score<li>Is vulnerable</ul> |
| **Edge Type** | equals |<ul><li>has permissions to<li>routes traffic to<li>affecting<li>member of<li>defines<li>can impersonate as<li>contains<li>can authenticate as<li>runs on<li>has role on<li>is running<li>used to create<li>maintains<li>frequently logged in by<li>has credentials of<li>defined in<li>can authenticate to<li>pushes<li>provisions</ul>|

:::image type="content" source="/defender-xdr/media/ah-hunting-graph/hunting-graph-advanced-filters.png" alt-text="Screenshot of the predefined scenarios side panel highlighting the advanced filter section." lightbox="/defender-xdr/media/ah-hunting-graph/hunting-graph-advanced-filters.png":::

#### Step 3: Render the graph

After selecting a scenario and applying the necessary filters, select **Run** to render the graph. Once the graph is rendered, you can then explore it further by selecting nodes and edges to view more information about entities and relationships, or expand or focus on certain entities.

## See also
- [Proactively hunt for threats with advanced hunting in Microsoft Defender](advanced-hunting-overview.md)
- [Choose between guided and advanced modes to hunt in Microsoft Defender XDR](advanced-hunting-modes.md)