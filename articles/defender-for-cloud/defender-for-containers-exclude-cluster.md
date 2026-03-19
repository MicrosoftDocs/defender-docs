---
title: Exclude Kubernetes clusters from automatic Defender sensor deployment
description: Learn how to exclude specific Kubernetes clusters from automatic Defender for Containers sensor deployment by using resource tags.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 03/18/2026
---

# Exclude Kubernetes clusters from automatic Defender sensor deployment

When automatic provisioning is enabled in the Defender for Containers plan, Microsoft Defender for Cloud deploys the Defender sensor to supported Kubernetes clusters.

You can exclude specific clusters from automatic sensor deployment by applying a resource tag. This is useful when you want to manage deployment manually, such as by using Helm or custom workflows.

## How exclusion works

Defender for Cloud checks for the following tag on the cluster resource:

```text
ms_defender_container_exclude_sensors = true
```

If this tag is present, the Defender sensor isn't deployed automatically to that cluster.

> [!IMPORTANT]
> When you exclude a cluster from automatic provisioning, you must deploy and manage the Defender sensor manually to enable runtime protection.

# [AKS](#tab/aks)

For Azure Kubernetes Service (AKS), apply the tag directly to the AKS resource.

## Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Kubernetes services**.

3. Select your AKS cluster.

4. Select **Tags**.

5. Add the following tag:
   - **Name**: `ms_defender_container_exclude_sensors`
   - **Value**: `true`

6. Select **Save**.

## Azure CLI

```azurecli
ARC_RESOURCE_ID=$(az connectedk8s show \
  --name <cluster-name> \
  --resource-group <resource-group> \
  --query id -o tsv)

az tag update \
  --resource-id $ARC_RESOURCE_ID \
  --operation Merge \
  --tags ms_defender_container_exclude_sensors=true
```

## Verify exclusion

After you apply the tag:

- The Defender sensor isn't deployed automatically to the cluster.
- Related recommendations for sensor deployment might remain unhealthy until you deploy the sensor manually.

To confirm, verify that Defender sensor components weren't installed automatically on the cluster.

## Next steps

- Learn how to [install the Defender sensor using Helm](deploy-helm.md).

- Learn how to [deploy Defender components using Azure CLI](defender-for-containers-deploy-azure-cli.md).