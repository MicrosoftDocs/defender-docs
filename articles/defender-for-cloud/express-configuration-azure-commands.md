---
title: Express configuration Azure Command Line Interface (CLI) commands reference
description: In this article, you can review the Express configuration Azure Command Line Interface (CLI) commands reference and copy example scripts to use in your environments.
ms.topic: sample
ms.custom: devx-track-azurecli
author: ElazarK
ms.author: elkrieger
ms.date: 05/07/2026
---

# Express configuration Azure Command Line Interface (CLI) commands reference

> [!IMPORTANT]
> Updated to reflect SQL vulnerability assessment unified API reference that can be found under:
> - [Sql Vulnerability Assessment Settings](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-settings)
> - [Sql Vulnerability Assessment Baseline Rules](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-baseline-rules)
> - [Sql Vulnerability Assessment Scan Results](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scan-results)
> - [Sql Vulnerability Assessment Scans](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scans)

This article lists the Azure Command Line Interface (CLI) commands that can be used with SQL vulnerability assessment express configuration.

The examples in this article should be run in PowerShell; they aren't for use "as is" with Bash.

- [Get SQL vulnerability assessment setting](#get-sql-vulnerability-assessment-setting)
- [Set SQL vulnerability assessment setting](#set-sql-vulnerability-assessment-setting)
- [Remove SQL vulnerability assessment setting](#remove-sql-vulnerability-assessment-setting)
- [Invoke SQL vulnerability assessment scan on user database](#invoke-sql-vulnerability-assessment-scan-on-user-database)
- [Invoke SQL vulnerability assessment scan on system database](#invoke-sql-vulnerability-assessment-scan-on-system-database)
- [Get SQL vulnerability assessment scan on user database](#get-sql-vulnerability-assessment-scan-on-user-database)
- [Get SQL vulnerability assessment scan on system database](#get-sql-vulnerability-assessment-scan-on-system-database)
- [Get SQL vulnerability assessment scan operation result](#get-sql-vulnerability-assessment-scan-operation-result)
- [Get SQL vulnerability assessment scan result on system database](#get-sql-vulnerability-assessment-scan-result-on-system-database)
- [Get SQL vulnerability assessment scan result on user database](#get-sql-vulnerability-assessment-scan-result-on-user-database)
- [Get SQL vulnerability assessment baseline](#get-sql-vulnerability-assessment-baseline)
- [Add SQL vulnerability assessment baseline](#add-sql-vulnerability-assessment-baseline)
- [Get SQL vulnerability assessment baseline rule on user database](#get-sql-vulnerability-assessment-baseline-rule-on-user-database)
- [Get SQL vulnerability assessment baseline rule on system database](#get-sql-vulnerability-assessment-baseline-rule-on-system-database)
- [Set SQL vulnerability assessment baseline rule on user database](#set-sql-vulnerability-assessment-baseline-rule-on-user-database)
- [Set SQL vulnerability assessment baseline rule on system database](#set-sql-vulnerability-assessment-baseline-rule-on-system-database)
- [Remove SQL vulnerability assessment baseline rule](#remove-sql-vulnerability-assessment-baseline-rule)

> [!NOTE]
> For Azure CLI reference for the classic configuration, see [Manage findings in your Azure SQL databases](sql-azure-vulnerability-assessment-manage.md#azure-cli)

You can get the list of available scan IDs with this cmdlet - [Get SQL vulnerability assessment scan](express-configuration-powershell-commands.md#get-sql-vulnerability-assessment-scan)

### Get SQL vulnerability assessment setting

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default?api-version=2026-04-01-preview

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default",
  "name": "default",
  "properties": {
    "creationTime": "2026-05-15T08:52:39.3476874+00:00",
    "state": "Enabled"
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments"
}
```

> [!NOTE]
> When vulnerability assessment has never been configured on the resource, the RP returns HTTP 200 with `"state": "Disabled"` (and no `creationTime`) rather than HTTP 404.

### Set SQL vulnerability assessment setting

**Example 1**: Enable the vulnerability assessment setting on an Azure SQL server.

```azurecli
az rest --method Put --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default?api-version=2026-04-01-preview --body '{ \"properties\": { \"state\": \"Enabled\" } }'

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default",
  "name": "default",
  "properties": {
    "state": "Enabled"
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments"
}
```

**Example 2**: Disable the vulnerability assessment setting.

```azurecli
az rest --method Put --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default?api-version=2026-04-01-preview --body '{ \"properties\": { \"state\": \"Disabled\" } }'

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/providers/Microsoft.Security/sqlVulnerabilityAssessments/default",
  "name": "default",
  "properties": {
    "state": "Disabled"
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments"
}
```

### Remove SQL vulnerability assessment setting

Example shown for a SQL managed instance.

```azurecli
az rest --method Delete --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default?api-version=2026-04-01-preview
```

Returns HTTP 200 with an empty body on success.

### Invoke SQL vulnerability assessment scan on user database

```azurecli
az rest --method Post --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/initiateScan?api-version=2026-04-01-preview
```

The response is HTTP **202 Accepted** with an empty body. The operation id is returned in the `Location` response header, for example:

```
Location: https://management.azure.com/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/scanOperationResults/9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11?api-version=2026-04-01-preview
```

Poll that URL with [Get SQL vulnerability assessment scan operation result](#get-sql-vulnerability-assessment-scan-operation-result) to track scan progress. To capture the header from `az rest`, request the full response with `--output-file`:

```azurecli
az rest --method Post --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/initiateScan?api-version=2026-04-01-preview --output-file scan-response.json --verbose
```

### Invoke SQL vulnerability assessment scan on system database

Example shown for the SQL managed instance `master` database. The URL omits the `/databases/{db}` segment and `databaseName=master` is passed as a query parameter.

```azurecli
az rest --method Post --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/initiateScan?api-version=2026-04-01-preview --uri-parameters databaseName=master
```

Same 202 + `Location` header semantics as the user-database form.

### Get SQL vulnerability assessment scan on user database

**Example 1**: List every scan recorded for the database.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans?api-version=2026-04-01-preview

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602",
      "name": "Scheduled-20260602",
      "properties": {
        "triggerType": "Scheduled",
        "state": "Passed",
        "startTime": "2026-06-02T08:00:01.4142209Z",
        "endTime": "2026-06-02T08:00:47.5235755Z",
        "server": "vulnerabilityaseessmenttest",
        "database": "db",
        "sqlVersion": "16.0.5100",
        "highSeverityFailedRulesCount": 0,
        "mediumSeverityFailedRulesCount": 0,
        "lowSeverityFailedRulesCount": 0,
        "totalPassedRulesCount": 24,
        "totalFailedRulesCount": 0,
        "totalRulesCount": 24,
        "isBaselineApplied": true
      },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans"
    }
  ]
}
```

**Example 2**: Get a single scan record by id. Use the literal `latest` to retrieve the most recent scan.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest?api-version=2026-04-01-preview

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602",
  "name": "Scheduled-20260602",
  "properties": {
    "triggerType": "Scheduled",
    "state": "Passed",
    "startTime": "2026-06-02T08:00:01.4142209Z",
    "endTime": "2026-06-02T08:00:47.5235755Z",
    "server": "vulnerabilityaseessmenttest",
    "database": "db",
    "sqlVersion": "16.0.5100",
    "highSeverityFailedRulesCount": 0,
    "mediumSeverityFailedRulesCount": 0,
    "lowSeverityFailedRulesCount": 0,
    "totalPassedRulesCount": 24,
    "totalFailedRulesCount": 0,
    "totalRulesCount": 24,
    "isBaselineApplied": true
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans"
}
```

### Get SQL vulnerability assessment scan on system database

Example shown for the Synapse workspace `master` database. The URL omits the `/sqlPools/{pool}` segment and `databaseName=master` is supplied as a query parameter.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Synapse/workspaces/vaSynapseWs/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans?api-version=2026-04-01-preview --uri-parameters databaseName=master

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Synapse/workspaces/vaSynapseWs/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602",
      "name": "Scheduled-20260602",
      "properties": {
        "triggerType": "Scheduled",
        "state": "Passed",
        "startTime": "2026-06-02T08:05:01.0000000Z",
        "endTime": "2026-06-02T08:05:42.0000000Z",
        "server": "vaSynapseWs",
        "database": "master",
        "totalPassedRulesCount": 9,
        "totalFailedRulesCount": 0,
        "totalRulesCount": 9,
        "isBaselineApplied": true
      },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans"
    }
  ]
}
```

The same pattern (omit `/databases/{db}` + add `--uri-parameters databaseName=master|model|msdb`) is used for SQL managed instance system databases.

### Get SQL vulnerability assessment scan operation result

Polls an in-flight scan that was previously initiated with [Invoke SQL vulnerability assessment scan](#invoke-sql-vulnerability-assessment-scan-on-user-database). The operation id is the GUID returned in the `Location` header of the `Invoke` response.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/scanOperationResults/9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11?api-version=2026-04-01-preview

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/scanOperationResults/9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11",
  "name": "9e2c1b3a-4d6f-4d8b-9b88-3c2e9a7e0a11",
  "properties": {
    "scanStatus": "InProgress",
    "startTime": "2026-06-02T12:00:01Z"
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans/scanOperationResults"
}
```

When the scan reaches a terminal state, `scanStatus` switches to `Passed` or `Failed` and `endTime` is populated.

### Get SQL vulnerability assessment scan result on user database

**Example 1**: List every rule result for a given scan.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults?api-version=2026-04-01-preview

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults/VA1219",
      "name": "VA1219",
      "properties": {
        "ruleId": "VA1219",
        "status": "NonFinding",
        "isTrimmed": false,
        "queryResults": [["False"]],
        "baselineAdjustedResult": {
          "baseline": { "expectedResults": [["False"]], "updatedTime": "2026-05-15T08:52:39.3476874+00:00" },
          "status": "NonFinding",
          "resultsNotInBaseline": [],
          "resultsOnlyInBaseline": []
        },
        "remediation": {
          "description": "Enable TDE on the affected databases",
          "scripts": [],
          "automated": false,
          "portalLink": "EnableTDE"
        },
        "ruleMetadata": {
          "ruleId": "VA1219",
          "severity": "Medium",
          "category": "DataProtection",
          "ruleType": "Binary",
          "title": "Transparent data encryption should be enabled",
          "description": "Transparent data encryption (TDE) helps to protect the database files against information disclosure ...",
          "rationale": "Transparent Data Encryption (TDE) protects data 'at rest' ..."
        }
      },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans/scanResults"
    }
  ]
}
```

**Example 2**: Get a single rule's result on a SQL VM (`Microsoft.Compute/virtualMachines`). Scan-result and baseline operations are supported on VM and Arc — only the policy, scan-initiation/polling, and scan-record (`Get scan`) operations are PaaS-only. On IaaS, the `scans/latest/scanResults` path is the way to read scan data because scan-record enumeration isn't exposed.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Compute/virtualMachines/vaSqlVm/sqlServers/MSSQLSERVER/databases/master/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults/VA2065?api-version=2026-04-01-preview

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Compute/virtualMachines/vaSqlVm/sqlServers/MSSQLSERVER/databases/master/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602/scanResults/VA2065",
  "name": "VA2065",
  "properties": {
    "ruleId": "VA2065",
    "status": "NonFinding",
    "isTrimmed": false,
    "queryResults": [],
    "remediation": {
      "description": "Evaluate each of the server-level firewall rules. Remove any rules that grant unnecessary access and set the rest as a baseline.",
      "scripts": [],
      "automated": false,
      "portalLink": "ReviewServerFirewallRules"
    },
    "ruleMetadata": {
      "ruleId": "VA2065",
      "severity": "High",
      "category": "SurfaceAreaReduction",
      "ruleType": "BaselineExpected",
      "title": "Server-level firewall rules should be tracked and maintained at a strict minimum"
    }
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans/scanResults"
}
```

### Get SQL vulnerability assessment scan result on system database

Example shown for the SQL managed instance `master` database. The URL omits the `/databases/{db}` segment and `databaseName=master` is supplied as a query parameter.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/latest/scanResults?api-version=2026-04-01-preview --uri-parameters databaseName=master

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/scans/Scheduled-20260602/scanResults/VA2065",
      "name": "VA2065",
      "properties": {
        "ruleId": "VA2065",
        "status": "NonFinding",
        "isTrimmed": false,
        "queryResults": [],
        "remediation": {
          "description": "Evaluate each of the server-level firewall rules.",
          "scripts": [],
          "automated": false,
          "portalLink": "ReviewServerFirewallRules"
        },
        "ruleMetadata": {
          "ruleId": "VA2065",
          "severity": "High",
          "category": "SurfaceAreaReduction",
          "ruleType": "BaselineExpected",
          "title": "Server-level firewall rules should be tracked and maintained at a strict minimum"
        }
      },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/scans/scanResults"
    }
  ]
}
```

### Get SQL vulnerability assessment baseline

Returns the full set of baseline rules configured for the database. In the V20260401 API, baseline state is exposed directly through the `baselineRules` collection (the legacy `baselines/default` resource is no longer used).

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules?api-version=2026-04-01-preview

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1143",
      "name": "VA1143",
      "properties": {
        "results": [["True"]]
      },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
    },
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1219",
      "name": "VA1219",
      "properties": {
        "results": [["False"]]
      },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
    }
  ]
}
```

### Add SQL vulnerability assessment baseline

Bulk-adds or replaces multiple baseline rules in a single POST against the `baselineRules` collection.

**Example 1**: Seed the baseline from the most recent scan results. Set `latestScan` to `true` and leave `results` empty. The response is the standard ARM list of baseline rules (same shape as [Get SQL vulnerability assessment baseline](#get-sql-vulnerability-assessment-baseline)).

```azurecli
az rest --method Post --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules?api-version=2026-04-01-preview --body '{ \"latestScan\": true, \"results\": {} }'

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1143",
      "name": "VA1143",
      "properties": { "results": [["True"]] },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
    },
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA1219",
      "name": "VA1219",
      "properties": { "results": [["False"]] },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
    }
  ]
}
```

**Example 2**: Add a specific baseline value for rule `VA2062` (database-level firewall rule allow-list).

```azurecli
az rest --method Post --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules?api-version=2026-04-01-preview --body '{ \"latestScan\": false, \"results\": { \"VA2062\": [ [ \"AllowAll\", \"0.0.0.0\", \"255.255.255.255\" ] ] } }'

{
  "value": [
    {
      "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062",
      "name": "VA2062",
      "properties": { "results": [["AllowAll", "0.0.0.0", "255.255.255.255"]] },
      "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
    }
  ]
}
```

### Get SQL vulnerability assessment baseline rule on user database

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062?api-version=2026-04-01-preview

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062",
  "name": "VA2062",
  "properties": {
    "results": [
      [ "AllowAll", "0.0.0.0", "255.255.255.255" ]
    ]
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
}
```

### Get SQL vulnerability assessment baseline rule on system database

Example shown for the SQL managed instance `master` database. The URL omits the `/databases/{db}` segment and `databaseName=master` is supplied as a query parameter.

```azurecli
az rest --method Get --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2065?api-version=2026-04-01-preview --uri-parameters databaseName=master

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2065",
  "name": "VA2065",
  "properties": {
    "results": [
      [ "AllowAll", "0.0.0.0", "255.255.255.255" ]
    ]
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
}
```

### Set SQL vulnerability assessment baseline rule on user database

The request body is **flat** — `{ "latestScan": <bool>, "results": [[…]] }`. The V20260401 baseline rules endpoint rejects requests that wrap the payload in a `properties` envelope.

```azurecli
az rest --method Put --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062?api-version=2026-04-01-preview --body '{ \"latestScan\": false, \"results\": [ [ \"AllowAll\", \"0.0.0.0\", \"255.255.255.255\" ] ] }'

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/servers/vulnerabilityaseessmenttest/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062",
  "name": "VA2062",
  "properties": {
    "results": [
      [ "AllowAll", "0.0.0.0", "255.255.255.255" ]
    ]
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
}
```

### Set SQL vulnerability assessment baseline rule on system database

Example shown for the SQL managed instance `master` database. The URL omits the `/databases/{db}` segment and `databaseName=master` is supplied as a query parameter. The request body uses the same **flat** shape as the user-database form.

```azurecli
az rest --method Put --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2065?api-version=2026-04-01-preview --uri-parameters databaseName=master --body '{ \"latestScan\": false, \"results\": [ [ \"AllowAll\", \"0.0.0.0\", \"255.255.255.255\" ] ] }'

{
  "id": "/subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.Sql/managedInstances/vulnerabilityaseessmentmi/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2065",
  "name": "VA2065",
  "properties": {
    "results": [
      [ "AllowAll", "0.0.0.0", "255.255.255.255" ]
    ]
  },
  "type": "Microsoft.Security/sqlVulnerabilityAssessments/baselineRules"
}
```

### Remove SQL vulnerability assessment baseline rule

Example shown for an Arc-enabled SQL Server database (`Microsoft.HybridCompute/machines`). Baseline operations are supported on VM and Arc — only the policy, scan-initiation/polling, and scan-record (`Get scan`) operations are PaaS-only.

```azurecli
az rest --method Delete --uri /subscriptions/<SubscriptionID>/resourceGroups/vulnerabilityaseessmenttestRg/providers/Microsoft.HybridCompute/machines/vaSqlArc/sqlServers/MSSQLSERVER/databases/db/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/baselineRules/VA2062?api-version=2026-04-01-preview
```

Returns HTTP 200 with an empty body on success, or 204 No Content if the rule did not exist.

## Next steps

[Find and remediate vulnerabilities in your Azure SQL databases](sql-azure-vulnerability-assessment-find.md)
