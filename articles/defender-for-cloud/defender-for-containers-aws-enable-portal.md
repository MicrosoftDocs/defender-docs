---
title: Enable Defender for Containers on AWS (EKS) via portal
description: Learn how to enable Microsoft Defender for Containers on your Amazon EKS clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable Defender for Containers on AWS (EKS) via portal

This article shows you how to enable Microsoft Defender for Containers on your Amazon EKS clusters through the Azure portal. You can choose to enable all security features at once for comprehensive protection, or selectively deploy specific components based on your requirements.

## When to use this guide

Use this guide if you want to:

- Set up Defender for Containers on AWS for the first time
- Enable all security features for comprehensive protection
- Selectively deploy specific components
- Fix or add missing components to an existing deployment
- Deploy using a controlled, selective approach
- Exclude certain clusters from protection

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

AWS-specific requirements:

- AWS account with appropriate permissions
- Active EKS clusters (version 1.19+)
- Container images in Amazon ECR
- AWS CLI installed and configured
- Outbound HTTPS connectivity from EKS to Azure

## Create AWS connector

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-environment-settings.png" alt-text="Screenshot showing how to connect an AWS account to Microsoft Defender for Cloud." lightbox="media/quickstart-onboard-aws/add-aws-account-environment-settings.png":::

## Configure connector details

1. In the **Account details** section, enter:
   - **Account alias**: A descriptive name for your AWS account
   - **AWS account ID**: Your 12-digit AWS account identifier
   - **Resource group**: Select or create a resource group

1. Select **Next: Select plans**.

## Enable Defender for Containers features

1. In the **Select plans** page, toggle **Containers** to **On**.

    :::image type="content" source="media/tutorial-enable-containers-aws/aws-containers-enabled.png" alt-text="Screenshot of enabling Defender for Containers for an AWS connector." lightbox="media/tutorial-enable-containers-aws/aws-containers-enabled.png":::

1. Select **Configure** to access the plan settings.

1. Choose your deployment approach:
   - **Enable all components** (recommended): Enable all features for comprehensive protection
   - **Enable specific components**: Select only the components you need

   Available components:
   - **Agentless discovery for Kubernetes** - Discovers all EKS clusters
   - **Agentless container vulnerability assessment** - Scans ECR images
   - **Defender DaemonSet** - Runtime threat detection
   - **Azure Policy for Kubernetes** - Security recommendations

1. Select **Continue** and **Next: Configure access**.

## Set up AWS permissions

1. Download the CloudFormation template from the portal.

1. Deploy the CloudFormation stack in AWS:
   - Open AWS CloudFormation console
   - Create a new stack with the downloaded template
   - Review and create the stack

1. After stack creation completes, copy the Role ARN from the stack outputs.

1. Return to Azure portal and paste the Role ARN.

1. Select **Next: Review and create**.

1. Review your configuration and select **Create**.

## Deploy all components

Follow these steps to enable comprehensive protection for all your EKS clusters.

### Connect EKS clusters to Azure Arc

After creating the connector:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about EKS clusters that need Arc connection.

1. Follow the recommendation to connect your clusters.

1. Use the provided scripts to connect each cluster to Azure Arc.

### Deploy the Defender sensor

After connecting your EKS clusters to Azure Arc, deploy the Defender sensor:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about installing the Defender extension on Arc-enabled clusters.

1. Select the recommendation and follow the remediation steps.

1. The sensor provides runtime threat detection for your clusters.

