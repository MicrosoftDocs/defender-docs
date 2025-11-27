---
title: Deploy Defender for Containers on Arc-Enabled Kubernetes Programmatically
description: Learn how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters using CLI, API, or Infrastructure as Code.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Deploy Defender for Containers on Arc-enabled Kubernetes programmatically

This article describes how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters by using programmatic methods.

> [!TIP]
> For Azure portal deployment instructions, see [Deploy Defender for Containers on Arc-enabled Kubernetes using Azure portal](defender-for-containers-arc-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additionally, you need:

- Azure CLI with the `k8s-extension` extension
- `kubectl` configured to access your cluster
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

### [Azure CLI - Enable Plan](#tab/azure-cli-enable)

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

### [REST API - Enable Plan](#tab/rest-api-enable)

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

---

## Deploy the Defender sensor

### [Azure CLI - Deploy Sensor](#tab/azure-cli-deploy)

```azurecli
# Deploy Defender sensor
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

### [Helm - Deploy Sensor](#tab/helm-deploy)

```bash
# Add Azure Arc Helm repository
helm repo add azure-arc https://azurearck8s.azurecr.io/helm/v1/repo
helm repo update

# Create namespace
kubectl create namespace mdc

# Install Defender sensor
helm install azure-defender azure-arc/azure-defender \
    --namespace mdc \
    --set systemDefaultRegistry=<registry-url> \
    --set global.credentials.workspaceId=<workspace-id> \
    --set global.credentials.workspaceKey=<workspace-key> \
    --set global.clusterName=<cluster-name>
```

### [GitOps - Deploy Sensor](#tab/gitops-deploy)

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1beta2
kind: Kustomization
metadata:
  name: defender-sensor
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

---

## Next steps

- [Verify deployment](defender-for-containers-arc-verify.md)
- [Deploy via portal](defender-for-containers-arc-enable-portal.md)
