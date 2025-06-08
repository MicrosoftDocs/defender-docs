---
title: Enable all Defender for Containers components on AWS (EKS) via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Amazon EKS clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on AWS (EKS) via portal

This article walks you through enabling comprehensive Microsoft Defender for Containers protection for your Amazon EKS clusters using the Azure portal. You'll set up vulnerability scanning, runtime protection, and security posture management across your AWS environment.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

AWS-specific requirements:

- AWS account with administrator access
- Active EKS clusters (version 1.19+)
- Amazon ECR repositories with container images
- AWS CLI configured locally
- IAM permissions to create roles and policies

## Sign in to Azure

Sign in to the [Azure portal](https://portal.azure.com).

## Create AWS connector

1. Navigate to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Amazon Web Services**.

## Configure connector settings

1. In the **Account details** tab:
   - **Account name**: Enter a descriptive name (e.g., "Production-AWS")
   - **AWS account ID**: Enter your 12-digit AWS account ID
   - **Subscription**: Select your Azure subscription
   - **Resource group**: Create or select a resource group
   - **Location**: Choose your preferred Azure region

1. Select **Next: Select plans**.

## Enable Defender for Containers with all features

1. In the **Select plans** page, locate the **Containers** row.

1. Toggle the plan to **On**.

    :::image type="content" source="media/tutorial-enable-containers-aws/aws-containers-enabled.png" alt-text="Screenshot of enabling Defender for Containers for an AWS connector." lightbox="media/tutorial-enable-containers-aws/aws-containers-enabled.png":::

1. Select **Settings** to configure the plan components.

    :::image type="content" source="media/defender-for-containers-enable-plan-eks/containers-threat-protection.png" alt-text="Screenshot of the settings for the Containers plan in the Defender for Cloud environment settings with Agentless threat protection highlighted." lightbox="media/defender-for-containers-enable-plan-eks/containers-threat-protection.png":::

1. Ensure all components are enabled:
   - **Agentless threat protection** - Real-time threat detection. Set to **On** and configure the retention period for audit logs.
   - **K8S API access** - Automatic EKS discovery. Set to **On**.
   - **Registry access** - ECR vulnerability scanning. Set to **On**.

1. Select **Next: Review and generate**.

## Set up AWS permissions

1. The portal generates CloudFormation templates for the required AWS resources.

1. Download the generated CloudFormation templates.

1. Open a new browser tab and sign in to your **AWS Console**.

## Deploy CloudFormation stacks

1. In AWS Console, navigate to **CloudFormation**.

1. Select **Create stack** > **With new resources**.

1. Upload the first template:
   - Select **Upload a template file**
   - Choose the downloaded template
   - Select **Next**

1. Configure stack:
   - **Stack name**: Use a descriptive name
   - Review parameters (defaults are usually correct)
   - Select **Next** twice
   - Check acknowledgment boxes
   - Select **Create stack**

1. Wait for stack creation to complete (shows CREATE_COMPLETE).

1. Repeat for any additional templates if you have multiple features enabled.

## Complete connector creation

1. Return to the Azure portal tab.

1. Select **Update** to save your configuration.

1. The connector creation and configuration process takes 5-10 minutes.

## Deploy Defender sensor to EKS clusters

Once the connector is active, you need to deploy the Defender sensor to your EKS clusters:

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "EKS clusters should have Microsoft Defender's extension for Azure Arc installed".

1. Select the recommendation.

1. Select the unhealthy clusters (one at a time).

1. Select **Fix**.

1. Defender for Cloud generates a remediation script:
   - For Linux: Select **Bash**
   - For Windows: Select **PowerShell**

1. Select **Download remediation logic**.

1. Run the generated script on each of your EKS clusters.

## Configure ECR scanning

If you enabled **Registry access**, container images in ECR will be automatically scanned:

1. The CloudFormation template already configured the necessary permissions.

1. Scanning begins automatically for:
   - New images pushed to ECR
   - Existing images in your repositories

1. Results appear in the **Recommendations** page within a few hours.

## Enable CloudWatch logging

For comprehensive monitoring:

1. In AWS Console, navigate to each EKS cluster.

1. Select **Logging** tab.

1. Enable these log types:
   - API server
   - Audit
   - Authenticator
   - Controller manager
   - Scheduler

1. Select **Update** to save changes.

## Verify deployment

### Check connector health

1. In Azure portal, go to **Environment settings**.

1. Select your AWS connector.

    :::image type="content" source="media/tutorial-enable-containers-aws/aws-account.png" alt-text="Screenshot of Defender for Cloud's environment settings page showing an AWS connector." lightbox="media/tutorial-enable-containers-aws/aws-account.png":::

1. Verify the Containers plan shows as **On** with all components enabled.

### View discovered resources

1. Navigate to **Inventory**.

1. Filter by **Environment** = **AWS**.

1. You should see:
   - EKS clusters with Arc connected
   - ECR repositories (if Registry access is enabled)
   - Container images

### Check security insights

1. Navigate to **Workload protections** > **Containers**.

1. The dashboard displays:
   - EKS cluster security status
   - Vulnerable images in ECR
   - Runtime protection coverage
   - Compliance scores

## Test the deployment

Generate a test alert to verify runtime protection:

1. Connect to your EKS cluster:

   ```bash
   aws eks update-kubeconfig --name <cluster-name> --region <region>
   ```

2. Run a test command:

   ```bash
   kubectl run test-alert --image=nginx --rm -it --restart=Never -- bash -c "cat /etc/shadow"
   ```

3. Within 5-10 minutes, check for alerts in Defender for Cloud.

## Configure notifications

1. Navigate to **Environment settings**.

1. Select **Email notifications**.

1. Configure:
   - Email recipients
   - Alert severity levels
   - Notification frequency

1. Save your settings.

## Monitor ongoing security

After setup, regularly review:

1. **Recommendations**: Address EKS-specific security issues like:
   - "Container images should have vulnerability findings resolved"
   - "Kubernetes clusters should disable automounting API credentials"
   - "Container with privilege escalation should be avoided"

1. **Security alerts**: Investigate runtime threats promptly.

1. **Vulnerability assessment**: Review and remediate vulnerable images.

1. **Regulatory compliance**: Track adherence to standards like:
   - CIS Kubernetes Benchmark
   - PCI DSS
   - AWS Foundational Security Best Practices

## Best practices

1. **Regular reviews**: Check the Containers dashboard weekly.

1. **Automated remediation**: Use Azure Policy to enforce security configurations.

1. **Image scanning**: Scan images before deploying to production.

1. **Network policies**: Implement Kubernetes network policies for microsegmentation.

1. **RBAC**: Use proper role-based access control in your clusters.

## Clean up resources

To disable Defender for Containers on AWS:

1. Navigate to **Environment settings**.

1. Select your AWS connector.

1. Either:
   - Toggle **Containers** to **Off** to disable the plan
   - Select **Delete** to remove the entire connector

1. In AWS, optionally delete the CloudFormation stacks.

## Next steps

- [Configure advanced settings for EKS](defender-for-containers-eks-configure.md)
- [Review container security best practices](container-security.md)
- [Implement Kubernetes workload protections](kubernetes-workload-protections.md)
