---
title: Deploy Defender for Containers Components on GCP (GKE) Programmatically
description: Learn how to deploy Microsoft Defender for Containers components on GKE clusters using Azure CLI and ARM templates.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Deploy Defender for Containers components on GCP (GKE) programmatically

This article explains how to deploy Defender for Containers components on your Google Kubernetes Engine (GKE) clusters by using command-line tools and automation methods.

> [!TIP]
> For a guided portal experience, see [Enable all components via portal](defender-for-containers-gcp-enable-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Required tools:

- Azure CLI (version 2.40.0 or later)
- gcloud CLI configured with appropriate credentials
- `kubectl` configured for your GKE clusters

## Enable Defender for Containers

To enable the Defender for Containers plan on your subscription, see [Enable Microsoft Defender for Cloud](connect-azure-subscription.md). You can enable the plan through the Azure portal, REST API, or Azure Policy.

## Connect your GCP project

Before deploying the Defender sensor, connect your GCP project to Microsoft Defender for Cloud. For instructions, see [Connect your GCP project](quickstart-onboard-gcp.md).

The connection wizard in the Azure portal guides you through:

- Creating the necessary GCP service accounts
- Configuring workload identity federation
- Setting up the required IAM permissions
- Downloading and running the setup scripts

## Connect GKE clusters to Azure Arc

Connect your GKE clusters to Azure Arc to deploy the Defender sensor. For instructions, see [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Deploy the Defender sensor

After connecting your GCP project and GKE clusters to Azure Arc, deploy the Defender sensor extension:

```azurecli
az k8s-extension create \
    --name microsoft.azuredefender.kubernetes \
    --extension-type microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --configuration-settings \
        logAnalyticsWorkspaceResourceID="/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
```

## Deploy the Azure Policy extension

Deploy the Azure Policy extension to enable policy enforcement on your GKE clusters:

```azurecli
az k8s-extension create \
    --name azure-policy \
    --extension-type Microsoft.PolicyInsights \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>
```

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
