---
title: Enable Defender for Containers using the Azure portal
description: Learn how to enable Microsoft Defender for Containers for Kubernetes environments across Azure, AWS, and Google Cloud by using the Azure portal.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/19/2026
---

# Enable Defender for Containers using the Azure portal

This article explains how to enable Microsoft Defender for Containers and deploy its components by using the Azure portal for different Kubernetes environments.

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

   - **Agentless scanning for machines**
   - **Defender sensor**
   - **Azure Policy**
   - **Kubernetes API access**
   - **Registry access**

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

- EKS clusters must be connectable to Azure Arc.

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

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

1. Select **Continue**.

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

- GKE clusters must be connectable to Azure Arc.

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

   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

1. Select **Continue**.

1. Select **Next: Configure access**.

1. CHECK THE FOLLOWING:

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

# [Arc-enabled Kubernetes](#tab/arc)

## Prerequisites

- An Arc-enabled Kubernetes cluster (Kubernetes version 1.19 or later).
- The cluster is connected to Azure Arc. See [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Network requirements

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-containers-network-requirements-arc-eks-gke.md)]

## Connect your cluster to Azure Arc

If your Kubernetes cluster isn’t already connected to Azure Arc:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Azure Arc**.

1. Select **Kubernetes clusters**, then select **Add**.

1. Select **Add a Kubernetes cluster with Azure Arc**.

1. Follow the connection instructions in the portal and run the generated registration script on your cluster.

1. Verify the cluster appears as **Connected**.

## Enable Defender for Containers

1. Go to **Microsoft Defender for Cloud**.

1. Select **Environment settings**.

1. Select the subscription that contains your Arc-enabled Kubernetes clusters.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** the relevant Defender for Containers components:

   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

1. Select **Continue**, and then select **Save**.

## Deploy Defender components to Arc-enabled clusters

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for **Azure Arc-enabled Kubernetes clusters should have Defender extension installed**.

1. Select the recommendation, select your clusters, and then follow the remediation steps to deploy the extensions.

> [!IMPORTANT]
> Select the check box next to the cluster name, not the linked cluster name itself.

## Verify deployment

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription that contains your Arc-enabled clusters and verify that **Containers** is set to **On**.

1. Go to your Arc-enabled Kubernetes cluster, then select **Extensions**.

1. Verify the extension status shows **Succeeded** for:

   - **Microsoft Defender for Containers**
   - **Azure Policy for Kubernetes** (if deployed)

1. Go to **Microsoft Defender for Cloud** > **Recommendations** and verify Arc-related recommendations appear for your clusters.

---

## Related content

- [Enable Defender for Containers using the Azure CLI](defender-for-containers-enable-azure-cli.md)

- [Troubleshoot Defender for Containers on AWS (EKS)](defender-for-containers-aws-troubleshoot.md)

- [Disable Microsoft Defender for Containers](defender-for-containers-remove.md)