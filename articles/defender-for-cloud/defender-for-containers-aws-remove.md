---
title: Remove Defender for Containers from AWS (EKS)
description: Learn how to remove Microsoft Defender for Containers components from your Amazon EKS clusters and disable the service.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Remove Defender for Containers from AWS (EKS)

This article explains how to remove Defender for Containers from your EKS clusters and AWS environment. Follow these steps when you need to completely uninstall the service or troubleshoot deployment issues.

When you enable Defender for Containers capabilities that use automatic provisioning, or use recommendations to manually deploy container capabilities on specific resources, you install Defender components and extensions in your environment. To help you keep track of these components, the following sections provide tables that show the Defender for Clouds feature and its installed Defender for Container components, extensions, and roles.

If you decide to stop using those capabilities, you might also want to remove these components from your environment. This article helps you understand the actions you can take to remove them.

The components and roles fall under two removal-type categories:

- **Safe to remove** - Resources and settings exclusively used by Defender for Containers. You can safely remove these resources if you're no longer using the associated capability.
- **Shared component** - Resources that might be used by non-Defender for Cloud solutions or by other Defender for Cloud solutions in the target cloud environment. If you disable a shared resource, the other solutions might be negatively affected. Before removing these resources, review if other solutions in that cloud environment need the resource.

## AWS scenarios

### Resources created with CloudFormation script

| Offering                                                     | Resource                                    | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------- | ------------------------------------------------------------ | ------------------- |
| Agentless Container Vulnerability Assessment                 | **MDCContainersImageAssessmentRole**        | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Shared between three containers offerings:<br/><br/>  Container runtime threat protection   <br/><br/>  Auto provision Defender's sensor for Azure Arc  <br/><br/> Auto provision Azure Policy extension for Azure Arc | MDCContainersK8sRole                        | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Container runtime threat protection                          | **MDCContainersK8sDataCollectionRole**      | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Container runtime threat protection                          | **MDCContainersK8sCloudWatchToKinesisRole** | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Container runtime threat protection                          | **MDCContainersK8sKinesisToS3RoleName**     | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Agentless discovery for Kubernetes                           | **MDCContainersAgentlessDiscoveryK8sRole**  | [Deleting   roles or instance profiles - AWS Identity and Access Management (amazon.com)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html) | Safe to remove      |
| Identity provider required for all Defender for Cloud components | **ASCDefendersOIDCIdentityProvider**        | **Delete only if removing all Defender for Cloud components.** Retrieve a list the provider clients, using the [AWS IAM API](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html). Use the AWS IAM [console](https://console.aws.amazon.com/iam/) or [CLI](https://docs.aws.amazon.com/IAM/latest/UserGuide/iam_example_iam_DeleteOpenIdConnectProvider_section.html) to delete the provider. | Shared component    |

### Resources created automatically after connector creation - AWS

| Offering                                                     | Resource                                                     | Manual offboarding                                           | Removal information |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------- |
| Container runtime threat protection                          | S3                                                           | [Deleting   a bucket - Amazon Simple Storage Service](https://docs.aws.amazon.com/AmazonS3/latest/userguide/delete-bucket.html)   This resource is created for each cluster.   Naming convention:   `azuredefender-<Region Name>-<AWS Account Id>-<Cluster Name>` | Safe to remove      |
| Container runtime threat protection                          | SQS                                                          | [Deleting   an Amazon SQS queue - Amazon Simple Queue Service](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/step-delete-queue.html)   This resource is created for each cluster.   Naming convention:   `azuredefender-<Region Name>-<AWS Account Id>-<Cluster Name>` | Safe to remove      |
| Container runtime threat protection                          | [Kinesis   Data firehose (Amazon Kinesis Data Streams)](https://docs.aws.amazon.com/firehose/latest/APIReference/API_DeleteDeliveryStream.html) | For each cluster, [delete   the Amazon Kinesis Delivery stream](https://docs.aws.amazon.com/cli/latest/reference/firehose/delete-delivery-stream.html)  This resource is created for each cluster.   Naming convention:   `arn:aws:firehose:< AWS Region>:< AWS Account Id>:deliverystream/azuredefender-<  Cluster Name>` | Safe to remove      |
| Workload runtime threat protection  <br/><br/>  Kubernetes data plane hardening | Azure Arc enabled Kubernetes (Connects your EKS clusters to Azure) | Remove Azure Arc-enabled Kubernetes for each cluster via the [Azure CLI or Azure PowerShell](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources)     Running this command deletes all Arc related resources       including extensions | Safe to remove      |
| Workload runtime threat protection                           | Defender  sensor                                             | Remove the Defender sensor for each cluster using the [Azure portal, Azure CLI, or REST API](#remove-extensions-from-eks-clusters) | Safe to remove      |
| Kubernetes data plane hardening                              | Azure Policy extension                                       | Remove Defender extensions for each cluster using the [Azure portal, Azure CLI, or REST API](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources) | Safe to remove      |

## Remove extensions from EKS clusters

### Remove extensions using Azure CLI

```azurecli
az k8s-extension delete \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

To remove the Azure Policy extension:

```azurecli
az k8s-extension delete \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

## Disconnect clusters from Azure Arc

```azurecli
az connectedk8s delete \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --yes
```

## Disable Defender plan

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. On the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

## Delete AWS connector

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Find your AWS connector.

1. Select the **...** (more options) menu.

1. Select **Delete**.

1. Confirm deletion.

## Verify removal

### Check Azure resources

```azurecli
az k8s-extension list \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>
```

### Check EKS clusters

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

No pods should be returned after successful removal.

## Related content

- [Deploy Defender for Containers](defender-for-containers-aws-enable-portal.md) - To re-enable protection
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md).
- [Defender for Containers overview](defender-for-containers-aws-overview.md) - Learn about capabilities
