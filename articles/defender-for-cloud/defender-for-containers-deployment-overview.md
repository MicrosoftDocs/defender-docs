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

### [Arc-enabled Kubernetes](defender-for-containers-arc-overview.md)

For on-premises and IaaS Kubernetes clusters connected through Azure Arc:

- Hybrid cloud security management
- Support for any CNCF-certified Kubernetes distribution
- Centralized security through Azure
- Works with Rancher, Tanzu, and more

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

## Common features across all environments

Defender for Containers provides the following key features across all supported environments:

- **Vulnerability assessment** - Continuously scans container images for known vulnerabilities
- **Runtime threat protection** - Real-time detection of threats and anomalous behavior in your Kubernetes clusters
- **Security posture management** - Identifies misconfigurations and provides hardening recommendations
- **Compliance assessment** - Evaluates clusters against industry standards like CIS Kubernetes Benchmark
- **Network security** - Monitors and alerts on suspicious network activities
- **File integrity monitoring** - Detects changes to critical system files
- **Kubernetes audit log analysis** - Analyzes API server audit logs for security events

## Prerequisites

Before deploying Defender for Containers, ensure you have:

- An active Azure subscription
- Microsoft Defender for Cloud enabled on your subscription
- Owner or Contributor role on the subscription
- Kubernetes cluster version 1.19 or later (version support varies by provider)
- Network connectivity to Azure services

## Deployment options

For each environment, you can choose between:

- **Portal deployment** - Guided experience through Azure portal
- **Programmatic deployment** - Automation using CLI, API, or Infrastructure as Code

## Key capabilities across all environments

Defender for Containers provides comprehensive protection through three main pillars:

### Vulnerability assessment

- **Container registry scanning** - Continuously scans images in ACR, ECR, GAR, GCR, Docker Hub, and JFrog Artifactory
- **Runtime vulnerability assessment** - Identifies vulnerabilities in running containers (registry-based and agentless)
- **Operating system coverage** - Supports major Linux distributions and Windows Server
- **Language-specific package detection** - Scans for vulnerabilities in Python, Node.js, .NET, Java, and more

### Runtime protection

- **Control plane detection** - Monitors Kubernetes audit logs for suspicious API activities.
- **Workload detection** - Provides real-time threat detection for running containers.
- **Binary drift detection** - Identifies unauthorized executables in containers.
- **DNS detection** (Preview) - Monitors DNS activities for threats.
- **Advanced hunting in XDR** (Preview) - Integrates with Microsoft XDR for investigation.
- **Malware detection** - Scans for known malware (availability varies by platform).

### Security posture management

- **Agentless discovery** - Uses API-based discovery of clusters, configurations, and deployments.
- **Control plane hardening** - Evaluates cluster configurations against security benchmarks.
- **Workload hardening** - Provides Kubernetes workload protection recommendations.
- **CIS Kubernetes Benchmark** - Assesses compliance against industry standards.
- **Attack path analysis** - Identifies potential attack vectors in your environment.
- **Enhanced risk hunting** - Enables proactive security investigation through Security Explorer.

### Additional capabilities

- **Gated deployment** (Preview) - Controls image deployment based on security policies.
- **Comprehensive inventory** - Offers full visibility into containers, images, and configurations.
- **Integration with cloud-native services** - Provides native support for each cloud provider's container services.

> [!NOTE]
> Feature availability varies by platform and deployment method. For detailed platform-specific capabilities, see the [support matrix for Defender for Containers](support-matrix-defender-for-containers.md).

## Next steps

Choose your environment to get started:

- [Deploy on Azure (AKS)](defender-for-containers-azure-overview.md) - For native Azure deployments
- [Deploy on Arc-enabled Kubernetes](defender-for-containers-arc-overview.md) - For hybrid and on-premises
- [Deploy on AWS (EKS)](defender-for-containers-aws-overview.md) - For Amazon EKS clusters
- [Deploy on GCP (GKE)](defender-for-containers-gcp-overview.md) - For Google GKE clusters

For a comparison of features across environments, see [Support matrix for Defender for Containers](support-matrix-defender-for-containers.md).
