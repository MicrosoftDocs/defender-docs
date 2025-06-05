---
title: Deploy Defender for Containers on AWS (EKS) using Azure portal
description: Learn how to enable Microsoft Defender for Containers on Amazon EKS clusters using the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on AWS (EKS) using Azure portal

This article explains how to enable Microsoft Defender for Containers on your Amazon Elastic Kubernetes Service (EKS) clusters using the Azure portal.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional prerequisites for EKS:
- AWS account with active EKS clusters
- Permissions to create IAM roles and policies in AWS
- EKS cluster version 1.19 or later
- AWS CLI configured with appropriate credentials

## Create an AWS connector

First, you need to connect your AWS account to Microsoft Defender for Cloud:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/tutorial-enable-container-aws/add-aws-account.png" alt-text="Screenshot showing the Add AWS account option." lightbox="media/tutorial-enable-container-aws/add-aws-account.png":::

## Configure the AWS connector

1. In the connector creation wizard, provide:
   - **Account name**: A friendly name for your AWS account
   - **AWS account ID**: Your 12-digit AWS account ID
   - **Subscription**: Select the Azure subscription for billing
   - **Resource group**: Select or create a resource group
   - **Region**: Choose the Azure region for the connector

    :::image type="content" source="media/tutorial-enable-container-aws/aws-connector-basics.png" alt-text="Screenshot showing AWS connector basic configuration." lightbox="media/tutorial-enable-container-aws/aws-connector-basics.png":::

1. Select **Next: Select plans**.

## Enable Defender for Containers plan

1. In the Select plans page, toggle **Containers** to **On**.

    :::image type="content" source="media/tutorial-enable-container-aws/enable-containers-plan-aws.png" alt-text="Screenshot showing Containers plan enabled for AWS." lightbox="media/tutorial-enable-container-aws/enable-containers-plan-aws.png":::

1. Select **Configure** to set up plan components.

1. Ensure all components are enabled:
   - **EKS runtime protection** - Runtime threat detection
   - **Agentless discovery for Kubernetes** - Discovers all EKS clusters
   - **Agentless container vulnerability assessment** - Scans ECR images

1. Select **Next: Configure access**.

## Configure AWS permissions

1. The portal provides CloudFormation templates to create required IAM roles.

1. Select **Download** to get the CloudFormation template.

    :::image type="content" source="media/tutorial-enable-container-aws/download-cloudformation.png" alt-text="Screenshot showing CloudFormation template download." lightbox="media/tutorial-enable-container-aws/download-cloudformation.png":::

1. In your AWS console:
   - Navigate to **CloudFormation**
   - Create a new stack using the downloaded template
   - Review and create the stack
   - Wait for stack creation to complete

1. Return to Azure portal and select **Next: Review and create**.

## Complete connector creation

1. Review your configuration settings.

1. Select **Create** to establish the connection.

1. The connector creation process takes 5-10 minutes.

## Deploy the Defender sensor to EKS clusters

After the connector is created, deploy the Defender sensor:

### Automatic deployment

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "EKS clusters should have Defender profile enabled".

1. Select the recommendation to see affected clusters.

1. Select your EKS clusters and choose **Fix**.

### Manual deployment via portal

1. Navigate to your AWS connector in **Environment settings**.

1. Select **Manage** > **EKS clusters**.

1. You'll see a list of discovered EKS clusters.

    :::image type="content" source="media/tutorial-enable-container-aws/eks-clusters-list.png" alt-text="Screenshot showing discovered EKS clusters." lightbox="media/tutorial-enable-container-aws/eks-clusters-list.png":::

1. For each cluster, select **Deploy Defender sensor**.

1. Follow the deployment wizard:
   - Choose deployment method (Helm or YAML)
   - Configure Log Analytics workspace
   - Apply to your cluster

## Configure ECR vulnerability scanning

To enable vulnerability scanning for Amazon ECR:

1. In your AWS connector settings, navigate to **Container registries**.

1. Select **Configure ECR integration**.

1. The portal provides an IAM policy for ECR access.

1. In AWS, attach this policy to the Defender IAM role.

1. Back in Azure portal, select **Enable ECR scanning**.

## Configure CloudWatch integration

For enhanced monitoring:

1. In your EKS cluster (AWS console), enable control plane logging:
   - API server
   - Audit
   - Authenticator
   - Controller manager
   - Scheduler

1. In the Azure portal, configure log collection:
   - Navigate to your AWS connector
   - Select **Data collection**
   - Enable CloudWatch logs integration

## Verify deployment

After deployment:

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Filter by **Resource type** = **Kubernetes service (EKS)**.

1. Verify your EKS clusters appear with security data.

    :::image type="content" source="media/tutorial-enable-container-aws/eks-inventory.png" alt-text="Screenshot showing EKS clusters in inventory." lightbox="media/tutorial-enable-container-aws/eks-inventory.png":::

1. Check for recommendations specific to your EKS clusters.

For detailed verification steps, see [Verify Defender for Containers deployment on AWS (EKS)](defender-for-containers-eks-verify.md).

## Monitor security status

1. Navigate to **Workload protections** > **Containers**.

1. View the dashboard showing:
   - Vulnerable container images in ECR
   - Runtime security alerts from EKS
   - Compliance with AWS security benchmarks

## Troubleshooting

If clusters don't appear:

1. Verify CloudFormation stack completed successfully in AWS.

1. Check IAM role permissions are correctly configured.

1. Ensure EKS clusters have outbound connectivity.

1. Review connector health in Environment settings.

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-eks-configure.md)
- [Enable all Defender for Containers components via portal](defender-for-containers-eks-enable-all-portal.md)
- [Investigate security alerts from EKS clusters](defender-for-containers-introduction.md)