---
title: SaaS Security Initiative
description: Learn how to use the SaaS Security Initiative in Microsoft Defender XDR.
ms.topic: how-to
ms.date: 10/31/2024
---

# SaaS Security Initiative 

The SaaS Security Initiative provides a centralized place for software as a service (SaaS) security best practices, so that organizations can manage and prioritize security recommendations effectively. By focusing on the most impactful metrics, organizations can enhance their SaaS security posture.

The SaaS Security Initiative serves as the main hub for SaaS security posture management (SSPM). It consolidates best-practice recommendations into 12 measurable metrics. These metrics facilitate the management and prioritization of a large number of security recommendations.

## Prerequisites

- Your organization must have Microsoft Defender for Cloud Apps licenses.
- The app for which you want to view security recommendations must be connected to Defender for Cloud Apps. For information about connecting and about which of the app connectors provide security recommendations, see [Connect apps to get visibility and control with Microsoft Defender for Cloud Apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

## View SaaS Security Initiative recommendations

1. In Microsoft Defender XDR, go to **Exposure Management** and select **Initiatives**.
1. Select the  **SaaS Security** initiative, and then select **Open Initiative Page**.

The page that appears lists the 12 metrics that categorize hundreds of best-practice recommendations.

:::image type="content" source="media\saas-securty-initiative\screenshot-of-the-saas-security-initiative-home-page.png" alt-text="Screenshot of the SaaS Security Initiative home page." lightbox="media\saas-securty-initiative\screenshot-of-the-saas-security-initiative-home-page.png":::

We recommend that you prioritize metrics with the highest **Impact on Initiative Score** level. This composite measure considers both the **Weight** value of each recommendation and the percentage of **Non-Compliant** recommendations.

To effectively monitor progress, set a **target score** value for your organization's security posture. This target will serve as a benchmark for improvement and help track advancements over time.

For instance, to gain visibility into all best-practice recommendations that pertain to privileged access within SaaS applications, select the metric labeled **Missing Best Practices to Secure Privileged Access in SaaS Apps**. You can then select any of the **Non-Compliant** recommendations to access the associated remediation steps.

## Additional information

- Each metric includes a list of associated app connectors. The list encourages organizations to enable more connectors for enhanced visibility. If you're interested in recommendations for specific applications, go to the **Security recommendations** tab and filter by the relevant application.
- To learn more about Microsoft Security Exposure Management initiatives, see [Review security initiatives](/security-exposure-management/initiatives).
