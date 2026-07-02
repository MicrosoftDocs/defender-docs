---
title: Review security recommendations in Microsoft Security Exposure Management
description: Learn how to review security recommendations in Microsoft Security Exposure Management.
ms.topic: overview
ms.date: 07/30/2025
---

# Review security recommendations

This article describes how to work with security recommendations in the new unified recommendations experience in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

## Before you start

- Learn about the [unified recommendations catalog](exposure-insights-overview.md#working-with-recommendations) before you start.
- [Review permissions and prerequisites needed](prerequisites.md) for working with Security Exposure Management.

## Overview of the unified recommendations catalog

The unified recommendations catalog brings together all Microsoft security recommendations in a single, streamlined experience. This consolidates recommendations from:

- Microsoft Secure Score
- Microsoft Security Exposure Management Recommendations Catalog  
- Microsoft Defender for Cloud (for cloud recommendations)
- Microsoft Defender for Vulnerability Management

You can explore the full breadth of Microsoft's security recommendations without navigating multiple separate experiences across different Microsoft Security products.

:::image type="content" source="./media/vulnerability-management/recommendations-summary.png" alt-text="Screenshot of the unified recommendations summary." lightbox="./media/vulnerability-management/recommendations-summary.png":::

## Review recommendations

1. In the [Microsoft Defender portal](https://security.microsoft.com), select **Exposure management > Recommendations** to open the unified [Recommendations](https://security.microsoft.com/exposure-recommendations) page.

:::image type="content" source="media/security-recommendations/recommendations-landing-page.png" alt-text="Screenshot of recommendations landing page" lightbox="media/security-recommendations/recommendations-landing-page.png":::

### Navigate the new unified recommendations interface

Use the recommendations tabs that are organized by asset type to explore specific recommendation categories:

- **Devices** - Device-related recommendations including misconfigurations and vulnerabilities
- **Cloud assets** - Multicloud (Azure, AWS, and GCP), hybrid environments and code recommendations with risk-based prioritization. 
- **SaaS apps** - Software-as-a-Service application recommendations
- **Identities** - Identity-related security recommendations
- **Data** - Data protection recommendations

#### Filter and sort recommendations

There are several ways to filter and sort recommendations in each category to help you prioritize your security efforts effectively.

Sort the recommendations by any of the headings or filter them based on your task needs.

Apply advanced filtering using the **Add filter** option to narrow down recommendations by various criteria depending on the recommendation type.

#### Devices

The Devices tab provides a unified view of device-related security recommendations.

There are separate views for issue types:

- **Misconfigurations** - Configuration-related security issues from Vulnerability Management, Microsoft Secure Score, and Security Exposure Management, contributing to the Devices Secure Score
- **Vulnerabilities** - Software vulnerabilities from Vulnerability Management requiring patches, preserving the familiar structure, fields, filters, and prioritization logic with the same exposure score

This separation recognizes that misconfigurations and vulnerabilities often represent distinct workflows handled by different personas, allowing for clearer prioritization and ownership.

## Cloud assets

This tab provides a prioritized list of security actions designed to improve your cloud security posture by addressing vulnerabilities, misconfigurations, and exposed secrets. These recommendations are ranked by effective risk, helping security teams focus on the most critical threats first.

Apply filters and filter sets such as **Exposed asset**, **Asset risk factors**, **Environment**, **Workload**, **Recommendation maturity** and others.

On the left navigation pane, you can choose to either view all recommendations or view by a specific category.

There are separate views for issue types:

- **Misconfigurations**
- **Vulnerabilities**
- **Exposed Secrets**.

For each view you will view the **Cloud secure score**, **Score history**, **Recommendation by risk level** and how the risk is calculated.

:::image type="content" source="media/security-recommendations/cloud-assets-security-recommendations.png" alt-text="Screenshots of cloud assets recommendations tab" lightbox="media/security-recommendations/cloud-assets-security-recommendations.png":::

> [!NOTE]
> In the Defender portal, some recommendations that previously appeared as a single aggregated item now display as multiple individual recommendations. This change reflects a shift from grouping related findings under one recommendation to listing each recommendation separately.
>
> - You may notice a longer list of recommendations compared to before. Combined findings (such as vulnerabilities, exposed secrets, or misconfigurations) are now shown individually rather than nested under a parent recommendation.
> - The old grouped recommendations still appear side by side with the new format for now, but they will eventually be deprecated.
> - These recommendations are marked as Preview. This tag indicates that the recommendation is in an early state and does not affect Secure Score yet.
> - Secure Score currently applies to the parent recommendation only, not to each individual item.
>
 **Tip**: If you see both formats or recommendations with a Preview tag, this is expected during the transition. The goal is to improve clarity and allow customers to act on specific recommendations more easily.

With the integration of Defender for Cloud in the Defender portal, you can also access enhanced cloud recommendations through the unified interface:


Key improvements in the cloud recommendations experience include:

- **Risk factors per asset**: Assess the broader exposure context of each recommendation for informed decisions
- **Risk-based scoring**: New scoring that weighs recommendations based on severity, asset context, and potential impact
- **Enhanced data**: Core recommendation data from Azure Recommendations enriched with additional fields and capabilities from Exposure Management
- **Prioritized by criticality**: Greater emphasis on critical issues that pose the highest risk to your organization

#### SaaS apps, Identities, and Data tabs

These tabs provide recommendations specific to SaaS applications, identity security, and data protection, respectively. Each tab allows you to filter and sort recommendations to focus on the most relevant security actions for your organization.

The recommendations summary on these tabs includes:

- Their unique Microsoft Secure Score
- Score history
- Recommendation by status
- Score comparison

## Remediate recommendations

1. To remediate a recommendation, select a specific recommendation and browse to the **Remediation steps** tab.

1. Review the remediation steps and select **Manage** to follow the steps in the originating workload. The unified experience directs you to the appropriate service:

## Next steps

- Review other ways to [improve security insights with exposure insights](exposure-insights-overview.md)
- [Investigate initiatives and metrics](security-metrics.md)
