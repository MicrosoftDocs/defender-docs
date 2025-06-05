---
title: Remove Defender for Containers from Arc-enabled Kubernetes
description: Learn how to disable and remove Microsoft Defender for Containers from your Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from Arc-enabled Kubernetes

This article explains how to disable and remove Defender for Containers from your Arc-enabled Kubernetes clusters.

> [!IMPORTANT]
> Removing Defender for Containers eliminates security protection for your clusters. Ensure you have alternative security measures in place before proceeding.

## Remove Defender components

### Step 1: Remove the Defender extension

```azurecli
# Delete the Defender extension
az k8s-extension delete \
    --name microsoft-defender \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --yes
```

### Step 2: Remove Azure Policy extension (if not needed)

```azurecli
# Delete Azure Policy extension
az k8s-extension delete \
    --name azurepolicy \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --yes
```

### Step 3: Clean up Kubernetes resources

```bash
# Delete namespace
kubectl delete namespace mdc

# Remove any remaining CRDs
kubectl delete crd defenderconfigs.mdc.microsoft.com
kubectl delete crd defenderpolicies.mdc.microsoft.com

# Remove cluster-wide resources
kubectl delete clusterrole microsoft-defender
kubectl delete clusterrolebinding microsoft-defender
```

## Remove policy assignments

### List and remove policy assignments

```azurecli
# List Defender-related policy assignments
az policy assignment list \
    --scope "/subscriptions/<sub-id>/resourceGroups/<rg-name>/providers/Microsoft.Kubernetes/connectedClusters/<cluster-name>" \
    --query "[?contains(displayName, 'Defender')].{Name:name, DisplayName:displayName}"

# Delete policy assignments
az policy assignment delete \
    --name <assignment-name> \
    --scope "/subscriptions/<sub-id>/resourceGroups/<rg-name>/providers/Microsoft.Kubernetes/connectedClusters/<cluster-name>"
```

## Disable Defender for Containers plan

### For specific clusters

If you want to keep Defender enabled for other clusters:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**
2. Select your subscription
3. Select **Settings** next to Containers
4. Exclude specific Arc clusters from monitoring

### For entire subscription

```azurecli
# Disable Defender for Containers
az security pricing create \
    --name 'Containers' \
    --tier 'Free'
```

## Clean up Arc resources (optional)

If you also want to disconnect the cluster from Arc:

> [!WARNING]
> This will remove all Arc functionality, not just Defender.

```azurecli
# Disconnect cluster from Arc
az connectedk8s delete \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

## Verify removal

### Check extension removal

```azurecli
# Verify extension is deleted
az k8s-extension list \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters
```

### Check Kubernetes resources

```bash
# Verify namespace is deleted
kubectl get namespace mdc

# Verify no Defender pods remain
kubectl get pods --all-namespaces | grep defender

# Verify CRDs are removed
kubectl get crd | grep mdc
```

### Check for remaining resources

```bash
# List all resources in cluster
kubectl api-resources --verbs=list --namespaced -o name \
  | xargs -n 1 kubectl get --show-kind --ignore-not-found --all-namespaces \
  | grep defender
```

## Clean up alerts and data

### Dismiss active alerts

```azurecli
# List active alerts for the cluster
az security alert list \
    --resource-group <resource-group> \
    --query "[?contains(resourceIdentifiers[0].azureResourceId, '<cluster-name>')]"

# Dismiss alerts
az security alert update \
    --location <location> \
    --name <alert-name> \
    --status Dismiss
```

### Data retention

Security data remains in your Log Analytics workspace according to retention settings:

```kusto
// Query to find Defender data
search *
| where TimeGenerated > ago(7d)
| where _ResourceId contains "<cluster-name>"
| distinct $table
```

## Remove diagnostic settings

```azurecli
# List diagnostic settings
az monitor diagnostic-settings list \
    --resource <cluster-resource-id>

# Delete diagnostic settings
az monitor diagnostic-settings delete \
    --name <setting-name> \
    --resource <cluster-resource-id>
```

## Post-removal considerations

### Alternative security solutions

Consider implementing:
- Open source tools like Falco or Sysdig
- Cloud provider native solutions
- Third-party Kubernetes security platforms

### Maintain security visibility

Without Defender for Containers:
- Implement alternative log collection
- Set up custom alerting
- Regular security audits

## Re-enable Defender for Containers

To re-enable protection in the future:

```azurecli
# Re-enable Defender plan
az security pricing create \
    --name 'Containers' \
    --tier 'Standard'

# Redeploy extension
az k8s-extension create \
    --name microsoft-defender \
    --extension-type microsoft.defender.containers \
    --scope cluster \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters
```

## Troubleshooting removal

### Extension stuck in deleting state

```bash
# Force delete from Kubernetes
kubectl patch extensionconfig microsoft-defender -n mdc -p '{"metadata":{"finalizers":[]}}' --type='merge'

# Check Azure Resource Manager
az resource delete \
    --ids "/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Kubernetes/connectedClusters/<cluster>/providers/Microsoft.KubernetesConfiguration/extensions/microsoft-defender"
```

### Orphaned resources

```bash
# Find and remove orphaned resources
kubectl get all,cm,secret,sa,role,rolebinding,crd --all-namespaces | grep defender
```

## Next steps

- [Learn about Arc-enabled Kubernetes](https://docs.microsoft.com/azure/azure-arc/kubernetes/overview)
- [Explore alternative security solutions](https://azure.microsoft.com/products/category/security/)
- [Re-deploy Defender for Containers](defender-for-containers-arc-deploy.md)