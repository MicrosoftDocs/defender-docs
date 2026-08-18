---
title: Migrate from classic Defender for SQL APIs
description: Migrate classic Defender for SQL Vulnerability Assessment and Advanced Threat Protection configurations before the APIs retire.
ms.topic: how-to
ms.date: 08/16/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to migrate from classic Defender for SQL APIs so that my SQL resources continue to use supported security configurations.
ai-usage: ai-assisted
---

# Migrate from classic Defender for SQL APIs

Classic Defender for SQL APIs for Vulnerability Assessment and Advanced Threat Protection will be retired on **August 16, 2027**. If you use these APIs, migrate to the supported configuration model and update any dependent scripts or automation before the retirement date.

This article explains how to identify resources that use the classic APIs and migrate Vulnerability Assessment and Advanced Threat Protection configuration.

## Changes to database-level configuration

Classic APIs support configuring Vulnerability Assessment and Advanced Threat Protection at either the server or database level. The supported API versions use server-level configuration so that protection is applied consistently across databases on the server.

This change doesn't affect billing because Microsoft Defender for SQL charges are based on protected servers rather than individual database settings.

## APIs being retired

### Vulnerability Assessment APIs

| Service | Operation |
|---|---|
| SQL Database | [VA Settings](/rest/api/sql/server-vulnerability-assessments?view=rest-sql-2023-08-01) |
| SQL Database | [VA DB settings](/rest/api/sql/database-vulnerability-assessments?view=rest-sql-2023-08-01) |
| SQL Database | [Baseline operations](/rest/api/sql/database-vulnerability-assessment-rule-baselines?view=rest-sql-2023-08-01) |
| SQL Database | [Scan Operations](/rest/api/sql/database-vulnerability-assessment-scans?view=rest-sql-2023-08-01) |
| Synapse | [VA Settings](/rest/api/synapse/resourcemanager/workspace-managed-sql-server-vulnerability-assessments?view=rest-synapse-resourcemanager-2021-06-01) |
| Synapse | [VA DB settings](/rest/api/synapse/resourcemanager/sql-pool-vulnerability-assessments?view=rest-synapse-resourcemanager-2021-06-01) |
| Synapse | [Baseline operations](/rest/api/synapse/resourcemanager/sql-pool-vulnerability-assessment-rule-baselines?view=rest-synapse-resourcemanager-2021-06-01) |
| Synapse | [Scan Operations](/rest/api/synapse/resourcemanager/sql-pool-vulnerability-assessment-scans?view=rest-synapse-resourcemanager-2021-06-01) |
| Managed Instance | [VA Server settings](/rest/api/sql/managed-instance-vulnerability-assessments?view=rest-sql-2023-08-01) |
| Managed Instance | [VA DB settings](/rest/api/sql/managed-database-vulnerability-assessments?view=rest-sql-2023-08-01) |
| Managed Instance | [Baseline Operations](/rest/api/sql/managed-database-vulnerability-assessment-rule-baselines?view=rest-sql-2023-08-01) |
| Managed Instance | [Scan Operations](/rest/api/sql/managed-database-vulnerability-assessment-scans?view=rest-sql-2023-08-01) |

### Advanced Threat Protection APIs

| Service | Operation |
|---|---|
| SQL Database | [Server Security Alert Policy](/rest/api/sql/server-security-alert-policies?view=rest-sql-2023-08-01) |
| SQL Database | [DB Security Alert Policy](/rest/api/sql/database-security-alert-policies?view=rest-sql-2023-08-01) |
| Synapse | [SQL Pool Security Alert Policy](/rest/api/synapse/resourcemanager/sql-pool-security-alert-policies?view=rest-synapse-resourcemanager-2021-06-01) |
| Synapse | [Server Security Alert Policy](/rest/api/synapse/resourcemanager/workspace-managed-sql-server-security-alert-policy?view=rest-synapse-resourcemanager-2021-06-01) |
| Managed Instance | [Server Security Alert Policy](/rest/api/sql/managed-server-security-alert-policies?view=rest-sql-2023-08-01) |
| Managed Instance | [DB Security Alert Policy](/rest/api/sql/managed-database-security-alert-policies?view=rest-sql-2023-08-01) |

## Identify resources using classic APIs

Use `AuditClassicPolicies.ps1` to identify Azure SQL resources that use classic Vulnerability Assessment or Advanced Threat Protection APIs.

The script checks:

- Azure SQL Database logical servers
- Azure SQL Managed Instances
- Azure Synapse Analytics workspaces

The script is read-only and doesn't change resource configuration.

### Prerequisites

Before you run the script, make sure you have:

- PowerShell 7 or later.
- Azure PowerShell `Az.Accounts` module version 2.9.1 or later.
- At least Reader access to the subscription you want to audit.

To install or update the `Az.Accounts` module, run:

```powershell
Install-Module Az.Accounts -Scope CurrentUser -MinimumVersion 2.9.1
```
You don't need to run `Connect-AzAccount` before you run the script. If you aren't already signed in, the script prompts you to sign in.

### Run the audit script

1. Copy `AuditClassicPolicies.ps1` from the following section and save it locally as `AuditClassicPolicies.ps1`.

1. Run the script:

   ```powershell
   .\AuditClassicPolicies.ps1
   ```

   If you aren't signed in, the script prompts you to sign in. If your account has access to multiple subscriptions, select the subscription you want to audit.

1. To audit a specific subscription, run:

   ```powershell
   .\AuditClassicPolicies.ps1 -SubscriptionId "<subscription-ID>"
   ```

By default, the script displays progress and a final summary.

### Review the audit results

The script reports the number of resources scanned, the number that don't use classic APIs, and the number that require migration.

If affected resources are found, the script creates a CSV report that contains only the resources that require action. If no affected resources are found, no CSV report is created.

The CSV report contains the following information:

| Column | Description |
|---|---|
| `SubscriptionId` | Subscription that contains the resource. |
| `ServerName` | Name of the SQL server, SQL Managed Instance, or Synapse workspace. |
| `ResourceType` | Resource type. |
| `ResourceGroup` | Resource group that contains the resource. |
| `ServerLevelClassicVaPolicy` | Indicates whether classic Vulnerability Assessment is configured at the server or workspace level. |
| `ServerLevelClassicAtpPolicy` | Indicates whether classic Advanced Threat Protection is configured at the server or workspace level. |
| `DbLevelVaPolicy` | Indicates whether a database or SQL pool uses classic Vulnerability Assessment configuration. |
| `DbLevelAtpPolicy` | Indicates whether a database or SQL pool uses classic Advanced Threat Protection configuration. |
| `DatabasesWithVaPolicy` | Databases or SQL pools that use classic Vulnerability Assessment configuration. |
| `DatabasesWithAtpPolicy` | Databases or SQL pools that use classic Advanced Threat Protection configuration. |

### AuditClassicPolicies.ps1

