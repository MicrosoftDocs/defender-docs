---
title: Verify Defender for Containers deployment on Azure (AKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your AKS clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Defender for Containers deployment on Azure (AKS)

After you enable Defender for Containers, use this guide to verify all components are functioning correctly.

## Validation checklist

Complete these verification steps in order:

- [ ] [Defender plan shows as enabled](#verify-plan-enablement)
- [ ] [Defender sensor pods are running](#verify-sensor-deployment) (kube-system namespace)
- [ ] [Azure Policy add-on is enabled](#verify-azure-policy-add-on)
- [ ] [Test security alert generated successfully](#test-security-detection)
- [ ] [No error messages in component logs](#check-defender-sensor-logs)

> [!TIP]
> If any validation step fails, see the [Troubleshooting](#common-verification-issues) section for that component.

## Verify plan enablement

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Verify that **Containers** shows as **On**.
1. Select **Settings** next to Containers and verify all extensions are enabled.

### Using Azure CLI

```azurecli
# Check pricing tier
az security pricing show --name 'Containers' --query pricingTier

# Check extensions
az security pricing extension list --name 'Containers'

# Verify all extensions are enabled
az security pricing show --name 'Containers' --query "properties.extensions[].isEnabled"
```

### Using PowerShell

```powershell
# Check plan status
Get-AzSecurityPricing -Name "Containers"

# Verify workspace configuration
Get-AzSecurityWorkspaceSetting -Name "default"

# Check if auto-provisioning is enabled
Get-AzSecurityAutoProvisioningSetting | Where-Object {$_.Name -eq "default"}
```

### Using REST API

```bash
# Set variables
SUBSCRIPTION_ID="<subscription-id>"
TOKEN="<bearer-token>"

# Check plan configuration
curl -X GET \
  "https://management.azure.com/subscriptions/${SUBSCRIPTION_ID}/providers/Microsoft.Security/pricings/Containers?api-version=2024-01-01" \
  -H "Authorization: Bearer ${TOKEN}"

# Verify response shows pricingTier as "Standard" and extensions as enabled
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Check if the Defender sensor DaemonSet is running
kubectl get daemonset -n kube-system | grep defender

# Expected output:
# microsoft-defender-collector-ds   3         3         3       3            3           <none>          5m
```

### Check using Azure CLI

```azurecli
# Verify Defender profile is enabled on AKS cluster
az aks show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query "securityProfile.defender"

# Expected output shows securityMonitoring.enabled as true
```

### Check pod status

```bash
# List Defender pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check pod logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=50
```

### Check Defender sensor logs

```bash
# View recent logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=100

# Check for errors
kubectl logs -n kube-system -l app=microsoft-defender | grep ERROR
```

## Verify Azure Policy add-on

```azurecli
# Check if Azure Policy is enabled
az aks show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query addonProfiles.azurepolicy

# Expected output shows enabled:true
```

### Check security events

```kusto
SecurityEvent
| where TimeGenerated > ago(1h)
| where Computer contains "aks"
| summarize count() by Activity
| take 10
```

## Test security detection

To verify that your Defender for Containers deployment is working correctly, you can simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Common verification issues

### Sensor pods not running

If sensor pods aren't running:

```bash
# Check pod events
kubectl describe pods -n kube-system -l app=microsoft-defender

# Check resource constraints
kubectl top nodes
kubectl top pods -n kube-system
```

Common causes:

- **Insufficient resources**: Increase node size or add nodes
- **Network policies**: Ensure egress to Azure endpoints is allowed
- **RBAC issues**: Verify cluster has proper permissions

### Missing recommendations

If recommendations are missing:

1. Check that you enabled the Azure Policy add-on.
1. Wait up to 24 hours for the initial assessment.
1. Verify you enabled agentless discovery.
1. Make sure you didn't exclude clusters through tags.

### No vulnerability scan results

If vulnerability scans are missing:

1. Check that you configured ACR integration.
1. Verify you recently pushed images.
1. Make sure you enabled vulnerability assessment.
1. Wait up to 4 hours for the initial scans.

## Related content

- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
