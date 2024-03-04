---
title: Review security initiatives
description: This article describes Microsoft Security Exposure Management initiatives and how Initiatives work.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Review security initiatives

<!--Microsoft Security Exposure Management provides a means to optimize your security domain and protect against security threats using security initiatives.--> [Microsoft Security Exposure initiatives](exposure-insights-overview.md#initiatives) offer a focused, metric-driven way of tracking your organization’s maturity to a wide variety of important security concerns. It aggregates data and insights across workloads into a single pipeline.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## View initiatives page

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com/).

1. From the Exposure management section on the navigation bar, select **Exposure insights -> initiatives** to open the [initiatives](https://security.microsoft.com/exposure-initiatives) page.<!-- from through the navigation bar under **Exposure Management -> Exposure Insights -> Initiatives**.-->
:::image type="content" source="./media/initiatives-window.png" alt-text="Screenshot of the Initiatives window.":::

1. At the top of the initiatives page, review the highlighted key initiatives by scrolling and drilling down per your needs.

1. To set an initiative to appear in the top initiative bar in the dashboard or on the initiatives page, select the **star** icon in the initiatives window or **mark as favorite** in the individual initiative.
1. Select how to view the initiatives catalog. Choose between **all initiatives**, **domain initiatives**, and  **threat Article initiatives**.

1. Once you select how to view initiatives you can review the following information:
    - **14 day change trend graph** showcasing how the initiatitve score changes over the past 14 days
    - **Initiative name**
    - **Favorite** indicator (toggle on/off) to display in the key initiatives banner
    - **Current score** of the initiative
    - **Programs** or workloads contributing to or required by this initiative

1. Select an initiative to open the small overview and then select **Open initiative page** to review or remediate issues. The initiative page includes additional information including:
    - Your target score for the initiative
    - A means to set a custom target score appropriate to your organization's needs
    - Description
    - Associated security recommendations
    - All metrics related to the initiative
    - metric trends graph and drift change
    - History of score changes
    - Related threats
:::image type="content" source="./media/initiatives-ransomware.png" alt-text="Screenshot Ransomware initiative":::

## Set target score
<!-- distinction between score and current value percentage-->
1. To customize your initiative's target score, select **initiatives.**

1. Select the individual initiative and then **set target score** to open the set initiative target score window.

1. Set a new target score percentage and select **Apply**.

:::image type="content" source="./media/set-initiative-target-score.png" alt-text="Screenshot of the Set target score window.":::

## Trends

The changes in your score provide you with useful feedback about how well you're meeting the goals of your initiatives.

1. From your initiative page, check the overall **14 day change trend graph** and **14 day drift change** to track the changes in your initiative score, visually and as a percentage. You can examine this data per metric as well.
<!--1. Select **Open initiative page** and then **History** to track the changes in metrics every day along with the reason for the change. For instance, a weight change or a change in the metric value. Also, each initiative displays the delta change in assets and the related assets that day. For instance, if the metric "Virtual machines with plain text keys and secrets" went down 2.5% yesterday, the asset tab shows the larger number of assets that day with plain text keys and secrets. -->
<!-- note that history may need to go outand replaced with this: The **14 day change trend graph** and **14 day drift change** track the changes in your initiative score, visually and as a percentage. -->
<!-->:::image type="content" source="./media/history.png" alt-text="Screenshot of the Initiatives History tab."::: -->

## Metrics and recommendations

1. To review metrics associated with your initiative, select **Exposure Insights -> Initiatives-> Security metrics**.

1. Select **Exposure Insights -> Initiatives-> Security recommendations** to view recommendations  related to your initiative. You only see those recommendations that are *currently* applied to assets and active in Microsoft Secure Score or Microsoft Defender for Cloud.

1. Select a not compliant recommendation and then **Manage** to remediate the recommendation in the appropriate workload.

## Next steps

- [Improve security insights with exposure insights overview](exposure-insights-overview.md)
- [Review security metrics](security-metrics.md)
- [Explore security events](security-events.md)
- [Review security recommendations](security-recommendations.md)
- [!INCLUDE [support](../includes//support.md)]
