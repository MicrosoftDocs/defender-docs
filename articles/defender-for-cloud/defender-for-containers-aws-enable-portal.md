---
title: Enable Defender for Containers on AWS (EKS) via portal
description: Learn how to enable Microsoft Defender for Containers on your Amazon EKS clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Enable Defender for Containers on AWS (EKS) via portal

This article explains how to enable Microsoft Defender for Containers for Amazon Elastic Kubernetes Service (EKS) clusters by using the Azure portal. You can enable all supported components or selectively enable specific components based on your requirements.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

### AWS-specific requirements

Before you begin, make sure you have:

- An AWS account with permissions to create and manage IAM roles and deploy CloudFormation stacks. Learn how to [connect your AWS account to Microsoft Defender for Cloud](quickstart-onboard-aws.md).
- One or more Amazon EKS clusters running Kubernetes version 1.19 or later.
- Container images stored in Amazon ECR.

## Enable Defender for Containers 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment Settings**.

1. Select the relevant AWS subscription.

1. Select **Next : Select plans >**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan configuration options.

1. Toggle **On** the relevant Defender for Containers components:

   - **Agentless discovery for Kubernetes**  
     Discovers GKE clusters in the connected GCP project.

   - **Agentless container vulnerability assessment**  
     Enables vulnerability assessment for container images stored in Google Container Registry (GCR) and Artifact Registry.

   - **Defender DaemonSet**  
     Deploys the Defender sensor for runtime threat detection on GKE clusters.

   - **Azure Policy for Kubernetes**  
     Enables configuration and posture assessment for Kubernetes clusters and workloads.

1. Select **Save**.

## Deploy Defender for Containers components

Deploy the Defender for Containers components you enabled when creating the AWS connector. Complete only the steps that apply to your configuration.

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
> You can also deploy the Defender sensor by using Helm for more control over the deployment configuration. For Helm deployment instructions, see [Deploy Defender sensor using Helm](deploy-helm.md).

## Next steps

- [Configure advanced settings for EKS](defender-for-containers-aws-configure.md)
- [Verify deployment details](defender-for-containers-aws-verify.md)
- [Deploy programmatically](defender-for-containers-aws-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
