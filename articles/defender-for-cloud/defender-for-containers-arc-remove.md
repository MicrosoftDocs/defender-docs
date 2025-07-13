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

## Remove order

To properly remove Defender for Containers from Arc-enabled clusters:

1. Remove Defender extension from clusters
1. Remove Azure Policy extension (if present)
1. Clean up Kubernetes resources
1. Remove policy assignments
1. Disable Defender plan (optional)
1. Verify removal

## Remove Defender extension

### Using Azure CLI

```azurecli
# Delete the Defender extension
az k8s-extension delete \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --yes
```

### Using Azure portal

1. Navigate to your Arc-enabled Kubernetes cluster.
1. Select **Extensions** under **Settings**.
1. Select the **Microsoft Defender** extension.
1. Select **Uninstall**.
1. Confirm the deletion.

## Remove Azure Policy extension

If Azure Policy for Kubernetes was deployed:

```azurecli
# Delete Azure Policy extension
az k8s-extension delete \
    --name azurepolicy \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --yes
```

## Clean up Kubernetes resources

Remove any remaining resources from the cluster:

```bash
# Delete namespace
kubectl delete namespace mdc

# Remove any remaining CRDs
kubectl delete crd defenderconfigs.mdc.microsoft.com
kubectl delete crd defenderpolicies.mdc.microsoft.com

# Remove cluster-wide resources
kubectl delete clusterrole microsoft-defender
kubectl delete clusterrolebinding microsoft-defender

# Remove any remaining service accounts
kubectl delete serviceaccount -n mdc microsoft-defender
```

## Remove policy assignments

### List and remove assignments

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

## Disable Defender plan (optional)

### For specific clusters only

To exclude specific clusters while keeping Defender enabled:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Select **Settings** next to Containers.
1. Configure exclusions for specific Arc clusters.

### For entire subscription

```azurecli
# Disable Defender for Containers
az security pricing create \
    --name 'Containers' \
    --tier 'Free'
```

## Clean up Arc resources (optional)

> [!WARNING]
> This will disconnect your cluster from Azure Arc entirely, removing all Arc functionality.

If you also want to remove Arc connectivity:

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

# Check for any remaining resources
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

### Security monitoring gaps

After removing Defender for Containers, your Arc-enabled clusters lose several critical security capabilities. Runtime threat detection stops immediately, leaving clusters vulnerable to active attacks and suspicious behavior. Container vulnerability scanning ceases, meaning new security flaws in your images won't be identified. Security recommendations based on CIS Kubernetes Benchmark and other standards will no longer update. Compliance reporting capabilities are lost, which may impact audit requirements. The unified security view across your hybrid infrastructure disappears, making it harder to maintain consistent security posture.

### Alternative security solutions

Consider implementing alternative security measures for your Arc-enabled clusters. Open source options include Falco for runtime security, Open Policy Agent (OPA) for policy enforcement, and Trivy or Clair for vulnerability scanning. Commercial alternatives include Prisma Cloud, Aqua Security, Sysdig Secure, and StackRox. For basic monitoring, you can use native Kubernetes audit logs with SIEM integration. Evaluate solutions based on your specific requirements for on-premises support, air-gapped capabilities, and integration with existing tools.

### Maintaining Arc connectivity

If you removed only Defender but kept Arc connectivity, you retain several management capabilities. Azure Policy can still enforce configurations, Azure Monitor can collect metrics and logs, and you can deploy other Arc-enabled services. Consider using Azure Policy for basic security controls and Azure Monitor for security-relevant log collection as interim measures.

### Data and compliance considerations

Historical security data remains accessible in your Log Analytics workspace for the configured retention period (default 30 days, maximum 730 days). Security alerts persist in Microsoft Defender for Cloud for 90 days. Exported data in SIEM systems or backup storage follows those systems' retention policies. Document the removal date and reason for compliance audits, as there will be a gap in security monitoring that auditors may question.

## Re-enable Defender for Containers

To restore protection in the future:

```azurecli
# Re-enable Defender plan
az security pricing create \
    --name 'Containers' \
    --tier 'Standard'

# Redeploy extension
az k8s-extension create \
    --name microsoft.azuredefender.kubernetes \
    --extension-type microsoft.azuredefender.kubernetes \
    --scope cluster \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters
```

## Troubleshooting removal

### Extension stuck in deleting state

```bash
# Force delete from Kubernetes
kubectl patch extensionconfig microsoft.azuredefender.kubernetes -n azure-arc \
    -p '{"metadata":{"finalizers":[]}}' --type='merge'

# Check Azure Resource Manager
az resource delete \
    --ids "/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Kubernetes/connectedClusters/<cluster>/providers/Microsoft.KubernetesConfiguration/extensions/microsoft.azuredefender.kubernetes"
```

### Orphaned resources

Distribution-specific cleanup:

```bash
# OpenShift
oc delete scc defender-scc

# Check for custom resources
kubectl get crd -o name | grep -i defender | xargs kubectl delete
```

## Next steps

- [Learn more about Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview)
- [Explore alternative security solutions](https://azure.microsoft.com/products/category/security/)
- [Re-deploy Defender for Containers](defender-for-containers-arc-enable-all-portal.md)
