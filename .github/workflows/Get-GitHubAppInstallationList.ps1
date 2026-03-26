param(
  [int]$AppId = 2772771,
  [string]$PemPath = "C:\git\_PEM\team-pr-workflow-bot.2026-02-10.private-key.pem"
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

if (-not (Test-Path -LiteralPath $PemPath)) {
  throw "PEM file not found: $PemPath"
}

# --- Helpers ---
function Convert-ToBase64Url([byte[]]$bytes) {
  [Convert]::ToBase64String($bytes).TrimEnd('=').Replace('+','-').Replace('/','_')
}

function New-GitHubAppJwt([int]$AppId, [string]$PemPath) {
  $pem = Get-Content -LiteralPath $PemPath -Raw

  $rsa = [System.Security.Cryptography.RSA]::Create()

  # ImportFromPem exists in PowerShell 7+ (.NET 5+). Prefer it because it parses PEM safely.
  if ($rsa.PSObject.Methods.Name -contains "ImportFromPem") {
    $rsa.ImportFromPem($pem)
  } else {
    throw "This script requires PowerShell 7+ (ImportFromPem not available). Open 'pwsh' and rerun."
  }

  $now = [System.DateTimeOffset]::UtcNow.ToUnixTimeSeconds()

  $headerJson  = @{ alg = "RS256"; typ = "JWT" } | ConvertTo-Json -Compress
  $payloadJson = @{
    iat = $now - 60
    exp = $now + 540   # 9 minutes; GitHub requires exp <= 10 minutes in the future
    iss = $AppId
  } | ConvertTo-Json -Compress

  $header  = Convert-ToBase64Url ([Text.Encoding]::UTF8.GetBytes($headerJson))
  $payload = Convert-ToBase64Url ([Text.Encoding]::UTF8.GetBytes($payloadJson))

  $unsigned = "$header.$payload"
  $sigBytes = $rsa.SignData(
    [Text.Encoding]::UTF8.GetBytes($unsigned),
    [System.Security.Cryptography.HashAlgorithmName]::SHA256,
    [System.Security.Cryptography.RSASignaturePadding]::Pkcs1
  )

  $sig = Convert-ToBase64Url $sigBytes
  return "$unsigned.$sig"
}

function Invoke-GitHubPaged {
  param(
    [Parameter(Mandatory=$true)][string]$Url,
    [Parameter(Mandatory=$true)][hashtable]$Headers
  )

  $all = @()
  $page = 1
  while ($true) {
    $pagedUrl = if ($Url -match "\?") { "${Url}&per_page=100&page=$page" } else { "${Url}?per_page=100&page=$page" }
    $resp = Invoke-RestMethod -Uri $pagedUrl -Headers $Headers
    if ($null -eq $resp) { break }

    # Some endpoints return arrays; some return objects with .repositories etc.
    if ($resp -is [System.Array]) {
      $all += $resp
      if ($resp.Count -lt 100) { break }
    } else {
      $all += $resp
      break
    }

    $page++
  }
  return $all
}

# --- 1) JWT ---
$jwt = New-GitHubAppJwt -AppId $AppId -PemPath $PemPath

$jwtHeaders = @{
  Authorization = "Bearer $jwt"
  Accept        = "application/vnd.github+json"
  "X-GitHub-Api-Version" = "2026-03-10"
}

# Optional sanity check: confirm JWT works by calling GET /app
# Invoke-RestMethod -Uri "https://api.github.com/app" -Headers $jwtHeaders | Out-Null

# --- 2) List installations ---
$installations = Invoke-GitHubPaged -Url "https://api.github.com/app/installations" -Headers $jwtHeaders

# --- 3) For each installation: create installation token, list repos ---
$results = @()

foreach ($inst in $installations) {
  $instId = $inst.id
  $acct   = $inst.account.login

  $tokenResp = Invoke-RestMethod -Method POST -Uri "https://api.github.com/app/installations/$instId/access_tokens" -Headers $jwtHeaders
  $instToken = $tokenResp.token

  $instHeaders = @{
    Authorization = "Bearer $instToken"
    Accept        = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2026-03-10"
  }

  # GET /installation/repositories (installation access token) 【1-2e1f7f】【5-693577】
  $page = 1
  while ($true) {
    $repoResp = Invoke-RestMethod -Uri "https://api.github.com/installation/repositories?per_page=100&page=$page" -Headers $instHeaders

    foreach ($r in $repoResp.repositories) {
      $results += [pscustomobject]@{
        AccountLogin      = $acct
        InstallationId    = $instId
        RepositoryFullName= $r.full_name
        RepositoryId      = $r.id
        Private           = $r.private
      }
    }

    if ($repoResp.repositories.Count -lt 100) { break }
    $page++
  }
}

# --- Output: grouped on screen + CSV export ---
$results | Sort-Object AccountLogin, RepositoryFullName | Format-Table -AutoSize

# $csvPath = Join-Path (Get-Location) ("GitHubAppRepos_{0}.csv" -f (Get-Date -Format "yyyyMMdd_HHmmss"))
# $results | Sort-Object AccountLogin, RepositoryFullName | Export-Csv -NoTypeInformation -Path $csvPath
# Write-Host "`nSaved CSV: $csvPath"
