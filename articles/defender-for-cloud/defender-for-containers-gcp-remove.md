---
title: Remove Defender for Containers from GCP (GKE)
description: Learn how to disable and remove Microsoft Defender for Containers from your GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from GCP (GKE)

This article explains how to disable and remove Defender for Containers from your GCP GKE environment.

> [!IMPORTANT]
> Removing Defender for Containers eliminates security protection for your GKE clusters. Ensure you have alternative security measures in place before proceeding.

## Remove order

To properly remove Defender for Containers from GKE:

1. Remove Defender sensor from clusters
1. Disconnect clusters from Azure Arc
1. Remove GCP service accounts and permissions
1. Delete the GCP connector
1. Clean up remaining resources
1. Verify removal

## Disable Defender for Containers plan

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your GCP connector.
1. Select **Settings**.
1. Toggle **Containers** to **Off**.
1. Select **Save**.

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
kubectl delete validatingwebhookconfigurations microsoft-defender-webhook

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

# Remove service account annotation
kubectl annotate serviceaccount defender-sa -n kube-system \
    iam.gke.io/gcp-service-account-
```

## Disconnect GKE clusters from Azure Arc

### List Arc-connected clusters

```azurecli
# List all Arc-connected clusters
az connectedk8s list \
    --resource-group <resource-group> \
    --output table
```

### Disconnect each cluster

```bash
# For each cluster, disconnect from Arc
az connectedk8s delete \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --yes

# From the cluster, clean up Arc resources
kubectl delete namespace azure-arc
```

## Remove GCP resources

### Delete Service Account

```bash
# List Defender-related service accounts
gcloud iam service-accounts list --filter="displayName:Defender"

# Delete service account
gcloud iam service-accounts delete defender-for-containers@PROJECT_ID.iam.gserviceaccount.com --quiet

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

gcloud projects remove-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:defender-for-containers@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.reader"
```

### Remove GKE cluster labels

```bash
# Remove exclusion labels if any
gcloud container clusters update CLUSTER_NAME \
    --zone ZONE \
    --remove-labels=ms_defender_container_exclude_agents,ms_defender_container_exclude
```

### Remove Binary Authorization policies

If Binary Authorization was configured:

```bash
# List attestors
gcloud container binauthz attestors list

# Delete Defender attestor
gcloud container binauthz attestors delete defender-attestor

# Reset policy to default
echo "defaultAdmissionRule:
  evaluationMode: ALWAYS_ALLOW
  enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG" | \
gcloud container binauthz policy import -
```

## Clean up Azure resources

### Delete the GCP connector

```azurecli
# Delete the GCP connector
az security connector delete \
    --name <connector-name> \
    --resource-group <resource-group> \
    --yes
```

### Remove policy assignments

```azurecli
# List policy assignments
az policy assignment list \
    --query "[?contains(displayName, 'GKE') || contains(displayName, 'GCP')]"

# Delete assignments
az policy assignment delete --name <assignment-name>
```

### Clean up resource group (optional)

If the resource group was created solely for the GCP connector:

```azurecli
# Delete resource group
az group delete \
    --name <resource-group> \
    --yes
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

# Check Binary Authorization
gcloud container binauthz attestors list | grep defender
```

### Check Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Verify the GCP connector is removed or shows Containers as disabled.
1. Check that no GKE-related recommendations appear.
1. Verify no GKE clusters in **Inventory**.

## Data retention

Historical security data is retained according to your policies:

### Azure Log Analytics

```kusto
// Identify tables with GKE data
search * 
| where TimeGenerated > ago(1d)
| where _ResourceId contains "gke"
| distinct $table

// View retention settings
.show tables details
| where TableName contains "Security"
| project TableName, RetentionInDays
```

### GCP Cloud Logging

```bash
# Check log retention
gcloud logging buckets list

