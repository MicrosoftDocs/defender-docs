---
title: Identity Security Initiative
description: Learn how to enhance your organization's identity security using the Identity Security Initiative in Microsoft Defender XDR.
ms.topic: overview
ms.date: 04/05/2025
ms.reviewer: AbbyMSFT
---

# Identity Security Initiative (Preview)

Identity security is the practice of protecting the digital identities of individuals and organizations. This includes protecting passwords, usernames, and other credentials that can be used to access sensitive data or systems. Identity security is essential for protecting against a wide range of cyber threats, including phishing, malware, and data breaches.

## Prerequisites

- Your organization must have a Microsoft Defender for Identity license.
- [Review prerequisites and permissions needed](/security-exposure-management/prerequisites) for working with Security Exposure Management.

## View Identity Security Initiatives
1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com/).
1. From the Exposure management section on the navigation bar, select **Exposure insights** **>** **Initiatives** to open the Identity Security page.

   :::image type="content" source="media/identity-security-initiative/screenshot-of-the-identity-security-initiative-page.png" alt-text="Screenshot showing the Identity security initiative page." lightbox="media/identity-security-initiative/screenshot-of-the-identity-security-initiative-page.png":::

## Review security metrics

Metrics in security initiatives help you to measure exposure risk for different areas within the initiative. Each metric gathers together one or more recommendations for similar assets.
Metrics can be associated with one or more initiatives.

On the **Metrics** tab of an initiative, or in the Metrics section of Exposure Insights, you can see the metric state, its effect, and relative importance in an initiative, and recommendations to improve the metric.
We recommend that you prioritize metrics with the highest impact on Initiative Score level. This composite measure considers both the weight value of each recommendation and the percentage of noncompliant recommendations.

:::image type="content" source="media/identity-security-initiative/screenshot-of-the-security-metrics-page.png" alt-text="Screenshot showing the security metrics page." lightbox="media/identity-security-initiative/screenshot-of-the-security-metrics-page.png":::


|Metric property |Description  |
|---------|---------|
|**Metric name**    | The name of the metric.        |
|**Progress**   |Shows the improvement of the exposure level for the metric from 0 (high exposure) to 100 (no exposure).         |
|**State**   | Shows if the metric needs attention or if the target was met.       |
|**Total assets**  | Total number of assets under the metric scope.        |
|**Recommendations**   | Security recommendations associated with the metric.        |
|**Weight**    | The relative weight (importance) of the metric within the initiative, and its effect on the initiative score. Shown as High, Medium, and Low. It can also be defined as Risk accepted.        |
|**14-day trend** | Shows the metric value changes over the last 14 days.        |
|**Last updated** | Shows a timestamp of when the metric was last updated.

> [!NOTE]
> The Affected assets experience isn't fully supported during the Preview phase.

## View Identity security recommendations 

 The Security recommendations tab displays a list of prioritized remediation actions related to your identity security posture. Each recommendation is evaluated for compliance and mapped to its corresponding risk impact, workload, and domain. This view helps you triage and take action based on urgency and business relevance.

:::image type="content" source="media/identity-security-initiative/screenshot-showing-the-security-recommendations-page.png" alt-text="Showing showing the security recommendations page." lightbox="media/identity-security-initiative/screenshot-showing-the-security-recommendations-page.png":::

Sort the recommendations by any of the headings or filter them based on your task needs. 

| **Column**             | **Description**                                                                 |
|------------------------|---------------------------------------------------------------------------------|
| **Name**               | The name of the recommended action (for example, *Configure VPN integration*, *Enable MFA*). |
| **State**              | Indicates whether the recommendation is *Compliant* or *Not Compliant*.         |
| **Impact**             | The security impact level (Low, Medium, or High) of implementing the recommendation. |
| **Workload**           | The Microsoft service area the recommendation applies to (for example, Defender for Identity, Microsoft Entra ID). |
| **Domain**             | The security domain (for example, identity, apps) associated with the recommendation.   |
| **Last calculated**    | The most recent time the recommendation's status was evaluated.                 |
| **Last state change**  | When the recommendation’s compliance state last changed.                        |
| **Related initiatives**| Number of security initiatives impacted by this recommendation.                 |
| **Related metrics**    | Number of security metrics that this recommendation contributes to.             |

Security Exposure Management categorizes recommendations by compliance status, as follows:

- **Compliant**: Indicates that the recommendation was implemented successfully.
- **Not complaint**: Indicates that the recommendation wasn't fixed.

## Set target score

You can set a customized target score for the initiative, taking your organization’s unique set of circumstances, priorities, and risk appetite into account.

To set a target store, select the initiative, and then select **Set target score** from the top of the initiative pane.

:::image type="content" source="media/identity-security-initiative/set-target-score.png" alt-text="Screenshot showing the set target score button." lightbox="media/identity-security-initiative/set-target-score.png":::

## Related content

- [Review security initiatives](/security-exposure-management/initiatives)

- [Investigate security initiative metrics](/security-exposure-management/security-metrics)
