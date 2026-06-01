---
title: Deploy Defender for Containers to private clusters (Preview)
description: Learn how to deploy Microsoft Defender for Containers to private clusters by using preview Helm charts and the Azure Arc Preview release train.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 06/01/2026
#customer intent: As a security administrator, I want to deploy Defender for Containers to private clusters so that I can protect nonpublic Kubernetes environments.
---

# Deploy Defender for Containers to private clusters (Preview)

Private clusters isolate Kubernetes environments from the internet and, in this context, restricted connectivity means no direct access to the Kubernetes API server. Defender for Containers extends threat detection and security visibility to these environments, so you can maintain protection coverage while preserving private cluster network boundaries.

## Prerequisites

Before you begin, ensure the following prerequisites are met:

- Defender for Containers is enabled for your target environment.
- If you're deploying by using **Helm**, ensure that `Helm`, `curl`, and `jq` are installed.
- If you're deploying by using an **Azure Arc-enabled Kubernetes extension**, ensure that your cluster is connected to Azure Arc, Azure command-line interface (Azure CLI) is installed, and you're signed in.

## Install preview components for private clusters

Defender for Containers Helm preview charts are published to `mcr.microsoft.com/azuredefender/microsoft-defender-for-containers` with a `-preview` suffix.

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
