---
title: Deploy Defender for Containers on Arc-Enabled Kubernetes Programmatically
description: Learn how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters using Azure CLI and ARM templates.
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

## Connect your cluster to Azure Arc

Before deploying the Defender sensor, ensure your Kubernetes cluster is connected to Azure Arc. For instructions, see [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Enable Defender for Containers

To enable the Defender for Containers plan on your subscription, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md). You can enable the plan through the Azure portal, REST API, or Azure Policy.

## Deploy the Defender sensor

After enabling the plan and connecting your cluster to Azure Arc, deploy the Defender sensor extension:

```azurecli
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

## Deploy the Azure Policy extension

To enable Azure Policy for Kubernetes on Arc-enabled clusters:

```azurecli
az k8s-extension create \
    --name azure-policy \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --extension-type Microsoft.PolicyInsights
```

## Next steps

- [Verify deployment](defender-for-containers-arc-verify.md)
- [Deploy via portal](defender-for-containers-arc-enable-portal.md)
