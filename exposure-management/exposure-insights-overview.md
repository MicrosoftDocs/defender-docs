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

The Exposure insights section in Microsoft Security Exposure Management is a one-stop-shop for chief information security officers (CISO), security decision makers, risk owners, and security managers to manage exposure insights throughout the entire organization. It provides a continuous and unified posture oversight to prioritize and drive security hygiene and exposure management across the enterprise. It aggregates detection data across workloads into a single pipeline.

[!INCLUDE [prerelease](../includes//prerelease.md)]

The Exposure insights section is made up of the following capabilities:

- Security initiatives
- Security metrics
- Recommendations
- Security events

It uses Secure Score, and other benchmarks, to help meet a target score to minimize risk. <!--improve-->

## Security initiatives

Security initiatives provide a means to measure the maturity of an organization's various security concerns, priorities, and threats. You can review your product specific and threat specific initiatives, customize scores, and prioritize which initiatives to see on the overview dashboard.

[Initiatives](https://security.microsoft.com/exposure-initiatives) can be accessed through the dashboard or in the [Microsoft Defender portal](https://security.microsoft.com) through the navigation bar under **Exposure Management -> Exposure Insights -> Initiatives**.

:::image type="content" source="./media/security-exposure-management/initiatives-dashboard.png" alt-text="screenshot of the initiatives dashboard":::

For more information, see [Review security initiatives](initiatives.md).

## Security metrics

Security metrics measure specific aspects of exposure with respect to a given asset. For example:

- Percent of macOS endpoints missing an endpoint security solution agent
- Percent of cloud resources with critical vulnerabilities

Metrics allow users to assess an initiative's exposure status and identify exposed areas or areas that don't meet internal standards. This information can be used to prioritize which areas to address first.
To access [Metrics](https://security.microsoft.com/exposure-metrics), go to **Exposure Management -> Exposure Insights -> Metrics**.

:::image type="content" source="./media/security-exposure-management/metrics.png" alt-text="Screenshot of the metrics page in Exposure management.":::

For more information, see [Investigate initiative metrics](security-metrics.md).

## Recommendations

The recommendations catalog serves as a centralized repository for security recommendations from various different sources. For instance, sources like Microsoft Secure Score and Microsoft Defender for Cloud. Examining and addressing recommendations lets you preemptively address security risk and reduce exposure.

For more information, see [Review security recommendations](security-recommendations.md).

:::image type="content" source="./media/security-exposure-management/recommendations-navigation.png" alt-text="Screenshot of the recommendations window.":::

## Security events

Security events consolidate information about any posture management changes detected, enabling customers to make adjustments to maintain a robust security posture. It measures the score drop, or worsening in the metric status. In particular, Security events handle *Initiative score drop events* and *Metric score drop events*.

- *Metric score drop events* notify customers when there's a new exposure measured by the security metrics. They're evaluated based on the effect on the score and its weight. If there's a decrease of at least 2% since yesterday, meaning exposure grew by 2%, the change is considered a score drop event.
- *Initiative score drop events* notify customers when security initiatives decrease. We assess *Initiative score drop events* based on how it affects the score. If there's a decrease of at least 2% since yesterday, the change is classified as a score drop event.
- Security Events present and track initiative and metric score drop incidents in order to determine how they affect the organizations security posture.

To access [Events](https://security.microsoft.com/exposure-events), go to **Exposure Management -> Exposure Insights -> Events**.

:::image type="content" source="./media/security-exposure-management/events-navigation.png" alt-text="Screenshot of the Exposure management Events window.":::

For more information, see [Explore security events](security-events.md).

## Secure Score

Secure score helps organizations:

- Report on the current state of the organization's security posture.
- Improve their security posture by providing discoverability, visibility, guidance, and control.
- Compare with benchmarks and establish key performance indicators (KPIs).

For more information, see [Microsoft Secure Score](../defender/microsoft-secure-score.md).

Microsoft Security Exposure Management recommendations use Secure Score as one of its sources. Secure score has "Recommended actions" for a [number of products](../defender/microsoft-secure-score.md#products-included-in-secure-score). Selecting a recommendation to review, allows you to remediate the problem in the specific product, including recommendations that derived from Secure Score. For recommendations where Secure score is relevant, if Secure score isn't active, that recommendation doesn't display.

## Next steps

- [Review security initiatives](initiatives.md)
- [Investigate initiative metrics](security-metrics.md)
- [Review security recommendations](security-recommendations.md)
- [Explore security events](security-events.md)
- [Secure score for Microsoft Security Exposure Management](secure-score.md)
- [!INCLUDE [support](../includes//support.md)]
