---
title: Express configuration PowerShell wrapper module
description: In this article, you can review the express configuration SQL vulnerability assessment PowerShell commands reference and copy example scripts to use in your environments.
ms.topic: sample
author: ElazarK
ms.author: elkrieger
ms.date: 05/07/2026
---

# Express configuration PowerShell wrapper module

> [!IMPORTANT]
> Updated to reflect SQL vulnerability assessment unified API reference that can be found under:
> - [Sql Vulnerability Assessment Settings](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-settings)
> - [Sql Vulnerability Assessment Baseline Rules](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-baseline-rules)
> - [Sql Vulnerability Assessment Scan Results](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scan-results)
> - [Sql Vulnerability Assessment Scans](/rest/api/defenderforcloud-composite/sql-vulnerability-assessment-scans)

This article provides the PowerShell wrapper for SQL vulnerability assessment express configuration.

We recommend copying the script to a local file with the following file name `SqlVulnerabilityAssessmentCommands.psm1`.

You should use the [Express configuration PowerShell commands reference](express-configuration-powershell-commands.md) to run the script.

## SqlVulnerabilityAssessmentCommands.psm1

```powershell
# =================================================================================
#  SqlVulnerabilityAssessmentCommands.psm1
#  ---------------------------------------------------------------------------------
#  Resource-agnostic PowerShell wrapper for the SQL Vulnerability Assessment (VA)
#  V20260401 REST API (api-version = 2026-04-01-preview).
#
#  Design
#  ------
#  Every public function takes a single `-ResourceId` parameter that locates the
#  target resource in ARM. The function appends the appropriate VA operation
#  segment under the `Microsoft.Security/sqlVulnerabilityAssessments/default`
#  provider namespace and issues the call via `Invoke-AzRestMethod`.
#
#  * Settings (Get / Set / Remove)            → `-ResourceId` is the
#    **top-level PaaS resource** (server / managed instance / Synapse workspace).
#    Settings are PaaS-only and are not supported on VM or Arc.
#
#  * Invoke-Scan, Get-ScanOperationResult, and Get-Scan → `-ResourceId`
#    is the **PaaS database** (Azure SQL DB / MI database / Synapse SQL pool).
#    Scan initiation, polling, and scan-record reads (single + list) are
#    PaaS-only and are not supported on VM or Arc. To read scan data on
#    IaaS, use `Get-ScanResult -ScanId latest` instead.
#
#  * Get-ScanResult, Baseline, BaselineRule → `-ResourceId` is the
#    **database resource id** for any of the five supported providers, including
#    the `sqlServers/{srv}/databases/{db}` child path on VM/Arc.
#
#  No provider-shape table is needed because the caller supplies the fully
#  qualified resource id; the module simply uses it as the route prefix.
#
#  All five providers in the V20260401 supported set are covered:
#      Microsoft.Sql/servers/{srv}/databases/{db}
#      Microsoft.Sql/managedInstances/{mi}/databases/{db}
#      Microsoft.Synapse/workspaces/{ws}/sqlPools/{pool}
#      Microsoft.Compute/virtualMachines/{vm}/sqlServers/{srv}/databases/{db}
#      Microsoft.HybridCompute/machines/{m}/sqlServers/{srv}/databases/{db}
#
#  System / master database resource ids (PaaS)
#  --------------------------------------------
#  How you express a system database (`master`, `model`, `msdb`) depends on
#  the PaaS provider:
#
#  * Azure SQL DB (`Microsoft.Sql/servers`) - system DBs are first-class
#    database resources. Use the regular database resource id, e.g.
#        …/servers/{srv}/databases/master
#    Every data-plane operation in this module works as-is.
#
#  * Managed Instance (`Microsoft.Sql/managedInstances`) - the system DBs
#    `master`, `model`, and `msdb` are valid VA targets but must be addressed
#    on the instance-level URL with `databaseName` as a query parameter.
#    Callers still pass the natural database resource id, e.g.
#        …/managedInstances/{mi}/databases/master
#    The module detects the system-DB name and transparently rewrites the
#    request to `…/managedInstances/{mi}/providers/Microsoft.Security/sqlVulnerabilityAssessments/default/…?api-version=…&databaseName=master`.
#
#  * Synapse (`Microsoft.Synapse/workspaces`) - the only system DB exposed is
#    `master` (on the serverless SQL endpoint). Address it as
#        …/workspaces/{ws}/sqlPools/master
#    The module detects this and routes to the workspace-level URL with
#    `databaseName=master`. Regular dedicated pools continue to use the
#    database-route as before.
# =================================================================================

Set-StrictMode -Version 3.0

#region Module constants

$Script:ApiVersion              = '2026-04-01-preview'
$Script:VaProviderSegment       = 'providers/Microsoft.Security/sqlVulnerabilityAssessments/default'
$Script:DefaultPollIntervalSec  = 5
$Script:DefaultTimeoutSec       = 600

#endregion

#region Internal helpers

function Test-VaResourceId {
    <#
        .SYNOPSIS
        Validates that a string looks like an ARM resource id.

        .DESCRIPTION
        Performs lightweight structural validation only - confirms that the
        value starts with `/subscriptions/{guid}/resourceGroups/{name}/providers/`.
        The RP enforces provider/route shape on the wire.
    #>
    param([Parameter(Mandatory)][string] $ResourceId)
    if ($ResourceId -notmatch '^/subscriptions/[0-9a-fA-F-]{36}/resourceGroups/[^/]+/providers/[^/]+/[^/]+/.+') {
        throw "Invalid -ResourceId '$ResourceId'. Expected an ARM resource id of the form '/subscriptions/{guid}/resourceGroups/{rg}/providers/{ns}/{type}/{name}[/...]'."
    }
}

function Test-VaPaasOnly {
    <#
        .SYNOPSIS
        Throws when the resource id targets an IaaS host (VM or Arc machine).

        .DESCRIPTION
        A subset of V20260401 operations - Settings (Get/Set/Remove),
        InitiateScan, Get-ScanOperationResult, and **Get-Scan (single + list)**
        - are supported only on PaaS hosts (Microsoft.Sql/servers,
        Microsoft.Sql/managedInstances, Microsoft.Synapse/workspaces). This
        helper inspects the provider segment of the ARM resource id and
        throws a descriptive error if the caller passes a
        `Microsoft.Compute/virtualMachines` or
        `Microsoft.HybridCompute/machines` resource id.

        Called only by the 6 PaaS-only functions; all other functions
        (Get-ScanResult, Get/Add baseline, Get/Set/Remove BaselineRule)
        accept any of the 5 supported provider types.
    #>
    param([Parameter(Mandatory)][string] $ResourceId)
    if ($ResourceId -match '/providers/(Microsoft\.Compute/virtualMachines|Microsoft\.HybridCompute/machines)/') {
        throw "This operation is not supported for VM (Microsoft.Compute/virtualMachines) or Arc (Microsoft.HybridCompute/machines) resources. Settings, scan-initiation/polling, and scan-record reads are PaaS-only (Microsoft.Sql/servers, Microsoft.Sql/managedInstances, Microsoft.Synapse/workspaces). Use Get-SqlVulnerabilityAssessmentScanResult -ScanId latest to read scan data on IaaS."
    }
}

function Resolve-VaRoute {
    <#
        .SYNOPSIS
        Resolves the effective routing URL components for a given `-ResourceId`.

        .DESCRIPTION
        Most resource ids map 1:1 to the request URL (the database appears in
        the ARM path). The V20260401 RP, however, requires a *server-level*
        URL plus a `databaseName` query parameter for:

            * Managed Instance system DBs : `master`, `model`, `msdb`
            * Synapse `master` (the serverless `sqlPools/master`)

        This helper detects those patterns and returns the rewritten route id
        plus the database name to inject into the query string. For every
        other resource id it returns the original id and a null database name.

        Returns a `[pscustomobject]` with `RouteId` and `DatabaseName`.
    #>
    param([Parameter(Mandatory)][string] $ResourceId)

    $trimmed = $ResourceId.TrimEnd('/')

    # Managed Instance system DBs → server route on the instance.
    if ($trimmed -match '^(?<srv>.+/providers/Microsoft\.Sql/managedInstances/[^/]+)/databases/(?<db>master|model|msdb)$') {
        return [pscustomobject]@{ RouteId = $Matches.srv; DatabaseName = $Matches.db }
    }

    # Synapse master (serverless) → server route on the workspace.
    if ($trimmed -match '^(?<srv>.+/providers/Microsoft\.Synapse/workspaces/[^/]+)/sqlPools/(?<db>master)$') {
        return [pscustomobject]@{ RouteId = $Matches.srv; DatabaseName = $Matches.db }
    }

    return [pscustomobject]@{ RouteId = $trimmed; DatabaseName = $null }
}

function Get-VaUri {
    <#
        .SYNOPSIS
        Builds the full VA REST URI for an operation against a target resource.

        .DESCRIPTION
        Combines the caller's `-ResourceId`, the VA provider segment, an
        optional operation suffix (e.g. `/scans/initiateScan`), and the
        api-version query string.

        For MI system DBs (`master`, `model`, `msdb`) and Synapse `master`,
        the URL is rewritten to the server-level form with a `databaseName`
        query parameter - see `Resolve-VaRoute` for details.
    #>
    param(
        [Parameter(Mandatory)][string] $ResourceId,
        [string] $OperationSuffix = '',
        [string] $ApiVersion = $Script:ApiVersion
    )
    Test-VaResourceId -ResourceId $ResourceId
    $route = Resolve-VaRoute -ResourceId $ResourceId
    $qs    = "?api-version=$ApiVersion"
    if ($route.DatabaseName) { $qs += "&databaseName=$($route.DatabaseName)" }
    return "$($route.RouteId)/$($Script:VaProviderSegment)$OperationSuffix$qs"
}

function SendRestRequest {
    <#
        .SYNOPSIS
        Thin wrapper around `Invoke-AzRestMethod` that throws on HTTP failure.

        .DESCRIPTION
        Submits the request, parses the JSON response when present, and throws
        a descriptive error for any non-2xx status code. Returns the raw
        response object so callers that need the headers (e.g. Location for
        async operations) or the status code can still inspect them.
    #>
    param(
        [Parameter(Mandatory)][ValidateSet('Get','Put','Post','Delete')][string] $Method,
        [Parameter(Mandatory)][string] $Uri,
        [string] $Body
    )

    $params = @{
        Method = $Method.ToUpperInvariant()
        Path   = $Uri
    }
    if ($PSBoundParameters.ContainsKey('Body') -and -not [string]::IsNullOrEmpty($Body)) {
        $params['Payload'] = $Body
    }

    $resp = Invoke-AzRestMethod @params
    if (-not $resp) {
        throw "Invoke-AzRestMethod returned no response for $Method $Uri."
    }
    if ($resp.StatusCode -lt 200 -or $resp.StatusCode -ge 300) {
        throw "HTTP $($resp.StatusCode) calling $Method $Uri. Body: $($resp.Content)"
    }
    return $resp
}

function Get-VaLocationHeader {
    <#
        .SYNOPSIS
        Extracts the Location response header in a shape-tolerant way.

        .DESCRIPTION
        `Invoke-AzRestMethod` surfaces Headers as either a Hashtable (with
        string-array values) or an IEnumerable of KeyValuePair objects,
        depending on PowerShell version and Az module version. This helper
        normalises both shapes and returns the first Location value as a
        single string (or $null if absent).
    #>
    param([Parameter(Mandatory)] $Response)
    if (-not $Response.Headers) { return $null }
    $h = $Response.Headers
    if ($h -is [System.Collections.IDictionary]) {
        if ($h.Contains('Location')) {
            $v = $h['Location']
            if ($v -is [System.Collections.IEnumerable] -and -not ($v -is [string])) {
                return ($v | Select-Object -First 1)
            }
            return [string]$v
        }
        return $null
    }
    $kv = $h | Where-Object { $_.Key -eq 'Location' } | Select-Object -First 1
    if (-not $kv) { return $null }
    $val = $kv.Value
    if ($val -is [System.Collections.IEnumerable] -and -not ($val -is [string])) {
        return ($val | Select-Object -First 1)
    }
    return [string]$val
}

function Wait-VaScanOperation {
    <#
        .SYNOPSIS
        Polls a scan operation URL until it reaches a terminal state.

        .DESCRIPTION
        Issues GETs against `-OperationUri` at `-PollIntervalSeconds`
        cadence. The operation is terminal when `properties.scanStatus` is
        one of `Passed`, `Failed`, or `FailedToRun`. Throws after
        `-TimeoutSeconds` elapsed. Returns the terminal scan status string.
    #>
    param(
        [Parameter(Mandatory)][string] $OperationUri,
        [int] $PollIntervalSeconds = $Script:DefaultPollIntervalSec,
        [int] $TimeoutSeconds      = $Script:DefaultTimeoutSec
    )

    $deadline = (Get-Date).AddSeconds($TimeoutSeconds)
    while ($true) {
        $resp = SendRestRequest -Method 'Get' -Uri $OperationUri
        $obj = $resp.Content | ConvertFrom-Json
        $status = $obj.properties.scanStatus
        if ($status -in @('Passed', 'Failed', 'FailedToRun')) {
            return [string]$status
        }
        if ((Get-Date) -ge $deadline) {
            throw "Timed out after $TimeoutSeconds second(s) waiting for scan operation to complete. Last status: '$status'."
        }
        if ($PollIntervalSeconds -gt 0) {
            Start-Sleep -Seconds $PollIntervalSeconds
        }
    }
}

#endregion

###################################################################################
###  Settings - top-level (server / MI / workspace ) VA policy        ###
###################################################################################

function Get-SqlVulnerabilityAssessmentSetting {
    <#
        .SYNOPSIS
        Gets the VA settings for a top-level resource.

        .DESCRIPTION
        Wraps `GET {resourceId}/providers/Microsoft.Security/sqlVulnerabilityAssessments/default`.
        Returns 200 with the settings document; `properties.state` is
        `Enabled` or `Disabled` (the RP returns `Disabled` when VA has
        never been configured on the resource - there is no 404 case).

        .PARAMETER ResourceId
        ARM resource id of the **top-level** PaaS resource:
        SQL server (`Microsoft.Sql/servers`), Managed Instance
        (`Microsoft.Sql/managedInstances`), or Synapse workspace
        (`Microsoft.Synapse/workspaces`).

        VM (`Microsoft.Compute/virtualMachines`) and Arc
        (`Microsoft.HybridCompute/machines`) are **not supported** for
        Settings operations.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Get-SqlVulnerabilityAssessmentSetting `
            -ResourceId '/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/rg/providers/Microsoft.Sql/servers/srv'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        Test-VaPaasOnly -ResourceId $ResourceId
        $uri = Get-VaUri -ResourceId $ResourceId -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Get' -Uri $uri
    }
}

