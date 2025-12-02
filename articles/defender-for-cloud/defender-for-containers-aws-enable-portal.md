---
title: Enable Defender for Containers on AWS (EKS) via portal
description: Learn how to enable Microsoft Defender for Containers on your Amazon EKS clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
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

    :::image type="content" source="media/defender-for-kubernetes-intro/add-aws-environment.png" alt-text="Screenshot of selections for adding an AWS environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/add-aws-environment.png":::

## Configure connector details

1. In the **Account details** section, enter:
   - **Account alias**: A descriptive name for your AWS account
   - **AWS account ID**: Your 12-digit AWS account identifier
   - **Resource group**: Select or create a resource group

    :::image type="content" source="media/defender-for-kubernetes-intro/add-aws-account-details.png" alt-text="Screenshot of the form to fill in the account details for an AWS environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/add-aws-account-details.png":::

1. Select **Next: Select plans**.

## Enable Defender for Containers features

1. In **Select plans**, toggle **Containers** to **On**.

    :::image type="content" source="media/defender-for-kubernetes-intro/select-aws-connector.png" alt-text="Screenshot of an AWS connector in the Defender for Cloud environment settings." lightbox="media/defender-for-kubernetes-intro/select-aws-connector.png":::

1. Select **Settings** to access the plan configuration options.

    :::image type="content" source="media/defender-for-containers-enable-plan-eks/containers-threat-protection.png" alt-text="Screenshot of the settings for the Containers plan in the Defender for Cloud environment settings with Agentless threat protection highlighted." lightbox="media/defender-for-containers-enable-plan-eks/containers-threat-protection.png":::

1. Choose your deployment approach:

   **Option A: Enable all components (recommended)**

   For comprehensive protection, enable all features:
   - Set all toggles to **On**
   - This setting provides complete security coverage for your EKS environment

   **Option B: Enable specific components**

   Select only the components you need based on your requirements:

1. Configure the available components based on your chosen approach:

   - **Agentless threat protection**: Provides runtime protection to your cluster containers by sending Kubernetes audit logs to Microsoft Defender.
     - Set the toggle to **On** to enable
     - Configure the retention period for your audit logs
     - Discovers all EKS clusters in your AWS account
     > [!NOTE]
     > If you disable this configuration, control plane threat detection is disabled. Learn more about [feature availability](support-matrix-defender-for-containers.md).

   - **Kubernetes API access** (Agentless discovery for Kubernetes): Sets permissions to allow API-based discovery of your Kubernetes clusters.
     - Set the toggle to **On** to enable
     - Provides inventory and security posture assessment

   - **Registry access** (Agentless container vulnerability assessment): Sets permissions to allow vulnerability assessment of images stored in ECR.
     - Set the toggle to **On** to enable
     - Scans container images for known vulnerabilities

   - **Auto provision Defender's sensor for Azure Arc** (Defender DaemonSet): Automatically deploys the Defender sensor on Arc-enabled clusters for runtime threat detection.
     - Set the toggle to **On** to enable
     - Provides real-time security alerts for workload protection

    :::image type="content" source="media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc.png" alt-text="Screenshot of selections for enabling the Defender sensor for Azure Arc in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc.png":::

   > [!TIP]
   > - For production environments, we recommend enabling all components.
   > - For testing or gradual rollout, start with specific components and add more later.
   > - Azure Policy for Kubernetes is automatically deployed with the Defender sensor.

1. Select **Continue** and **Next: Configure access**.

## Set up AWS permissions

1. Follow the instructions on the **Configure access** page.

    :::image type="content" source="media/defender-for-kubernetes-intro/configure-access.png" alt-text="Screenshot of the page for configuring access for an AWS environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/configure-access.png":::

1. Download the CloudFormation template from the portal.

1. Deploy the CloudFormation stack in AWS:
   - Open AWS CloudFormation console
   - Create a new stack with the downloaded template
   - Review and create the stack

1. After stack creation completes, copy the role ARN from the stack outputs.

1. Return to Azure portal and paste the role ARN.

1. Select **Next: Review and create**.

1. Review your configuration and select **Create**.

## Deploy all components

> [!NOTE]
> If you selected to enable all components in the previous section, follow all the steps in this section. If you chose specific components, complete only the steps relevant to your selected features.

Follow these steps to enable protection based on your configuration:

### Grant control plane permissions

**Required if you enabled**: Agentless threat protection or Kubernetes API access

If you enabled **Agentless discovery for Kubernetes**, grant control plane permissions on the cluster by using one of these methods:

- **Option 1: Use the Python script**
  
  Run [this Python script](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md) to add the Defender for Cloud role `MDCContainersAgentlessDiscoveryK8sRole` to `aws-auth ConfigMap` for the EKS clusters you want to onboard.

- **Option 2: Use eksctl**
  
  Grant each Amazon EKS cluster the `MDCContainersAgentlessDiscoveryK8sRole` role:
  
  ```bash
  eksctl create iamidentitymapping \
      --cluster my-cluster \
      --region region-code \
      --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
      --group system:masters \
      --no-duplicate-arns
  ```

  For more information, see [Grant IAM users access to Kubernetes with EKS access entries](https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html) in the Amazon EKS user guide.

### Connect EKS clusters to Azure Arc

**Required if you enabled**: Auto provision Defender's sensor for Azure Arc

