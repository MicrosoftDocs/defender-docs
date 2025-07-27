param(
    [Parameter(Mandatory=$true)]
    [string]$InputPath,
    [Parameter(Mandatory=$true)]
    [string]$OutputPath
)

# Read the file
$content = Get-Content $InputPath -Raw

# Split into lines for easier processing
$lines = $content -split "`r?`n"

# Prepare output
$output = @()
$i = 0
while ($i -lt $lines.Count) {
    $line = $lines[$i]

    # Detect H2 (##) that is not "See also"
    if ($line -match '^## (.+?)( \(external ID (\d+)\))?( \(Preview\))?$' -and $line -notmatch 'See also') {
        $heading = $matches[1].Trim()
        $externalId = $matches[3]
        $details = @()
        $severity = ""
        $inMitre = $false
        $mitreRows = @()

        # Gather details block
        $i++
        while ($i -lt $lines.Count -and ($lines[$i] -notmatch '^## ' -and $lines[$i] -notmatch '^\|Security alert\|')) {
            $l = $lines[$i]

            # Extract severity
            if ($l -match '^\*\*Severity\*\*:\s*(.+)$') {
                $severity = $matches[1].Trim()
                $i++
                continue
            }
            # MITRE table handling inside the details block
                if ($l -match '^\*\*MITRE\*\*:<br>') {
                    $i++
                    $mitreRows = @()
                    # Collect MITRE table rows
                    while ($i -lt $lines.Count -and $lines[$i] -match '^\|') {
                        $mitreRows += $lines[$i]
                        $i++
                    }
                    # Output formatted MITRE bullets
                    foreach ($row in $mitreRows) {
                        if ($row -match '^\|([^|]+)\|([^\|]+)\|') {
                            $label = $matches[1].Trim()
                            $value = $matches[2].Trim()
                            if ($label -match 'Primary MITRE tactic|MITRE attack technique|MITRE attack sub-technique') {
                                $details += "_ **$label**: $value<br>"
                            }
                        }
                    }
                    continue
                }

            # Skip empty severity lines
            if ($l -match '^\*\*Severity\*\*:') {
                $i++
                continue
            }

            # Only add non-MITRE-table lines
            if (-not $inMitre) {
                $details += $l
            }
            $i++
        }

        # Remove any remaining MITRE rows
        if ($mitreRows.Count) {
            $details += $mitreRows
        }

        # Remove any "**Severity**" or "**External ID**" lines from details
        $details = $details | Where-Object { $_ -notmatch '^\*\*Severity\*\*:' -and $_ -notmatch '^\*\*External ID\*\*:' }

        # Remove trailing/leading empty lines
        $details = $details | Where-Object { $_.Trim() -ne "" }

        # Join details with <br>
        $detailsBlock = ($details -join "<br>`n").Trim()

        # Output the details block and table row
        $output += "|<details><summary>$heading</summary>"
        $output += "$detailsBlock"
        $output += "</details>|$severity|$externalId|"
    } else {
        $output += $line
        $i++
    }
}

# Write to output file
Set-Content -Path $OutputPath -Value ($output -join "`r`n")
Write-Host "Conversion complete. Output written to $OutputPath"