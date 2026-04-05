---
title: Azure Kubernetes Service (AKS) Security Dashboard
description: Explain the views and actions in the AKS security Dashboard to enable and protect an individual cluster with Defender for Containers.
ms.author: elkrieger
ms.topic: concept-article
ms.date: 03/23/2026
CustomerIntent: As the person responsible for the security of a cluster, I want know what views and actions the cluster security dashboard provides, so I can remediate security issues in the cluster.
---

# Azure Kubernetes Service (AKS) Security Dashboard

The AKS security dashboard shows security findings for an Azure Kubernetes Service (AKS) cluster in Microsoft Defender for Cloud.

It includes alerts, vulnerabilities, misconfigurations, and compliance results to help you identify and prioritize issues.

## Prerequisites

To use the AKS Security dashvoard, ensure you have:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) enabled with one of the following plans:
  - [Defender for Containers](tutorial-enable-containers-azure.md)
  - [Defender CSPM](tutorial-enable-cspm-plan.md)

## Security alerts

Security alerts indicate suspicious activity or potential threats detected in the cluster.

Alerts are prioritized by severity to help you identify which issues to investigate first:

- **High** High probability that the resource is compromised. Investigate immediately.
- **Medium** Indicates suspicious activity that might represent a compromise.
- **Low** Might indicate a benign or blocked activity.
- **Informational** Provides context and might be relevant when correlated with other alerts.

### Investigate a security alert

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for **Kubernetes Services**.

1. Go to **Clusters**.

1. Select the relevant AKS cluster.

5. In the **Security alerts** tab, select an alert.

1. Select **Microsoft Defender for Cloud**.

1. Review the alert details and recommended remediation steps.

1. Use related entities to identify affected resources.

1. Select **Open logs** to investigate activity within the relevant timeframe.

1. Update the alert status after remediation.

### Vulnerability assessment

The vulnerability assessment section shows vulnerabilities for running container images and Kubernetes node pools. 

Findings are prioritized by severity. When Defender CSPM is enabled, prioritization also considers contextual risk signals.

Each finding includes affected packages, associated CVEs, and the fixed version to remediate the issue.

Vulnerabilities can include:

- **OS packages** (Linux and Windows)  
- **Language-specific packages** (Linux)

Learn how to [review vulnerability findings](how-to-use-azure-kubernetes-service-dashboard.md#review-vulnerability-assessment-findings).

### Misconfigurations

Misconfigurations identify security configuration issues in Kubernetes resources, cluster settings, and running workloads.

Findings are based on Azure Policy and Kubernetes configuration assessments.

Each finding includes remediation guidance. Some findings support automated remediation through **Quick Fix** or policy enforcement.

Learn how to [review and remediate misconfigurations](how-to-use-azure-kubernetes-service-dashboard.md#review-and-remediate-misconfigurations).

### Compliance

The compliance section shows the cluster’s status against regulatory standards and benchmarks.

It lists controls that the cluster doesn't meet and provides recommendations to help you remediate them.

Learn how to [assess compliance](how-to-use-azure-kubernetes-service-dashboard.md#assess-compliance-with-regulatory-standards).

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

