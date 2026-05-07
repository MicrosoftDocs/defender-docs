---
title: Get started with unified SQL Vulnerability Assessment REST API
description: Learn how to manage SQL vulnerability assessments across Azure SQL Database, SQL Managed Instance, Synapse Workspaces, and SQL on machines using the unified REST API.
ms.topic: quickstart
ms.custom: devx-track-azurepowershell
author: Elazark
ms.author: elkrieger
ms.date: 05/07/2026
ms.service: defender-for-cloud
---

# Get started with unified SQL Vulnerability Assessment REST API

The new unified SQL Vulnerability Assessment REST API provides a consistent management surface for SQL vulnerability assessments across:

- Azure SQL Database
- Azure SQL Managed Instance
- Azure Synapse Analytics Workspaces
- SQL on machines (Azure VM and Arc-enabled SQL)

This quickstart helps you get started with the unified API to manage vulnerability assessments programmatically.

## Prerequisites

- Azure subscription
- Azure PowerShell module installed (`Az.Accounts` and `Az.Sql`)
- Appropriate permissions to manage SQL vulnerability assessment settings
- SQL Vulnerability Assessment Express Configuration enabled on your SQL resources

## API Endpoints

The unified SQL Vulnerability Assessment API provides the following endpoints:

- [Sql Vulnerability Assessment Settings](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-settings)
- [Sql Vulnerability Assessment Baseline Rules](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-baseline-rules)
- [Sql Vulnerability Assessment Scan Results](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scan-results)
- [Sql Vulnerability Assessment Scans](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scans)

## Common Tasks

### Get vulnerability assessment settings

```powershell
# Connect to Azure
Connect-AzAccount -Subscription "YourSubscriptionId"

# Get VA settings for a SQL resource
$resourceId = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Sql/servers/{serverName}/sqlVulnerabilityAssessments/default"

$settings = Invoke-AzRestMethod -Path $resourceId -Method GET
$settings.Content | ConvertFrom-Json | Format-List
```

### Run a manual scan

```powershell
# Initiate a manual vulnerability assessment scan
$scanUri = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Sql/servers/{serverName}/databases/{databaseName}/sqlVulnerabilityAssessments/default/initiateScan"

$scan = Invoke-AzRestMethod -Path $scanUri -Method POST
$scan.Content | ConvertFrom-Json | Format-List
```

### Get scan results

```powershell
# Retrieve the latest scan results
$resultsUri = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Sql/servers/{serverName}/databases/{databaseName}/sqlVulnerabilityAssessments/default/scans/latest"

$results = Invoke-AzRestMethod -Path $resultsUri -Method GET
$results.Content | ConvertFrom-Json | Format-List
```

## Managed Instance and Synapse Support

The unified API now supports SQL Managed Instance and Synapse Analytics with the same management capabilities as Azure SQL Database.

### SQL Managed Instance considerations

- Requires SQL Managed Instance with Express Configuration enabled
- Supports scanning system and user databases
- Requires appropriate SQL Security Manager role permissions

### Azure Synapse Analytics considerations

- Supports dedicated SQL pools
- Supports scanning system and user databases
- Requires appropriate Synapse administrator permissions

## Examples

For complete examples and scripts, see:

- [Enable vulnerability assessments on Azure SQL databases with the express configuration](powershell-sample-vulnerability-assessment-azure-sql.md)
- [Set up baselines for vulnerability assessments on Azure SQL databases](powershell-sample-vulnerability-assessment-baselines.md)
- [Express configuration PowerShell commands reference](express-configuration-powershell-commands.md)

## Related content

- [SQL vulnerability assessment overview](sql-azure-vulnerability-assessment-overview.md)
- [Enable vulnerability assessment](sql-azure-vulnerability-assessment-enable.md)
- [Configure vulnerability findings](configure-vulnerability-findings-express.md)
- [Troubleshoot SQL vulnerability assessment](troubleshoot-vulnerability-findings.md)

