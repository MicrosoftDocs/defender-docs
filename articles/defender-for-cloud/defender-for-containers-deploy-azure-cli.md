---
title: Deploy Defender sensor and Azure Policy to clusters using Azure CLI
description: Learn how to deploy Microsoft Defender for Containers sensors and Azure Policy components to AKS, Amazon EKS, and Google Kubernetes Engine clusters by using Azure CLI.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 11/27/2025
---

# Deploy Defender sensor and Azure Policy to clusters using Azure CLI

This article explains how to deploy the Microsoft Defender for Containers sensor and Azure Policy for Kubernetes to clusters by using Azure CLI after [enabling the Defender for Containers plan in Microsoft Defender for Cloud](defender-for-containers-enable-portal.md).

For clusters that aren’t running in Azure Kubernetes Service (AKS), Defender for Cloud uses Azure Arc-enabled Kubernetes to deploy the required extensions.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

- [Defender for Containers enabled on your Azure subscription](defender-for-containers-enable-portal.md?tab=aks).

- Azure CLI version 2.40.0 or later. 

- Appropriate RBAC permissions (Contributor or Security Admin).

- AKS cluster supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

- [An OpenId Connect (OIDC) issuer](/azure/aks/use-oidc-issuer) enabled on your cluster.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Deploy the Defender sensor

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running these commands.

> [!NOTE]
> If the cluster has the tag `ms_defender_container_exclude_sensors = true`, the Defender sensor won't be installed automatically. However, this tag doesn't prevent manual installation by using Azure CLI.

### Option 1: Deploy using Azure CLI

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

### Option 2: Deploy using Azure Resource Manager (ARM)

For teams using Infrastructure-as-Code (IaC) for AKS deployment, you can enable the Defender sensor by adding the `securityProfile` block to your ARM template.

```json
{
  "$schema": "[https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#](https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#)",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "clusterName": { "type": "string" },
    "location": { "type": "string" },
    "workspaceResourceId": { "type": "string" }
  },
  "resources": [
    {
      "type": "Microsoft.ContainerService/managedClusters",
      "apiVersion": "2023-01-01",
      "name": "[parameters('clusterName')]",
      "location": "[parameters('location')]",
      "properties": {
        "securityProfile": {
          "defender": {
            "logAnalyticsWorkspaceResourceId": "[parameters('workspaceResourceId')]",
            "securityMonitoring": { "enabled": true }
          }
        }
      }
    }
  ]
}

```

## Deploy the Azure Policy add-on

Enable Azure Policy for Kubernetes to assess and enforce configuration best practices:

```azurecli
az aks enable-addons \
  --addons azure-policy \
  --name <aks-cluster-name> \
  --resource-group <resource-group>
```

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

- [Defender for Containers enabled on your AWS connector](defender-for-containers-enable-portal.md?tab=eks). 

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your EKS cluster.

- The EKS cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For EKS clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running these commands.

> [!NOTE]
> If the cluster has the tag `ms_defender_container_exclude_sensors = true`, the Defender sensor won't be installed automatically. However, this tag doesn't prevent manual installation by using Azure CLI.

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

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

- [Defender for Containers enabled on your GCP connector](defender-for-containers-enable-portal.md?tab=gke). 

- Azure CLI version 2.40.0 or later.

- `kubectl` configured to access your GKE cluster.

- The GKE cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

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

## Deploy the Defender sensor

For GKE clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running these commands.

> [!NOTE]
> If the cluster has the tag `ms_defender_container_exclude_sensors = true`, the Defender sensor won't be installed automatically. However, this tag doesn't prevent manual installation by using Azure CLI.

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

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](defender-for-containers-verify-deployment.md) before running these commands.

> [!NOTE]
> If the cluster has the tag `ms_defender_container_exclude_sensors = true`, the Defender sensor won't be installed automatically. However, this tag doesn't prevent manual installation by using Azure CLI.

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

---

## Configure namespace exclusions (optional)

After deploying the Defender sensor as an Azure Arc Kubernetes extension, you can exclude specific namespaces from monitoring.

1. In the Azure portal, open the **Arc-enabled Kubernetes** cluster.

1. Select **Extensions**.

1. Select **Microsoft Defender for Containers**.

1. Select **Manage**.

1. Configure namespace exclusions as needed.

1. Select **Save**.

## Next steps

- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md).

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)