> [!NOTE]
> You can also deploy the Defender sensor using Helm for more control over the deployment configuration. For Helm deployment instructions, see [Deploy Defender sensor using Helm](defender-for-containers-aws-enable-programmatically.md#deploy-defender-sensor).

### Configure ECR vulnerability scanning

1. Go to your AWS connector settings.

1. Select **Configure** next to the Containers plan.

1. Verify **Agentless container vulnerability assessment** is enabled.

1. Images pushed to ECR are automatically scanned within 24 hours.

### Enable audit logging

Enable audit logging for each EKS cluster:

```bash
# Enable audit logs
aws eks update-cluster-config \
    --name <cluster-name> \
    --logging '{"clusterLogging":[{"types":["audit","authenticator"],"enabled":true}]}'
```

## Deploy specific components (optional)

If you need selective deployment or to fix issues with existing deployments:

### Deploy Defender sensor to specific clusters

To deploy the sensor only to selected EKS clusters:

1. First connect specific clusters to Azure Arc (not all clusters).

1. Go to **Recommendations** and find "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for selected clusters only.

### Deploy components for existing clusters

If you have clusters with missing or failed components:

#### Check component status

1. Go to **Inventory** > filter by AWS resources.

1. Check each EKS cluster for:
   - Arc connectivity status
   - Defender extension status
   - Policy extension status

#### Fix Arc connectivity issues

For clusters showing as disconnected:

1. Re-run the Arc connection script.

1. Verify network connectivity from cluster to Azure.

1. Check Arc agent logs: `kubectl logs -n azure-arc -l app.kubernetes.io/component=cluster-agent`

#### Fix sensor deployment issues

For clusters missing the Defender sensor:

1. Verify Arc connection is healthy.

1. Check for conflicting policies or admission controllers.

1. Deploy manually if needed: Use remediation from the recommendation.

### Configure ECR scanning for specific registries

To scan only specific ECR registries:

1. In the connector configuration, enable **Agentless container vulnerability assessment**.

1. Use AWS IAM policies to limit scanner access to specific registries.

1. Tag registries to include/exclude from scanning.

### Deploy Azure Policy extension selectively

To deploy policy assessment only to specific clusters:

1. After Arc connection, go to **Policy** > **Definitions**.

1. Search for "Configure Azure Policy extension on Arc-enabled Kubernetes".

1. Create an assignment scoped to specific resource groups or clusters.

1. Verify deployment: `kubectl get pods -n kube-system -l app=azure-policy`

### Configure audit logging for specific clusters

Enable audit logging selectively:

```bash
# For specific cluster
aws eks update-cluster-config \
    --name <specific-cluster> \
    --logging '{"clusterLogging":[{"types":["audit"],"enabled":true}]}'
```

## Verify deployment

### Check connector health

1. Go to **Environment settings**.

1. Select your AWS connector.

1. Verify:
   - Status: **Connected**
   - Last sync: Recent timestamp
   - Discovered resources count

### View discovered resources

1. Go to **Inventory**.

1. Filter by **Environment** = **AWS**.

1. Make sure you see:
   - All EKS clusters (or only selected ones if deployed selectively)
   - ECR registries
   - Container images

### Check security coverage

1. Go to **Workload protections** > **Containers**.

1. The dashboard shows:
   - EKS clusters with protection status
   - Vulnerable images by severity
   - Recent security alerts

### Test security detection

Generate a test security alert:

```bash
# Connect to an EKS cluster
aws eks update-kubeconfig --name <cluster-name> --region <region>

# Trigger a test alert
kubectl run test-alert --image=nginx --rm -it --restart=Never -- sh -c "echo test > /etc/shadow"
```

Check for the alert in Defender for Cloud within 5-10 minutes.

## Monitor ongoing security

### Security dashboard

1. Go to **Workload protections** > **Containers**.

1. Monitor key metrics:
   - **Vulnerability trends**: Track ECR image vulnerabilities.
   - **Alert patterns**: Identify security issues.
   - **Compliance scores**: Monitor CIS benchmark adherence.
   - **Coverage gaps**: Find unprotected clusters.

### Configure notifications

1. Go to **Environment settings**.

1. Select **Email notifications**.

1. Configure:
   - Recipients for high-severity alerts.
   - Weekly security summaries.

### Review recommendations

1. Go to **Recommendations**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Priority recommendations:
   - Enable EKS control plane logging
   - Use IRSA for pod authentication
   - Implement network policies
   - Enable secrets encryption

### Monitor partial deployments

For selective deployments:

1. Track which clusters have protection.

1. Document reasons for exclusions.

1. Set reminders to review excluded resources.

1. Monitor unprotected clusters separately.

## Troubleshooting

### Deployment issues

If components fail to deploy:

1. **Check Arc connection**: Ensure clusters show as Connected
1. **Verify IAM role**: Confirm the role has all required permissions
1. **Review network**: Check outbound HTTPS connectivity
1. **Check quotas**: Verify AWS service quotas aren't exceeded

### Sensor pods not starting

```bash
# Check pod status
kubectl describe pods -n kube-system -l app=microsoft-defender

# Common issues:
# - Image pull errors: Check network connectivity
# - Permission denied: Verify RBAC settings
# - Resource constraints: Check node resources
```

### Arc extension stuck

```bash
# Check extension status
az k8s-extension show \
    --cluster-name <cluster-name> \
    --resource-group <rg> \
    --cluster-type connectedClusters \
    --name microsoft.azuredefender.kubernetes

# If stuck, delete and recreate
az k8s-extension delete \
    --cluster-name <cluster-name> \
    --resource-group <rg> \
    --cluster-type connectedClusters \
    --name microsoft.azuredefender.kubernetes
```

### ECR scanning not working

1. Verify IAM role has ECR permissions.

1. Check scanner can access registries.

1. Ensure images are in supported regions.

1. Review scanner logs in Log Analytics workspace.

### Common verification issues

- **Missing resources**: Wait 15-30 minutes for discovery
- **Partial coverage**: Check excluded resources configuration
- **No alerts**: Verify audit logging is enabled
- **Scan failures**: Check ECR permissions and network access

## Best practices

1. **Start with non-production**: Test on dev/test clusters first for selective deployment.
1. **Regular reviews**: Check the dashboard weekly.
1. **Alert response**: Investigate high-severity alerts promptly.
1. **Image hygiene**: Scan and update base images regularly.
1. **Compliance**: Address CIS benchmark failures.
1. **Access control**: Review IAM roles and RBAC permissions.
1. **Document exclusions**: Track why certain clusters are excluded in selective deployments.
1. **Deploy incrementally**: When using selective deployment, add one component at a time.
1. **Monitor each step**: Verify each component before proceeding to the next.

## Clean up resources

To disable Defender for Containers:

1. Go to your AWS connector.

1. Choose either:
   - Turn **Containers** **Off** to disable the plan
   - Delete the entire connector to remove all configurations

1. Remove AWS resources:
   - Delete the CloudFormation stack
   - Disconnect clusters from Arc

## Next steps

- [Configure advanced settings for EKS](defender-for-containers-aws-configure.md)
- [Verify deployment details](defender-for-containers-aws-verify.md)
- [Deploy programmatically](defender-for-containers-aws-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
