---
title: Remove Defender for Containers from GCP (GKE)
description: Learn how to disable and remove Microsoft Defender for Containers from your GKE clusters.
ms.topic: how-to
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Remove Defender for Containers from GCP (GKE)

This article explains how to disable and remove Defender for Containers from your GCP GKE environment.

When you enable Defender for Containers capabilities that use automatic provisioning, or use recommendations to manually deploy container capabilities on specific resources, you install Defender components and extensions in your environment. To help you keep track of these components, the following sections provide tables that show the Defender for Clouds feature and its installed Defender for Container components, extensions, and roles.

If you decide to stop using those capabilities, you might also want to remove these components from your environment. This article helps you understand the actions you can take to remove them.

The components and roles fall under two removal-type categories:

- **Safe to remove** - Resources and settings exclusively used by Defender for Containers. You can safely remove these resources if you're no longer using the associated capability.
- **Shared component** - Resources that might be used by non-Defender for Cloud solutions or by other Defender for Cloud solutions in the target cloud environment. If you disable a shared resource, the other solutions might be negatively affected. Before removing these resources, review if other solutions in that cloud environment need the resource.

> [!IMPORTANT]
> Removing Defender for Containers eliminates security protection for your GKE clusters. Make sure you have alternative security measures in place before you proceed.

## GCP scenarios

### Resource created via script

