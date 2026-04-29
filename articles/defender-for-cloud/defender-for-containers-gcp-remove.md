---
title: Remove Defender for Containers from GCP (GKE)
description: Learn how to disable and remove Microsoft Defender for Containers from your GKE clusters.
ms.topic: how-to
ms.date: 11/27/2025
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

### Resources created via script

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
| Workload runtime threat protection                                       | Defender sensor (per cluster in a project)  + Arc for Kubernetes | [Defender sensor removal](#remove-defender-components-from-gke-clusters) | Safe to remove     |
| Workload runtime threat protection  <br/><br/>Kubernetes data plane hardening | Azure    Arc enabled Kubernetes (Connects your GKE clusters to Azure) | Remove Azure Arc-enabled Kubernetes per cluster via [Azure CLI or Azure PowerShell](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources). Running this command deletes all arc related resources       including extensions | Safe to remove      |
| Workload runtime threat protection  <br/><br/>Kubernetes data plane hardening         | Azure Policy extension                                       | Remove Defender extensions per cluster using the [Azure portal, Azure CLI, or REST API](#remove-defender-components-from-gke-clusters) | Safe to remove      |

## Disable Defender for Containers

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your GCP connector.
1. Select **Settings**.
1. Toggle **Containers** to **Off**.
1. Select **Save**.

### Clean up GCP resources


```bash
# Delete service account
   gcloud iam service-accounts delete <service-account-email>
   
   # Disconnect clusters from Arc
   az connectedk8s delete --name <cluster-name> --resource-group <rg>
```


## Remove Defender components from GKE clusters

### Remove the Defender extension

```azurecli
az k8s-extension delete \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

## Disconnect GKE clusters from Azure Arc

```azurecli
az connectedk8s delete \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

## Delete the GCP connector

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Find your GCP connector.

1. Select the **...** (more options) menu.

1. Select **Delete**.

1. Confirm deletion.

## Verify removal

### Check GKE cluster

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No pods should be returned after successful removal.

### Check Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Verify the GCP connector is removed or shows Containers as disabled.
1. Check that no GKE-related recommendations appear.

## Re-enable Defender for Containers

To re-enable Defender for Containers:

1. Follow the deployment guide: [Enable all Defender for Containers components on GCP (GKE)](defender-for-containers-gcp-enable-portal.md)
1. Recreate service accounts and permissions
1. Reconnect clusters to Azure Arc
1. Redeploy the Defender sensor

All security features are restored, but historical data during the disabled period is missing.

## Related content

- [Deploy Defender for Containers](defender-for-containers-gcp-enable-portal.md) - To re-enable protection
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md).
- [Learn about GKE security best practices](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster)