# Delete specific logs if needed
gcloud logging delete "resource.type=k8s_cluster AND resource.labels.cluster_name=CLUSTER_NAME" \
    --project=PROJECT_ID
```

## Post-removal considerations

### Security monitoring gaps

After removing Defender for Containers from your GKE environment, several security capabilities are lost. Runtime threat detection ceases immediately, leaving your clusters vulnerable to active attacks that would have been detected. Container image vulnerability scanning stops for images in GCR and Artifact Registry, meaning new vulnerabilities won't be identified. Security recommendations based on CIS GKE Benchmark and Google's best practices will no longer be generated. Compliance reporting capabilities are eliminated, which may impact your ability to demonstrate adherence to regulatory requirements. The unified view of security posture across your multi-cloud environment is lost.

### Alternative security solutions

Consider implementing alternative security measures for your GKE clusters. Google Cloud native options include Binary Authorization for deployment controls, Google Cloud Security Command Center for centralized security management, and Container Analysis API for vulnerability scanning. Open source alternatives include Falco for runtime security monitoring, Open Policy Agent (OPA) for policy enforcement, and Trivy or Clair for vulnerability scanning. Commercial solutions from vendors like Prisma Cloud, Aqua Security, or Sysdig provide comprehensive container security. Evaluate these alternatives based on your specific requirements for GKE integration, multi-cloud support, and existing tool compatibility.

### Maintaining security visibility

Without Defender for Containers, maintain security visibility through alternative means. Enable GKE audit logging and export to Cloud Logging for security analysis. Use Google Cloud Security Command Center for basic security insights. Implement Workload Identity for secure pod authentication. Configure Binary Authorization to control deployments. Set up alerts in Cloud Monitoring for security-relevant events. These native GCP features provide basic security controls while you evaluate comprehensive alternatives.

### Compliance and audit considerations

Document the removal date and reason for compliance records. Existing security alerts and vulnerability scan results remain in Microsoft Defender for Cloud for 90 days. Historical data in Log Analytics follows your configured retention policy. Export any required compliance reports before removal. Note that there will be a gap in security monitoring coverage that auditors may question. Consider implementing compensating controls to maintain compliance with relevant standards.

## Restore vulnerability scanning to GCP defaults

If you want to continue using GCP's native vulnerability scanning:

```bash
# Re-enable GCP vulnerability scanning
gcloud artifacts repositories update REPOSITORY \
    --location=LOCATION \
    --enable-vulnerability-scanning

# Configure GCP scanning policies
gcloud container images scan IMAGE_URI

# Set up vulnerability notifications
gcloud pubsub topics create vulnerability-notifications
```

## Re-enable Defender for Containers

To re-enable Defender for Containers in the future:

1. Follow the deployment guide: [Enable all Defender for Containers components on GCP (GKE)](defender-for-containers-gcp-enable-all-portal.md)
1. Recreate service accounts and permissions
1. Reconnect clusters to Azure Arc
1. Redeploy the Defender sensor

All security features will be restored, though historical data during the disabled period will be missing.

## Troubleshooting removal

### Arc disconnection fails

If Arc disconnection fails:

```bash
# Force delete Arc resources
kubectl delete namespace azure-arc --force --grace-period=0

# Clean up CRDs
kubectl get crd -o name | grep -i arc | xargs kubectl delete
```

### Service account deletion fails

If service account has active keys:

```bash
# List and delete all keys
gcloud iam service-accounts keys list \
    --iam-account=defender-for-containers@PROJECT_ID.iam.gserviceaccount.com

gcloud iam service-accounts keys delete KEY_ID \
    --iam-account=defender-for-containers@PROJECT_ID.iam.gserviceaccount.com
```

## Related content

- [Deploy Defender for Containers](defender-for-containers-gcp-enable-all-portal.md) - To re-enable protection
- [Offboard Microsoft Defender for Containers](defender-for-containers-offboard.md)
- [Learn about GKE security best practices](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster)
