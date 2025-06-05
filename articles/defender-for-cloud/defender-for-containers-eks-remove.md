---
title: Remove Defender for Containers from AWS (EKS)
description: Learn how to disable and remove Microsoft Defender for Containers from your EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Remove Defender for Containers from AWS (EKS)

This article explains how to disable and remove Defender for Containers from your AWS EKS environment.

> [!IMPORTANT]
> Disabling Defender for Containers removes security protection from your EKS clusters. Ensure you have alternative security measures in place before proceeding.

## Disable Defender for Containers plan

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Select your AWS connector.
3. Select **Settings**.
4. Toggle **Containers** to **Off**.
5. Select **Save**.

### Using Azure CLI

```azurecli
# Disable Defender for Containers on AWS connector
az security pricing create \
    --name 'Containers' \
    --tier 'Free' \
    --scope "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Security/securityConnectors/{connector-name}"
```

## Remove Defender components from EKS clusters

### Remove the Defender sensor

```bash
# Delete the Defender sensor DaemonSet
kubectl delete daemonset microsoft-defender-sensor -n kube-system

# Delete ConfigMaps
kubectl delete configmap microsoft-defender-config -n kube-system
kubectl delete configmap microsoft-defender-eks-config -n kube-system

# Delete ServiceAccount and RBAC
kubectl delete serviceaccount microsoft-defender -n kube-system
kubectl delete clusterrole microsoft-defender
kubectl delete clusterrolebinding microsoft-defender

# Delete any remaining Defender resources
kubectl delete all -l app=microsoft-defender -n kube-system
```

### Remove ECR integration

If you configured ECR scanning:

```bash
# Remove cross-account role
aws iam delete-role-policy \
    --role-name DefenderForCloudECRRole \
    --policy-name DefenderForCloudECRPolicy

aws iam delete-role \
    --role-name DefenderForCloudECRRole

# Remove ECR scanning configuration
aws ecr put-registry-scanning-configuration \
    --scan-type BASIC
```

### Remove CloudWatch integration

```bash
# Delete CloudWatch namespace
kubectl delete namespace amazon-cloudwatch

# Remove IAM service account
eksctl delete iamserviceaccount \
    --name cloudwatch-agent \
    --namespace amazon-cloudwatch \
    --cluster <cluster-name>
```

## Clean up AWS resources

### Remove IAM roles and policies

```bash
# List all Defender-related IAM roles
aws iam list-roles --query "Roles[?contains(RoleName, 'DefenderForCloud')]"

# Delete each role (after removing attached policies)
aws iam detach-role-policy \
    --role-name <role-name> \
    --policy-arn <policy-arn>

aws iam delete-role --role-name <role-name>
```

### Remove CloudFormation stacks

If you used CloudFormation for deployment:

```bash
# List Defender-related stacks
aws cloudformation list-stacks \
    --query "StackSummaries[?contains(StackName, 'DefenderForContainers')]"

# Delete stacks
aws cloudformation delete-stack --stack-name <stack-name>
```

## Clean up Azure resources

### Delete the AWS connector

```azurecli
# Delete the AWS connector
az security connector delete \
    --name <connector-name> \
    --resource-group <resource-group>
```

### Remove policy assignments

```azurecli
# List policy assignments
az policy assignment list \
    --query "[?contains(displayName, 'EKS') || contains(displayName, 'AWS')]"

# Delete assignments
az policy assignment delete --name <assignment-name>
```

## Verify removal

### Check EKS cluster

```bash
# Verify no Defender components remain
kubectl get all --all-namespaces | grep defender

# Check for any remaining ConfigMaps
kubectl get configmap --all-namespaces | grep defender

# Verify no Defender-related pods are running
kubectl get pods --all-namespaces | grep defender
```

### Check AWS resources

```bash
# Verify IAM roles are removed
aws iam list-roles | grep -i defender

# Verify CloudFormation stacks are deleted
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE | grep -i defender
```

### Check Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
2. Verify the AWS connector shows Containers as disabled or is removed.
3. Check that no EKS-related recommendations appear.

## Data retention

> [!NOTE]
> Historical security data remains according to your retention policies:
> - Azure: Data in Log Analytics workspace (default 30 days)
> - AWS: CloudWatch logs (based on your retention settings)

To remove historical data:

### Azure Log Analytics

```kusto
// Identify tables with EKS data
search * 
| where TimeGenerated > ago(1d)
| where _ResourceId contains "eks"
| distinct $table
```

### AWS CloudWatch

```bash
# Delete log groups
aws logs delete-log-group --log-group-name /aws/eks/<cluster-name>/cluster
```

## Re-enable Defender for Containers

To re-enable Defender for Containers in the future:

1. Follow the deployment guide: [Deploy Defender for Containers on AWS (EKS)](defender-for-containers-eks-deploy.md)
2. All security features will be restored
3. Historical data (if not purged) will remain available

## Next steps

- [Deploy Defender for Containers on AWS (EKS)](defender-for-containers-eks-deploy.md)
- [Learn about Defender for Containers features](defender-for-containers-eks-overview.md)
- [Explore alternative security solutions](https://aws.amazon.com/security/)