param(
  [string]$Root = "defender-endpoint",
  [switch]$WhatIf,            # simulate edits; still parses and can write CSV
  [string]$ReportCsv,         # optional CSV of file -> parsed products
  [switch]$ReportOnly         # parse/report only; never modify files
)

# Official names we allow in YAML (output order). XDR is intentionally excluded.
$canonicalOrder = @(
  'Microsoft Defender for Endpoint',
  'Microsoft Defender for Endpoint Plan 1',
  'Microsoft Defender for Endpoint Plan 2',
  'Microsoft Defender Vulnerability Management',
  'Microsoft Defender for Business',
  'Microsoft Defender for Individuals',
  'Microsoft Defender Antivirus'
)

# Normalize list item text (lowercased keys) to official names
$canonMap = @{
  # Base + simple variants
  'microsoft defender for endpoint'              = 'Microsoft Defender for Endpoint'
  'defender for endpoint'                        = 'Microsoft Defender for Endpoint'

  # Plan 1
  'microsoft defender for endpoint plan 1'       = 'Microsoft Defender for Endpoint Plan 1'
  'defender for endpoint plan 1'                 = 'Microsoft Defender for Endpoint Plan 1'
  'defender for endpoint p1'                     = 'Microsoft Defender for Endpoint Plan 1'
  'plan 1'                                       = 'Microsoft Defender for Endpoint Plan 1'

  # Plan 2
  'microsoft defender for endpoint plan 2'       = 'Microsoft Defender for Endpoint Plan 2'
  'defender for endpoint plan 2'                 = 'Microsoft Defender for Endpoint Plan 2'
  'defender for endpoint p2'                     = 'Microsoft Defender for Endpoint Plan 2'
  'plan 2'                                       = 'Microsoft Defender for Endpoint Plan 2'

  # MDVM
  'microsoft defender vulnerability management'  = 'Microsoft Defender Vulnerability Management'
  'defender vulnerability management'            = 'Microsoft Defender Vulnerability Management'
  'mdvm'                                         = 'Microsoft Defender Vulnerability Management'

  # Business
  'microsoft defender for business'              = 'Microsoft Defender for Business'
  'defender for business'                        = 'Microsoft Defender for Business'
  'microsoft defender for endpoint business'     = 'Microsoft Defender for Business'  # normalize wrong phrasing

  # Individuals
  'microsoft defender for individuals'           = 'Microsoft Defender for Individuals'
  'defender for individuals'                     = 'Microsoft Defender for Individuals'

  # Antivirus
  'microsoft defender antivirus'                 = 'Microsoft Defender Antivirus'
  'defender antivirus'                           = 'Microsoft Defender Antivirus'
  'windows defender antivirus'                   = 'Microsoft Defender Antivirus'
}

# Regexes (case-insensitive; tolerate whitespace). We only process bullet lists.
$fmRe                 = [regex]'(?s)^\s*---\r?\n(.*?)\r?\n---\r?\n?' 
$appliesBoldRe        = [regex]'(?im)\*\*Applies to:\*\*\s*\r?\n((?:[ \t]*[-*]\s.*\r?\n?)+)'
$appliesHeadingRe     = [regex]'(?ims)^(?:#{2,6}\s*Applies to\s*)\r?\n((?:[ \t]*[-*]\s.*\r?\n?)+)'
$yamlAppliesBlockRe   = [regex]'(?m)^appliesto:\s*(?:\r?\n(?:\s*-\s*.*\r?\n?)*)?'

function Strip-MarkdownLinks([string]$s) {
  return ($s -replace '\[([^\]]+)\]\([^)]+\)', '$1').Trim()
}

# Expand “Plan 1 and Plan 2” **and** “Plan 1 or Plan 2”
function Expand-ComboPlans([string]$text) {
  $lc = $text.ToLowerInvariant()
  if ($lc -match 'plan\s*1\s*(and|&|or)\s*plan\s*2') {
    return @('Microsoft Defender for Endpoint Plan 1','Microsoft Defender for Endpoint Plan 2')
  }
  return @()
}

function Normalize-ItemsFromLine([string]$line) {
  if (-not $line) { return @() }
  # remove bullet marker; strip links; trim
  $clean = Strip-MarkdownLinks(($line -replace '^[ \t]*[-*]\s*', '')).Trim()
  if (-not $clean) { return @() }

  # Handle “Plan 1 and/or Plan 2” in a single item
  $combo = Expand-ComboPlans $clean
  if ($combo.Count -gt 0) { return ,$combo }

  $key = $clean.ToLowerInvariant()

  # Direct map to official
  if ($canonMap.ContainsKey($key)) { return ,@($canonMap[$key]) }

  # Already official and exact? keep it
  $canonLc = $canonicalOrder | ForEach-Object { $_.ToLowerInvariant() }
  if ($canonLc -contains $key) { return ,@($clean) }

  # Everything else (e.g., Microsoft Defender XDR) is ignored
  return @()
}

