---
title: Azure Kubernetes Service (AKS) Security Dashboard
description: Explain the views and actions in the AKS security Dashboard to enable and protect an individual cluster with Defender for Containers.
ms.author: elkrieger
ms.topic: concept-article
ms.date: 03/23/2026
CustomerIntent: As the person responsible for the security of a cluster, I want know what views and actions the cluster security dashboard provides, so I can remediate security issues in the cluster.
---

# Azure Kubernetes Service (AKS) Security Dashboard

The AKS security dashboard gives visibility and automated remediation for security issues. It lets platform engineering teams secure their Kubernetes environment more easily and effectively.

Consolidating security and operational data within the AKS portal gives engineers a unified view of their Kubernetes environment. This view helps detect and fix security issues efficiently, with minimal workflow disruption. It lowers the risk of missed security issues and speeds up remediation.

The AKS Security Dashboard helps you:

- Review, investigate, and get guided remediation for runtime threat detection alerts, vulnerability assessment, security misconfigurations, and deviation from compliance standards.
- Enable the Defender for Containers plan and configure settings for the specific AKS cluster.
- Assign an owner and track progress on a security issue. This feature works when Defender Cloud Security Posture Management (Defender CSPM) is turned on for the subscription.

## Understand the dashboard sections

### Security findings for this cluster

The security findings bar shows the security status of the cluster. For each findings type, it shows the number of the highest severity or risk issues. Use the top findings to decide whether to check the different tabs for further investigation.

:::image type="content" source="media/cluster-security-dashboard/security-findings-summary-bar.png" alt-text="Screenshot of the security findings summary bar." lightbox="media/cluster-security-dashboard/security-findings-summary-bar.png":::

### Security alerts

Security alerts are notifications from Defender for Cloud about suspicious activity or active potential threats in your environment. The service prioritizes the alerts by risk.

When you select an alert, you open a panel that provides more information about the detection that triggered the alert. The panel also suggests actions you can take to resolve the issue.

#### Alerts severity

- **High** There's a high probability that your resource is compromised. You should investigate immediately. 

- **Medium** The alert probably indicates suspicious activity and might show that a resource is compromised. The confidence in the analytic or finding is medium. The confidence of the malicious intent is medium to high. These alerts might come from machine learning or anomaly based detections.

- **Low** This alert might be a false positive or a blocked attack.

- **Informational** An incident typically includes several alerts. Some alerts might appear on their own to be only informational, but in the context of the other alerts, they might warrant a closer look.

To investigate alerts, see [How to use the AKS Security Dashboard](how-to-use-azure-kubernetes-service-dashboard.md#investigate-an-alert).


### Vulnerability assessment

The AKS security dashboard shows software vulnerability scan results for running containers and the cluster's node pools. It generates a prioritized list of vulnerable components. A dynamic engine ranks this list by assessing the risks in your environment (available with Defender CSPM plan enabled) and considers the potential for exploitation.

The scanning of container images includes the following types of packages:

- **OS packages:** Scans for vulnerabilities in packages that the OS package manager installs in both Linux and Windows OS. See the [full list of the supported OS and their versions](/azure/defender-for-cloud/support-matrix-defender-for-containers).

- **Language-specific packages (Linux only):** Supports scanning for language-specific packages and files, along with their dependencies, that are installed or copied without using the OS package manager. See the [complete list of supported languages](/azure/defender-for-cloud/support-matrix-defender-for-containers).

For more details on how to use the vulnerability assessment findings, see [review vulnerability assessment findings](how-to-use-azure-kubernetes-service-dashboard.md#review-vulnerability-assessment-findings).

To review and remediate vulnerabilities, see [Review vulnerability findings](how-to-use-azure-kubernetes-service-dashboard.md#review-vulnerability-assessment-findings).


### Misconfigurations

Microsoft Defender for Cloud continuously monitors Azure and AKS APIs, along with Kubernetes workloads. It identifies configurations within the cluster or its running containers that could affect the cluster's security posture and expose the cluster to risk. Defender also offers guidelines and automatic fixes to address these issues.

To review and fix misconfigurations, see [Review misconfigurations](how-to-use-azure-kubernetes-service-dashboard.md#review-misconfiguration-assessment-findings).


### Compliance

Defender for Cloud continuously assesses your environment against selected regulatory standards and benchmarks. It provides a clear view of your compliance status, highlights unmet requirements, and offers recommendations to help you improve your cloud security posture.


To assess and remediate compliance issues, see [Assess compliance with regulatory standards](how-to-use-azure-kubernetes-service-dashboard.md#assess-compliance-with-regulatory-standards).


### Settings

#### Plan enablement

Enable Microsoft Defender for Cloud containers protection (Defender for Containers) for a single AKS cluster or at the subscription level to protect all clusters in that subscription. 

> [!NOTE]
>
> - When you enable Defender for Containers at the subscription level, you can only change plan settings at the subscription level.
>
> - By enabling other Microsoft Defender for Cloud plans, you can scan all your cloud assets to identify cross-resource attack paths, more accurately identify risk, and provide alerts and full visibility into cross-resource security incidents. [Learn more.](/azure/defender-for-cloud/defender-for-cloud-introduction)
>
> - If you configure settings at the subscription level, they override any settings configured at the cluster level.


#### Plan configurations

- **Defender Sensor** – Deploys the Defender for Containers agent on the cluster. This sensor is required for runtime threat protection and gated deployment capabilities.

- **Kubernetes API access** – Required for vulnerability assessment, misconfigurations, compliance assessment, and runtime threat protection.

- **Registry access** – Required for vulnerability assessment and gated deployment capabilities.

- **Azure policy** - Deploys an agent on the cluster to generate recommendations for hardening the cluster data plane.


## Next steps

- Learn how to use the [AKS Security Dashboard](how-to-use-azure-kubernetes-service-dashboard.md)

