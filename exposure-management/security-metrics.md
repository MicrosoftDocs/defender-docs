---
title: Investigate security metrics in Microsoft Security Exposure Management
description: Learn how to investigate metrics in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 03/11/2024
---

# Investigate security metrics

Security metrics in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) measure security exposure for a specific scope of assets or resources within a [security initiative](exposure-insights-overview.md). Most security initiatives (but not all) have metrics associated with them.

Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Prerequisites

- Learn about [security metrics](exposure-insights-overview.md#working-with-metrics).
- [Review permissions and prerequisites needed](prerequisites.md) for working with Security Exposure Management.
- Note possible preview issues:
    - Some instances of affected assets information (largely information originating in Secure score) don't appear on the **Affected Items** tab in an individual metric.
    - Some critical asset information for assets in the **Affected Items** tab doesn't show.
    - Asset details are calculated on demand.
    - Cloud-related metrics are only available if Microsoft Defender for Cloud is available in the subscription, and the Defender Cloud Security Posture Management (CSPM) plan is enabled.
    - In some cases, metrics are more specific than the scope of the related recommendations. In this case, the asset detail shown doesn't align with the asset details of the related recommendations.
    - If you remove a workload, you can't refresh the metric status and the asset details for the workload's related metrics.


## Review security metrics

1. In the [Microsoft Defender portal](https://security.microsoft.com), select **Exposure management -> Exposure insights ->Metrics** to open the [Metrics](https://security.microsoft.com/exposure-metrics) page.

    :::image type="content" source="./media/metrics.png" alt-text="Screenshot of the metrics page in Microsoft Security Exposure management.":::

1. Select the metric you want to review.
1. Review the metric properties.

    - **Description**: Metric description.
    - **State**: Current state of metric.
    - **Last state update**: The last time metric state was updated.
    - **Current value**: Current exposure score from significant to no/low exposure.
    - **Affected items**. The number of affected items in the total items.
    - **Weight**: Metric weight or maximum metric score possible.
    - **Score impact**: Possible score gain.
    - **Security recommendations**: Recommendations associated with the metric.

## Edit the metric value

You can customize metric values for your business needed.

1. To edit the metric value, select a specific metric.
1. In the metric properties page, select weight, change the value, and apply.
1. To accept the risk described by the metric, set the weight to zero.

## Next steps

- [Priority exposure items](exposure-insights-overview.md)
- [Security events](security-events.md)
- [Security recommendations](security-recommendations.md)
- [Review attack paths](work-attack-paths-overview.md)