| Offering                                                     | Resource                                                 | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | -------------------------------------------------------- | ------------------------------------------------------------ | ------------------- |
| Workload runtime threat protection                                  | **logging.googleapis.com** API                               | Non-Defender for Cloud clients in your project might use the GCP Logging API. Use the [GCP Logging API](https://cloud.google.com/sdk/gcloud/reference/logging/logs/list) to see if other clients use it. Use the [GCP Logging API](https://cloud.google.com/service-usage/docs/enable-disable#disabling) to disable it. | Shared component  |
| Workload runtime threat protection                                  | Data Access audit logs configuration                     | [Disable data access audit logs](https://cloud.google.com/logging/docs/audit/configure-data-access#config-console-disable) for the Kubernetes Engine API | Shared component    |
| Workload runtime threat protection  <br/><br/>  Kubernetes data plane hardening | **ms-defender-containers** (Service Account)                 | [Delete   gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Workload runtime threat protection                                  | **ms-defender-containers-stream** (Service Account)          | [Delete gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Agentless discovery for Kubernetes                           | **mdc-containers-k8s-operator stream**  (Service Account)    | [Delete gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Agentless Container Vulnerability  Assessment                | **mdc-containers-artifact-assess stream**  (Service Account) | [Delete gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Container runtime threat protection                                  | **MicrosoftDefenderContainersDataCollectionRole**            | [gcloud iam roles delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/iam/roles/delete) | Safe to remove      |
| Container runtime threat protection                                  | **MicrosoftDefenderContainersRole**                          | [gcloud iam roles delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/iam/roles/delete) | Safe to remove      |
| Agentless discovery for Kubernetes                           | **MDCGkeClusterWriteRole**                                   | [gcloud iam roles delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/iam/roles/delete) | Safe to remove      |
| Shared between all five Containers  offerings               | **containers** OIDC workload identity pool  provider         | [Manage workload identity pools and providers](https://cloud.google.com/iam/docs/manage-workload-identity-pools-providers#iam-workload-pools-delete-gcloud) | Safe to remove      |
| Workload runtime threat protection                                 | **containers-streams** OIDC workload identity  pool provider | [Manage workload identity pools and providers](https://cloud.google.com/iam/docs/manage-workload-identity-pools-providers#iam-workload-pools-delete-gcloud) | Safe to remove      |

### Resources created automatically after connector creation - GCP

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Workload runtime threat protection                                  | Pub/Sub Topic                                                | [gcloud   pubsub articles delete](https://cloud.google.com/sdk/gcloud/reference/pubsub/topics/delete) - Each cluster in a project has a topic with the prefix: `MicrosoftDefender-` | Safe to remove      |
| Workload runtime threat protection                                  | Pub/sub Subscription                                         | [gcloud   pubsub subscription delete](https://cloud.google.com/sdk/gcloud/reference/pubsub/subscriptions/delete) Each cluster in a project has a subscription with the prefix: `MicrosoftDefender-` | Safe to remove      |
| Workload runtime threat protection                                  | SINK                                                         | [gcloud   logging sinks delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/logging/sinks/delete) | Safe to remove      |
| Workload runtime threat protection                                       | Defender sensor (per cluster in a project)  + Arc for Kubernetes | [Defender sensor removal](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-cli%2Caks-removeprofile-api&pivots=defender-for-container-arc&preserve-view=true#use-the-azure-cli-to-remove-the-defender-sensor) | Safe to remove     |
| Workload runtime threat protection  <br/><br/>Kubernetes data plane hardening | Azure    Arc enabled Kubernetes (Connects your GKE clusters to Azure) | Remove Azure Arc-enabled Kubernetes per cluster via [Azure CLI or Azure PowerShell](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources). Running this command deletes all arc related resources       including extensions | Safe to remove      |
| Workload runtime threat protection  <br/><br/>Kubernetes data plane hardening         | Azure Policy extension                                       | Remove Defender extensions per cluster using the [Azure portal, Azure CLI, or REST API](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |

## Removal order

To properly remove Defender for Containers from GKE, complete the following steps:

1. Remove Defender sensor from clusters
1. Disconnect clusters from Azure Arc
1. Remove GCP service accounts and permissions
1. Delete the GCP connector
1. Clean up remaining resources
1. Verify removal

## Disable Defender for Containers

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
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

If you configured Binary Authorization:

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

If you created the resource group only for the GCP connector:

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

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
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

When you remove Defender for Containers from your GKE environment, you lose several security capabilities. Runtime threat detection stops right away, leaving your clusters vulnerable to active threats that would have been detected. Container image vulnerability scanning stops for images in GCR and Artifact Registry, so new vulnerabilities go unnoticed. Security recommendations based on CIS GKE Benchmark and Google's best practices no longer appear. Compliance reporting capabilities disappear, which might affect your ability to show adherence to regulatory requirements. The unified view of security posture across your multicloud environment is lost.

### Alternative security solutions

Consider implementing alternative security measures for your GKE clusters. Google Cloud native options include Binary Authorization for deployment controls, Google Cloud Security Command Center for centralized security management, and Container Analysis API for vulnerability scanning. Open source alternatives include Falco for runtime security monitoring, Open Policy Agent (OPA) for policy enforcement, and Trivy or Clair for vulnerability scanning. Commercial solutions from vendors like Prisma Cloud, Aqua Security, or Sysdig provide comprehensive container security. Evaluate these alternatives based on your specific requirements for GKE integration, multicloud support, and existing tool compatibility.

### Maintaining security visibility

Without Defender for Containers, use alternative methods to maintain security visibility. Enable GKE audit logging and export logs to Cloud Logging for security analysis. Use Google Cloud Security Command Center for basic security insights. Implement Workload Identity for secure pod authentication. Configure Binary Authorization to control deployments. Set up alerts in Cloud Monitoring for security-relevant events. These native GCP features provide basic security controls while you evaluate comprehensive alternatives.

### Compliance and audit considerations

Document the removal date and reason for compliance records. Existing security alerts and vulnerability scan results remain in Microsoft Defender for Cloud for 90 days. Historical data in Log Analytics follows your configured retention policy. Export any required compliance reports before removal. Note that a gap in security monitoring coverage exists that auditors might question. Consider implementing compensating controls to maintain compliance with relevant standards.

## Restore vulnerability scanning to GCP defaults

To continue using GCP's native vulnerability scanning:

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

To re-enable Defender for Containers:

1. Follow the deployment guide: [Enable all Defender for Containers components on GCP (GKE)](defender-for-containers-gcp-enable-portal.md)
1. Recreate service accounts and permissions
1. Reconnect clusters to Azure Arc
1. Redeploy the Defender sensor

All security features are restored, but historical data during the disabled period is missing.

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

- [Deploy Defender for Containers](defender-for-containers-gcp-enable-portal.md) - To re-enable protection
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md).
- [Learn about GKE security best practices](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster)
