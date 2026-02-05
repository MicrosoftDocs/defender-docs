---
title: Enable Defender for Containers in Microsoft Defender for Cloud
description: Learn how to enable the Microsoft Defender for Containers plan in Microsoft Defender for Cloud for Azure subscriptions, AWS connectors, and GCP connectors.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 01/19/2026
---

# Enable Defender for Containers in Microsoft Defender for Cloud

This article explains how to enable the Microsoft Defender for Containers plan in Microsoft Defender for Cloud.

# [Azure Kubernetes Service (AKS)](#tab/aks)

## Prerequisites

- AKS cluster supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. In the left menu, select **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** or **Off** the relevant Defender for Containers components:

    - **Agentless scanning for machines**  
      Performs agentless vulnerability and secret scanning on Kubernetes nodes.
    
    - **Defender sensor**  
      Deploys the Defender sensor to cluster nodes to collect runtime security telemetry used for threat detection.
    
    - **Azure Policy**  
      Deploys the Azure Policy for Kubernetes add-on to enable Kubernetes security posture assessments and related security recommendations.
    
    - **Kubernetes API access**  
      Allows Defender for Cloud to access the Kubernetes API for cluster inventory, configuration analysis, and capabilities that rely on Kubernetes metadata.
    
    - **Registry access**  
      Enables agentless vulnerability assessment for container images stored in connected registries.

1. Select **Continue**.

1. Select **Save**.

## Verify the plan is enabled

1. Sign in to the [Azure portal](https://portal.azure.com).

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

- Container images stored in Amazon ECR. (inbal B) 

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan configuration options.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless threat protection**  
      Collects Kubernetes control plane audit logs and analyzes them for control plane threat detections. Logs are routed through AWS services (such as CloudWatch, S3, Kinesis, and SQS).
        - If enabled, set the audit log retention period (in days) to control how long control plane audit logs are stored.
    
    - **Auto provision Defender's sensor for Azure Arc**  
      Deploys the Defender sensor as an Azure Arc Kubernetes extension. The sensor runs as a DaemonSet on cluster nodes and provides runtime threat detection based on node and workload telemetry.
    
    - **Auto provision Azure Policy extension for Azure Arc**  
      Deploys the Azure Policy extension to the cluster to enable Kubernetes security posture assessments and related security recommendations.
    
    - **Kubernetes API access**  
      Allows Defender for Cloud to access the Kubernetes API server for cluster inventory, configuration analysis, and capabilities that rely on Kubernetes metadata and state.
    
    - **Registry access** 
      Enables agentless vulnerability assessment for container images in Amazon ECR. Images pushed to ECR are scanned automatically (typically within 24 hours).
        - **Security findings:** Generates findings and links them to container images when new images are pushed or existing images are updated.
    
    > [!IMPORTANT]  
    > If you enable agentless threat protection, Kubernetes API access, or registry access, [configure the required external settings](defender-for-containers-configure-external-requirements.md?tab=eks) so Defender for Cloud can collect the data those components rely on.

1. Select **Save**.

## Verify the plan is enabled

1. Sign in to the [Azure portal](https://portal.azure.com).

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

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan settings.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless threat protection**  
      Collects Kubernetes control plane audit logs and analyzes them for control plane threat detections. Logs are exported from GKE to your Google Cloud project.
    
    - **Auto provision Defender's sensor for Azure Arc**  
      Deploys the Defender sensor as an Azure Arc Kubernetes extension. The sensor runs as a DaemonSet on cluster nodes and provides runtime threat detection based on node and workload telemetry.
        - **Enable Defender Security Gating**  
        Adds an admission control layer that evaluates deployments against security policies before workloads run in the cluster.
    
    - **Auto provision Azure Policy extension for Azure Arc**  
      Deploys the Azure Policy extension to the cluster to enable Kubernetes security posture assessments and related security recommendations.
    
    - **Kubernetes API access**  
      Allows Defender for Cloud to access the Kubernetes API server for cluster inventory, configuration analysis, and capabilities that rely on Kubernetes metadata and cluster state.
    
    - **Registry access**  
      Enables agentless vulnerability assessment for container images stored in Google Container Registry (GCR) and Artifact Registry.
        - **Security findings:** Generates findings and links them to container images when new images are pushed or existing images are updated.

    > [!IMPORTANT]  
    > If you enable agentless threat protection or registry access, [configure the required external settings](defender-for-containers-configure-external-requirements.md?tab=gke) so Defender for Cloud can collect the data those components rely on.

1. Select **Save**.

## Verify the plan is enabled

1. Sign in to the [Azure portal](https://portal.azure.com).

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

# [Azure Arc–enabled Kubernetes](#tab/arc)

## Prerequisites

To enable Defender for Containers on an Azure Arc-enabled Kubernetes cluster, make sure that it is:

- [Connected to Azure using Azure Arc–enabled Kubernetes](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

- Supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the **Azure subscription** that contains the Azure Arc–enabled Kubernetes cluster resource.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless scanning for machines**  
      Performs agentless vulnerability and secret scanning on Kubernetes nodes.
    
    - **Defender sensor**  
      Deploys the Defender sensor to cluster nodes to collect runtime security telemetry used for threat detection.
    
    - **Azure Policy**  
      Deploys the Azure Policy for Kubernetes add-on to enable Kubernetes security posture assessments and related security recommendations.
    
    - **Kubernetes API access**  
      Allows Defender for Cloud to access the Kubernetes API for cluster inventory, configuration analysis, and capabilities that rely on Kubernetes metadata.
    
    - **Registry access**  
      Enables agentless vulnerability assessment for container images stored in connected registries.

1. Select **Save**.

## Verify the plan is enabled

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure subscription.

1. Verify that **Containers** is set to **On**.

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Verify that recommendations for Arc-enabled Kubernetes clusters appear, such as:

   - **Azure Arc-enabled Kubernetes clusters should have the Defender extension installed**

---

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)

- [Deploy Defender for Containers components using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Troubleshoot Defender for Containers on AWS (EKS)](defender-for-containers-aws-troubleshoot.md)

- [Disable Microsoft Defender for Containers](defender-for-containers-remove.md)