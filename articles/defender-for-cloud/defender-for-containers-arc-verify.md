---
title: Verify Defender for Containers Deployment on Arc-Enabled Kubernetes
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Microsoft Defender for Containers deployment on Arc-enabled Kubernetes

After you enable Defender for Containers, use this article to verify all components are functioning correctly on your Arc-enabled clusters.

## Validation checklist

Complete these verification steps in order:

- [ ] [Arc connection is healthy](#verify-arc-connection)
- [ ] [Defender extension shows as installed](#verify-defender-extension)
- [ ] [Sensor pods are running](#verify-sensor-deployment)
- [ ] [Recommendations appearing](#verify-security-insights)


## Verify Arc connection

### Check Arc agent status

```bash
# Check Arc agent pods
kubectl get pods -n azure-arc

# Verify Arc operators
kubectl get deployments -n azure-arc

# Check connectivity status
kubectl logs -n azure-arc -l app.kubernetes.io/component=connect-agent --tail=50
```

### Using Azure CLI

```azurecli
# Verify cluster connection
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query connectivityStatus
```

## Verify Defender extension

### Check extension status

```azurecli
# Get extension details
az k8s-extension show \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>

# Check provisioning state
az k8s-extension show \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --query provisioningState
```

### Verify extension components

```bash
# List Defender pods
kubectl get pods -n mdc

# Check DaemonSet
kubectl get daemonset -n mdc

# Expected output:
# NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE
# microsoft-defender-sensor   5         5         5       5            5
```

### Verify extension deployment

1. In your Arc-enabled cluster, go to **Extensions**.

1. Verify both extensions show as **Succeeded**:
   - Microsoft Defender for Containers
   - Azure Policy for Kubernetes (if deployed)

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Screenshot that shows the Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

1. Select each extension to view configuration details:

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Screenshot that shows full details of an Azure Arc extension on a Kubernetes cluster.":::

## Verify sensor deployment

### Check sensor health

```bash
# View sensor logs
kubectl logs -n mdc -l app=microsoft-defender --tail=100

# Check for errors
kubectl logs -n mdc -l app=microsoft-defender | grep -i error

# Describe pods for issues
kubectl describe pods -n mdc -l app=microsoft-defender
```

### Verify resource consumption

```bash
# Check CPU and memory usage
kubectl top pods -n mdc

# View resource requests and limits
kubectl describe daemonset -n mdc microsoft-defender-sensor | grep -A 5 Resources
```

### Verify sensor deployment

After deployment, verify the sensor is running:

```bash
# Check sensor pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check DaemonSet status
kubectl get daemonset -n kube-system microsoft-defender-sensor
```

All nodes should have a running sensor pod within 5-10 minutes.

### Check sensor pods

```bash
# List all Defender pods
kubectl get pods -n mdc -l app=microsoft-defender

# Check pod logs for any errors
kubectl logs -n mdc -l app=microsoft-defender --tail=50
```

## Verify security insights

### Check recommendations

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.
1. Set the filter for **Resource type** to **Kubernetes services (Azure Arc)**.
1. Make sure recommendations appear for your clusters.

### Review inventory

1. Go to **Inventory** > **Containers**.
1. Set the filter for **Environment** to **Azure Arc**.
1. Confirm your clusters are listed with security status.

### View security insights

After deployment completes:

1. **Inventory**: See all your Arc-enabled clusters and their security status.

1. **Recommendations**: View Arc-specific security recommendations:
   - Kubernetes API servers should be accessible only through private endpoints
   - Kubernetes clusters should use RBAC
   - Container images should come from trusted registries

1. **Security alerts**: Monitor runtime threats and suspicious activities.

### Monitor deployment progress

1. Go to **Microsoft Defender for Cloud** > **Workload protections**.

1. Select **Containers**.

1. Wait 15-30 minutes for your Arc-enabled clusters to appear.

## Test security detection

To verify that your Defender for Containers deployment is working correctly, you can simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Related content

- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
