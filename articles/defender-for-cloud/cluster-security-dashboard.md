---
title: Azure Kubernetes Service (AKS) Security Dashboard
description: Explain the views and actions in the AKS security Dashboard to enable and protect an individual cluster with Defender for Containers.
ms.author: dacurwin
ms.topic: conceptual
ms.date: 08/17/2025
CustomerIntent: As the person responsible for the security of a cluster, I want know what views and actions the cluster security dashboard provides, so I can remediate security issues in the cluster.
---

# Azure Kubernetes Service (AKS) Security Dashboard

The AKS security dashboard gives visibility and automated remediation for security issues. It lets platform engineering teams secure their Kubernetes environment more easily and effectively.

The AKS portal consolidates security and operational data into one place, giving engineers a unified view of their Kubernetes environment. This view helps detect and fix security issues efficiently, with minimal workflow disruption. It lowers the risk of missed security issues and speeds up remediation.

The AKS Security Dashboard lets you:

- Review, investigate, and get guided remediation for runtime threat detection alerts, vulnerability assessment, security misconfigurations, and deviation from compliance standards.

- Enable the Defender for Containers plan and configure settings for the specific AKS cluster.

- Assign an owner and track progress on a security issue. This feature works when Defender Cloud Security Posture Management (Defender CSPM) is turned on for the subscription.

## Prerequisites

The AKS Security Dashboard shows security issues for a cluster if at least one of the following plans is enabled:

