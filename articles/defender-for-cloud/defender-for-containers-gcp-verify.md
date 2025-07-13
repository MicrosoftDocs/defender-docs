---
title: Verify Defender for Containers deployment on GCP (GKE)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on GCP (GKE)

After enabling Defender for Containers, use this guide to verify all components are functioning correctly on your GKE clusters.

## Validation checklist

Complete these verification steps in order:

- [ ] [GCP connector shows as connected](#verify-connector-status)
- [ ] [GKE clusters connected to Arc](#verify-arc-connection)
- [ ] [Defender sensor pods running](#verify-sensor-deployment)
- [ ] [Registry integration working](#verify-container-image-scanning)
- [ ] [Audit logs flowing](#verify-data-collection)
- [ ] [Test alert generated](#test-security-detection)
- [ ] [Recommendations appearing](#verify-security-recommendations)
- [ ] [No errors in logs](#check-component-logs)

> [!TIP]
> If any validation step fails, see the troubleshooting section for that component.

## Verify connector status

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your GCP connector.
1. Verify the following:
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

1. In Azure portal, navigate to **Microsoft Defender for Cloud** > **Inventory**.
1. Filter by **Resource type** = **Kubernetes service**.
1. Verify your GKE clusters appear in the list.

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

### Check GKE audit logs

```bash
# Verify audit logging is enabled
gcloud container clusters describe CLUSTER_NAME \
    --zone ZONE \
    --format="value(loggingConfig)"

# Check logs in Cloud Logging
gcloud logging read "resource.type=k8s_cluster AND protoPayload.methodName=~'pods'" \
    --limit 10 \
    --format json
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
1. Look for "Container registry images should have vulnerability findings resolved".
1. Select the recommendation to view detailed findings.

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

## Verify security recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.
1. Filter by **Resource type** = **Kubernetes service**.
1. Look for GKE-specific recommendations:
   - "GKE clusters should use Workload Identity"
   - "Binary Authorization should be enabled on GKE clusters"
   - "GKE clusters should have Private clusters enabled"

## Check component logs

### Defender sensor logs

```bash
# View recent logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=100

# Check for errors
kubectl logs -n kube-system -l app=microsoft-defender | grep -i error

# Check specific pod
kubectl describe pod -n kube-system $(kubectl get pods -n kube-system -l app=microsoft-defender -o jsonpath='{.items[0].metadata.name}')
```

### Arc agent logs

```bash
# Check Arc connectivity
kubectl logs -n azure-arc deployment/clusterconnect-agent

# Extension manager logs
kubectl logs -n azure-arc deployment/extension-agent
```

## Performance validation

### Check resource usage

```bash
# Check Defender sensor resource usage
kubectl top pods -n kube-system -l app=microsoft-defender

# Monitor over time
watch kubectl top pods -n kube-system -l app=microsoft-defender
```

### Expected resource consumption

Typical resource usage per node:

- **CPU**: < 100m (0.1 core)
- **Memory**: < 200Mi
- **Network**: Minimal, only for telemetry

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

## Common verification issues

### Connector shows disconnected

1. Verify service account permissions:

   ```bash
   gcloud projects get-iam-policy PROJECT_ID \
       --flatten="bindings[].members" \
       --filter="bindings.members:serviceAccount:microsoft-defender*"
   ```

1. Check API enablement:

   ```bash
   gcloud services list --enabled | grep -E "(container|asset|registry)"
   ```

### No security alerts

If you're not seeing security alerts:

1. Ensure audit logging is enabled on GKE clusters
1. Verify Defender sensor pods are running
1. Check that runtime protection is enabled in connector settings
1. Wait 5-10 minutes after generating test events

### Missing vulnerability scans

For missing vulnerability scans:

1. Verify registry permissions are configured
1. Check that images have been pushed recently
1. Ensure vulnerability scanning is enabled in Artifact Registry
1. Wait up to 4 hours for initial scans

### Clusters not appearing

If GKE clusters aren't showing:

1. Verify K8S API access is enabled in connector
1. Check service account has `container.viewer` role
1. Ensure clusters are in the connected GCP project
1. Wait 15-30 minutes for discovery

## Monitor deployment health

### Set up monitoring alerts

1. Navigate to **Microsoft Defender for Cloud** > **Alerts**.
1. Configure alert rules for:
   - Defender sensor failures
   - Arc connectivity issues
   - High vulnerability counts

### Configure email notifications

1. Go to **Environment settings** > **Email notifications**.
1. Set up notifications for:
   - High severity alerts
   - Weekly security summaries
   - Compliance reports

## Next steps

- [Configure advanced settings](defender-for-containers-gcp-configure.md)
- [Remove Defender for Containers](defender-for-containers-gcp-remove.md)
