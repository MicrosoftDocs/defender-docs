---
title: Enable Defender for Containers in Microsoft Defender for Cloud
description: Learn how to enable Microsoft Defender for Containers for Kubernetes environments across Azure, AWS, and Google Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/19/2026
---

# Enable Defender for Containers in Microsoft Defender for Cloud

This article explains how to enable the Microsoft Defender for Containers plan in Microsoft Defender for Cloud.

Enabling the plan activates container protection for supported Kubernetes environments across Azure, AWS, and Google Cloud. 

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

- AKS cluster supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

- [An OpenId Connect (OIDC) issuer](/azure/aks/use-oidc-issuer) enabled on your cluster.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-containers-network-requirements-aks.md)]

## Enable Defender for Containers

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. In the left menu, select **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** or **Off** the relevant Defender for Containers components:

    - **Agentless scanning for machines**?
    - **Defender sensor**?
    - **Azure Policy**?
    - **Kubernetes API access**?
    - **Registry access**?

1. Select **Continue**.

1. Select **Save**.

## Verify deployment

Use the Azure portal to verify that Defender for Containers components were deployed successfully.

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure subscription.

1. Verify that **Containers** is set to **On**.

1. Select **Settings** next to Containers and confirm the required components are enabled.

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Verify that recommendations for AKS clusters appear, such as:

    - **Azure Kubernetes Service clusters should have Defender profile enabled**
    - **Azure Policy for Kubernetes should be installed and enabled**

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

- An AWS account with permissions to create and manage IAM roles and deploy CloudFormation stacks. Learn how to [connect your AWS account to Microsoft Defender for Cloud](quickstart-onboard-aws.md).

- One or more Amazon EKS clusters running Kubernetes version 1.19 or later.

- Container images stored in Amazon ECR.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Enable Defender for Containers

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan configuration options.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless threat protection**
        - If enabled, set the retention period for your audit logs
    - **Auto provision Defender's sensor for Azure Arc**
    - **Auto provision Azure Policy extension for Azure Arc**
    - **Kubernetes API access**
    - **Registry access**
        - If enabled, optionally enable security fidings

1. Select **Continue**.

1. Select **Save**.

## Grant control plane permissions

Control plane permissions must be configured if you enabled Agentless discovery for Kubernetes. Grant permissions by using one of the following methods:

### Option 1: Use the Python script

Run the [Python onboarding repository script](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md) to automatically add the required role mapping to your cluster.

This script adds the Defender for Cloud role
`MDCContainersAgentlessDiscoveryK8sRole` to the `aws-auth` ConfigMap.

### Option 2: Use eksctl

You can manually create the IAM identity mapping:

```bash
eksctl create iamidentitymapping \
  --cluster my-cluster \
  --region region-code \
  --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
  --group system:masters \
  --no-duplicate-arns
```

## Verify deployment

Use the Azure portal to verify that Defender for Containers components were deployed successfully.

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

1. Verify that:

    - Connection status shows **Connected**
    - **Containers** plan is **On**
    - Last sync time is recent

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Verify that EKS-related recommendations appear, such as:

   - **EKS clusters should have Microsoft Defender’s extension for Azure Arc installed**

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

- A GCP project connected to Microsoft Defender for Cloud. If you haven’t connected your project yet, see [Connect your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- One or more GKE clusters running Kubernetes version 1.19 or later.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Enable Defender for Containers

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan settings.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless threat protection**
    - **Auto provision Defender's sensor for Azure Arc**
        - If needed, enable Defender Security Gating
    - **Auto provision Azure Policy extension for Azure Arc**
    - **Kubernetes API access**
    - **Registry access**
        - If needed, enable security fidings

1. Select **Continue**.

1. Select **Next: Configure access**.

1. Select **Next: Review and create**.

1. Select **Save**.

## Verify deployment

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. Verify that:

    - Connection status shows **Connected**
    - **Containers** plan is **On**
    - Last sync time is recent

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Verify that GKE-related recommendations appear, such as:

    - **GKE clusters should be connected to Azure Arc**
    - **Arc-enabled Kubernetes clusters should have Defender extension installed**

---

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)

- [Deploy Defender for Containers components using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Troubleshoot Defender for Containers on AWS (EKS)](defender-for-containers-aws-troubleshoot.md)

- [Disable Microsoft Defender for Containers](defender-for-containers-remove.md)