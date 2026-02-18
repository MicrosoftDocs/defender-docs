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

## Verify deployment

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Confirm the recommendation status changes to **Healthy**.

1. In the AKS cluster resource, verify:
   - Defender profile is enabled
   - Azure Policy add-on is installed

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

## Manage the Defender extension from the Arc-enabled Kubernetes resource (optional)

You can also inspect and manage the Defender for Containers extension directly from the Azure Arc-enabled Kubernetes resource:

1. In the Azure portal, open **Azure Arc**.

1. Select **Kubernetes clusters**, then select your cluster.

1. Select **Extensions**.

1. Verify that **Microsoft Defender for Containers** shows **Succeeded**.

1. Select the extension to view its status and configuration.

### Configure namespace exclusions (optional)

To exclude specific namespaces from Defender sensor monitoring:

1. In the Azure portal, open the Arc-enabled Kubernetes cluster.

1. Select **Extensions**.

1. Select **Microsoft Defender for Containers**.

1. Select **Manage**.

1. Configure namespace exclusions as needed.

1. Select **Save**.

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

## Manage the Defender extension from the Arc-enabled Kubernetes resource (optional)

You can also inspect and manage the Defender for Containers extension directly from the Azure Arc-enabled Kubernetes resource:

1. In the Azure portal, open **Azure Arc**.

1. Select **Kubernetes clusters**, then select your cluster.

1. Select **Extensions**.

1. Verify that **Microsoft Defender for Containers** shows **Succeeded**.

1. Select the extension to view its status and configuration.

### Configure namespace exclusions (optional)

To exclude specific namespaces from Defender sensor monitoring:

1. In the Azure portal, open the Arc-enabled Kubernetes cluster.

1. Select **Extensions**.

1. Select **Microsoft Defender for Containers**.

1. Select **Manage**.

1. Configure namespace exclusions as needed.

1. Select **Save**.

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

### Manage the Defender extension from the Arc-enabled Kubernetes resource (optional)

You can also inspect and manage the Defender for Containers extension directly from the Azure Arc-enabled Kubernetes resource:

1. In the Azure portal, open **Azure Arc**.

1. Select **Kubernetes clusters**, then select your cluster.

1. Select **Extensions**.

1. Verify that **Microsoft Defender for Containers** shows **Succeeded**.

1. Select the extension to view its status and configuration.

### Configure namespace exclusions (optional)

To exclude specific namespaces from Defender sensor monitoring:

1. In the Azure portal, open the Arc-enabled Kubernetes cluster.

1. Select **Extensions**.

1. Select **Microsoft Defender for Containers**.

1. Select **Manage**.

1. Configure namespace exclusions as needed.

1. Select **Save**.

---

## Verify Defender for Containers deployment

After remediating the recommendation, verify that Defender components are running correctly.

### Verify recommendation health

1. In the Azure portal, go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Confirm that the relevant recommendation status changes to **Healthy**.

### Verify extension installation (Arc-enabled clusters)

For EKS, GKE, and Arc-enabled Kubernetes clusters:

1. Open the Arc-enabled Kubernetes resource in Azure.

1. Select **Extensions**.

1. Confirm that:

   - **Microsoft Defender for Containers** shows **Succeeded**.

   - **Azure Policy for Kubernetes** shows **Succeeded** (if enabled).

### Verify Defender sensor pods

1. Run the following command:

   ```bash
   kubectl get pods -n kube-system -l app=microsoft-defender
   ```
1. Confirm that the Defender sensor pods are in a `Running` state.

1. (Optional) Verify the DaemonSet:

   ```bash
   kubectl get ds microsoft-defender-collector-ds -n kube-system
   ```

Confirm that the **DESIRED**, **CURRENT**, and **READY** values match the number of cluster nodes.

## Related content

- [Enable Defender for Containers in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md)

- [Enable Defender for Containers using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)