You need to install and run Azure Arc-enabled Kubernetes, the Defender sensor, and Azure Policy for Kubernetes on your EKS clusters. There's a dedicated Defender for Cloud recommendation to install these extensions:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for the recommendation: **EKS clusters should have Microsoft Defender's extension for Azure Arc installed.**

1. Follow the remediation steps provided by the recommendation:

    :::image type="content" source="media/defender-for-kubernetes-intro/install-eks-components-recommendation.png" alt-text="Screenshot explaining how to remediate the EKS clusters recommendation by installing the required Defender for Containers components." lightbox="media/defender-for-kubernetes-intro/install-eks-components-recommendation.png":::

### Deploy the Defender sensor

[!INCLUDE [Install with Helm note](./includes/helm-install-note.md)]

**Required if you enabled**: Auto provision Defender's sensor for Azure Arc

After connecting your EKS clusters to Azure Arc, deploy the Defender sensor:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about installing the Defender extension on Arc-enabled clusters.

1. Select the recommendation and follow the remediation steps.

1. The sensor provides runtime threat detection for your clusters.

> [!NOTE]
> You can also deploy the Defender sensor by using Helm for more control over the deployment configuration. For Helm deployment instructions, see [Deploy Defender sensor using Helm](defender-for-containers-aws-enable-programmatically.md#deploy-defender-sensor).

### Configure ECR vulnerability scanning

**Required if you enabled**: Registry access

1. Go to your AWS connector settings.

1. Select **Configure** next to the Containers plan.

1. Verify **Registry access** is enabled.

1. Images pushed to ECR are automatically scanned within 24 hours.

### Enable audit logging

**Required if you enabled**: Agentless threat protection

Enable audit logging for each EKS cluster:

```bash
# Enable audit logs
aws eks update-cluster-config \
    --name <cluster-name> \
    --logging '{"clusterLogging":[{"types":["audit","authenticator"],"enabled":true}]}'
```

## View recommendations and alerts

To view the alerts and recommendations for your EKS clusters:

1. Go to the alerts, recommendations, or inventory pages.

1. Use the filters to filter by resource type **AWS EKS Cluster**.

    :::image type="content" source="media/defender-for-kubernetes-intro/view-alerts-for-aws-eks-clusters.png" alt-text="Screenshot of selections for using filters on the Microsoft Defender for Cloud security alerts page to view alerts related to AWS EKS clusters." lightbox="media/defender-for-kubernetes-intro/view-alerts-for-aws-eks-clusters.png":::

> [!TIP]
> You can simulate container alerts by following the instructions in [this blog post](https://techcommunity.microsoft.com/t5/azure-security-center/how-to-demonstrate-the-new-containers-features-in-azure-security/ba-p/1011270).

## Deploy specific components (optional)

If you initially chose to enable only certain components and now want to add more, or if you need to fix issues with existing deployments:

### Add components to existing deployment

1. Go to **Environment settings** and select your AWS connector.

1. Select **Defender plans** > **Settings** next to Containers.

1. Enable additional toggles for the components you want to add:
   - **Agentless threat protection**: For runtime protection
   - **Kubernetes API access**: For cluster discovery
   - **Registry access**: For ECR vulnerability scanning
   - **Auto provision Defender's sensor**: For workload protection

1. Save your changes and follow the deployment steps for the newly enabled components.

> [!NOTE]
> You can exclude a specific AWS cluster from automatic provisioning. For sensor deployment, apply the `ms_defender_container_exclude_agents` tag on the resource with the value `true`. For agentless deployment, apply the `ms_defender_container_exclude_agentless` tag on the resource with the value `true`.

### Deploy Defender sensor to specific clusters

To deploy the sensor only to selected EKS clusters:

1. Connect specific clusters to Azure Arc (not all clusters).

1. Go to **Recommendations** and find "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for selected clusters only.

### Deploy components for existing clusters

If you have clusters with missing or failed components, follow these steps:

#### Check component status

1. Go to **Inventory** and filter by AWS resources.

1. Check each EKS cluster for:
   - Arc connectivity status
   - Defender extension status
   - Policy extension status

#### Fix Arc connectivity issues

For clusters that show as disconnected:

1. Rerun the Arc connection script.

1. Verify network connectivity from the cluster to Azure.

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

1. Tag registries to include or exclude from scanning.

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

### Test security detection

Generate a test security alert:

```bash
# Connect to an EKS cluster
aws eks update-kubeconfig --name <cluster-name> --region <region>

# Trigger a test alert
kubectl run test-alert --image=nginx --rm -it --restart=Never -- sh -c "echo test > /etc/shadow"
```

Check for the alert in Defender for Cloud within 5 to 10 minutes.


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

1. Verify the IAM role has ECR permissions.

1. Check if the scanner can access registries.

1. Ensure images are in supported regions.

1. Review scanner logs in Log Analytics workspace.

### Common verification issues

- **Missing resources**: Wait 15-30 minutes for discovery.
- **Partial coverage**: Check excluded resources configuration.
- **No alerts**: Verify audit logging is enabled.
- **Scan failures**: Check ECR permissions and network access.

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

To disable Defender for Containers, complete the following steps:

1. Go to your AWS connector.

1. Choose either:
   - **Turn Containers Off** to disable the plan
   - Delete the entire connector to remove all configurations

1. Remove AWS resources:
   - Delete the CloudFormation stack
   - Disconnect clusters from Arc

## Next steps

- [Configure advanced settings for EKS](defender-for-containers-aws-configure.md)
- [Verify deployment details](defender-for-containers-aws-verify.md)
- [Deploy programmatically](defender-for-containers-aws-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
