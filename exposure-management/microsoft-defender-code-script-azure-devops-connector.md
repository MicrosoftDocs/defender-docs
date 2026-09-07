---
title: Microsoft Defender Code script for Azure DevOps connector
description: Use the Microsoft Defender Code PowerShell script to provision the required service principals and grant admin consent for an Azure DevOps connector.
ms.topic: how-to
ms.date: 08/05/2026
ai-usage: ai-assisted
---

# Microsoft Defender Code script for Azure DevOps connector

Use the `Grant-DefenderConsent.ps1` PowerShell script to provision Microsoft Defender Code and grant tenant-wide admin consent for an Azure DevOps connector.

Copy the following script into a file named `Grant-DefenderConsent.ps1`.

## Run the script

Run the script in one of the following modes.

### Provisioning only

Sign in and create or resolve the two service principals without granting consent or validating a token:

```powershell
.\Grant-DefenderConsent.ps1 -TenantId <tenant-guid> -ProvisionOnly
```

### Provisioning and consent

Sign in, provision the service principals, and grant consent. This is the default behavior:

```powershell
.\Grant-DefenderConsent.ps1 -TenantId <tenant-guid>
```

### Provisioning, consent, and token validation

Run all three stages, including token validation:

```powershell
.\Grant-DefenderConsent.ps1 -TenantId <tenant-guid> -VerifyToken
```

## PowerShell script

```powershell
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidatePattern('^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')]
    [string]$TenantId,

    # Run only the provisioning stage (login + service principal resolve/create),
    # then stop. Consent grant and token verification are skipped.
    [switch]$ProvisionOnly,

    [switch]$VerifyToken
)

$ErrorActionPreference = 'Stop'

if ($ProvisionOnly -and $VerifyToken) {
    Write-Warning "-VerifyToken is ignored when -ProvisionOnly is specified."
}

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

if ($ProvisionOnly) {
    Write-Host "==> -ProvisionOnly specified: skipping consent grant and token verification." -ForegroundColor Yellow
    Write-Host "`nDone (provisioning only)." -ForegroundColor Green
    return
}

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