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

- Break down organizational security posture into manageable security projects.
- Focus and prioritize on security initiatives for each project.
- Measure and track risk exposure for each security initiative.
- Follow actionable remediation steps to improve security posture and reduce risk.
- Track improvements in security initiatives in order to track security risk reduction.

## Security initiatives

Security initiatives help you to focus and prioritize specific security projects. They provide a simple way to assess security readiness, and to constantly track and measure exposure risk by area or workload over time.

Predefined initiatives include:

- **Workload initiatives**: Help you to assess the risk associated with specific workload domains, such as security for endpoints, identity, or cloud assets.
- **Horizontal threat initiatives**: Help you to gather information about risk for specific threat areas, such as ransomware protection, or financial fraud.
- **Threat analytics initiatives**: Get initiatives based on up-to-date threat research from Microsoft threat analytics. Microsoft threat analytics is a set of reports from expert Microsoft security researchers with information about relevant threats that include active threat actors and campaigns, popular and new attack techniques, critical vulnerabilities, common attack surfaces, and prevalent malware. These initiatives focus on:

  - Threat actors and threat vectors.
  - Reports that have three or more recommendations.

- **Zero trust initiative**: Get a summary of risk associated with zero trust compliance. This initiative aligns with guidance provided by the zero trust adoption framework (/security/zero-trust/adopt/zero-trust-adoption-overview)
- **Initiatives in preview**: Initiatives in preview are marked accordingly. Be aware that preview initiatives are still in development, and are subject to change.

### Initiative elements

**Element** | **Goal** | **Details**
--- | --- | ---
**Initiative** | Initiatives help you to gather similar resources and workloads into security projects, and to then assess and remediate the security posture of areas across the business.| Each security initiative provides an all-up score that provides a fast measure of how strong security posture is for that initiative at the current point in time.<br/><br/>	The all-up score also provides a target score indicator, the number of critical assets it affects, and how the score has moved over the last 24 hours.
**Metric** | Metrics in security initiatives help you to measure exposure risk for initiative area.| Each metric gathers together one or more recommendations for similar assets.<br/><br/>Metrics can be associated with one or more initiatives.<br/><br/>**Important**: Threat analytics initiatives don't have metrics. They have recommendations only.
**Recommendations** |Security recommendations help you to understand the compliance state for a specific security initiative.  | All security initiatives have recommendations associated with them.<br/><br/>Recommendations can be associated with one or more initiatives.<br/><br/> Within initiatives, recommendations are assigned a compliance state.
**Events** |Security events help you to  monitor initiative changes.  | Events consolidate information about posture management changes that affect the security initiative.<br/><br/>	Events notify initiative owners when there's a drop in an all-up initiative score, or when a metric score drops because exposure risk grew (for initiatives with metrics).<br/><br/>- **Metric score drop events**: Issued with there's a decrease of 2% in metric score (exposure grew by 2%) since yesterday.<br/><br/>- **Initiative score drop events**: Decrease of 2% in initiative score since yesterday.

## Working with metrics

On the Metrics tab of an initiative, you can see the security posture state for the metric, and recommendations to improve it.


- Review metrics properties, including:
    - 14-day trend: Shows the metric value changes over the last 14 days.
    - Affected: Number of exposed assets and resources under the metric.
    - Total:  Total number of assets under the metric.
    - Weight: The relative weight of the metric within the initiative. From one (lowest) to ten (highest). Weight can be customized.
    - Score impact: The impact that completing the metric (getting it to 0%) will have on the security initiative. 
    - State: Shows whether the metrics needs attention, the risk was mitigated outside Security Exposure Management and shouldn't affect the initiative score, or was mitigated and the initiative score should be adjusted accordingly.
    - Current value/State: Current percentage of exposed assets within the assets covered by the metric, with the state for each metric.
    - Recommendations: Security recommendations associated with the metric.

- Filter metrics to find specific areas.
- Drill down into metrics to review and fix.
- Suggest new metrics to the product team.

## Working with initiatives




Security Exposure Management provides predefined initiatives. Each predefined initiative contains one or more security metrics relevant to that initiative.

