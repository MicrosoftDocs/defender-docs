---
title: Review security findings in the AKS security dashboard
description: Learn how to review and investigate alerts, vulnerabilities, misconfigurations, and compliance findings in the AKS security dashboard in Microsoft Defender for Cloud.
ms.author: elkrieger
ms.topic: how-to
ms.date: 04/05/2026
ms.service: defender-for-cloud
---

# Review security findings in the AKS security dashboard

The AKS security dashboard shows security findings for an Azure Kubernetes Service (AKS) cluster in Microsoft Defender for Cloud.

It includes alerts, vulnerabilities, misconfigurations, and compliance results to help you identify and prioritize issues.

## Prerequisites

To use the AKS Security dashboard, ensure you have:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) enabled with one of the following plans:
  - [Defender for Containers](tutorial-enable-containers-azure.md)
  - [Defender CSPM](tutorial-enable-cspm-plan.md)

## Review security findings

## Security alerts

Security alerts indicate suspicious activity or potential threats detected in the cluster.

Alerts are prioritized by severity to help you identify which issues to investigate first:

- **High** High probability that the resource is compromised. Investigate immediately.
- **Medium** Indicates suspicious activity that might represent a compromise.
- **Low** Might indicate a benign or blocked activity.
- **Informational** Provides context and might be relevant when correlated with other alerts.

### Investigate a security alert

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Kubernetes services** > **Clusters**.

1. Select the relevant AKS cluster.

1. Select **Microsoft Defender for Cloud**.

1. In the **Security alerts** tab, select an alert to open the details pane.

In the details pane:

- Review the alert details and recommended remediation steps.
- Use related entities to identify affected resources.
- Select **Open logs** to investigate activity within the relevant timeframe.
- Create a suppression rule if the alert isn't relevant for your organization.
- Configure security rules for supported alert types.

After you mitigate the issue, update the alert status.

:::image type="content" source="media/cluster-security-dashboard/alerts-tab-security-findings.png" alt-text="Screenshot of the Security alerts tab showing alert details." lightbox="media/cluster-security-dashboard/alerts-tab-security-findings.png":::

## Vulnerability assessment

The vulnerability assessment section shows vulnerabilities for running container images and Kubernetes node pools. 

Findings are prioritized by severity. When Defender CSPM is enabled, prioritization also considers contextual risk signals.

Each finding includes affected packages, associated CVEs, and the fixed version to remediate the issue.

Vulnerabilities can include:

- **OS packages** (Linux and Windows)  
- **Language-specific packages** (Linux)

For supported configurations, see the [support matrix for Defender for Containers](/azure/defender-for-cloud/support-matrix-defender-for-containers).

### Review vulnerability findings

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Kubernetes services** > **Clusters**.

1. Select the relevant AKS cluster.

1. Select **Microsoft Defender for Cloud**.

1. In the **Vulnerabilities** tab, select a component to open the details pane.

In the details pane:

- Review affected packages and associated CVEs.
- Identify the fixed version for the vulnerable package.
- Update the container image or dependency to remediate the issue.

If expected vulnerabilities don't appear, verify that the image, package type, and environment are supported. See the [support matrix for Defender for Containers](/azure/defender-for-cloud/support-matrix-defender-for-containers).

:::image type="content" source="media/cluster-security-dashboard/vulnerabilities-assessment-tab.png" alt-text="Screenshot of the Vulnerabilities tab showing vulnerable components and severity." lightbox="media/cluster-security-dashboard/vulnerabilities-assessment-tab.png":::

## Misconfigurations

Misconfigurations identify security configuration issues in Kubernetes resources, cluster settings, and running workloads.

Findings are based on Azure Policy and Kubernetes configuration assessments.

Each finding includes remediation guidance. Some findings support automated remediation through **Quick Fix** or policy enforcement.

### Review and remediate misconfigurations

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Kubernetes services** > **Clusters**.

1. Select the relevant AKS cluster.

1. Select **Microsoft Defender for Cloud**.

1. In the **Misconfigurations** tab, select a finding to open the details pane.

In the details pane:

- Review the description and remediation steps.
- For cluster-level misconfigurations, select **Quick Fix** when available.
- For workload issues, apply the recommended Azure Policy to prevent recurrence.
- Assign an owner to track remediation (requires Defender CSPM).

:::image type="content" source="media/cluster-security-dashboard/misconfigurations-assessment-tab.png" alt-text="Screenshot of the Misconfigurations tab displaying security configuration issues." lightbox="media/cluster-security-dashboard/misconfigurations-assessment-tab.png":::

## Compliance

The compliance section shows the cluster’s status against regulatory standards and benchmarks.

It lists controls that the cluster doesn't meet and provides recommendations to help you remediate them.

### Assess compliance

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Kubernetes services** > **Clusters**.

1. Select the relevant AKS cluster.

1. Select **Microsoft Defender for Cloud**.

1. In the **Compliance** tab, review failing controls.

1. Select a control to open the details pane.

In the details pane:

- Review the recommendation and remediation steps.
- Apply the required changes to meet the control.

:::image type="content" source="media/cluster-security-dashboard/compliance-standards-tab.png" alt-text="Screenshot of the Compliance tab showing regulatory compliance assessment results." lightbox="media/cluster-security-dashboard/compliance-standards-tab.png":::