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

1. Select **Exposure Management -> Exposure Insights -> Recommendations** or via an individual initiative page in **initiatives** to access [Microsoft Exposure Recommendations](https://security.microsoft.com/exposure-recommendations) in the [Microsoft Defender portal](https://security.microsoft.com/) .

:::image type="content" source="./media/recommendations-navigation.png" alt-text="Screenshot of the recommendations window.":::

## View recommendations page

The following information is available to view in Recommendations as an overview, and you can filter recommendations by each item:

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

## Remediate recommendations

1. To remediate a recommendation select a specific recommendation and browse to the **Remediation steps** tab.

1. Review the remediation steps and select **Manage** to follow the steps in the originating workload. For instance, in Microsoft Defender for Cloud, Microsoft Entra ID, Microsoft Defender for Office, or Microsoft Defender Vulnerability Management.

> [!NOTE]
>Customers who have Microsoft Defender Cloud Security Posture Management (CSPM) subscriptions will have access to comprehensive cloud data. In the absence of this subscription, only limited cloud data will be accessible.

## Next steps

- [Overview of improve security insights with exposure insights](exposure-insights-overview.md)
- [Explore security events](security-events.md)
- [Investigate initiative metrics](security-metrics.md)
- [Secure score for Microsoft Security Exposure Management](secure-score.md)
