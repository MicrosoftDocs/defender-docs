---
title: Defender for Containers on Arc-enabled Kubernetes - Overview
description: Learn about Microsoft Defender for Containers capabilities for Arc-enabled Kubernetes clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on Arc-enabled Kubernetes - Overview

Microsoft Defender for Containers extends enterprise-grade security to your Kubernetes clusters running anywhere—on-premises, in datacenters, at the edge, or in other clouds—through Azure Arc integration. This provides the same comprehensive protection you get in the cloud, including vulnerability assessment, runtime threat detection, and security posture management, for your hybrid and multi-cloud Kubernetes environments.

## What is Defender for Containers on Arc?

Defender for Containers on Arc brings cloud-native security to Kubernetes clusters outside of Azure. By leveraging Azure Arc's control plane, it enables organizations to secure their entire Kubernetes estate from a single pane of glass, regardless of where clusters are running. This unified approach ensures consistent security policies, centralized threat detection, and compliance reporting across all your Kubernetes infrastructure.

The solution addresses the unique challenges of securing distributed Kubernetes deployments, from air-gapped on-premises environments to edge computing scenarios, while maintaining the flexibility to work with any CNCF-certified Kubernetes distribution.

## How it works with Arc

Defender for Containers seamlessly integrates with Azure Arc-enabled Kubernetes to provide security without disrupting your existing operations. Once your cluster is connected to Azure Arc, Defender for Containers:

- Automatically discovers and inventories all workloads running in your Arc-enabled clusters
- Deploys lightweight security sensors that monitor runtime behavior with minimal performance impact
- Collects and analyzes Kubernetes audit logs and cluster configurations
- Connects to your container registries for vulnerability scanning
- Streams security telemetry to Azure for centralized analysis and alerting
- Provides security recommendations based on industry benchmarks and best practices

This architecture ensures that sensitive workload data remains in your environment while security insights are processed in Azure, maintaining both security and compliance requirements.

## Key capabilities

Defender for Containers delivers comprehensive security across three critical areas:

| Capability | Description | Key Features |
|------------|-------------|--------------|
| **Vulnerability assessment** | Scans container images in connected registries for known vulnerabilities | • Support for private registries<br>• Air-gapped deployment options<br>• CVSS scoring and prioritization<br>• Integration with existing CI/CD |
| **Runtime threat protection** | Monitors clusters in real-time for malicious activities and anomalies | • Distribution-agnostic monitoring<br>• Behavioral analytics<br>• Kubernetes-aware detection<br>• Custom alert rules |
| **Security posture management** | Evaluates configurations against security benchmarks and compliance standards | • CIS Kubernetes Benchmark<br>• Custom policy support<br>• Multi-cluster governance<br>• Automated remediation |

## Supported distributions

Defender for Containers works with any CNCF-certified Kubernetes distribution connected through Azure Arc, including:

**Enterprise distributions**:

- VMware Tanzu Kubernetes Grid
- SUSE Rancher Kubernetes Engine (RKE/RKE2)
- Canonical Kubernetes

**Cloud distributions**:

- Amazon EKS Anywhere
- Google Anthos
- Oracle Cloud Native Environment

**Specialized environments**:

- Azure Stack HCI
- K3s for edge computing
- MicroK8s for IoT scenarios
- Custom or vanilla Kubernetes

Each distribution may require specific configuration adjustments, but the core security capabilities remain consistent across all platforms.

## Architecture overview

The Defender for Containers architecture on Arc is designed for flexibility and security:

**Azure Arc agents**: Establish secure connectivity between your cluster and Azure, enabling remote management while maintaining local control.

**Defender extension**: Deployed through Arc's extension framework, includes the security sensor DaemonSet and configuration controllers.

**Security sensor**: Lightweight pods that collect runtime telemetry, monitor system calls, and analyze network traffic without requiring privileged access.

**Policy engine**: Evaluates cluster configurations and workload specifications against security policies, providing real-time compliance feedback.

