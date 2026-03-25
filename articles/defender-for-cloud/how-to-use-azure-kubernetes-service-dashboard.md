---
title: How to use the AKS Security Dashboard
description: Learn how to use the AKS Security Dashboard in Microsoft Defender for Cloud to review and remediate security issues in your Azure Kubernetes Service clusters.
ms.topic: how-to
ms.date: 03/23/2026
CustomerIntent: As the person responsible for the security of a cluster, I want know what views and actions the cluster security dashboard provides, so I can remediate security issues in the cluster.
---


# How to use the AKS Security Dashboard

This article explains how to use the AKS security dashboard to review and remediate security issues in an individual cluster.

## Prerequisites

The AKS Security Dashboard shows security problems for a cluster if at least one of the following plans is enabled:

- [Defender for Containers](tutorial-enable-containers-azure.md)
- [Individual cluster](cluster-security-dashboard.md#plan-enablement) 
- [Defender CSPM](tutorial-enable-cspm-plan.md) 


## Access the AKS security dashboard

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Search for **Kubernetes Services**
1. Select **Clusters** > **relevant cluster**.
1. Select **Microsoft Defender for Cloud**.


:::image type="content" source="media/cluster-security-dashboard/kubernetes-center-cluster.png" alt-text="Screenshot that shows where to find the clusters page in the Azure portal." lightbox="media/cluster-security-dashboard/kubernetes-center-cluster.png":::


#### Investigate an alert

1. Review the alert description and recommended steps for response.

1. Use the additional details and related entities to identify the compromised workload.

1. Select **Open logs** to investigate the logs in the relevant timeframe.

1. Create a suppression rule to suppress future alerts with similar characteristics if the alert isn't relevant for your organization. [Learn more](/azure/defender-for-cloud/alerts-suppression-rules) about suppression rules.

1. Configure security rules for the cluster to control some of the alert types. [Learn more](/azure/defender-for-cloud/binary-drift-detection) on how to configure drift policies.

1. Change the alert status once you mitigate an alert for future reference or filtering. You need the security admin role to change the alert status.

> [!NOTE]
> Defender for Cloud also streams alerts directly to [Microsoft XDR](https://www.microsoft.com/security/business/solutions/extended-detection-response-xdr).

**[Learn more](/azure/defender-for-cloud/alerts-overview)** about security alerts in Defender for Cloud.

:::image type="content" source="media/cluster-security-dashboard/alerts-tab-security-findings.png" alt-text="Screenshot of the AKS Security Dashboard Alerts tab showing a list of security alerts with columns for severity, title, activity start time, last updated time, and status." lightbox="media/cluster-security-dashboard/alerts-tab-security-findings.png":::


### Review vulnerability assessment findings

1. Select the vulnerable component in the vulnerabilities tab to open the details panel.

1. Use the general details to identify the relevant component and ownership for fix.

1. Review the list of CVEs, use the package name and the fixed version information to identify to which package version the package should be upgraded to remediate the issue.

1. Use the assigned owner (available with the Defender CSPM plan) to assign an owner for the fix, and notify them by email or with a ticket in service now.

[Learn more](/azure/defender-for-cloud/agentless-vulnerability-assessment-azure?tabs=azure-new%2Cazure-old) about vulnerability assessment in Defender for Cloud.

:::image type="content" source="media/cluster-security-dashboard/vulnerabilities-assessment-tab.png" alt-text=" Screenshot of the Vulnerabilities tab showing vulnerable components list with severity levels, CVE counts, affected packages, and risk assessment scores." lightbox="media/cluster-security-dashboard/vulnerabilities-assessment-tab.png":::

### Review misconfiguration assessment findings

1. Select the misconfigured component in the **Misconfigurations** tab to open the details panel.

1. Review the description and remediation steps.

1. For cluster level misconfigurations, use the **Quick Fix** button to start remediation flow.

1. For container misconfigurations, it's recommended to deploy a policy to prevent future faulty deployments. Use the link to a relevant built-in **Azure Policy** policy.

1. Use the assigned owner (available with the Defender CSPM plan) to assign an owner for the fix, and notify them by email or with a ticket in service now.

Learn how to [remediate security misconfigurations with Defender for Cloud](/azure/defender-for-cloud/kubernetes-workload-protections). 

:::image type="content" source="media/cluster-security-dashboard/misconfigurations-assessment-tab.png" alt-text="Screenshot of the Misconfigurations tab displaying security configuration issues." lightbox="media/cluster-security-dashboard/misconfigurations-assessment-tab.png":::

### Assess compliance with regulatory standards

1. Configure the required compliance standard you need to adhere to. You configure the standard at the subscription level. Follow the link for configuration from the compliance tab or the dashboard settings.

1. Once you select the relevant standards, use the compliance tab summary to understand which standard you comply with and which requires additional steps.

1. The compliance tab grid shows only recommendations for controls the cluster or its components aren't complying with.

1. Use the filters to filter the recommendations grid according to your needs.

1. Select each recommendation to open the details panel.

1. Follow the remediation steps in the side panel to comply with the relevant control.

Learn more about [regulatory compliance in Defender for Cloud](/azure/defender-for-cloud/concept-regulatory-compliance-standards).

Learn how to [configure regulatory compliance standards](/azure/defender-for-cloud/update-regulatory-compliance-packages).

:::image type="content" source="media/cluster-security-dashboard/compliance-standards-tab.png" alt-text="Screenshot of the Compliance tab showing regulatory compliance assessment results." lightbox="media/cluster-security-dashboard/compliance-standards-tab.png":::


### Perform bulk actions

1. Select **Assign owner** for recommendations or **Change Status** for alerts in the dashboard toolbar.

### Export security findings

Select **Download CSV report** to download the cluster security findings as a CSV file. You can also use the [Defender for Cloud REST API](/rest/api/defenderforcloud-composite/assessments) to retrieve security findings.

## Enable Defender for Containers

To set the Defender for Containers plan for the cluster or the subscription use the [REST API commands](/rest/api/defenderforcloud-composite/pricings/update).