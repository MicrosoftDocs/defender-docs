# This script rewrites MITRE table blocks in alerts-converted.md to bold-label format from line 25 onward

$path = 'c:\GitHub\defender-docs-pr\ATPDocs\alerts-converted.md'
$lines = Get-Content $path
$before = $lines[0..24]
$after = $lines[25..($lines.Count-1)] -join "`n"

# Pattern for MITRE table with Secondary MITRE tactic
$pattern1 = '(?ms)\*\*MITRE\*\*:<br>\s*\|Primary MITRE tactic\s*\|\s*([^\|]+?)\s*\|\s*<br>\s*\|---------\|---------\|\s*<br>\s*\|Secondary MITRE tactic\s*\|\s*([^\|]+?)\s*\|\s*<br>\s*\|MITRE attack technique\s*\|\s*([^\|]+?)\s*\|\s*<br>\s*\|MITRE attack subtechnique\s*\|\s*([^\|]+?)\s*\|\s*<br>'
$replace1 = '**MITRE**:<br>
**Primary MITRE tactic**: $1<br>
**Secondary MITRE tactic**: $2<br>
**MITRE attack technique**: $3<br>
**MITRE attack subtechnique**: $4<br>
'

# Pattern for MITRE table without Secondary MITRE tactic
$pattern2 = '(?ms)\*\*MITRE\*\*:<br>\s*\|Primary MITRE tactic\s*\|\s*([^\|]+?)\s*\|\s*<br>\s*\|---------\|---------\|\s*<br>\s*\|MITRE attack technique\s*\|\s*([^\|]+?)\s*\|\s*<br>\s*\|MITRE attack subtechnique\s*\|\s*([^\|]+?)\s*\|\s*<br>'
$replace2 = '**MITRE**:<br>
**Primary MITRE tactic**: $1<br>
**MITRE attack technique**: $2<br>
**MITRE attack subtechnique**: $3<br>
'

# Apply both patterns
$after = [regex]::Replace($after, $pattern1, $replace1)
$after = [regex]::Replace($after, $pattern2, $replace2)

# Save the result
$final = $before -join "`n" + "`n" + $after
Set-Content $path $final
Write-Host "MITRE table blocks converted to bold-label format."