param(
    [Parameter(Mandatory=$false)]
    [string]$InputPath = "c:\GitHub\defender-docs-pr\ATPDocs\alerts-overview.md",
    [Parameter(Mandatory=$false)]
    [string]$OutputPath = ""
)

# If no output path specified, overwrite the input file
if (-not $OutputPath) {
    $OutputPath = $InputPath
}

# Read the file content
$content = Get-Content $InputPath -Raw

# Define the regex pattern to match <details><summary>text</summary>
# This captures the text between the tags (without ** markers)
$pattern = '<details><summary>(.*?)</summary>'

# Replace with anchor tag + original content
$content = [regex]::Replace($content, $pattern, {
    param($match)
    
    # Get the captured text (the title)
    $title = $match.Groups[1].Value
    
    # Create anchor name by:
    # 1. Converting to lowercase
    # 2. Replacing spaces and special characters with hyphens
    # 3. Removing multiple consecutive hyphens
    # 4. Trimming hyphens from start/end
    $anchorName = $title.ToLower() -replace '[^\w\s-]', '' -replace '\s+', '-' -replace '-+', '-' -replace '^-+|-+$', ''
    
    # Return the replacement string
    return "<a name=`"$anchorName`"></a><details><summary>$title</summary>"
})

# Write the modified content back to file
Set-Content -Path $OutputPath -Value $content -Encoding UTF8

Write-Host "Successfully added anchor tags to all <details><summary> instances."
Write-Host "Input file: $InputPath"
Write-Host "Output file: $OutputPath"