---
title: Investigate security metrics
description: This article describes Microsoft Security Exposure Management metrics and how it works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Investigate security metrics

[Security metrics](exposure-insights-overview.md#metrics) in Microsoft Security Exposure Management, measure exposure of assets within a specific scope of assets.

[!INCLUDE [prerelease](../includes//prerelease.md)]

1. To access [Metrics](https://security.microsoft.com/exposure-metrics), go to **exposure management -> exposure insights -> metrics**,  the **overview** dashboard, or individual initiative or recommendations.

:::image type="content" source="./media/metrics.png" alt-text="Screenshot of the metrics page in Microsoft Security Exposure management.":::

## Review security metrics

1. To view a specific metric's information select the metric from the list.

1. Review the metric details such as:

- **Description** of the metric
- Related **Security recommendations** and a means to manage them
- Specific **Affected items** and the number they make of the total
- **Last state update**
- Current **Exposure score** value
- **Weight** or maximum metric score possible
- **Score impact** or what score gain is possible

## Edit the metric value

1. To edit the metric value, with admin privileges, select a specific metric.

1. Select weight, change the value, and apply. by editing its weight, to customize the metric to your organization's business priorities.

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