Initiatives can relate to specific workload domains, measuring a specific area such as endpoint, identity, and cloud security. They might contribute to threat analysis by relating to a specific threat across multiple categories. For example, ransomware protection or [critical asset protection](critical-asset-management.md#critical-asset-protection-initiative). Initiatives can also focus on specific compliance standards.

You can prioritize which initiatives to see on the **Overview** dashboard. The initiative score reflects the exposure status of the initiative. You can also drill down into initiatives to see their associated metrics and to understand where gaps or risks reside. The initiative score and recommendations are derived from metrics within the initiative.



## Working with recommendations

Security Exposure Management intakes security recommendations from multiple sources, Microsoft Defender for Cloud running the Defender for Cloud Security Posture Management (CSPM) plan, Defender XDR,  Secure score, Microsoft threat analytics, and other Microsoft workloads. Security Exposure Management integrates all of these recommendations into a single security catalog. 

Recommendations provide practical steps to help you to fix detected issues and improve security posture. 

- You can view recommendations from the Recommendations tab, or review and remediate recommendations with a specific security initiative or metric.
- You can review individual recommendations, their state, impact, source, details about exposed entities, and related initiatives and metrics. Each recommendation provides remediation steps to address detected issues.
- Every action taken on a security recommendation, helps reduce exposure and risk, and directly influences related security initiatives and metrics.

Security Exposure Management categorizes recommendations by compliance, as follows:

- *Compliant* indicates that the recommendation was implemented successfully.
•	*Mitigated by org* displays when steps to mitigate recommendations were taken elsewhere, and Security Exposure Management can't know whether recommendations are compliant. For example, by changing a status in Secure score.
- *Not available* means there isn't enough information to determine the compliance status.



## Monitoring initiative scores

The exposure state for a security initiative is reflected in the initiative score. 

- For initiatives with metrics, the score is calculated based on the state of metrics within the initiative.
- For threat initiatives that don't have metrics, the initiative score is based on secure score.
You can assign an initiative owner to monitor the state of your security initiatives.

Drifts in an initiative score, or within metrics for our initiative, can be monitored as events. On thethe **Events** page, you can view and filter events. 

## Reviewing initiative history

On the **History** tab of an initiative, you can:

- Track the history of changes greater than 2.5% that affect initiative score.
- Filter for specific time points.
- Drill down to specific changes.


:::image type="content" source="media/exposure-insights-overview/initiatives-history.png" alt-text="Screenshot of the Initiative history tab showing the graph and dates of changes." lightbox="media/exposure-insights-overview/initiatives-history.png":::

When you drill down into a specific change, you can see the percentage effects of metrics in the initiative score along with the change reason, including:

- *Property change* - A change in the weight of the metric in the score.
- *Value change* - A change in the value of the metric in the initiative score.
- *Metric removed* - The metric is no longer relevant for that specific initiative. For instance, if a better suggestion is introduced or it becomes irrelevant.
- *Metric depreciated* - The metric is removed globally.



Selecting the metric that changed provides more details about the change. For instance, it might display the new weight of a property change, or the number of affected assets before or after the change.

:::image type="content" source="media/exposure-insights-overview/initiatives-history-details.png" alt-text="Screenshot of the metric change side panel in the Initiatives history tab." lightbox="media/exposure-insights-overview/initiatives-history-details.png":::

You can't control the metric or score changes in advance.





### Initiative score

The initiative score is calculated based on the value and weight of the metrics associated with the initiative. As metrics improve the initiative score rises, reflecting a better posture in the initiative domain.

- Metrics largely improve by applying the recommendations associated with the initiative.
- Recommendations are fixed, metrics rise, and in turn initiative scores rise to reflect improved security posture.
- Changes in metrics, including deprecation/removal, value, and metric properties can affect the initiative score.




## Metrics

Metrics group together recommendations for similar assets, and measure security exposure around those assets, from very high exposure to no exposure identified.

For example:

- Percent of macOS endpoints missing an endpoint security solution agent
- Percent of cloud resources with critical vulnerabilities

Each metric shows:

- The percentage of assets affected, the relative importance of the metric, and the effect that the metric has on an initiative.
- It also shows the weight, or importance, of the metric and its effect on the initiative score as a number. One is the lowest and 10 the highest.
- Metric weight can be customized to have greater or lesser effect, based on your organizational business priorities.
- Editing metric weight value affects the metric and all related initiatives.

Most metrics have at least one associated recommendation.

### Working with metrics

You can drill down into individual metric recommendations to remediate them. Metric scores go up as recommendations are remediated.

Use metrics to assess an initiative's exposure status and identify exposed areas or areas that don't meet internal standards. This information can be used to prioritize efforts around risk mitigation.

Metrics are only shown if underlying data for the metric is available.

### Metrics properties

Metrics include several properties that help contextualize them and make them actionable:

|Property  |Description  |
|---------|---------|
|**Current value** | The percentage of affected assets out of the total assets. Zero percent is best since there's no exposure, while 100% is worst. |
|**Affected items** | The number of items that comply with the metric's logic. In most cases, these items would be assets that are exposed or that create a risk factor. In other cases, affected items would be the number of missing Microsoft secure score points to effectively implement recommended controls. |
|**Total** | The number of assets that is scoped for the metric. For example, for a given metric it might be all endpoints. For another, it could be all Windows endpoints. |
|**Weight** | The importance of the metric and its effect over the initiative score. One is the lowest while 10 is the highest. Weight can be customized to have greater or lesser effect based on your organization's unique business priorities and considerations. Editing your metric weight value affects the metric and all related initiatives. |
| **Score impact** | The effect that completing the metric has on the initiative score. Meaning if a given metric is completed, the score impact is the addition seen to the initiative score. |

Those properties display when viewing all metrics in the Exposure insights section.

Viewing all metrics from the metrics page adds:

- **14 day trend** shows the metric value changes over the past 14 days as a percentage and graph.
- **State** such as:
  - **Needs attention** or requires mitigation.
  - **Risk accepted** by an admin to indicate that the risk was mitigated in a nonmeasurable way that doesn't affect the initiative score.
  - **Target met** or the exposure was mitigated.
- **Total** number of items.
- **Last Updated** shows the last date the metric was updated.

### Unavailable metrics

In some cases, metrics display grayed out because the underlying data needed for this metric doesn't exist. For instance, when the required workload isn't onboarded or when a Secure score metric was set in Secure score to completed or risk accepted so that Security Exposure Management can't access the metric data.

Grayed out metrics aren't considered for score calculation.

### Issues to note

Some metric specific issues are important to note:

- Some instances of affected assets information (largely information originating in Secure score) don't appear on the **Affected Items** tab in an individual metric.
- Some critical asset information for assets in the **Affected Items** tab doesn't show.
- Asset details are calculated on demand.
- Cloud-related metrics are only available if Microsoft Defender for Cloud is available in the subscription, and the Defender Cloud Security Posture Management (CSPM) plan is enabled.
- In some cases, metrics are more specific than the scope of the related recommendations. In this case, the asset detail shown doesn't align with the asset details of the related recommendations.
- If you remove a workload, you can't refresh the metric status and the asset details for the workload's related metrics.

## Security recommendations

Assets and workloads are assessed against security measurements and standards, and security recommendations are issued based on those assessments.

Recommendations provide practical steps to help you improve and remediate security posture and detected issues.

In Security Exposure Management, the recommendations catalog serves as a centralized repository for security recommendations.

### Recommendations sources

Security Exposure Management integrates recommendations from Microsoft Defender for Cloud running the [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), Defender XDR [Secure score](/defender-xdr/microsoft-secure-score), and from other Microsoft workloads. It also provides recommendations related to non-Microsoft workloads.

### Working with recommendations

You can review individual recommendations, their state, impact, source, details about exposed entities, and related initiatives and metrics. Each recommendation provides remediation steps to address detected issues.

Every action taken on a security recommendation, helps reduce exposure and directly influences related security metrics and initiatives.

:::image type="content" source="./media//exposure-insights-overview/recommendation-ransomeware-advanced-protection.png" alt-text="Screenshot of the ransomware advanced protection recommendation details ":::

### Compliance

Security Exposure Management categorizes security by compliance state for the entire organization.

- *Compliant* indicates that the recommendation was implemented successfully.
- *Mitigated by org* displays when steps to mitigate recommendations were taken elsewhere, and Security Exposure Management can't know whether recommendations are compliant. For example, by changing a status in Secure score.
- *Not available* means there isn't enough information to determine the compliance status.

## Security events

Security events consolidate information about posture management changes that are detected. In response to changes, you can adjust accordingly to maintain a robust security posture.

Events measure the score drop or worsening in the metric status.

- *Metric score drop events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the effect on the score and its weight. If there's a decrease of at least 2% since yesterday, meaning exposure grew by 2%, the change is considered a score drop event.
- *Initiative score drop events* notify customers when security initiatives decrease. We assess *Initiative score drop events* based on how it affects the score. If there's a decrease of at least 2% since yesterday, the change is classified as a score drop event.
Security events present and track, both initiative and metric score drop incidents to determine how they affect the organization's security posture.

New events appear at the top of the table and can include a new initiative event.

## Secure score

[Microsoft Secure score](/defender-xdr/microsoft-secure-score) helps organizations to plan and improve overall security posture using Secure score as a tracking metric.

Security Exposure Management uses Secure score as one of its sources for initiative scores.

- Secure score has "recommended actions" for a [number of products](/defender-xdr/microsoft-secure-score#products-included-in-secure-score).
- Selecting a recommendation to review allows you to remediate the problem in the specific product, including recommendations that derived from secure score.
- For recommendations where secure score is relevant, if secure score isn't active, that recommendation doesn't display.

## Next steps

- [Review security initiatives](initiatives.md)
- [Investigate security metrics](security-metrics.md)
- [Review security recommendations](security-recommendations.md)
- [Explore security events](security-events.md)
