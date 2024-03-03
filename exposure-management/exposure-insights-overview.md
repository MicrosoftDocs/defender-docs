---
title: Overview of exposure insights
description: This article provides an overview of Microsoft Exposure Management's exposure insights.
keywords: Microsoft Exposure Management, exposure insights, cyber security
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.subservice:
ms.localizationpriority: medium
ms.collection: 
- Tier1
- m365-security
search.appverid: met150
audience: ITPro
ms.date: 11/28/2023
---

# Overview of exposure insights


Exposure insights in Microsoft Security Exposure Management aggregate security posture data into a single pipeline, and provide rich context around the security posture state of your asset inventory. You leverage these insights to prioritize security effort, focus, and investment.  

Insights information and context helps CISOs, security decision makers, risk owners, and security/partner teams to manage exposure risk across the entire organization with a continuous and up-to-date posture overview to manage, drive, and prioritize security hygience and exposure management across the business.


[!INCLUDE [prerelease](../includes//prerelease.md)]

Exposure insights include security events, recommendations, metrics, and initiatives. These components build on each other to provide granular and aggregrated information about security posture state. Insights enable you to:

- Break down organizational security posture into prioritized initiatives.
- Measure and track exposure of key elements in initiatives.
- Prioritize areas of security focus based on initiatives and metrics.
- Follow actionable remediation steps to improve security posture and reduce risk.



## Security recommendations

Assets and workloads are assessed against security standards. Security recommendations based on those assessments provide practical steps to help you improve security settings and remediate identified issues.

In Security Exposure Management, the recommendations catalog serves as a centralized repository for security recommendations. Reommendations show as compliant or non-compliant for the entire organization, where compliant indicates that the recommendation has been implemented successfully. You can review individual recommendations, their state, impact, and source, and follow remediation steps to address recommendation issues.


Security Exposure Management integrates recommendations from Microsoft Defender for Cloud running the [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), and from Defender XDR [secure score](/microsoft-365/security/defender/microsoft-secure-score.md).

he recommendations For instance, sources like Microsoft Secure Score and Microsoft Defender for Cloud. Examining and addressing recommendations lets you preemptively address security risk and reduce exposure.

## Metrics

Metrics group together recommendations for similar assets, and measure specific aspects of exposure around those assets, from high to zero exposure.

For example:

- Percent of macOS endpoints missing an endpoint security solution agent
- Percent of cloud resources with critical vulnerabilities

You can review the metrics for your assets. Each metric shows the percentage of assets affected, the relative importance of the metric, and the impact that the metric has on initiatives in which it is include. You can drill down into individual recommendations to remediate them. Metric scores go up as recommendations are remediated.

Use metrics to assess an initiative's exposure status and identify exposed areas or areas that don't meet internal standards. This information can be used to prioritize which areas to address first.

Metrics are only shown if underlying data for the metric is available.

## Initiatives

Predefined initiatives gather metrics together to help you review and manage exposure in specific areas of security risk. Initiatives might measure a specific type of security such as identity or endpoint security, or focus horizontally across asset types, for example ransomware protection. Initiatives also focus on threat intelligence and emerging threats/attacks, or on specific compliance standards.

Security initiatives provide a means to measure the maturity of an organization's various security concerns, priorities, and threats. You can prioritize which initiatives to see on the overview dashboard.

You can review the initiative score that reflects the exposure status of the initiative, and drill down into initiatives to see their associated metrics. The score and recommendations are derived from metrics within the initiative.

As recommendations are fixed, metrics rise, and in turn initiative scores rise to reflect improved security posture.


## Security events

Security events consolidate information about any posture management changes detected, enabling customers to make adjustments to maintain a robust security posture. It measures the score drop, or worsening in the metric status. In particular, Security events handle *Initiative score drop events* and *Metric score drop events*.

- *Metric score drop events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the effect on the score and its weight. If there's a decrease of at least 2% since yesterday, meaning exposure grew by 2%, the change is considered a score drop event.
- *Initiative score drop events* notify customers when security initiatives decrease. We assess *Initiative score drop events* based on how it affects the score. If there's a decrease of at least 2% since yesterday, the change is classified as a score drop event.
- Security Events present and track initiative and metric score drop incidents in order to determine how they affect the organizations security posture.



## Secure Score

Secure score helps organizations:

- Report on the current state of the organization's security posture.
- Improve their security posture by providing discoverability, visibility, guidance, and control.
- Compare with benchmarks and establish key performance indicators (KPIs).

For more information, see [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score.md).

Microsoft Security Exposure Management recommendations use Secure Score as one of its sources. Secure score has "Recommended actions" for a [number of products](/microsoft-365/security/defender/microsoft-secure-score.md#products-included-in-secure-score). Selecting a recommendation to review, allows you to remediate the problem in the specific product, including recommendations that derived from Secure Score. For recommendations where Secure score is relevant, if Secure score isn't active, that recommendation doesn't display.

## Next steps

- [Review security initiatives](initiatives.md)
- [Investigate initiative metrics](security-metrics.md)
- [Review security recommendations](security-recommendations.md)
- [Explore security events](security-events.md)
- [Secure score for Microsoft Security Exposure Management](secure-score.md)

