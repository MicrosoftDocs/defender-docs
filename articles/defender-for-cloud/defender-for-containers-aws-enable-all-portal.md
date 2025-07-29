---
title: Enable all Defender for Containers components on AWS (EKS) via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Amazon EKS clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on AWS (EKS) via portal

This article walks you through enabling comprehensive Microsoft Defender for Containers protection for your Amazon EKS clusters. You'll set up vulnerability scanning, runtime protection, and compliance monitoring across your AWS environment.

## Article contents

- [Prerequisites](#prerequisites)
- [Create AWS connector](#create-aws-connector)
- [Configure connector](#configure-connector-details)
- [Enable Defender features](#enable-all-defender-for-containers-features)
- [Set up AWS permissions](#set-up-aws-permissions)
- [Connect EKS clusters](#connect-eks-clusters-to-azure-arc)
- [Deploy Defender sensor](#deploy-the-defender-sensor)
- [Configure ECR scanning](#configure-ecr-vulnerability-scanning)
- [Enable audit logging](#enable-comprehensive-audit-logging)
- [Verify deployment](#verify-comprehensive-deployment)
- [Monitor security](#monitor-ongoing-security)

> [!NOTE]
> This guide provides complete setup for new deployments. If you already have Defender for Containers enabled and need to fix or add components, see [Deploy specific components](defender-for-containers-aws-deploy-portal.md).

## When to use this guide

Use this guide if you're:

- Setting up Defender for Containers on EKS for the first time
- Want comprehensive protection for all your EKS clusters
- Need vulnerability scanning for Amazon ECR
- Looking for a guided, visual deployment experience

For selective deployment or troubleshooting existing deployments, see [Deploy specific Defender for Containers components on AWS (EKS)](defender-for-containers-aws-deploy-portal.md).

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

1. Navigate to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-environment-settings.png" alt-text="Screenshot showing how to connect an AWS account to Microsoft Defender for Cloud." lightbox="media/quickstart-onboard-aws/add-aws-account-environment-settings.png":::

## Configure connector details

1. In the **Account details** section, provide:
   - **Account alias**: A descriptive name for your AWS account
   - **AWS account ID**: Your 12-digit AWS account identifier
   - **Resource group**: Select or create a resource group

1. Select **Next: Select plans**.

## Enable all Defender for Containers features

1. In the **Select plans** page, toggle **Containers** to **On**.

    :::image type="content" source="media/tutorial-enable-containers-aws/aws-containers-enabled.png" alt-text="Screenshot of enabling Defender for Containers for an AWS connector." lightbox="media/tutorial-enable-containers-aws/aws-containers-enabled.png":::

1. Select **Configure** to access the plan settings.

1. Enable all components for comprehensive protection:
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

## Connect EKS clusters to Azure Arc

After creating the connector:

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about EKS clusters that need Arc connection.

1. Follow the recommendation to connect your clusters.

1. Use the provided scripts to connect each cluster to Azure Arc.

## Deploy the Defender sensor

After connecting your EKS clusters to Azure Arc, deploy the Defender sensor:

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about installing the Defender extension on Arc-enabled clusters.

1. Select the recommendation and follow the remediation steps.

1. The sensor provides runtime threat detection for your clusters.

### Verify sensor deployment

```bash
# Check sensor status
kubectl get pods -n kube-system -l app=microsoft-defender

# View DaemonSet
kubectl get daemonset -n kube-system microsoft-defender-sensor
```

The sensor should be running on all nodes within 5-10 minutes.

## Configure ECR vulnerability scanning

1. Navigate to your AWS connector settings.

1. Select **Configure** next to the Containers plan.

1. Verify **Agentless container vulnerability assessment** is enabled.

1. Images pushed to ECR are automatically scanned within 24 hours.

### View scan results

1. Navigate to **Recommendations**.

1. Select "Container registry images should have vulnerability findings resolved".

1. View detailed vulnerability information for your ECR images.

## Enable comprehensive audit logging

Enable audit logging for each EKS cluster:

```bash
# Enable audit logs
aws eks update-cluster-config \
    --name <cluster-name> \
    --logging '{"clusterLogging":[{"types":["audit","authenticator"],"enabled":true}]}'
```

## Verify comprehensive deployment

### Check connector health

1. Navigate to **Environment settings**.

1. Select your AWS connector.

1. Verify:
   - Status: **Connected**
   - Last sync: Recent timestamp
   - Discovered resources count

### View discovered resources

1. Navigate to **Inventory**.

1. Filter by **Environment** = **AWS**.

1. Verify you see:
   - All EKS clusters
   - ECR registries
   - Container images

### Check security coverage

1. Navigate to **Workload protections** > **Containers**.

1. The dashboard shows:
   - EKS clusters with protection status
   - Vulnerable images by severity
   - Recent security alerts

## Test the deployment

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

1. Navigate to **Workload protections** > **Containers**.

1. Monitor key metrics:
   - **Vulnerability trends**: Track ECR image vulnerabilities
   - **Alert patterns**: Identify security issues
   - **Compliance scores**: Monitor CIS benchmark adherence
   - **Coverage gaps**: Find unprotected clusters

### Configure notifications

1. Navigate to **Environment settings**.

1. Select **Email notifications**.

1. Configure:
   - Recipients for high-severity alerts
   - Weekly security summaries

### Review recommendations

1. Navigate to **Recommendations**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Priority recommendations:
   - Enable EKS control plane logging
   - Use IRSA for pod authentication
   - Implement network policies
   - Enable secrets encryption

## Best practices

1. **Regular reviews**: Check the dashboard weekly
1. **Alert response**: Investigate high-severity alerts promptly
1. **Image hygiene**: Scan and update base images regularly
1. **Compliance**: Address CIS benchmark failures
1. **Access control**: Review IAM roles and RBAC permissions

## Troubleshooting

If components fail to deploy:

1. **Check Arc connection**: Ensure clusters show as Connected
1. **Verify IAM role**: Confirm the role has all required permissions
1. **Review network**: Check outbound HTTPS connectivity
1. **Check quotas**: Verify AWS service quotas aren't exceeded

## Clean up resources

To disable Defender for Containers:

1. Navigate to your AWS connector.

1. Either:
   - Toggle **Containers** to **Off**
   - Delete the entire connector

1. Remove AWS resources:
   - Delete the CloudFormation stack
   - Disconnect clusters from Arc

## Next steps

- [Configure advanced settings for EKS](defender-for-containers-aws-configure.md)
- [Verify deployment details](defender-for-containers-aws-verify.md)
- [Deploy programmatically](defender-for-containers-aws-deploy.md)
- [Deploy sensor using Helm for existing clusters](deploy-helm.md)
