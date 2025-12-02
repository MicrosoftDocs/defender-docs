---
title: Verify Defender for Containers Deployment on Arc-Enabled Kubernetes
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Microsoft Defender for Containers deployment on Arc-enabled Kubernetes

After you enable Microsoft Defender for Containers, use this article to verify all components are functioning correctly on your Arc-enabled clusters.

## Validation checklist

Complete these verification steps in order:

- [ ] [Arc connection is healthy](#verify-arc-connection)
- [ ] [Defender extension shows as installed](#verify-defender-extension)
- [ ] [Sensor pods are running](#verify-sensor-deployment)
- [ ] [Recommendations appearing](#verify-security-insights)


## Verify Arc connection

### Using Azure CLI

```azurecli
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query connectivityStatus
```

The output should show `Connected`.

## Verify Defender extension

### Check extension status

```azurecli
az k8s-extension show \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --query provisioningState
```

The output should show `Succeeded`.

### Verify extension in Azure portal

1. In your Arc-enabled cluster, go to **Extensions**.

1. Verify both extensions show as **Succeeded**:
   - Microsoft Defender for Containers
   - Azure Policy for Kubernetes (if deployed)

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Screenshot that shows the Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

1. Select each extension to view configuration details:

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Screenshot that shows full details of an Azure Arc extension on a Kubernetes cluster.":::

## Verify sensor deployment

After deployment, verify the sensor is running:

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

All pods should show a status of `Running`. All nodes should have a running sensor pod within 5-10 minutes.

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

To verify that your Defender for Containers deployment works correctly, simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Related content

- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
