---
title: Overview of exposure insights and secure score
description: This article provides an overview of Microsoft Exposure Management's exposure insights and secure score.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Overview of exposure insights and secure score

Exposure insights in [Microsoft Security Exposure Management](microsoft-security-exposure-management.md) continuously aggregate security posture data and insights across workloads, into a single pipeline. Exposure insights provide rich context around the security posture state of your asset inventory.

Chief Information Security Officers (CISOs), decision makers, risk owners, and security teams can use security insights and context to manage exposure risk across the entire organization, and to prioritize security efforts and investment.

Exposure insights include security events, recommendations, metrics, and initiatives. These components build on each other to provide granular context around security posture state. Insights enable you to:

- Break down organizational security posture into prioritized initiatives.
- Measure and track exposure of key security elements within initiatives.
- Prioritize areas of security focus based on initiatives and metrics.
- Follow actionable remediation steps to improve security posture and reduce risk.
- Track improvements in security initiatives in order to track security risk reduction.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Initiatives

Security initiatives simplify security posture management, and help you to assess readiness and maturity in specific areas of security risk.

Security Exposure Management provides predefined initiatives. Each predefined initiative contains one or more security metrics relevant to that initiative.

Initiatives can relate to specific workload domains, measuring a specific area such as endpoint, identity, and cloud security. They might contribute to threat analysis by relating to a specific threat across multiple categories. For example, ransomware protection or [critical asset protection](critical-asset-management.md#critical-asset-protection-initiative). Initiatives can also focus on specific compliance standards.

You can prioritize which initiatives to see on the **Overview** dashboard. The initiative score reflects the exposure status of the initiative. You can also drill down into initiatives to see their associated metrics and to understand where gaps or risks reside. The initiative score and recommendations are derived from metrics within the initiative.

### Initiative score

The initiative score is calculated based on the value and weight of the metrics associated with the initiative. As metrics improve the initiative score rises, reflecting a better posture in the initiative domain.

- Metrics largely improve by applying the recommendations associated with the initiative.
- Recommendations are fixed, metrics rise, and in turn initiative scores rise to reflect improved security posture.
- Changes in metrics, including deprecation/removal, value, and metric properties can affect the initiative score.

### History

You can track the history of changes greater than 2.5% that affect initiative score. You can filter for specific time points, and drill down to specific changes. History shows the percentage effects of metrics in the initiative score along with the change reason, including:

- *Property change* - A change in the weight of the metric in the score.
- *Value change* - A change in the value of the metric in the initiative score.
- *Metric removed* - The metric is no longer relevant for that specific initiative. For instance, if a better suggestion is introduced or it becomes irrelevant.
- *Metric depreciated* - The metric is removed globally.

:::image type="content" source="media/exposure-insights-overview/initiatives-history.png" alt-text="Screenshot of the Initiative history tab showing the graph and dates of changes." lightbox="media/exposure-insights-overview/initiatives-history.png":::

Selecting the metric that changed provides more details about the change. For instance, it might display the new weight of a property change, or the number of affected assets before or after the change.

:::image type="content" source="media/exposure-insights-overview/initiatives-history-details.png" alt-text="Screenshot of the metric change side panel in the Initiatives history tab." lightbox="media/exposure-insights-overview/initiatives-history-details.png":::

You can't control the metric or score changes in advance.

<!--## Programs

For each initiative, Programs shows the user what workloads or product types reflected in the initiative. For instance, Cloud Security or External Attack Surface. For initiatives that are connected to specific workloads, ensure that the product is onboarded. The initiative alerts you to the data required by the initiative. Some initiatives, like the Microsoft Defender External Attack Surface Management (EASM), require their own onboarding process. -->

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
|**Affected items** | The number of items that comply with the metric’s logic. In most cases, these items would be assets that are exposed or that create a risk factor. In other cases, affected would be the number of missing Microsoft secure score points to effectively implement recommended controls. |
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

In some cases, metrics display grayed out because the underlying data needed for this metric doesn't exist. Several situations cause metrics to be grayed out:

- The required workload isn't onboarded. For example, E5 customers without the Microsoft Defender for Identity workload turned on, has all, or most, Identity-related metrics grayed out.
- The required workload is onboarded, but to a limited extent. For instance:

    - A customer with a E3/P1 license has Defender for Endpoint workload enabled but without all the features of an E5/P2 license.
    - Microsoft Defenders for Endpoint customers see the "% of iOS devices not covered by security agents" metric grayed out if there are no onboarded or discovered iOS devices.
    
- The respective control in Secure score that the metric is based on is invalid for any reason, such as completed or risk accepted.

Grayed out metrics aren't considered for score calculation.

### Issues to note

Note that:

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

Security Exposure Management integrates recommendations from Microsoft Defender for Cloud running the [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), Defender XDR [Secure score](/microsoft-365/security/defender/microsoft-secure-score), and from other Microsoft workloads. It also provides recommendations related to non-Microsoft workloads.

### Working with recommendations

You can review individual recommendations, their state, impact, source, details about exposed entities, and related initiatives and metrics. Each recommendation provides remediation steps to address detected issues.

Every action taken on a security recommendation, helps reduce exposure and directly influences related security metrics and initiatives.

:::image type="content" source="./media//exposure-insights-overview/recommendation-ransomeware-advanced-protection.png" alt-text="Screenshot of the ransomware advanced protection recommendation details ":::

### Compliance

Security Exposure Management categorizes security by compliance state for the entire organization.

- *Compliant* indicates that the recommendation was implemented successfully.
- *Mitigated by org* displays when steps to mitigate recommendations were taken elsewhere, and Security Exposure Management can't know whether recommendations are compliant. For example, by changing a status in Secure score.
- *Not available* means there isn't enough information to determine the compliance status.

<!--Security exposure management recommendations relate to the following workloads:

- App governance
- Atlassian (preview)
- Microsoft Entra ID 
- Citrix ShareFile
- Defender for Cloud
- Defender for Endpoint
- Defender for Identity
- Defender for Office
- DocuSign
- Dropbox (preview)
- Exchange Online
- GitHub
- Google Workspace
- Intune
- Microsoft Defender for Cloud Apps
- Microsoft Purview Information Protection
- Microsoft Teams
- NetDocuments (preview)
- Okta
- Salesforce
- ServiceNow
- SharePoint Online
- Slack (preview)
- Workplace (preview)
- Zendesk (preview)
- Zoom
-->

## Security events

Security events consolidate information about posture management changes that are detected. In response to changes, you can adjust accordingly to maintain a robust security posture.

Events measure the score drop or worsening in the metric status.

- *Metric score drop events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the effect on the score and its weight. If there's a decrease of at least 2% since yesterday, meaning exposure grew by 2%, the change is considered a score drop event.
- *Initiative score drop events* notify customers when security initiatives decrease. We assess *Initiative score drop events* based on how it affects the score. If there's a decrease of at least 2% since yesterday, the change is classified as a score drop event.
Security events present and track, both initiative and metric score drop incidents to determine how they affect the organization's security posture.

New events appear at the top of the table and can include a new initiative event.

## Secure score

[Microsoft secure score](/microsoft-365/security/defender/microsoft-secure-score) helps organizations to plan and improve overall security posture using Secure score as a tracking metric.

Security Exposure Management uses Secure score as one of its sources for initiative scores.

- Secure score has "recommended actions" for a [number of products](/microsoft-365/security/defender/microsoft-secure-score#products-included-in-secure-score).
- Selecting a recommendation to review allows you to remediate the problem in the specific product, including recommendations that derived from secure score.
- For recommendations where secure score is relevant, if secure score isn't active, that recommendation doesn't display.

## Next steps

- [Review security initiatives](initiatives.md)
- [Investigate initiative metrics](security-metrics.md)
- [Review security recommendations](security-recommendations.md)
- [Explore security events](security-events.md)
