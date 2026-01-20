# Define the directory to search
$directory = "C:\Github\defender-docs-pr\defender-for-identity"

# Get all .md files in the directory and subdirectories recursively
$mdFiles = Get-ChildItem -Path $directory -Filter *.md -File -Recurse

# Get all .png files in the directory and subdirectories recursively
$pngFiles = Get-ChildItem -Path $directory -Filter *.png -File -Recurse

# Initialize a hash set to store the names of used PNG files
$usedPngFiles = [System.Collections.Generic.HashSet[string]]::new()

# Iterate through each .md file and check for PNG file references
foreach ($mdFile in $mdFiles) {
    # Read the content of the .md file
    $content = Get-Content -Path $mdFile.FullName -Raw

    # Find all PNG file references in the .md file content
    $matches = [regex]::Matches($content, "\b\w+\.png\b")

    # Add each matched PNG file name to the hash set
    foreach ($match in $matches) {
        $usedPngFiles.Add($match.Value)
    }
}

# Initialize an array to store unused PNG files
$unusedPngFiles = @()

# Check each PNG file to see if it is used
foreach ($pngFile in $pngFiles) {
    if (-not $usedPngFiles.Contains($pngFile.Name)) {
        $unusedPngFiles += $pngFile.FullName
    }
}

# Output the list of unused PNG files
if ($unusedPngFiles.Count -gt 0) {
    $outputFilePath = "C:\GitHub\defender-docs-pr\defender-for-identity\unused-images.txt"
    $unusedPngFiles | Out-File -FilePath $outputFilePath
    Write-Host "Unused PNG files listed in: $outputFilePath"
} else {
    Write-Host "All PNG files are used in Markdown files."
}