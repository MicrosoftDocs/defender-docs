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

Before you begin, make sure that: 

- You have an AKS cluster. See the [support matrix](support-matrix-defender-for-containers.md).

- You reviewed the required [network access and permissions](defender-for-containers-network-access.md#microsoft-defender-for-cloud-to-kubernetes-clusters).

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

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

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

## Prerequisites

Before you begin, make sure that: 

- You have an [AWS project onboarded to Microsoft Defender for Cloud](quickstart-onboard-aws.md).

- You have one or more Amazon EKS clusters running a supported Kubernetes version. See the [support matrix](support-matrix-defender-for-containers.md).

- You reviewed the required [network access and permissions](defender-for-containers-network-access.md#microsoft-defender-for-cloud-to-kubernetes-clusters).

- You reviewed the required [cloud IAM permissions](containers-permissions.md). 

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless threat protection**  
      Collects Kubernetes control plane audit logs and analyzes them for control plane threat detections. Logs are routed through AWS services (such as CloudWatch, S3, Kinesis, and SQS).
        - If enabled, set the audit log retention period (in days) to control how long control plane audit logs are stored.
    
    - **Auto provision Defender's sensor for Azure Arc**  
      Deploys the Defender sensor as an Azure Arc Kubernetes extension. The sensor runs as a DaemonSet on cluster nodes and provides runtime threat detection based on node and workload telemetry.

      > [!NOTE]
      > When automatic provisioning is enabled, the Defender sensor is installed after the cluster is discovered and can take several hours to complete.
    
    - **Auto provision Azure Policy extension for Azure Arc**  
      Deploys the Azure Policy extension to the cluster to enable Kubernetes security posture assessments and related security recommendations.
    
    - **Kubernetes API access**  
      Allows Defender for Cloud to access the Kubernetes API server for cluster inventory, configuration analysis, and capabilities that rely on Kubernetes metadata and state.
    
    - **Registry access** 
      Enables agentless vulnerability assessment for container images in Amazon ECR. Images pushed to ECR are scanned automatically (typically within 24 hours).
        - **Security findings:** Generates findings and links them to container images when new images are pushed or existing images are updated.

1. Select **Save**.

1. Select **Next : Configure access >**.

1. Regenerate and update the AWS CloudFormation template to apply the required permissions for the enabled components.

1. Select **Next: Review and generate >**.

1. Select **Update**.

# [Google Kubernetes Engine (GKE)](#tab/gke)

## Prerequisites

Before you begin, make sure that:

- You have a [GCP project onboarded to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- You have oe or more Google Kubernetes Engine (GKE) clusters running a supported Kubernetes version. See the [support matrix](support-matrix-defender-for-containers.md).

- You reviewed the required [network access and permissions](defender-for-containers-network-access.md#microsoft-defender-for-cloud-to-kubernetes-clusters).

- You reviewed the required [cloud IAM permissions](containers-permissions.md). 

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** the relevant Defender for Containers components:

    - **Agentless threat protection**  
      Collects Kubernetes control plane audit logs and analyzes them for control plane threat detections. Logs are exported from GKE to your Google Cloud project.
    
    - **Auto provision Defender's sensor for Azure Arc**  
      Deploys the Defender sensor as an Azure Arc Kubernetes extension. The sensor runs as a DaemonSet on cluster nodes and provides runtime threat detection based on node and workload telemetry.
        - **Enable Defender Security Gating**  
        Adds an admission control layer that evaluates deployments against security policies before workloads run in the cluster.

      > [!NOTE]
      > When automatic provisioning is enabled, the Defender sensor is installed after the cluster is discovered and can take several hours to complete.
      
    - **Auto provision Azure Policy extension for Azure Arc**  
      Deploys the Azure Policy extension to the cluster to enable Kubernetes security posture assessments and related security recommendations.
    
    - **Kubernetes API access**  
      Allows Defender for Cloud to access the Kubernetes API server for cluster inventory, configuration analysis, and capabilities that rely on Kubernetes metadata and cluster state.
    
    - **Registry access**  
      Enables agentless vulnerability assessment for container images stored in Google Container Registry (GCR) and Artifact Registry.
        - **Security findings:** Generates findings and links them to container images when new images are pushed or existing images are updated.

1. Select **Save**.

1. Select **Next : Configure access >**.

1. Regenerate and redeploy the onboarding script in your GCP project to apply the required permissions for the enabled components.

1. Select **Next: Review and generate >**.

1. Select **Update**.

# [Azure Arc-enabled Kubernetes](#tab/arc)

## Prerequisites

Before you begin, make sure that:

- Your cluster is:
    - [Connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).
    - Supported by Defender for Containers. See the [support matrix](support-matrix-defender-for-containers.md).

- You reviewed the required [network access and permissions](defender-for-containers-network-access.md#microsoft-defender-for-cloud-to-kubernetes-clusters).

## Enable the Defender for Containers plan

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the **Azure subscription** that contains the Azure Arc-enabled Kubernetes cluster resource.

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

---

## Verify the plan is enabled

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription.

1. Verify that **Containers** is set to **On**.

1. Select **Settings** next to Containers and confirm the required components are enabled.

## Related content

- [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md)

- [Deploy Defender for Containers components using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)