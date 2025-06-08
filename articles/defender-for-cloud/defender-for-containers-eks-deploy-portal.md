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

To protect your EKS clusters with Defender for Containers, you first need to connect your AWS account to Microsoft Defender for Cloud:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/defender-for-kubernetes-intro/add-aws-environment.png" alt-text="Screenshot of selections for adding an AWS environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/add-aws-environment.png":::

## Configure the AWS connector

1. Fill in the account details:
   - **Account name**: A friendly name for your AWS account
   - **AWS account ID**: Your 12-digit AWS account ID
   - **Subscription**: Select the Azure subscription for billing
   - **Resource group**: Select or create a resource group
   - **Region**: Choose the Azure region for the connector

    :::image type="content" source="media/defender-for-kubernetes-intro/add-aws-account-details.png" alt-text="Screenshot of the form to fill in the account details for an AWS environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/add-aws-account-details.png":::

1. Select **Next: Select plans**.

## Enable Defender for Containers plan

1. In the Select plans page, ensure the **Containers** plan toggle is set to **On**.

1. Select **Settings** to configure the plan components.

    :::image type="content" source="media/defender-for-containers-enable-plan-eks/containers-threat-protection.png" alt-text="Screenshot of the settings for the Containers plan in the Defender for Cloud environment settings with Agentless threat protection highlighted." lightbox="media/defender-for-containers-enable-plan-eks/containers-threat-protection.png":::

1. Configure the following components:
   - **Agentless threat protection**: Provides runtime protection for your cluster containers. Set to **On** and configure the retention period for audit logs.
   - **K8S API access**: Enables API-based discovery of your Kubernetes clusters. Set to **On**.
   - **Registry access**: Allows vulnerability assessment of images stored in ECR. Set to **On**.

1. In the Containers plan settings, ensure **Auto provision Defender's sensor for Azure Arc** is set to **On**.

    :::image type="content" source="media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc.png" alt-text="Screenshot of selections for enabling the Defender sensor for Azure Arc in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc.png":::

1. Select **Next: Configure access**.

## Configure AWS permissions

1. The **Configure access** page provides instructions and CloudFormation templates to set up the required IAM roles and permissions in AWS.

    :::image type="content" source="media/defender-for-kubernetes-intro/configure-access.png" alt-text="Screenshot of the page for configuring access for an AWS environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/configure-access.png":::

1. Follow the steps provided:
   - Download the CloudFormation template
   - Sign in to your AWS console
   - Navigate to CloudFormation service
   - Create a new stack using the downloaded template
   - Review and create the stack
   - Wait for the stack creation to complete

1. After the CloudFormation template is deployed successfully, return to the Azure portal and select **Next: Review and create**.

## Complete connector creation

1. Review your configuration settings.

1. Select **Create** to establish the connection.

1. The connector creation process takes 5-10 minutes to complete.

## Grant control plane permissions

If you enabled **Agentless discovery for Kubernetes**, you need to grant control plane permissions on your EKS clusters. Choose one of these methods:

### Option 1: Use the Python script

Run [this Python script](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md) to add the Defender for Cloud role `MDCContainersAgentlessDiscoveryK8sRole` to `aws-auth ConfigMap` for your EKS clusters.

### Option 2: Use eksctl

Sign in to each cluster using [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html) and run:

```bash
eksctl create iamidentitymapping \
    --cluster my-cluster \
    --region region-code \
    --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
    --group system:masters \
    --no-duplicate-arns
```

## Deploy Defender components to EKS clusters

Azure Arc-enabled Kubernetes, the Defender sensor, and Azure Policy for Kubernetes need to be installed on your EKS clusters.

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for the recommendation: **EKS clusters should have Microsoft Defender's extension for Azure Arc installed**.

    :::image type="content" source="media/defender-for-kubernetes-intro/install-eks-components-recommendation.png" alt-text="Screenshot explaining how to remediate the EKS clusters recommendation by installing the required Defender for Containers components." lightbox="media/defender-for-kubernetes-intro/install-eks-components-recommendation.png":::

1. Select the recommendation.

1. Select the EKS clusters where you want to deploy Defender components.

1. Select **Fix** to automatically deploy the required components.

## Verify deployment

After deployment completes:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your AWS connector.

    :::image type="content" source="media/defender-for-kubernetes-intro/select-aws-connector.png" alt-text="Screenshot of an AWS connector in the Defender for Cloud environment settings." lightbox="media/defender-for-kubernetes-intro/select-aws-connector.png":::

1. Verify that the Containers plan shows as **On** with all components enabled.

## View security insights

To view alerts and recommendations for your EKS clusters:

1. Use the filters on the alerts, recommendations, and inventory pages.

1. Filter by resource type **AWS EKS Cluster**.

    :::image type="content" source="media/defender-for-kubernetes-intro/view-alerts-for-aws-eks-clusters.png" alt-text="Screenshot of selections for using filters on the Microsoft Defender for Cloud security alerts page to view alerts related to AWS EKS clusters." lightbox="media/defender-for-kubernetes-intro/view-alerts-for-aws-eks-clusters.png":::

## Exclude specific clusters (optional)

You can exclude specific AWS clusters from automatic provisioning:

- For sensor deployment: Apply the `ms_defender_container_exclude_agents` tag with value `true`
- For agentless deployment: Apply the `ms_defender_container_exclude_agentless` tag with value `true`

## Troubleshooting

If clusters don't appear or components fail to deploy:

1. Verify the CloudFormation stack completed successfully in AWS
1. Check that IAM roles have the correct permissions
1. Ensure EKS clusters have outbound connectivity to Azure endpoints
1. Review the connector status in Environment settings

For detailed troubleshooting, see the [support matrix](support-matrix-defender-for-containers.md).

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-eks-configure.md)
- [Enable all Defender for Containers components via portal](defender-for-containers-eks-enable-all-portal.md)
- [Verify Defender for Containers deployment](defender-for-containers-eks-verify.md)