```powershell
#Requires -Modules @{ ModuleName="Az.Accounts"; ModuleVersion="2.9.1" }
#Requires -Version 7.0

<#
.SYNOPSIS
    Audits a subscription for usage of the classic SQL Vulnerability Assessment
    and Advanced Threat Protection (ATP) APIs across SQL Server, SQL Managed Instance, and Synapse.

.DESCRIPTION
    For the given subscription, discovers all:
      - Azure SQL logical servers   (Microsoft.Sql/servers)
      - SQL Managed Instances       (Microsoft.Sql/managedInstances)
      - Synapse workspaces          (Microsoft.Synapse/workspaces)

    Synapse's own auto-provisioned backing SQL server (kind contains "analytics", living in a
    system "synapseworkspace-managedrg-*" resource group) is excluded from the SQL Server list
    - it is not a customer-managed resource and is already covered via the Synapse workspace
    entry itself.

    For each resource, this script checks whether the Classic APIs are still
    configured (i.e. return a real, non-default policy):
      - Classic VA policy               (.../vulnerabilityAssessments/default)
      - Classic Security Alert Policy   (.../securityAlertPolicies/Default) - the classic
        ATP API (NOT the newer advancedThreatProtectionSettings API). A policy is treated as
        "configured" only if it shows a concrete configuration signal: a storage endpoint is
        set, real notification email addresses are set, emailAccountAdmins is on, or specific
        alert categories are disabled. `state == Enabled` alone is NOT sufficient - Defender for
        SQL can report state=Enabled even when the classic policy was never actively used.

    It then enumerates all child databases / SQL pools and checks the same two policies at
    the database level, recording which specific databases have a Classic VA and/or Classic
    Security Alert Policy configured.

    These are exactly the API surfaces listed for deprecation:
      VA:  Server/DB Vulnerability Assessments, Baselines, Scans (SQL DB, MI, Synapse)
      ATP: Server/DB Security Alert Policies (SQL DB, MI, Synapse)

    No changes are made - this script is read-only. The CSV report only includes resources
    that need attention (a Classic VA and/or ATP policy configured somewhere, at the
    server/workspace level or a database/pool level) - fully clean resources are omitted from
    the report but included in the console summary count.

.PARAMETER SubscriptionId
    The subscription to audit (GUID or subscription name). If you don't know it, run this
    script without the parameter set and it will prompt you to sign in and pick one.

.PARAMETER OutputPath
    Path to the CSV report. Defaults to
    ".\ClassicPolicyAudit_<subscriptionId>_<yyyyMMdd_HHmmss>.csv" in the current directory.

.PARAMETER ShowDetails
    Show a verbose, per-resource trace of every check performed (useful for troubleshooting).
    By default the script only prints a compact progress bar and a final summary.

.EXAMPLE
    .\AuditClassicPolicies.ps1 -SubscriptionId "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"

.EXAMPLE
    .\AuditClassicPolicies.ps1 -SubscriptionId "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee" -OutputPath "C:\reports\audit.csv"

.NOTES
    This script is READ-ONLY - it only performs GET requests and never modifies any resource.
    You need at least Reader access on the subscription to run it.
#>

param(
    [string]$SubscriptionId,

    [string]$OutputPath,

    [switch]$ShowDetails
)

$ErrorActionPreference = "Stop"

# Classic API versions per resource type - same surface as the migration script.
$ClassicApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01"
}

# ARM API versions for listing resources / children.
$ListApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01-preview"
}

# ======================================================================
#region --- Logging helpers ---
# ======================================================================

function Write-Log {
    param([string]$Message)
    Write-Host ("{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message)
}

function Write-LogError {
    param([string]$Message)
    Write-Host ("{0} - ERROR: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor Red
}

function Write-LogDetail {
    param([string]$Message)
    if ($ShowDetails) {
        Write-Host ("{0}   {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor DarkGray
    }
}

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host ([string]::new([char]0x2501, 60)) -ForegroundColor Cyan
    Write-Host "  $Title" -ForegroundColor Cyan
    Write-Host ([string]::new([char]0x2501, 60)) -ForegroundColor Cyan
}

#endregion

# ======================================================================
#region --- REST helper ---
# ======================================================================

function Invoke-ArmRequest {
    param(
        [string]$Method,
        [string]$Path
    )

    $resp = Invoke-AzRestMethod -Method $Method -Path $Path
    return $resp
}

# GET a resource and return its parsed JSON content, or $null on any non-200 / parse failure.
function Get-ArmJson {
    param([string]$Path)

    try {
        $resp = Invoke-ArmRequest -Method GET -Path $Path
        if ($resp.StatusCode -eq 200) {
            return ($resp.Content | ConvertFrom-Json)
        }
    }
    catch {
        Write-LogDetail "  GET failed for $Path : $($_.Exception.Message)"
    }
    return $null
}

# Follows nextLink pagination for ARM list responses.
function Get-ArmListAll {
    param([string]$Path)

    $items = @()
    $uri = $Path
    while ($uri) {
        $resp = Invoke-ArmRequest -Method GET -Path $uri
        if ($resp.StatusCode -ne 200) { break }
        $content = $resp.Content | ConvertFrom-Json
        if ($content.value) { $items += $content.value }
        $uri = $content.nextLink
    }
    return $items
}

#endregion

# ======================================================================
#region --- Classic policy existence checks ---
# ======================================================================

# A Classic VA policy is considered "configured" only if storageContainerPath is set -
# the Default resource can return HTTP 200 with empty properties even when never configured.
function Test-ClassicVaConfigured {
    param([string]$Path)

    $content = Get-ArmJson -Path $Path
    if (-not $content) { return $false }
    return -not [string]::IsNullOrEmpty($content.properties.storageContainerPath)
}

# A Classic Security Alert Policy (classic ATP API) is considered "configured" only if it
# shows a REAL, concrete configuration signal - `state == Enabled` alone is NOT sufficient,
# since Defender for SQL can report state=Enabled at the server even when the classic policy
# was never actively configured (no storage, no emails, nothing customized). Both `emailAddresses`
# and `disabledAlerts` can come back as a single-element array containing an empty string (`[""]`)
# when unset - that must NOT be treated as "configured". Storage and emails are independent of
# each other (a policy may have only one, only the other, both, or neither). Treated as
# configured if any of the following concrete signals is true:
#   - a storage endpoint is set (custom Threat Detection log storage), OR
#   - one or more real (non-empty) notification email addresses are set, OR
#   - "email service and co-administrators" (emailAccountAdmins) is turned on, OR
#   - one or more real (non-empty) alert categories have been explicitly disabled (disabledAlerts)
#
# At SERVER level, `state == Enabled` alone is NOT used as a signal, because Defender for SQL
# can set server-wide `state:Enabled` with no other legacy config actually present (false positive).
# At DATABASE level however, an explicit per-DB policy resource with `state:Enabled` IS a genuine
# sign of legacy per-database Classic ATP configuration (Defender for SQL does not create these
# per-DB overrides on its own) - so for DB-level checks, `state == Enabled` is also treated as
# "configured", in addition to the storage/email/disabledAlerts signals above.
function Test-ClassicAtpConfigured {
    param(
        [string]$Path,
        [switch]$IsDbLevel
    )

    $content = Get-ArmJson -Path $Path
    if (-not $content) { return $false }

    $props = $content.properties
    if (-not $props) { return $false }

    if (-not [string]::IsNullOrEmpty($props.storageEndpoint)) { return $true }
    if ($props.emailAddresses -and @($props.emailAddresses | Where-Object { $_ }).Count -gt 0) { return $true }
    if ($props.emailAccountAdmins -eq $true) { return $true }
    if ($props.disabledAlerts -and @($props.disabledAlerts | Where-Object { $_ }).Count -gt 0) { return $true }
    if ($IsDbLevel -and $props.state -eq "Enabled") { return $true }

    return $false
}

#endregion

# ======================================================================
#region --- Resource discovery ---
# ======================================================================

function Get-AllSqlServers {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Sql/servers?api-version=$($ListApiVersions.SqlServer)"
    $servers = Get-ArmListAll -Path $path

    # Synapse workspaces auto-provision a hidden backing SQL logical server (in a system
    # "synapseworkspace-managedrg-*" resource group) to host the built-in serverless / dedicated
    # SQL pools. These are not customer-managed servers and are already covered by the Synapse
    # workspace audit itself, so they are excluded here. They are identifiable by `kind`
    # containing "analytics" (e.g. "v12.0,analytics"), unlike regular servers ("v12.0").
    return $servers | Where-Object { $_.kind -notmatch "analytics" }
}

function Get-AllManagedInstances {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Sql/managedInstances?api-version=$($ListApiVersions.SqlManagedInstance)"
    return Get-ArmListAll -Path $path
}

function Get-AllSynapseWorkspaces {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Synapse/workspaces?api-version=$($ListApiVersions.Synapse)"
    return Get-ArmListAll -Path $path
}

# Returns database/pool names for a given resource (excludes 'master' for SqlServer, matches
# the same conventions used by the migration script).
function Get-ChildDatabaseNames {
    param(
        [string]$ResourceType,
        [string]$ResourceId
    )

    $names = @()
    $listApiVersion = $ListApiVersions[$ResourceType]

    switch ($ResourceType) {
        "SqlServer" {
            $items = Get-ArmListAll -Path "$ResourceId/databases?api-version=$listApiVersion"
            foreach ($db in $items) { if ($db.name -ne "master") { $names += $db.name } }
        }
        "SqlManagedInstance" {
            $items = Get-ArmListAll -Path "$ResourceId/databases?api-version=$listApiVersion"
            foreach ($db in $items) { $names += $db.name }
        }
        "Synapse" {
            $items = Get-ArmListAll -Path "$ResourceId/sqlPools?api-version=$listApiVersion"
            foreach ($pool in $items) { $names += $pool.name }
        }
    }

    return $names
}

#endregion

# ======================================================================
#region --- Per-resource audit ---
# ======================================================================

function Invoke-ResourceAudit {
    param(
        [string]$SubscriptionId,
        [string]$ResourceType,
        [string]$ResourceId,
        [string]$ResourceName,
        [string]$ResourceGroup
    )

    Write-LogDetail "Auditing $ResourceType '$ResourceName' (RG: $ResourceGroup)..."
    $classicApiVersion = $ClassicApiVersions[$ResourceType]

    # --- Server/workspace-level VA & ATP paths ---
    $vaServerPath  = "$ResourceId/vulnerabilityAssessments/default?api-version=$classicApiVersion"
    $atpServerPath = "$ResourceId/securityAlertPolicies/Default?api-version=$classicApiVersion"

    $hasServerVa  = Test-ClassicVaConfigured -Path $vaServerPath
    $hasServerAtp = Test-ClassicAtpConfigured -Path $atpServerPath

    Write-LogDetail "  Server VA configured : $hasServerVa"
    Write-LogDetail "  Server ATP configured: $hasServerAtp"

    # --- Discover databases / SQL pools ---
    $dbNames = Get-ChildDatabaseNames -ResourceType $ResourceType -ResourceId $ResourceId

    # SqlServer keeps a separate 'master' database that is not returned by the databases list.
    if ($ResourceType -eq "SqlServer") { $dbNames = @("master") + $dbNames }

    $dbsWithVa  = @()
    $dbsWithAtp = @()

    foreach ($db in $dbNames) {
        $childSegment = if ($ResourceType -eq "Synapse") { "sqlPools/$db" } else { "databases/$db" }
        $vaDbPath  = "$ResourceId/$childSegment/vulnerabilityAssessments/default?api-version=$classicApiVersion"
        $atpDbPath = "$ResourceId/$childSegment/securityAlertPolicies/Default?api-version=$classicApiVersion"

        if (Test-ClassicVaConfigured -Path $vaDbPath)   { $dbsWithVa  += $db }
        if (Test-ClassicAtpConfigured -Path $atpDbPath -IsDbLevel) { $dbsWithAtp += $db }
    }

    if ($dbsWithVa.Count -gt 0)  { Write-LogDetail "  DB-level VA policy on : $($dbsWithVa -join ', ')" }
    if ($dbsWithAtp.Count -gt 0) { Write-LogDetail "  DB-level ATP policy on: $($dbsWithAtp -join ', ')" }

    $friendlyType = switch ($ResourceType) {
        "SqlServer"          { "Azure SQL Database server" }
        "SqlManagedInstance" { "Azure SQL Managed Instance" }
        "Synapse"             { "Azure Synapse workspace" }
        default               { $ResourceType }
    }

    return [PSCustomObject]@{
        SubscriptionId        = $SubscriptionId
        ServerName            = $ResourceName
        ResourceType          = $friendlyType
        ResourceGroup         = $ResourceGroup
        ServerLevelClassicVaPolicy  = if ($hasServerVa)  { "Yes" } else { "No" }
        ServerLevelClassicAtpPolicy = if ($hasServerAtp) { "Yes" } else { "No" }
        DbLevelVaPolicy       = if ($dbsWithVa.Count -gt 0)  { "Yes" } else { "No" }
        DbLevelAtpPolicy      = if ($dbsWithAtp.Count -gt 0) { "Yes" } else { "No" }
        DatabasesWithVaPolicy = if ($dbsWithVa.Count -gt 0)  { $dbsWithVa  -join ";" } else { "-" }
        DatabasesWithAtpPolicy= if ($dbsWithAtp.Count -gt 0) { $dbsWithAtp -join ";" } else { "-" }
    }
}

#endregion


# ======================================================================
# ======================================================================
#  MAIN FLOW
# ======================================================================
# ======================================================================

Write-Host ""
Write-Host "  AuditClassicPolicies.ps1 - SQL Classic VA / ATP Policy Audit" -ForegroundColor Magenta
Write-Host "  This tool checks whether your Azure SQL Database, Managed Instance, and Synapse" -ForegroundColor Magenta
Write-Host "  resources still rely on the classic Vulnerability Assessment and" -ForegroundColor Magenta
Write-Host "  Advanced Threat Protection APIs, which are being retired." -ForegroundColor Magenta
Write-Host "  This script is READ-ONLY: it does not change any settings." -ForegroundColor Magenta
Write-Host "  Requires at least Reader access on the subscription being audited." -ForegroundColor Magenta
Write-Host ""

# --- Sign in if needed (no manual Connect-AzAccount required) ---
$context = Get-AzContext
if (-not $context -or -not $context.Account) {
    Write-Log "You are not signed in to Azure. Opening a sign-in prompt..."
    try {
        Connect-AzAccount -ErrorAction Stop | Out-Null
        $context = Get-AzContext
    }
    catch {
        Write-LogError "Sign-in failed: $($_.Exception.Message)"
        return
    }
}
Write-Log "Signed in as: $($context.Account.Id)"

# --- Pick a subscription if one wasn't supplied ---
if (-not $SubscriptionId) {
    $subs = Get-AzSubscription | Sort-Object Name
    if ($subs.Count -eq 0) {
        Write-LogError "No subscriptions are visible to this account."
        return
    }
    elseif ($subs.Count -eq 1) {
        $SubscriptionId = $subs[0].Id
        Write-Log "Only one subscription found - using '$($subs[0].Name)' ($SubscriptionId)."
    }
    else {
        Write-Host ""
        Write-Host "  Multiple subscriptions found. Please choose one:" -ForegroundColor Yellow
        for ($idx = 0; $idx -lt $subs.Count; $idx++) {
            Write-Host ("    [{0}] {1}  ({2})" -f ($idx + 1), $subs[$idx].Name, $subs[$idx].Id)
        }
        do {
            $choice = Read-Host "  Enter a number (1-$($subs.Count))"
        } while (-not ($choice -as [int]) -or [int]$choice -lt 1 -or [int]$choice -gt $subs.Count)
        $SubscriptionId = $subs[[int]$choice - 1].Id
    }
}

if (-not $OutputPath) {
    $timestamp  = Get-Date -Format "yyyyMMdd_HHmmss"
    $OutputPath = ".\ClassicPolicyAudit_${SubscriptionId}_${timestamp}.csv"
}

Write-Log "Switching subscription context to $SubscriptionId..."
try {
    $null = Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop
}
catch {
    Write-LogError "Could not access subscription '$SubscriptionId'. Check the ID and your permissions."
    return
}

$__subDisplayName = (Get-AzSubscription -SubscriptionId $SubscriptionId -ErrorAction SilentlyContinue).Name
Write-Host ""
Write-Host "  AuditClassicPolicies.ps1 - Subscription: $SubscriptionId$(if ($__subDisplayName) { " ($__subDisplayName)" })" -ForegroundColor Magenta
Write-Host ""

# ======================================================================
#  Discover resources
# ======================================================================
Write-Section "Discovering Resources"

$targets = @()

Write-Log "Listing SQL servers..."
foreach ($s in Get-AllSqlServers -SubId $SubscriptionId) {
    $targets += @{ ResourceType = "SqlServer"; ResourceId = $s.id; ResourceName = $s.name; ResourceGroup = ($s.id -split "/")[4] }
}

Write-Log "Listing SQL Managed Instances..."
foreach ($mi in Get-AllManagedInstances -SubId $SubscriptionId) {
    $targets += @{ ResourceType = "SqlManagedInstance"; ResourceId = $mi.id; ResourceName = $mi.name; ResourceGroup = ($mi.id -split "/")[4] }
}

Write-Log "Listing Synapse workspaces..."
foreach ($ws in Get-AllSynapseWorkspaces -SubId $SubscriptionId) {
    $targets += @{ ResourceType = "Synapse"; ResourceId = $ws.id; ResourceName = $ws.name; ResourceGroup = ($ws.id -split "/")[4] }
}

Write-Log "Found $($targets.Count) resource(s) to audit: $(($targets | Group-Object { $_.ResourceType } | ForEach-Object { "$($_.Name)=$($_.Count)" }) -join ', ')"

if ($targets.Count -eq 0) {
    Write-LogError "No SQL servers, Managed Instances, or Synapse workspaces found in this subscription."
    return
}

# ======================================================================
#  Audit each resource
# ======================================================================
Write-Section "Auditing Classic VA / ATP Policies"

$results = @()
$i = 0
foreach ($t in $targets) {
    $i++
    Write-Progress -Activity "Auditing resources" -Status "$($t.ResourceName) ($i/$($targets.Count))" -PercentComplete ([int](($i / $targets.Count) * 100))

    try {
        $results += Invoke-ResourceAudit -SubscriptionId $SubscriptionId -ResourceType $t.ResourceType -ResourceId $t.ResourceId `
            -ResourceName $t.ResourceName -ResourceGroup $t.ResourceGroup
    }
    catch {
        Write-LogError "Failed to audit '$($t.ResourceName)': $($_.Exception.Message)"
    }
}
Write-Progress -Activity "Auditing resources" -Completed

