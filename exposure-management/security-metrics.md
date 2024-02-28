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

[!INCLUDE [prerelease](../../includes/prerelease.md)]
<!-- * what is secuirty metrics and their components (value, weight, trend, recommendations)
* why is value upside down ?X
* how to prioritize and drilldown to metrics
* metric actions
* metric lifecycle (state, adding, depraciating)?
* required data from workloads?
* metric catalog
-->
Security metrics in Microsoft Security Exposure Management, measure exposure of assets within a specific scope of assets. For instance, measuring the percent of cloud resources with critical vulnerabilities or the percent of macOS endpoints missing an endpoint security solution agent.  

Metrics are associated with initiatives. They allow users to assess an initiative's exposure status and identify areas that are exposed or aren't meeting internal standards. This information can then be used to prioritize which areas need to be addressed first.

To access [Metrics](https://security.microsoft.com/exposure-metrics), go to **Exposure Management -> Exposure Insights -> Metrics** to see a complete list of metrics:

:::image type="content" source="../../media/security-exposure-management/metrics.png" alt-text="Screenshot of the metrics page in Microsoft Security Exposure management.":::

You can also access Metrics from the dashboard or access initiative specific metrics from an individual initiatives page.

## View metrics page

Most metrics have at least one associated recommendation, to help users make improving metrics easy and actionable. Metrics include several properties that help contextualize them and make them actionable:

|Property  |Description  |
|---------|---------|
|**Current value** | The percentage of affected assets out of the total assets. Zero percent is best since there's no exposure, while 100% is worst. |
|**Affected items** | The number of items that comply with the metric’s logic. In most cases, these items would be assets that are exposed or that create a risk factor. In other cases, affected would be the number of missing Microsoft Secure Score points to effectively implement recommended controls. |
|**Total** | The number of assets that is scoped for the metric. For example, for a given metric it might be all endpoints. For another, it could be all Windows endpoints. |
|**Weight** | The importance of the metric and its effect over the initiative score. One is the lowest while 10 is the highest. Weight can be customized to have greater or lesser effect based on your organization's unique business priorities and considerations. Editing your metric weight value affects the metric and all related initiatives. |
| **Score impact** | The impact completing the metric has on the initiative score. Meaning if a given metric is completed, the score impact is the addition seen to the initiative score. |

Those properties display when viewing all metrics in the metrics in the Exposure Insights section. In addition, the following information is available when viewing all metrics from the metrics page:

- **14 day trend** as a percentage and graph
- **State** such as needs attention, risk accepted, or target met
- **Total** number of items
- **Last Updated**

In some cases, metrics display grayed out because the underlying data required for this metric, doesn't exist. Several situations cause metrics to be grayed out:
<!-- what is the E5 plan? -->
- The required workload isn't onboarded. For example, E5 customers without the Microsoft Defender for Identity workload turned on, has all, or most, Identity-related metrics grayed out.
- The required workload is onboarded, but to a limited extent. For instance:
 - A customer with a E3/P1 license has Defender for Endpoint workload enabled but without all the features of an E5/P2 license.
 - Microsoft Defenders for Endpoint customers see the “% of iOS devices not covered by security agents” metric grayed out if there are no onboarded or discovered iOS devices.
- The respective control in Secure Score that the metric is based on is invalid for any reason, such as completed or risk accepted.

Grayed out metrics aren't considered for score calculation.

## Review security metrics

Select the metric you want to examine to view more detailed information. You can view the following information for each specific metric:

- **Description** of the metric
- Related **Security recommendations** and a means to manage them
- Specific **Affected items** and the number they make of the total
- **Last state update**
- **Category**
- Current **Exposure score** value
- **Weight** or maximum metric score possible
- **Score impact** or remaining metric score possible

You can edit the metric value by editing its weight, to customize the metric to your organization's business priorities. Setting the weight to zero designates that the organization accepts the risk described by the metric.

> [!NOTE]
> Some instances of affected assets information, largely information originating in Secure Score, doesn't appear on the Affected Items tab in an individual metric. Also some critical asset information for assets in the Affected Items tab does not show.
> Asset details are calculated on demand.
> Cloud-related metrics apply only for subscription and their subsequent resources if the subscription is onboarded to a Cloud Security Posture Management (CSPM) Premium plan.
> In some cases, metrics are more specific than the scope of the related recommendations. In such a case, the asset detail shown won't align with the asset details of the related recommendations.
> Offboarding a workload will result in an inability to refresh the metric status and the asset details for related metrics.

## Next steps

For more information, see:

- [Priority exposure items](exposure-insights-overview.md)
- [Security events](security-events.md)
- [Security recommendations](security-recommendations.md)
- [Identify and investigate attack paths](attack-paths-analysis-remediation.md)
- [!INCLUDE [support](../../includes/support.md)]

## See also
