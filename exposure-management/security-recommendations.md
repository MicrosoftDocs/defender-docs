---
title: Review security recommendations in Microsoft Security Exposure Management
description: Learn how to review security recommendations in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 07/30/2025
---

# Review security recommendations

This article describes how to work with security recommendations in the new unified recommendations experience in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

## Prerequisites

- Learn about the [unified recommendations catalog](exposure-insights-overview.md#working-with-recommendations) before you start.
- [Review permissions and prerequisites needed](prerequisites.md) for working with Security Exposure Management.
- Understand that all recommendations from various sources (Secure Score, Defender for Cloud, Defender for Endpoint, etc.) are now consolidated into one unified view in the Defender portal.

## Overview of the unified recommendations catalog

The unified recommendations catalog brings together all Microsoft security recommendations in a single, streamlined experience. This consolidates recommendations from:

- Microsoft Secure Score
- Microsoft Security Exposure Management Recommendations Catalog  
- Microsoft Defender for Cloud (for cloud recommendations)
- Microsoft Defender for Vulnerability Management

You can explore the full breadth of Microsoft's security recommendations without navigating multiple separate experiences across different Microsoft Security products.

:::image type="content" source="./media/vulnerability-management/recommendations-summary.png" alt-text="Screenshot of the unified recommendations summary." lightbox="./media/vulnerability-management/recommendations-summary.png":::

## Review recommendations

1. In the [Microsoft Defender portal](https://security.microsoft.com), select **Exposure management > Exposure insights > Recommendations** to open the unified [Recommendations](https://security.microsoft.com/exposure-recommendations) page.

    :::image type="content" source="./media/recommendations-navigation.png" alt-text="Screenshot of the recommendations window." lightbox="./media/recommendations-navigation.png":::

### Navigate the new unified recommendations interface

1. **Use the attack surface tabs**: The recommendations are now organized by tabs for different domains:
   - **Devices** - Device-related recommendations including misconfigurations and vulnerabilities
   - **Cloud** - Multicloud (Azure, AWS, and GCP), hybrid environments and code recommendations with risk-based prioritization. 
   - **Identity** - Identity-related security recommendations
   - **SaaS** - Software-as-a-Service application recommendations
   - **Data** - Data protection recommendations

1. **Separate views for issue types**: On the Devices tab, you'll find separate views for:
   - **Misconfigurations** - Configuration-related security issues from MDVM, Microsoft Secure Score, and Security Exposure Management, contributing to the Devices Secure Score
   - **Vulnerabilities** - Software vulnerabilities from MDVM requiring patches, preserving the familiar structure, fields, filters, and prioritization logic with the same exposure score
   
   This separation recognizes that misconfigurations and vulnerabilities often represent distinct workflows handled by different personas, allowing for clearer prioritization and ownership.

## Cloud recommendations with risk-based prioritization

In the Defender portal, cloud recommendations are prioritized by risk, helping you focus on what matters most. The Cloud assets tab presents security recommendations related to cloud assets across your environment with enhanced context. It has separate views for misconfigurations, vulnerabilities, and exposed secrets.

:::image type="content" source="media/security-recommendations/cloud-assets-security-recommendations.png" alt-text="Screenshots of cloud assets recommendations tab" lightbox="media/security-recommendations/cloud-assets-security-recommendations.png":::

With the integration of Defender for Cloud in the Defender portal, you can also access enhanced cloud recommendations through the unified interface:

:::image type="content" source="./media/defender-for-cloud-defender-portal/recommendations.png" alt-text="Screenshot of unified cloud recommendations in the Defender portal." lightbox="./media/defender-for-cloud-defender-portal/recommendations.png":::

### Cloud Secure Score integration

The Cloud Secure Score provides comprehensive scoring alongside traditional Secure Score:

:::image type="content" source="./media/defender-for-cloud-defender-portal/cloud-secure-score.png" alt-text="Screenshot of Cloud Secure Score in the Defender portal." lightbox="./media/defender-for-cloud-defender-portal/cloud-secure-score.png":::

Key improvements in the cloud recommendations experience include:

- **Risk factors per asset**: Assess the broader exposure context of each recommendation for informed decisions
- **Risk-based scoring**: New scoring that weighs recommendations based on severity, asset context, and potential impact
- **Enhanced data**: Core recommendation data from Azure Recommendations enriched with additional fields and capabilities from Exposure Management
- **Prioritized by criticality**: Greater emphasis on critical issues that pose the highest risk to your organization

## Device vulnerabilities and misconfigurations

The Devices tab maintains familiar functionality while benefiting from the unified catalog structure:

### Device vulnerabilities

- **Preserved experience**: The same table structure, fields, filters, and prioritization logic from MDVM
- **Familiar exposure scoring**: Uses the established exposure score methodology for assessing device vulnerability
- **Integrated workflow**: Part of the unified experience while maintaining specialized vulnerability management workflows

### Device misconfigurations  

- **Unified data sources**: Combines device-related misconfiguration recommendations from MDVM, Microsoft Secure Score, and Security Exposure Management
- **Secure Score contribution**: Recommendations contribute to the Devices Secure Score following Microsoft's established calculation methodology
- **Enhanced baseline logic**: Based on MDVM's device recommendations enhanced with additional context from other sources

1. **Use enhanced filtering and sorting**: Sort the recommendations by any of the headings or filter them based on your task needs. Sorting includes all of the headers:
    - **Name** - Recommendation name
    - **State** - Compliant or not compliant
    - **Impact** - High, low, or medium impact
    - **Workload** - Which workload the recommendations relate to
    - **Domain** - Device, apps, data, or identity
    - **Risk Score** - For cloud recommendations, shows calculated risk score based on asset value and other factors
    - **Last calculated** - Last time the recommendation was calculated
    - **Last state change** - Last time the recommendation state changed
    - **Related initiatives** - The number of related initiatives
    - **Related metrics** - The number of related metrics

1. **Apply advanced filtering**: Filter recommendations by:
   - State (compliant, not compliant, etc.)
   - Impact level
   - Workload source
   - Domain/attack surface
   - Risk score (for cloud recommendations)

1. Select a recommendation to view and review details.

You can also review recommendations on the **Recommendations** tab in a specific security initiative page in **Initiatives** to access [Microsoft Exposure Recommendations](https://security.microsoft.com/exposure-recommendations) in the [Microsoft Defender portal](https://security.microsoft.com/).

## Remediate recommendations

1. To remediate a recommendation, select a specific recommendation and browse to the **Remediation steps** tab.

1. Review the remediation steps and select **Manage** to follow the steps in the originating workload. The unified experience directs you to the appropriate service:
   - Microsoft Defender for Cloud for cloud recommendations
   - Microsoft Defender Vulnerability Management for device vulnerabilities  
   - Microsoft Secure Score for Microsoft 365 recommendations
   - Other Microsoft workloads as appropriate

1. **Note on unified workflow**: All recommendations, including those from Azure security center, are now visible in MSEM, so you can manage your entire security posture from the unified portal without needing to navigate to separate Azure portals for cloud recommendations.

## Next steps

- Review other ways to [improve security insights with exposure insights](exposure-insights-overview.md)
- Learn how to [Explore security events](security-events.md)
- [Investigate initiative metrics](security-metrics.md)
