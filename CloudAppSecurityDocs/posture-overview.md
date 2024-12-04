---
title: SaaS Security Posture Management (SSPM) - Overview 
description: Learn about SaaS security posture management (SSPM) in Microsoft Defender for Cloud Apps.
ms.topic: how-to
ms.date: 11/17/2024
---

# SaaS security posture management (SSPM) overview 

One of the pillars of Microsoft Defender for Cloud Apps is SaaS security posture management (SSPM). SSPM offers detailed visibility into the security state of your software as a service (SaaS) applications. It also provides actionable guidance to help you strengthen your security posture efficiently.

Defender for Cloud Apps provides security configuration assessments to help you identify and mitigate potential risks in your SaaS application environments. These recommendations appear in [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management) after you have a connector to an application.

However, Microsoft Security Exposure Management data and capabilities are currently unavailable in US government clouds: GCC, GCC High, and DoD. For these environments, we recommend consuming SaaS security posture recommendations via [Microsoft Secure Score](/microsoft-365/security/defender-endpoint/tvm-security-recommendation). The following example shows Secure Score recommendations for a Salesforce app.

:::image type="content" source="media/security-saas-sspm-in-secure-score-salesforce-filter.png" alt-text="Screenshot of Salesforce recommendations in Secure Score." lightbox="media/security-saas-sspm-in-secure-score-salesforce-filter.png" :::

## Prerequisites

- Your organization must have Microsoft Defender for Cloud Apps licenses.
- Your app must be connected to Defender for Cloud Apps. For information about connecting and about which of the app connectors provide security recommendations, see [Connect apps to get visibility and control with Microsoft Defender for Cloud Apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

## Turn on SaaS security recommendations

To ensure that your application connector is set to show data in Microsoft Security Exposure Management, follow these steps:

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps** > **Connected apps** > **App Connectors**.

1. Use the filter to locate the application where you want to turn on security recommendations.

1. Open the instance drawer and note whether **Security recommendations** is turned on or off. The following example shows that **Security recommendations** is turned on.

   :::image type="content" source="media/posture-overview/screenshot-of-an-instance-where-secure-score-recommendations-are-turned-on.png" alt-text="Screenshot of an app instance where Secure Score recommendations are turned on." lightbox="media/posture-overview/screenshot-of-an-instance-where-secure-score-recommendations-are-turned-on.png":::

   If the instance is currently set to **Off**, select the ellipsis that denotes the options menu (**...**), and then select **Turn on Security recommendations**.

   :::image type="content" source="media/posture-overview/screenshot-of-the-turn-on-secure-score-or-exposure-management-recommendations-option.png" alt-text="Screenshot that shows the command for turning on security recommendations." lightbox="media/posture-overview/screenshot-of-the-turn-on-secure-score-or-exposure-management-recommendations-option.png":::

   > [!NOTE]
   > If you have multiple instances of the same app, you can send security recommendations for each instance separately. Security recommendations for the selected instance are added to Microsoft Security Exposure Management in addition to the current recommendations.

Security recommendations appear automatically in Microsoft Security Exposure Management. Recommendations are based on Microsoft benchmarks, and they might take up to 24 hours to update.

In [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score), filter the **Recommended actions** tab by product to view any recommended actions. If you have multiple instances of an app, you can choose to filter recommendations from specific instances only. The following example shows options for filtering specific instances.

:::image type="content" source="media/secure-score-filter.png" alt-text="Screenshot of a Secure Score filter that shows multiple instances of an app." lightbox="media/secure-score-filter.png":::

Select a recommendation, and then select the **Implementation** tab on the details pane for a step-by-step remediation guide.

For more information, see [Assess your security posture with Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score-improvement-actions).

## Manage your organization's SaaS security posture

To effectively manage your organization's SaaS security posture, we recommend beginning with the [SaaS Security Initiative](/defender-cloud-apps/saas-security-initiative). This initiative consolidates best practices and measurable metrics specifically for securing SaaS applications, so that you can prioritize and address the most impactful recommendations for SaaS environments. The following example shows security metrics from the SaaS Security Initiative.

:::image type="content" source="media/posture-overview/screenshot-of-the-saas-security-initiative-home-page.png" alt-text="Screenshot of metrics from the SaaS Security Initiative." lightbox="media/posture-overview/screenshot-of-the-saas-security-initiative-home-page.png":::

You can also find a variety of SSPM recommendations under other initiatives:

- CIS Microsoft 365 Foundations Benchmark
- Ransomware Protection
- Identity Security
- Business Email Compromise (financial fraud)
- Zero Trust (foundational)

## Next step

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