# PowerShell 5.1–safe ordering (no .ToArray())
function Order-Unique([string[]]$items) {
  $set = [System.Collections.Generic.HashSet[string]]::new()
  foreach ($i in ($items | Where-Object { $_ -and $_.Trim() })) { [void]$set.Add($i) }

  $ordered = @()
  foreach ($c in $canonicalOrder) {
    if ($set.Contains($c)) { $ordered += $c; [void]$set.Remove($c) }
  }

  $leftovers = @()
  foreach ($val in $set) { $leftovers += $val }
  $leftovers = $leftovers | Sort-Object

  return $ordered + $leftovers
}

# Gather files to process
$files = Get-ChildItem -Path $Root -Recurse -Include *.md -File
if (-not $files) {
  Write-Host "No markdown files found under '$Root'." -ForegroundColor Yellow
  exit 0
}

[int]$processed = 0
[int]$updated   = 0
[int]$noBlock   = 0
$reportRows     = if ($ReportCsv) { New-Object System.Collections.Generic.List[object] } else { $null }

foreach ($f in $files) {
  $processed++
  $text = Get-Content -LiteralPath $f.FullName -Raw -Encoding UTF8

  # Split optional front matter and body
  $fm = ""; $body = $text
  $m = $fmRe.Match($text)
  if ($m.Success) { $fm = $m.Groups[1].Value; $body = $text.Substring($m.Length) }

  # Find an Applies-to block (bold or heading)
  $match = $appliesBoldRe.Match($body)
  if (-not $match.Success) { $match = $appliesHeadingRe.Match($body) }
  if (-not $match.Success) {
    $noBlock++
    if ($reportRows) {
      $reportRows.Add([pscustomobject]@{File=$f.FullName;HasBlock=$false;ParsedApplies='';Action='Skipped (no block)'})
    }
    continue
  }

  # Parse bullet lines → normalized official names
  $lines = ($match.Groups[1].Value -split "\r?\n") | Where-Object { $_ -ne "" }
  $parsedAll = @()
  foreach ($ln in $lines) {
    $items = Normalize-ItemsFromLine $ln
    if ($items.Count -gt 0) { $parsedAll += $items }
  }
  $parsed = $parsedAll | Select-Object -Unique
  if (-not $parsed -or $parsed.Count -eq 0) {
    if ($reportRows) {
      $reportRows.Add([pscustomobject]@{File=$f.FullName;HasBlock=$true;ParsedApplies='';Action='Skipped (no allowed products found)'})
    }
    continue
  }

  $ordered = Order-Unique $parsed

  # Remove the Applies-to block (first occurrence only)
  $newBody = if ($appliesBoldRe.IsMatch($body)) {
    $appliesBoldRe.Replace($body, '', 1)
  } else {
    $appliesHeadingRe.Replace($body, '', 1)
  }

  # Overwrite 'appliesto' (no merge)
  $newFm = $fm
  if ($yamlAppliesBlockRe.IsMatch($newFm)) { $newFm = $yamlAppliesBlockRe.Replace($newFm, '').TrimEnd() }
  $appliestoYaml = "appliesto:`n" + ($ordered | ForEach-Object { "  - $_" } | Out-String)

  $rebuilt = if ($m.Success) {
    "---`n$($newFm.TrimEnd())`n$appliestoYaml`n---`n$($newBody.TrimStart())"
  } else {
    "---`n$appliestoYaml---`n`n$($newBody.TrimStart())"
  }

  # Report row
  if ($reportRows) {
    $reportRows.Add([pscustomobject]@{
      File          = $f.FullName
      HasBlock      = $true
      ParsedApplies = ($ordered -join '; ')
      Action        = if ($WhatIf -or $ReportOnly) { 'Would update' } else { 'Updated' }
    })
  }

  # Apply or simulate
  if ($ReportOnly -or $WhatIf) {
    Write-Host "[DRY] $($f.FullName) -> appliesto: $($ordered -join ', ')" -ForegroundColor Cyan
    continue
  }

  if ($rebuilt -ne $text) {
    Set-Content -LiteralPath $f.FullName -Value $rebuilt -Encoding UTF8
    Write-Host "Updated: $($f.FullName)" -ForegroundColor Green
    Write-Host "         appliesto: $($ordered -join ', ')"
    $updated++
  }
}

# Write CSV if requested
if ($reportRows) {
  try {
    $reportRows | Export-Csv -Path $ReportCsv -NoTypeInformation -Encoding UTF8
    Write-Host "Report written: $ReportCsv" -ForegroundColor Yellow
  } catch {
    Write-Host "Failed to write report CSV: $($_.Exception.Message)" -ForegroundColor Red
  }
}

Write-Host "Processed: $processed"
Write-Host "Updated:   $updated"
Write-Host "No block:  $noBlock"
