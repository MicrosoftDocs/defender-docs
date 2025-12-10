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

## Asset IDs from Recommendations

### Method 1: From Cloud Assets Recommendations

1. Navigate to **Microsoft Defender portal** > **Exposure Management** > **Recommendations** > **Cloud** tab.
1. Locate the recommendation containing the asset you need to identify.
1. Select the **exposed asset** in the recommendation panel.
1. This opens the asset details page.
1. In the asset details, look for the **Asset ID** field.
1. Copy the identifier using the copy button or by selecting and copying the text.

### Method 2: From Cloud Infrastructure Asset Inventory

1. Navigate to **Microsoft Defender portal** > **Assets** > **Cloud**.
1. Use filters to locate the specific asset:
   - Filter by environment (Azure, AWS, GCP)
   - Filter by workload type
   - Use the search box to find asset by name
1. Select the asset name to open detailed information.
1. In the asset details panel, locate the **Asset ID**.
1. Copy the identifier for your support case.

## Vulnerability IDs from Cloud vulnerability

### Extracting Vulnerability IDs

1. Navigate to **Microsoft Defender portal** > **Exposure Management** > **Recommendations**.
1. In the Cloud Assets tab, filter by **Vulnerabilities** category on the left navigation.
1. Select a vulnerability-related recommendation.
1. In the recommendation side panel, look for:
   - **Associated CVEs** tab or section
   - **Vulnerability details** with specific identifiers
   - **CVSS scores** and vulnerability classifications
1. Select on individual vulnerabilities to get detailed information including:
   - Full CVE identifier (e.g., CVE-2023-1234)
   - Microsoft vulnerability ID (if applicable)
   - Package-specific vulnerability identifiers
1. Copy the relevant vulnerability ID for your support case.

## Initiative IDs from Cloud initiative

### Extracting initiative identifiers from Recommendations initiative mapping

1. Navigate to **Exposure Management** > **Recommendations**.
1. Select any recommendation.
1. In the recommendation side panel, go to **Related initiatives**.
1. This shows which initiatives the recommendation belongs to.
1. Each initiative will display its name and identifier.
1. Copy the initiative ID associated with the specific recommendation.

## Environment IDs for Cloud Scopes

### Cloud Scope Environment IDs

1. Navigate to **Microsoft Defender portal** > **Assets** > **Cloud Infrastructure** and check the scope filter dropdown.
1. The environment filter lists all the environment identifiers.
1. Select a scope and then choose the environment filter to see detailed information including all environment IDs within that scope.

## Related Content

- [Review security recommendations](review-security-recommendations.md)
- [Cloud asset inventory](asset-inventory.md)
- [Manage and respond to security alerts](manage-respond-alerts.md)
- [Regulatory compliance dashboard](regulatory-compliance-dashboard.md)
- [Enable enhanced security features](enable-enhanced-security.md)
