---
title: Microsoft Defender Code admin consent script
description: Reference script for granting admin consent for Microsoft Defender Code CLI authentication.
ms.topic: reference
ms.date: 07/08/2026
ai-usage: ai-assisted
---

# Microsoft Defender Code admin consent script

Use this script to grant tenant-wide admin consent for the Microsoft Azure CLI client to call the Microsoft Defender Code first-party app with the `Defender.InteractiveLogin` delegated scope.

Copy the script and save it as `Grant-DefenderAdminConsent.ps1`:

```powershell
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidatePattern('^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')]
    [string]$TenantId,

    [switch]$VerifyToken
)

$ErrorActionPreference = 'Stop'

# Constants
$FpaAppId   = 'c2fd607e-fe6e-41bd-ae58-08e2f24014aa'  # Microsoft Defender Code
$CliAppId   = '04b07795-8ddb-461a-bbee-02f9e1bf7b46'
$ScopeValue = 'Defender.InteractiveLogin'

function Invoke-AzCli {
    param([Parameter(Mandatory)][string[]]$Arguments)
    $out = & az @Arguments 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "az $($Arguments -join ' ') failed:`n$out"
    }
    return $out
}

function Get-OrCreateServicePrincipal {
    param([Parameter(Mandatory)][string]$AppId)

    $filter = "appId eq '$AppId'"
    $url    = "https://graph.microsoft.com/v1.0/servicePrincipals?`$filter=$filter&`$select=id,appId,displayName"
    $resp   = Invoke-AzCli -Arguments @('rest','--method','GET','--url',$url) | Out-String | ConvertFrom-Json

    if ($resp.value -and $resp.value.Count -gt 0) {
        return $resp.value[0]
    }

    Write-Host "Service principal for appId $AppId not found in tenant -- creating..." -ForegroundColor Yellow
    $bodyFile = New-TemporaryFile
    try {
        Set-Content -Path $bodyFile -Value ('{"appId":"' + $AppId + '"}') -NoNewline -Encoding utf8
        $created = Invoke-AzCli -Arguments @(
            'rest','--method','POST',
            '--url','https://graph.microsoft.com/v1.0/servicePrincipals',
            '--headers','Content-Type=application/json',
            '--body',"@$bodyFile"
        ) | Out-String | ConvertFrom-Json
        return $created
    }
    finally {
        Remove-Item $bodyFile -ErrorAction SilentlyContinue
    }
}

Write-Host "==> az login to tenant $TenantId" -ForegroundColor Cyan
& az login --tenant $TenantId --use-device-code --allow-no-subscriptions | Out-Host
if ($LASTEXITCODE -ne 0) { throw "az login failed (exit $LASTEXITCODE)" }

Write-Host "==> Resolving service principals" -ForegroundColor Cyan
$fpaSp = Get-OrCreateServicePrincipal -AppId $FpaAppId
$cliSp = Get-OrCreateServicePrincipal -AppId $CliAppId
Write-Host "    FPA SP: $($fpaSp.id) ($($fpaSp.displayName))"
Write-Host "    CLI SP: $($cliSp.id) ($($cliSp.displayName))"

Write-Host "==> Checking for existing oauth2PermissionGrant" -ForegroundColor Cyan
$existing = Invoke-AzCli -Arguments @(
    'rest','--method','GET',
    '--url',"https://graph.microsoft.com/v1.0/oauth2PermissionGrants?`$filter=clientId eq '$($cliSp.id)' and resourceId eq '$($fpaSp.id)' and consentType eq 'AllPrincipals'"
) | Out-String | ConvertFrom-Json

$match = $existing.value | Where-Object { ($_.scope -split '\s+') -contains $ScopeValue }
if ($match) {
    Write-Host "    Grant already exists (id $($match.id)). Skipping create." -ForegroundColor Green
    $grant = $match
}
else {
    Write-Host "==> Creating tenant-wide admin consent grant ($ScopeValue)" -ForegroundColor Cyan
    $bodyFile = New-TemporaryFile
    try {
        $body = @{
            clientId    = $cliSp.id
            consentType = 'AllPrincipals'
            resourceId  = $fpaSp.id
            scope       = $ScopeValue
        } | ConvertTo-Json -Compress
        Set-Content -Path $bodyFile -Value $body -NoNewline -Encoding utf8
        $grant = Invoke-AzCli -Arguments @(
            'rest','--method','POST',
            '--url','https://graph.microsoft.com/v1.0/oauth2PermissionGrants',
            '--headers','Content-Type=application/json',
            '--body',"@$bodyFile"
        ) | Out-String | ConvertFrom-Json
    }
    finally {
        Remove-Item $bodyFile -ErrorAction SilentlyContinue
    }
    Write-Host "    Grant id: $($grant.id)" -ForegroundColor Green
}

if ($VerifyToken) {
    Write-Host "==> Acquiring verification token" -ForegroundColor Cyan
    $tok = Invoke-AzCli -Arguments @(
        'account','get-access-token',
        '--tenant',$TenantId,
        '--scope',"$FpaAppId/$ScopeValue",
        '--query','accessToken','-o','tsv'
    ) | Out-String
    $tok = $tok.Trim()
    Write-Host "    Token acquired." -ForegroundColor Green
}

Write-Host "`nDone." -ForegroundColor Green
```