---
title: Verify Defender for Containers deployment on GCP (GKE)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your GKE clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Defender for Containers deployment on GCP (GKE)

After you enable Defender for Containers, use this article to verify all components are functioning correctly on your GKE clusters.

## Validation checklist

Complete these verification steps in order:

- [ ] [GCP connector shows as connected](#verify-connector-status)
- [ ] [GKE clusters connected to Arc](#verify-arc-connection)
- [ ] [Defender sensor pods running](#verify-sensor-deployment)
- [ ] [Data collection working](#verify-data-collection)
- [ ] [Alerts appearing](#view-alerts-for-gke-clusters)

> [!TIP]
> If any validation step fails, see [Common verification issues](#common-verification-issues) or [Configure advanced settings](defender-for-containers-gcp-configure.md) for troubleshooting guidance.

## Verify connector status

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your GCP connector.
1. Verify the following values:
   - Connection status shows as **Connected**.
   - Last sync time is recent (within 15 minutes).
   - Containers plan shows as **On**.

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

## Verify Arc connection

### Check GKE clusters in Arc

```azurecli
# List Arc-connected GKE clusters
az connectedk8s list \
    --resource-group <resource-group> \
    --query "[?contains(name, 'gke')]"

# Check specific cluster status
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query connectivityStatus
```

### Verify from GKE cluster

```bash
# Check Arc agents
kubectl get pods -n azure-arc

# Verify Arc operators
kubectl get deployments -n azure-arc

# Check connectivity
kubectl logs -n azure-arc -l app.kubernetes.io/component=connect-agent --tail=50
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

1. In Azure portal, go to **Microsoft Defender for Cloud** > **Inventory**.
1. Set the filter for **Resource type** to **Kubernetes service**.
1. Make sure your GKE clusters appear in the list.

### Query security data

```kusto
// Check if GKE cluster data is being received
SecurityAlert
| where TimeGenerated > ago(1h)
| where ResourceId contains "gke"
| summarize count() by AlertName
| take 10

// Verify cluster events
KubeEvents
| where TimeGenerated > ago(1h)
| where ClusterName contains "gke"
| summarize count() by ClusterName, Namespace
```

## View alerts for GKE clusters

To view security alerts specifically for your GKE clusters:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select the :::image type="icon" source="media/defender-for-containers-enable-plan-gke/add-filter.png" border="false"::: button.

1. On the **Filter** dropdown menu, select **Resource type**.

1. On the **Value** dropdown menu, select **GCP GKE Cluster**.

1. Select **Ok**.

You should now see only alerts related to your GKE clusters, making it easier to focus on GCP-specific security issues.

## GCP-specific verification

### Verify Workload Identity

```bash
# Check service account annotation
kubectl get serviceaccount -n kube-system defender-sensor -o yaml | grep iam.gke.io

# Verify IAM binding
gcloud iam service-accounts get-iam-policy \
    microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com
```

### Check Binary Authorization

```bash
# Verify Binary Authorization is enabled
gcloud container binauthz policy export | grep evaluationMode

# Check attestors
gcloud container binauthz attestors list
```

## Test security detection

To verify that your Defender for Containers deployment is working correctly, you can simulate security alerts. These simulations trigger real alerts without causing harm to your clusters.

For detailed instructions on generating test alerts and simulating various threat scenarios, see [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

## Common verification issues

### Connector shows disconnected

1. Verify service account permissions.

   ```bash
   gcloud projects get-iam-policy PROJECT_ID \
       --flatten="bindings[].members" \
       --filter="bindings.members:serviceAccount:microsoft-defender*"
   ```

1. Check API enablement.

   ```bash
   gcloud services list --enabled | grep -E "(container|asset|registry)"
   ```

### No security alerts

If you don't see security alerts:

1. Ensure audit logging is enabled on GKE clusters.
1. Verify Defender sensor pods are running.
1. Check that runtime protection is enabled in connector settings.
1. Wait 5-10 minutes after generating test events.

### Missing vulnerability scans

For missing vulnerability scans:

1. Verify registry permissions are configured.
1. Check that you recently pushed images.
1. Ensure you enabled vulnerability scanning in Artifact Registry.
1. Wait up to four hours for initial scans.

### Clusters not appearing

If GKE clusters don't appear:

1. Verify that K8S API access is enabled in the connector.
1. Check that the service account has the `container.viewer` role.
1. Ensure clusters are in the connected GCP project.
1. Wait 15-30 minutes for discovery.

## Related content

- [Configure advanced settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
