---
title: Deploy Defender sensor and Azure Policy to clusters using Azure CLI
description: Learn how to deploy Microsoft Defender for Containers sensors and Azure Policy components to AKS, Amazon EKS, and Google Kubernetes Engine clusters by using Azure CLI.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
---

# Deploy Defender sensor and Azure Policy to clusters using Azure CLI

This article explains how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to clusters by using Azure CLI after [enabling the Defender for Containers plan in Microsoft Defender for Cloud](defender-for-containers-enable-plan.md).

For clusters that aren’t running in Azure Kubernetes Service (AKS), Defender for Cloud uses Azure Arc-enabled Kubernetes to deploy the required extensions.

Before you begin, review the prerequisites for your cluster type, including enabling the Defender for Containers plan, installing Azure CLI 2.40.0 or later, and meeting any Azure Arc connectivity requirements.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

- [Defender for Containers enabled on your Azure subscription](defender-for-containers-enable-plan.md?tab=aks).

- Azure CLI version 2.40.0 or later. 

- Appropriate RBAC permissions (Contributor or Security Admin).

- AKS cluster supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

- [An OpenId Connect (OIDC) issuer](/azure/aks/use-oidc-issuer) enabled on your cluster.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Deploy the Defender sensor

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running this command.

1. Deploy the Defender sensor to a specific AKS cluster:

   ```azurecli
   az aks update \
     --resource-group <resource-group> \
     --name <aks-cluster-name> \
     --enable-defender
   ```

<a name="deploy-the-azure-policy-add-on"></a>

1. Enable Azure Policy for Kubernetes to assess and enforce configuration best practices:

   ```azurecli
   az aks enable-addons \
     --addons azure-policy \
     --name <aks-cluster-name> \
     --resource-group <resource-group>
   ```

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

- [Defender for Containers enabled on your AWS connector](defender-for-containers-enable-plan.md?tab=eks). 

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your EKS cluster.

- The EKS cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For EKS clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running these commands.

Run the following command to deploy the Defender sensor extension to your Arc-connected EKS cluster:

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --extension-type microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
```

## Deploy the Azure Policy extension

Install the Azure Policy extension to enable policy-based security recommendations and compliance assessments for your EKS cluster:

```azurecli
az k8s-extension create \
  --name azurepolicy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

- [Defender for Containers enabled on your GCP connector](defender-for-containers-enable-plan.md?tab=gke). 

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your GKE cluster.

- The GKE cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

### Private GKE clusters

Private GKE clusters must allow outbound HTTPS (TCP 443) access to Microsoft Defender for Cloud endpoints.

If your private cluster blocks outbound traffic, create a firewall rule to allow cluster nodes to reach Microsoft Defender for Cloud endpoints over TCP 443:

```bash
gcloud compute firewall-rules create allow-azure-defender \
    --allow tcp:443 \
    --source-ranges <cluster-cidr> \
    --target-tags <node-tags>
```

## Cluster-specific considerations

Review the following considerations based on your GKE cluster type before deploying the Defender sensor.

### Standard GKE clusters

No special configuration is required. Follow the deployment steps in the [Deploy the Defender sensor](#deploy-the-defender-sensor) and [Deploy the Azure Policy extension](#deploy-the-azure-policy-extension) sections.

### GKE Autopilot clusters

For Autopilot clusters:

- The Defender sensor automatically adjusts resource requests.
- No manual configuration is needed for resource limits.

> [!IMPORTANT]
> In GKE Autopilot clusters, resource requests and limits for the Defender sensor can't be manually configured. Resource management is controlled by GKE Autopilot and can't be overridden.

## Deploy the Defender sensor

For GKE clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running this command.

Run the following command to install the Defender sensor extension on your Arc-connected GKE cluster:

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --extension-type microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
```

## Deploy the Azure Policy extension

Install the Azure Policy extension on your Arc-connected GKE cluster to enable policy-based security recommendations and compliance assessments:

```azurecli
az k8s-extension create \
  --name azurepolicy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

# [Arc-enabled Kubernetes](#tab/arc)

## Prerequisites

- [Defender for Containers enabled on your Azure subscription](defender-for-containers-enable-plan.md?tab=aks).

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your Arc-enabled Kubernetes cluster.

- The cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For Arc-enabled Kubernetes clusters, Defender components are deployed as Azure Arc Kubernetes extensions.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running this command.

Run the following command to install the Defender sensor extension on your Arc-enabled Kubernetes cluster:

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --extension-type microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
```

## Deploy the Azure Policy extension

Install the Azure Policy extension on your Arc-enabled Kubernetes cluster to enable policy-based security recommendations and compliance assessments:

```azurecli
az k8s-extension create \
  --name azurepolicy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

---

## Next steps

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md).

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)

