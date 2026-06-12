---
title: Express configuration PowerShell commands reference
description: In this article, you can review the Express configuration PowerShell commands reference and copy example scripts to use in your environments.
ms.topic: sample
ms.date: 05/07/2026
---

# Express configuration PowerShell commands reference

> [!IMPORTANT]
> The commands below target this SQL vulnerability assessment unified API and accept a single Azure `-ResourceId` for all five supported resource types:
>
> - `Microsoft.Sql/servers`
> - `Microsoft.Sql/managedInstances`
> - `Microsoft.Synapse/workspaces`
> - `Microsoft.Compute/virtualMachines` (with the `sqlServers/{instance}/databases/{db}` child path)
> - `Microsoft.HybridCompute/machines` (with the `sqlServers/{instance}/databases/{db}` child path)
>
> Settings (`Get` / `Set` / `Remove`), scan initiation/polling (`Invoke-…Scan`, `Get-…ScanOperationResult`), and scan-record reads (`Get-…Scan`, single and list) are **PaaS-only** - they aren't supported on `Microsoft.Compute/virtualMachines` or `Microsoft.HybridCompute/machines`. On IaaS resources, use `Get-SqlVulnerabilityAssessmentScanResult -ScanId 'latest'` to read scan data.
>
> System databases on Managed Instance (`master`, `model`, `msdb`) and Synapse (`master`) are addressed using their natural resource id (for example `…/managedInstances/{mi}/databases/master`). The module transparently routes those requests to the instance/workspace-level URL with `databaseName` as a query parameter.
>
> Reference API docs:
>
> - [Sql Vulnerability Assessment Settings](/en-us/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-settings)
> - [Sql Vulnerability Assessment Baseline Rules](/en-us/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-baseline-rules)
> - [Sql Vulnerability Assessment Scan Results](/en-us/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scan-results)
> - [Sql Vulnerability Assessment Scans](/en-us/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scans)

This article lists the PowerShell commands that can be used with SQL vulnerability assessment express configuration.

Make a local copy of the script located on [Express configuration PowerShell wrapper module](express-configuration-sql-commands.md), and save the file with the following file name `SqlVulnerabilityAssessmentCommands.psm1`, which can be referenced with the following commands:

