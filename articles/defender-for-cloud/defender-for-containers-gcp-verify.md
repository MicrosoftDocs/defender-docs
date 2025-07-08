---
title: Verify Defender for Containers deployment on GCP (GKE)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on GCP (GKE)

After enabling Defender for Containers, verify that all components are properly deployed and functioning.

## Verify connector status

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Select your GCP connector.
3. Verify the following:
   - Connection status shows as **Connected**
   - Last sync time is recent (within 15 minutes)
   - Containers plan shows as **On**

### Using Azure CLI

```azurecli
# Check connector status
az security connector show \
    --name <connector-name> \
    --resource-group <resource-group>

# Check pricing tier
az security pricing show \
    --name 'Containers' \
    --scope "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Security/securityConnectors/{connector-name}"
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Check if the Defender sensor DaemonSet is running
kubectl get daemonset -n kube-system | grep defender

# Expected output:
# microsoft-defender-sensor   3         3         3       3            3           <none>          5m
```

### Check pod status

```bash
# List Defender pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Verify all pods are running
kubectl get pods -n kube-system -l app=microsoft-defender -o wide

# Check pod logs for any errors
kubectl logs -n kube-system -l app=microsoft-defender --tail=100
```

### Verify webhook configuration

```bash
# Check validating webhook
kubectl get validatingwebhookconfigurations | grep defender

# View webhook details
kubectl describe validatingwebhookconfiguration microsoft-defender-webhook
```

## Verify data collection

### Check cluster inventory

1. In Azure portal, navigate to **Microsoft Defender for Cloud** > **Inventory**.
2. Filter by **Resource type** = **Kubernetes service**.
3. Verify your GKE clusters appear in the list.

### Check security recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.
2. Filter by **Resource type** = **Kubernetes service**.
3. Look for recommendations specific to your GKE clusters.

### Query data in Azure

```kusto
// Check if GKE cluster data is being received
SecurityAlert
| where TimeGenerated > ago(1h)
| where ResourceId contains "gke"
| summarize count() by AlertName
| take 10
```

## Verify container image scanning

### For Google Container Registry (GCR)

```bash
# List images in GCR
gcloud container images list --repository=gcr.io/PROJECT_ID

# Check vulnerability scanning status
gcloud container images describe gcr.io/PROJECT_ID/IMAGE:TAG \
    --show-package-vulnerability
```

### For Artifact Registry

```bash
# List vulnerabilities for an image
gcloud artifacts docker images scan IMAGE_URI \
    --remote

# View scan results
gcloud artifacts docker images list-vulnerabilities IMAGE_URI
```

### Check scanning results in Azure

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.
2. Look for "Container registry images should have vulnerability findings resolved".
3. Select the recommendation to view detailed findings.

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
    -- /bin/bash -c "cat /etc/shadow"
```

Check for the alert in Defender for Cloud within 5-10 minutes.

### Verify runtime protection

```bash
# Check if runtime protection is active
kubectl exec -n kube-system -it $(kubectl get pods -n kube-system -l app=microsoft-defender -o jsonpath='{.items[0].metadata.name}') -- defender-sensor status
```

## Configure monitoring

### Set up alerts

1. In Azure portal, navigate to **Microsoft Defender for Cloud** > **Alerts**.
2. Configure alert rules for your GKE clusters based on your security requirements.

### Enable email notifications

1. In Azure portal, go to **Microsoft Defender for Cloud** > **Settings** > **Email notifications**.
2. Configure email notifications for security alerts and recommendations.

## Check extension status in portal

Navigate to your Arc-enabled cluster to see installed extensions:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

View detailed extension information:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Full details of an Azure Arc extension on a Kubernetes cluster.":::

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md) - If you need to uninstall