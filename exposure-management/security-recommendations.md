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

## Review recommendations

1. In the [Microsoft Defender portal](https://security.microsoft.com), select **Exposure management > Exposure insights > Recommendations** to open the unified [Recommendations](https://security.microsoft.com/exposure-recommendations) page.

    :::image type="content" source="./media/recommendations-navigation.png" alt-text="Screenshot of the recommendations window." lightbox="./media/recommendations-navigation.png":::

### Navigate the new unified recommendations interface

2. **Use the attack surface tabs**: The recommendations are now organized by tabs for different domains:
   - **Devices** - Device-related recommendations including misconfigurations and vulnerabilities
   - **Cloud** - Azure, AWS, and GCP recommendations with risk-based prioritization
   - **Identity** - Identity-related security recommendations
   - **SaaS** - Software-as-a-Service application recommendations
   - **Data** - Data protection and governance recommendations

3. **Separate views for issue types**: On the Devices tab, you'll find separate views for:
   - **Misconfigurations** - Configuration-related security issues
   - **Vulnerabilities** - Software vulnerabilities requiring patches
   
   This separation aligns with different remediation workflows and makes it easier to focus on specific types of issues.

4. **Use enhanced filtering and sorting**: Sort the recommendations by any of the headings or filter them based on your task needs. Sorting includes all of the headers:
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

5. **Apply advanced filtering**: Filter recommendations by:
   - State (compliant, not compliant, etc.)
   - Impact level
   - Workload source
   - Domain/attack surface
   - Risk score (for cloud recommendations)

6. Select a recommendation to view and review details.

You can also review recommendations on the **Recommendations** tab in a specific security initiative page in **Initiatives** to access [Microsoft Exposure Recommendations](https://security.microsoft.com/exposure-recommendations) in the [Microsoft Defender portal](https://security.microsoft.com/).

## Remediate recommendations

1. To remediate a recommendation, select a specific recommendation and browse to the **Remediation steps** tab.

2. Review the remediation steps and select **Manage** to follow the steps in the originating workload. The unified experience directs you to the appropriate service:
   - Microsoft Defender for Cloud for cloud recommendations
   - Microsoft Defender Vulnerability Management for device vulnerabilities  
   - Microsoft Secure Score for Microsoft 365 recommendations
   - Other Microsoft workloads as appropriate

3. **Note on unified workflow**: All recommendations, including those from Azure security center, are now visible in MSEM, so you can manage your entire security posture from the unified portal without needing to navigate to separate Azure portals for cloud recommendations.

## Next steps

- Review other ways to [improve security insights with exposure insights](exposure-insights-overview.md)
- Learn how to [Explore security events](security-events.md)
- [Investigate initiative metrics](security-metrics.md)
