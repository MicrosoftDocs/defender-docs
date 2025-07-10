---
title: Enable all Defender for Containers components on AWS (EKS) via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Amazon EKS clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on AWS (EKS) via portal

This article walks you through enabling all Microsoft Defender for Containers components on your Amazon EKS clusters using the Azure portal. This comprehensive approach ensures you get full protection including vulnerability scanning, runtime threat detection, and security posture management.

## Article contents

- [Prerequisites](#prerequisites)
- [Create AWS connector](#create-aws-connector)
- [Configure AWS permissions](#configure-aws-permissions)
- [Connect EKS clusters](#connect-eks-clusters-to-azure-arc)
- [Deploy security components](#deploy-defender-extensions)
- [Verify and test](#verify-deployment)

> [!NOTE]
> This guide covers the complete setup process for new deployments. If you already have Defender for Containers enabled and need to fix or add components, see [Deploy specific components](defender-for-containers-aws-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional requirements:

- AWS account with appropriate IAM permissions
- EKS clusters version 1.19 or later
- Network connectivity from EKS to Azure endpoints

## Create AWS connector

If you haven't already connected your AWS account:

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

3. Select **+ Add environment** > **Amazon Web Services**.

4. Enter connector details:
   - **Connector name**: A descriptive name
   - **AWS account ID**: Your 12-digit AWS account ID
   - **Region**: Select your primary region

5. Select **Next: Select plans**.

## Enable Defender for Containers plan

1. On the **Select plans** page, ensure **Containers** is toggled to **On**.

    :::image type="content" source="media/tutorial-enable-containers-azure/containers-enabled-aks.png" alt-text="Screenshot of the Defender plans page that shows where to toggle the containers plan switch to on is located." lightbox="media/tutorial-enable-containers-azure/containers-enabled-aks.png":::

1. Select **Configure** to set up plan components.

1. Ensure all components are enabled:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

1. Select **Next: Configure access**.

## Configure AWS permissions

1. Download the CloudFormation template by selecting **Download**.

1. In a new tab, sign in to your AWS account.

1. Navigate to **CloudFormation** > **Create stack**.

1. Upload the downloaded template.

1. Review and create the stack. This creates the necessary IAM roles.

1. Once complete, return to Azure portal and select **Next: Review and create**.

## Connect EKS clusters to Azure Arc

After creating the connector, connect your EKS clusters:

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Look for recommendations to connect your EKS clusters.

    :::image type="content" source="media/tutorial-enable-containers-azure/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Azure Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-azure/recommendation-search.png":::

### Connect clusters using recommendation

1. Select the recommendation **EKS clusters should be connected to Azure Arc**.

1. Select your EKS clusters.

1. Select **Fix**.

    :::image type="content" source="media/tutorial-enable-containers-azure/affected-fix.png" alt-text="Screenshot of the recommendation with the affected resources selected that shows you how to select the fix button." lightbox="media/tutorial-enable-containers-azure/affected-fix.png":::

1. Copy the generated script.

    :::image type="content" source="media/tutorial-enable-containers-gcp/copy-button.png" alt-text="Screenshot showing the location of the copy button." lightbox="media/tutorial-enable-containers-gcp/copy-button.png":::

1. Run the script on a machine with kubectl access to your EKS cluster.

## Deploy Defender extensions

Once clusters are connected to Arc, deploy the Defender components:

1. Navigate to **Recommendations**.

1. Search for **Azure Arc-enabled Kubernetes clusters should have Defender extension installed**.

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-recommendation.png" alt-text="Microsoft Defender for Cloud's recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="media/defender-for-kubernetes-azure-arc/extension-recommendation.png":::

1. Select your Arc-enabled EKS clusters.

1. Select **Fix** to deploy the extension.

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/security-center-deploy-extension.gif" alt-text="Deploy Defender sensor for Azure Arc-enabled clusters using Defender for Cloud's 'Fix' option.":::

## Deploy Azure Policy extension

1. Search for the recommendation **Azure Policy for Kubernetes should be installed and enabled**.

1. Select your Arc-enabled EKS clusters.

1. Select **Fix** to deploy the Policy extension.

## Verify deployment

After deployment completes (typically 10-15 minutes):

1. Navigate to **Workload protections** > **Containers**.

1. Verify your EKS clusters appear with protection enabled.

1. Check that security recommendations are being generated.

### Verify extensions on cluster

Navigate to your Arc-enabled cluster to see installed extensions:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

Select an extension to view details:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Full details of an Azure Arc extension on a Kubernetes cluster.":::

## Enable diagnostic logs

For comprehensive monitoring:

1. In AWS Console, navigate to your EKS cluster.

1. Select **Logging**.

1. Enable all log types:
   - API server
   - Audit
   - Authenticator
   - Controller manager
   - Scheduler

## Test the deployment

Generate a test security alert:

```bash
kubectl run test-alert --image=nginx --rm -it --restart=Never -- bash -c "echo 'test' > /etc/passwd"
```

Within 5-10 minutes, check **Security alerts** for the test alert.

## Monitor security status

After setup:

1. **Inventory**: View all protected EKS clusters
2. **Recommendations**: Review and act on security findings
3. **Security alerts**: Monitor runtime threats
4. **Workload protections**: Track overall container security

## Best practices

1. **Enable all components** for comprehensive protection
2. **Regular monitoring** - Check dashboard weekly
3. **Alert response** - Investigate high-severity alerts immediately
4. **Compliance tracking** - Monitor regulatory compliance status
5. **Update clusters** - Keep EKS versions current

## Troubleshooting

If components fail to deploy:

1. Verify AWS IAM roles were created correctly
2. Check network connectivity from EKS to Azure
3. Ensure clusters meet version requirements
4. Review activity logs in both Azure and AWS

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
- [Verify deployment](defender-for-containers-aws-verify.md)
- [Deploy components programmatically](defender-for-containers-aws-deploy.md) - For automation scenarios