**Log collection**: Flexible options for log forwarding, supporting both direct streaming and local aggregation scenarios.

These components work together to provide comprehensive security while respecting network boundaries and compliance requirements.

## Deployment options

Defender for Containers on Arc supports multiple deployment approaches to accommodate different operational requirements:

- **[Azure portal deployment](defender-for-containers-arc-enable-all-portal.md)** - Visual, guided experience for initial setup and small-scale deployments
- **[Azure CLI and scripts](defender-for-containers-arc-deploy.md#using-azure-cli)** - Command-line deployment for automation and repeatability
- **[Infrastructure as Code](defender-for-containers-arc-deploy.md#infrastructure-as-code-examples)** - Terraform, ARM templates, or GitOps for enterprise deployments
- **[Helm charts](defender-for-containers-arc-deploy.md#using-helm)** - Native Kubernetes deployment method for teams familiar with Helm
- **[Air-gapped deployment](defender-for-containers-arc-deploy.md#deploy-to-air-gapped-environments)** - Offline installation for disconnected environments

Choose the deployment method that aligns with your security requirements, network constraints, and operational practices.

## Prerequisites

Before deploying Defender for Containers on Arc-enabled Kubernetes:

- CNCF-certified Kubernetes cluster (version 1.19 or later)
- Cluster already connected to Azure Arc and showing as "Connected"
- Outbound HTTPS connectivity to Azure endpoints (or configured proxy)
- Sufficient cluster resources for security components
- Appropriate Azure RBAC permissions for deployment

> [!NOTE]
> For detailed prerequisites including network requirements and supported configurations, see:
>
> - [Enable all components via portal](defender-for-containers-arc-enable-all-portal.md#prerequisites)
> - [Deploy programmatically](defender-for-containers-arc-deploy.md#prerequisites)

## Key scenarios

### Hybrid cloud security

Organizations running Kubernetes across multiple environments can standardize security operations using Defender for Containers on Arc. This enables consistent threat detection, vulnerability management, and compliance reporting whether clusters run in Azure, on-premises, or in other clouds.

### Edge computing protection

Edge locations often have unique constraints including limited bandwidth, intermittent connectivity, and resource limitations. Defender for Containers adapts to these scenarios with configurable data collection, local processing options, and optimized resource usage.

### Air-gapped environments

For highly secure or disconnected environments, Defender for Containers supports offline deployment and operation. Security data can be collected locally and transferred to Azure through secure mechanisms that comply with air-gap requirements.

### Compliance and governance

Multi-cluster environments require consistent policy enforcement and compliance validation. Defender for Containers enables centralized policy management while respecting local autonomy, supporting various compliance frameworks including CIS, PCI-DSS, and custom standards.

## Integration benefits

- **Unified security management**: Single dashboard for all Kubernetes clusters regardless of location
- **Consistent security policies**: Apply and enforce policies across hybrid infrastructure
- **Centralized threat intelligence**: Benefit from Microsoft's global threat intelligence
- **Simplified compliance**: Unified reporting for audit and compliance requirements
- **Cost optimization**: Pay only for what you protect with flexible pricing models

## Pricing

Defender for Containers on Arc follows a consumption-based pricing model:

- **Core protection**: Charged per vCore hour for protected nodes
- **Vulnerability scanning**: Charged per image scanned
- **No additional charges** for Arc connectivity or policy enforcement

For current pricing details, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

Ready to secure your Arc-enabled Kubernetes clusters? Choose your path:

- [Enable all components via portal](defender-for-containers-arc-enable-all-portal.md) - Recommended for initial setup
- [Deploy specific components](defender-for-containers-arc-deploy-portal.md) - For selective deployment
- [Deploy programmatically](defender-for-containers-arc-deploy.md) - For automation and scale
- [Verify deployment](defender-for-containers-arc-verify.md) - Ensure components are working correctly