# ======================================================================
#  Export CSV
# ======================================================================
Write-Section "Exporting Report"

# Only resources that need attention (a Classic VA and/or ATP policy configured somewhere -
# server/workspace level or database/pool level) are written to the CSV. Fully clean resources
# are counted in the summary log below but omitted from the report.
$needsAttention = $results | Where-Object {
    $_.ServerLevelClassicVaPolicy -eq "Yes" -or $_.ServerLevelClassicAtpPolicy -eq "Yes" -or
    $_.DbLevelVaPolicy -eq "Yes" -or $_.DbLevelAtpPolicy -eq "Yes"
}

$needsAttention | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8
if ($needsAttention.Count -eq 0 -and (Test-Path $OutputPath)) { Remove-Item $OutputPath -Force }

$serversWithClassic = @($needsAttention).Count
$cleanCount = $results.Count - $serversWithClassic

Write-Section "Summary"
Write-Host ("  Total resources scanned      : {0}" -f $results.Count)
Write-Host ("  Already fully migrated        : {0}" -f $cleanCount) -ForegroundColor Green
Write-Host ("  Need attention (using legacy) : {0}" -f $serversWithClassic) -ForegroundColor $(if ($serversWithClassic -gt 0) { "Yellow" } else { "Green" })
Write-Host ""

if ($serversWithClassic -gt 0) {
    Write-Host "  The report below lists only the resources that still need attention." -ForegroundColor Yellow
    Write-Host "  Report file: $OutputPath" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  What to do next:" -ForegroundColor Yellow
    Write-Host "   - Follow the official Microsoft documentation to migrate away from the classic" -ForegroundColor Yellow
    Write-Host "     Vulnerability Assessment and Advanced Threat Protection APIs." -ForegroundColor Yellow
    Write-Host ""
}
else {
    Write-Host "  Great news - no resources in this subscription are using the Classic" -ForegroundColor Green
    Write-Host "  Vulnerability Assessment or Advanced Threat Protection APIs. No report file was written." -ForegroundColor Green
    Write-Host ""
}
```

### Inspect Advanced Threat Protection policy settings

If you need to review existing classic Advanced Threat Protection configuration before you migrate, use the following read-only scripts.

#### Inspect server-level policy settings

Use `Get-ServerAtpPolicy.ps1` to inspect classic Advanced Threat Protection configuration for a SQL server, SQL Managed Instance, or Synapse workspace.

```powershell
#Requires -Modules @{ ModuleName="Az.Accounts"; ModuleVersion="2.9.1" }
#Requires -Version 7.0

<#
.SYNOPSIS
    Shows the current (classic) Security Alert Policy / Advanced Threat Protection
    configuration for a SQL Server, SQL Managed Instance, or Synapse workspace - at the
    SERVER/WORKSPACE level.

.DESCRIPTION
    Read-only. Retrieves and displays the raw Security Alert Policy settings (state, storage
    endpoint, notification email addresses, email account admins, disabled alert categories)
    for the given resource, so you can see exactly what is currently configured before deciding
    whether to migrate.

    This does not change anything.

.PARAMETER SubscriptionId
    The subscription containing the resource. If omitted, you'll be prompted to sign in and
    pick one.

.PARAMETER ResourceType
    One of: SqlServer, SqlManagedInstance, Synapse.

.PARAMETER ResourceName
    The name of the server / managed instance / Synapse workspace.

.PARAMETER ResourceGroup
    The resource group containing the resource.

.EXAMPLE
    .\Get-ServerAtpPolicy.ps1 -SubscriptionId "aaaa-bbbb-cccc-dddd" -ResourceType SqlManagedInstance -ResourceName testmig-sqlmi -ResourceGroup TestMigrationScript

.NOTES
    Read-only - only performs GET requests. Requires at least Reader access.
#>

param(
    [string]$SubscriptionId,

    [Parameter(Mandatory = $true)]
    [ValidateSet("SqlServer", "SqlManagedInstance", "Synapse")]
    [string]$ResourceType,

    [Parameter(Mandatory = $true)]
    [string]$ResourceName,

    [Parameter(Mandatory = $true)]
    [string]$ResourceGroup
)

$ErrorActionPreference = "Stop"

# Classic API versions per resource type.
$ClassicApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01"
}

Write-Host ""
Write-Host "  Get-ServerAtpPolicy.ps1 - Server/Workspace-level Security Alert Policy Viewer" -ForegroundColor Magenta
Write-Host "  Read-only: does not change any settings." -ForegroundColor Magenta
Write-Host ""

# --- Sign in if needed ---
$context = Get-AzContext
if (-not $context -or -not $context.Account) {
    Write-Host "You are not signed in to Azure. Opening a sign-in prompt..."
    try {
        Connect-AzAccount -ErrorAction Stop | Out-Null
        $context = Get-AzContext
    }
    catch {
        Write-Host "Sign-in failed: $($_.Exception.Message)" -ForegroundColor Red
        return
    }
}

# --- Pick a subscription if one wasn't supplied ---
if (-not $SubscriptionId) {
    $subs = Get-AzSubscription | Sort-Object Name
    if ($subs.Count -eq 0) {
        Write-Host "No subscriptions are visible to this account." -ForegroundColor Red
        return
    }
    elseif ($subs.Count -eq 1) {
        $SubscriptionId = $subs[0].Id
    }
    else {
        Write-Host "  Multiple subscriptions found. Please choose one:" -ForegroundColor Yellow
        for ($idx = 0; $idx -lt $subs.Count; $idx++) {
            Write-Host ("    [{0}] {1}  ({2})" -f ($idx + 1), $subs[$idx].Name, $subs[$idx].Id)
        }
        do {
            $choice = Read-Host "  Enter a number (1-$($subs.Count))"
        } while (-not ($choice -as [int]) -or [int]$choice -lt 1 -or [int]$choice -gt $subs.Count)
        $SubscriptionId = $subs[[int]$choice - 1].Id
    }
}

$null = Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop

# --- Resolve the resource ID ---
$listApiVersion = $ClassicApiVersions[$ResourceType]
$providerPath = switch ($ResourceType) {
    "SqlServer"          { "Microsoft.Sql/servers" }
    "SqlManagedInstance" { "Microsoft.Sql/managedInstances" }
    "Synapse"            { "Microsoft.Synapse/workspaces" }
}

$resourcePath = "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/$providerPath/${ResourceName}?api-version=$listApiVersion"
$resourceResp = Invoke-AzRestMethod -Method GET -Path $resourcePath
if ($resourceResp.StatusCode -ne 200) {
    Write-Host "Could not find $ResourceType '$ResourceName' in resource group '$ResourceGroup'." -ForegroundColor Red
    return
}
$resourceId = ($resourceResp.Content | ConvertFrom-Json).id

# --- Get the server/workspace-level Security Alert Policy ---
$classicApiVersion = $ClassicApiVersions[$ResourceType]
$atpPath = "$resourceId/securityAlertPolicies/Default?api-version=$classicApiVersion"
$resp = Invoke-AzRestMethod -Method GET -Path $atpPath

if ($resp.StatusCode -ne 200) {
    Write-Host "Could not retrieve the Security Alert Policy for '$ResourceName' (HTTP $($resp.StatusCode))." -ForegroundColor Red
    return
}

