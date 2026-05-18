---
title: Get started with the unified SQL Vulnerability Assessment REST API
description: Learn how to manage SQL vulnerability assessments across Azure SQL Database, SQL Managed Instance, Synapse Workspaces, and SQL on machines using the unified REST API.
ms.topic: quickstart
ms.custom: devx-track-azurepowershell
author: ElazarK
ms.author: elkrieger
ms.date: 05/07/2026
ms.service: defender-for-cloud
---

# Get started with the unified SQL Vulnerability Assessment REST API

This quickstart shows how to use the unified SQL Vulnerability Assessment Representational State Transfer (REST) API to run end-to-end scans and baseline management for server-level Azure SQL resources.

In one interactive flow, you enable vulnerability assessment settings, discover databases, run scans, review findings, and optionally set baselines.

## Run a SQL vulnerability assessment scan

Scan all databases on your Azure SQL resource, review the results, and manage baselines in one interactive session by using API version **2026-04-01-preview**.

### What the script does

- **Enables** SQL Vulnerability Assessment settings on the server (exits with error details on failure).
- **Discovers** all databases automatically (via Azure Resource Manager (ARM)) and adds `master`.
- **Scans** each database, waits for completion, and displays results.
- Prints a **scan summary table**.
- **Baseline management** - interactively choose how to handle failed rules:
  - **[A] All** - set baselines on all failed rules across all databases at once.
  - **[R] Review** - inspect each failed rule (severity, description, findings, remediation) and choose individually.
  - **[S] Skip** - leave baselines unchanged.
- Displays a **final scan summary** reflecting any baselines applied

### Prerequisites