function Set-SqlVulnerabilityAssessmentSetting {
    <#
        .SYNOPSIS
        Creates or updates VA settings on a top-level resource.

        .DESCRIPTION
        Wraps `PUT {resourceId}/providers/Microsoft.Security/sqlVulnerabilityAssessments/default`.
        The function constructs the request body from the `-State` parameter
        (`Enabled` or `Disabled`) - callers do not need to craft JSON.

        .PARAMETER ResourceId
        ARM resource id of the top-level **PaaS** resource (server / MI /
        workspace). VM and Arc are **not supported**.

        .PARAMETER State
        Desired VA state. One of `Enabled` or `Disabled`.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Set-SqlVulnerabilityAssessmentSetting -ResourceId $sqlSrv.ResourceId -State Enabled

        .EXAMPLE
        Set-SqlVulnerabilityAssessmentSetting -ResourceId $sqlSrv.ResourceId -State Disabled
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][ValidateSet('Enabled','Disabled')][string] $State,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        Test-VaPaasOnly -ResourceId $ResourceId
        $uri  = Get-VaUri -ResourceId $ResourceId -ApiVersion $ApiVersion
        $body = @{ properties = @{ state = $State } } | ConvertTo-Json -Depth 4 -Compress
        return SendRestRequest -Method 'Put' -Uri $uri -Body $body
    }
}