$policy = ($resp.Content | ConvertFrom-Json).properties

Write-Host "Security Alert Policy for $ResourceType '$ResourceName' (server/workspace level):" -ForegroundColor Cyan
Write-Host ""
[PSCustomObject]@{
    State                = $policy.state
    StorageEndpoint       = if ([string]::IsNullOrEmpty($policy.storageEndpoint)) { "(not set)" } else { $policy.storageEndpoint }
    EmailAddresses        = $(
        $emails = @($policy.emailAddresses | Where-Object { $_ })
        if ($emails.Count -gt 0) { $emails -join "; " } else { "(none)" }
    )
    EmailAccountAdmins    = $policy.emailAccountAdmins
    DisabledAlerts        = $(
        $alerts = @($policy.disabledAlerts | Where-Object { $_ })
        if ($alerts.Count -gt 0) { $alerts -join "; " } else { "(none disabled)" }
    )
    RetentionDays         = $policy.retentionDays
} | Format-List
```

#### Inspect database-level policy settings

Use `Get-DatabaseAtpPolicy.ps1` to inspect classic Advanced Threat Protection configuration for a database or Synapse SQL pool.

```powershell
#Requires -Modules @{ ModuleName="Az.Accounts"; ModuleVersion="2.9.1" }
#Requires -Version 7.0

<#
.SYNOPSIS
    Shows the current (classic) Security Alert Policy configuration for a single DATABASE
    (or Synapse SQL pool), i.e. the per-database Advanced Threat Protection override.

.DESCRIPTION
    Read-only. Retrieves and displays the raw Security Alert Policy settings (state, storage
    endpoint, notification email addresses, email account admins, disabled alert categories)
    for the given database / SQL pool, so you can see exactly what is currently configured
    before deciding whether to migrate or remove the per-database override.

    This does not change anything.

.PARAMETER SubscriptionId
    The subscription containing the resource. If omitted, you'll be prompted to sign in and
    pick one.

.PARAMETER ResourceType
    One of: SqlServer, SqlManagedInstance, Synapse.

.PARAMETER ResourceName
    The name of the server / managed instance / Synapse workspace.

.PARAMETER ResourceGroup
    The resource group containing the resource.

.PARAMETER DatabaseName
    The database name (or SQL pool name, for Synapse).

.EXAMPLE
    .\Get-DatabaseAtpPolicy.ps1 -SubscriptionId "aaaa-bbbb-cccc-dddd" -ResourceType SqlManagedInstance -ResourceName testmig-sqlmi -ResourceGroup TestMigrationScript -DatabaseName testdb

.NOTES
    Read-only - only performs GET requests. Requires at least Reader access.
#>

param(
    [string]$SubscriptionId,

    [Parameter(Mandatory = $true)]
    [ValidateSet("SqlServer", "SqlManagedInstance", "Synapse")]
    [string]$ResourceType,

    [Parameter(Mandatory = $true)]
    [string]$ResourceName,

    [Parameter(Mandatory = $true)]
    [string]$ResourceGroup,

    [Parameter(Mandatory = $true)]
    [string]$DatabaseName
)

$ErrorActionPreference = "Stop"

# Classic API versions per resource type.
$ClassicApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01"
}

Write-Host ""
Write-Host "  Get-DatabaseAtpPolicy.ps1 - Database-level Security Alert Policy Viewer" -ForegroundColor Magenta
Write-Host "  Read-only: does not change any settings." -ForegroundColor Magenta
Write-Host ""

# --- Sign in if needed ---
$context = Get-AzContext
if (-not $context -or -not $context.Account) {
    Write-Host "You are not signed in to Azure. Opening a sign-in prompt..."
    try {
        Connect-AzAccount -ErrorAction Stop | Out-Null
        $context = Get-AzContext
    }
    catch {
        Write-Host "Sign-in failed: $($_.Exception.Message)" -ForegroundColor Red
        return
    }
}

# --- Pick a subscription if one wasn't supplied ---
if (-not $SubscriptionId) {
    $subs = Get-AzSubscription | Sort-Object Name
    if ($subs.Count -eq 0) {
        Write-Host "No subscriptions are visible to this account." -ForegroundColor Red
        return
    }
    elseif ($subs.Count -eq 1) {
        $SubscriptionId = $subs[0].Id
    }
    else {
        Write-Host "  Multiple subscriptions found. Please choose one:" -ForegroundColor Yellow
        for ($idx = 0; $idx -lt $subs.Count; $idx++) {
            Write-Host ("    [{0}] {1}  ({2})" -f ($idx + 1), $subs[$idx].Name, $subs[$idx].Id)
        }
        do {
            $choice = Read-Host "  Enter a number (1-$($subs.Count))"
        } while (-not ($choice -as [int]) -or [int]$choice -lt 1 -or [int]$choice -gt $subs.Count)
        $SubscriptionId = $subs[[int]$choice - 1].Id
    }
}

$null = Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop

# --- Resolve the resource ID ---
$listApiVersion = $ClassicApiVersions[$ResourceType]
$providerPath = switch ($ResourceType) {
    "SqlServer"          { "Microsoft.Sql/servers" }
    "SqlManagedInstance" { "Microsoft.Sql/managedInstances" }
    "Synapse"            { "Microsoft.Synapse/workspaces" }
}

$resourcePath = "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/$providerPath/${ResourceName}?api-version=$listApiVersion"
$resourceResp = Invoke-AzRestMethod -Method GET -Path $resourcePath
if ($resourceResp.StatusCode -ne 200) {
    Write-Host "Could not find $ResourceType '$ResourceName' in resource group '$ResourceGroup'." -ForegroundColor Red
    return
}
$resourceId = ($resourceResp.Content | ConvertFrom-Json).id

# --- Get the database/pool-level Security Alert Policy ---
$classicApiVersion = $ClassicApiVersions[$ResourceType]
$childSegment = if ($ResourceType -eq "Synapse") { "sqlPools/$DatabaseName" } else { "databases/$DatabaseName" }
$atpPath = "$resourceId/$childSegment/securityAlertPolicies/Default?api-version=$classicApiVersion"
$resp = Invoke-AzRestMethod -Method GET -Path $atpPath

if ($resp.StatusCode -ne 200) {
    $label = if ($ResourceType -eq "Synapse") { "SQL pool" } else { "database" }
    Write-Host "Could not retrieve the Security Alert Policy for $label '$DatabaseName' on '$ResourceName' (HTTP $($resp.StatusCode))." -ForegroundColor Red
    return
}

$policy = ($resp.Content | ConvertFrom-Json).properties
$label = if ($ResourceType -eq "Synapse") { "SQL pool" } else { "database" }

Write-Host "Security Alert Policy for $label '$DatabaseName' on $ResourceType '$ResourceName':" -ForegroundColor Cyan
Write-Host ""
[PSCustomObject]@{
    State                = $policy.state
    StorageEndpoint       = if ([string]::IsNullOrEmpty($policy.storageEndpoint)) { "(not set)" } else { $policy.storageEndpoint }
    EmailAddresses        = $(
        $emails = @($policy.emailAddresses | Where-Object { $_ })
        if ($emails.Count -gt 0) { $emails -join "; " } else { "(none)" }
    )
    EmailAccountAdmins    = $policy.emailAccountAdmins
    DisabledAlerts        = $(
        $alerts = @($policy.disabledAlerts | Where-Object { $_ })
        if ($alerts.Count -gt 0) { $alerts -join "; " } else { "(none disabled)" }
    )
    RetentionDays         = $policy.retentionDays
} | Format-List

```

## Migrate Advanced Threat Protection configuration

Some configuration properties available in the classic Advanced Threat Protection APIs aren't available in the supported API. Use the following alternatives for these capabilities:

| Capability | Classic API property | Alternative |
|---|---|---|
| Disable specific alerts | `properties.disabledAlerts` | [Suppress alerts from Microsoft Defender for Cloud](alerts-suppression-rules.md) |
| Email notifications | `properties.emailAccountAdmins`, `properties.emailAddresses` | [Configure email notifications for security alerts](configure-email-notifications.md) |
| Export alerts to storage | `properties.retentionDays`, `properties.storageAccountAccessKey`, `properties.storageEndpoint` | Use [continuous export](continuous-export.md) and optionally [export Event Hubs data to Azure Storage](/azure/event-hubs/event-hubs-capture-enable-through-portal#capture-data-to-azure-storage). |

For database-level classic Advanced Threat Protection configuration, the migration scripts in this section enable protection at the server or workspace level before disabling the database-level configuration.

The scripts don't modify Vulnerability Assessment configuration.

> [!IMPORTANT]
> The migration scripts modify Azure resources. Make sure you have the permissions required to update the resources you migrate.

### Migrate a single resource

Use `Remediate-ClassicAtpPolicy.ps1` to migrate database-level Advanced Threat Protection configuration for a single SQL server, SQL Managed Instance, or Synapse workspace.

1. Copy the `Remediate-ClassicAtpPolicy.ps1` script in the following section and save it locally as `Remediate-ClassicAtpPolicy.ps1`.

1. Run the script and specify the subscription, resource type, resource name, and resource group:

   ```powershell
   .\Remediate-ClassicAtpPolicy.ps1 -SubscriptionId "<subscription-ID>" -ResourceType <resource-type> -ResourceName "<resource-name>" -ResourceGroup "<resource-group>"
   ```

   For `ResourceType`, use `SqlServer`, `SqlManagedInstance`, or `Synapse`.

The script first enables protection at the server or workspace level. It disables the database-level classic Advanced Threat Protection configuration only after server-level protection is enabled successfully.

```powershell
#Requires -Modules @{ ModuleName="Az.Accounts"; ModuleVersion="2.9.1" }
#Requires -Version 7.0

<#
.SYNOPSIS
    Remediates the classic Advanced Threat Protection
    configuration for a SINGLE Azure SQL resource (SQL Server, SQL Managed Instance, or
    Synapse workspace).

.DESCRIPTION
    Only acts on resources that have a DATABASE-LEVEL Classic Security Alert Policy actually
    configured. If none is found, the script does nothing.

    When a database-level Classic ATP policy is found:
      1. Enables the new server-level Advanced Threat Protection setting:
           - SQL Server / SQL Managed Instance: the new `advancedThreatProtectionSettings` API
             (state = Enabled). This new API only supports on/off - it does not support
             storage/email configuration.
           - Synapse workspace: the new API is not supported for Synapse, so the classic
             Security Alert Policy is set at the WORKSPACE level instead, with only
             `state = Enabled` (no storage/emails set).
      2. Once the server-level setting succeeds, disables (state = Disabled) every
         database-level Classic Security Alert Policy that was found, so the database no
         longer relies on the classic per-database policy.

    This script does NOT touch Vulnerability Assessment (VA) settings at all - only ATP/
    Security Alert Policy.

    Every write to Azure is retried up to 3 times with a short delay before being reported as
    failed. If the server-level setting fails after retries, the old database-level policies
    are intentionally left untouched (so there is no gap where nothing is protecting the
    database) and the failure is reported so you can re-run the script later.

