---
title: Enable Defender for Containers using Azure CLI
description: Learn how to enable Microsoft Defender for Containers on AKS, Amazon EKS, and Google Kubernetes Engine clusters using Azure CLI.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 11/27/2025
---

# Enable Defender for Containers using Azure CLI

This article explains how to enable Microsoft Defender for Containers and deploy its components by using Azure CLI for different Kubernetes environments.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

Additionally, make sure you have:

- Azure CLI version 2.40.0 or later
- Appropriate RBAC permissions (Contributor or Security Admin)

## Enable the Defender for Containers plan

Enable the Defender for Containers plan on your subscription before continuing.

For information about enabling Defender plans by using Azure CLI, REST API, or Azure Policy, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md).

## Deploy the Defender sensor

When you enable the Defender for Containers plan, the Defender sensor is deployed on AKS clusters by default.

If automatic provisioning is disabled or you want to deploy the sensor on a specific cluster, run the following commands.

To deploy the Defender sensor to a specific AKS cluster:

```azurecli
az aks update \
  --resource-group <resource-group> \
  --name <aks-cluster-name> \
  --enable-defender
```

To deploy the Defender sensor using a custom Log Analytics workspace:

```azurecli
az aks update \
  --resource-group <resource-group> \
  --name <aks-cluster-name> \
  --enable-defender \
  --defender-config logAnalyticsWorkspaceResourceId=<workspace-resource-id>
```

## Deploy the Azure Policy extension

Enable Azure Policy for Kubernetes to assess and enforce configuration best practices:

```azurecli
az aks enable-addons \
  --addons azure-policy \
  --name <aks-cluster-name> \
  --resource-group <resource-group>
```

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additionally, make sure you have:

- Azure CLI version 2.40.0 or later
- AWS CLI configured with appropriate credentials
- `kubectl` configured for your EKS clusters

## Enable Defender for Containers

Enable the Defender for Containers plan on your Azure subscription before continuing.

For information about enabling Defender plans by using Azure CLI, REST API, or Azure Policy, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md).

## Connect your AWS account

Connect your AWS account to Microsoft Defender for Cloud. See [Connect your AWS account](quickstart-onboard-aws.md).

## Connect EKS clusters to Azure Arc

Connect each EKS cluster to Azure Arc. For instructions, see [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Deploy the Defender sensor

After connecting your AWS account and EKS clusters to Azure Arc, deploy the Defender sensor extension.

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --extension-type microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --configuration-settings logAnalyticsWorkspaceResourceID=<workspace-resource-id>
```
## Deploy the Azure Policy extension

```azurecli
az k8s-extension create \
  --name azure-policy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additionally, ensure you have:

- Azure CLI version 2.40.0 or later
- gcloud CLI configured with appropriate credentials
- `kubectl` configured for your GKE clusters

## Enable Defender for Containers

Enable the Defender for Containers plan on your Azure subscription before continuing.

For information about enabling Defender plans by using Azure CLI, REST API, or Azure Policy, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md).

## Connect your GCP project

[Connect your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

## Connect GKE clusters to Azure Arc

Connect each GKE cluster to Azure Arc before deploying Defender components.

For instructions, see [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Deploy the Defender sensor

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --extension-type microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --configuration-settings \
    logAnalyticsWorkspaceResourceID="/subscriptions/<subscription-id>/resourceGroups/<workspace-rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
```

## Deploy the Azure Policy extension

```azurecli
az k8s-extension create \
  --name azure-policy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

---

## Verify deployment using Azure CLI

Use the following steps to verify that Defender for Containers components were deployed successfully.

# [Azure Kubernetes Service (AKS)](#tab/aks)

Verify that the Defender sensor is enabled on an AKS cluster:

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query "securityProfile.defender"
```

The output should show that `securityMonitoring.enabled` is set to `true`.

Verify that Azure Policy add-on is enabled:

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query addonProfiles.azurepolicy
```

The output should show `enabled: true`.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

Verify that the EKS cluster is connected to Azure Arc:

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

The output should show `Connected`.

Verify that the Defender for Containers DaemonSet is deployed and running:

```bash
kubectl get daemonsets -n kube-system
```

Confirm that a Defender for Containers DaemonSet is listed and that the **DESIRED**, **CURRENT**, and **READY** columns show matching values.

# [Google Kubernetes Engine (GKE)](#tab/gke)

Verify that the GKE cluster is connected to Azure Arc:

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

The output should show `Connected`.

Verify that the Defender for Containers DaemonSet is deployed and running:

```bash
kubectl get daemonsets -n kube-system
```

Confirm that a Defender for Containers DaemonSet is listed and that the **DESIRED**, **CURRENT**, and **READY** columns show matching values.

---

## Next steps

