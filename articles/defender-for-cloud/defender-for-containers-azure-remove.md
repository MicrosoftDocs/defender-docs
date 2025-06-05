---
title: Remove Defender for Containers from Azure (AKS)
description: Learn how to disable and remove Microsoft Defender for Containers from your AKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from Azure (AKS)

This article explains how to disable and remove Defender for Containers from your AKS environment.

> [!IMPORTANT]
> Disabling Defender for Containers removes security protection from your AKS clusters. Ensure you have alternative security measures in place before proceeding.

## Disable Defender for Containers plan

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Select the subscription containing your AKS clusters.
3. In the Defender plans page, toggle **Containers** to **Off**.
4. Select **Save**.

### Using Azure CLI

```azurecli
# Disable Defender for Containers
az security pricing create \
    --name 'Containers' \
    --tier 'Free'
```

### Using PowerShell

```powershell
# Disable Defender for Containers
Set-AzSecurityPricing `
    -Name "Containers" `
    -PricingTier "Free"
```

## Remove Defender components from clusters

### Remove the Defender sensor

```bash
# Delete the Defender DaemonSet
kubectl delete daemonset microsoft-defender-collector-ds -n kube-system

# Delete ConfigMaps
kubectl delete configmap microsoft-defender-config -n kube-system
kubectl delete configmap microsoft-defender-fim-config -n kube-system
kubectl delete configmap microsoft-defender-process-config -n kube-system

# Delete ServiceAccount and RBAC
kubectl delete serviceaccount microsoft-defender -n kube-system
kubectl delete clusterrole microsoft-defender
kubectl delete clusterrolebinding microsoft-defender
```

### Disable Azure Policy add-on

```azurecli
# Disable Azure Policy for Kubernetes
az aks disable-addons \
    --addons azure-policy \
    --name <cluster-name> \
    --resource-group <resource-group>
```

## Remove diagnostic settings

### Using Azure portal

1. Navigate to your AKS cluster.
2. Select **Diagnostic settings** under **Monitoring**.
3. Select the diagnostic setting created for Defender.
4. Select **Delete**.

### Using Azure CLI

```azurecli
# List diagnostic settings
az monitor diagnostic-settings list \
    --resource <cluster-resource-id>

# Delete diagnostic setting
az monitor diagnostic-settings delete \
    --name <diagnostic-setting-name> \
    --resource <cluster-resource-id>
```

## Clean up Azure policies

### Remove policy assignments

```azurecli
# List policy assignments related to Defender
az policy assignment list \
    --query "[?contains(displayName, 'Defender') || contains(displayName, 'Kubernetes')]" \
    --output table

# Delete specific assignments
az policy assignment delete --name <assignment-name>
```

### Remove custom initiatives

If you created custom policy initiatives:

```azurecli
# Delete custom initiative
az policy set-definition delete \
    --name <initiative-name>
```

## Remove vulnerability scanning configuration

### For Azure Container Registry

1. Navigate to your Azure Container Registry.
2. Select **Security** > **Defender for Cloud**.
3. Disable vulnerability scanning.

Or using Azure CLI:

```azurecli
# Disable vulnerability scanning
az acr config content-trust update \
    --registry <registry-name> \
    --status disabled
```

## Clean up alerts and recommendations

### Dismiss active alerts

```azurecli
# List active container-related alerts
az security alert list \
    --query "[?status=='Active' && contains(alertType, 'Container')]" \
    --output table

# Dismiss alerts
az security alert update \
    --name <alert-name> \
    --status Dismiss
```

### Clear recommendations

Recommendations will automatically clear after the next assessment cycle (typically 12-24 hours).

## Verify removal

### Check component removal

```bash
# Verify DaemonSet is removed
kubectl get daemonset -n kube-system | grep defender

# Verify no Defender pods are running
kubectl get pods --all-namespaces | grep defender

# Verify ConfigMaps are removed
kubectl get configmap -n kube-system | grep defender
```

### Verify plan status

```azurecli
# Check that Defender for Containers is disabled
az security pricing show --name 'Containers'
```

## Data retention

> [!NOTE]
> Historical security data remains in your Log Analytics workspace according to your retention policy. To remove this data:

1. Navigate to your Log Analytics workspace.
2. Run the following query to identify Defender-related tables:

```kusto
search * 
| where TimeGenerated > ago(1d)
| where _ResourceId contains "container" or _ResourceId contains "aks"
| distinct $table
```

3. Configure data retention or purge data as needed.

## Re-enable Defender for Containers

To re-enable Defender for Containers in the future:

1. Follow the deployment guide: [Deploy Defender for Containers on Azure (AKS)](defender-for-containers-azure-deploy.md)
2. All security features will be restored
3. Historical data (if not purged) will remain available

## Next steps

- [Deploy Defender for Containers on Azure (AKS)](defender-for-containers-azure-deploy.md)
- [Learn about Defender for Containers features](defender-for-containers-azure-overview.md)
- [Explore alternative security solutions](https://azure.microsoft.com/products/category/security/)