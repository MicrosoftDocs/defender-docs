---
title: Remove Defender for Containers from AWS (EKS)
description: Learn how to remove Microsoft Defender for Containers components from your Amazon EKS clusters and disable the service.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from AWS (EKS)

This article explains how to remove Defender for Containers from your EKS clusters and AWS environment. Follow these steps when you need to completely uninstall the service or troubleshoot deployment issues.

## Remove order

To properly remove Defender for Containers, follow this order:

1. Remove Kubernetes extensions from clusters
2. Disconnect clusters from Azure Arc
3. Remove AWS IAM roles and policies
4. Disable Defender plan in Azure
5. Delete AWS connector (optional - only if not using other Defender plans)

> [!IMPORTANT]
> If you're using the AWS connector for other Defender plans (like Defender for Servers), skip step 5. The connector can be shared across multiple Defender plans.

## Remove extensions from EKS clusters

### Remove using Azure CLI

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

### Remove using kubectl

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

### Using Azure CLI

```azurecli
# Disconnect cluster from Arc
az connectedk8s delete \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --yes
```

### Using kubectl

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

Remove IAM roles created for Defender:

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

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your subscription.

1. On the Defender plans page, toggle **Containers** to **Off**.

1. Select **Save**.

### Using Azure CLI

```azurecli
# Disable Containers plan
az security pricing create \
    --name "Containers" \
    --subscription $SUBSCRIPTION_ID \
    --tier "Free"
```

## Delete AWS connector

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Find your AWS connector.

1. Select the **...** (more options) menu.

1. Select **Delete**.

1. Confirm deletion.

### Using Azure CLI

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

## Clean up Log Analytics data

### Delete custom workspace (optional)

If you created a dedicated workspace:

```azurecli
# Delete workspace
az monitor.log-analytics.workspace delete \
    --workspace-name <workspace-name> \
    --resource-group <resource-group> \
    --yes
```

### Remove data from existing workspace

To remove historical data while keeping the workspace:

```kusto
// Run in Log Analytics workspace
// Note: This permanently deletes data
.purge table ContainerLog where ClusterName contains "eks"
.purge table ContainerInventory where ClusterName contains "eks"
.purge table SecurityAlert where ResourceId contains "eks"
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

After removing Defender for Containers, your security posture changes significantly. Runtime threat detection stops immediately, leaving your clusters without real-time protection against active threats. Container image vulnerability scanning ceases, meaning new vulnerabilities in your ECR repositories won't be identified. Security recommendations will no longer be updated, potentially leaving configuration weaknesses unaddressed. Additionally, compliance reporting stops, which may impact your ability to demonstrate adherence to regulatory requirements.

### Alternative security solutions

Consider implementing alternative security measures to maintain protection for your EKS clusters. AWS GuardDuty for EKS provides native threat detection capabilities within the AWS ecosystem. Open source solutions like Falco offer runtime security monitoring, while Open Policy Agent (OPA) can help enforce security policies. Commercial container security platforms from vendors like Aqua Security, Sysdig, or Prisma Cloud provide comprehensive alternatives. Evaluate these options based on your security requirements, budget, and operational preferences.

### Data retention

Understanding data retention is important for compliance and forensic purposes. Security alerts generated by Defender for Containers remain accessible in Azure for 90 days after removal, allowing time for investigation or compliance audits. Log Analytics workspace data follows your configured retention settings, which can range from 30 to 730 days. Security recommendations are cleared from the portal within 24 hours of removal but may be retained in exported reports or SIEM systems.

## Re-enabling Defender

To re-enable Defender for Containers:

1. Wait at least 30 minutes after complete removal
2. Follow the deployment guide from the beginning
3. Use new IAM role names if previous ones were recent

## Related content

- [Deploy Defender for Containers](defender-for-containers-aws-enable-all-portal.md) - To re-enable protection
- [Offboard Microsoft Defender for Containers](defender-for-containers-offboard.md)
- [Defender for Containers overview](defender-for-containers-aws-overview.md) - Learn about capabilities
