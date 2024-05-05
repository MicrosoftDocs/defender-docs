---
title: Overview of exposure insights and secure scorein Microsoft Security Exposure Management
description: Learn how to get exposure insights into your corporate attack surface with Microsoft Security Exposure MAnagement.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 03/11/2024
---

# Overview - Exposure insights

Exposure insights in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) continuously aggregates security posture data and insights across workloads and resources, into a single pipeline.

Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Exposure insights

Exposure insights provide rich context around the security posture state of your asset inventory.

Chief Information Security Officers (CISOs), decision makers, risk owners, and security teams can use security insights and context to manage exposure risk across the entire organization, and to prioritize security efforts and investment.

Exposure insights provide visibility and granular context around security posture state. Insights enable you to:

- Break down organizational security posture into security projects based on similar workloads and resources.
- Manage security projects as security initiatives in Security Exposure Management.
- Measure and track risk exposure for each security initiative.
- Follow actionable recommendations and remediation steps to improve security posture and reduce risk.
- Monitor improvements in security initiatives in order to track security risk reduction.

## Security initiatives

Security initiatives help you to focus and prioritize specific security projects. They provide a simple way to assess security readiness, and to constantly track and measure exposure risk by area or workload over time.

Predefined initiatives include:

- **Workload initiatives**: Help you to assess the risk associated with specific workload domains, such as security for endpoints, identity resources, and cloud assets.
- **Horizontal threat initiatives**: Help you to gather information about risk for specific threat areas, such as ransomware protection, or financial fraud.
- **Threat analytics initiatives**: Get initiatives based on up-to-date threat research from Microsoft threat analytics. Microsoft threat analytics is a set of reports from expert Microsoft security researchers with information about relevant threats. These initiatives focus on:

  - Threat actors and threat vectors.
  - Threat reports that have three or more recommendations.

- **Zero trust initiative**: Get a summary of risk associated with zero trust compliance. This initiative aligns with guidance provided by the [zero trust adoption framework](/security/zero-trust/adopt/zero-trust-adoption-overview).
- **Initiatives in preview**: Initiatives in preview are marked accordingly. These preview initiatives are still in development, and are subject to change.

### Initiative elements

**Element** | **Goal** | **Details**
--- | --- | ---
**Initiative** | Initiatives help you to gather similar resources and workloads into security projects, and to assess and remediate the security posture of each project.| Each security initiative provides an all-up score that provides a fast measure of how strong security posture is for the initiative at the current point in time.<br/><br/>	The all-up score also provides a target score indicator, the number of critical assets affectrf, and shows how the score has moved over the last 24 hours.
**Metric** | Metrics in security initiatives help you to measure exposure risk for different areas within the initiative.| Each metric gathers together one or more recommendations for similar assets.<br/><br/>Metrics can be associated with one or more initiatives.<br/><br/>**Important**: Threat analytics initiatives don't have metrics. They have recommendations only.
**Recommendations** |Security recommendations help you to understand the compliance state for a specific security initiative.  | All security initiatives have recommendations associated with them.<br/><br/>Recommendations can be associated with one or more initiatives.<br/><br/> Within initiatives, recommendations are assigned a compliance state.
**Events** |Security events help you to  monitor initiative changes.  | Events notify you when there's a drop in an all-up initiative score, or when a metric score drops because exposure risk grew.<br/><br/>- **Metric score drop events**: Issued with there's a decrease of at least 2% in metric score (exposure grew by 2%) since yesterday.<br/><br/>- **Initiative score drop events**: Issued when there's a decrease of at least 2% in initiative score since yesterday.


## Working with initiatives

You can prioritize which initiatives to see on the **Overview** dashboard. The initiative score reflects the exposure status of the initiative. You can also drill down into initiatives to see their associated metrics, and to understand where gaps or risks reside. 

## Working with metrics

On the **Metrics** tab of an initiative, or in the Metrics section of Exposure Insights, you can see the the security posture state for the metric, its effect and relative importance in the initiative, and recommendations to improve it. For each metric you can drill down to:

