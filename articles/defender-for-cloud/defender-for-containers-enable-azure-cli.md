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

- Azure CLI version 2.40.0 or later. 

- Appropriate RBAC permissions (Contributor or Security Admin).

- AKS cluster supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

- [An OpenId Connect (OIDC) issuer](/azure/aks/use-oidc-issuer) enabled on your cluster.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

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
  --defender-config logAnalyticsWorkspaceResourceID=<workspace-resource-id>
```

Replace `<workspace-resource-id>` with the full Log Analytics workspace resource ID. 
For example, `/subscriptions/<subscription-id>/resourceGroups/<workspace-rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>`.

## Deploy the Azure Policy add-on

Enable Azure Policy for Kubernetes to assess and enforce configuration best practices:

```azurecli
az aks enable-addons \
  --addons azure-policy \
  --name <aks-cluster-name> \
  --resource-group <resource-group>
```

## Verify deployment

Use the following steps to verify that Defender for Containers components were deployed successfully.

### Verify that the Defender sensor is enabled on an AKS cluster

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query "securityProfile.defender.securityMonitoring.enabled"
```

The output should be `true`.

### Verify that Azure Policy add-on is enabled

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query addonProfiles.azurepolicy
```

The output should show `enabled: true`.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

- An AWS account with permissions to create and manage IAM roles and deploy CloudFormation stacks. Learn how to [connect your AWS account to Microsoft Defender for Cloud](quickstart-onboard-aws.md).

- Azure CLI version 2.40.0 or later.

- AWS CLI configured with appropriate credentials.

- `kubectl` configured for your EKS clusters.

- [EKS clusters connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Enable Defender for Containers -> move to prerquisite

Enable the Defender for Containers plan on your Azure subscription before continuing.

For information about enabling Defender plans by using Azure CLI, REST API, or Azure Policy, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md).

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

Replace `<workspace-resource-id>` with the full Log Analytics workspace resource ID. 
For example, `/subscriptions/<subscription-id>/resourceGroups/<workspace-rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>`.

## Deploy the Azure Policy extension

```azurecli
az k8s-extension create \
  --name azurepolicy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

## Verify deployment

Use the following steps to verify that Defender for Containers components were deployed successfully.

### Verify that the EKS cluster is connected to Azure Arc

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

The output should show `Connected`.

### Verify that the Defender for Containers DaemonSet is deployed and running

```bash
kubectl get daemonsets -n kube-system
```

Confirm that a Defender for Containers DaemonSet is listed and that the **DESIRED**, **CURRENT**, and **READY** columns show matching values.

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

- A GCP project connected to Microsoft Defender for Cloud. If you haven’t connected your project yet, see [Connect your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- Azure CLI version 2.40.0 or later.

- gcloud CLI configured with appropriate credentials.

- `kubectl` configured for your GKE clusters.

- GKE clusters must be connectable to Azure Arc.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

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
  --configuration-settings logAnalyticsWorkspaceResourceID=<workspace-resource-id>
```

Replace `<workspace-resource-id>` with the full Log Analytics workspace resource ID. 
For example, `/subscriptions/<subscription-id>/resourceGroups/<workspace-rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>`.

## Deploy the Azure Policy extension

```azurecli
az k8s-extension create \
  --name azurepolicy \
  --extension-type Microsoft.PolicyInsights \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

## Verify deployment

Use the following steps to verify that Defender for Containers components were deployed successfully.

### Verify that the GKE cluster is connected to Azure Arc

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

The output should show `Connected`.

### Verify that the Defender for Containers DaemonSet is deployed and running

```bash
kubectl get daemonsets -n kube-system
```

Confirm that a Defender for Containers DaemonSet is listed and that the **DESIRED**, **CURRENT**, and **READY** columns show matching values.

---

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)

- [Enable Defender for Containers using the Azure portal](defender-for-containers-enable-portal.md)

- [Troubleshoot Defender for Containers on AWS (EKS)](defender-for-containers-aws-troubleshoot.md)

- [Disable Microsoft Defender for Containers](defender-for-containers-remove.md)