function Remove-SqlVulnerabilityAssessmentSetting {
    <#
        .SYNOPSIS
        Deletes the VA settings from a top-level resource.

        .DESCRIPTION
        Wraps `DELETE {resourceId}/providers/Microsoft.Security/sqlVulnerabilityAssessments/default`.

        .PARAMETER ResourceId
        ARM resource id of the top-level **PaaS** resource (server / MI /
        workspace). VM and Arc are **not supported**.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Remove-SqlVulnerabilityAssessmentSetting -ResourceId $sqlSrv.ResourceId
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        Test-VaPaasOnly -ResourceId $ResourceId
        $uri = Get-VaUri -ResourceId $ResourceId -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Delete' -Uri $uri
    }
}

###################################################################################
###  Scans - initiate, poll, get/list scan records                              ###
###################################################################################

function Invoke-SqlVulnerabilityAssessmentScan {
    <#
        .SYNOPSIS
        Initiates a VA scan on a database resource.

        .DESCRIPTION
        Wraps `POST {dbResourceId}/.../scans/initiateScan`. The RP responds
        with HTTP 202 + a `Location` header pointing at the scan operation.

        Without `-Wait`, returns an object containing the initial status code,
        the raw Location, and a parsed `OperationId` so callers can poll
        themselves via `Get-SqlVulnerabilityAssessmentScanOperationResult`.

        With `-Wait`, the function polls the operation URL until it reaches
        a terminal state (`Passed`, `Failed`, `FailedToRun`) and then issues
        `GET .../scans/latest` to return the final scan record properties
        (trigger type, scan status, start/end time, server, database,
        rule counts, baseline applied flag, …).

        .PARAMETER ResourceId
        ARM resource id of the **database** (Microsoft.Sql/servers/.../databases
        or Microsoft.Sql/managedInstances/.../databases or
        Microsoft.Synapse/workspaces/.../sqlPools).

        Scan initiation and polling are **PaaS-only**. VM
        (`Microsoft.Compute/virtualMachines`) and Arc
        (`Microsoft.HybridCompute/machines`) resources are not supported by
        this operation - the function throws a descriptive error if such a
        resource id is supplied.

        .PARAMETER Wait
        If specified, polls the scan operation until it completes.

        .PARAMETER PollIntervalSeconds
        Seconds between polling GETs when `-Wait` is set. Defaults to 5.

        .PARAMETER TimeoutSeconds
        Maximum seconds to wait for the scan to complete. Defaults to 600.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        # Fire-and-forget
        $r = Invoke-SqlVulnerabilityAssessmentScan -ResourceId $dbId
        $r.OperationId

        .EXAMPLE
        # Wait for completion
        $r = Invoke-SqlVulnerabilityAssessmentScan -ResourceId $dbId -Wait
        $r.ScanStatus     # 'Passed' / 'Failed' / 'FailedToRun'
        $r.Scan           # Full scan record (triggerType, state, startTime, endTime, …)
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [switch] $Wait,
        [int] $PollIntervalSeconds = $Script:DefaultPollIntervalSec,
        [int] $TimeoutSeconds      = $Script:DefaultTimeoutSec,
        [string] $ApiVersion       = $Script:ApiVersion
    )
    process {
        Test-VaPaasOnly -ResourceId $ResourceId
        $uri  = Get-VaUri -ResourceId $ResourceId -OperationSuffix '/scans/initiateScan' -ApiVersion $ApiVersion
        $resp = SendRestRequest -Method 'Post' -Uri $uri

        $location = Get-VaLocationHeader -Response $resp

        if (-not $Wait) {
            $operationId = $null
            if ($location -and ($location -match '/scanOperationResults/([^/?]+)')) {
                $operationId = $Matches[1]
            }
            return [pscustomobject]@{
                StatusCode  = $resp.StatusCode
                Location    = $location
                OperationId = $operationId
                Response    = $resp
            }
        }

        if (-not $location) {
            throw "InitiateScan returned status $($resp.StatusCode) with no Location header to poll."
        }

        # Strip the host prefix; Invoke-AzRestMethod's -Path accepts either form.
        $pollPath = $location
        if ($pollPath -match '^https?://[^/]+(/.+)$') { $pollPath = $Matches[1] }

        $terminalStatus = Wait-VaScanOperation -OperationUri $pollPath -PollIntervalSeconds $PollIntervalSeconds -TimeoutSeconds $TimeoutSeconds

        # Once the operation completes, fetch the latest scan record so the
        # caller gets the full scan summary (triggerType, state, startTime,
        # endTime, scan/rule counts, baseline-applied flag, …), not just
        # the scanOperationResults envelope which only carries scanStatus.
        $scanUri  = Get-VaUri -ResourceId $ResourceId -OperationSuffix '/scans/latest' -ApiVersion $ApiVersion
        $scanResp = SendRestRequest -Method 'Get' -Uri $scanUri
        $scanObj  = $scanResp.Content | ConvertFrom-Json

        return [pscustomobject]@{
            ScanStatus = $terminalStatus
            Scan       = $scanObj
        }
    }
}