- Review metrics properties, including:
    - **14-day trend**: Shows the metric value changes over the last 14 days.
    - **Affected items**: The number of items within the metric. In most cases, these items would be assets that are exposed or that create a risk factor. In other cases, affected items would be the number of missing Microsoft secure score points to effectively implement recommended controls.
    - **Total**:  Total number of assets under the metric scope.
    - **Weight**: The relative weight (importance) of the metric within the initiative, and its effect on the initiative score. From one (lowest) to ten (highest). 
    - **Score impact**: The impact that completing the metric (getting it to 0%) has on the security initiative. Meaning if a given metric is completed, the score impact is the addition seen to the initiative score.
    - **State**: Shows whether the metrics needs attention, the risk was mitigated outside Security Exposure Management and shouldn't affect the initiative score, or was mitigated and the initiative score should be adjusted accordingly.
    - **Current value**: Current percentage of exposed assets within the total assets covered by the metric, with the state for each metric. Zero percent is best since there's no exposure, while 100% is worst.
    - **Recommendations**: Security recommendations associated with the metric.
    - **Last Updated** shows the last date the metric was updated.

- Filter metrics to find specific areas.
- Drill down into metrics to review and fix associated issues.
- Suggest new metrics to the product team.
- Customize metrics weight so that it has greater or lesser effect in the initiative, based on your business priorities. Editing a metric affects all the initiatives in which the metric is included.

### Unavailable metrics

In some cases, metrics display grayed out because the underlying data needed for this metric doesn't exist. For instance, when the required workload isn't onboarded or when a Secure score metric was set in Secure score to completed or risk accepted so that Security Exposure Management can't access the metric data.

Grayed out metrics aren't considered for score calculation.


## Working with recommendations

Security Exposure Management ingests security recommendations from multiple sources, including Microsoft Defender for Cloud running the  [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), Defender XDR [Secure score](/defender-xdr/microsoft-secure-score), Microsoft threat analytics, and other Microsoft workloads. Security Exposure Management integrates all of these recommendations into a single security catalog.

- You can view recommendations from the **Recommendations** tab, or review and remediate recommendations within a specific security initiative or metric.
- Each recommendation provides remediation steps to fix detected issues.
- Every action taken on a security recommendation helps to reduce exposure and risk, improve security posture, and directly influences related security initiatives and metrics.

Security Exposure Management categorizes recommendations by compliance, as follows:

- **Compliant** indicates that the recommendation was implemented successfully.
•	**Mitigated by organization** displays when steps to mitigate recommendations were taken elsewhere, and Security Exposure Management can't know whether recommendations are compliant. For example, by changing a status in Secure score.
- **Not available** means there isn't enough information to determine the compliance status.

:::image type="content" source="./media//exposure-insights-overview/recommendation-ransomeware-advanced-protection.png" alt-text="Screenshot of the ransomware advanced protection recommendation details ":::

### Secure score

[Microsoft Secure score](/defender-xdr/microsoft-secure-score) helps organizations to plan and improve overall security posture using Secure score as a tracking metric.

Security Exposure Management uses Secure score as one of its sources for initiative scores.

- Secure score has "recommended actions" for a [number of products](/defender-xdr/microsoft-secure-score#products-included-in-secure-score).
- Selecting a recommendation to review allows you to remediate the problem in the specific product, including recommendations that derived from secure score.
- For recommendations where secure score is relevant, if secure score isn't active, that recommendation doesn't display.

## Monitoring and improving scores

The exposure state for a security initiative is reflected in the initiative score. 

- For initiatives with metrics, the score is calculated based on the value and weight of metrics within the initiative. A
- For threat initiatives that don't have metrics, the initiative score is based on secure score.

For initiatives with metrics:

- As metrics improve the initiative score rises to reflect an improved posture for the security project.
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


Selecting the metric that changed provides more details about the change. For instance, it might display the new weight of a property change, or the number of affected assets before or after the change.

:::image type="content" source="media/exposure-insights-overview/initiatives-history-details.png" alt-text="Screenshot of the metric change side panel in the Initiatives history tab." lightbox="media/exposure-insights-overview/initiatives-history-details.png":::

You can't control the metric or score changes in advance.


## Reviewing events


Events measure the score drop or worsening in the metric status. Drifts in an initiative scores, or within metrics for an initiative, can be monitored as events. On the **Events** page, you can view and filter events.




## Next steps

- [Review security initiatives](initiatives.md)
- [Investigate security metrics](security-metrics.md)
- [Review security recommendations](security-recommendations.md)
- [Explore security events](security-events.md)
