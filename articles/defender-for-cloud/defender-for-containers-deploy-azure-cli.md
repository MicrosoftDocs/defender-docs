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

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-defender-for-containers-deployment) before running these commands.

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

- If you've enabled agentless threat protection, Kubernetes API access, or registry access, [configure the required external settings](defender-for-containers-configure-external-requirements.md?tab=eks).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Deploy the Defender sensor

For EKS clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-defender-for-containers-deployment) before running these commands.

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

## Deploy the Defender sensor

For GKE clusters, Defender components are deployed as Azure Arc Kubernetes extensions when you deploy them manually using Azure CLI.

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-defender-for-containers-deployment) before running these commands.

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

If automatic provisioning was enabled when you turned on the Defender for Containers plan, the Defender sensor might already be installed. [Verify the deployment](#verify-defender-for-containers-deployment) before running these commands.

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

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)

- [Enable Defender for Containers](defender-for-containers-enable-portal.md)

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)

- [Disable Microsoft Defender for Containers](defender-for-containers-remove.md)