function Get-SqlVulnerabilityAssessmentScanOperationResult {
    <#
        .SYNOPSIS
        Polls the result of a previously initiated VA scan.

        .DESCRIPTION
        Wraps `GET {dbResourceId}/.../scans/scanOperationResults/{operationId}`.
        Use the operation id returned by `Invoke-SqlVulnerabilityAssessmentScan`
        to poll the scan's status.

        Terminal states are `Passed`, `Failed`, `FailedToRun`. The only
        non-terminal state is `InProgress`.

        .PARAMETER ResourceId
        ARM resource id of the **PaaS database** resource. Scan polling is
        PaaS-only - VM and Arc resource ids throw a descriptive error.

        .PARAMETER OperationId
        Operation id returned by `Invoke-SqlVulnerabilityAssessmentScan`.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Get-SqlVulnerabilityAssessmentScanOperationResult -ResourceId $dbId -OperationId 'op-abc'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][string] $OperationId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        Test-VaPaasOnly -ResourceId $ResourceId
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix "/scans/scanOperationResults/$OperationId" -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Get' -Uri $uri
    }
}

function Get-SqlVulnerabilityAssessmentScan {
    <#
        .SYNOPSIS
        Gets a single scan record or lists all scan records on a database.

        .DESCRIPTION
        Wraps `GET {dbResourceId}/.../scans` (LIST) or
        `GET {dbResourceId}/.../scans/{scanId}` (GET). Pass `-ScanId 'latest'`
        to retrieve the most recent completed scan.

        Supported on PaaS providers only (Microsoft.Sql/servers,
        Microsoft.Sql/managedInstances, Microsoft.Synapse/workspaces). Scan
        records on VM and Arc are not exposed through the unified RP - use
        `Get-SqlVulnerabilityAssessmentScanResult -ScanId latest` to read
        scan data on IaaS instead.

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER ScanId
        Optional scan id; when omitted the function lists all scans.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Get-SqlVulnerabilityAssessmentScan -ResourceId $dbId
        Get-SqlVulnerabilityAssessmentScan -ResourceId $dbId -ScanId 'latest'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [string] $ScanId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        Test-VaPaasOnly -ResourceId $ResourceId
        $suffix = if ($ScanId) { "/scans/$ScanId" } else { '/scans' }
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix $suffix -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Get' -Uri $uri
    }
}

