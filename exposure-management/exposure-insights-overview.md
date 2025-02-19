---
title: Overview of exposure insights and secure score in Microsoft Security Exposure Management
description: Learn how to get exposure insights into your corporate attack surface with Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Overview - Exposure insights

Exposure insights in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) continuously aggregate security posture data and insights across workloads and resources, into a single pipeline.

## Exposure insights

Exposure insights provide rich context around the security posture state of your asset inventory.

Chief Information Security Officers (CISOs), decision makers, risk owners, and security teams can use security insights and context to understand and manage exposure risk across the entire organization, and to prioritize security efforts and investment.

Exposure insights provide visibility and granular context around security posture state. Insights enable you to:

- Break down organizational security posture into manageable security projects.
- Manage security projects as security initiatives in Security Exposure Management.
- Review, measure, and track risk exposure for each security initiative.
- Follow actionable recommendations and remediation steps to improve security posture and reduce risk.
- Monitor security posture state and improvements over time.

## Security initiatives

Security initiatives provide a simple way to assess security readiness for a specific security area or workload, and to constantly track and measure exposure risk for that area or workload over time.

Security Exposure Management provides initiatives that currently include:

- **Workload initiatives**: Assess and manage the risk associated with specific workload domains, such as security for endpoints, identity resources, and cloud assets.
- **Horizontal threat initiatives**: Assess and manage risk for specific threat areas, such as ransomware protection, or business email compromise - financial fraud.
- **Threat analytics initiatives**: Assess threat risk  with initiatives that are based on up-to-date research from Microsoft threat analytics. Microsoft threat analytics is a set of reports from expert Microsoft security researchers that provide information about real and relevant threats. These threat initiatives focus on:

  - Threat actors and threat vectors.
  - Threat reports that have three or more recommendations.

- **Zero trust initiative**: Assess the risk associated with zero trust compliance. This initiative aligns with guidance provided by the [zero trust adoption framework](/security/zero-trust/adopt/zero-trust-adoption-overview).

> [!IMPORTANT]
> Initiatives that are in preview are marked accordingly. Preview initiatives are still in development, and are subject to change.

### Initiative elements

|**Element** | **Goal** | **Details**|
|--- | --- | ---|
|**Initiative** |Initiatives help you to gather security projects that have similar resources and workloads, and to assess and remediate the security posture of each project.|Each security initiative provides an all-up score that provides a fast measure of how strong security posture is for the initiative at the current point in time.<br/><br/>The all-up score also provides a target score indicator, the number of critical assets affected, and shows how the score has moved over the last 24 hours.|
|**Metric** |Metrics in security initiatives help you to measure exposure risk for different areas within the initiative.|Each metric gathers together one or more recommendations for similar assets.<br/><br/>Metrics can be associated with one or more initiatives.<br/><br/>**Important**: Threat analytics initiatives don't have metrics. They have recommendations only.|
|**Recommendations** |Security recommendations help you to understand the compliance state for a specific security initiative.  |All security initiatives have recommendations associated with them.<br/><br/>Recommendations can be associated with one or more initiatives.<br/><br/>Within initiatives, recommendations are assigned a compliance state.|
|**Events** |Events help you to  monitor initiative changes.  |Events notify you when there's a drop in an all-up initiative score or metric score, indicating that exposure risk grew.|

## Working with initiatives

You can prioritize which initiatives you want to see on the **Overview** dashboard. Review the initiative score, and drill down into initiatives to see associated metrics and understand where gaps or risks reside.

## Working with metrics

On the **Metrics** tab of an initiative, or in the **Metrics** section of **Exposure Insights**, you can see the metric state, its effect and relative importance in an initiative, and recommendations to improve the metric. For each metric you can:

- Review metrics properties, including:
  - **Metric name**: The name of the metric.
  - **Progress**: Shows the improvement of the exposure level for the metric from 0 (high exposure) to 100 (no exposure).
  - **State**: Shows whether the metric needs attention, the risk was mitigated outside Security Exposure Management and shouldn't affect the initiative score, or was mitigated and the initiative score should be adjusted accordingly.
  - **Affected assets**: The number of assets within the metric. In most cases, these would be assets that are exposed or that create a risk factor. In other cases, affected assets would be the number of missing Microsoft secure score points to effectively implement recommended controls.
  - **Total assets**:  Total number of assets under the metric scope.
  - **Recommendations**: Security recommendations associated with the metric.
  - **Weight**: The relative weight (importance) of the metric within the initiative, and its effect on the initiative score. Shown as **High**, **Medium**, and **Low**. It can also be defined as **Risk accepted**.
  - **14-day trend**: Shows the metric value changes over the last 14 days.
  - **Last updated** shows the last date the metric was updated.

- Filter metrics for specific findings.
- Drill down into metrics to review and fix associated issues.
- Suggest new metrics to the product team.
- Customize the weight of a metric so that it has greater or lesser effect in the initiative, based on your business priorities. Editing a metric affects all the initiatives in which the metric is included. Once edited, it might take up to 2 hours for changes to be reflected in the metric value and its related initiatives.

