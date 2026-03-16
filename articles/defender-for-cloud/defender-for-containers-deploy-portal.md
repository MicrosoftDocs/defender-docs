---
title: Remediate Defender for Containers security recommendations
description: Learn how to remediate Microsoft Defender for Cloud recommendations related to Microsoft Defender for Containers on AKS, Amazon EKS, Google Kubernetes Engine, and Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/29/2026
---

# Remediate Defender for Containers security recommendations

This article explains how to remediate Microsoft Defender for Cloud security recommendations related to Microsoft Defender for Containers.

After you deploy and configure Defender for Containers, Microsoft Defender for Cloud evaluates your Kubernetes environments and generates recommendations when required components such as the Defender sensor or Azure Policy extension aren't installed or configured correctly.

Remediating these recommendations installs or enables the required components.

# [Azure Kubernetes Service (AKS)](#tab/aks)

For AKS clusters, remediating recommendations enables built-in AKS security capabilities, including the Defender profile and Azure Policy add-on.

## Prerequisites

- [Defender for Containers enabled on your Azure subcription](defender-for-containers-enable-portal.md?tab=aks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Remediate recommendations

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for AKS-related recommendations, such as:

   - **Azure Kubernetes Service clusters should have Defender profile enabled**
   - **Azure Policy for Kubernetes should be installed and enabled**

1. Select a recommendation.

1. Select the affected AKS clusters.

1. Follow the remediation steps to resolve the recommendation.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

For EKS clusters, Defender uses Azure Arc-enabled Kubernetes to deploy the Defender sensor and Azure Policy extensions.

## Prerequisites

- [Defender for Containers enabled on your AWS connector](defender-for-containers-enable-portal.md?tab=eks). 

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Remediate recommendations

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations such as:

   - **EKS clusters should have Microsoft Defender's extension for Azure Arc installed**
   - **Arc-enabled Kubernetes clusters should have Defender extension installed**

1. Select the recommendation.

1. Select the EKS clusters.

1. Follow the remediation steps to:
   - Connect clusters to Azure Arc (if not already connected)
   - Install the Defender extension
   - Install the Azure Policy extension (if applicable)

# [Google Kubernetes Engine (GKE)](#tab/gke)

For GKE clusters, Defender uses Azure Arc-enabled Kubernetes to deploy the Defender sensor and Azure Policy extensions.

## Prerequisites

- [Defender for Containers enabled on your GCP connector](defender-for-containers-enable-portal.md?tab=gke). 

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

### Private GKE clusters

Private GKE clusters must allow outbound HTTPS (TCP 443) access to Microsoft Defender for Cloud endpoints.

If required, configure firewall rules to allow egress from cluster nodes:

```bash
gcloud compute firewall-rules create allow-azure-defender \
    --allow tcp:443 \
    --source-ranges <cluster-cidr> \
    --target-tags <node-tags>
```

## Cluster-specific considerations

### Standard GKE clusters

No special configuration is required. Follow the default deployment steps.

### GKE Autopilot clusters

For Autopilot clusters:

- The Defender sensor automatically adjusts resource requests.
- No manual configuration is needed for resource limits.

> [!IMPORTANT]
> In GKE Autopilot clusters, resource requests and limits for the Defender sensor can't be manually configured. Resource management is controlled by GKE Autopilot and can't be overridden.

## Remediate recommendations

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations such as:

   - **GKE clusters should be connected to Azure Arc**
   - **Arc-enabled Kubernetes clusters should have Defender extension installed**

1. Select the recommendation.

1. Select the GKE clusters.

1. Follow the remediation steps to:
   - Connect clusters to Azure Arc (if required)
   - Install the Defender extension
   - Install the Azure Policy extension (if applicable)

# [Arc-enabled Kubernetes](#tab/arc)

For Kubernetes clusters connected to Azure using Azure Arc that aren’t running in Azure Kubernetes Service (AKS), Amazon EKS, or Google Kubernetes Engine (GKE), Defender for Cloud deploys components as Azure Arc Kubernetes extensions when you remediate security recommendations.

## Prerequisites

- [Defender for Containers enabled on your Azure subscription](defender-for-containers-enable-portal.md?tab=aks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Remediate recommendations

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations such as:

   - **Arc-enabled Kubernetes clusters should have Defender extension installed**
   - **Arc-enabled Kubernetes clusters should have Azure Policy extension installed**

1. Select the recommendation.

1. Select the affected clusters.

1. Follow the remediation steps to:
   - Install the **Microsoft Defender for Containers** extension  
   - Install the **Azure Policy for Kubernetes** extension (if applicable)

---

## Related content

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md).

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)

