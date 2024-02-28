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

[!INCLUDE [prerelease](../includes//prerelease.md)]

<!--Microsoft Security Exposure Management provides a means to optimize your security domain and protect against security threats using security initiatives.--> Microsoft Security Exposure initiatives offer a focused, metric-driven way of tracking your organization’s maturity to a wide variety of important security concerns. For example, initiatives for ransomware protection, endpoint security, and [critical asset protection](critical-asset-management.md#critical-asset-protection-initiative). Security initiatives allow you to review your product specific and threat specific initiatives, evaluate an initiative's maturity, customize their scores, and prioritize initiatives for display on the overview dashboard.

## View initiatives page

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com/).

1. From the Exposure management section on the navigation bar, select **Exposure Insights -> Initiatives** to access [Initiatives](https://security.microsoft.com/exposure-initiatives). The Initiatives page opens.<!-- from through the navigation bar under **Exposure Management -> Exposure Insights -> Initiatives**.-->
:::image type="content" source="./media/security-exposure-management/initiatives-window.png" alt-text="Screenshot of the Initiatives window.":::

1. At the top of the Initiatives page, review the highlighted Key initiatives by scrolling and drilling down per your needs. To set an initiative to appear in the Top Initiative bar in the dashboard and in Initiatives, select the star icon in the Initiatives window or **mark as favorite** in the individual initiative.
1. Select how to view the initiatives catalog. Choose between:

    - **All initiatives** - All initiatives are displayed.
    - **Domain initiatives** - Initiatives that are specific to particular domains, and address a specific product category or type, often aligned with organizational and market definition. They currently include endpoint, identity, and cloud security. Examples of domain initiatives are Critical Asset Protection, Business Email Compromise- Financial Fraud, Ransomware Protection, and Vulnerabilities Assessments initiatives. <!-- confirm-->
    - **Threat Article initiatives** - Initiatives that contribute to threat analysis by addressing a known threat or paradigm across multiple product categories or types. Threat article initiatives are designed based on the Recommended actions for [Threat analytics](../defender/threat-analytics.md) items. Threat Article initiatives deal with phishing, ransomware, and specific actor and activity profiles, among an ever expanding list of initiative areas.
1. Once you select how to view initiatives you can review the following information:
    - **14 day change trend graph**
    - **Initiative name**
    - **Favorite** indicator (toggle on/off)
    - **Current score**
    - **Programs**
    - **14 day drift change** as a percentage
1. Select an initiative to open the small overview and then select **Open initiative page** to review or remediate issues. The initiative page includes additional information including:
    - Your target score for the initiative
    - A means to set a custom target score appropriate to your organization's needs
    - Description
    - Associated security recommendations
    - All metrics related to the initiative
    - metric trends graph and drift change
    - History of score changes
    - Related threats
:::image type="content" source="./media/security-exposure-management/initiatives-ransomware.png" alt-text="Screenshot Ransomware initiative":::

## Score
<!-- distinction between score and current value percentage-->
An initiative's score reflects its exposure status. The score is calculated based on the value and weight of the metrics associated with the initiative. As users improve their metrics the initiative score rises, reflecting a better posture on that domain. The score level reflects the organization's maturity in relation to security concerns. Metrics largely improve through applying the recommendations associated with the initiative.
To customize your initiative's target score, select the initiative and then **Set target score** from the individual initiative overview window to open the Set initiative target score window. Once your new value is selected, select **Apply**.

:::image type="content" source="./media/security-exposure-management/set-initiative-target-score.png" alt-text="Screenshot of the Set target score window.":::

## Trends

The changes in your score provide you with useful feedback about how well you're meeting the goals of your initiatives.

1. From your initiative page, check the overall **14 day change trend graph** and **14 day drift change** to track the changes in your initiative score, visually and as a percentage. You can examine this data per metric as well.
1. Select **Open initiative page** and then **History** to track the changes in metrics every day along with the reason for the change. For instance, a weight change or a change in the metric value. Also, each initiative displays the delta change in assets and the related assets that day. For instance, if the metric "Virtual machines with plain text keys and secrets" went down 2.5% yesterday, the asset tab shows the larger number of assets that day with plain text keys and secrets.
<!-- note that history may need to go outand replaced with this: The **14 day change trend graph** and **14 day drift change** track the changes in your initiative score, visually and as a percentage. -->
:::image type="content" source="./media/security-exposure-management/history.png" alt-text="Screenshot of the Initiatives History tab.":::

## Programs

For each initiative, Programs shows the user what workloads or product types reflected in the initiative. For instance, Cloud Security or External Attack Surface. For initiatives that are connected to specific workloads, ensure that the product is onboarded. The initiative alerts you to the data required by the initiative. Some initiatives, like the Microsoft Defender External Attack Surface Management (EASM), require their own onboarding process.

> ![NOTE]
> The ability to onboard initiatives is included in the paid version of Microsoft Security Exposure Management.

## Metrics and recommendations

1. Navigate from the initiative page to **Exposure Insights -> Initiatives-> Security metrics** to review the metrics associated with your initiative.
Adding or changing metrics might affect the score of your initiative. The metrics or score changes can't be controlled in advanced by customers. For more information, see [Investigate initiative metrics](security-metrics.md).

1. Select **Exposure Insights -> Initiatives-> Security recommendations** to view metrics and recommendations related to your initiative. You only see those recommendations that are *currently* applied to assets and active in Microsoft Secure Score or Microsoft Defender for Cloud.
1. Select a not compliant recommendation and then **Manage** to remediate the recommendation in the appropriate workload For more information, see [Recommendations](security-recommendations.md).

## Next steps

- [Improve security insights with exposure insights overview](exposure-insights-overview.md)
- [Review security metrics](security-metrics.md)
- [Explore security events](security-events.md)
- [Review security recommendations](security-recommendations.md)
- [!INCLUDE [support](../includes//support.md)]
