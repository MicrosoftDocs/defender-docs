---
title: Verify Defender for Containers deployment on Azure (AKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your AKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on Azure (AKS)

After enabling Defender for Containers, verify that all components are properly deployed and functioning.

## Verify plan enablement

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Select your subscription.
3. Verify that **Containers** shows as **On**.
4. Select **Settings** next to Containers and verify all extensions are enabled.

### Using Azure CLI

```azurecli
# Check pricing tier
az security pricing show --name 'Containers' --query pricingTier

# Check extensions
az security pricing extension list --name 'Containers'
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Check if the Defender sensor DaemonSet is running
kubectl get daemonset -n kube-system | grep defender

# Expected output:
# microsoft-defender-collector-ds   3         3         3       3            3           <none>          5m
```

### Check pod status

```bash
# List Defender pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check pod logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=50
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

## Verify data collection

### Check Log Analytics connection

1. In the Azure portal, navigate to your AKS cluster.
2. Select **Logs** under **Monitoring**.
3. Run this query to verify data flow:

```kusto
ContainerLog
| where TimeGenerated > ago(1h)
| summarize count() by Computer, ContainerID
| take 10
```

### Check security events

```kusto
SecurityEvent
| where TimeGenerated > ago(1h)
| where Computer contains "aks"
| summarize count() by Activity
| take 10
```

## Verify container image scanning

### For Azure Container Registry

1. Navigate to your Azure Container Registry.
2. Select **Security** > **Defender for Cloud**.
3. Verify that vulnerability scanning is enabled.
4. Check recent scan results for your images.

### Using Azure CLI

```azurecli
# List vulnerability assessments
az security assessment list \
    --query "[?contains(name, 'container')]" \
    --output table
```

## Test security detection

### Generate a test alert

Run this benign test to verify threat detection:

```bash
# This command triggers a test alert
kubectl run test-alert \
    --image=nginx \
    --rm \
    -it \
    --restart=Never \
    -- /bin/bash -c "echo 'This is a test alert for Defender for Containers' > /etc/passwd"
```

Check for the alert in Defender for Cloud within 5-10 minutes.

## Verify recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.
2. Filter by **Resource type** = **Kubernetes services**.
3. Verify you see recommendations for your AKS clusters.

## Common verification issues

### Sensor pods not running

If sensor pods are not running:

```bash
# Check pod events
kubectl describe pods -n kube-system -l app=microsoft-defender

# Check resource constraints
kubectl top nodes
kubectl top pods -n kube-system
```

### No security alerts

If you're not seeing security alerts:
- Ensure diagnostic logs are enabled
- Verify Log Analytics workspace connection
- Check that runtime protection is enabled in Defender settings

### Missing recommendations

If recommendations are missing:
- Verify Azure Policy add-on is enabled
- Wait up to 24 hours for initial assessment
- Check that agentless discovery is enabled

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
- [Troubleshoot common issues](defender-for-containers-troubleshooting.md)