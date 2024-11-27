---
title: SaaS security initiative
description: Learn how to use the "SaaS security initiative" in Microsoft XDR
ms.topic: how-to
ms.date: 10/31/2024
---
# SaaS Security Initiative 

> [!NOTE]
> Microsoft Security Exposure Management data and capabilities are currently unavailable in U.S Government clouds - GCC, GCC High and DoD.

The SaaS Security Initiative provides a centralized place for SaaS security best practices, enabling organizations to manage and prioritize security recommendations effectively. By focusing on the most impactful metrics, organizations can enhance their SaaS security posture efficiently.
![Screenshot of the SaaS security initiative home page.](<media\saas-securty-initiative\screenshot-of-the-saas-security-initiative-home-page.png>)


## What is the SaaS Security Initiative?

The SaaS Security Initiative serves as the main hub for SaaS Security Posture Management (SSPM), consolidating best-practice recommendations into 12 measurable metrics. These metrics facilitate the management and prioritization of a large number of security recommendations.

## Prerequisites

- Your organization must have Microsoft Defender for Cloud Apps licenses.
- The app which you wish to see security recommendations for, must be connected.
- For more information, see:

    - [Connect apps to get visibility and control with Microsoft Defender for Cloud Apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md)
    - [Learn which of the apps connectors provides security recommendations ](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md#user-app-governance-and-security-configuration-visibility)

## Operational Guidelines
To initiate the process, navigate to the **Exposure Management** blade and select **Initiatives**. Click on the **SaaS Security** initiative and then select **Open Initiative Page**.

On this page, you'll find 12 measurable metrics that categorize hundreds of best practice recommendations. 

It's recommended to prioritize metrics with the highest **Impact on Initiative Score**, which is a composite measure that considers both the **Weight** of each recommendation and the percentage of **Non-Compliant** recommendations. To effectively monitor progress, it's advisable to set a **target score** for your organization’s security posture. This target will serve as a benchmark for improvement and help track advancements over time.

For instance, to gain visibility into all best practice recommendations pertaining to privileged access within SaaS applications, select the metric labeled **Missing Best Practices to Secure Privileged Access in SaaS Apps**.

Once selected, you can click on any of the **Non-Compliant** recommendations to access the associated remediation steps.

## Additional Information

- Each metric includes a list of associated app connectors, encouraging organizations to enable more connectors for enhanced visibility. If you're interested in recommendations for specific applications, navigate to the **Security Recommendations** tab and filter by the relevant application.
- To learn more about Exposure Management initiatives visit [here](https://learn.microsoft.com/security-exposure-management/initiatives)


