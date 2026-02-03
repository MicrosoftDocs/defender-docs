---
title: Deploy Defender sensor and Azure Policy to clusters using Azure CLI
description: Learn how to deploy Microsoft Defender for Containers sensors and Azure Policy components to AKS, Amazon EKS, and Google Kubernetes Engine clusters by using Azure CLI.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 11/27/2025
---

# Deploy Defender sensor and policy to clusters using Azure CLI

This article explains how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to clusters by using Azure CLI after [enabling the Defender for Containers plan in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md).

For clusters that aren’t running in Azure Kubernetes Service (AKS), Defender for Cloud uses Azure Arc–enabled Kubernetes to deploy the required extensions.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

- [Defender for Containers enabled on your Azure subcription](defender-for-containers-enable-portal.md?tab=aks).

- Azure CLI version 2.40.0 or later. 

- Appropriate RBAC permissions (Contributor or Security Admin).

- AKS cluster supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

- [An OpenId Connect (OIDC) issuer](/azure/aks/use-oidc-issuer) enabled on your cluster.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Deploy the Defender sensor

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-deployment) before running these commands.

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

- [Defender for Containers enabled on your AWS connector](defender-for-containers-enable-portal.md?tab=eks). 

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your EKS cluster.

- The EKS cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

- [Review and, if needed, configure required AWS permissions and control plane access for Defender for Containers capabilities](defender-for-containers-aws-permissions.md).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For EKS clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-deployment) before running these commands.

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

### Verify that Defender and Azure Policy extensions are installed

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

Confirm that the following extensions are listed with `provisioningState` set to `Succeeded`:
- `microsoft.azuredefender.kubernetes`
- `azurepolicy`

### Verify that the Defender for Containers DaemonSet is deployed and running

```bash
kubectl get daemonsets -n kube-system
```

Confirm that a Defender for Containers DaemonSet is listed and that the **DESIRED**, **CURRENT**, and **READY** columns show matching values.

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

- [Defender for Containers enabled on your GCP connector](defender-for-containers-enable-portal.md?tab=gke). 

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your GKE cluster.

- The GKE cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For GKE clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-deployment) before running these commands.

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

### Verify that Defender and Azure Policy extensions are installed

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

Confirm that the following extensions are listed with `provisioningState` set to `Succeeded`:
- `microsoft.azuredefender.kubernetes`
- `azurepolicy`

### Verify that the Defender for Containers DaemonSet is deployed and running

```bash
kubectl get daemonsets -n kube-system
```

Confirm that a Defender for Containers DaemonSet is listed and that the **DESIRED**, **CURRENT**, and **READY** columns show matching values.

# [Arc-enabled Kubernetes](#tab/arc)

## Prerequisites

- [Defender for Containers enabled on your Azure subscription](defender-for-containers-enable-portal.md?tab=aks).

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your ARC cluster.

- The cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For Arc-enabled Kubernetes clusters, Defender components are deployed as Azure Arc Kubernetes extensions.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-deployment) before running these commands.

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

### Verify that the cluster is connected to Azure Arc

```azurecli
az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query connectivityStatus
```

The output should show `Connected`.

### Verify that Defender and Azure Policy extensions are installed

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

Confirm that the following extensions are listed with `provisioningState` set to `Succeeded`:
- `microsoft.azuredefender.kubernetes`
- `azurepolicy`

### Verify that the Defender sensor DaemonSet is running

```bash
kubectl get daemonsets -n kube-system
```

---

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)

- [Enable Defender for Containers](defender-for-containers-enable-portal.md)

- [Troubleshoot Defender for Containers on AWS (EKS)](defender-for-containers-aws-troubleshoot.md)

- [Disable Microsoft Defender for Containers](defender-for-containers-remove.md)

