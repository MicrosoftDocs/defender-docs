---
title: Deploy Defender sensor and Azure Policy to clusters using security recommendations
description: Learn how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to AKS, Amazon EKS, and Google Kubernetes Engine clusters by using Microsoft Defender for Cloud security recommendations.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/29/2026
---

# Deploy Defender sensor and Azure Policy to clusters using security recommendations

This article explains how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to clusters by remediating security recommendations after you [enable the Defender for Containers plan in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md).

For clusters that aren’t running in Azure Kubernetes Service (AKS), Defender for Cloud uses Azure Arc-enabled Kubernetes to deploy the required extensions.

## Exclude the Defender sensor from automatic provisioning

[!INCLUDE[Exclude the Defender sensor](includes/defender-for-containers-exclude-sensor.md)]

# [Azure Kubernetes Service (AKS)](#tab/aks)

For AKS clusters, recommendations activate built-in AKS security capabilities, including the Defender profile and Azure Policy add-on.

## Prerequisites

- [Defender for Containers enabled on your Azure subcription](defender-for-containers-enable-portal.md?tab=aks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Deploy components

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for AKS-related recommendations, such as:

   - **Azure Kubernetes Service clusters should have Defender profile enabled**
   - **Azure Policy for Kubernetes should be installed and enabled**

1. Select a recommendation.

1. Select the affected AKS clusters.

1. Follow the remediation steps to apply the fix.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

For EKS clusters, Defender uses Azure Arc-enabled Kubernetes to deploy the Defender sensor and Azure Policy extensions.

## Prerequisites

- [Defender for Containers enabled on your AWS connector](defender-for-containers-enable-portal.md?tab=eks). 

- If you've enabled agentless threat protection, Kubernetes API access, or registry access, [configure the required external settings](defender-for-containers-configure-external-requirements.md?tab=eks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy components

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

- If you've enabled agentless threat protection or registry access, [configure the required external settings](defender-for-containers-configure-external-requirements.md?tab=gke).

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

## Deploy components

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

## Deploy components

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

## Next steps

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md).

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)