###################################################################################
###  Scan Results                                                               ###
###################################################################################

function Get-SqlVulnerabilityAssessmentScanResult {
    <#
        .SYNOPSIS
        Gets a single scan result (rule outcome) or lists all rule results
        for a given scan.

        .DESCRIPTION
        Wraps `GET {dbResourceId}/.../scans/{scanId}/scanResults` (LIST) or
        `GET {dbResourceId}/.../scans/{scanId}/scanResults/{ruleId}` (GET).
        `-ScanId 'latest'` is supported.

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER ScanId
        Scan id (or `latest`) whose results to fetch.

        .PARAMETER RuleId
        Optional rule id; when omitted the function lists all rule results.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Get-SqlVulnerabilityAssessmentScanResult -ResourceId $dbId -ScanId 'latest'
        Get-SqlVulnerabilityAssessmentScanResult -ResourceId $dbId -ScanId 'latest' -RuleId 'VA2065'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][string] $ScanId,
        [string] $RuleId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        $suffix = if ($RuleId) { "/scans/$ScanId/scanResults/$RuleId" } else { "/scans/$ScanId/scanResults" }
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix $suffix -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Get' -Uri $uri
    }
}

###################################################################################
###  Baselines and Baseline Rules                                               ###
###################################################################################

function Get-SqlVulnerabilityAssessmentBaseline {
    <#
        .SYNOPSIS
        Lists all baseline rules configured on a database.

        .DESCRIPTION
        Wraps `GET {dbResourceId}/.../baselineRules`. Supports any of the
        five V20260401 provider types (Sql/servers/databases,
        Sql/managedInstances/databases, Synapse/workspaces/sqlPools,
        Compute/virtualMachines/sqlServers/databases,
        HybridCompute/machines/sqlServers/databases).

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Get-SqlVulnerabilityAssessmentBaseline -ResourceId $dbId
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix '/baselineRules' -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Get' -Uri $uri
    }
}

