---
title: Deploy Defender for Containers on Arc-enabled Kubernetes programmatically
description: Learn how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters using CLI, API, or Infrastructure as Code.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Arc-enabled Kubernetes programmatically

This article describes how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters using programmatic methods.

> [!TIP]
> For Azure portal deployment instructions, see [Deploy Defender for Containers on Arc-enabled Kubernetes using Azure portal](defender-for-containers-arc-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additionally:
- Azure CLI with the k8s-extension extension
- kubectl configured to access your cluster
- Helm 3.0 or later (for Helm deployment)

## Connect your cluster to Azure Arc

First, ensure your Kubernetes cluster is connected to Azure Arc:

```bash
# Register Azure Arc providers
az provider register --namespace Microsoft.Kubernetes
az provider register --namespace Microsoft.KubernetesConfiguration
az provider register --namespace Microsoft.ExtendedLocation

# Connect cluster to Azure Arc
az connectedk8s connect \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --location <location>
```

## Enable Defender for Containers

### Using Azure CLI

```azurecli
# Enable Defender for Containers on subscription
az security pricing create \
    --name Containers \
    --tier Standard

# Enable Arc auto-provisioning
az security auto-provisioning-setting update \
    --name ArcK8s \
    --auto-provision On
```

### Using REST API

```bash
# Enable via REST API
curl -X PUT \
  "https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/pricings/Containers?api-version=2024-01-01" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "properties": {
      "pricingTier": "Standard"
    }
  }'
```

## Deploy the Defender extension

### Using Azure CLI

```azurecli
# Deploy Defender extension
az k8s-extension create \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --extension-type microsoft.azuredefender.kubernetes \
    --configuration-settings \
        logAnalyticsWorkspaceResourceID="/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>" \
        auditLogPath="/var/log/kube-apiserver/audit.log"
```

### Using Helm

```bash
# Add Azure Arc Helm repository
helm repo add azure-arc https://azurearck8s.azurecr.io/helm/v1/repo
helm repo update

# Create namespace
kubectl create namespace mdc

# Install Defender extension
helm install azure-defender azure-arc/azure-defender \
    --namespace mdc \
    --set systemDefaultRegistry=<registry-url> \
    --set global.credentials.workspaceId=<workspace-id> \
    --set global.credentials.workspaceKey=<workspace-key> \
    --set global.clusterName=<cluster-name>
```

### Using GitOps

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1beta2
kind: Kustomization
metadata:
  name: defender-extension
  namespace: flux-system
spec:
  interval: 10m
  path: "./clusters/production"
  prune: true
  sourceRef:
    kind: GitRepository
    name: flux-system
  postBuild:
    substitute:
      cluster_name: "${CLUSTER_NAME}"
      workspace_id: "${WORKSPACE_ID}"
```

## Configure registry authentication (on-premises)

For clusters with private registries:

```bash
# Create secret for registry authentication
kubectl create secret docker-registry regcred \
    --namespace mdc \
    --docker-server=<registry-url> \
    --docker-username=<username> \
    --docker-password=<password>

# Update extension with registry credentials
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --configuration-settings \
        registryCredentialSecret="regcred"
```

## Deploy to air-gapped environments

For disconnected clusters:

```bash
# Export images to local registry
docker pull mcr.microsoft.com/azuredefender/stable/microsoft-defender-collector:latest
docker pull mcr.microsoft.com/azuredefender/stable/microsoft-defender-publisher:latest

docker tag mcr.microsoft.com/azuredefender/stable/microsoft-defender-collector:latest <local-registry>/microsoft-defender-collector:latest
docker tag mcr.microsoft.com/azuredefender/stable/microsoft-defender-publisher:latest <local-registry>/microsoft-defender-publisher:latest

docker push <local-registry>/microsoft-defender-collector:latest
docker push <local-registry>/microsoft-defender-publisher:latest

# Deploy with local registry
az k8s-extension create \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --extension-type microsoft.azuredefender.kubernetes \
    --configuration-settings \
        systemDefaultRegistry="<local-registry>" \
        logAnalyticsWorkspaceResourceID="/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
```

## Apply network policies

For restricted environments:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: defender-network-policy
  namespace: mdc
spec:
  podSelector:
    matchLabels:
      app: microsoft-defender
  policyTypes:
  - Egress
  egress:
  - to:
    - namespaceSelector: {}
    ports:
    - protocol: TCP
      port: 443
  - to:
    ports:
    - protocol: TCP
      port: 53
    - protocol: UDP
      port: 53
```

## Infrastructure as Code examples

### Terraform

```hcl
resource "azurerm_security_center_subscription_pricing" "containers" {
  tier          = "Standard"
  resource_type = "Containers"
}

resource "azurerm_arc_kubernetes_cluster_extension" "defender" {
  name           = "microsoft.azuredefender.kubernetes"
  cluster_id     = azurerm_arc_kubernetes_cluster.example.id
  extension_type = "microsoft.azuredefender.kubernetes"

  configuration_settings = {
    "logAnalyticsWorkspaceResourceID" = azurerm_log_analytics_workspace.example.id
    "auditLogPath"                    = "/var/log/kube-apiserver/audit.log"
  }
}
```

### ARM Template

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.KubernetesConfiguration/extensions",
      "apiVersion": "2023-05-01",
      "name": "microsoft.azuredefender.kubernetes",
      "properties": {
        "extensionType": "microsoft.azuredefender.kubernetes",
        "configurationSettings": {
          "logAnalyticsWorkspaceResourceID": "[parameters('workspaceResourceId')]"
        }
      }
    }
  ]
}
```

### Batch deployment script

Deploy to multiple Arc clusters:

```bash
#!/bin/bash
# Deploy Defender to all Arc-enabled clusters

# Get all Arc clusters
clusters=$(az connectedk8s list --query "[].{name:name, rg:resourceGroup}" -o tsv)

# Deploy extension to each cluster
while IFS=$'\t' read -r name rg; do
    echo "Deploying Defender to cluster: $name"
    az k8s-extension create \
        --name microsoft.azuredefender.kubernetes \
        --cluster-type connectedClusters \
        --cluster-name "$name" \
        --resource-group "$rg" \
        --extension-type microsoft.azuredefender.kubernetes \
        --no-wait
done <<< "$clusters"
```

## Next steps

- [Verify deployment](defender-for-containers-arc-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-arc-configure.md)
- [Deploy via portal](defender-for-containers-arc-deploy-portal.md)
