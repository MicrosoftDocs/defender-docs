---
title: Enable private cluster support for Defender for Containers (Preview)
description: Learn how to enable private cluster support for Microsoft Defender for Containers by using preview Helm charts and the Azure Arc Preview release train.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 06/01/2026
#customer intent: As a security administrator, I want to enable Defender for Containers support on private clusters so that I can protect nonpublic Kubernetes environments.
---

# Enable private cluster support for Defender for Containers (Preview)

This article explains how to enable Microsoft Defender for Containers support for private clusters by using the current public preview installation paths.

## Prerequisites

Before you begin, make sure that:

- Defender for Containers is enabled for your target environment.
- You have Helm, curl, and jq installed for Helm-based deployments.
- You have Azure CLI installed and signed in for Azure Arc-enabled Kubernetes deployments.

## Install preview components for private clusters

Defender for Containers Helm public preview charts are published to `mcr.microsoft.com/azuredefender/microsoft-defender-for-containers` with a `-preview` suffix.

Private clusters are supported in `0.11.X-preview` chart versions.

Use the following tabs to install preview components for your environment.

# [Helm on Amazon EKS](#tab/helm-eks)

To get the latest `0.11.X-preview` chart version:

```bash
curl -s https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list | jq -r '.tags[] | select(test("^0\\.11\\..*-preview$"))' | sort -V | tail -1
```

To install the latest `0.11.X-preview` chart and enable private cluster components:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
  --version $(curl -s https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list | jq -r '.tags[] | select(test("^0\\.11\\..*-preview$"))' | sort -V | tail -1) \
  --create-namespace \
  --namespace mdc \
  --set global.cloudIdentifiers.AWS.accountId="<aws-account-id>" \
  --set global.cloudIdentifiers.AWS.region="<cluster-location>" \
  --set global.cloudIdentifiers.AWS.clusterName="<cluster-name>" \
  --set microsoft-defender-for-containers-sensor.inventoryCollector.enabled=true \
  --set microsoft-defender-for-containers-sensor.configController.enabled=true
```

# [Helm on Google Kubernetes Engine](#tab/helm-gke)

To get the latest `0.11.X-preview` chart version:

```bash
curl -s https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list | jq -r '.tags[] | select(test("^0\\.11\\..*-preview$"))' | sort -V | tail -1
```

To install the latest `0.11.X-preview` chart and enable private cluster components:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
  --version $(curl -s https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list | jq -r '.tags[] | select(test("^0\\.11\\..*-preview$"))' | sort -V | tail -1) \
  --create-namespace \
  --namespace mdc \
  --set global.cloudIdentifiers.GCP.projectId="<gcp-project-id>" \
  --set global.cloudIdentifiers.GCP.location="<cluster-location>" \
  --set global.cloudIdentifiers.GCP.clusterName="<cluster-name>" \
  --set microsoft-defender-for-containers-sensor.inventoryCollector.enabled=true \
  --set microsoft-defender-for-containers-sensor.configController.enabled=true
```

# [Azure Arc-enabled Kubernetes](#tab/arc)

To install the Defender extension by using the Preview release train and enable private cluster components:

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name $ARC_CLUSTER_NAME \
  --resource-group $ARC_RESOURCE_GROUP \
  --extension-type microsoft.azuredefender.kubernetes \
  --release-train Preview \
  --configuration-settings inventoryCollector.enabled='true' \
  --configuration-settings configController.enabled='true'
```

---

## Verify the deployment

To verify Helm-based deployment status:

```bash
helm list --namespace mdc
```

To verify the Azure Arc extension deployment:

```azurecli
az k8s-extension show \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name $ARC_CLUSTER_NAME \
  --resource-group $ARC_RESOURCE_GROUP
```

## Related content

- [Deploy Defender sensor and Azure Policy to clusters using Azure CLI](defender-for-containers-deploy-azure-cli.md)
- [Install Defender for Containers sensor using Helm](deploy-helm.md)
- [Verify Defender for Containers deployment](defender-for-containers-verify-deployment.md)