- [Defender for Containers](tutorial-enable-containers-azure.md) on the subscription or the [individual cluster](#plan-enablement).
- [Defender CSPM](tutorial-enable-cspm-plan.md) on the subscription.

## Using the AKS Security Dashboard

Access the AKS Security Dashboard from an AKS cluster resource pane by selecting **Microsoft Defender for Cloud** in the menu list.

### Understand the dashboard sections

#### Security findings

The top findings bar shows the security status of the cluster. For each findings type, it shows the number of the highest severity or risk issues. Use the top findings to decide whether to check the different tabs for further investigation.

:::image type="content" source="media/cluster-security-dashboard/security-findings-summary-bar.png" alt-text="Screenshot of the security findings summary bar." lightbox="media/cluster-security-dashboard/security-findings-summary-bar.png":::

### Security alerts tab

Security alerts are notifications from Defender for Cloud about suspicious activity or potential threats in your environment. The service prioritizes the alerts by risk.

When you select an alert, you open a panel that provides more information about the detection that triggered the alert. The panel also suggests actions you can take to resolve the issue.

#### Alerts severity

- **High** There's a high probability that your resource is compromised. You should investigate immediately. Defender for Cloud has high confidence in both the malicious intent and the findings it uses to issue the alert.

- **Medium** The alert probably indicates suspicious activity and might show that a resource is compromised. The confidence in the analytic or finding is medium. The confidence of the malicious intent is medium to high. These alerts usually come from machine learning or anomaly based detections.

- **Low** This alert might be a benign positive or a blocked attack.

- **Informational** An incident typically includes several alerts. Some alerts might appear on their own to be only informational, but in the context of the other alerts, they might warrant a closer look.

#### Investigate an alert

1. Review the alert description and recommended steps for response in the alert right panel.

1. Use the additional details and related entities to identify the compromised workload.

1. Select **Open logs** to investigate the logs in the relevant timeframe.

1. Create a suppression rule to suppress future alerts with similar characteristics if the alert isn't relevant for your organization. [Learn more](/azure/defender-for-cloud/alerts-suppression-rules) about suppression rules.

1. Configure security rules for the cluster to control some of the alert types. [Learn more](/azure/defender-for-cloud/binary-drift-detection) on how to configure drift policies.

1. Change the alert status once you mitigate an alert for future reference or filtering. You need the security admin role to change the alert status.

> [!NOTE]
> Defender for Cloud also streams alerts directly to [Microsoft XDR](https://www.microsoft.com/security/business/solutions/extended-detection-response-xdr).

**[Learn more](/azure/defender-for-cloud/alerts-overview)** about security alerts in Defender for Cloud.

:::image type="content" source="media/cluster-security-dashboard/alerts-tab-security-findings.png" alt-text="Screenshot of the AKS Security Dashboard Alerts tab showing a list of security alerts with columns for severity, title, activity start time, last updated time, and status." lightbox="media/cluster-security-dashboard/alerts-tab-security-findings.png":::

### Vulnerability assessment tab

The AKS security dashboard shows software vulnerability scan results for running containers and the cluster's node pools. It generates a prioritized list of vulnerable components. This list is ranked by a dynamic engine that assesses the risks in your environment (available with Defender CSPM plan enabled) and considers the potential for exploitation.

The scanning of container images includes the following types of packages:

- **OS packages:** Scans for vulnerabilities in packages that the OS package manager installs in both Linux and Windows OS. See the [full list of the supported OS and their versions](/azure/defender-for-cloud/support-matrix-defender-for-containers).

- **Language-specific packages (Linux only):** Supports scanning for language-specific packages and files, along with their dependencies, that are installed or copied without using the OS package manager. See the [complete list of supported languages](/azure/defender-for-cloud/support-matrix-defender-for-containers).

#### Review vulnerability assessment findings

1. Select the vulnerable component in the vulnerabilities tab to open the details panel.

1. Use the general details to identify the relevant component and ownership for fix.

1. Review the list of CVEs, use the package name and the fixed version information to identify to which package version the package should be upgraded to remediate the issue.

1. Use the assigned owner (available with the Defender CSPM plan), to assign an owner for the fix, and notify them by e-mail or with a ticket in service now.

[Learn more](/azure/defender-for-cloud/agentless-vulnerability-assessment-azure?tabs=azure-new%2Cazure-old) about vulnerability assessment in Defender for Cloud.

:::image type="content" source="media/cluster-security-dashboard/vulnerabilities-assessment-tab.png" alt-text=" Screenshot of the Vulnerabilities tab showing vulnerable components list with severity levels, CVE counts, affected packages, and risk assessment scores." lightbox="media/cluster-security-dashboard/vulnerabilities-assessment-tab.png":::

### Misconfigurations tab

Microsoft Defender for Cloud continuously monitors Azure and AKS APIs, along with Kubernetes workloads. It identifies configurations within the cluster or its running containers that could affect the cluster's security posture and expose the cluster to risk. Defender also offers guidelines and automatic fixes to address these issues.

#### Review misconfiguration assessment findings

1. Select the misconfigured component in the misconfiguration tab to open the details panel.

1. Review the description and remediation steps.

1. For cluster level misconfigurations, use the **Quick Fix** button to start remediation flow.

1. For containers misconfigurations, it's recommended to deploy policy to prevent future faulty deployments. Use the link to a relevant built-in “Azure Policy” policy.

1. Use the assigned owner (available with the Defender CSPM plan), to assign an owner for the fix, and notify them by e-mail or with a ticket in service now.

[Learn more](/azure/defender-for-cloud/kubernetes-workload-protections) about how to remediate security misconfigurations with Defender for Cloud.

:::image type="content" source="media/cluster-security-dashboard/misconfigurations-assessment-tab.png" alt-text="Screenshot of the Misconfigurations tab displaying security configuration issues with severity indicators, affected resources, and remediation options including Quick Fix buttons." lightbox="media/cluster-security-dashboard/misconfigurations-assessment-tab.png":::

### Compliance tab

Defender for Cloud continuously assesses your environment against selected regulatory standards and benchmarks. It provides a clear view of your compliance status, highlights unmet requirements, and offers recommendations to help you improve your cloud security posture.

#### How to use the compliance tab

1. Configure the required compliance standard you need to adhere to. You configure the standard at the subscription level. Follow the link for configuration from the compliance tab or the dashboard settings.

1. Once you select the correct standards, use the compliance tab summary to understand which standard you comply with and which requires additional steps to comply with.

1. The compliance tab grid shows only recommendations for controls the cluster or its components aren't complying with.

1. Use the filters to filter the recommendations grid according to your needs.

1. Select each recommendation to open the details panel.

1. Follow the remediation steps in the side panel to comply with the relevant control.

[Learn more](/azure/defender-for-cloud/concept-regulatory-compliance-standards)about regulatory compliance in Defender for Cloud.

[Learn more about how to configure regulatory compliance standards](/azure/defender-for-cloud/update-regulatory-compliance-packages)

:::image type="content" source="media/cluster-security-dashboard/compliance-standards-tab.png" alt-text="Screenshot of the Compliance tab showing regulatory compliance assessment results with control requirements, compliance status, and filtering options for different standards and severity levels." lightbox="media/cluster-security-dashboard/compliance-standards-tab.png":::

### Bulk actions

You can select multiple recommendations or alerts by using the checkboxes beside each recommendation. Then, select **Assign owner** for recommendations or **Change Status** for alerts in the dashboard toolbar.

### Export security findings

Select **Download CSV report** to download the cluster security findings as a CSV file. You can also use the [Defender for Cloud REST API](/rest/api/defenderforcloud-composite/assessments) to retrieve security findings.

### Setting

#### Plan enablement

Enable Microsoft Defender for Cloud containers protection (Defender for Containers) for a single AKS cluster or at the subscription level to protect all clusters in that subscription. Use the settings panel from the dashboard toolbar to enable the plan.

> [!NOTE]
>
> - When you enable Defender for Containers at the subscription level, you can only change plan settings at the subscription level.
>
> - By enabling other Microsoft Defender for Cloud plans, you can scan all your cloud assets to identify cross-resource attack paths, more accurately identify risk, and provide alerts and full visibility into cross-resource security incidents. [Learn more.](/azure/defender-for-cloud/defender-for-cloud-introduction)

#### Plan configurations

- **Defender Sensor** – Deploys the Defender for Containers agent on the cluster. This sensor is required for runtime threat protection and gated deployment capabilities.

- **Kubernetes API access** – Required for vulnerability assessment, misconfigurations, compliance assessment, and runtime threat protection.

- **Registry access** – Required for vulnerability assessment and gated deployment capabilities.

- **Azure policy** - Deploys an agent on the cluster to generate recommendations for hardening the cluster data plane.

> [!NOTE]
> If you configure settings at the subscription level, they override any settings configured at the cluster level.

Set the Defender for Containers plan for the cluster or the subscription by using [REST API commands](/rest/api/defenderforcloud-composite/pricings/update).