.PARAMETER SubscriptionId
    The subscription containing the resource.

.PARAMETER ResourceType
    One of: SqlServer, SqlManagedInstance, Synapse.

.PARAMETER ResourceName
    The name of the server / managed instance / Synapse workspace.

.PARAMETER ResourceGroup
    The resource group containing the resource.

.PARAMETER ShowDetails
    Show a verbose, per-step trace of every check/write performed.

.EXAMPLE
    .\Remediate-ClassicAtpPolicy.ps1 -SubscriptionId "aaaa-bbbb-cccc-dddd" -ResourceType SqlManagedInstance -ResourceName testmig-sqlmi -ResourceGroup TestMigrationScript

.NOTES
    This script WRITES to Azure resources. Make sure you have Security Admin / SQL Security
    Manager (or Contributor) rights on the target resource before running it.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$SubscriptionId,

    [Parameter(Mandatory = $true)]
    [ValidateSet("SqlServer", "SqlManagedInstance", "Synapse")]
    [string]$ResourceType,

    [Parameter(Mandatory = $true)]
    [string]$ResourceName,

    [Parameter(Mandatory = $true)]
    [string]$ResourceGroup,

    [switch]$ShowDetails
)

$ErrorActionPreference = "Stop"
$Script:ShowDetails = $ShowDetails

# ======================================================================
#  Shared helpers (standalone - no separate file needed)
# ======================================================================

# Classic API versions per resource type.
$Script:ClassicApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01"
}

# ARM API versions for listing resources / children.
$Script:ListApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01-preview"
}

# New Advanced Threat Protection settings API - only supported for SqlServer and
# SqlManagedInstance. Synapse does not support this API; Synapse remediation instead sets the
# classic Security Alert Policy at the workspace level with state=Enabled only.
# NOTE: the API version differs per resource type - SqlManagedInstance does not accept the
# same preview version SqlServer uses (confirmed via live testing: "2021-11-01-preview" returns
# NoRegisteredProviderFound for managedInstances/advancedThreatProtectionSettings).
$Script:AtpSettingsApiVersions = @{
    SqlServer          = "2021-11-01-preview"
    SqlManagedInstance = "2023-08-01"
}

# Number of attempts for any ARM write (PUT) operation before giving up on that step.
$Script:MaxWriteAttempts = 3
$Script:RetryDelaySeconds = 5

# ======================================================================
#region --- Logging helpers ---
# ======================================================================

