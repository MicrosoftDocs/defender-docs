---
title: Deploy Defender for Containers components on AWS (EKS) via portal
description: Learn how to deploy specific Microsoft Defender for Containers components on Amazon EKS clusters using the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers components on AWS (EKS) via portal

This article explains how to deploy specific Defender for Containers components on your Amazon EKS clusters using the Azure portal. Use this approach when you want to enable only certain features or have already enabled the plan but need to deploy additional components.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional prerequisites for EKS:

- AWS account connected to Defender for Cloud
- Defender for Containers plan enabled on your subscription
- EKS clusters version 1.19 or later

## Deploy the Defender sensor

The Defender sensor provides runtime threat detection for your EKS clusters.

### Deploy to specific clusters

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for the recommendation **EKS clusters should have Microsoft Defender's extension for Azure Arc installed**.

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-recommendation.png" alt-text="Microsoft Defender for Cloud's recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="media/defender-for-kubernetes-azure-arc/extension-recommendation.png":::

1. Select the recommendation to view affected clusters.

1. Select the clusters where you want to deploy the sensor.

1. Select **Fix** to automatically deploy the extension.

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/security-center-deploy-extension.gif" alt-text="Deploy Defender sensor for Azure Arc-enabled clusters using Defender for Cloud's 'Fix' option.":::

### Deploy using remediation script

1. In the recommendation page, select **Fix (preview)**.

1. Select the affected resources.

1. Choose your preferred script language:
   - For Linux: Select **Bash**
   - For Windows: Select **PowerShell**

1. Select **Download remediation logic**.

1. Run the generated script on each cluster with appropriate credentials.

## Deploy Azure Policy extension

Azure Policy for Kubernetes provides security recommendations for your clusters.

### Enable via recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for **Azure Policy for Kubernetes should be installed and enabled on your clusters**.

1. Select the recommendation.

1. Select affected EKS clusters.

1. Select **Fix** to deploy the extension.

## Enable agentless features

Some features don't require any deployment to your clusters:

### Agentless discovery

1. Navigate to your AWS connector in **Environment settings**.

1. Select **Settings** for the Containers plan.

1. Ensure **Agentless discovery for Kubernetes** is toggled **On**.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

1. Select **Continue** and **Save**.

### ECR vulnerability scanning

1. In the connector settings, ensure **Container registries** is enabled.

1. ECR repositories in the same AWS account are automatically discovered.

1. Images are scanned upon push and periodically thereafter.

## Configure diagnostic logs

For comprehensive monitoring, enable EKS audit logs:

1. In the AWS Console, navigate to your EKS cluster.

1. Select the **Logging** tab.

1. Enable these log types:
   - API server
   - Audit
   - Authenticator
   - Controller manager
   - Scheduler

1. Logs are automatically collected by the Defender sensor when enabled.

## Selective deployment by tag

You can control which clusters receive Defender components using tags:

### Exclude from sensor deployment

1. In AWS Console, add this tag to your EKS cluster:
   - Key: `ms_defender_container_exclude_agents`
   - Value: `true`

### Exclude from all features

1. Add this tag to exclude from all Defender features:
   - Key: `ms_defender_container_exclude`
   - Value: `true`

## Monitor deployment status

### Check in Defender for Cloud

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Look for your EKS clusters with their protection status.

### Check in AWS

1. In AWS Console, view your EKS cluster.

1. Check the add-ons or workloads section for:
   - Azure Arc agents
   - Defender sensor pods
   - Policy agent pods

### Verify extension installation

After deployment, verify the extensions are installed:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

To view detailed extension information:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Full details of an Azure Arc extension on a Kubernetes cluster.":::

## Troubleshooting deployment

If components fail to deploy:

1. Verify the AWS connector is healthy in Environment settings.

2. Check that required permissions exist in AWS.

3. Ensure clusters have outbound connectivity.

4. Review activity logs in both Azure and AWS.

## Next steps

- [Deploy components programmatically](defender-for-containers-aws-deploy.md)
- [Verify deployment](defender-for-containers-aws-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
