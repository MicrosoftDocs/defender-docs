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

## Remove order

To properly remove Defender for Containers, follow this order:

1. Remove Defender components from clusters
2. Disable Azure Policy add-on
3. Remove diagnostic settings
4. Clean up Azure policies
5. Disable Defender plan
6. Clean up remaining resources

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

## Post-removal considerations

### Security monitoring gaps

After removing Defender for Containers, your security posture changes significantly. Runtime threat detection ceases immediately, leaving your AKS clusters without real-time protection against active threats. Container image vulnerability scanning in ACR stops, meaning new vulnerabilities in your container images won't be identified. Security recommendations based on Kubernetes best practices will no longer be updated, potentially leaving configuration weaknesses unaddressed. Additionally, compliance reporting for standards like CIS Kubernetes Benchmark stops, which may impact your ability to demonstrate adherence to regulatory requirements.

### Alternative security solutions

Consider implementing alternative security measures to maintain protection for your AKS clusters. Native Azure services like Azure Policy can help enforce some security controls, while Azure Monitor can provide basic observability. Open source solutions such as Falco offer runtime security monitoring, while Open Policy Agent (OPA) can help enforce security policies. For vulnerability scanning, consider tools like Trivy or Clair. Commercial container security platforms from vendors like Aqua Security, Sysdig, or Prisma Cloud provide comprehensive alternatives. Evaluate these options based on your security requirements, budget, and operational preferences.

### Data retention

Understanding data retention is important for compliance and forensic purposes. Security alerts generated by Defender for Containers remain accessible in Microsoft Defender for Cloud for 90 days after removal, allowing time for investigation or compliance audits. Log Analytics workspace data follows your configured retention settings, which can range from 30 to 730 days. Security recommendations are cleared from the portal within 24 hours of removal but may be retained in exported reports or SIEM systems. Historical vulnerability scan results remain in your Azure Container Registry for 90 days unless manually purged.

### Re-enabling considerations

If you decide to re-enable Defender for Containers in the future, the process is straightforward. All components can be redeployed following the standard deployment guides, and protection will resume from that point forward. Historical data (if not purged) remains accessible according to retention policies. However, there will be a gap in security coverage for the period when Defender was disabled, which should be considered in any security audit or incident investigation.

## Re-enable Defender for Containers

To re-enable Defender for Containers in the future:

1. Follow the deployment guide: [Enable all Defender for Containers components on Azure (AKS)](defender-for-containers-azure-enable-all-portal.md)
2. All security features will be restored
3. Historical data (if not purged) will remain available

## Next steps

- [Enable Defender for Containers on Azure (AKS)](defender-for-containers-azure-enable-all-portal.md)
- [Learn about Defender for Containers features](defender-for-containers-azure-overview.md)
- [Explore alternative security solutions](https://azure.microsoft.com/products/category/security/)
