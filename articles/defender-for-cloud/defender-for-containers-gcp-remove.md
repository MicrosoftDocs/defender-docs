---
title: Remove Defender for Containers from GCP (GKE)
description: Learn how to disable and remove Microsoft Defender for Containers from your GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from GCP (GKE)

This article explains how to disable and remove Defender for Containers from your GCP GKE environment.

> [!IMPORTANT]
> Disabling Defender for Containers removes security protection from your GKE clusters. Ensure you have alternative security measures in place before proceeding.

## Disable Defender for Containers plan

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Select your GCP connector.
3. Select **Settings**.
4. Toggle **Containers** to **Off**.
5. Select **Save**.

### Using Azure CLI

```azurecli
# Disable Defender for Containers on GCP connector
az security pricing create \
    --name 'Containers' \
    --tier 'Free' \
    --scope "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Security/securityConnectors/{connector-name}"
```

## Remove Defender components from GKE clusters

### Remove the Defender sensor

```bash
# Delete the Defender sensor DaemonSet
kubectl delete daemonset microsoft-defender-sensor -n kube-system

# Delete ConfigMaps
kubectl delete configmap microsoft-defender-config -n kube-system
kubectl delete configmap microsoft-defender-gke-config -n kube-system
kubectl delete configmap microsoft-defender-scan-config -n kube-system

# Delete ServiceAccount and RBAC
kubectl delete serviceaccount defender-sa -n kube-system
kubectl delete clusterrole microsoft-defender
kubectl delete clusterrolebinding microsoft-defender

# Delete webhook configuration
kubectl delete validatingwebhookconfiguration microsoft-defender-webhook

# Delete any remaining Defender resources
kubectl delete all -l app=microsoft-defender --all-namespaces
```

### Remove Workload Identity bindings

```bash
# Remove Workload Identity binding
gcloud iam service-accounts remove-iam-policy-binding \
    defender-for-containers@PROJECT_ID.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:PROJECT_ID.svc.id.goog[kube-system/defender-sa]"
```

## Clean up GCP resources

### Remove IAM service account and permissions

```bash
# List IAM policy bindings for the service account
gcloud projects get-iam-policy PROJECT_ID \
    --flatten="bindings[].members" \
    --filter="bindings.members:serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com"

# Remove IAM policy bindings
gcloud projects remove-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/container.viewer"

gcloud projects remove-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/containerregistry.ServiceAgent"

gcloud projects remove-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/cloudasset.viewer"

# Delete the service account
gcloud iam service-accounts delete \
    defender-for-containers@PROJECT_ID.iam.gserviceaccount.com
```

### Remove Binary Authorization policies

If you configured Binary Authorization:

```bash
# Reset to default policy
cat > default-policy.yaml << EOF
admissionWhitelistPatterns:
- namePattern: gcr.io/PROJECT_ID/*
defaultAdmissionRule:
  evaluationMode: ALWAYS_ALLOW
  enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG
EOF

gcloud container binauthz policy import default-policy.yaml

# Delete attestor
gcloud container binauthz attestors delete defender-attestor
```

### Clean up logging and monitoring

```bash
# Delete log sinks
gcloud logging sinks delete defender-alerts

# Delete notification channels
gcloud alpha monitoring channels list --filter="displayName:Defender" --format="value(name)" | \
    xargs -I {} gcloud alpha monitoring channels delete {}
```

## Clean up Azure resources

### Delete the GCP connector

```azurecli
# Delete the GCP connector
az security connector delete \
    --name <connector-name> \
    --resource-group <resource-group>
```

### Remove policy assignments

```azurecli
# List policy assignments
az policy assignment list \
    --query "[?contains(displayName, 'GKE') || contains(displayName, 'GCP')]"

# Delete assignments
az policy assignment delete --name <assignment-name>
```

## Verify removal

### Check GKE cluster

```bash
# Verify no Defender components remain
kubectl get all --all-namespaces | grep defender

# Check for ConfigMaps
kubectl get configmap --all-namespaces | grep defender

# Verify webhook is removed
kubectl get validatingwebhookconfigurations | grep defender

# Check service accounts
kubectl get serviceaccount --all-namespaces | grep defender
```

### Check GCP resources

```bash
# Verify service account is removed
gcloud iam service-accounts list | grep defender

# Check IAM bindings
gcloud projects get-iam-policy PROJECT_ID | grep defender

# Verify log sinks are removed
gcloud logging sinks list | grep defender
```

### Check Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Verify the GCP connector shows Containers as disabled or is removed.
3. Check that no GKE-related recommendations appear.

## Data retention

> [!NOTE]
> Historical security data remains according to your retention policies:
> - Azure: Data in Log Analytics workspace (default 30 days)
> - GCP: Cloud Logging data (based on your retention settings)

To remove historical data:

### Azure Log Analytics

```kusto
// Identify tables with GKE data
search * 
| where TimeGenerated > ago(1d)
| where _ResourceId contains "gke"
| distinct $table
```

### GCP Cloud Logging

```bash
# Delete log entries
gcloud logging delete "resource.type=k8s_cluster AND resource.labels.cluster_name=CLUSTER_NAME" \
    --project=PROJECT_ID
```

## Restore vulnerability scanning to GCP defaults

If you want to continue using GCP's native vulnerability scanning:

```bash
# Re-enable GCP vulnerability scanning
gcloud artifacts repositories update REPOSITORY \
    --location=LOCATION \
    --enable-vulnerability-scanning

# Configure GCP scanning policies
gcloud container images scan IMAGE_URI
```

## Re-enable Defender for Containers

To re-enable Defender for Containers in the future:

1. Follow the deployment guide: [Deploy Defender for Containers on GCP (GKE)](defender-for-containers-gcp-deploy.md)
2. All security features will be restored
3. Historical data (if not purged) will remain available

## Next steps

- [Deploy Defender for Containers on GCP (GKE)](defender-for-containers-gcp-deploy.md)
- [Learn about Defender for Containers features](defender-for-containers-gcp-overview.md)
- [Explore alternative security solutions](https://cloud.google.com/security)