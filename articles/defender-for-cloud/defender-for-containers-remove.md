---
title: Disable and remove Defender for Containers
description: Learn how to disable Microsoft Defender for Containers and remove its components for Kubernetes environments across Azure, AWS, Google Cloud, and Arc-enabled Kubernetes.
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
ms.date: 01/25/2026
---

# Disable and remove Defender for Containers

This article explains how to disable Microsoft Defender for Containers and remove its components by environment.

Disabling the plan doesn't delete historical security data stored in Microsoft Defender for Cloud or Log Analytics workspaces.

> [!IMPORTANT]
> Removing Defender for Containers stops protection for your clusters. Make sure you have alternative security measures in place before you proceed.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Disable Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription that contains your AKS clusters.

1. In the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

## Remove Defender components from clusters

### Remove the Defender for Containers profile from the AKS cluster

```azurecli
az aks update \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --disable-defender
```

### Disable Azure Policy add-on

```azurecli
az aks disable-addons \
  --addons azure-policy \
  --name <cluster-name> \
  --resource-group <resource-group>
```

## Verify removal

### Check component removal

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No resources should be returned after successful removal.

### Verify plan status

```azurecli
az security pricing show --name 'Containers'
```

The output should show `pricingTier` as `Free`.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Remove Defender extensions from EKS clusters

### Remove the Defender extension

```azurecli
az k8s-extension delete \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

### Remove the Azure Policy extension (if installed)

```azurecli
az k8s-extension delete \
  --name azurepolicy \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

### Disconnect clusters from Azure Arc

> [!NOTE]
> Disconnecting a cluster from Azure Arc removes access to all Arc extensions, not only Defender for Containers.

```azurecli
az connectedk8s delete \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

## Disable Defender for Containers plan on the AWS connector

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

1. Select **Settings**.

1. Toggle **Containers** to **Off**.

1. Select **Save**.

## Delete the AWS connector (optional)

If you no longer want Defender for Cloud to monitor your AWS account:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Find your AWS connector.

1. Select the ellipsis (...).

1. Select **Delete**.

1. Confirm deletion.

## Remove AWS resources created for runtime protection (optional)

Remove these resources only if runtime threat protection for EKS was enabled and you no longer use Defender for Containers for that cluster.

- [Delete the S3 bucket created for the cluster](https://docs.aws.amazon.com/AmazonS3/latest/userguide/delete-bucket.html).

- [Delete the SQS queue created for the cluster](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/step-delete-queue.html).

- [Delete the Kinesis Data Firehose delivery stream created for the cluster](https://docs.aws.amazon.com/firehose/latest/APIReference/API_DeleteDeliveryStream.html).

> [!NOTE]
> These resources are created per cluster. If you remove them while runtime protection is still enabled, data collection can stop.

## Verify removal

### Check Azure resources

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

### Check EKS clusters

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No resources should be returned.

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Remove Defender components from GKE clusters

### Remove the Defender extension

```azurecli
az k8s-extension delete \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

### Remove the Azure Policy extension (if installed)

```azurecli
az k8s-extension delete \
  --name azurepolicy \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

### Disconnect GKE clusters from Azure Arc

> [!NOTE]
> Disconnecting a cluster from Azure Arc removes access to all Arc extensions, not only Defender for Containers.

```azurecli
az connectedk8s delete \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

## Disable Defender for Containers plan on the GCP connector

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. Select **Settings**.

1. Toggle **Containers** to **Off**.

1. Select **Save**.

## Delete the GCP connector (optional)

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Find your GCP connector.

1. Select the **...** (more options) menu.

1. Select **Delete**.

1. Confirm deletion.

## Remove GCP resources created for runtime protection (optional)

Remove these resources only if runtime threat protection for GKE was enabled and you no longer use Defender for Containers for that project.

- Delete the Pub/Sub topic and subscription with the prefix `MicrosoftDefender-`.

- Delete the Cloud Logging sink that was created for Defender for Containers.

## Verify removal

### Check GKE cluster

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No resources should be returned.

## Check Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Verify the GCP connector is removed or shows **Containers** as disabled.

1. Check that no GKE-related recommendations appear.

# [Arc-enabled Kubernetes](#tab/arc)

## Disable Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription that contains your Arc-enabled Kubernetes clusters.

1. In the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

## Remove Defender extensions from Arc-enabled clusters

### Remove the Defender extension

```azurecli
az k8s-extension delete \
  --name microsoft.azuredefender.kubernetes \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

### Remove the Azure Policy extension (if installed)

```azurecli
az k8s-extension delete \
  --name azurepolicy \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

### Disconnect the cluster from Azure Arc (optional)

> [!NOTE]
> Disconnecting a cluster from Azure Arc removes access to all Arc extensions, not only Defender for Containers.

```azurecli
az connectedk8s delete \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --yes
```

## Verify removal

### Check Azure resources

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

### Check cluster pods

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No resources should be returned.

---

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)