function Add-SqlVulnerabilityAssessmentBaseline {
    <#
        .SYNOPSIS
        Bulk-adds baseline rules on a database.

        .DESCRIPTION
        Wraps `POST {dbResourceId}/.../baselineRules`. The `-Body`
        parameter is a JSON document containing the rules to add. Use the
        `latestScan` action to seed the baseline from the most recent scan
        results.

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER Body
        JSON request body for the bulk-add operation.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        # Seed the baseline from the latest scan results (recommended).
        Add-SqlVulnerabilityAssessmentBaseline -ResourceId $dbId -Body '{"latestScan":true}'

        .EXAMPLE
        # Seed an explicit baseline (flat body - no `properties` wrapper).
        $body = @{ latestScan = $false; results = @{ VA2065 = @(,@('dbo','db_owner')) } } | ConvertTo-Json -Depth 6
        Add-SqlVulnerabilityAssessmentBaseline -ResourceId $dbId -Body $body
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][string] $Body,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix '/baselineRules' -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Post' -Uri $uri -Body $Body
    }
}

function Get-SqlVulnerabilityAssessmentBaselineRule {
    <#
        .SYNOPSIS
        Gets a single baseline rule from a database.

        .DESCRIPTION
        Wraps `GET {dbResourceId}/.../baselineRules/{ruleId}`.

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER RuleId
        Baseline rule id (e.g. `VA2065`).

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Get-SqlVulnerabilityAssessmentBaselineRule -ResourceId $dbId -RuleId 'VA2065'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][string] $RuleId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix "/baselineRules/$RuleId" -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Get' -Uri $uri
    }
}

