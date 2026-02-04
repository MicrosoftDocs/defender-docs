$root = "C:\GitHub\defender-docs-pr\defender-for-cloud-apps"
$tocPath = Join-Path $root "toc.yml"
$includesPath = Join-Path $root "includes"

$toc = Get-Content -Path $tocPath -Raw

$hrefs = Select-String -Path $tocPath -Pattern "^\s*href:\s*(.+)$" | ForEach-Object {
    $_.Matches[0].Groups[1].Value.Trim([char]34, [char]92, [char]32)
} | ForEach-Object {
    $_ -replace "^defender-for-cloud-apps/", ""
} | ForEach-Object {
    $_ -replace "^/", ""
} | ForEach-Object {
    $_ -replace "^\./", ""
} | ForEach-Object {
    $_ -replace "\\", "/"
} | ForEach-Object {
    $_ -replace "#.*$", ""
} | ForEach-Object {
    $_ -replace "\?.*$", ""
} | Where-Object {
    $_ -ne "" -and $_ -notmatch "^(https?:|/)"
} | Where-Object {
    $_ -match "\.md$"
}

$hrefSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
$hrefs | ForEach-Object { [void]$hrefSet.Add($_) }

Get-ChildItem -Path $root -Recurse -Filter *.md | Where-Object {
    $_.FullName -notlike "$includesPath*"
} | ForEach-Object {
    $_.FullName.Substring($root.Length + 1) -replace "\\", "/"
} | Where-Object {
    -not $hrefSet.Contains($_)
}
