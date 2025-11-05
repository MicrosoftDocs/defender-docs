---
title: Defender tool collection in Microsoft Sentinel MCP server
titleSuffix: Microsoft Security  
description: Learn about the different tools available in the Defender collection
author: poliveria
ms.topic: how-to
ms.date: 11/18/2025
ms.author: pauloliveria
ms.service: microsoft-sentinel

#customer intent: As a security analyst, I want to know the different tools available to triage incidents and hunt for threats using Microsoft Defender
---

# Triage incidents and hunt for threats with Microsoft Defender collection (preview)

> [!IMPORTANT]
> Microsoft Sentinel MCP server is currently in preview.
> This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

The Microsoft Defender collection in the Microsoft Sentinel Model Context Protocol (MCP) server integrates your AI models with Defender APIs that support incident triage and hunting. This integration lets you prioritize incidents rapidly and hunt over your own data easily, reducing mean time to resolution, risk exposure, and dwell time.

Use the tool for the following scenarios:
- **Incident triage:** Prioritize incidents rapidly by using your own AI models, reducing mean time to resolution. Use the tools to fetch incidents, alerts, alerts evidence, entities, and other data.
- **Hunting:** Hunt over your data easily by using your own AI models, reducing risk exposure and dwell time. Use the tools to run hunting queries and fetch the required data during your hunt.


## Prerequisites

To access the data exploration tool collection, you must have the following prerequisites:
- Microsoft Defender XDR, Microsoft Sentinel, or Microsoft Defender for Endpoint onboarded from the Defender portal
- Visual Studio Code (latest version)
- [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) Visual Studio Code extension

## Add the data exploration collection

To add the Defender collection, you must first set up add Microsoft Sentinel's unified MCP server interface. Follow the step-by-step instructions for the following [AI-powered code editors and agent-building platforms](sentinel-mcp-get-started.md#add-microsoft-sentinels-collection-of-mcp-tools):
- Visual Studio Code
- Microsoft Security Copilot

The Defender collection is hosted at the following URL:
- `https://sentinel.microsoft.com/mcp/defender`

## Tools in the Microsoft Defender collection

### ListIncidents

This tool lists security incidents and filters them by date range, severity, status, assigned analyst, and investigation state. It can paginate up to 10,000 incidents per call.

| Parameters | Required? | Description |
|---|---|---|
| createdAfter | | |
| createdBefore | | |
| Severity | | |
| Status | | |
| AssignedTo | | |
| Classification | | |
| Determination | | |
| orderBy | | |
| Search | | |

### GetIncidentById

This tool retrieves a security incident by ID, including its properties, correlated alerts, and metadata such as status, severity, classification, and timestamps.

| Parameters | Required? | Description |
|---|---|---|
| incidentId | | |
| includeAlertsData | | |

### ListAlerts

This tool lists security alerts, sorts them, and filters them by date range, severity, and status. It can paginate up to 10,000 alerts per call.

| Parameters | Required? | Description |
|---|---|---|
| createdAfter | No | |
| createdBefore | No | |
| Severity | No | |

### GetAlertByID

This tool retrieves a security alert by ID. It returns the complete alert details, including severity, status, classification, and related evidence entities.

| Parameters | Required? | Description |
|---|---|---|
| AlertID | Yes | Unique identifier of the alert |

### FetchAdvancedHuntingTablesOverview 
This tool lists the names of available advanced hunting tables and their brief descriptions. It's essential for understanding data sources before writing Kusto Query Language (KQL) queries.

| Parameters | Required? | Description |
|---|---|---|
| tableNames | | |

### FetchAdvancedHuntingTablesDetailedSchema 

This tool retrieves complete column schemas with descriptions for specified advanced hunting tables. The information it provides is crucial for constructing error-free KQL queries. Use this tool before calling `RunAdvancedHuntingQuery`.

| Parameters | Required? | Description |
|---|---|---|
| tableNames | | |

### FetchSentinelTablesOverview 

This tool returns a list of available Microsoft Sentinel log analytics tables. Its response doesn't include descriptions. To better understand the tables, consider calling a follow-up tool.

| Parameters | Required? | Description |
|---|---|---|
| tableNames | | |

### FetchSentinelTablesDetailedSchema 

Returns a detailed schema, including columns and their descriptions, for specified Sentinel tables. Use this tool to avoid syntax errors in KQL when calling `RunAdvancedHuntingQuery`. 

| Parameters | Required? | Description |
|---|---|---|
| tableNames | No | |

### RunAdvancedHuntingQuery

Run an advanced hunting query by using KQL across supported Microsoft Defender tables to proactively search for threats. To understand data sources, first run `FetchAdvancedHuntingTablesOverview`. For error-free KQL, first run `FetchAdvancedHuntingTablesDetailedSchema`.

| Parameters | Required? | Description |
|---|---|---|
| kqlQuery | | |

### GetDefenderFileInfo 

Get file details such as hashes, size, type, publisher, signer certificate info, and global prevalence with first and last seen timestamps.

| Parameters | Required? | Description |
|---|---|---|
| fileHash | | |

### GetDefenderFileStatistics  

Get organizational file prevalence statistics, including the number of devices where the file was observed.

