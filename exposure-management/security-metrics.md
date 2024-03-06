---
title: Investigate security metrics in Microsoft Security Exposure Management
description: Learn how to investigate metrics in Microsoft Security Exposure Management.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 03/06/2024
---

# Investigate security metrics

[Security metrics](exposure-insights-overview.md#metrics) in Microsoft Security Exposure Management measure security exposure within a specific scope of assets.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Prerequisites

- Learn about [security metrics](exposure-insights-overview.md#metrics)
- [Review permissions needed](prerequisites.md#permissions-for-security-exposure-management-tasks) for working with Security Exposure Management.

## Review security metrics

1. In the Defender portal > **Eposure management**, navigate to **Exposure insights** > **Metrics**

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

<!-- [!NOTE]
> Some instances of affected assets information, largely information originating in Secure Score, doesn't appear on the affected items tab in an individual metric. Also some critical asset information for assets in the Affected Items tab does not show.
> Asset details are calculated on demand.
> Cloud-related metrics apply only for a subscription and their subsequent resources if the subscription is onboarded to a Cloud Security Posture Management (CSPM) Premium plan.
> In some cases, metrics are more specific than the scope of the related recommendations. In such a case, the asset detail shown won't align with the asset details of the related recommendations.
> Offboarding a workload will result in an inability to refresh the metric status and the asset details for related metrics.
-->
## Next steps

- [Priority exposure items](exposure-insights-overview.md)
- [Security events](security-events.md)
- [Security recommendations](security-recommendations.md)
- [Identify and investigate attack paths](attack-paths-analysis-remediation.md)
