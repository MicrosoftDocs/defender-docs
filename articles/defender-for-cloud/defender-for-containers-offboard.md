---
title: Offboarding Defender for Containers resources
description: Learn how to offboard Microsoft Defender for Containers resources for the supported Cloud environments.
ms.topic: how-to
ms.date: 05/07/2024
---

# Offboarding Microsoft Defender for Containers resources 

When you enable Defender for Containers capabilities that use automatic provisioning, or use recommendations to manually deploy container capabilities on specific resources, Defender components and extensions are installed in your environment. To help you keep track of these components, we provide tables in the subsequent sections of this article. These tables show the Defender for Clouds feature and its installed Defender for Container components, extensions, and roles.

If you decide to stop using those capabilities, you might also want to remove such components from your environment. This article assists you in understanding the actions that can be taken to remove them.

The components and roles fall under two removal-type categories:

- **Safe to remove** - Resources and settings exclusively used by Defender for Containers, and can be safely removed if you're no longer using the associated capability.
- **Shared component** - Resources might be used by non-Defender for Cloud solutions or by other Defender for Cloud solutions in the target cloud environment. If a shared resource is disabled, the other solutions might be negatively affected. Before removing, you should review if other solutions in that cloud environment need the resource before removing it.

## Azure scenarios for resources created automatically after enabling Defender for Containers on the subscription

| Offering | Resource |Manual offboarding | Removal information |
|---|---|---|---|
| Workload runtime thread protection | Defender sensor (per cluster inside project) + Arc for Kubernetes | [Defender sensor removal](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-cli%2Caks-removeprofile-api&pivots=defender-for-container-arc&preserve-view=true#use-the-azure-cli-to-remove-the-defender-sensor) | Safe to remove |
| Kubernetes data plane hardening | Azure Policy for Kubernetes | [Delete Arc-enabled resources](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources) | Safe to remove |

## AWS scenarios

### Resources created via CloudFormation script

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Agentless Container Vulnerability Assessment                | **MDCContainersImageAssessmentRole**                             | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Shared between three containers offerings:<br/><br/>  Container runtime threat protection   <br/><br/>  Auto provision Defender's sensor for Azure Arc  <br/><br/> Auto provision Azure Policy extension for Azure Arc | MDCContainersK8sRole                                         | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Container runtime threat protection                                  | **MDCContainersK8sDataCollectionRole**                           | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Container runtime threat protection                                  | **MDCContainersK8sCloudWatchToKinesisRole**                      | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Container runtime threat protection                                  | **MDCContainersK8sKinesisToS3RoleName**                          | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Agentless discovery for Kubernetes                           | **MDCContainersAgentlessDiscoveryK8sRole**                       | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Identity provider required for all Defender for Cloud components | **ASCDefendersOIDCIdentityProvider**                         | **Delete only if removing all Defender for Cloud components.** Retrieve a list the provider clients, using the [AWS IAM API](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html). Use the AWS IAM [console](https://console.aws.amazon.com/iam/) or [CLI](https://docs.aws.amazon.com/IAM/latest/UserGuide/iam_example_iam_DeleteOpenIdConnectProvider_section.html) to delete the provider.  | Shared component                    |

### Resources created automatically after connector creation - AWS

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Container runtime threat protection                                  | S3                                                           | [Deleting   a bucket - Amazon Simple Storage Service](https://docs.aws.amazon.com/AmazonS3/latest/userguide/delete-bucket.html)   This is created per cluster.   Naming convention:   `azuredefender-<Region Name>-<AWS Account Id>-<Cluster Name>` | Safe to remove      |
| Container runtime threat protection                                  | SQS                                                          | [Deleting   an Amazon SQS queue - Amazon Simple Queue Service](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/step-delete-queue.html)   This is created per cluster.   Naming convention:   `azuredefender-<Region Name>-<AWS Account Id>-<Cluster Name>` | Safe to remove      |
| Container runtime threat protection                                  | [Kinesis   Data firehose (Amazon Kinesis Data Streams)](https://docs.aws.amazon.com/firehose/latest/APIReference/API_DeleteDeliveryStream.html) | For each cluster, [delete   the Amazon Kinesis Delivery stream](https://docs.aws.amazon.com/cli/latest/reference/firehose/delete-delivery-stream.html)  This is created per cluster.   Naming convention:   `arn:aws:firehose:< AWS Region>:< AWS Account Id>:deliverystream/azuredefender-<  Cluster Name>` | Safe to remove      |
| Workload runtime threat protection  <br/><br/>  Kubernetes data plane hardening | Azure Arc enabled Kubernetes (Connects your EKS clusters to Azure) | Remove Azure Arc-enabled Kubernetes per cluster via the [Azure CLI or Azure PowerShell](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources)     Running this command deletes all Arc related resources       including extensions | Safe to remove      |
| Workload runtime threat protection           | Defender  sensor                                             | Remove the Defender sensor per cluster using the [Azure portal, Azure CLI, or REST API](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |
| Kubernetes data plane hardening         | Azure Policy extension                                       |  Remove Defender extensions per cluster using the [Azure portal, Azure CLI, or REST API](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources) | Safe to remove      |

## GCP scenarios

### Resource created via script

| Offering                                                     | Resource                                                 | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | -------------------------------------------------------- | ------------------------------------------------------------ | ------------------- |
| Workload runtime threat protection                                  | **logging.googleapis.com** API                               | The GCP Logging API might be used by non-Defender for Cloud clients in your project. Use the [GCP Logging API](https://cloud.google.com/sdk/gcloud/reference/logging/logs/list) to see if it is in use by other clients. Use the [GCP Logging API](https://cloud.google.com/service-usage/docs/enable-disable#disabling) to disable it. | Shared component  |
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

## Related content

- Learn how to [enable Defender for Containers](defender-for-containers-enable.md).
- View the [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)