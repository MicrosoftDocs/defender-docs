---
title: Remove Defender for Containers from AWS (EKS)
description: Learn how to remove Microsoft Defender for Containers components from your Amazon EKS clusters and disable the service.
ms.topic: how-to
ms.date: 06/04/2025
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
| Workload runtime threat protection                           | Defender  sensor                                             | Remove the Defender sensor for each cluster using the [Azure portal, Azure CLI, or REST API](defender-for-containers-enable.md#remove-the-defender-sensor) | Safe to remove      |
| Kubernetes data plane hardening                              | Azure Policy extension                                       | Remove Defender extensions for each cluster using the [Azure portal, Azure CLI, or REST API](/azure/azure-arc/kubernetes/quickstart-connect-cluster?tabs=azure-cli#clean-up-resources) | Safe to remove      |

## Removal order

To properly remove Defender for Containers, follow this order:

1. Remove Kubernetes extensions from clusters
1. Disconnect clusters from Azure Arc
1. Remove AWS IAM roles and policies
1. Disable Defender plan in Azure
1. Delete AWS connector (optional - only if not using other Defender plans)

> [!IMPORTANT]
> If you use the AWS connector for other Defender plans (like Defender for Servers), skip step 5. You can share the connector across multiple Defender plans.

## Remove extensions from EKS clusters

### Remove extensions using Azure CLI

```azurecli
# Set variables
CLUSTER_NAME="<your-cluster-name>"
RESOURCE_GROUP="<your-resource-group>"

# Remove Defender sensor extension
az k8s-extension delete \
    --name microsoft-defender \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --yes

# Remove Azure Policy extension
az k8s-extension delete \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --yes
```

### Remove extensions by using kubectl

If Azure CLI removal fails, manually remove components:

```bash
# Remove Defender components
kubectl delete namespace mdc
kubectl delete clusterrolebinding azuredefender-sensor
kubectl delete clusterrole azuredefender-sensor

# Remove Policy components
kubectl delete namespace azurepolicy
kubectl delete namespace gatekeeper-system
kubectl delete clusterrolebinding azure-policy
kubectl delete clusterrole azure-policy
```

### Clean up remaining resources

```bash
# Remove any remaining ConfigMaps
kubectl delete configmap -n kube-system azure-defender-config

# Remove webhooks
kubectl delete validatingwebhookconfigurations gatekeeper-validating-webhook-configuration
kubectl delete mutatingwebhookconfigurations azure-policy-mutating-webhook-configuration
```

## Disconnect clusters from Azure Arc

### Disconnect by using Azure CLI

```azurecli
# Disconnect cluster from Arc
az connectedk8s delete \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --yes
```

### Remove Arc agents by using kubectl

If Azure CLI fails, manually remove Arc agents:

```bash
# Delete Arc namespace and all resources
kubectl delete namespace azure-arc

# Remove Arc cluster role bindings
kubectl delete clusterrolebinding azure-arc-operator
kubectl delete clusterrolebinding azure-arc-reader

# Remove Arc CRDs
kubectl get crd -o name | grep -i arc | xargs kubectl delete
```

## Remove AWS resources

### Delete IAM roles

Remove IAM roles that you created for Defender:

```bash
# List Defender-related roles
aws iam list-roles --query "Roles[?contains(RoleName, 'DefenderForCloud')]"

# Delete each role (first detach policies)
aws iam detach-role-policy \
    --role-name DefenderForCloud-Containers-K8s \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy

aws iam delete-role --role-name DefenderForCloud-Containers-K8s
aws iam delete-role --role-name DefenderForCloud-DataCollection
aws iam delete-role --role-name DefenderForCloud-ContainerVulnerabilityAssessment
```

### Delete CloudFormation stacks

If you used CloudFormation:

```bash
# List Defender-related stacks
aws cloudformation list-stacks \
    --query "StackSummaries[?contains(StackName, 'Defender')]"

# Delete stacks
aws cloudformation delete-stack --stack-name DefenderForContainers
aws cloudformation delete-stack --stack-name DefenderForContainersRoles
```

### Remove EKS cluster tags

Remove Defender-related tags:

```bash
# Remove exclusion tags if any
aws eks untag-resource \
    --resource-arn arn:aws:eks:region:account:cluster/cluster-name \
    --tag-keys ms_defender_container_exclude_agents ms_defender_container_exclude
```

## Disable Defender plan

### Disable using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. On the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

### Disable using Azure CLI

```azurecli
# Disable Containers plan
az security pricing create \
    --name "Containers" \
    --subscription $SUBSCRIPTION_ID \
    --tier "Free"
```

## Delete AWS connector

### Delete connector using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Find your AWS connector.

1. Select the **...** (more options) menu.

1. Select **Delete**.

1. Confirm deletion.

### Delete connector using Azure CLI

```azurecli
# Delete AWS connector
az security connector delete \
    --name <connector-name> \
    --resource-group <resource-group> \
    --yes

# Delete resource group if no longer needed
az group delete \
    --name <resource-group> \
    --yes
```

## Verify removal

### Check Azure resources

```azurecli
# Verify connector is deleted
az security connector list \
    --resource-group <resource-group>

# Verify Arc clusters are removed
az connectedk8s list \
    --resource-group <resource-group>

# Check for remaining extensions
az k8s-extension list \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

### Check EKS clusters

```bash
# Verify namespaces are removed
kubectl get namespace | grep -E "mdc|azurepolicy|azure-arc"

# Check for remaining CRDs
kubectl get crd | grep -E "defender|policy|arc"

# Verify no Defender pods running
kubectl get pods --all-namespaces | grep -E "defender|policy|arc"
```

### Check AWS resources

```bash
# Verify IAM roles are deleted
aws iam list-roles --query "Roles[?contains(RoleName, 'Defender')]"

# Check CloudFormation stacks
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE
```

## Troubleshooting removal

### Extension deletion stuck

If extension deletion hangs:

```bash
# Force delete the extension
az k8s-extension delete \
    --name microsoft-defender \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --force \
    --yes
```

### Arc disconnection fails

If Arc disconnection fails:

```bash
# Get Arc installation script
curl -o uninstall-arc.sh https://aka.ms/ArcK8sUninstallScript

# Run uninstall
bash uninstall-arc.sh
```

### Resources remain after deletion

Check for and remove:

```bash
# Finalizers preventing deletion
kubectl get namespace mdc -o json | jq '.spec.finalizers = []' | kubectl apply -f -

# Stuck webhooks
kubectl delete validatingwebhookconfigurations --all
kubectl delete mutatingwebhookconfigurations --all
```

## Post-removal considerations

### Security monitoring gaps

When you remove Defender for Containers, your security posture changes significantly. Runtime threat detection stops immediately, leaving your clusters without real-time protection against active threats. Container image vulnerability scanning ceases, so new vulnerabilities in your ECR repositories aren't identified. Security recommendations stop updating, which might leave configuration weaknesses unaddressed. Additionally, compliance reporting stops, which might affect your ability to demonstrate adherence to regulatory requirements.

### Alternative security solutions

To maintain protection for your EKS clusters, consider implementing alternative security measures. AWS GuardDuty for EKS provides native threat detection capabilities within the AWS ecosystem. Open source solutions like Falco offer runtime security monitoring, while Open Policy Agent (OPA) can help enforce security policies. Commercial container security platforms from vendors like Aqua Security, Sysdig, or Prisma Cloud provide comprehensive alternatives. Evaluate these options based on your security requirements, budget, and operational preferences.

### Data retention

Understanding data retention is important for compliance and forensic purposes. Security alerts generated by Defender for Containers remain accessible in Azure for 90 days after removal, allowing time for investigation or compliance audits. Log Analytics workspace data follows your configured retention settings, which can range from 30 to 730 days. Security recommendations clear from the portal within 24 hours of removal but might be retained in exported reports or SIEM systems.

## Re-enabling Defender

To re-enable Defender for Containers:

1. Wait at least 30 minutes after complete removal
1. Follow the deployment guide from the beginning
1. Use new IAM role names if previous ones were recent

## Related content

- [Deploy Defender for Containers](defender-for-containers-aws-enable-portal.md) - To re-enable protection
- [View the Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md).
- [Defender for Containers overview](defender-for-containers-aws-overview.md) - Learn about capabilities