### Unavailable metrics

In some cases, metrics display grayed out because the underlying data for the metric doesn't exist. For instance, if a required workload isn't onboarded, or if a secure score metric is set to completed or risk accepted in secure score and Security Exposure Management can't access the metric data.

Grayed out metrics aren't considered for score calculation.

> [!NOTE]
> The versioning feature in Exposure Management provides proactive notifications to users about upcoming version updates, providing advanced visibility into the expected metric changes and their impact on related initiatives.
> A dedicated side panel offers more details about the update, including the expected date of the change, release notes, and current and new metric values, as well as changes to the related initiatives' scores.
> Users can share feedback about the update directly through the platform.
> The information is dynamic and may vary depending on when it is accessed.

## Working with recommendations

Security Exposure Management ingests security recommendations from multiple sources, including Microsoft Defender for Cloud running the  [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), [Microsoft Secure Score](/defender-xdr/microsoft-secure-score), Microsoft threat analytics, and other Microsoft workloads. Security Exposure Management integrates all of these recommendations into a single security catalog.

- You can view recommendations from the **Recommendations** tab, or review and remediate recommendations within a specific security initiative or metric.
- Each recommendation provides remediation steps to fix detected compliance issues.
- Every action taken on a security recommendation helps to reduce exposure and risk, improve security posture, and directly influence its related security initiatives and metrics.

Security Exposure Management categorizes recommendations by compliance status, as follows:

- **Compliant**: Indicates that the recommendation was implemented successfully.
- **Not complaint**: Indicates that the recommendation hasn't been fixed.
- **Mitigated by organization**: Displays when steps to mitigate recommendations were taken elsewhere, and Security Exposure Management can't know whether recommendations are compliant. For example, by changing a status in Secure score.
- **Not available**: Means there isn't enough information to determine the compliance status.

:::image type="content" source="./media//exposure-insights-overview/recommendation-ransomware-advanced-protection.png" alt-text="Screenshot of the ransomware advanced protection recommendation details ":::

### Secure score

[Microsoft Secure Score](/defender-xdr/microsoft-secure-score) helps organizations to plan and improve overall security posture using the secure score as a tracking metric.

Security Exposure Management uses secure score as one of its sources for initiative scores.

- Secure Score has recommended actions for a [number of products](/defender-xdr/microsoft-secure-score#products-included-in-secure-score).
- When you select a recommendation to review, Security Exposure Management allows you to remediate the problem in the specific product, including recommendations that are derived from Secure Score.
- For recommendations where Secure Score is relevant, the recommendation doesn't display if Secure Score isn't active.

## Monitoring and improving scores

The exposure state for a security initiative is reflected in the initiative score.

- **Initiatives with metrics**: For initiatives with metrics, the score is calculated based on the value and weight of metrics within the initiative.
- **Initiatives without metrics**: For threat initiatives that don't have metrics, the initiative score is calculated in the same way that [Secure Score is calculated](/defender-xdr/microsoft-secure-score#how-recommended-actions-are-scored).

For initiatives with metrics:

- As metrics improve the initiative score rises to reflect an improved posture for the security initiative.
- Metrics largely improve by applying the recommendations associated with the initiative.
- Changes in metrics, including deprecation/removal, value, and metric properties can affect the initiative score.

## Reviewing initiative history

On the **History** tab of an initiative, you can:

- Track the history of changes greater than 2.5% that affect initiative score.
- Filter for specific time points.
- Drill down to specific changes.

:::image type="content" source="media/exposure-insights-overview/initiatives-history.png" alt-text="Screenshot of the Initiative history tab showing the graph and dates of changes." lightbox="media/exposure-insights-overview/initiatives-history.png":::

When you drill down into a specific change, you can see the percentage effects of metrics in the initiative score, along with the change reason. Reasons include:

- **Property change** - A change in the weight of the metric in the score.
- **Value change** - A change in the value of the metric in the initiative score.
- **Metric removed** - The metric is no longer relevant for that specific initiative. For instance, if a better suggestion is introduced or it becomes irrelevant.
- **Metric depreciated** - The metric is removed globally.

Selecting the metric that changed provides more details about the change. For instance, it might display the new weight of a property change, and the number of affected assets before and after the change. It also offers a dropdown for changes to exposed assets, displaying up to the top 100 assets and indicating whether the asset exposure was added or removed.

:::image type="content" source="media/exposure-insights-overview/Initiatives-history-updated.png" alt-text="Screenshot of initative history side panel" lightbox="media/exposure-insights-overview/Initiatives-history-updated.png":::

You can't control the metric or score changes in advance.

## Reviewing events

Events measure the score drop or worsening in the metric status. Events include:

- **Metric score drop events**: These events are issued with there's a decrease of at least 2% in metric score (exposure grew by 2%) since yesterday.
- **Initiative score drop events**: These events are issued when there's a decrease of at least 2% in initiative score since yesterday.
- **New Initiative event**: These events are issued when a new initiative is available in MSEM.

## Next steps

- [Investigate security initiative metrics](security-metrics.md)
