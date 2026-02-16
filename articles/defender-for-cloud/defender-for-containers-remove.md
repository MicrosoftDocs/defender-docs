---
title: Disable and remove Defender for Containers
description: Learn how to disable Microsoft Defender for Containers and remove its components for Kubernetes environments running on Azure, AWS, and Google Cloud.
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
ms.date: 01/25/2026
---

# Disable and remove Defender for Containers

This article explains how to disable Microsoft Defender for Containers and remove its components by environment.

Turning off the Defender for Containers plan or disabling automatic provisioning stops future deployments, but doesn't uninstall Defender components that are already deployed to clusters. Those components are removed separately.

> [!IMPORTANT]
> Removing Defender for Containers stops protection for your clusters. Make sure you have alternative security measures in place before you proceed.

> [!IMPORTANT]
> Disabling the plan doesn't delete historical security data stored in Microsoft Defender for Cloud or Log Analytics workspaces.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## What stops working after removal

After you remove Defender for Containers components from an AKS cluster:

- Runtime threat detection based on Defender sensor telemetry stops.

- Kubernetes security recommendations related to Azure Policy for Kubernetes stop updating.

- Alerts based on AKS runtime signals and Kubernetes audit data stop being generated.

- New container image vulnerability findings for images in Azure Container Registry (ACR) are no longer generated for this environment.

## Disable Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription that contains your AKS clusters.

1. In the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

## Remove Defender extensions from AKS clusters

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

### Check AKS cluster pods

```bash
kubectl get pods -A | grep defender
```

No resources should be returned.

### Verify plan status

```azurecli
az security pricing show --name 'Containers'
```

The output should show `pricingTier` as `Free`.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## What stops working after removal

After you remove Defender for Containers components from an EKS cluster:

- Runtime threat detection from the Defender sensor deployed through Azure Arc stops.

- Kubernetes security recommendations for that cluster stop updating.

- Alerts based on Kubernetes runtime and audit signals stop being generated.

- Container image vulnerability findings for images in Amazon ECR stop updating for this environment.

- Agentless discovery and control plane–based detections stop if related AWS-side permissions and integrations are removed.

## Remove Defender extensions from EKS clusters

Defender for Containers deploys components to EKS clusters by using Azure Arc–enabled Kubernetes. The following steps remove those Arc extensions.

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

## Remove AWS IAM roles and identity providers (optional)

If you are completely offboarding your AWS account from Microsoft Defender for Cloud, you can manually delete the IAM roles and identity providers that were created during onboarding. 

Use the AWS console or CLI to delete the following roles if they exist:
* `MDCContainersImageAssessmentRole`
* `MDCContainersK8sRole`
* `MDCContainersK8sDataCollectionRole`
* `MDCContainersK8sCloudWatchToKinesisRole`
* `MDCContainersK8sKinesisToS3RoleName`
* `MDCContainersAgentlessDiscoveryK8sRole`

> [!WARNING]
> Only delete the `ASCDefendersOIDCIdentityProvider` OpenID Connect provider if you are removing **all** Defender for Cloud components from this AWS account. Deleting this shared component will affect other Defender for Cloud plans.

## Verify removal

### Check Azure Arc extensions

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

Confirm that `microsoft.azuredefender.kubernetes` is not listed.

### Check EKS cluster pods

```bash
kubectl get pods -n mdc
```

No resources should be returned.

# [Google Kubernetes Engine (GKE)](#tab/gke)

## What stops working after removal

After you remove Defender for Containers components from a GKE cluster:

- Runtime threat detection from the Defender sensor deployed through Azure Arc stops.

- Kubernetes security recommendations for that cluster stop updating.

- Alerts based on Kubernetes runtime and audit signals stop being generated.

- Container image vulnerability findings for images in Google Container Registry or Artifact Registry stop updating for this environment.

## Remove Defender extensions from GKE clusters

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

- Delete the Pub/Sub topic and subscription that use the `MicrosoftDefender-` prefix.

- Delete the Cloud Logging sink that was created for Defender for Containers.

## Remove GCP service accounts and roles (optional)

If you are completely offboarding your GCP project from Microsoft Defender for Cloud, you can manually delete the service accounts and roles created during onboarding.

Use the Google Cloud console or gcloud CLI to delete the following service accounts:
* `ms-defender-containers`
* `ms-defender-containers-stream`
* `mdc-containers-k8s-operator`
* `mdc-containers-artifact-assess`

Delete the following custom roles:
* `MicrosoftDefenderContainersDataCollectionRole`
* `MicrosoftDefenderContainersRole`
* `MDCGkeClusterWriteRole`

> [!WARNING]
> Only delete the `containers` and `containers-streams` OIDC workload identity pool providers if you are removing **all** Defender for Cloud components. These are shared components. Additionally, ensure no other non-Defender services are using the `logging.googleapis.com` API before disabling it.

## Verify removal

### Check Azure Arc extensions

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

Confirm that `microsoft.azuredefender.kubernetes` is not listed.

### Check GKE cluster pods

```bash
kubectl get pods -n mdc
```

No resources should be returned.

### Check Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Verify the GCP connector is removed or shows **Containers** as disabled.

1. Check that no GKE-related recommendations appear.

# [Arc-enabled Kubernetes](#tab/arc)

## What stops working after removal

After you remove Defender for Containers components from an Arc-enabled Kubernetes cluster:

- Runtime threat detection from the Defender sensor stops.

- Kubernetes security recommendations for that cluster stop updating.

- Alerts based on Kubernetes runtime and audit signals stop being generated.

- Azure Policy–based configuration assessments for Kubernetes workloads stop if the Azure Policy extension is removed.

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

### Check Azure Arc extensions

```azurecli
az k8s-extension list \
  --cluster-type connectedClusters \
  --cluster-name <cluster-name> \
  --resource-group <resource-group>
```

Confirm that `microsoft.azuredefender.kubernetes` is not listed.

### Check Arc-enabled cluster pods

```bash
kubectl get pods -n mdc
```

No resources should be returned.

---

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)