- PowerShell 7+.
- Azure CLI (`az`), authenticated by running `az login`.
- A server-level resource ID (see [Supported Resources](#supported-resources))
- Azure RBAC roles on the target resource:
  - [**Reader**](/azure/role-based-access-control/built-in-roles/general#reader) to list databases and SQL pools through ARM.
  - [**SQL Security Manager**](/azure/role-based-access-control/built-in-roles/databases#sql-security-manager) to enable vulnerability assessment (VA) settings, initiate scans, read results, and manage baselines (`Microsoft.Security/sqlVulnerabilityAssessments/*`).
- SQL Managed Instance only: The managed instance must have a [system-assigned managed identity](/azure/azure-sql/database/authentication-azure-ad-user-assigned-managed-identity) enabled.

### Supported resources

| Provider | Resource Type | ARM Database List API |
|----------|--------------|----------------------|
| `Microsoft.Sql/servers` | SQL Server | Lists `/databases` |
| `Microsoft.Sql/managedInstances` | SQL Managed Instance | Lists `/databases` |
| `Microsoft.Synapse/workspaces` | Synapse Workspace | Lists `/sqlPools` |

> [!NOTE]
> Only server-level resource IDs are accepted. The script auto-discovers all databases, so you don't need to specify individual databases.

### Usage

```powershell
.\Quickstart-VaScan.ps1 -ServerResourceId "<server-level ARM resource ID>"
```

#### Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| `-ServerResourceId` | Yes | - | Server-level ARM resource ID |
| `-ArmEndpoint` | | `https://management.azure.com` | ARM endpoint |
| `-ScanTimeoutSeconds` | | `300` | Max wait per database scan (seconds) |

### Examples

#### SQL Managed Instance

```powershell
.\Quickstart-VaScan.ps1 -ServerResourceId "/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Sql/managedInstances/<mi>"
```

#### Synapse Workspace

```powershell
.\Quickstart-VaScan.ps1 -ServerResourceId "/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Synapse/workspaces/<ws>"
```

### Sample script - Quickstart-VaScan.ps1

```powershell
<#
.SYNOPSIS
	Quickstart script for SQL Vulnerability Assessment API v2026-04-01-preview.

.DESCRIPTION
	End-to-end quickstart: enables VA, scans all databases, reviews results, and
	optionally sets baselines - all in one interactive session.

	Steps:
	  1. Enable SQL Vulnerability Assessment settings
	  2. Discover databases (via ARM) + add master
	  3. For each database: initiate scan, wait for completion, show results
	  4. Show scan results summary (failed rules per database)
	  5. Interactive baseline management: set baselines on all failed rules at once,
		 or review each failed rule individually and choose which to baseline
	  6. Display final scan summary after baselines are applied

	Supports server-level resource IDs only (Microsoft.Sql/servers,
	Microsoft.Sql/managedInstances, Microsoft.Synapse/workspaces).

.PARAMETER ServerResourceId
	The server-level ARM resource ID.
	Examples:
	  /subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Sql/servers/<server>
	  /subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Sql/managedInstances/<mi>
	  /subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Synapse/workspaces/<ws>

.PARAMETER ArmEndpoint
	The ARM management endpoint. Default: https://management.azure.com

.PARAMETER ScanTimeoutSeconds
	Maximum time in seconds to wait for each scan to complete. Default: 300.

.EXAMPLE
	# SQL Server
	.\Quickstart-VaScan.ps1 -ServerResourceId "/subscriptions/.../Microsoft.Sql/servers/myServer"

.EXAMPLE
	# SQL Managed Instance
	.\Quickstart-VaScan.ps1 -ServerResourceId "/subscriptions/.../Microsoft.Sql/managedInstances/myMI"

.EXAMPLE
	# Synapse Workspace
	.\Quickstart-VaScan.ps1 -ServerResourceId "/subscriptions/.../Microsoft.Synapse/workspaces/myWS"
#>

param(
	[Parameter(Mandatory)] [string] $ServerResourceId,
	[string] $ArmEndpoint = "https://management.azure.com",
	[int]    $ScanTimeoutSeconds = 300
)

if ($PSVersionTable.PSVersion.Major -lt 7) {
	Write-Error "This script requires PowerShell 7 or later. Current version: $($PSVersionTable.PSVersion). Install from https://aka.ms/powershell"
	exit 1
}

$ErrorActionPreference = "Stop"
$apiVersion = "2026-04-01-preview"
$ServerResourceId = $ServerResourceId.TrimStart("/")

# --- Determine resource type ---
$resourceType = $null
$dbListApiVersion = "2021-02-01-preview"
$dbChildSegment = "databases"

if ($ServerResourceId -match "Microsoft\.Sql/servers/[^/]+$") {
	$resourceType = "SqlServer"
} elseif ($ServerResourceId -match "Microsoft\.Sql/managedInstances/[^/]+$") {
	$resourceType = "SqlManagedInstance"
} elseif ($ServerResourceId -match "Microsoft\.Synapse/workspaces/[^/]+$") {
	$resourceType = "Synapse"
	$dbListApiVersion = "2021-06-01-preview"
	$dbChildSegment = "sqlPools"
} else {
	Write-Error "Only server-level resource IDs are supported. Provide a Microsoft.Sql/servers, Microsoft.Sql/managedInstances, or Microsoft.Synapse/workspaces resource."
	exit 1
}

Write-Host "SQL Vulnerability Assessment - Quickstart" -ForegroundColor Cyan
Write-Host "API Version  : $apiVersion"
Write-Host "Resource Type: $resourceType"
Write-Host "Resource     : $ServerResourceId`n"

# --- Acquire token ---
Write-Host "Acquiring Azure access token..." -ForegroundColor Cyan
$token = az account get-access-token --resource https://management.azure.com --query accessToken -o tsv 2>$null
if (-not $token) {
	Write-Error "Failed to get token. Run 'az login' first."
	exit 1
}
$headers = @{
	Authorization  = "Bearer $token"
	"Content-Type" = "application/json"
}
Write-Host "  Token acquired.`n" -ForegroundColor Green

# --- Helper ---
function Invoke-Api {
	param([string]$Method, [string]$Url, [string]$Body)
	$params = @{ Method = $Method; Uri = $Url; Headers = $headers; SkipHttpErrorCheck = $true }
	if ($Body) { $params.Body = $Body }
	$r = Invoke-WebRequest @params
	$parsed = try { $r.Content | ConvertFrom-Json } catch { $null }
	return @{ StatusCode = $r.StatusCode; Body = $parsed; Raw = $r.Content }
}

function Get-ErrorMessage {
	param($Response)
	if ($Response.Body.error.message) { return $Response.Body.error.message }
	if ($Response.Body.message)       { return $Response.Body.message }
	return $Response.Raw
}

$settingsBase = "$ArmEndpoint/$ServerResourceId/providers/Microsoft.Security/sqlVulnerabilityAssessments/default"

# =====================================================================
#  Step 1: Enable VA Settings
# =====================================================================
Write-Host "Step 1: Enable SQL Vulnerability Assessment" -ForegroundColor Yellow
$url = "${settingsBase}?api-version=$apiVersion"
Write-Host "  PUT $url"
$r = Invoke-Api -Method PUT -Url $url -Body '{ "properties": { "state": "Enabled" } }'
if ($r.StatusCode -eq 200) {
	Write-Host "  Settings enabled.`n" -ForegroundColor Green
} else {
	Write-Host "  Failed to enable VA settings (HTTP $($r.StatusCode)):" -ForegroundColor Red
	Write-Host "  $(Get-ErrorMessage $r)`n" -ForegroundColor Red
	exit 1
}

# =====================================================================
#  Step 2: Discover databases
# =====================================================================
Write-Host "Step 2: Discovering databases..." -ForegroundColor Yellow
$dbListUrl = "$ArmEndpoint/$ServerResourceId/${dbChildSegment}?api-version=$dbListApiVersion"
Write-Host "  GET $dbListUrl"
$r = Invoke-Api -Method GET -Url $dbListUrl

$databases = @()
if ($r.StatusCode -eq 200 -and $r.Body.value) {
	$databases = @($r.Body.value | ForEach-Object { $_.name })
}

# Always include master (if not already in the list)
if ("master" -notin $databases) {
	$databases = @("master") + $databases
} else {
	# Move master to front
	$databases = @("master") + @($databases | Where-Object { $_ -ne "master" })
}

# For SQL MI, add system databases msdb and model (ARM list API doesn't return them)
if ($resourceType -eq "SqlManagedInstance") {
	foreach ($sysDb in @("msdb", "model")) {
		if ($sysDb -notin $databases) {
			$databases += $sysDb
		}
	}
}

Write-Host "  Found $($databases.Count) database(s): $($databases -join ', ')`n" -ForegroundColor Green

# --- Confirm before scanning ---
$confirm = $null
while ($confirm -notin @("Y", "N")) {
	$confirm = (Read-Host "  Proceed to scan all $($databases.Count) database(s)? (Y/N)").Trim().ToUpper()
}
if ($confirm -eq "N") {
	Write-Host "`n  Aborted by user.`n" -ForegroundColor DarkGray
	exit 0
}
Write-Host ""

# =====================================================================
#  Step 3: Scan each database
# =====================================================================
$opsBase = "$ArmEndpoint/$ServerResourceId/providers/Microsoft.Security/sqlVulnerabilityAssessments/default"
$scanSummary = @()

foreach ($db in $databases) {
	Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
	Write-Host "  Scanning database: $db" -ForegroundColor Yellow
	Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray

	$dbQuery = "&databaseName=$db"

	# --- Initiate scan ---
	$scanUrl = "${opsBase}/scans/initiateScan?api-version=${apiVersion}${dbQuery}"
	Write-Host "  POST $scanUrl"
	$r = Invoke-Api -Method POST -Url $scanUrl
	if ($r.StatusCode -ne 202) {
		$errMsg = Get-ErrorMessage $r
		Write-Host "  Scan failed to initiate (HTTP $($r.StatusCode)): $errMsg" -ForegroundColor Red
		$scanSummary += [PSCustomObject]@{ Database = $db; State = "InitiateFailed"; LastScanTime = "-"; "Rules Passed" = "-"; "Rules Failed" = "-"; "Total Rules" = "-" }
		Write-Host ""
		continue
	}
	Write-Host "  Scan initiated (HTTP 202)." -ForegroundColor Green

	# Brief pause to let the scan result propagate before polling
	Start-Sleep -Seconds 5

	# --- Poll for completion ---
	$elapsed = 5
	$scanState = "Unknown"
	while ($elapsed -lt $ScanTimeoutSeconds) {
		Start-Sleep -Seconds 10
		$elapsed += 10

		$pollUrl = "${opsBase}/scans/latest?api-version=${apiVersion}${dbQuery}"
		$r = Invoke-Api -Method GET -Url $pollUrl
		if ($r.StatusCode -eq 200) {
			$scanState = $r.Body.properties.state
			$lastScanTime = $r.Body.properties.lastScanTime
			Write-Host "  [$elapsed s] state=$scanState"
			if ($scanState -ne "InProgress") { break }
		} else {
			Write-Host "  [$elapsed s] waiting... (HTTP $($r.StatusCode))"
		}
	}

	if ($elapsed -ge $ScanTimeoutSeconds -and $scanState -eq "InProgress") {
		Write-Host "  Timed out after ${ScanTimeoutSeconds}s." -ForegroundColor Yellow
		$scanSummary += [PSCustomObject]@{ Database = $db; State = "Timeout"; LastScanTime = "-"; "Rules Passed" = "-"; "Rules Failed" = "-"; "Total Rules" = "-" }
		Write-Host ""
		continue
	}

	# --- Show results ---
	$r = Invoke-Api -Method GET -Url "${opsBase}/scans/latest?api-version=${apiVersion}${dbQuery}"
	if ($r.StatusCode -eq 200) {
		$scan = $r.Body.properties
		Write-Host "  State        : $($scan.state)"
		Write-Host "  LastScanTime : $($scan.lastScanTime)"
		Write-Host "  Rules Passed : $($scan.totalPassedRulesCount)" -ForegroundColor Green
		Write-Host "  Rules Failed : $($scan.totalFailedRulesCount)" -ForegroundColor $(if ($scan.totalFailedRulesCount -gt 0) { "Red" } else { "Green" })
		Write-Host "    High       : $($scan.highSeverityFailedRulesCount)  Medium: $($scan.mediumSeverityFailedRulesCount)  Low: $($scan.lowSeverityFailedRulesCount)"
		$scanSummary += [PSCustomObject]@{
			Database       = $db
			State          = $scan.state
			LastScanTime   = $scan.lastScanTime
			"Rules Passed" = $scan.totalPassedRulesCount
			"Rules Failed" = $scan.totalFailedRulesCount
			"Total Rules"  = $scan.totalRulesCount
		}
	} else {
		$scanSummary += [PSCustomObject]@{ Database = $db; State = "FetchFailed"; LastScanTime = "-"; "Rules Passed" = "-"; "Rules Failed" = "-"; "Total Rules" = "-" }
	}
	Write-Host ""
}

# =====================================================================
#  Step 4: Scan Results Summary
# =====================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  SCAN SUMMARY" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
$scanSummary | Format-Table -AutoSize

# Collect failed rules per database for baseline management
$dbsWithFailures = @()
foreach ($entry in $scanSummary) {
	if ($entry."Rules Failed" -ne "-" -and [int]$entry."Rules Failed" -gt 0) {
		$dbsWithFailures += $entry.Database
	}
}

if ($dbsWithFailures.Count -eq 0) {
	Write-Host "All databases passed - no failed rules to baseline.`n" -ForegroundColor Green
	exit 0
}

# =====================================================================
#  Step 5: Interactive Baseline Management
# =====================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  BASELINE MANAGEMENT" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Databases with failed rules: $($dbsWithFailures -join ', ')" -ForegroundColor Yellow
Write-Host ""
Write-Host "  How would you like to handle failed rules?" -ForegroundColor Yellow
Write-Host "    [A] Set baseline on ALL failed rules for all databases (accept current state)"
Write-Host "    [R] Review each failed rule and choose individually"
Write-Host "    [S] Skip - do not set any baselines"
Write-Host ""

$choice = $null
while ($choice -notin @("A", "R", "S")) {
	$choice = (Read-Host "  Enter choice (A/R/S)").Trim().ToUpper()
}

if ($choice -eq "S") {
	Write-Host "`n  Skipping baseline management.`n" -ForegroundColor DarkGray
}
elseif ($choice -eq "A") {
	# --- Batch baseline: POST with latestScan=true for each database ---
	Write-Host ""
	foreach ($db in $dbsWithFailures) {
		$dbQuery = "&databaseName=$db"
		$addUrl = "${opsBase}/baselineRules?api-version=${apiVersion}${dbQuery}"
		Write-Host "  Setting baselines for [$db]..." -ForegroundColor Yellow
		Write-Host "    POST $addUrl"
		$body = @{ latestScan = $true; results = @{} } | ConvertTo-Json -Compress
		$r = Invoke-Api -Method POST -Url $addUrl -Body $body
		if ($r.StatusCode -eq 200) {
			$count = @($r.Body.value).Count
			Write-Host "    Baselines set for $count rule(s).`n" -ForegroundColor Green
		} else {
			Write-Host "    Failed (HTTP $($r.StatusCode)): $(Get-ErrorMessage $r)`n" -ForegroundColor Red
		}
	}
}
elseif ($choice -eq "R") {
	# --- Review each failed rule individually ---
	Write-Host ""
	$quitReview = $false
	foreach ($db in $dbsWithFailures) {
		if ($quitReview) { break }

		Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
		Write-Host "  Reviewing failed rules for database: $db" -ForegroundColor Yellow
		Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray

		$dbQuery = "&databaseName=$db"
		$resultsUrl = "${opsBase}/scans/latest/scanResults?api-version=${apiVersion}${dbQuery}"
		$r = Invoke-Api -Method GET -Url $resultsUrl

		if ($r.StatusCode -ne 200) {
			Write-Host "  Failed to fetch scan results (HTTP $($r.StatusCode)): $(Get-ErrorMessage $r)" -ForegroundColor Red
			Write-Host ""
			continue
		}

		$failedRules = @($r.Body.value | Where-Object { $_.properties.status -eq "Finding" })
		if ($failedRules.Count -eq 0) {
			Write-Host "  No failed rules found.`n" -ForegroundColor Green
			continue
		}

		Write-Host "  Found $($failedRules.Count) failed rule(s).`n"

		$baselinedCount = 0
		$skippedCount   = 0

		foreach ($rule in $failedRules) {
			$ruleId   = $rule.name
			$props    = $rule.properties
			$meta     = $props.ruleMetadata
			$severity = if ($meta.severity) { $meta.severity } else { "Unknown" }
			$title    = if ($meta.title)    { $meta.title }    else { "N/A" }

			$sevColor = switch ($severity) {
				"High"   { "Red" }
				"Medium" { "Yellow" }
				"Low"    { "DarkYellow" }
				default  { "White" }
			}

			Write-Host "  ┌─────────────────────────────────────────────────" -ForegroundColor DarkGray
			Write-Host "  │ Database: $db" -ForegroundColor Cyan
			Write-Host "  │ Rule    : $ruleId" -ForegroundColor White
			Write-Host "  │ Severity: $severity" -ForegroundColor $sevColor
			Write-Host "  │ Title   : $title" -ForegroundColor White
			if ($meta.description) {
				Write-Host "  │ Desc    : $($meta.description)" -ForegroundColor Gray
			}
			if ($meta.rationale) {
				Write-Host "  │ Reason  : $($meta.rationale)" -ForegroundColor Gray
			}
			if ($props.queryResults -and $props.queryResults.Count -gt 0) {
				$resultCount = $props.queryResults.Count
				Write-Host "  │ Findings: $resultCount row(s)" -ForegroundColor Gray
				# Show up to 5 rows as a preview
				$preview = [Math]::Min($resultCount, 5)
				for ($i = 0; $i -lt $preview; $i++) {
					$row = $props.queryResults[$i] -join " | "
					Write-Host "  │          $row" -ForegroundColor DarkGray
				}
				if ($resultCount -gt 5) {
					Write-Host "  │          ... and $($resultCount - 5) more row(s)" -ForegroundColor DarkGray
				}
			}
			if ($props.remediation -and $props.remediation.description) {
				Write-Host "  │ Fix     : $($props.remediation.description)" -ForegroundColor Cyan
			}
			Write-Host "  └─────────────────────────────────────────────────" -ForegroundColor DarkGray

			$ruleChoice = $null
			while ($ruleChoice -notin @("Y", "N", "Q")) {
				$ruleChoice = (Read-Host "    Set baseline for ${ruleId}? (Y/N/Q to quit review)").Trim().ToUpper()
			}

			if ($ruleChoice -eq "Q") {
				Write-Host "    Exiting review mode.`n" -ForegroundColor DarkGray
				$quitReview = $true
				break
			}
			elseif ($ruleChoice -eq "Y") {
				$putUrl = "${opsBase}/baselineRules/${ruleId}?api-version=${apiVersion}${dbQuery}"
				$body = @{ latestScan = $true; results = @() } | ConvertTo-Json -Compress
				$r = Invoke-Api -Method PUT -Url $putUrl -Body $body
				if ($r.StatusCode -in @(200, 201)) {
					Write-Host "    Baseline set for $ruleId.`n" -ForegroundColor Green
					$baselinedCount++
				} else {
					Write-Host "    Failed (HTTP $($r.StatusCode)): $(Get-ErrorMessage $r)`n" -ForegroundColor Red
				}
			} else {
				Write-Host "    Skipped $ruleId.`n" -ForegroundColor DarkGray
				$skippedCount++
			}
		}

		Write-Host "  Database [$db]: $baselinedCount baselined, $skippedCount skipped`n" -ForegroundColor Cyan
	}
}

# =====================================================================
#  Step 6: Final Scan Summary
# =====================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  FINAL SCAN SUMMARY" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

$finalSummary = @()
foreach ($db in $databases) {
	$dbQuery = "&databaseName=$db"
	$r = Invoke-Api -Method GET -Url "${opsBase}/scans/latest?api-version=${apiVersion}${dbQuery}"
	if ($r.StatusCode -eq 200) {
		$scan = $r.Body.properties
		$finalSummary += [PSCustomObject]@{
			Database       = $db
			State          = $scan.state
			LastScanTime   = $scan.lastScanTime
			"Rules Passed" = $scan.totalPassedRulesCount
			"Rules Failed" = $scan.totalFailedRulesCount
			"Total Rules"  = $scan.totalRulesCount
		}
	} else {
		$finalSummary += [PSCustomObject]@{ Database = $db; State = "FetchFailed"; LastScanTime = "-"; "Rules Passed" = "-"; "Rules Failed" = "-"; "Total Rules" = "-" }
	}
}
$finalSummary | Format-Table -AutoSize
```

### Enablement failure

If VA settings cannot be enabled (e.g., conflicting configuration), the script displays the error and exits:

```
Step 1: Enable SQL Vulnerability Assessment
  PUT https://management.azure.com/.../sqlVulnerabilityAssessments/default?api-version=2026-04-01-preview
  Failed to enable VA settings (HTTP 400):
	StorageFull API is enabled.
```

### Understand results

| Scan State | Meaning |
|------------|---------|
| `Passed` | Scan completed - no security findings (or all findings are baselined) |
| `Failed` | Scan completed - security findings were detected (not an error) |
| `FailedToRun` | Scan could not execute (e.g., database offline, connectivity issue) |
| `InProgress` | Scan is still running |
| `Timeout` | Script timed out waiting (increase `-ScanTimeoutSeconds`) |
| `InitiateFailed` | Scan could not be started (check error message) |

### Baseline modes

| Mode | Behavior |
|------|----------|
| **[A] All** | Batch-sets baselines on all failed rules for every database with failures. Uses `POST baselineRules` with `latestScan=true`. |
| **[R] Review** | Fetches scan results for each database, displays each failed rule with severity, title, description, rationale, findings preview, and remediation. Prompts `Y/N/Q` per rule (`Q` quits review). Uses `PUT baselineRules/{ruleId}` with `latestScan=true`. |
| **[S] Skip** | No baselines are set. The script displays the final scan summary and exits. |

> [!TIP]
> After baselines are applied, the final summary re-fetches scan state. Baselined rules count as `Passed`, so a database can move from `Failed` to `Passed` without re-scanning.

### Troubleshooting

| Issue | Solution |
|-------|----------|
| `Failed to get token` | Run `az login` to authenticate |
| `Failed to enable VA settings` | Check the error message - common cause is a conflicting VA configuration (e.g., storage-based VA already enabled) |
| `Only server-level resource IDs are supported` | Remove `/databases/<db>` or `/sqlPools/<pool>` from the resource ID |
| Scan returns `FailedToRun` | Verify the database is online and accessible |
| Synapse scan fails | Ensure the SQL pool is in a **resumed** (running) state |
| Timeout on large databases | Increase `-ScanTimeoutSeconds` (e.g., `-ScanTimeoutSeconds 600`) |

## Next step

> [!div class="nextstepaction"]
> [Enable vulnerability assessments on Azure SQL databases with Express Configuration](/azure/defender-for-cloud/powershell-sample-vulnerability-assessment-azure-sql?branch=pr-en-us-2830&tabs=preview)