- [Get SQL vulnerability assessment setting](#get-sql-vulnerability-assessment-setting)
- [Set SQL vulnerability assessment setting](#set-sql-vulnerability-assessment-setting)
- [Remove SQL vulnerability assessment setting](#remove-sql-vulnerability-assessment-setting)
- [Invoke SQL vulnerability assessment scan](#invoke-sql-vulnerability-assessment-scan)
- [Get SQL vulnerability assessment scan](#get-sql-vulnerability-assessment-scan)
- [Get SQL vulnerability assessment scan operation result](#get-sql-vulnerability-assessment-scan-operation-result)
- [Get SQL vulnerability assessment scan result](#get-sql-vulnerability-assessment-scan-result)
- [Get SQL vulnerability assessment baseline](#get-sql-vulnerability-assessment-baseline)
- [Add SQL vulnerability assessment baseline](#add-sql-vulnerability-assessment-baseline)
- [Get SQL vulnerability assessment baseline rule](#get-sql-vulnerability-assessment-baseline-rule)
- [Set SQL vulnerability assessment baseline rule](#set-sql-vulnerability-assessment-baseline-rule)
- [Remove SQL vulnerability assessment baseline rule](#remove-sql-vulnerability-assessment-baseline-rule)

### Get SQL vulnerability assessment setting

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentSetting -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"properties":{"state":"Enabled"},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default","name":"default","type":"Microsoft.Security/sqlVulnerabilityAssessments"}
```

### Set SQL vulnerability assessment setting

**Example 1**: Enable the vulnerability assessment setting. The wrapper constructs the request body from `-State`.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Set-SqlVulnerabilityAssessmentSetting -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest -State Enabled

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-writes, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : PUT
Content    : {"properties":{"state":"Enabled"},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default","name":"default","type":"Microsoft.Security/sqlVulnerabilityAssessments"}
```

**Example 2**: Disable the vulnerability assessment setting.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Set-SqlVulnerabilityAssessmentSetting -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest -State Disabled

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-writes, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : PUT
Content    : {"properties":{"state":"Disabled"},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default","name":"default","type":"Microsoft.Security/sqlVulnerabilityAssessments"}
```

### Remove SQL vulnerability assessment setting

Example shown for a SQL Managed Instance resource.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Remove-SqlVulnerabilityAssessmentSetting -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-deletes, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : DELETE
Content    :
```

### Invoke SQL vulnerability assessment scan

**Example 1**: Fire-and-forget. The wrapper returns a `pscustomobject` exposing the `Location` header and the parsed `OperationId` you can poll later with `Get-SqlVulnerabilityAssessmentScanOperationResult`.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Invoke-SqlVulnerabilityAssessmentScan -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db

Results:

Headers     : {[Cache-Control, System.String[]], [Pragma, System.String[]], [x-ms-request-id, System.String[]], [Location, System.String[]]…}
Version     : 1.1
StatusCode  : 202
Method      : POST
Location    : https://management.azure.com/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/scanOperationResults/9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11?api-version=2026-04-01-preview
OperationId : 9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11
```

**Example 2**: Initiate a scan and wait inline for it to reach a terminal state. With `-Wait`, the wrapper polls the scan operation and, once it reaches a terminal state, fetches the latest scan record so you get the full scan summary (trigger type, state, start/end time, rule counts, baseline-applied flag, …). The cmdlet returns a `pscustomobject` with `ScanStatus` (the terminal status string) and `Scan` (the deserialized scan record).

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
$r = Invoke-SqlVulnerabilityAssessmentScan -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -Wait -PollIntervalSeconds 5 -TimeoutSeconds 600
$r.ScanStatus
$r.Scan.properties

Results:

ScanStatus : Passed
Scan       : @{properties=@{triggerType=OnDemand; state=Passed; startTime=2026-06-02T12:00:01Z;
              endTime=2026-06-02T12:00:48Z; scanStatus=Passed; isBaselineApplied=True;
              numberOfFailedSecurityChecks=0; server=vulnerabilityaseessmenttest; database=db};
              id=/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602;
              name=Scheduled-20260602; type=Microsoft.Security/sqlVulnerabilityAssessments/scans}
```

### Get SQL vulnerability assessment scan

**Example 1**: List every scan recorded for an Azure SQL database.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentScan -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"value":[{"properties":{"triggerType":"OnDemand","state":"Passed","scanStatus":"Passed","isBaselineApplied":true,"numberOfFailedSecurityChecks":0},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602","name":"Scheduled-20260602","type":"Microsoft.Security/sqlVulnerabilityAssessments/scans"}]}
```

**Example 2**: Get the latest scan for a Synapse SQL pool. The wrapper accepts the literal `-ScanId 'latest'` to drill into the most recent scan record.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentScan -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Synapse/workspaces/vaSynapseWs/sqlPools/pool1 -ScanId 'latest'

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"properties":{"triggerType":"OnDemand","state":"Passed","scanStatus":"Passed","isBaselineApplied":true,"numberOfFailedSecurityChecks":2},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Synapse/workspaces/vaSynapseWs/sqlPools/pool1/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest","name":"latest","type":"Microsoft.Security/sqlVulnerabilityAssessments/scans"}
```

### Get SQL vulnerability assessment scan operation result

Polls an in-flight scan initiated by `Invoke-SqlVulnerabilityAssessmentScan`.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentScanOperationResult -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -OperationId 9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"properties":{"scanStatus":"InProgress","startTime":"2026-06-02T12:00:01Z"},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/scanOperationResults/9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11","name":"9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11","type":"Microsoft.Security/sqlVulnerabilityAssessments/scans/scanOperationResults"}
```

### Get SQL vulnerability assessment scan result

**Example 1**: List every rule result for a given scan on an Azure SQL database.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentScanResult -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -ScanId 'latest'

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"value":[{"properties":{"ruleId":"VA2062","status":"NonFinding","isTrimmed":false},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults/VA2062","name":"VA2062","type":"Microsoft.Security/sqlVulnerabilityAssessments/scans/scanResults"},{"properties":{"ruleId":"VA2065","status":"Finding","isTrimmed":false},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults/VA2065","name":"VA2065","type":"Microsoft.Security/sqlVulnerabilityAssessments/scans/scanResults"}]}
```

**Example 2**: Drill into a single failing rule on a SQL VM. The VM resource id uses the `Microsoft.Compute/virtualMachines/{vm}/sqlServers/{instance}/databases/{db}` child path.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentScanResult -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Compute/virtualMachines/vaSqlVm/sqlServers/MSSQLSERVER/databases/db -ScanId 'latest' -RuleId VA2065

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"properties":{"ruleId":"VA2065","status":"Finding","isTrimmed":false,"queryResults":[["dbo","db_owner"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Compute/virtualMachines/vaSqlVm/sqlServers/MSSQLSERVER/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults/VA2065","name":"VA2065","type":"Microsoft.Security/sqlVulnerabilityAssessments/scans/scanResults"}
```

### Get SQL vulnerability assessment baseline

Lists the baseline rules currently configured for a database (any of the five supported resource types).

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentBaseline -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"value":[{"properties":{"results":[["True"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1143","name":"VA1143","type":"Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"},{"properties":{"results":[["False"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1219","name":"VA1219","type":"Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"}]}
```

### Add SQL vulnerability assessment baseline

**Example 1**: Seed the baseline from the most recent scan by sending `latestScan = true` with an empty `results` object.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Add-SqlVulnerabilityAssessmentBaseline -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -Body '{ "latestScan": true, "results": {} }'

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-writes, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : POST
Content    : {"value":[{"properties":{"results":[["True"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1143","name":"VA1143","type":"Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"}]}
```

**Example 2**: Seed the baseline with explicit rule results - useful for declarative, idempotent baselines.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Add-SqlVulnerabilityAssessmentBaseline -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -Body '{
  "latestScan": false,
  "results": {
    "VA2062": [
      [
        "AllowAll",
        "0.0.0.0",
        "255.255.255.255"
      ]
    ]
  }
}'

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-writes, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : POST
Content    : {"value":[{"properties":{"results":[["AllowAll","0.0.0.0","255.255.255.255"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062","name":"VA2062","type":"Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"}]}
```

### Get SQL vulnerability assessment baseline rule

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Get-SqlVulnerabilityAssessmentBaselineRule -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -RuleId VA2062

Results:

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-reads, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : GET
Content    : {"properties":{"results":[["AllowAll","0.0.0.0","255.255.255.255"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062","name":"VA2062","type":"Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"}
```

### Set SQL vulnerability assessment baseline rule

Create or replace a single baseline rule. The `-Body` is sent verbatim, so it can match the standard `properties.results` shape.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Set-SqlVulnerabilityAssessmentBaselineRule -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db -RuleId VA2062 -Body '{
  "latestScan": false,
  "results": [
    [
      "AllowAll",
      "0.0.0.0",
      "255.255.255.255"
    ]
  ]
}'

Headers    : {[Cache-Control, System.String[]], [Pragma, System.String[]], [x-ms-request-id, System.String[]], [Server, System.String[]]…}
Version    : 1.1
StatusCode : 200
Method     : PUT
Content    : {"properties":{"results":[["AllowAll","0.0.0.0","255.255.255.255"]]},"id":"/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062","name":"VA2062","type":"Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"}
```

### Remove SQL vulnerability assessment baseline rule

Example shown for an Azure Arc-enabled SQL Server database. Arc resource ids use the `Microsoft.HybridCompute/machines/{machine}/sqlServers/{instance}/databases/{db}` child path.

```azurepowershell
Connect-AzAccount -Subscription 00000000-1111-2222-3333-444444444444
Import-Module .\SqlVulnerabilityAssessmentCommands.psm1
Remove-SqlVulnerabilityAssessmentBaselineRule -ResourceId /subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.HybridCompute/machines/vaSqlArc/sqlServers/MSSQLSERVER/databases/db -RuleId VA2062

Headers    : {[Pragma, System.String[]], [x-ms-request-id, System.String[]], [x-ms-ratelimit-remaining-subscription-deletes, System.String[]], [x-ms-correlation-request-id, System.String[]]...}
Version    : 1.1
StatusCode : 200
Method     : DELETE
Content    :
```

## Next steps

[Find and remediate vulnerabilities in your Azure SQL databases](sql-azure-vulnerability-assessment-find.md)
