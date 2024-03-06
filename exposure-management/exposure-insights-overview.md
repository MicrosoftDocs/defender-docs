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

Exposure insights in Microsoft Security Exposure Management aggregate security posture data and insights across workloads into a single pipeline, and provide rich context around the security posture state of your asset inventory.

Leveraging insights information and context helps CISOs, security decision makers, risk owners, and security/partner teams to manage exposure risk across the entire organization with a continuous and up-to-date posture overview to manage, drive, and prioritize security efforts and investment across the business.

[!INCLUDE [prerelease](../includes//prerelease.md)]

Exposure insights include security events, recommendations, metrics, and initiatives. These components build on each other to provide granular and aggregated information about security posture state. Insights enable you to:

- Break down organizational security posture into prioritized initiatives.
- Measure and track exposure of key elements in initiatives.
- Prioritize areas of security focus based on initiatives and metrics.
- Follow actionable remediation steps to improve security posture and reduce risk.

## Security recommendations

Assets and workloads are assessed against security standards. Security recommendations, based on those assessments, provide practical steps to help you improve security settings and remediate identified issues. In Security Exposure Management, the recommendations catalog serves as a centralized repository for security recommendations.

Every action taken on a security recommendation, helps reduce exposure and directly influences related security metrics and security initiatives, as relevant.

You can review individual recommendations, their state, impact, and source, details about exposed entities, and related initiatives and metrics. You can also follow remediation steps to address recommendation issues.

:::image type="content" source="./media/recommendation-ransomeware-advanced-protection.png" alt-text="Screenshot of the ransomware advanced protection recommendation details ":::

### Compliance data

Each security recommendation can be categorized as *compliant*, *non-compliant*, *mitigated by org*, or *not available* for the entire organization. *Compliant* indicates that the recommendation has been implemented successfully. The status *mitigated by org* displays when you've taken steps to mitigate recommendations elsewhere, such as by changing a status in secure score, and Security Exposure Management can't know whether recommendations are compliant. A *not available* status means there isn't enough information to determine the compliance status.

### Proactive workload recommendations

Security Exposure Management integrates recommendations from Microsoft Defender for Cloud running the [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), Defender XDR [secure score](/microsoft-365/security/defender/microsoft-secure-score.md), and from a wide range of Microsoft workloads. It also provides recommendations related to non-Microsoft workloads.

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
> [!NOTE]
>Customers who have Microsoft Defender Cloud Security Posture Management (CSPM) subscriptions will have access to comprehensive cloud data. In the absence of this subscription, only limited cloud data will be accessible in recommendations.

## Metrics

Metrics group together recommendations for similar assets, and measure specific aspects of exposure around those assets, from high to zero exposure.

For example:

- Percent of macOS endpoints missing an endpoint security solution agent
- Percent of cloud resources with critical vulnerabilities

As you review the metrics for your assets, each metric shows the percentage of assets affected, the relative importance of the metric, and the impact that the metric has on initiatives in which it is included. It also shows the weight, or importance, of the metric and its impact on the initiative score as a number with one the lowest and 10the highest.

Weight can be customized by an admin to have greater or lesser impact, based on your organization's unique business priorities and considerations. Editing your metric weight value affects the metric and all related initiatives.

You can drill down into individual metric recommendations to remediate them. Metric scores go up as recommendations are remediated.

Use metrics to assess an initiative's exposure status and identify exposed areas or areas that don't meet internal standards. This information can be used to prioritize efforts around risk mitigation.

Metrics are only shown if underlying data for the metric is available.

Most metrics have at least one associated recommendation, to help users make improving metrics easy and actionable. Metrics include several properties that help contextualize them and make them actionable:

|Property  |Description  |
|---------|---------|
|**Current value** | The percentage of affected assets out of the total assets. Zero percent is best since there's no exposure, while 100% is worst. |
|**Affected items** | The number of items that comply with the metric’s logic. In most cases, these items would be assets that are exposed or that create a risk factor. In other cases, affected would be the number of missing Microsoft secure score points to effectively implement recommended controls. |
|**Total** | The number of assets that is scoped for the metric. For example, for a given metric it might be all endpoints. For another, it could be all Windows endpoints. |
|**Weight** | The importance of the metric and its effect over the initiative score. One is the lowest while 10 is the highest. Weight can be customized to have greater or lesser effect based on your organization's unique business priorities and considerations. Editing your metric weight value affects the metric and all related initiatives. |
| **Score impact** | The impact completing the metric has on the initiative score. Meaning if a given metric is completed, the score impact is the addition seen to the initiative score. |

Those properties display when viewing all metrics in the Exposure insights section. Viewing all metrics from the metrics page adds:

- **14 day trend** shows the metric value changes over the past 14 days as a percentage and graph. 
- **State** such as:
  - **Needs attention** or requires mitigation.
  - **Risk accepted** by an admin to indicate that the risk was mitigated in a non-measurable way that doesn't affect the initiative score.
  - **Target met** or the exposure was mitigated.
- **Total** number of items
- **Last Updated**

In some cases, metrics display grayed out because the underlying data needed for this metric doesn't exist. Several situations cause metrics to be grayed out:

- The required workload isn't onboarded. For example, E5 customers without the Microsoft Defender for Identity workload turned on, has all, or most, Identity-related metrics grayed out.
- The required workload is onboarded, but to a limited extent. For instance:
 - A customer with a E3/P1 license has Defender for Endpoint workload enabled but without all the features of an E5/P2 license.
 - Microsoft Defenders for Endpoint customers see the “% of iOS devices not covered by security agents” metric grayed out if there are no onboarded or discovered iOS devices.
- The respective control in secure score that the metric is based on is invalid for any reason, such as completed or risk accepted.

Grayed out metrics aren't considered for score calculation.

> [!NOTE]
> Some instances of affected assets information, largely information originating in secure score, doesn't appear on the Affected Items tab in an individual metric. Also, some critical asset information for assets in the Affected Items tab does not show.
> Asset details are calculated on demand.
> Cloud-related metrics apply only for subscription and their subsequent resources if the subscription is onboarded to a Cloud Security Posture Management (CSPM) Premium plan.
> In some cases, metrics are more specific than the scope of the related recommendations. In such a case, the asset detail shown won't align with the asset details of the related recommendations.
> Offboarding a workload will result in an inability to refresh the metric status and the asset details for related metrics.

## Initiatives

Predefined initiatives gather metrics together to help you review and manage exposure in specific areas of security risk.

Initiatives might relate to specific domains, and measure a specific security like endpoint, identity, and cloud security. They could contribute to threat analysis by addressing a known threat or paradigm across multiple product categories or types, for example ransomware protection or [critical asset protection](critical-asset-management.md#critical-asset-protection-initiative). Initiatives also focus on specific compliance standards.

Security initiatives offer a means to measure an organization's maturity across security concerns, priorities, and threats. They offer a consumable way to approach exposure.

You can prioritize which initiatives to see on the overview dashboard, review the initiative score that reflects the exposure status of the initiative, and drill down into initiatives to see their associated metrics and to understand where gaps or risks reside. The initiative score and recommendations are derived from metrics within the initiative.

### Initiatives score

The initiative score is calculated based on the value and weight of the metrics associated with the initiative. As users improve their metrics the initiative score rises, reflecting a better posture on that domain. The score level reflects the organization's maturity in relation to security concerns. Metrics largely improve through applying the recommendations associated with the initiative.

As recommendations are fixed, metrics rise, and in turn initiative scores rise to reflect improved security posture.

Changes in metric, value, and properties can impact the initiative score. Initiatives provides a way to track the history of changes greater than 2.5%, filter for specific time points, and drill down to specific initiative changes. For instance, when a metric value changes or a metric is removed. The metric or score changes can't be controlled in advance by customers.

<!--## Programs

For each initiative, Programs shows the user what workloads or product types reflected in the initiative. For instance, Cloud Security or External Attack Surface. For initiatives that are connected to specific workloads, ensure that the product is onboarded. The initiative alerts you to the data required by the initiative. Some initiatives, like the Microsoft Defender External Attack Surface Management (EASM), require their own onboarding process. -->

> ![NOTE]
> The ability to onboard initiatives is included in the paid version of Microsoft Security Exposure Management.

## Security events

Security events consolidate information about any posture management changes detected, enabling customers to adjust to maintain a robust security posture. It measures the score drop or worsening in the metric status. Security events handle *initiative score drop events* and *metric score drop events*.

- *Metric score drop events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the effect on the score and its weight. If there's a decrease of at least 2% since yesterday, meaning exposure grew by 2%, the change is considered a score drop event.
- *Initiative score drop events* notify customers when security initiatives decrease. We assess *Initiative score drop events* based on how it affects the score. If there's a decrease of at least 2% since yesterday, the change is classified as a score drop event.
- Security events present and track, initiative and metric score drop incidents to determine how they affect the organization's security posture.

New events appear at the top of the table and can include a new initiative event.

## Secure score

[Microsoft secure score](/microsoft-365/security/defender/microsoft-secure-score.md) helps organizations:

- Assess their current security posture.
- Identify potential improvements across all Microsoft 365 workloads and 3rd party services.
- Improve their security posture by providing discoverability, visibility, guidance, and control.
- Report to leadership on the current state of the organization's security posture and sustain progress with historical data reports.
- Benchmark the organization's status over time and compare it with benchmarks and established key performance indicators (KPIs).

You can continue to use secure score tools to plan and improve your overall security posture with secure score as a tracking metric.

For more information, see [Microsoft secure score](/microsoft-365/security/defender/microsoft-secure-score.md).

Microsoft Security Exposure Management provides metrics through [initiatives](#initiatives) that help you identify exposure and potential posture improvements attached to business context and various security aims in your organization.

- Security Exposure Management initiative scores use secure score as one of its sources for initiative scores.
- Secure score has "recommended actions" for a [number of products](/microsoft-365/security/defender/microsoft-secure-score.md#products-included-in-secure-score).
- Selecting a recommendation to review allows you to remediate the problem in the specific product, including recommendations that derived from Secure Score. For recommendations where Secure score is relevant, if Secure score isn't active, that recommendation doesn't display.

## Next steps

- [Review security initiatives](initiatives.md)
- [Investigate initiative metrics](security-metrics.md)
- [Review security recommendations](security-recommendations.md)
- [Explore security events](security-events.md)
- [Secure score for Microsoft Security Exposure Management](secure-score.md)
