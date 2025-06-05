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
- Automatic deployment through Azure Policy
- Registry scanning for Azure Container Registry
- Runtime protection and threat detection

### [Arc-enabled Kubernetes](defender-for-containers-arc-overview.md)
For on-premises and IaaS Kubernetes clusters connected through Azure Arc:
- Hybrid cloud security management
- Support for any CNCF-certified Kubernetes distribution
- Centralized security through Azure

### [AWS (EKS)](defender-for-containers-eks-overview.md)
For Amazon Elastic Kubernetes Service clusters:
- Multi-cloud security management
- AWS connector-based deployment
- Integration with AWS security services

### [GCP (GKE)](defender-for-containers-gke-overview.md)
For Google Kubernetes Engine clusters:
- Multi-cloud security management
- GCP connector-based deployment
- Integration with GCP security services

## Common features across all environments

[!INCLUDE[defender-for-containers-features](includes/defender-for-containers-features.md)]

## Prerequisites

Before deploying Defender for Containers, ensure you have:

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

## Next steps

- [Deploy Defender for Containers on Azure (AKS)](defender-for-containers-azure-overview.md)
- [Deploy Defender for Containers on Arc-enabled Kubernetes](defender-for-containers-arc-overview.md)
- [Deploy Defender for Containers on AWS (EKS)](defender-for-containers-eks-overview.md)
- [Deploy Defender for Containers on GCP (GKE)](defender-for-containers-gke-overview.md)