| Parameters | Required? | Description |
|---|---|---|
| fileHash | | |

### GetDefenderFileAlerts  

List all security alerts generated by a specific file across your organization, including historical and active alerts.

| Parameters | Required? | Description |
|---|---|---|
| fileHash | | |

### GetDefenderFileRelatedMachines   

List all devices that encountered a specific file to assess its spread across your environment.

| Parameters | Required? | Description |
|---|---|---|
| fileHash | | |

### ListDefenderIndicators   

List tenant indicators of compromise (IOCs) in Microsoft Defender for Endpoint. Use filters for type (file hash, domain, IP), value, action (Alert, Block, Allow), and severity.

| Parameters | Required? | Description |
|---|---|---|
| indicatorType | | |
| indicatorValue | | |
| Action | | |
| ApplicationName | | |
| Title | | |
| Severity | | |
| createdAfter | | |
| createdBefore | | |

### ListDefenderInvestigations   

List automated investigation cases in Defender for Endpoint. Use filters for state, target device, start time, or triggering alert ID.

| Parameters | Required? | Description |
|---|---|---|
| | | |

### GetDefenderInvestigation   

Get details of a specific automated investigation, including state, timestamps, target device, and triggering alert.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

### GetDefenderIpAlerts   

List all security alerts in the organization that are related to a specified IP address. 

| Parameters | Required? | Description |
|---|---|---|
| idAddress | | |

### GetDefenderIpStatistics   

Get statistics for a given IP address, including the number of distinct devices that communicated with it.

| Parameters | Required? | Description |
|---|---|---|
| ipAddress | | |

### GetDefenderIpMachines   

List all devices that communicate with a specific IP address for network mapping and lateral movement analysis.

| Parameters | Required? | Description |
|---|---|---|
| idAddress | | |

### GetDefenderMachine   

Get detailed information about a specific Defender for Endpoint device, including OS details, health status, risk score, and exposure level. 

| Parameters | Required? | Description |
|---|---|---|
| | | |

### GetDefenderMachineAlerts   

List all security alerts associated with a specific device for a device-centric view of threats.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

### GetDefenderMachineLoggedOnUsers   

List accounts that signed in to a device. For each user, the API provides context such as the account username and domain.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

### GetDefenderMachineVulnerabilities   

List discovered security vulnerabilities on a device with Common Vulnerabilities and Exposures (CVE) details and risk assessment scores.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

### FindDefenderMachineByIp   

Find a device by internal IP address at a specific point in time (within a 15-minute range, up to 30 days of history).

| Parameters | Required? | Description |
|---|---|---|
| ipAddress | | |

### ListDefenderRemediationActivities   

List remediation tasks and their execution status across devices. Each remediation activity corresponds to a security recommendation or task.

| Parameters | Required? | Description |
|---|---|---|
| Type | | |
| machineId | | |
| Status | | |
| createdTimeFrom | | |
| createdTimeTo | | |

### GetDefenderRemediationActivity   

Get detailed remediation task information including execution status, results, and affected devices.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

### ListUserRelatedAlerts 

List all security alerts associated with a specific user account. This information is essential for user-centric threat investigations and behavior analysis.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

### ListUserRelatedMachines 

List all devices where a specific user has active or recent sign-in sessions. Use this tool to track user activity and analyze lateral movement.

| Parameters | Required? | Description |
|---|---|---|
| | | |

### ListDefenderMachinesByVulnerability 

List all devices affected by a specific CVE vulnerability. This tool is critical for patch management prioritization.

| Parameters | Required? | Description |
|---|---|---|
| cveId | | |

### ListDefenderVulnerabilitiesBySoftware 

List vulnerabilities affecting specific software on a specific device for targeted vulnerability assessment.

| Parameters | Required? | Description |
|---|---|---|
| machineId | | |
| softwareId | | |

### ListIdentitySensors

List all Microsoft Defender for Identity sensors in the tenant, including health status, version, last-seen timestamp, and open-issue count.

| Parameters | Required? | Description |
|---|---|---|
| | | |

### ListIdentitySensorHealthIssues
List of Defender for Identity sensor health issues, such as disconnected sensors, start-failure, and misconfiguration, with severity, status, and troubleshooting links.

| Parameters | Required? | Description |
|---|---|---|
| Status | | |
| healthIssueType | | |
| Severity | | |
| domainNameEndsWith | | |
| sensorDnsEndsWith | | |
| createdAfter | | |
| createdBefore | | |

### GetIdentitySensor 
Get metadata and health status for a specific Defender for Identity sensor by its ID.

| Parameters | Required? | Description |
|---|---|---|
| id | | |

## Sample prompts

The following sample prompts demonstrate what you can do with the Defender collection:

- List the last five incidents from my tenant and assess which one is the most urgent to triage
- Provide the alerts for <specific incident\> and analyze the alert evidence for maliciousness 
- Run a hunting query to check which users interacted with <entity\> 

## Limitations

- You can't use this collection as a guest in another tenant. You can only use the MCP server on your own home tenant.


## Related content
- [What is Microsoft Sentinel's support for Model Context Protocol (MCP)?](sentinel-mcp-overview.md) 
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)