function Set-SqlVulnerabilityAssessmentBaselineRule {
    <#
        .SYNOPSIS
        Creates or updates a single baseline rule.

        .DESCRIPTION
        Wraps `PUT {dbResourceId}/.../baselineRules/{ruleId}`.

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER RuleId
        Baseline rule id.

        .PARAMETER Body
        JSON request body describing the rule's expected results.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        # PUT body is FLAT (no `properties` wrapper). `latestScan` is required.
        $body = @{ latestScan = $false; results = @(,@('user1','db_owner')) } | ConvertTo-Json -Depth 5
        Set-SqlVulnerabilityAssessmentBaselineRule -ResourceId $dbId -RuleId 'VA2065' -Body $body
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][string] $RuleId,
        [Parameter(Mandatory)][string] $Body,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix "/baselineRules/$RuleId" -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Put' -Uri $uri -Body $Body
    }
}

function Remove-SqlVulnerabilityAssessmentBaselineRule {
    <#
        .SYNOPSIS
        Deletes a single baseline rule from a database.

        .DESCRIPTION
        Wraps `DELETE {dbResourceId}/.../baselineRules/{ruleId}`.

        .PARAMETER ResourceId
        ARM resource id of the database resource.

        .PARAMETER RuleId
        Baseline rule id.

        .PARAMETER ApiVersion
        REST API version. Defaults to `2026-04-01-preview`.

        .EXAMPLE
        Remove-SqlVulnerabilityAssessmentBaselineRule -ResourceId $dbId -RuleId 'VA2065'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string] $ResourceId,
        [Parameter(Mandatory)][string] $RuleId,
        [string] $ApiVersion = $Script:ApiVersion
    )
    process {
        $uri = Get-VaUri -ResourceId $ResourceId -OperationSuffix "/baselineRules/$RuleId" -ApiVersion $ApiVersion
        return SendRestRequest -Method 'Delete' -Uri $uri
    }
}

###################################################################################
###  Exports                                                                    ###
###################################################################################

Export-ModuleMember -Function @(
    # Settings
    'Get-SqlVulnerabilityAssessmentSetting',
    'Set-SqlVulnerabilityAssessmentSetting',
    'Remove-SqlVulnerabilityAssessmentSetting',
    # Scans
    'Invoke-SqlVulnerabilityAssessmentScan',
    'Get-SqlVulnerabilityAssessmentScan',
    'Get-SqlVulnerabilityAssessmentScanOperationResult',
    # Scan results
    'Get-SqlVulnerabilityAssessmentScanResult',
    # Baselines
    'Get-SqlVulnerabilityAssessmentBaseline',
    'Add-SqlVulnerabilityAssessmentBaseline',
    'Get-SqlVulnerabilityAssessmentBaselineRule',
    'Set-SqlVulnerabilityAssessmentBaselineRule',
    'Remove-SqlVulnerabilityAssessmentBaselineRule'
)
```

## Next steps

[Express configuration PowerShell commands reference](express-configuration-powershell-commands.md).
