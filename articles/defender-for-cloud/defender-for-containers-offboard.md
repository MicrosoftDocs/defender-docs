---
title: Defender for Containers - inventory & offboarding resources
description: Learn how to take inventory of resources and handle the offboarding process in Microsoft Defender for Containers for efficient management.
ms.topic: how-to
ms.date: 05/07/2024
---

# Offboarding Microsoft Defender for Containers resources 

When you enable Defender for Containers capabilities that use automatic provisioning, or use recommendations to manually deploy container capabilities on specific resources, Defender components and extensions are installed in your environment. To help you keep track of these components, we provide tables in the subsequent sections of this article. These tables show the Defender for Clouds feature and its installed Defender for Container components, extensions, and roles.

If you decide to stop using those capabilities, you might also want to remove such components from your environment. This article assists you in understanding the actions that can be taken to remove them.

The components and roles fall under two removal-type categories:

- **Safe to remove** - Resources and settings exclusively used by Defender for Containers, and can be safely removed if you're no longer using the associated capability.
- **Shared component** - Resources that may be used by other Defender solutions in the target Cloud environment, and not exclusively by Defender for Containers. If a shared resource is disabled, the other solutions may be negatively affected. Before removing, you should review if other Defender solutions in that cloud environment need the resource before removing it.

## Azure scenarios for resources created automatically after enabling Defender for Containers on the subscription