function Write-Log {
    param([string]$Message)
    Write-Host ("{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message)
}

function Write-LogError {
    param([string]$Message)
    Write-Host ("{0} - ERROR: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor Red
}

function Write-LogWarn {
    param([string]$Message)
    Write-Host ("{0} - WARNING: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor Yellow
}

function Write-LogDetail {
    param([string]$Message)
    if ($Script:ShowDetails) {
        Write-Host ("{0}   {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor DarkGray
    }
}

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host ([string]::new([char]0x2501, 60)) -ForegroundColor Cyan
    Write-Host "  $Title" -ForegroundColor Cyan
    Write-Host ([string]::new([char]0x2501, 60)) -ForegroundColor Cyan
}

#endregion

# ======================================================================
#region --- ARM REST helpers (with retry for writes) ---
# ======================================================================

# GET a resource and return its parsed JSON content, or $null on any non-200 / parse failure.
function Get-ArmJson {
    param([string]$Path)

    try {
        $resp = Invoke-AzRestMethod -Method GET -Path $Path
        if ($resp.StatusCode -eq 200) {
            return ($resp.Content | ConvertFrom-Json)
        }
    }
    catch {
        Write-LogDetail "  GET failed for $Path : $($_.Exception.Message)"
    }
    return $null
}

# Follows nextLink pagination for ARM list responses.
function Get-ArmListAll {
    param([string]$Path)

    $items = @()
    $uri = $Path
    while ($uri) {
        $resp = Invoke-AzRestMethod -Method GET -Path $uri
        if ($resp.StatusCode -ne 200) { break }
        $content = $resp.Content | ConvertFrom-Json
        if ($content.value) { $items += $content.value }
        $uri = $content.nextLink
    }
    return $items
}

# PUTs a resource, retrying on failure up to $Script:MaxWriteAttempts times with a fixed delay.
# Returns a result object: @{ Success = $true/$false; Error = <message, if any> }
function Invoke-ArmWriteWithRetry {
    param(
        [string]$Path,
        [string]$Payload,
        [string]$StepDescription
    )

    for ($attempt = 1; $attempt -le $Script:MaxWriteAttempts; $attempt++) {
        try {
            $resp = Invoke-AzRestMethod -Method PUT -Path $Path -Payload $Payload
            if ($resp.StatusCode -in 200, 201, 202) {
                Write-LogDetail "  [OK] $StepDescription (attempt $attempt)"
                return @{ Success = $true; Error = $null }
            }
            $errText = "HTTP $($resp.StatusCode): $($resp.Content)"
        }
        catch {
            $errText = $_.Exception.Message
        }

        Write-LogWarn "  Attempt $attempt/$($Script:MaxWriteAttempts) failed for '$StepDescription': $errText"
        if ($attempt -lt $Script:MaxWriteAttempts) {
            Start-Sleep -Seconds $Script:RetryDelaySeconds
        }
        else {
            return @{ Success = $false; Error = $errText }
        }
    }
}

#endregion

# ======================================================================
#region --- Classic ATP detection (same rules as AuditClassicPolicies.ps1) ---
# ======================================================================

# A Classic Security Alert Policy is considered "configured" using the same rules as the audit
# script: concrete signals (storage endpoint, real emails, emailAccountAdmins, disabledAlerts)
# always count; `state == Enabled` alone counts only at the database level (not server level),
# since Defender for SQL can report server-wide state=Enabled with no real legacy config.
function Test-ClassicAtpConfigured {
    param(
        [string]$Path,
        [switch]$IsDbLevel
    )

    $content = Get-ArmJson -Path $Path
    if (-not $content) { return $false }

    $props = $content.properties
    if (-not $props) { return $false }

    if (-not [string]::IsNullOrEmpty($props.storageEndpoint)) { return $true }
    if ($props.emailAddresses -and @($props.emailAddresses | Where-Object { $_ }).Count -gt 0) { return $true }
    if ($props.emailAccountAdmins -eq $true) { return $true }
    if ($props.disabledAlerts -and @($props.disabledAlerts | Where-Object { $_ }).Count -gt 0) { return $true }
    if ($IsDbLevel -and $props.state -eq "Enabled") { return $true }

    return $false
}

#endregion

# ======================================================================
#region --- Resource / database discovery (same rules as AuditClassicPolicies.ps1) ---
# ======================================================================

function Get-AllSqlServers {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Sql/servers?api-version=$($Script:ListApiVersions.SqlServer)"
    $servers = Get-ArmListAll -Path $path

    # Exclude Synapse's auto-provisioned backing SQL server (kind contains "analytics") -
    # not a customer-managed resource; already covered by the Synapse workspace entry.
    return $servers | Where-Object { $_.kind -notmatch "analytics" }
}

function Get-AllManagedInstances {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Sql/managedInstances?api-version=$($Script:ListApiVersions.SqlManagedInstance)"
    return Get-ArmListAll -Path $path
}

function Get-AllSynapseWorkspaces {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Synapse/workspaces?api-version=$($Script:ListApiVersions.Synapse)"
    return Get-ArmListAll -Path $path
}

# Returns database/pool names for a given resource (includes 'master' for SqlServer, matches
# the same conventions used by the audit script).
function Get-ChildDatabaseNames {
    param(
        [string]$ResourceType,
        [string]$ResourceId
    )

    $names = @()
    $listApiVersion = $Script:ListApiVersions[$ResourceType]

    switch ($ResourceType) {
        "SqlServer" {
            $items = Get-ArmListAll -Path "$ResourceId/databases?api-version=$listApiVersion"
            $names += "master"
            foreach ($db in $items) { if ($db.name -ne "master") { $names += $db.name } }
        }
        "SqlManagedInstance" {
            $items = Get-ArmListAll -Path "$ResourceId/databases?api-version=$listApiVersion"
            foreach ($db in $items) { $names += $db.name }
        }
        "Synapse" {
            $items = Get-ArmListAll -Path "$ResourceId/sqlPools?api-version=$listApiVersion"
            foreach ($pool in $items) { $names += $pool.name }
        }
    }

    return $names
}

# Resolves a single resource (by type/name/resource group) to its ARM resource ID, using the
# same "real customer resource" filter as Get-AllSqlServers (excludes Synapse-managed servers).
function Resolve-ResourceId {
    param(
        [string]$SubscriptionId,
        [string]$ResourceType,
        [string]$ResourceName,
        [string]$ResourceGroup
    )

    $apiVersion = $Script:ListApiVersions[$ResourceType]
    $providerPath = switch ($ResourceType) {
        "SqlServer"          { "Microsoft.Sql/servers" }
        "SqlManagedInstance" { "Microsoft.Sql/managedInstances" }
        "Synapse"            { "Microsoft.Synapse/workspaces" }
    }

    $path = "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/$providerPath/${ResourceName}?api-version=$apiVersion"
    $content = Get-ArmJson -Path $path
    if (-not $content) { return $null }

    if ($ResourceType -eq "SqlServer" -and $content.kind -match "analytics") {
        Write-LogError "'$ResourceName' is a Synapse-managed backing SQL server, not a customer-managed resource. Skipping."
        return $null
    }

    return $content.id
}

#endregion

# ======================================================================
#region --- Remediation routine (shared by both scripts) ---
# ======================================================================

# Remediates Classic ATP for a single resource:
#   1. Finds databases/pools with a Classic Security Alert Policy actually configured.
#   2. If none found, does nothing (returns Skipped).
#   3. Turns on the new server-level protection:
#        - SqlServer / SqlManagedInstance -> new Advanced Threat Protection settings API (state=Enabled)
#        - Synapse                        -> classic Security Alert Policy at workspace level, state=Enabled only
#          (Synapse does not support the new Advanced Threat Protection settings API)
#   4. Disables (state=Disabled) each database-level Classic Security Alert Policy that was found.
#
# Returns an array of PSCustomObject step results (one row per step attempted), so callers can
# build a full CSV audit trail even for partial failures.
function Invoke-AtpRemediation {
    param(
        [string]$ResourceType,
        [string]$ResourceId,
        [string]$ResourceName,
        [string]$ResourceGroup
    )

    $stepResults = @()
    $classicApiVersion = $Script:ClassicApiVersions[$ResourceType]

    function New-StepResult {
        param([string]$Step, [string]$Status, [string]$Detail = "")
        [PSCustomObject]@{
            ServerName    = $ResourceName
            ResourceType  = $ResourceType
            ResourceGroup = $ResourceGroup
            Step          = $Step
            Status        = $Status
            Detail        = $Detail
        }
    }

    # --- Step 1: find DB-level classic ATP policies ---
    $dbNames = Get-ChildDatabaseNames -ResourceType $ResourceType -ResourceId $ResourceId
    $dbsWithAtp = @()

    foreach ($db in $dbNames) {
        $childSegment = if ($ResourceType -eq "Synapse") { "sqlPools/$db" } else { "databases/$db" }
        $atpDbPath = "$ResourceId/$childSegment/securityAlertPolicies/Default?api-version=$classicApiVersion"
        if (Test-ClassicAtpConfigured -Path $atpDbPath -IsDbLevel) { $dbsWithAtp += $db }
    }

    if ($dbsWithAtp.Count -eq 0) {
        Write-LogDetail "  No DB-level Classic ATP policy found on '$ResourceName' - nothing to remediate."
        $stepResults += New-StepResult -Step "Discovery" -Status "Skipped" -Detail "No DB-level Classic ATP policy found"
        return $stepResults
    }

    Write-Log "Remediating '$ResourceName' ($ResourceType) - DB-level Classic ATP found on: $($dbsWithAtp -join ', ')"
    $stepResults += New-StepResult -Step "Discovery" -Status "Found" -Detail "DB-level Classic ATP on: $($dbsWithAtp -join ', ')"

    # --- Step 2: enable new server-level protection ---
    $serverStepOk = $false
    if ($ResourceType -in @("SqlServer", "SqlManagedInstance")) {
        $path = "$ResourceId/advancedThreatProtectionSettings/Default?api-version=$($Script:AtpSettingsApiVersions[$ResourceType])"
        $payload = @{ properties = @{ state = "Enabled" } } | ConvertTo-Json -Depth 5
        $result = Invoke-ArmWriteWithRetry -Path $path -Payload $payload -StepDescription "Enable new Advanced Threat Protection setting on '$ResourceName'"
        $serverStepOk = $result.Success
        $stepResults += New-StepResult -Step "Enable server-level Advanced Threat Protection (new API)" `
            -Status $(if ($result.Success) { "Success" } else { "Failed" }) -Detail $result.Error
    }
    else {
        # Synapse: new API not supported - set classic Security Alert Policy at the workspace
        # level with state=Enabled only (no storage/email fields set).
        $path = "$ResourceId/securityAlertPolicies/Default?api-version=$classicApiVersion"
        $payload = @{ properties = @{ state = "Enabled" } } | ConvertTo-Json -Depth 5
        $result = Invoke-ArmWriteWithRetry -Path $path -Payload $payload -StepDescription "Enable server-level Security Alert Policy on Synapse workspace '$ResourceName'"
        $serverStepOk = $result.Success
        $stepResults += New-StepResult -Step "Enable server-level Security Alert Policy (Synapse - new API not supported)" `
            -Status $(if ($result.Success) { "Success" } else { "Failed" }) -Detail $result.Error
    }

    if (-not $serverStepOk) {
        Write-LogError "  Failed to enable server-level protection on '$ResourceName' - leaving DB-level policies untouched so no protection gap is introduced."
        return $stepResults
    }

    # --- Step 3: disable the old DB-level classic policies now that server-level is on ---
    foreach ($db in $dbsWithAtp) {
        $childSegment = if ($ResourceType -eq "Synapse") { "sqlPools/$db" } else { "databases/$db" }
        $atpDbPath = "$ResourceId/$childSegment/securityAlertPolicies/Default?api-version=$classicApiVersion"
        $payload = @{ properties = @{ state = "Disabled" } } | ConvertTo-Json -Depth 5
        $result = Invoke-ArmWriteWithRetry -Path $atpDbPath -Payload $payload -StepDescription "Disable Classic ATP policy on database '$db'"
        $stepResults += New-StepResult -Step "Disable DB-level Classic ATP on '$db'" `
            -Status $(if ($result.Success) { "Success" } else { "Failed" }) -Detail $result.Error
    }

    return $stepResults
}

#endregion

Write-Host ""
Write-Host "  Classic ATP Remediation - Single Resource" -ForegroundColor Magenta
Write-Host "  Target: $ResourceType '$ResourceName' (RG: $ResourceGroup)" -ForegroundColor Magenta
Write-Host "  This script only fixes Advanced Threat Protection (ATP). Vulnerability Assessment is not touched." -ForegroundColor Magenta
Write-Host ""

# --- Sign in if needed ---
$context = Get-AzContext
if (-not $context -or -not $context.Account) {
    Write-Log "You are not signed in to Azure. Opening a sign-in prompt..."
    try {
        Connect-AzAccount -ErrorAction Stop | Out-Null
        $context = Get-AzContext
    }
    catch {
        Write-LogError "Sign-in failed: $($_.Exception.Message)"
        return
    }
}
Write-Log "Signed in as: $($context.Account.Id)"

Write-Log "Switching subscription context to $SubscriptionId..."
try {
    $null = Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop
}
catch {
    Write-LogError "Could not access subscription '$SubscriptionId'. Check the ID and your permissions."
    return
}

# --- Resolve the resource ---
Write-Log "Resolving resource..."
$resourceId = Resolve-ResourceId -SubscriptionId $SubscriptionId -ResourceType $ResourceType `
    -ResourceName $ResourceName -ResourceGroup $ResourceGroup

if (-not $resourceId) {
    Write-LogError "Could not find $ResourceType '$ResourceName' in resource group '$ResourceGroup'."
    return
}
Write-LogDetail "  Resolved resource ID: $resourceId"

# --- Remediate ---
Write-Section "Remediating"
$stepResults = Invoke-AtpRemediation -ResourceType $ResourceType -ResourceId $resourceId `
    -ResourceName $ResourceName -ResourceGroup $ResourceGroup

# --- Summary ---
Write-Section "Summary"
$stepResults | Format-Table -AutoSize ServerName, Step, Status, Detail | Out-String | Write-Host

$failed = @($stepResults | Where-Object { $_.Status -eq "Failed" })
if (@($stepResults | Where-Object { $_.Status -eq "Skipped" }).Count -gt 0) {
    Write-Host "  Nothing to do - no database-level Classic ATP policy was found on this resource." -ForegroundColor Green
}
elseif ($failed.Count -gt 0) {
    Write-Host "  $($failed.Count) step(s) failed. Re-run this script to retry - it is safe to run again." -ForegroundColor Red
}
else {
    Write-Host "  Remediation completed successfully." -ForegroundColor Green
}
```

### Migrate resources across a subscription

Use `Remediate-ClassicAtpPolicySubscription.ps1` to identify and migrate resources with database-level classic Advanced Threat Protection configuration across a subscription.

1. Copy the `Remediate-ClassicAtpPolicySubscription.ps1` script in the following section and save it locally as `Remediate-ClassicAtpPolicySubscription.ps1`.

1. Run the script:

   ```powershell
   .\Remediate-ClassicAtpPolicySubscription.ps1 -SubscriptionId "<subscription-ID>"
   ```

The script checks the SQL servers, SQL Managed Instances, and Synapse workspaces in the subscription and migrates resources that have database-level classic Advanced Threat Protection configuration.

```powershell
#Requires -Modules @{ ModuleName="Az.Accounts"; ModuleVersion="2.9.1" }
#Requires -Version 7.0

<#
.SYNOPSIS
    Remediates the classic Advanced Threat Protection
    configuration across an ENTIRE subscription, for every SQL Server, SQL Managed Instance,
    and Synapse workspace that has a database-level Classic ATP policy configured.

.DESCRIPTION
    Discovers all SQL servers, SQL Managed Instances, and Synapse workspaces in the given
    subscription (using the same discovery/filtering rules as AuditClassicPolicies.ps1,
    including exclusion of Synapse's auto-provisioned backing SQL server). For each one:

      - Skips it entirely if it has no database-level Classic Security Alert Policy configured.
      - Otherwise, remediates it exactly like Remediate-ClassicAtpPolicy.ps1 does:
          1. Enables the new server-level Advanced Threat Protection setting
             (SQL Server / Managed Instance), or the classic Security Alert Policy at the
             workspace level with state=Enabled only (Synapse - new API not supported there).
          2. Disables (state = Disabled) each database-level Classic Security Alert Policy that
             was found, once the server-level setting succeeds.

    This script does NOT touch Vulnerability Assessment (VA) settings at all - only ATP/
    Security Alert Policy. Resources with only a server-level classic policy (and no
    database-level override) are left untouched, since the task here is specifically to clean
    up per-database overrides in favor of a single server-level setting.

    Every write to Azure is retried up to 3 times with a short delay before being reported as
    failed. A resource-level failure does not stop the run - the script keeps going and reports
    every success/failure at the end so you know exactly what to re-run.

.PARAMETER SubscriptionId
    The subscription to remediate. If omitted, you'll be prompted to sign in and pick one.

.PARAMETER OutputPath
    Path to the result CSV - one row per remediated resource (SubscriptionId, ServerName,
    ResourceType, ResourceGroup, DatabasesRemediated, Status, Detail). Resources with no Classic
    ATP policy found are NOT included in the CSV (they're still shown in the console trace when
    -ShowDetails is used). Defaults to
    ".\ClassicAtpRemediation_<subscriptionId>_<yyyyMMdd_HHmmss>.csv" in the current directory.

.PARAMETER ShowDetails
    Show a verbose, per-resource/per-step trace while it runs.

.EXAMPLE
    .\Remediate-ClassicAtpPolicySubscription.ps1 -SubscriptionId "aaaa-bbbb-cccc-dddd"

.NOTES
    This script WRITES to Azure resources across the whole subscription. Make sure you have
    Security Admin / SQL Security Manager (or Contributor) rights before running it. Consider
    running Remediate-ClassicAtpPolicy.ps1 against a single test resource first.
#>

param(
    [string]$SubscriptionId,

    [string]$OutputPath,

    [switch]$ShowDetails
)

$ErrorActionPreference = "Stop"
$Script:ShowDetails = $ShowDetails

# ======================================================================
#  Shared helpers (standalone - no separate file needed)
# ======================================================================

# Classic API versions per resource type.
$Script:ClassicApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01"
}

# ARM API versions for listing resources / children.
$Script:ListApiVersions = @{
    SqlServer          = "2021-11-01"
    SqlManagedInstance = "2023-08-01"
    Synapse            = "2021-06-01-preview"
}

# New Advanced Threat Protection settings API - only supported for SqlServer and
# SqlManagedInstance. Synapse does not support this API; Synapse remediation instead sets the
# classic Security Alert Policy at the workspace level with state=Enabled only.
# NOTE: the API version differs per resource type - SqlManagedInstance does not accept the
# same preview version SqlServer uses (confirmed via live testing: "2021-11-01-preview" returns
# NoRegisteredProviderFound for managedInstances/advancedThreatProtectionSettings).
$Script:AtpSettingsApiVersions = @{
    SqlServer          = "2021-11-01-preview"
    SqlManagedInstance = "2023-08-01"
}

# Number of attempts for any ARM write (PUT) operation before giving up on that step.
$Script:MaxWriteAttempts = 3
$Script:RetryDelaySeconds = 5

# ======================================================================
#region --- Logging helpers ---
# ======================================================================

function Write-Log {
    param([string]$Message)
    Write-Host ("{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message)
}

function Write-LogError {
    param([string]$Message)
    Write-Host ("{0} - ERROR: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor Red
}

function Write-LogWarn {
    param([string]$Message)
    Write-Host ("{0} - WARNING: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor Yellow
}

function Write-LogDetail {
    param([string]$Message)
    if ($Script:ShowDetails) {
        Write-Host ("{0}   {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -ForegroundColor DarkGray
    }
}

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host ([string]::new([char]0x2501, 60)) -ForegroundColor Cyan
    Write-Host "  $Title" -ForegroundColor Cyan
    Write-Host ([string]::new([char]0x2501, 60)) -ForegroundColor Cyan
}

#endregion

# ======================================================================
#region --- ARM REST helpers (with retry for writes) ---
# ======================================================================

# GET a resource and return its parsed JSON content, or $null on any non-200 / parse failure.
function Get-ArmJson {
    param([string]$Path)

    try {
        $resp = Invoke-AzRestMethod -Method GET -Path $Path
        if ($resp.StatusCode -eq 200) {
            return ($resp.Content | ConvertFrom-Json)
        }
    }
    catch {
        Write-LogDetail "  GET failed for $Path : $($_.Exception.Message)"
    }
    return $null
}

# Follows nextLink pagination for ARM list responses.
function Get-ArmListAll {
    param([string]$Path)

    $items = @()
    $uri = $Path
    while ($uri) {
        $resp = Invoke-AzRestMethod -Method GET -Path $uri
        if ($resp.StatusCode -ne 200) { break }
        $content = $resp.Content | ConvertFrom-Json
        if ($content.value) { $items += $content.value }
        $uri = $content.nextLink
    }
    return $items
}

# PUTs a resource, retrying on failure up to $Script:MaxWriteAttempts times with a fixed delay.
# Returns a result object: @{ Success = $true/$false; Error = <message, if any> }
function Invoke-ArmWriteWithRetry {
    param(
        [string]$Path,
        [string]$Payload,
        [string]$StepDescription
    )

    for ($attempt = 1; $attempt -le $Script:MaxWriteAttempts; $attempt++) {
        try {
            $resp = Invoke-AzRestMethod -Method PUT -Path $Path -Payload $Payload
            if ($resp.StatusCode -in 200, 201, 202) {
                Write-LogDetail "  [OK] $StepDescription (attempt $attempt)"
                return @{ Success = $true; Error = $null }
            }
            $errText = "HTTP $($resp.StatusCode): $($resp.Content)"
        }
        catch {
            $errText = $_.Exception.Message
        }

        Write-LogWarn "  Attempt $attempt/$($Script:MaxWriteAttempts) failed for '$StepDescription': $errText"
        if ($attempt -lt $Script:MaxWriteAttempts) {
            Start-Sleep -Seconds $Script:RetryDelaySeconds
        }
        else {
            return @{ Success = $false; Error = $errText }
        }
    }
}

#endregion

# ======================================================================
#region --- Classic ATP detection (same rules as AuditClassicPolicies.ps1) ---
# ======================================================================

# A Classic Security Alert Policy is considered "configured" using the same rules as the audit
# script: concrete signals (storage endpoint, real emails, emailAccountAdmins, disabledAlerts)
# always count; `state == Enabled` alone counts only at the database level (not server level),
# since Defender for SQL can report server-wide state=Enabled with no real legacy config.
function Test-ClassicAtpConfigured {
    param(
        [string]$Path,
        [switch]$IsDbLevel
    )

    $content = Get-ArmJson -Path $Path
    if (-not $content) { return $false }

    $props = $content.properties
    if (-not $props) { return $false }

    if (-not [string]::IsNullOrEmpty($props.storageEndpoint)) { return $true }
    if ($props.emailAddresses -and @($props.emailAddresses | Where-Object { $_ }).Count -gt 0) { return $true }
    if ($props.emailAccountAdmins -eq $true) { return $true }
    if ($props.disabledAlerts -and @($props.disabledAlerts | Where-Object { $_ }).Count -gt 0) { return $true }
    if ($IsDbLevel -and $props.state -eq "Enabled") { return $true }

    return $false
}

#endregion

# ======================================================================
#region --- Resource / database discovery (same rules as AuditClassicPolicies.ps1) ---
# ======================================================================

function Get-AllSqlServers {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Sql/servers?api-version=$($Script:ListApiVersions.SqlServer)"
    $servers = Get-ArmListAll -Path $path

    # Exclude Synapse's auto-provisioned backing SQL server (kind contains "analytics") -
    # not a customer-managed resource; already covered by the Synapse workspace entry.
    return $servers | Where-Object { $_.kind -notmatch "analytics" }
}

function Get-AllManagedInstances {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Sql/managedInstances?api-version=$($Script:ListApiVersions.SqlManagedInstance)"
    return Get-ArmListAll -Path $path
}

function Get-AllSynapseWorkspaces {
    param([string]$SubId)
    $path = "/subscriptions/$SubId/providers/Microsoft.Synapse/workspaces?api-version=$($Script:ListApiVersions.Synapse)"
    return Get-ArmListAll -Path $path
}

# Returns database/pool names for a given resource (includes 'master' for SqlServer, matches
# the same conventions used by the audit script).
function Get-ChildDatabaseNames {
    param(
        [string]$ResourceType,
        [string]$ResourceId
    )

    $names = @()
    $listApiVersion = $Script:ListApiVersions[$ResourceType]

    switch ($ResourceType) {
        "SqlServer" {
            $items = Get-ArmListAll -Path "$ResourceId/databases?api-version=$listApiVersion"
            $names += "master"
            foreach ($db in $items) { if ($db.name -ne "master") { $names += $db.name } }
        }
        "SqlManagedInstance" {
            $items = Get-ArmListAll -Path "$ResourceId/databases?api-version=$listApiVersion"
            foreach ($db in $items) { $names += $db.name }
        }
        "Synapse" {
            $items = Get-ArmListAll -Path "$ResourceId/sqlPools?api-version=$listApiVersion"
            foreach ($pool in $items) { $names += $pool.name }
        }
    }

    return $names
}

# Resolves a single resource (by type/name/resource group) to its ARM resource ID, using the
# same "real customer resource" filter as Get-AllSqlServers (excludes Synapse-managed servers).
function Resolve-ResourceId {
    param(
        [string]$SubscriptionId,
        [string]$ResourceType,
        [string]$ResourceName,
        [string]$ResourceGroup
    )

    $apiVersion = $Script:ListApiVersions[$ResourceType]
    $providerPath = switch ($ResourceType) {
        "SqlServer"          { "Microsoft.Sql/servers" }
        "SqlManagedInstance" { "Microsoft.Sql/managedInstances" }
        "Synapse"            { "Microsoft.Synapse/workspaces" }
    }

    $path = "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup/providers/$providerPath/${ResourceName}?api-version=$apiVersion"
    $content = Get-ArmJson -Path $path
    if (-not $content) { return $null }

    if ($ResourceType -eq "SqlServer" -and $content.kind -match "analytics") {
        Write-LogError "'$ResourceName' is a Synapse-managed backing SQL server, not a customer-managed resource. Skipping."
        return $null
    }

    return $content.id
}

#endregion

# ======================================================================
#region --- Remediation routine (shared by both scripts) ---
# ======================================================================

# Remediates Classic ATP for a single resource:
#   1. Finds databases/pools with a Classic Security Alert Policy actually configured.
#   2. If none found, does nothing (returns Skipped).
#   3. Turns on the new server-level protection:
#        - SqlServer / SqlManagedInstance -> new Advanced Threat Protection settings API (state=Enabled)
#        - Synapse                        -> classic Security Alert Policy at workspace level, state=Enabled only
#          (Synapse does not support the new Advanced Threat Protection settings API)
#   4. Disables (state=Disabled) each database-level Classic Security Alert Policy that was found.
#
# Returns an array of PSCustomObject step results (one row per step attempted), so callers can
# build a full CSV audit trail even for partial failures.
function Invoke-AtpRemediation {
    param(
        [string]$ResourceType,
        [string]$ResourceId,
        [string]$ResourceName,
        [string]$ResourceGroup
    )

    $stepResults = @()
    $classicApiVersion = $Script:ClassicApiVersions[$ResourceType]

    function New-StepResult {
        param([string]$Step, [string]$Status, [string]$Detail = "")
        [PSCustomObject]@{
            ServerName    = $ResourceName
            ResourceType  = $ResourceType
            ResourceGroup = $ResourceGroup
            Step          = $Step
            Status        = $Status
            Detail        = $Detail
        }
    }

    # --- Step 1: find DB-level classic ATP policies ---
    $dbNames = Get-ChildDatabaseNames -ResourceType $ResourceType -ResourceId $ResourceId
    $dbsWithAtp = @()

    foreach ($db in $dbNames) {
        $childSegment = if ($ResourceType -eq "Synapse") { "sqlPools/$db" } else { "databases/$db" }
        $atpDbPath = "$ResourceId/$childSegment/securityAlertPolicies/Default?api-version=$classicApiVersion"
        if (Test-ClassicAtpConfigured -Path $atpDbPath -IsDbLevel) { $dbsWithAtp += $db }
    }

    if ($dbsWithAtp.Count -eq 0) {
        Write-LogDetail "  No DB-level Classic ATP policy found on '$ResourceName' - nothing to remediate."
        $stepResults += New-StepResult -Step "Discovery" -Status "Skipped" -Detail "No DB-level Classic ATP policy found"
        return $stepResults
    }

    Write-Log "Remediating '$ResourceName' ($ResourceType) - DB-level Classic ATP found on: $($dbsWithAtp -join ', ')"
    $stepResults += New-StepResult -Step "Discovery" -Status "Found" -Detail "DB-level Classic ATP on: $($dbsWithAtp -join ', ')"

    # --- Step 2: enable new server-level protection ---
    $serverStepOk = $false
    if ($ResourceType -in @("SqlServer", "SqlManagedInstance")) {
        $path = "$ResourceId/advancedThreatProtectionSettings/Default?api-version=$($Script:AtpSettingsApiVersions[$ResourceType])"
        $payload = @{ properties = @{ state = "Enabled" } } | ConvertTo-Json -Depth 5
        $result = Invoke-ArmWriteWithRetry -Path $path -Payload $payload -StepDescription "Enable new Advanced Threat Protection setting on '$ResourceName'"
        $serverStepOk = $result.Success
        $stepResults += New-StepResult -Step "Enable server-level Advanced Threat Protection (new API)" `
            -Status $(if ($result.Success) { "Success" } else { "Failed" }) -Detail $result.Error
    }
    else {
        # Synapse: new API not supported - set classic Security Alert Policy at the workspace
        # level with state=Enabled only (no storage/email fields set).
        $path = "$ResourceId/securityAlertPolicies/Default?api-version=$classicApiVersion"
        $payload = @{ properties = @{ state = "Enabled" } } | ConvertTo-Json -Depth 5
        $result = Invoke-ArmWriteWithRetry -Path $path -Payload $payload -StepDescription "Enable server-level Security Alert Policy on Synapse workspace '$ResourceName'"
        $serverStepOk = $result.Success
        $stepResults += New-StepResult -Step "Enable server-level Security Alert Policy (Synapse - new API not supported)" `
            -Status $(if ($result.Success) { "Success" } else { "Failed" }) -Detail $result.Error
    }

    if (-not $serverStepOk) {
        Write-LogError "  Failed to enable server-level protection on '$ResourceName' - leaving DB-level policies untouched so no protection gap is introduced."
        return $stepResults
    }

    # --- Step 3: disable the old DB-level classic policies now that server-level is on ---
    foreach ($db in $dbsWithAtp) {
        $childSegment = if ($ResourceType -eq "Synapse") { "sqlPools/$db" } else { "databases/$db" }
        $atpDbPath = "$ResourceId/$childSegment/securityAlertPolicies/Default?api-version=$classicApiVersion"
        $payload = @{ properties = @{ state = "Disabled" } } | ConvertTo-Json -Depth 5
        $result = Invoke-ArmWriteWithRetry -Path $atpDbPath -Payload $payload -StepDescription "Disable Classic ATP policy on database '$db'"
        $stepResults += New-StepResult -Step "Disable DB-level Classic ATP on '$db'" `
            -Status $(if ($result.Success) { "Success" } else { "Failed" }) -Detail $result.Error
    }

    return $stepResults
}

#endregion

Write-Host ""
Write-Host "  Classic ATP Remediation - Whole Subscription" -ForegroundColor Magenta
Write-Host "  This script only fixes Advanced Threat Protection (ATP). Vulnerability Assessment is not touched." -ForegroundColor Magenta
Write-Host "  Only resources with a database-level Classic ATP policy are changed." -ForegroundColor Magenta
Write-Host ""

# --- Sign in if needed ---
$context = Get-AzContext
if (-not $context -or -not $context.Account) {
    Write-Log "You are not signed in to Azure. Opening a sign-in prompt..."
    try {
        Connect-AzAccount -ErrorAction Stop | Out-Null
        $context = Get-AzContext
    }
    catch {
        Write-LogError "Sign-in failed: $($_.Exception.Message)"
        return
    }
}
Write-Log "Signed in as: $($context.Account.Id)"

# --- Pick a subscription if one wasn't supplied ---
if (-not $SubscriptionId) {
    $subs = Get-AzSubscription | Sort-Object Name
    if ($subs.Count -eq 0) {
        Write-LogError "No subscriptions are visible to this account."
        return
    }
    elseif ($subs.Count -eq 1) {
        $SubscriptionId = $subs[0].Id
        Write-Log "Only one subscription found - using '$($subs[0].Name)' ($SubscriptionId)."
    }
    else {
        Write-Host ""
        Write-Host "  Multiple subscriptions found. Please choose one:" -ForegroundColor Yellow
        for ($idx = 0; $idx -lt $subs.Count; $idx++) {
            Write-Host ("    [{0}] {1}  ({2})" -f ($idx + 1), $subs[$idx].Name, $subs[$idx].Id)
        }
        do {
            $choice = Read-Host "  Enter a number (1-$($subs.Count))"
        } while (-not ($choice -as [int]) -or [int]$choice -lt 1 -or [int]$choice -gt $subs.Count)
        $SubscriptionId = $subs[[int]$choice - 1].Id
    }
}

if (-not $OutputPath) {
    $timestamp  = Get-Date -Format "yyyyMMdd_HHmmss"
    $OutputPath = ".\ClassicAtpRemediation_${SubscriptionId}_${timestamp}.csv"
}

Write-Log "Switching subscription context to $SubscriptionId..."
try {
    $null = Set-AzContext -SubscriptionId $SubscriptionId -ErrorAction Stop
}
catch {
    Write-LogError "Could not access subscription '$SubscriptionId'. Check the ID and your permissions."
    return
}

# ======================================================================
#  Discover resources
# ======================================================================
Write-Section "Discovering Resources"

$targets = @()

Write-Log "Listing SQL servers..."
foreach ($s in Get-AllSqlServers -SubId $SubscriptionId) {
    $targets += @{ ResourceType = "SqlServer"; ResourceId = $s.id; ResourceName = $s.name; ResourceGroup = ($s.id -split "/")[4] }
}

Write-Log "Listing SQL Managed Instances..."
foreach ($mi in Get-AllManagedInstances -SubId $SubscriptionId) {
    $targets += @{ ResourceType = "SqlManagedInstance"; ResourceId = $mi.id; ResourceName = $mi.name; ResourceGroup = ($mi.id -split "/")[4] }
}

Write-Log "Listing Synapse workspaces..."
foreach ($ws in Get-AllSynapseWorkspaces -SubId $SubscriptionId) {
    $targets += @{ ResourceType = "Synapse"; ResourceId = $ws.id; ResourceName = $ws.name; ResourceGroup = ($ws.id -split "/")[4] }
}

Write-Log "Found $($targets.Count) resource(s) to check: $(($targets | Group-Object { $_.ResourceType } | ForEach-Object { "$($_.Name)=$($_.Count)" }) -join ', ')"

if ($targets.Count -eq 0) {
    Write-LogError "No SQL servers, Managed Instances, or Synapse workspaces found in this subscription."
    return
}

# ======================================================================
#  Remediate each resource
# ======================================================================
Write-Section "Remediating Classic ATP Policies"

$allStepResults = @()
$i = 0
foreach ($t in $targets) {
    $i++
    Write-Progress -Activity "Remediating resources" -Status "$($t.ResourceName) ($i/$($targets.Count))" -PercentComplete ([int](($i / $targets.Count) * 100))

    try {
        $allStepResults += Invoke-AtpRemediation -ResourceType $t.ResourceType -ResourceId $t.ResourceId `
            -ResourceName $t.ResourceName -ResourceGroup $t.ResourceGroup
    }
    catch {
        Write-LogError "Failed to process '$($t.ResourceName)': $($_.Exception.Message)"
        $allStepResults += [PSCustomObject]@{
            ServerName    = $t.ResourceName
            ResourceType  = $t.ResourceType
            ResourceGroup = $t.ResourceGroup
            Step          = "Unhandled error"
            Status        = "Failed"
            Detail        = $_.Exception.Message
        }
    }
}
Write-Progress -Activity "Remediating resources" -Completed

# ======================================================================
#  Export CSV & summary
# ======================================================================
Write-Section "Exporting Report"

# Only log resources that were actually remediated - build one summary row per resource
# instead of one row per step, so the CSV stays easy to read (no "nothing to do" rows either).
$remediatedResourceNames = @($allStepResults | Where-Object { $_.Step -eq "Discovery" -and $_.Status -eq "Found" } | Select-Object -ExpandProperty ServerName -Unique)

$summaryRows = foreach ($name in $remediatedResourceNames) {
    $steps = @($allStepResults | Where-Object { $_.ServerName -eq $name })
    $discoveryStep = $steps | Where-Object { $_.Step -eq "Discovery" }
    $dbSteps = @($steps | Where-Object { $_.Step -like "Disable DB-level Classic ATP on*" })
    $serverStep = $steps | Where-Object { $_.Step -like "Enable server-level*" }

    $dbsRemediated = @($dbSteps | Where-Object { $_.Status -eq "Success" } | ForEach-Object { $_.Step -replace "^Disable DB-level Classic ATP on '(.+)'$", '$1' })
    $overallStatus = if (@($steps | Where-Object { $_.Status -eq "Failed" }).Count -gt 0) { "Failed" } else { "Success" }

    [PSCustomObject]@{
        SubscriptionId      = $SubscriptionId
        ServerName          = $name
        ResourceType        = $discoveryStep.ResourceType
        ResourceGroup       = $discoveryStep.ResourceGroup
        DatabasesRemediated = $dbsRemediated -join ", "
        Status              = $overallStatus
        Detail              = ($steps | Where-Object { $_.Status -eq "Failed" } | Select-Object -First 1 -ExpandProperty Detail)
    }
}

$summaryRows | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

$remediated = @($allStepResults | Where-Object { $_.Step -eq "Discovery" -and $_.Status -eq "Found" }).Count
$skipped    = @($allStepResults | Where-Object { $_.Step -eq "Discovery" -and $_.Status -eq "Skipped" }).Count
$failedSteps = @($allStepResults | Where-Object { $_.Status -eq "Failed" })
$resourcesWithFailures = @($failedSteps | Select-Object -ExpandProperty ServerName -Unique).Count

Write-Section "Summary"
Write-Host ("  Total resources scanned                 : {0}" -f $targets.Count)
Write-Host ("  Already clean (no DB-level Classic ATP)  : {0}" -f $skipped) -ForegroundColor Green
Write-Host ("  Resources remediated (attempted)         : {0}" -f $remediated) -ForegroundColor $(if ($remediated -gt 0) { "Yellow" } else { "Green" })
Write-Host ("  Resources with at least one failed step  : {0}" -f $resourcesWithFailures) -ForegroundColor $(if ($resourcesWithFailures -gt 0) { "Red" } else { "Green" })
Write-Host ""
Write-Host "  Full step-by-step report: $OutputPath" -ForegroundColor Yellow
if ($resourcesWithFailures -gt 0) {
    Write-Host "  Some steps failed after retries - re-running this script is safe and will retry only what's needed." -ForegroundColor Red
}
```

## Migrate Vulnerability Assessment configuration

Migrate resources that use classic Vulnerability Assessment configuration to Express Configuration.

When you migrate, note the following differences:

| Capability | Classic configuration | Express Configuration |
|---|---|---|
| Email notifications | Built-in scheduler and Logic Apps | Logic Apps |
| Scan export | Excel | CSV |
| APIs | Separate APIs for each SQL resource type | Unified API across Azure SQL Database, Azure SQL Managed Instance, SQL Server on Azure Virtual Machines, and Azure Synapse Analytics |

Express Configuration supports email reporting through Logic Apps. The built-in scheduling mechanism available with classic configuration isn't supported. For more information, see [Automate email notifications with Logic Apps](defender-for-sql-scan-results.md#automate-email-notifications-with-logic-apps).

Express Configuration exports vulnerability assessment results in CSV format instead of Excel.

Express Configuration provides a unified API across supported SQL resource types. For more information, see [Manage vulnerability assessments programmatically](configure-vulnerability-findings-express.md?tabs=unified-api#manage-vulnerability-assessments-programmatically).

For migration steps and the PowerShell migration script, see [Migrate SQL vulnerability assessment to Express Configuration](powershell-sample-vulnerability-assessment-azure-sql.md?tabs=unifiedapi).