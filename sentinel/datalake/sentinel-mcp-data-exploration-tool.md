---
title: Data exploration tool collection in Microsoft Sentinel MCP server
titleSuffix: Microsoft Security  
description: Learn how to search tables, run KQL queries, analyze entities, and explore graphs by using the data exploration tools in the Microsoft Sentinel MCP server.
author: poliveria
ms.topic: how-to
ms.date: 05/21/2026
ms.author: pauloliveria
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.custom: msecd-doc-authoring-1012
ai-usage: ai-assisted

#customer intent: As a security analyst, I want to know the different tools available to explore security data in Microsoft Sentinel data lake so that I can investigate threats and make data-driven decisions.
---

# Explore Microsoft Sentinel data lake with data exploration collection

> [!IMPORTANT]
> Some information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

The data exploration tool collection in the Microsoft Sentinel Model Context Protocol (MCP) server lets you search for relevant tables and retrieve data from Microsoft Sentinel's data lake by using natural language. It also includes graph tools that let you reason over multiple Microsoft Sentinel graphs, including exposure, hunting, and data risk graphs.

## Prerequisites

To access the data exploration tool collection, you need the following prerequisites:
- [Microsoft Sentinel data lake and graph](sentinel-lake-onboarding.md)
- Microsoft Sentinel data lake onboarded to Defender portal (required for graph tools)
- Any of the supported AI-powered code editors and agent-building platforms:
    - [Microsoft Security Copilot](sentinel-mcp-use-tool-security-copilot.md#add-a-microsoft-sentinel-tool-collection)
    - [Microsoft Copilot Studio](sentinel-mcp-use-tool-copilot-studio.md#add-a-microsoft-sentinel-tool-collection)
    - [Microsoft Foundry](sentinel-mcp-use-tool-azure-ai-foundry.md#add-a-microsoft-sentinel-tool-collection)
    - [Visual Studio Code](sentinel-mcp-use-tool-visual-studio-code.md) 

> [!IMPORTANT]
> Access to Sentinel MCP tools is supported for users, managed identities, or service principals that are assigned with ***at least*** any of the following roles:
> - Security Administrator
> - Security Operator
> - Security Reader

To access the graph data in Defender portal, at least [read-only access](/security-exposure-management/prerequisites) in Microsoft Security Exposure Management is required.

## Add the data exploration collection

To add the data exploration collection, first set up Microsoft Sentinel's unified MCP server interface. Follow the step-by-step instructions for compatible [AI-powered code editors and agent-building platforms](sentinel-mcp-get-started.md#add-microsoft-sentinels-collection-of-mcp-tools).

The data exploration collection is hosted at the following URL:
```
https://sentinel.microsoft.com/mcp/data-exploration
```

## Tools in the data exploration collection

The data exploration collection includes the following tools:

- [Semantic search on table catalog](#semantic-search-on-table-catalog-search_tables) — Discover relevant data lake tables and their schemas.
- [Execute KQL query](#execute-kql-kusto-query-language-query-on-microsoft-sentinel-data-lake-query_lake) — Run KQL queries against a Microsoft Sentinel data lake workspace.
- [List workspaces](#list-workspaces-list_sentinel_workspaces) — List all available Microsoft Sentinel data lake workspaces.
- [Entity analyzer](#entity-analyzer) — Analyze users and URLs with AI-driven risk verdicts and insights.
- [Graph tools (preview)](#graph-tools-preview) — Reason over exposure, hunting, and data risk graphs.

### Semantic search on table catalog (`search_tables`)
This tool discovers data lake tables relevant to a given natural language input and returns schema definitions to support query authoring. Use this tool to discover tables, understand a schema, or build valid Kusto Query Language (KQL) queries for a Microsoft Sentinel workspace. You can also use it to explore unfamiliar data sources or identify relevant tables for a specific investigative or analytical task. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `query`| Yes |This parameter takes in keywords to search for relevant tables in the connected workspaces. |
| `workspaceId`| No |This parameter takes in a workspace identifier to limit the search to a single connected Microsoft Sentinel data lake workspace. |

#### Supported tables

This tool supports Azure Monitor Log Analytics. For a full list of tables, see [Azure Monitor Log Analytics log tables organized by category](/azure/azure-monitor/reference/tables-category).

It also supports most of the Microsoft Sentinel tables listed in [Microsoft Sentinel tables and associated connectors](../sentinel-tables-connectors-reference.md). The following tables aren't supported:

|Unsupported Microsoft Sentinel tables| |
|----------|----------|
|<ul><li>`AliCloudActionTrailLogs_CL`<li>`argsentdc_CL`<li>`Audit_CL`<li>`Auth0Logs_CL`<li>`Awareness_Performance_Details_CL`<li>`Awareness_SafeScore_Details_CL`<li>`Awareness_User_Data_CL`<li>`Awareness_Watchlist_Details_CL`<li>`CarbonBlack_Alerts_CL`<li>`Cisco_Umbrella_proxy_CL`<li>`Cloud_Integrated_CL`<li>`CloudGuard_SecurityEvents_CL`<li>`ConfluenceAuditLogs_CL`<li>`CortexXpanseAlerts_CL`<li>`CyberSixgill_Alerts_CL`<li>`DruvaSecurityEvents_CL`<li>`DynatraceAttacks_CL`<li>`DynatraceAuditLogs_CL`<li>`DynatraceProblems_CL`<li>`DynatraceSecurityProblems_CL`<li>`ErmesBrowserSecurityEvents_CL`<li>`FireworkV2_CL`<li>`Garrison_ULTRARemoteLogs_CL`<li>`GCPLoadBalancerLogs_CL`<li>`GitHubAuditLogsV2_CL`<li>`Health_Data_CL`<li>`Illumio_Flow_Events_CL`<li>`IllumioInsightsSummary_CL`<li>`iocsent_CL`<li>`Island_Admin_CL`<li>`Island_User_CL`<li>`JBossEvent_CL`<li>`LookoutMtdV2_CL`</ul> |<ul><li>`ObsidianActivity_CL`<li>`ObsidianThreat_CL`<li>`Onapsis_Defend_CL`<li>`OneTrustMetadataV3_CL`<li>`OracleWebLogicServer_CL`<li>`PaloAltoCortexXDR_Alerts_CL`<li>`PaloAltoCortexXDR_Audit_Agent_CL`<li>`PaloAltoCortexXDR_Audit_Management_CL`<li>`PaloAltoCortexXDR_Endpoints_CL`<li>`Phosphorus_CL`<li>`PingOne_AuditActivitiesV2_CL`<li>`PrismaCloudCompute_CL`<li>`ProofpointPODMailLog_CL`<li>`ProofpointPODMessage_CL`<li>`ProofPointTAPClicksBlockedV2_CL`<li>`ProofPointTAPMessagesBlockedV2_CL`<li>`RSAIDPlus_AdminLogs_CL`<li>`SAPLogServ_CL`<li>`Seg_Cg_CL`<li>`Seg_Dlp_CL`<li>`SeraphicWebSecurity_CL`<li>`SlackAuditV2_CL`<li>`Tenable_WAS_Asset_CL`<li>`TransmitSecurityActivity_CL`<li>`Ttp_Attachment_CL`<li>`Ttp_Impersonation_CL`<li>`Ttp_Url_CL`<li>`Ubiquiti_CL`<li>`ValenceAlert_CL`<li>`vcenter_CL`<li>`ZimperiumThreatLog_CL`<li>`ZNSegmentAuditNativePoller_CL`</ul>|

### Execute KQL(Kusto Query Language) query on Microsoft Sentinel data lake (`query_lake`)
This tool runs a single KQL query against a specified Microsoft Sentinel data lake workspace and returns the raw result set. It's designed for focused investigative or analytical retrieval and not bulk export. Use this tool to advance an investigation or analytical workflow and retrieve a security event, alert, asset, identity, device, or enrichment data. You can also use it alongside the `search_tables` tool to identify relevant table schemas and build valid KQL queries.

| Parameters | Required? | Description | 
|----------|----------|----------|
| `query`| Yes |This parameter takes in a well-formed KQL query to retrieve data from a Microsoft Sentinel data lake workspace. |
| `workspaceId`| No |This parameter takes in a workspace identifier to limit the search to a single connected Microsoft Sentinel data lake workspace. |

 
### List workspaces (`list_sentinel_workspaces`)
This tool lists all Microsoft Sentinel data lake workspace name and ID pairs available to you. Including the workspace name provides you with helpful context to understand which workspace is being used. Run this tool before using any other Microsoft Sentinel tools because those tools need a workspace ID argument to function properly.


### Entity analyzer

These tools use AI to analyze your organization's data in the Microsoft Sentinel data lake. They provide a verdict and detailed insights on URLs, domains, and user entities. They help eliminate the need for manual data collection and complex integrations typically required for enriching and investigating entities.

For example, `analyze_user_entity` reasons over the user's authentication patterns, behavioral anomalies, activity within your organization, and more to provide a verdict and analysis. The `analyze_url_entity` tool reasons over Microsoft threat intelligence, your custom threat intelligence in Microsoft Sentinel threat intelligence platform (TIP), and URL activity within your organization. It also checks Microsoft Sentinel watchlists to provide a verdict and analysis.

Entity analysis tools might require a few minutes to generate results, so there are tools to start analysis for each entity and another one that polls for the analysis results.

> [!IMPORTANT]
> To use the entity analyzer tool, you also need the following roles:
> - **Security Copilot Contributor** – This role is required to use the tool, which consumes Security Compute Units (SCUs) to deliver reasoned entity risk analysis.
> - **Security Copilot Owner** (optional) – This role is only required to view and monitor SCU usage.
> 
> For more information, see [Understand authentication in Microsoft Security Copilot](/copilot/security/authentication).  


#### Start analysis (`analyze_user_entity` and `analyze_url_entity`)

| Parameters | Required? | Description | 
|----------|----------|----------|
| Microsoft Entra object ID, User Principal Name (UPN), or URL| Yes |This parameter takes in the user or URL you want to analyze. |
| `startTime`| Yes |This parameter takes in the start time of the analysis window.  |
| `endTime`| Yes |This parameter takes in the end time of the analysis window.  |
| `workspaceId`| No |This parameter takes in a workspace identifier to limit the search to a single connected Microsoft Sentinel data lake workspace. |

These tools return an identifier value that you can provide to the retrieve analysis tool as input.

#### Retrieve analysis (`get_entity_analysis`)

| Parameters | Required? | Description | 
|----------|----------|----------|
| `analysisId`| Yes |This parameter takes in the job identifier received from the start analysis tools. |

While this tool automatically polls for a few minutes until results are ready, its internal timeout might not be sufficient for long analysis operations. You might need to run it multiple times to get results.

> [!NOTE]
> It might be beneficial to include a prompt such as `render the results as returned exactly from the tool`, which helps ensure that the response from the analyzer is provided without additional processing by the MCP client.

#### Additional information
- `analyze_user_entity` supports a maximum time window of seven days to maximize accuracy of the results. 
- `analyze_user_entity` only works for users with a Microsoft Entra object ID (users). On-premises Active Directory-only users aren't supported for user analysis.
- `analyze_user_entity` requires the following tables to be present in the data lake to ensure accuracy of the analysis:
    - [AlertEvidence](../connect-microsoft-365-defender.md)
    - [SigninLogs](../connect-azure-active-directory.md)
    - [CloudAppEvents](../connect-microsoft-365-defender.md)
    - [IdentityInfo](/defender-xdr/advanced-hunting-identityinfo-table) (Available only for tenants with Microsoft Defender for Identity, Microsoft Defender for Cloud Apps, or Microsoft Defender for Endpoint P2 licensing)

    If you don't have any of these required tables, `analyze_user_entity` generates an error message that lists the tables you didn't onboard, along with links to their corresponding onboarding documentation.

- `analyze_user_entity` works best when the following tables are also present in the data lake, but continues to work and assess risk, even if these tables are unavailable:
    - [AADNonInteractiveUserSignInLogs](../connect-azure-active-directory.md)
    - [BehaviorAnalytics](../enable-entity-behavior-analytics.md)
    
- `analyze_url_entity` works best when the following tables are present in the data lake, but continues to work and assess risk, even if these tables are unavailable:
    - [EmailUrlInfo](../connect-microsoft-365-defender.md)
    - [UrlClickEvents](../connect-microsoft-365-defender.md)
    - [ThreatIntelIndicators](../work-with-threat-indicators.md)
    - [Watchlist](../watchlists-create.md)
    - [DeviceNetworkEvents](../connect-microsoft-365-defender.md)

    If you don't have any of these tables, `analyze_url_entity` generates a response with a disclaimer that lists the tables you didn't onboard, along with links to their corresponding onboarding documentation.

- Running multiple instances of the entity analyzer at the same time can increase latency for each run. To prevent timeouts and avoid hitting the entity analyzer's [preview thresholds](sentinel-mcp-billing.md#microsoft-sentinel-entity-analyzer-tool-1), start by running a maximum of five analyses at once and then adjust it as needed based on how often the logic app is triggered in your organization. 

### Graph tools (preview)

> [!IMPORTANT]
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

The graph tools let you reason over multiple Microsoft Sentinel graphs, including exposure, hunting, and data risk graphs. By using these tools, you can gather insights and make data-driven decisions while querying in natural language.

#### Blast radius finder (`graph_find_blastradius`) 

This tool evaluates the blast radius of a node by exploring propagation paths towards an organization's critical assets. It details the paths that start at the entity you provide, evaluates the risk, and specifies recommendations to reduce it.

| Parameters | Required? | Description | 
|----------|----------|----------|
| `sourceName`| Yes |This parameter takes in keywords to search for relevant information matching an entity in the graph. It can be a node or a group of nodes. |

#### Connection and path discovery (`graph_find_walkable_paths`) 
This tool enumerates the connections between any given pairs of sources and targets. It analyzes the nature of the connections and then decides whether it can be traversed for lateral movement. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `sourceName`  | Yes |This parameter takes in keywords to match an entity within the graph for the path starting point.|
|`targetName`  |Yes |This parameter takes in keywords to match an entity within the graph for the path target. |

#### Exposure perimeter analyzer (`graph_exposure_perimeter`) 
This tool lists the incoming connections from other entities to the specified entity. It helps you determine the risk that the entity faces. The tool might return prioritized recommendations based on the results. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `targetName` | Yes |This parameter takes in keywords to identify and match an entity in the graph; the node's name. |
| `minPathLength` | No |This parameter takes in the minimum number of hops in a path. |
| `maxPathLength` | No |This parameter takes in the maximum number of hops in a path. |
| `resultsCountLimit` | No |This parameter takes in the maximum number of paths to return. |

#### Path between two entities (`graph_find_connected_nodes`) 

This tool lists traversable paths between two entities that match a criteria or characteristic that describes those entities. 

| Parameters | Required? | Description | 
|----------|----------|----------|
| `sourceNodeLabel` | Yes |This parameter takes in a valid source label to filter on. For supported labels, use the `graph_get_context` tool. |
| `sourceNodeProperties` | No |This parameter takes in a list of valid properties for the starting point entity, separated by commas. For supported properties, use the `graph_get_context` tool. |
| `targetNodeLabel` | Yes |This parameter takes in a valid target label to filter on. For supported labels, use the `graph_get_context` tool. |
| `targetNodeProperties` | No |This parameter takes in a list of valid properties for the ending point entity, separated by commas. For supported properties, use the `graph_get_context` tool. |
| `resultsCountLimit` | No |This parameter takes in the maximum number of results to return. |

#### Nodes match (`graph_find_nodes`)

This tool finds and matches entities that the graph represents as nodes based on given criteria or characteristics. It returns a list of nodes that match the defined criteria.

| Parameters | Required? | Description | 
|----------|----------|----------|
| `validNodeLabel` | Yes |This parameter takes in a node label to match. For supported labels, use the `graph_get_context` tool. |
| `validNodeProperties` | No |This parameter takes in a list of properties to match, separated by commas. For supported properties, use the `graph_get_context` tool. |
| `resultsLimit` | No |This parameter takes in the maximum number of results to return. |

#### General information and context for graph (`graph_get_context`)

This tool provides context for the parameters and serves as a reference to help you understand which tools, functionalities, or parameters you can use. Use it as a helper to get the graph context so you can better use the other graph MCP tools in the collection. 

#### Additional information for graph tools

- To scope results to graph only, add `in my graph` to prompts. 
- Querying for identities doesn't support user principal names (UPNs).  
- When you specify the type of the entity, use it before the name. 
- Installing and configuring the graph tool collection carries no cost. However, you invoke the graph meter when you start using the tools to query a Microsoft Sentinel graph. For more information, see:  [Plan costs and understand Microsoft Sentinel pricing and billing](../billing.md#graph-charges).

## Sample prompts

The following sample prompts demonstrate what you can do with the data exploration collection:
- Find the top three users that are at risk and explain why they're at risk.
- Find sign-in failures in the last 24 hours and give me a brief summary of key findings.
- Identify devices that showed an outstanding number of outgoing network connections.
- Help me understand if the user <user object ID\> is compromised.
- Investigate users with a password spray alert in the last seven days and tell me if any of them are compromised.
- Find all the URL IOCs from <threat analytics report\> and analyze them to tell me everything Microsoft knows about them.
- What is the blast radius of node _X_ if compromised?
- List all paths from user _X_ to critical assets.
- What is the exposure perimeter of my critical SQL servers?


## How Microsoft Sentinel MCP tools work alongside your agent

The following example shows how an agent answers a prompt by dynamically orchestrating over the tools.

**Sample prompt:** `Find the top three users that are at risk and explain why they're at risk.` 

**Typical response (GitHub Copilot using Claude Sonnet 4):**

:::image type="content" source="media/sentinel-mcp/mcp-tool-github-response.png" alt-text="Screenshot of a GitHub Copilot response." lightbox="media/sentinel-mcp/mcp-tool-github-response.png"::: 

**Explanation:**
- When the agent receives the prompt, it searches for relevant tables that contain user risk and security information. It starts by deconstructing the prompt into search keywords to find the tables.

    From the sample prompt, its search identifies four relevant tables from the scope of tables that the user has access to:
     - `AADNonInteractiveUserSignInLogs` - Non-interactive Microsoft Entra ID sign-in events
     - `BehaviorAnalytics` - User and Entity Behavior Analytics (UEBA) data
     - `SigninLogs` - Interactive Microsoft Entra ID sign-in events
     - `AADUserRiskEvents` - Identity protection risk detections
 
     :::image type="content" source="media/sentinel-mcp/mcp-tool-search-table.png" alt-text="Screenshot of the agent searching for relevant tables that contain user risk and security information." lightbox="media/sentinel-mcp/mcp-tool-search-table.png"::: 

- The agent does another search by using the **Semantic search on table catalog** (`search_tables`) tool, this time with broader terms, to find other tables that it should query data from to influence its reasoning.

    :::image type="content" source="media/sentinel-mcp/mcp-tool-semantic-search.png" alt-text="Screenshot of the agent searching using broader terms." lightbox="media/sentinel-mcp/mcp-tool-semantic-search.png"::: 
 
- The agent identifies the relevant tables and then uses the **Execute KQL (Kusto Query Language) query on Microsoft Sentinel data lake** (`query_lake`) tool to query for data and find the top three users at risk. The first attempt fails because the KQL query has a semantic error.

     :::image type="content" source="media/sentinel-mcp/mcp-tool-run-kql.png" alt-text="Screenshot of the agent attempting to run a KQL query with a semantic error." lightbox="media/sentinel-mcp/mcp-tool-run-kql.png":::

- The agent corrects the KQL query by itself and successfully retrieves data from Microsoft Sentinel data lake, finding the risky users.

     :::image type="content" source="media/sentinel-mcp/mcp-tool-run-correct-kql.png" alt-text="Screenshot of the agent running a corrected KQL query successfully." lightbox="media/sentinel-mcp/mcp-tool-run-correct-kql.png"::: 

- The agent runs one more query to get detailed information about the risky users to provide better context on why they're at risk.

    :::image type="content" source="media/sentinel-mcp/mcp-tool-risky-users.png" alt-text="Screenshot of the agent running another query to get detailed user information." lightbox="media/sentinel-mcp/mcp-tool-risky-users.png"::: 

- The agent responds back to the user with its comprehensive analysis.



## Related content
- [What is Microsoft Sentinel's support for Model Context Protocol (MCP)?](sentinel-mcp-overview.md) 
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
