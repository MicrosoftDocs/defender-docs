---
title: Remove Defender for Containers from Azure (AKS)
description: Learn how to disable and remove Microsoft Defender for Containers from your AKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from Azure (AKS)

This article explains how to disable and remove Defender for Containers from your AKS environment.

> [!IMPORTANT]
> Disabling Defender for Containers removes security protection from your AKS clusters. Make sure you have alternative security measures in place before you proceed.

## Removal order

To properly remove Defender for Containers, follow this order:

1. Remove Defender components from clusters
1. Disable Azure Policy add-on
1. Remove diagnostic settings
1. Clean up Azure policies
1. Disable Defender plan
1. Clean up remaining resources

## Disable Defender for Containers plan

### Disable using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select the subscription that contains your AKS clusters.
1. In the Defender plans page, toggle **Containers** to **Off**.
1. Select **Save**.

### Disable using Azure CLI

```azurecli
# Disable Defender for Containers
az security pricing create \
    --name 'Containers' \
    --tier 'Free'
```

### Disable using PowerShell

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

### Remove diagnostic settings via Azure portal

1. Navigate to your AKS cluster.
1. Select **Diagnostic settings** under **Monitoring**.
1. Select the diagnostic setting created for Defender.
1. Select **Delete**.

### Remove diagnostic settings via Azure CLI

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

1. Go to your Azure Container Registry.
1. Select **Security** > **Defender for Cloud**.
1. Disable vulnerability scanning.

Or use Azure CLI:

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

Recommendations automatically clear after the next assessment cycle (typically 12-24 hours).

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

When you remove Defender for Containers, your security posture changes significantly. Runtime threat detection stops immediately, leaving your AKS clusters without real-time protection against active threats. Container image vulnerability scanning in ACR stops, so new vulnerabilities in your container images go undetected. Security recommendations based on Kubernetes best practices no longer update, which might leave configuration weaknesses unaddressed. Additionally, compliance reporting for standards like CIS Kubernetes Benchmark stops, which might affect your ability to demonstrate adherence to regulatory requirements.

### Alternative security solutions

To maintain protection for your AKS clusters, consider implementing alternative security measures. Native Azure services like Azure Policy can help enforce some security controls, while Azure Monitor can provide basic observability. Open source solutions such as Falco offer runtime security monitoring, while Open Policy Agent (OPA) can help enforce security policies. For vulnerability scanning, consider tools like Trivy or Clair. Commercial container security platforms from vendors like Aqua Security, Sysdig, or Prisma Cloud provide comprehensive alternatives. Evaluate these options based on your security requirements, budget, and operational preferences.

### Data retention policies

Understanding data retention is important for compliance and forensic purposes. Security alerts generated by Defender for Containers remain accessible in Microsoft Defender for Cloud for 90 days after removal, giving you time for investigation or compliance audits. Log Analytics workspace data follows your configured retention settings, which can range from 30 to 730 days. Security recommendations clear from the portal within 24 hours of removal but might be retained in exported reports or SIEM systems. Historical vulnerability scan results remain in your Azure Container Registry for 90 days unless you manually purge them.

### Future re-enablement planning

If you decide to re-enable Defender for Containers in the future, the process is straightforward. All components can be redeployed following the standard deployment guides, and protection will resume from that point forward. Historical data (if not purged) remains accessible according to retention policies. However, there will be a gap in security coverage for the period when Defender was disabled, which should be considered in any security audit or incident investigation.

## Re-enable Defender for Containers

To re-enable Defender for Containers in the future:

1. Follow the deployment guide: [Enable all Defender for Containers components on Azure (AKS)](defender-for-containers-azure-enable-all-portal.md)
2. All security features will be restored
3. Historical data (if not purged) will remain available

## Related content

- [Learn more about AKS security](/azure/aks/concepts-security)
- [Offboard Microsoft Defender for Containers](defender-for-containers-offboard.md)
- [Re-deploy Defender for Containers](defender-for-containers-azure-enable-all-portal.md) - To restore protection
