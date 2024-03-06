---
title: Review security recommendations
description: This article describes Microsoft Security Exposure Management recommendations and how it works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Review security recommendations

The Microsoft Security Exposure Management [recommendations catalog](exposure-insights-overview.md#security-recommendations) serves as a centralized repository for security recommendations originating from various sources to help preemptively address security risk and reduce exposure.

[!INCLUDE [prerelease](../includes//prerelease.md)]

1. Select **Exposure management -> Exposure insights -> Recommendations** or the **Recommendations** tab in an individual initiative page in **Initiatives** to access [Microsoft Exposure Recommendations](https://security.microsoft.com/exposure-recommendations) in the [Microsoft Defender portal](https://security.microsoft.com/) .
:::image type="content" source="./media/recommendations-navigation.png" alt-text="Screenshot of the recommendations window.":::

1. Sort the recommendations by any of the headings or filter them based on your task needs.
    1. Sorting includes all of the headers which are:
        - **Name**
        - **Compliance state** - compliant or not compliant
        - **Impact** - high, low, or medium
        - **Last calculated**
        - **Last state change**
        - **Related initiatives** - the number of related initiatives
        - **Related metrics** - the number of related metrics
        - **Source** - the benchmark source
        - **Workload** - which workload the recommendations relate to
        - **Domain** - Either device, apps, data, or identity
     1. Filter recommendations by state, source, impact, workload, and domain.

1. Select a recommendation to view and review details.

## Remediate recommendations

1. To remediate a recommendation select a specific recommendation and browse to the **Remediation steps** tab.

1. Review the remediation steps and select **Manage** to follow the steps in the originating workload, such as Microsoft Defender for Cloud or Microsoft Defender Vulnerability Management.

> [!NOTE]
>Customers who have Microsoft Defender Cloud Security Posture Management (CSPM) subscriptions will have access to comprehensive cloud data. In the absence of this subscription, only limited cloud data will be accessible.

## Next steps

- Review other ways to [improve security insights with exposure insights](exposure-insights-overview.md)
- Learn how to [Explore security events](security-events.md)
- [Investigate initiative metrics](security-metrics.md)
