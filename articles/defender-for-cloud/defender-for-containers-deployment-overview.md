---
title: Defender for Containers deployment overview
description: Learn about the different deployment options for enabling Microsoft Defender for Containers across various Kubernetes environments.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers deployment overview

Microsoft Defender for Containers provides advanced threat protection and security capabilities for your containerized environments across multiple platforms. This guide helps you choose the right deployment path for your Kubernetes environment.

## Supported environments

Defender for Containers supports the following Kubernetes environments:

- **Azure (AKS)** - Azure Kubernetes Service
- **Arc-enabled Kubernetes** - On-premises and IaaS Kubernetes clusters
- **AWS (EKS)** - Amazon Elastic Kubernetes Service
- **GCP (GKE)** - Google Kubernetes Engine

## Choose your deployment path

Select the deployment guide that matches your Kubernetes environment:

### [Azure (AKS)](defender-for-containers-azure-overview.md)

For Azure Kubernetes Service clusters, Defender for Containers provides:

- Native integration with Azure services
- Automatic deployment across all clusters in a subscription
- Registry scanning for Azure Container Registry
- Runtime protection and threat detection
- No cross-cloud connector required

### [AWS (EKS)](defender-for-containers-aws-overview.md)

For Amazon Elastic Kubernetes Service clusters:

- Multicloud security management
- AWS connector-based deployment
- Integration with AWS security services
- ECR vulnerability scanning
- CloudFormation template deployment

### [GCP (GKE)](defender-for-containers-gcp-overview.md)

For Google Kubernetes Engine clusters, Defender for Containers provides:

- Multicloud security management
- GCP connector-based deployment
- Integration with GCP security services
- GCR and Artifact Registry scanning
- Support for GKE Autopilot

### [Arc-enabled Kubernetes (Preview)](defender-for-containers-arc-overview.md)

For on-premises and IaaS Kubernetes clusters connected through Azure Arc:

- Hybrid cloud security management
- Support for any CNCF-certified Kubernetes distribution
- Centralized security through Azure
- Works with Rancher, Tanzu, and more

## Prerequisites

Before deploying Defender for Containers, ensure you have:

- An active Azure subscription
- Microsoft Defender for Cloud enabled on your subscription
- Owner or Contributor role on the subscription
- Kubernetes cluster version 1.19 or later (version support varies by provider)
- Network connectivity to Azure services
- Sufficient cluster resources for Defender components - see [Defender sensor component details](defender-for-containers-architecture.md#defender-sensor-component-details)

## Deployment options

For each environment, you can choose between:

- **Portal deployment** - Guided experience through Azure portal
- **Programmatic deployment** - Automation using CLI, API, or Infrastructure as Code


> [!NOTE]
> Feature availability varies by platform and deployment method. For detailed platform-specific capabilities, see the [support matrix for Defender for Containers](support-matrix-defender-for-containers.md).

## Next steps

Choose your environment to get started:

- [Deploy on Azure (AKS)](defender-for-containers-azure-overview.md) - For native Azure deployments
- [Deploy on Arc-enabled Kubernetes](defender-for-containers-arc-overview.md) - For hybrid and on-premises
- [Deploy on AWS (EKS)](defender-for-containers-aws-overview.md) - For Amazon EKS clusters
- [Deploy on GCP (GKE)](defender-for-containers-gcp-overview.md) - For Google GKE clusters

For a comparison of features across environments, see [Support matrix for Defender for Containers](support-matrix-defender-for-containers.md).