| Offering | Resource |Manual offboarding | Removal information |
|---|---|---|---|
| Defender sensor | Defender sensor (per cluster inside project) + Arc for Kubernetes | [Defender sensor removal](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-cli%2Caks-removeprofile-api&pivots=defender-for-container-arc&preserve-view=true#use-the-azure-cli-to-remove-the-defender-sensor) | Safe to remove |

## AWS scenarios

### Resources created via CloudFormation script

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Agentless Container Vulnerability  Assessment                | MDCContainersImageAssessmentRole                             | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Vulnerability Assessment powered by Qualys (deprecated)      | DefenderForContainersVaRole   DefenderForContainersVaTaskRole | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Shared between three containers offerings:<br />   <li>  Agentless threat protection   <br />  <li> Auto provision Defender's sensor for Azure Arc  <br /><li> Auto provision Azure Policy extension for Azure Arc | MDCContainersK8sRole                                         | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Agentless threat protection                                  | MDCContainersK8sDataCollectionRole                           | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Agentless threat protection                                  | MDCContainersK8sCloudWatchToKinesisRole                      | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Agentless threat protection                                  | MDCContainersK8sKinesisToS3RoleName                          | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Agentless discovery for Kubernetes                           | MDCContainersAgentlessDiscoveryK8sRole                       | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Identity provider required for all Defender for Cloud components | ASCDefendersOIDCIdentityProvider                         | **Don't Delete** - use [Update Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-direct.html) to remove unnecessary components. | Shared component                    |

### Resources created automatically after connector creation - AWS

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Agentless threat protection                                  | S3                                                           | [Deleting   a bucket - Amazon Simple Storage Service](https://docs.aws.amazon.com/AmazonS3/latest/userguide/delete-bucket.html)   This is created per cluster.   Naming convention:   `azuredefender-<Region Name>-<AWS Account Id>-<Cluster Name>` | Safe to remove      |
| Agentless threat protection                                  | SQS                                                          | [Deleting   an Amazon SQS queue - Amazon Simple Queue Service](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/step-delete-queue.html)   This is created per cluster.   Naming convention:   `azuredefender-<Region Name>-<AWS Account Id>-<Cluster Name>` | Safe to remove      |
| Agentless threat protection                                  | [Kinesis   Data firehose (Amazon Kinesis Data Streams)](https://docs.aws.amazon.com/firehose/latest/APIReference/API_DeleteDeliveryStream.html) | For each cluster, [delete   the Amazon Kinesis Delivery stream](https://docs.aws.amazon.com/cli/latest/reference/firehose/delete-delivery-stream.html)  This is created per cluster.   Naming convention:   `arn:aws:firehose:< AWS Region>:< AWS Account Id>:deliverystream/azuredefender-<  Cluster Name>` | Safe to remove      |
| <li> Auto provision Defender's sensor for  Azure Arc    <br />  <li>  Auto provision Azure Policy extension for Azure Arc | Azure    Arc enabled Kubernetes (Connects your EKS clusters to Azure) | This offering is  created per cluster.      You can remove Azure Arc-enabled Kubernetes via Azure CLI or Azure PowerShell:  [Cleanup Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources)     Running this command deletes all Arc related resources       including extensions | Safe to remove      |
| Auto provision Defender's sensor for  Azure Arc              | Defender  sensor                                             | This offering is created per cluster.        You can remove the Defender sensor using the Azure portal, Azure CLI, or       REST API: [Remove the Defender sensor](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |
| Auto provision Azure Policy extension  for Azure Arc         | Azure Policy extension                                       | This offering is created per cluster.        You can remove Defender extensions using the Azure portal, Azure       CLI, or REST API: [Remove the Defender extension](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |

## GCP scenarios

### Resource created via script

| Offering                                                     | Resource                                                 | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | -------------------------------------------------------- | ------------------------------------------------------------ | ------------------- |
| Agentless threat protection                                  | logging.googleapis.com                                  | [Disable GCP API](https://cloud.google.com/service-usage/docs/enable-disable#disabling) | Shared component    |
| Agentless threat protection                                  | Data Access audit logs configuration                     | [Disable data access audit logs](https://cloud.google.com/logging/docs/audit/configure-data-access) for the Kubernetes Engine API | Shared component    |
| Agentless threat protection <br /> Auto provision Defender's sensor for Azure Arc <br /> Auto provision Azure Policy extension for Azure Arc | ms-defender-containers (Service Account)                 | [Delete   gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Agentless threat protection                                  | ms-defender-containers-stream (Service Account)          | [Delete gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Agentless discovery for Kubernetes                           | mdc-containers-k8s-operator stream  (Service Account)    | [Delete gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Agentless Container Vulnerability  Assessment                | mdc-containers-artifact-assess stream  (Service Account) | [Delete gcloud IAM service-accounts](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete) | Safe to remove      |
| Agentless threat protection                                  | MicrosoftDefenderContainersDataCollectionRole            | [gcloud iam roles delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/iam/roles/delete) | Safe to remove      |
| Agentless threat protection                                  | MicrosoftDefenderContainersRole                          | [gcloud iam roles delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/iam/roles/delete) | Safe to remove      |
| Agentless discovery for Kubernetes                           | MDCGkeClusterWriteRole                                   | [gcloud iam roles delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/iam/roles/delete) | Safe to remove      |
| Shared between all five Containers  offerings.               | containers OIDC workload identity pool  provider         | [Manage workload identity pools and providers](https://cloud.google.com/iam/docs/manage-workload-identity-pools-providers#iam-workload-pools-delete-gcloud) | Safe to remove      |
| Agentless threat protection                                  | containers-streams OIDC workload identity  pool provider | [Manage workload identity pools and providers](https://cloud.google.com/iam/docs/manage-workload-identity-pools-providers#iam-workload-pools-delete-gcloud) | Safe to remove      |
| Agentless threat protection <br/> Auto provision Defender's sensor for Azure Arc <br/> Auto provision Azure Policy extension for Azure Arc <br/> Agentless discovery for Kubernetes | container.googleapis.com                                 | [Disable GCP API](https://cloud.google.com/service-usage/docs/enable-disable#disabling) | Shared component    |

### Resources created automatically after connector creation - GCP

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Agentless threat protection                                  | Pub/Sub Topic                                                | [gcloud   pubsub articles delete](https://cloud.google.com/sdk/gcloud/reference/pubsub/topics/delete); For each cluster in a project a topic is created  with the prefix: "MicrosoftDefender-" | Safe to remove      |
| Agentless threat protection                                  | Pub/sub Subscription                                         | [gcloud   pubsub subscription delete](https://cloud.google.com/sdk/gcloud/reference/pubsub/subscriptions/delete); For each cluster in a project a subscription  is created with the prefix: "MicrosoftDefender-" | Safe to remove      |
| Agentless threat protection                                  | SINK                                                         | [gcloud   logging sinks delete  \| Google Cloud CLI Documentation](https://cloud.google.com/sdk/gcloud/reference/logging/sinks/delete) | Safe to remove      |
| Defender sensor                                              | Defender sensor (per cluster inside project)  + Arc for Kubernetes | [Defender sensor removal](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-cli%2Caks-removeprofile-api&pivots=defender-for-container-arc&preserve-view=true#use-the-azure-cli-to-remove-the-defender-sensor) |                     |
| Auto provision Defender's sensor for  Azure Arc      or       Auto provision Azure Policy extension for Azure Arc | Azure    Arc enabled Kubernetes (Connects your GKE clusters to Azure) | This offering is  created per cluster.      You can remove Azure Arc-enabled Kubernetes via Azure CLI or Azure PowerShell:  [Cleanup Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources)     Running this command deletes all arc related resources       including extensions | Safe to remove      |
| Auto provision Defender's sensor for  Azure Arc              | Defender    Sensor                                           | This offering is created per cluster.        You can remove Defender sensor using the Azure portal, Azure CLI, or REST API: [Remove the Defender sensor](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |
| Auto provision Azure Policy extension  for Azure Arc         | Azure Policy extension                                       | This offering is created per cluster.        You can remove Defender extensions using the Azure portal, Azure       CLI, or REST API: [Remove the Defender extension](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |

## Related content

- Learn how to [enable Defender for Containers](defender-for-containers-enable.md).
- View the [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)