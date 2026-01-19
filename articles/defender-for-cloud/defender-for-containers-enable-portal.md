---
title: Enable Defender for Containers via Azure portal by environment
description: Learn how to enable Microsoft Defender for Containers for Kubernetes environments across Azure, AWS, and Google Cloud by using the Azure portal.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/19/2026
---

# Enable Defender for Containers via Azure portal by environment

Microsoft Defender for Containers is enabled through Microsoft Defender for Cloud. The enablement process differs depending on where your Kubernetes clusters are running.

Use the tabs below to follow the enablement steps for your Kubernetes environment.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Enable Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. In the left menu, select **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** or **Off** the relevant Defender for Containers components:

   - **Agentless scanning for machines**
   - **Defender sensor**
   - **Azure Policy**
   - **Kubernetes API access**
   - **Registry access**

1. Select **Continue**.

1. Review the monitoring coverage page.

1. Select **Continue**.

1. Review the configuration summary and select **Save**.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

### AWS-specific requirements

- An AWS account with permissions to create and manage IAM roles and deploy CloudFormation stacks
- One or more Amazon EKS clusters running Kubernetes version 1.19 or later
- Container images stored in Amazon ECR

## Enable Defender for Containers

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS subscription.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan configuration options.

1. Toggle **On** the relevant Defender for Containers components:

   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

1. Select **Save**.

## Deploy Defender for Containers components

### Grant control plane permissions

**Required if you enabled**: Agentless discovery for Kubernetes

Grant control plane permissions by using one of the following methods.

**Option 1: Use the Python script**

Run the Python script provided in the onboarding repository to add the Defender for Cloud role
`MDCContainersAgentlessDiscoveryK8sRole` to the `aws-auth` ConfigMap.

**Option 2: Use eksctl**

```bash
eksctl create iamidentitymapping \
  --cluster my-cluster \
  --region region-code \
  --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \
  --group system:masters \
  --no-duplicate-arns
```

## Connect EKS clusters to Azure Arc

**Required if you enabled**: Defender DaemonSet or Azure Policy for Kubernetes

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for the recommendation **EKS clusters should have Microsoft Defender's extension for Azure Arc installed**.

1. Follow the remediation steps to connect your clusters.

## Deploy the Defender sensor

After connecting your EKS clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations related to installing the Defender extension.

1. Follow the remediation steps to deploy the sensor.

> [!NOTE]
> You can also deploy the Defender sensor by using Helm for more control over the deployment configuration.

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

### GCP-specific requirements

- A GCP project connected to Microsoft Defender for Cloud
- One or more GKE clusters running Kubernetes version 1.19 or later

## Enable Defender for Containers

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan settings.

1. Toggle **On** the relevant Defender for Containers components:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

1. Select **Continue**.

1. Select **Next: Configure access**.

1. In the Azure portal, copy the setup script from the **Configure access** step.

1. Open Google Cloud Shell or a local terminal with `gcloud` configured.

1. Run the setup script. The script:
    - Creates a service account and assigns the required IAM roles
    - Configures workload identity federation between GCP and Azure
    - Enables the required Google Cloud APIs

1. Copy the service account email from the script output.

1. Return to the Azure portal and paste the service account email.

1. Select **Next: Review and create**, then select **Save**.

## Deploy Defender for Containers components

### Connect GKE clusters to Azure Arc

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for the recommendation **GKE clusters should be connected to Azure Arc**.

1. Follow the remediation steps to connect your clusters.

### Deploy the Defender sensor

After connecting your GKE clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for the recommendation **Arc-enabled Kubernetes clusters should have Defender extension installed**.

1. Select the clusters and follow the remediation steps to deploy the sensor.

> [!NOTE]
> You can also deploy the Defender sensor by using Helm for more control over the deployment configuration.

---

## Next steps

