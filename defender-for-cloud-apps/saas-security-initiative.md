---
title: SaaS Security Initiative in Microsoft Defender XDR
description: View and prioritize SaaS security posture management (SSPM) recommendations using the 12 metrics in the SaaS Security Initiative in Microsoft Defender XDR.
ms.topic: how-to
ms.date: 07/03/2026
ms.reviewer: iidogGedanken
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# Use the SaaS Security Initiative in Defender for Cloud Apps

This article shows you how to view and prioritize SaaS security recommendations in Microsoft Defender XDR by using the SaaS Security Initiative. Before you start, make sure you meet the [prerequisites](#prerequisites).

## Overview of the SaaS Security Initiative

The SaaS Security Initiative is the main hub for SaaS security posture management (SSPM). It gives you a central place to manage software as a service (SaaS) security best practices.

The initiative groups best-practice tips into 12 metrics. You can use these metrics to rank and act on security tasks. Focus on the metrics with the most impact to improve your SaaS security posture.

## How to use the SaaS Security Initiative

Watch the following video for an overview of how to use the SaaS Security Initiative.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=352cf722-69b2-45c1-932e-0ca32ef40fa0]

## Prerequisites

Before you view these recommendations, make sure you meet these requirements:

- Your organization must have Microsoft Defender for Cloud Apps licenses.
- The app you want to check must be connected to Defender for Cloud Apps. To learn how to connect apps and which connectors provide security tips, see [Connect apps to get visibility and control with Microsoft Defender for Cloud Apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

## View SaaS Security Initiative recommendations

To view SaaS Security Initiative recommendations, perform the following steps:

1. In the Defender portal, go to **Exposure Management** and select **Initiatives**.
1. Select the  **SaaS Security** initiative, and then select **Open Initiative Page**.

The page that appears lists the 12 metrics that categorize hundreds of best-practice recommendations.

:::image type="content" source="media\saas-securty-initiative\screenshot-of-the-saas-security-initiative-home-page.png" alt-text="Screenshot of the SaaS Security Initiative home page." lightbox="media\saas-securty-initiative\screenshot-of-the-saas-security-initiative-home-page.png":::

Start with the metrics that have the highest **Impact on Initiative Score** level. This score combines the **Weight** of each item with the share of **Non-Compliant** items.

To track progress, set a **target score** for your security posture. Use this target as a benchmark to measure gains over time.

For example, to review tips for privileged access in SaaS apps, select **Missing Best Practices to Secure Privileged Access in SaaS Apps**. Then select any **Non-Compliant** item to see the fix steps.

<a name="additional-information"></a>
## Related resources for SaaS Security Initiative

Use these resources to understand and build on the initiative results:

- Each metric lists its linked app connectors. Enable more connectors to get broader coverage. To see tips for a specific app, go to the **Security recommendations** tab and filter by that app.
- To learn more about Microsoft Security Exposure Management initiatives, see [Review security initiatives](/security-exposure-management/initiatives).
