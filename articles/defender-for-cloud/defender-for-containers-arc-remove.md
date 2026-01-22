---
title: Remove Defender for Containers from Arc-enabled clusters
description: Learn how to remove Microsoft Defender for Containers components from your Azure Arc-enabled Kubernetes clusters and disable the service.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Remove Defender for Containers from Arc-enabled clusters

This article explains how to remove Defender for Containers from your Arc-enabled Kubernetes clusters. Follow these steps when you need to completely uninstall the service or troubleshoot deployment issues.

When you enable Defender for Containers capabilities that use automatic provisioning, or use recommendations to manually deploy container capabilities on specific resources, you install Defender components and extensions in your environment.

If you decide to stop using those capabilities, you might also want to remove these components from your environment. This article helps you understand the actions you can take to remove them.

> [!NOTE]
> To remove this (or any) Defender for Cloud extension, you need more than just turning off automatic provisioning:
>
> - When you turn on automatic provisioning, it can affect *existing* and *future* machines.
> - When you turn off automatic provisioning for an extension, it only affects *future* machines. Nothing gets uninstalled when you turn off automatic provisioning.

## Remove Arc extensions from clusters

You can remove extensions by using the Azure portal, Azure CLI, or REST API.

### [Azure portal](#tab/portal)

1. In the Azure portal, open **Azure Arc**.

1. In the infrastructure list, select **Kubernetes clusters**, then select the specific cluster.

1. Open the **Extensions** page, which lists extensions on the cluster.

1. Select the **microsoft.azuredefender.kubernetes** extension, then select **Uninstall**.

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-uninstall-clusters-page.png" alt-text="Screenshot that shows the button for uninstalling an extension from an Azure Arc-enabled Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-uninstall-clusters-page.png":::

1. Repeat for the **azurepolicy** extension if installed.

### [Azure CLI](#tab/cli)

```azurecli
az k8s-extension delete \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

To remove the Azure Policy extension:

```azurecli
az k8s-extension delete \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

Removing the extensions might take a few minutes.

### [REST API](#tab/rest)

To remove the Defender extension by using the REST API, run the following DELETE command:

```rest
DELETE https://management.azure.com/subscriptions/{{Subscription ID}}/resourcegroups/{{Resource Group}}/providers/Microsoft.Kubernetes/connectedClusters/{{Cluster Name}}/providers/Microsoft.KubernetesConfiguration/extensions/microsoft.azuredefender.kubernetes?api-version=2020-07-01-preview
```

The command includes these parameters:

| Name | In | Required | Type | Description |
| --- | --- | --- | --- | --- |
| `Subscription ID` | Path | True | String | Your Azure Arc-enabled Kubernetes cluster's subscription ID |
| `Resource Group` | Path | True | String | Your Azure Arc-enabled Kubernetes cluster's resource group |
| `Cluster Name` | Path | True | String | Your Azure Arc-enabled Kubernetes cluster's name |

For **Authentication**, your header must have a bearer token (as with other Azure APIs). To get a bearer token, run the following command:

```azurecli
az account get-access-token --subscription <your-subscription-id>
```

The request might take several minutes to complete.

---

## Disconnect clusters from Azure Arc

> [!WARNING]
> Only disconnect from Azure Arc if you no longer use any Arc-enabled services on the cluster.

To disconnect a cluster from Azure Arc:

```azurecli
az connectedk8s delete \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

## Disable Defender plan

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. On the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

## Verify removal

### Check Azure resources

```azurecli
az k8s-extension list \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>
```

### Check cluster resources

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No pods should be returned after successful removal.

## Related content

- [Enable Defender for Containers on Arc-enabled clusters](defender-for-containers-arc-enable-portal.md)
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)
