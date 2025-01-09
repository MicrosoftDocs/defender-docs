---
title: Review security initiatives in Microsoft Security Exposure Management
description: Learn how to work with security Initiatives in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Review security initiatives

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) offers a focused, metric-driven way of tracking exposure in specific security areas using security initiatives. This article describes how to work with initiatives.

## Prerequisites

- Learn about [initiatives](exposure-insights-overview.md#security-initiatives) before you start.
- [Review prerequisites and permissions needed](prerequisites.md) for working with Security Exposure Management.
- Initiatives that are in preview are marked accordingly. These preview initiatives are still in development, and are subject to change.

## View initiatives page

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com/).

1. From the Exposure management section on the navigation bar, select **Exposure insights -> Initiatives** to open the [initiatives](https://security.microsoft.com/exposure-initiatives) page.

    :::image type="content" source="./media/initiatives/initiatives-window.png" alt-text="Screenshot of the Security Exposure Management Initiatives window.":::

1. At the top of the initiatives page, review the highlighted key initiatives by scrolling and drilling down per your needs.

1. To set an initiative to appear in the top initiative bar in the dashboard or on the initiatives page, select the **star** icon in the initiatives window or **Mark as favorite** in the individual initiative.

1. You can review the following information for all initiatives:
    - **14 day change trend graph** highlighting how the initiative score changes over the past 14 days
    - **Initiative name**
    - **Favorite** indicator (toggle on/off) to display in the key initiatives banner
    - **Current score** of the initiative
    - **Programs** or workloads contributing to or required by this initiative

1. Select an initiative to open the small overview and then select **Open initiative page** to review or remediate issues. The initiative page includes additional information including:
    - Your target score for the initiative
    - A means to set a custom target score appropriate to your organization's needs
    - Description
    - Associated security recommendations
    - All metrics related to the initiative, if applicable.
    - A metric trends graph and drift change, if applicable.
    - History of score changes
    - Related threats
:::image type="content" source="./media/initiatives/initiatives-ransomware.png" alt-text="Screenshot of the ransomware initiative.":::

## Set target score
1. To customize your initiative's target score, select **Initiatives.**

1. Select the individual initiative and then **Set target score** to open the set initiative target score window.

1. Set a new target score percentage and select **Apply**.

:::image type="content" source="./media/initiatives/set-initiative-target-score.png" alt-text="Screenshot of the window to set the initiative target.":::

## Check trends

The changes in your score provide you with useful feedback about how well you're meeting the goals of your initiatives.

1. From your initiative page, check the overall **14 day change trend graph** and **14 day drift change** to track the changes in your initiative score, visually and as a percentage.
1. For initiatives with metrics, you can examine this data per metric as well.

## Check history

1. Select an initiative to open the small overview and then select **Open initiative page-> History** to view changes over time.

1. Browse to the time table to choose a specific time point to examine.
    1. If needed, filter for specific time points.
    1. Choose the time point and select to examine the percent effect on the initiative score and the reason for the change.
    1. Select a metric to explore the change's effect further, if applicable.
    1. Open the **Changes to exposed assets** dropdown to view up to the top 100 changed assets. The status will indicate whether the asset exposure has been added or removed.

:::image type="content" source="media/exposure-insights-overview/initiatives-history-details-redcued.jpg" alt-text="Screenshot of history side panel" lightbox="media/initiatives/initiatives-history-details.png":::

## Review metrics and recommendations

1. To review metrics associated with your initiative, select **Exposure insights -> Initiatives-> Security metrics**.
1. Sort by heading, as needed.
1. Select **Exposure insights -> Initiatives-> Security recommendations** to view recommendations related to your initiative.

    You only see those recommendations that are *currently* applied to assets and active in Microsoft Secure Score or Microsoft Defender for Cloud.

1. Sort by heading or filter by state, source, impact, workload, or domain, as needed.

1. Select a recommendation, such as a *not compliant* one, and then select **Manage** to remediate the recommendation in the originating workload, such as Microsoft Defender Vulnerability Management.

    :::image type="content" source="media/initiatives/initiatives-security-recommendations.png" alt-text="Screenshot of the initiative's security recommendation tab.":::

## Next steps

- [Improve security insights with exposure insights overview](exposure-insights-overview.md)
- [Review security metrics](security-metrics.md)
- [Explore security events](security-events.md)
- [Review security recommendations](security-recommendations.md)
