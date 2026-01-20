---
title: Enable Defender for Containers using Azure CLI by environment
description: Learn how to enable Microsoft Defender for Containers on AKS, Amazon EKS, and Google Kubernetes Engine clusters using Azure CLI.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 11/27/2025
---

# Enable Defender for Containers using Azure CLI by environment

This article explains how to enable and deploy Microsoft Defender for Containers components using Azure CLI for different Kubernetes environments. Defender for Containers is enabled and deployed differently depending on the Kubernetes platform. 

Use the tabs below to follow the enablement steps for your Kubernetes environment by using Azure CLI.

# [Azure Kubernetes Service (AKS)](#tab/aks)

### Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

- Azure CLI version 2.40.0 or later  
- Contributor or Security Admin permissions on the subscription  
- An existing AKS cluster  

### Enable the Defender for Containers plan

Enable the Containers plan on your subscription before deploying components. You can enable the plan through the Azure portal, REST API, or Azure Policy.

### Deploy the Defender sensor

When the Defender for Containers plan is enabled, the Defender sensor is deployed automatically by default.

To manually deploy the sensor to a specific AKS cluster:

```azurecli
az aks update \
  --resource-group <resource-group> \
  --name <aks-cluster-name> \
  --enable-defender
```

To deploy the sensor using a custom Log Analytics workspace:

```azurecli
az aks update \
  --resource-group <resource-group> \
  --name <aks-cluster-name> \
  --enable-defender \
  --defender-config logAnalyticsWorkspaceResourceId=<workspace-resource-id>
```

## Deploy the Azure Policy add-on

Enable Azure Policy for Kubernetes to assess and enforce configuration best practices:

```azurecli
az aks enable-addons \
  --addons azure-policy \
  --name <aks-cluster-name> \
  --resource-group <resource-group>
```

### Amazon Elastic Kubernetes Service (EKS)

Use Azure CLI to deploy Defender for Containers components on Amazon EKS clusters.

#### Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additionally, ensure you have:

- Azure CLI version 2.40.0 or later
- AWS CLI configured with appropriate credentials
- `kubectl` configured for your EKS clusters

#### Enable Defender for Containers

Enable the Defender for Containers plan on your Azure subscription before continuing.

#### Connect your AWS account

Connect your AWS account to Microsoft Defender for Cloud. See [Connect your AWS account](quickstart-onboard-aws.md).

#### Connect EKS clusters to Azure Arc

Connect each EKS cluster to Azure Arc. See [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

#### Deploy the Defender sensor

Deploy the Defender sensor extension on Arc-connected EKS clusters:

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --extension-type microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --configuration-settings logAnalyticsWorkspaceResourceID=<workspace-resource-id>
```

#### Deploy the Azure Policy extension

```azurecli
az k8s-extension create \
  --name azure-policy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

## Verify deployment using Azure CLI

Use the following steps to verify that Defender for Containers components were deployed successfully.

### AKS verification

Verify that the Defender sensor is enabled on an AKS cluster:

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query "securityProfile.defender"
```

Verify that Azure Policy is enabled:

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query addonProfiles.azurepolicy
```

### EKS verification

Verify that the EKS cluster is connected to Azure Arc:

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

Verify that the Defender sensor pods are running:

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

### GKE verification

Verify that the GKE cluster is connected to Azure Arc:

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

Verify that the Defender sensor pods are running:

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

## Next steps

