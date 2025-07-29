---
title: Deploy specific Defender for Containers components on AWS (EKS)
description: Learn how to deploy specific Microsoft Defender for Containers components on AWS EKS clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy specific Defender for Containers components on AWS (EKS)

This article explains how to deploy specific Defender for Containers components when you need selective deployment or to fix issues with existing deployments on AWS EKS clusters.

## When to use this guide

Use this guide when you need to:

- Deploy Defender to specific EKS clusters only (not all clusters)
- Fix components that failed during initial deployment
- Add components that were initially skipped
- Troubleshoot existing deployments
- Deploy using a selective, controlled approach

For complete deployment of all components, see [Enable all Defender for Containers components on AWS (EKS)](defender-for-containers-aws-enable-all-portal.md).

## Prerequisites

- AWS connector already created in Microsoft Defender for Cloud
- Defender for Containers plan enabled
- Appropriate AWS IAM permissions
- EKS clusters running version 1.19 or later
- Outbound HTTPS connectivity from clusters

## Deploy Defender sensor to specific clusters

The Defender sensor provides runtime protection for your EKS clusters:

### Deploy to specific EKS clusters

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "EKS clusters should have Microsoft Defender's extension for Azure Arc installed".

1. Select the recommendation.

1. Select specific EKS clusters where you want to deploy the sensor.

1. Select **Fix**.

1. Configure deployment options:
   - Log Analytics workspace
   - Resource limits
   - Monitoring scope

1. Select **Fix X resources**.

### Deploy via Arc portal

1. Navigate to your Arc-connected EKS cluster.

1. Select **Extensions** > **+ Add**.

1. Select **Microsoft Defender for Containers**.

1. Configure:
   - Enable runtime protection
   - Set resource allocation
   - Configure exclusions

1. Select **Create**.

### Verify sensor deployment

```bash
# Check pods
kubectl get pods -n kube-system -l app=microsoft-defender

# View logs
kubectl logs -n kube-system daemonset/microsoft-defender-sensor
```

## Deploy components for existing clusters

If you have clusters with missing or failed components:

### Check component status

1. Navigate to **Inventory** > **Containers**.

1. Filter by **Environment** = **AWS**.

1. Check the **Coverage** column to identify missing components:
   - 🔴 Red: Component missing or failed
   - 🟡 Yellow: Component partially deployed
   - 🟢 Green: Component healthy

### Fix Arc connectivity issues

For clusters showing as "Not connected to Arc":

1. Verify cluster accessibility:

   ```bash
   aws eks describe-cluster --name CLUSTER_NAME --region REGION
   kubectl get nodes
   ```

1. Re-run Arc connection:

   ```bash
   az connectedk8s connect --name CLUSTER_NAME \
       --resource-group RG_NAME \
       --location LOCATION
   ```

1. Check Arc agent status:

   ```bash
   kubectl get pods -n azure-arc
   ```

### Fix sensor deployment issues

If the sensor failed to deploy:

1. **Check for namespace issues**:

   ```bash
   kubectl get namespace kube-system
   kubectl get daemonset -n kube-system | grep defender
   ```

1. **Manually deploy sensor**:

   ```bash
   az k8s-extension create \
       --name microsoft.azuredefender.kubernetes \
       --extension-type microsoft.azuredefender.kubernetes \
       --cluster-name CLUSTER_NAME \
       --resource-group RG_NAME \
       --cluster-type connectedClusters
   ```

1. **Check for resource constraints**:

   ```bash
   kubectl describe nodes
   kubectl top nodes
   ```

## Configure ECR scanning for specific registries

### Enable scanning for selected repositories

1. Navigate to your AWS connector settings.

1. Select **Configure** next to Containers.

1. Under **Container registries**, select specific ECR repositories.

1. Apply IAM permissions only to selected repositories:

   ```json
   {
     "Version": "2012-10-17",
     "Statement": [{
       "Effect": "Allow",
       "Action": [
         "ecr:GetAuthorizationToken",
         "ecr:BatchCheckLayerAvailability",
         "ecr:GetDownloadUrlForLayer",
         "ecr:BatchGetImage"
       ],
       "Resource": [
         "arn:aws:ecr:REGION:ACCOUNT:repository/REPO1",
         "arn:aws:ecr:REGION:ACCOUNT:repository/REPO2"
       ]
     }]
   }
   ```

## Deploy Azure Policy extension selectively

To deploy Azure Policy to specific clusters only:

1. Navigate to the Arc-enabled EKS cluster.

1. Select **Extensions** > **+ Add**.

1. Search for **Azure Policy for Kubernetes**.

1. Configure:
   - Select specific namespaces to monitor
   - Choose policy enforcement mode
   - Set resource limits

1. Complete installation.

## Configure audit logging for specific clusters

Enable audit logging selectively:

```bash
# Enable for specific cluster
aws eks update-cluster-config \
    --name CLUSTER_NAME \
    --region REGION \
    --logging '{"clusterLogging":[{"types":["audit"],"enabled":true}]}'

# Verify logging is enabled
aws eks describe-cluster \
    --name CLUSTER_NAME \
    --region REGION \
    --query 'cluster.logging'
```

## Troubleshooting deployment issues

### Sensor pods not starting

1. **Check pod status**:

   ```bash
   kubectl describe pod -n kube-system POD_NAME
   ```

1. **Common issues**:
   - ImagePullBackOff: Check network connectivity
   - CrashLoopBackOff: Review pod logs
   - Pending: Check node resources

### Arc extension stuck

1. **Check extension state**:

   ```bash
   az k8s-extension show \
       --name microsoft.azuredefender.kubernetes \
       --cluster-name CLUSTER_NAME \
       --resource-group RG_NAME \
       --cluster-type connectedClusters
   ```

1. **Force reinstall**:

   ```bash
   az k8s-extension delete --name microsoft.azuredefender.kubernetes \
       --cluster-name CLUSTER_NAME \
       --resource-group RG_NAME \
       --cluster-type connectedClusters --yes

   # Wait 5 minutes, then recreate
   ```

### ECR scanning not working

1. **Verify IAM permissions**:

   ```bash
   aws iam get-role-policy --role-name DefenderForCloudRole \
       --policy-name ECRScanningPolicy
   ```

1. **Test connectivity**:

   ```bash
   aws ecr describe-repositories --region REGION
   ```

## Monitor partial deployments

### Set up alerts for deployment failures

1. Create CloudWatch alarm for failed deployments:

   ```bash
   aws cloudwatch put-metric-alarm \
       --alarm-name DefenderDeploymentFailure \
       --alarm-description "Alert on Defender deployment failures" \
       --metric-name FailedPodCount \
       --namespace ContainerInsights
   ```

### Track deployment progress

Use this KQL query in Log Analytics:

```kusto
KubeEvents
| where TimeGenerated > ago(1h)
| where ClusterName contains "eks"
| where Reason in ("FailedCreate", "FailedScheduling", "FailedMount")
| project TimeGenerated, ClusterName, Namespace, Reason, Message
```

## Best practices for selective deployment

1. **Start with non-production**: Test on dev/test clusters first
1. **Deploy incrementally**: Add one component at a time
1. **Monitor each step**: Verify each component before proceeding
1. **Document exclusions**: Track why certain clusters are excluded
1. **Regular reviews**: Periodically review partial deployments

## Next steps

- [Verify your deployment](defender-for-containers-aws-verify.md)
- [Configure advanced settings](defender-for-containers-aws-configure.md)
- [Enable all components](defender-for-containers-aws-enable-all-portal.md) - For comprehensive protection
- [Deploy sensor using Helm instead of Arc extension](deploy-helm.md)
