---
title: Review workload protection in Microsoft Defender for Cloud
description: Review workload protection in the Workload protections dashboard in Microsoft Defender for Cloud
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
---

# Review workload protection

Microsoft Defender for Cloud helps you detect threats and protect your resources. Use the **Workload protections** dashboard to review this information.

:::image type="content" source="~/../reusable-content/ce-skilling/azure/media/defender-for-cloud/sample-defender-dashboard-numbered.png" alt-text="An example of Defender for Cloud's workload protections dashboard." lightbox="~/../reusable-content/ce-skilling/azure/media/defender-for-cloud/sample-defender-dashboard-numbered.png":::

<a name="defender-for-cloud-coverage"></a>
## Review Defender for Cloud coverage

In the **Defender for Cloud coverage** section of the dashboard, you can see the resources types in your subscription that are eligible for protection by Defender for Cloud. Where relevant, you can upgrade resources from this section as well. If you want to upgrade all possible eligible resources, select **Upgrade all**.

<a name="security-alerts"></a>
## Review security alerts

The **Security alerts** section shows alerts. When Defender for Cloud detects a threat in any area of your environment, it generates an alert. These alerts describe details of the affected resources, suggested remediation steps, and in some cases an option to trigger a logic app in response. Selecting anywhere in this graph opens the **Security alerts page**.

<a name="advanced-protection"></a>
## Review advanced workload protection features

Defender for Cloud offers advanced threat protection for virtual machines, SQL databases, containers, web applications, your network, and more. This section shows the status of resources in your selected subscriptions for each protection. Select any protection type to go to its configuration area.

<a name="insights"></a>
## Review workload protection insights

Insights provide you with news, suggested reading, and high priority alerts that are relevant in your environment.

<a name="prerequisite"></a>
## Prerequisites

The plan must be enabled at the subscription level to ensure proper functionality. Resources onboarded to Defender for Cloud at the resource level won’t be eligible for the capabilities available through the Workload protection blade.

## Next steps

Learn about [workloads you can protect in Defender for Cloud](defender-for-cloud-introduction.md)
