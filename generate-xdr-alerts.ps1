# PowerShell script to generate alerts-xdr.md from JSON source
# Reads alerts from JSON file and generates markdown documentation

# Load JSON data
$jsonPath = "c:\Users\abbyweisberg\OneDrive - Microsoft\Documents\MDI\alerts_january_2026.json"
$json = Get-Content $jsonPath -Raw | ConvertFrom-Json

# Define category mappings
$categoryMap = @{
    'InitialAccess' = @{
        Name = 'Initial Access'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to gain initial access to your organization.'
    }
    'Execution' = @{
        Name = 'Execution'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to run malicious code in your organization.'
    }
    'Persistence' = @{
        Name = 'Persistence'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to maintain their foothold in your organization.'
    }
    'PrivilegeEscalation' = @{
        Name = 'Privilege Escalation'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to gain higher-level permissions in your organization.'
    }
    'DefenseEvasion' = @{
        Name = 'Defense Evasion'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to evade detection in your organization.'
    }
    'CredentialAccess' = @{
        Name = 'Credential Access'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to steal account names and passwords from your organization.'
    }
    'Discovery' = @{
        Name = 'Discovery'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to gather information about your organization.'
    }
    'LateralMovement' = @{
        Name = 'Lateral Movement'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to move between resources or identities in your organization.'
    }
    'Collection' = @{
        Name = 'Collection'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to gather data of interest to their goal from your organization.'
    }
    'Reconnaissance' = @{
        Name = 'Reconnaissance'
        Description = 'This section describes alerts indicating that a malicious actor might be attempting to gather information for a future attack.'
    }
    'SuspiciousNetworkTraffic' = @{
        Name = 'Suspicious Network Traffic'
        Description = 'This section describes alerts indicating suspicious network traffic that might be related to malicious activities.'
    }
}

# Group alerts by category
$groupedAlerts = $json | Group-Object -Property category

# Start building the markdown content
$mdContent = @"
---
title:  Microsoft Defender for Identity XDR security alerts
description: Understand and remediate security alerts issued by Defender for Identity, now with extended detection and response (XDR) support.
ms.date: 01/20/2026
ms.topic: conceptual
ms.reviewer: yossidahan
---

# Microsoft Defender for Identity XDR security alerts

This article lists all Defender for Identity Extended Detection and Response (XDR) security alerts. XDR security alerts are based on alerts sent by Defender for Identity to the Microsoft Defender portal.

> [!NOTE]
> For alerts that continue to use the classic structure, see [Classic Defender for Identity security alerts](alerts-overview.md).

## Alert name mapping

Alert names in the XDR structure are different than the alert names in the classic structure, but alert IDs stay consistent between the two alert structures.

For more information, see [Security alerts in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-alerts) and [Investigate alerts in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-alerts#alert-sources).

## Alerts by category

Defender for Identity XDR security alerts are divided by category, or phase, as seen in a typical cyber-attack kill chain.

Use the links in the following table to jump directly to the relevant category and review the alerts available for each category:

"@

# Add category links
foreach ($group in $groupedAlerts | Sort-Object Name) {
    $categoryKey = $group.Name
    if ($categoryMap.ContainsKey($categoryKey)) {
        $categoryName = $categoryMap[$categoryKey].Name
        $anchor = $categoryName.ToLower() -replace ' ', '-'
        $mdContent += "- [$categoryName alerts](#$anchor-alerts)`n"
    }
}

$mdContent += "`n"

# Generate content for each category
foreach ($group in $groupedAlerts | Sort-Object Name) {
    $categoryKey = $group.Name
    
    if ($categoryMap.ContainsKey($categoryKey)) {
        $categoryInfo = $categoryMap[$categoryKey]
        $categoryName = $categoryInfo.Name
        $categoryDescription = $categoryInfo.Description
        
        # Add category header
        $mdContent += "## $categoryName alerts`n`n"
        $mdContent += "$categoryDescription`n`n"
        
        # Add table header
        $mdContent += "| Security alert name | Severity | MITRE Technique | Detector ID |`n"
        $mdContent += "|---|---|---|---|`n"
        
        # Sort alerts within category by title
        $alerts = $group.Group | Sort-Object title
        
        foreach ($alert in $alerts) {
            $anchorName = $alert.title.ToLower() -replace '[^a-z0-9\s-]', '' -replace '\s+', '-'
            $title = $alert.title
            $description = $alert.description
            $severity = $alert.severity
            
            # Build MITRE links
            $mitreLinks = @()
            foreach ($mitre in $alert.mitre) {
                $mitreLinks += "[$mitre](https://attack.mitre.org/techniques/$mitre)"
            }
            $mitreText = $mitreLinks -join ', '
            
            $detectorId = $alert.type
            
            # Format the row
            $mdContent += "|<a name=`"$anchorName`"></a><details><summary>$title</summary><br>**Description**:<br><br>$description</details> | $severity | $mitreText | $detectorId |`n"
        }
        
        $mdContent += "`n"
    }
}

# Write to file
$outputPath = "c:\Github\defender-docs-pr\defender-for-identity\alerts-xdr.md"
$mdContent | Out-File -FilePath $outputPath -Encoding UTF8 -NoNewline

Write-Host "Generated $outputPath with $($json.Count) alerts" -ForegroundColor Green
