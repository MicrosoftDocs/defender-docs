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

## Removal order

To properly remove Defender for Containers from Arc-enabled clusters, follow this order:

1. Remove Arc extensions from clusters (Defender sensor, Azure Policy)
1. Disconnect clusters from Azure Arc
1. Disable Defender plan in Azure
1. Verify removal

> [!IMPORTANT]
> If you're using Azure Arc for other purposes (like Azure Monitor, GitOps, or other extensions), skip step 2. Only disconnect from Arc if you're no longer using any Arc-enabled services.

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
# Set variables
CLUSTER_NAME="<your-cluster-name>"
RESOURCE_GROUP="<your-resource-group>"

# Remove Defender sensor extension
az k8s-extension delete \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --yes

# Remove Azure Policy extension
az k8s-extension delete \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
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

### Remove extensions by using kubectl

If Azure CLI removal fails, manually remove components:

```bash
# Remove Defender components
kubectl delete namespace mdc
kubectl delete clusterrolebinding azuredefender-sensor
kubectl delete clusterrole azuredefender-sensor

# Remove Policy components
kubectl delete namespace azurepolicy
kubectl delete namespace gatekeeper-system
kubectl delete clusterrolebinding azure-policy
kubectl delete clusterrole azure-policy
```

### Clean up remaining resources

```bash
# Remove any remaining ConfigMaps
kubectl delete configmap -n kube-system azure-defender-config

# Remove webhooks
kubectl delete validatingwebhookconfigurations gatekeeper-validating-webhook-configuration
kubectl delete mutatingwebhookconfigurations azure-policy-mutating-webhook-configuration
```

## Disconnect clusters from Azure Arc

> [!WARNING]
> Only disconnect from Azure Arc if you no longer use any Arc-enabled services on the cluster.

### Disconnect using Azure CLI

```azurecli
# Disconnect cluster from Arc
az connectedk8s delete \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --yes
```

### Remove Arc agents using kubectl

If Azure CLI fails, manually remove Arc agents:

```bash
# Delete Arc namespace and all resources
kubectl delete namespace azure-arc

# Remove Arc cluster role bindings
kubectl delete clusterrolebinding azure-arc-operator
kubectl delete clusterrolebinding azure-arc-reader

# Remove Arc CRDs
kubectl get crd -o name | grep -i arc | xargs kubectl delete
```

## Disable Defender plan

### Disable using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. On the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

### Disable using Azure CLI

```azurecli
# Disable Containers plan
az security pricing create \
    --name "Containers" \
    --subscription <subscription-id> \
    --tier "Free"
```

## Verify removal

### Check Azure resources

```azurecli
# Verify Arc clusters status
az connectedk8s list \
    --resource-group $RESOURCE_GROUP

# Check for remaining extensions
az k8s-extension list \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

### Check cluster resources

```bash
# Verify namespaces are removed
kubectl get namespace | grep -E "mdc|azurepolicy|azure-arc"

# Check for remaining CRDs
kubectl get crd | grep -E "defender|policy|arc"

# Verify no Defender pods running
kubectl get pods --all-namespaces | grep -E "defender|policy|arc"
```

## Troubleshooting removal

### Extension deletion stuck

If extension deletion hangs:

```azurecli
# Force delete the extension
az k8s-extension delete \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --force \
    --yes
```

### Arc disconnection fails

If Arc disconnection fails:

```bash
# Get Arc uninstall script
curl -o uninstall-arc.sh https://aka.ms/ArcK8sUninstallScript

# Run uninstall
bash uninstall-arc.sh
```

### Resources remain after deletion

Check for and remove finalizers preventing deletion:

```bash
# Remove finalizers from stuck namespace
kubectl get namespace mdc -o json | jq '.spec.finalizers = []' | kubectl apply -f -

# Remove stuck webhooks
kubectl delete validatingwebhookconfigurations --all
kubectl delete mutatingwebhookconfigurations --all
```

## Related content

- [Enable Defender for Containers on Arc-enabled clusters](defender-for-containers-arc-enable-portal.md)
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)
