---
title: Defender for Containers Deployment Overview
description: Learn about the different deployment options for enabling Microsoft Defender for Containers across various Kubernetes environments.
ms.topic: overview
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Defender for Containers deployment overview

Microsoft Defender for Containers provides advanced threat protection and security capabilities for your containerized environments across multiple platforms. This guide helps you choose the right deployment path for your Kubernetes environment.

## Supported environments

Defender for Containers supports the following Kubernetes environments:

- **Azure (AKS)** - Azure Kubernetes Service
- **AWS (EKS)** - Amazon Elastic Kubernetes Service
- **GCP (GKE)** - Google Kubernetes Engine
- **Arc-enabled Kubernetes** (Preview) - On-premises and IaaS Kubernetes clusters

## Choose your deployment path

Select the deployment guide that matches your Kubernetes environment:

### [Azure (AKS)](defender-for-containers-azure-overview.md)

For Azure Kubernetes Service clusters, Defender for Containers provides:

- Native integration with Azure services
- Automatic deployment across all clusters in a subscription
- No cross-cloud connector required
- Vulnerability assessment (VA) features, including registry scanning for Azure Container Registry
- Security posture management features, including containers software supply chain protection
- Runtime protection features, including detection investigation and response, integrated into Microsoft XDR
- Containers software supply chain protection features, including gated deployment of container images

### [AWS (EKS)](defender-for-containers-aws-overview.md)

For Amazon Elastic Kubernetes Service clusters, Defender for Containers provides:

- Centralized security management in Defender for Cloud
- AWS connector-based deployment, including CloudFormation template support
- Vulnerability assessment (VA) features, including registry scanning for Elastic Container Registry (ECR)
- Security posture management features
- Runtime protection features, including detection investigation and response, integrated into Microsoft XDR
- Containers software supply chain protection features, including gated deployment of container images


### [GCP (GKE)](defender-for-containers-gcp-overview.md)

For Google Kubernetes Engine clusters, Defender for Containers provides:

- Centralized security management in Defender for Cloud
- GCP connector-based deployment
- GKE Autopilot support
- Vulnerability assessment (VA) features, including registry scanning for Google Container Registry (GCR) and Google Artifact Registry (GAR)
- Security posture management features
- Runtime protection features, including detection investigation and response, integrated into Microsoft XDR
- Containers software supply chain protection features, including gated deployment of container images


### [Arc-enabled Kubernetes (Preview)](defender-for-containers-arc-overview.md)

For on-premises and IaaS Kubernetes clusters connected through Azure Arc, Defender for Containers provides:

- Hybrid cloud security management
- Centralized security through Azure
- Works with CNCF-certified Kubernetes distributions
- Containers software supply chain protection features, including gated deployment of container images


## Prerequisites

Before deploying Defender for Containers, make sure you have:

- An active Azure subscription
- Owner or Contributor role on the subscription
- Kubernetes cluster version 1.19 or later
- Network connectivity to Azure services
- For sensor-based capabilities: Sufficient cluster resources for Defender components - see [Defender sensor component details](defender-for-containers-architecture.md#defender-sensor-component-details)

> [!NOTE]
> Agentless capabilities don't require cluster resources or sensor deployment. For a detailed list of supported features, along with their availability and characteristics, see the [support matrix for Defender for Containers](support-matrix-defender-for-containers.md). The support matrix indicates whether each feature is agentless or sensor-based under the **Enablement method** column.

## Enablement and deployment options

Defender for Containers involves two main steps:

1. **Enabling the plan** - You can enable the plan through:

    - Azure portal
    - Programmatically (Azure CLI, REST API, PowerShell)

1. **Deploying the sensor**

    - AKS built-in addon - You can deploy through:
        - Azure portal
        - Programmatically (Azure CLI, REST API, IaC templates)
    - Helm chart deployment

## Next steps

Choose your environment to get started:

- [Deploy on Azure (AKS)](defender-for-containers-azure-overview.md) - For native Azure deployments
- [Deploy on Arc-enabled Kubernetes](defender-for-containers-arc-overview.md) - For hybrid and on-premises
- [Deploy on AWS (EKS)](defender-for-containers-aws-overview.md) - For Amazon EKS clusters
- [Deploy on GCP (GKE)](defender-for-containers-gcp-overview.md) - For Google GKE clusters

For a comparison of features across environments, see [Support matrix for Defender for Containers](support-matrix-defender-for-containers.md).
