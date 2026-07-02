---
title: Deploy Defender for Containers to private clusters (Preview)
description: Learn how to deploy Microsoft Defender for Containers to private clusters by using preview Helm charts and the Azure Arc Preview release train.
ms.topic: how-to
ms.date: 06/01/2026
#customer intent: As a security administrator, I want to deploy Defender for Containers to private clusters so that I can protect nonpublic Kubernetes environments.
ai-usage: ai-assisted
---

# Deploy Defender for Containers to private clusters

Private clusters isolate Kubernetes environments from the internet and, in this context, restricted connectivity means no direct access to the Kubernetes API server. Defender for Containers extends threat detection and security visibility to these environments, so you can maintain protection coverage while preserving private cluster network boundaries.

## Prerequisites

Before you begin, ensure the following prerequisites are met:

- Defender for Containers is enabled for your target environment.

- If you're deploying by using **Helm**, make sure [`helm`](https://helm.sh/docs/intro/install/), `curl`, and [`jq`](https://jqlang.org/download/) are installed and available in your command-line environment.

  To check whether the tools are available, run:

  ```bash
  helm version
  curl --version
  jq --version
  ```

- If you're deploying by using an **Azure Arc-enabled Kubernetes extension**, ensure that:
    - Your cluster [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).
    - The Azure command-line interface (Azure CLI) is installed and you're signed in.

## Install components for private clusters

Defender for Containers Helm charts are published to mcr.microsoft.com/azuredefender/microsoft-defender-for-containers.
Private clusters are supported in 0.11.X chart versions.
Use the following tabs to install the components for your environment.

# [Helm on Amazon EKS](#tab/helm-eks)

You can list the published versions by running the following command:

```bash
curl https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list
```

To install the latest `0.11.X` chart and enable private cluster components:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
  --create-namespace \
  --namespace mdc \
  --set global.cloudIdentifiers.AWS.accountId="<aws-account-id>" \
  --set global.cloudIdentifiers.AWS.region="<cluster-location>" \
  --set global.cloudIdentifiers.AWS.clusterName="<cluster-name>" \
  --set microsoft-defender-for-containers-sensor.inventoryCollector.enabled=true \
  --set microsoft-defender-for-containers-sensor.configController.enabled=true
```

# [Helm on Google Kubernetes Engine](#tab/helm-gke)

You can list the published versions by running the following command:

```bash
curl https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list
```

To install the latest `0.11.X` chart and enable private cluster components:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
  --create-namespace \
  --namespace mdc \
  --set global.cloudIdentifiers.GCP.projectId="<gcp-project-id>" \
  --set global.cloudIdentifiers.GCP.location="<cluster-location>" \
  --set global.cloudIdentifiers.GCP.clusterName="<cluster-name>" \
  --set microsoft-defender-for-containers-sensor.inventoryCollector.enabled=true \
  --set microsoft-defender-for-containers-sensor.configController.enabled=true
```

# [Azure Arc-enabled Kubernetes](#tab/arc)

To install the Defender extension and enable private cluster components:

```azurecli
az k8s-extension create \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name $ARC_CLUSTER_NAME \
  --resource-group $ARC_RESOURCE_GROUP \
  --extension-type microsoft.azuredefender.kubernetes \
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
