---
title: Extract identifiers for support cases
description: Learn how to obtain resource IDs, vulnerability IDs, initiative IDs, and environment IDs from Microsoft Defender for Cloud in the Defender portal for customer support troubleshooting and escalation.
ms.topic: how-to
author: dlanger
ms.author: dlanger
ms.date: 11/19/2025
ms.custom: troubleshooting, support
---

# Extract identifiers for support cases

When working with Microsoft Defender for Cloud support cases, you often need to provide specific identifiers for assets, vulnerabilities, initiatives, and environments. This article provides guidance for extracting these critical identifiers from the Microsoft Defender portal.

Without proper resource identifiers, support teams cannot effectively troubleshoot or escalate customer issues. This guide ensures you can quickly locate and provide the necessary information for efficient case resolution.

## Prerequisites

- Access to Microsoft Defender for Cloud through the Microsoft Defender portal
- Appropriate permissions to view assets and security recommendations
- Active security recommendations, vulnerabilities, or assets to extract identifiers from

## Resource IDs from Recommendations

### Method 1: From Cloud Assets Recommendations

1. Navigate to **Microsoft Defender portal** > **Exposure Management** > **Recommendations** > **Cloud Assets** tab.
2. Locate the recommendation containing the asset you need to identify.
3. Select the **exposed asset** in the recommendation panel.
4. This opens the asset details page.
5. In the asset details, look for the **Asset ID** field.
6. Copy the identifier using the copy button or by selecting and copying the text.

### Method 2: From Cloud Infrastructure Asset Inventory

1. Navigate to **Microsoft Defender portal** > **Assets** > **Cloud infrastructure**.
2. Use filters to locate the specific asset:
   - Filter by environment (Azure, AWS, GCP)
   - Filter by workload type
   - Use the search box to find asset by name
3. Select the asset name to open detailed information.
4. In the asset details panel, locate the **Asset ID**.
5. Copy the identifier for your support case.

## Vulnerability IDs from Cloud vulnerability

### Extracting Vulnerability IDs

1. Navigate to **Microsoft Defender portal** > **Exposure Management** > **Recommendations**.
2. Filter by **Vulnerabilities** category on the left navigation.
3. Select a vulnerability-related recommendation.
4. In the recommendation side panel, look for:
   - **Associated CVEs** tab or section
   - **Vulnerability details** with specific identifiers
   - **CVSS scores** and vulnerability classifications
5. Click on individual vulnerabilities to get detailed information including:
   - Full CVE identifier (e.g., CVE-2023-1234)
   - Microsoft vulnerability ID (if applicable)
   - Package-specific vulnerability identifiers
6. Copy the relevant vulnerability ID for your support case.

### From Cloud Infrastructure Vulnerabilities

1. Navigate to **Assets** > **Cloud Infrastructure**.
2. Filter or search for the affected resource.
3. Click on the resource to open details.
4. Review the **Security recommendations** or **Vulnerabilities** section.
5. Each vulnerability entry will display its identifier (CVE, GHSA, or Microsoft ID).
6. Copy the specific vulnerability identifier needed for support.

## Initiative IDs from Cloud Initiative

### Extracting Initiative Identifiers

1. Navigate to **Microsoft Defender portal** > **Exposure Management** > **Initiatives**.
2. Click on **Cloud Security** or the specific initiative category.
3. Select the initiative you need the ID for.
4. In the initiative details panel, look for:
   - **Initiative ID** or **Definition ID**
   - **Policy assignment ID**
   - **Standard reference** (for compliance-based initiatives)
5. Copy the relevant identifier for your support case.

### From Recommendation Initiative Mapping

1. Navigate to **Exposure Management** > **Recommendations**.
2. Select any recommendation.
3. In the recommendation side panel, go to **Related initiatives**.
4. This shows which initiatives the recommendation belongs to.
5. Each initiative will display its name and identifier.
6. Copy the initiative ID associated with the specific recommendation.

## Environment IDs for Cloud Scopes

### Cloud Scope Environment IDs

1. Navigate to **Microsoft Defender portal** > **Settings** > **Cloud Scopes**.
2. Or go to **Assets** > **Cloud Infrastructure** and check the scope filter dropdown.
3. Each cloud scope shows:
   - **Scope name** (custom name)
   - **Environment identifier** (subscription ID, account ID, project ID)
   - **Cloud provider** (Azure, AWS, GCP)
4. Click on a scope to see detailed information including all environment IDs within that scope.

### From Asset Environment Information

1. Navigate to **Assets** > **Cloud Infrastructure**.
2. In the environment filter, you can see all connected environments with their IDs:
   - **Azure subscriptions** with subscription IDs
   - **AWS accounts** with account IDs  
   - **GCP projects** with project IDs
3. Select any asset to view its specific environment context.
4. The asset details will show the exact environment identifier.

### From Cloud Overview Dashboard

1. Navigate to **Cloud Infrastructure** > **Overview**.
2. The dashboard shows environment summary including:
   - Number of connected subscriptions/accounts/projects
   - Environment health status
3. Click on environment tiles to drill down into specific environment details.
4. Each environment section displays the relevant environment IDs.

## Asset Details Access Patterns

### Common Resource Information Fields

Regardless of the feature you're using, when you access asset details, look for these key identifiers:

**All Cloud Resources:**
- **Asset ID/Resource ID**: Unique resource identifier
- **Environment ID**: Subscription/Account/Project ID
- **Cloud Provider**: Azure, AWS, or GCP
- **Asset Type**: Service or resource type
- **Location/Region**: Geographic location
- **Asset Name**: Human-readable resource name

### Quick Reference for Support Cases

When opening a support case, always include:

1. **Resource ID** - Full resource identifier
2. **Environment ID** - Subscription/Account/Project ID
3. **Recommendation ID** - If related to a specific recommendation
4. **Vulnerability ID** - CVE or vulnerability identifier (if applicable)
5. **Initiative ID** - If related to compliance or policy
6. **Timestamp** - When the issue was observed
7. **Cloud Provider** - Azure, AWS, or GCP

## Troubleshooting Tips

### If Resource IDs Are Not Visible

1. **Check permissions**: Ensure you have Reader access or higher to the resource.
2. **Verify scope**: Make sure you're viewing the correct subscription/account/project.
3. **Refresh the page**: Sometimes identifiers don't load immediately.
4. **Use alternative methods**: Try Azure Resource Graph Explorer for Azure resources.

### If Vulnerability IDs Are Missing

1. **Check scan status**: Ensure vulnerability scanning has completed.
2. **Verify plan coverage**: Some vulnerability features require specific Defender plans.
3. **Review finding details**: Click into individual findings for more detailed identifiers.

### If Initiative IDs Are Not Found

1. **Check policy assignments**: Verify initiatives are actually assigned to your scope.
2. **Review permissions**: Ensure you have access to view policy information.
3. **Use Azure Policy portal**: For Azure initiatives, check the Azure Policy service directly.

## Related Content

- [Review security recommendations](review-security-recommendations.md)
- [Cloud asset inventory](asset-inventory.md)
- [Manage and respond to security alerts](manage-respond-alerts.md)
- [Regulatory compliance dashboard](regulatory-compliance-dashboard.md)
- [Enable enhanced security features](enable-enhanced-security.md)
