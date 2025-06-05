---
title: Enable all Defender for Containers components on AWS (EKS) via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Amazon EKS clusters through the Azure portal.
ms.topic: tutorial
ms.date: 06/04/2025
---

# Tutorial: Enable all Defender for Containers components on AWS (EKS) via portal

This tutorial walks you through enabling comprehensive Microsoft Defender for Containers protection for your Amazon EKS clusters using the Azure portal. You'll set up vulnerability scanning, runtime protection, and security posture management across your AWS environment.

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> - Create an AWS connector in Defender for Cloud
> - Enable all Defender for Containers components
> - Configure ECR vulnerability scanning
> - Deploy runtime protection to EKS clusters
> - Set up compliance monitoring
> - Verify successful deployment

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

    :::image type="content" source="media/tutorial-enable-container-aws/add-aws-account.png" alt-text="Screenshot showing Add AWS environment button." lightbox="media/tutorial-enable-container-aws/add-aws-account.png":::

## Configure connector settings

1. In the **Account details** tab:
   - **Account name**: Enter a descriptive name (e.g., "Production-AWS")
   - **AWS account ID**: Enter your 12-digit AWS account ID
   - **Subscription**: Select your Azure subscription
   - **Resource group**: Create or select a resource group
   - **Location**: Choose your preferred Azure region

    :::image type="content" source="media/tutorial-enable-container-aws/create-aws-connector.png" alt-text="Screenshot showing AWS connector configuration details." lightbox="media/tutorial-enable-container-aws/create-aws-connector.png":::

1. Select **Next: Select plans**.

## Enable Defender for Containers with all features

1. In the **Select plans** page, locate the **Containers** row.

1. Toggle the plan to **On**.

    :::image type="content" source="media/tutorial-enable-container-aws/aws-select-plans.png" alt-text="Screenshot showing Containers plan selection for AWS." lightbox="media/tutorial-enable-container-aws/aws-select-plans.png":::

1. Select **Configure** to open the components settings.

1. Ensure all components are enabled:
   - **EKS runtime protection** - Real-time threat detection
   - **Agentless discovery for Kubernetes** - Automatic EKS discovery
   - **Agentless container vulnerability assessment** - ECR scanning
   - **Policy monitoring** - Compliance and hardening

    :::image type="content" source="media/tutorial-enable-container-aws/container-extension-details.png" alt-text="Screenshot showing all Defender for Containers components enabled." lightbox="media/tutorial-enable-container-aws/container-extension-details.png":::

1. Select **Continue**.

## Set up AWS permissions

1. Select **Next: Configure access**.

1. Download the CloudFormation templates:
   - **DefenderForCloud-Containers** template for container protection
   - **DefenderForCloud-ECR** template for registry scanning

    :::image type="content" source="media/tutorial-enable-container-aws/download-cloudformation-template.png" alt-text="Screenshot showing CloudFormation template downloads." lightbox="media/tutorial-enable-container-aws/download-cloudformation-template.png":::

1. Open a new browser tab and sign in to your **AWS Console**.

## Deploy CloudFormation stacks

1. In AWS Console, navigate to **CloudFormation**.

1. Select **Create stack** > **With new resources**.

1. Upload the first template (DefenderForCloud-Containers):
   - Select **Upload a template file**
   - Choose the downloaded template
   - Select **Next**

1. Configure stack:
   - **Stack name**: `DefenderForCloud-Containers`
   - Review parameters (usually defaults are fine)
   - Select **Next** twice
   - Check acknowledgment box
   - Select **Create stack**

1. Wait for stack creation to complete (shows CREATE_COMPLETE).

1. Repeat for the ECR template if you have container registries.

    :::image type="content" source="media/tutorial-enable-container-aws/deploy-cloudformation.png" alt-text="Screenshot showing completed CloudFormation stack." lightbox="media/tutorial-enable-container-aws/deploy-cloudformation.png":::

## Complete connector creation

1. Return to the Azure portal tab.

1. Select **Next: Review and create**.

1. Review all settings:
   - Connector details
   - Enabled plans
   - AWS permissions status

1. Select **Create**.

    :::image type="content" source="media/tutorial-enable-container-aws/review-create-connector.png" alt-text="Screenshot showing final connector creation." lightbox="media/tutorial-enable-container-aws/review-create-connector.png":::

1. Wait for the connector to be created (5-10 minutes).

## Deploy Defender sensor to EKS clusters

Once the connector is active:

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for "EKS clusters should have Defender profile enabled".

    :::image type="content" source="media/tutorial-enable-container-aws/deploy-defender-sensor.png" alt-text="Screenshot showing EKS Defender recommendation." lightbox="media/tutorial-enable-container-aws/deploy-defender-sensor.png":::

1. Select the recommendation.

1. Select your EKS clusters from the list.

1. Select **Fix** to automatically deploy the sensor.

## Configure ECR scanning

1. Navigate to your AWS connector in **Environment settings**.

1. Select **Settings** > **Container registries**.

1. Verify ECR integration is enabled.

    :::image type="content" source="media/tutorial-enable-container-aws/enable-ecr-scanning.png" alt-text="Screenshot showing ECR scanning configuration." lightbox="media/tutorial-enable-container-aws/enable-ecr-scanning.png":::

1. Container images in ECR will be automatically scanned for vulnerabilities.

## Enable CloudWatch logging

For comprehensive monitoring:

1. In AWS Console, navigate to your EKS cluster.

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

1. Verify status shows as **Connected**.

    :::image type="content" source="media/tutorial-enable-container-aws/verify-connector-health.png" alt-text="Screenshot showing healthy AWS connector." lightbox="media/tutorial-enable-container-aws/verify-connector-health.png":::

### View discovered resources

1. Navigate to **Inventory**.

1. Filter by **Environment** = **AWS**.

1. You should see:
   - EKS clusters
   - ECR repositories
   - Container images

    :::image type="content" source="media/tutorial-enable-container-aws/view-discovered-resources.png" alt-text="Screenshot showing AWS resources in inventory." lightbox="media/tutorial-enable-container-aws/view-discovered-resources.png":::

### Check security insights

1. Navigate to **Workload protections** > **Containers**.

1. The dashboard now shows:
   - EKS cluster security status
   - Vulnerable images in ECR
   - Runtime protection coverage
   - Compliance scores

    :::image type="content" source="media/tutorial-enable-container-aws/review-security-dashboard.png" alt-text="Screenshot showing Containers dashboard with EKS data." lightbox="media/tutorial-enable-container-aws/review-security-dashboard.png":::

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
   - Notification types

1. Save your settings.

## Monitor ongoing security

After setup, regularly check:

1. **Recommendations**: Address EKS-specific security issues.

1. **Security alerts**: Investigate runtime threats.

1. **Vulnerability assessment**: Review and patch vulnerable images.

1. **Compliance**: Track adherence to AWS security benchmarks.

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
- [Implement security policies for containers](kubernetes-workload-protections.md)