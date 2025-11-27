---
title: Defender for Containers on Arc-enabled Kubernetes - Overview
description: Learn about Microsoft Defender for Containers capabilities for Arc-enabled Kubernetes clusters.
ms.topic: overview
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Defender for Containers on Arc-enabled Kubernetes - Overview

Microsoft Defender for Containers extends enterprise-grade security to your Kubernetes clusters running anywhere—on-premises, in datacenters, at the edge, or in other clouds—through Azure Arc integration. This solution provides the same comprehensive protection you get in the cloud, including vulnerability assessment, runtime threat detection, software supply chain capabilities, and security posture management, for your hybrid and multicloud Kubernetes environments.

## What is Defender for Containers on Arc?

Defender for Containers on Arc brings cloud-native security to Kubernetes clusters outside of Azure. By leveraging Azure Arc's control plane, it enables organizations to secure their entire Kubernetes estate from a single pane of glass, regardless of where clusters are running. This unified approach ensures consistent security policies, centralized threat detection, and compliance reporting across all your Kubernetes infrastructure.

The solution addresses the unique challenges of securing distributed Kubernetes deployments, from air-gapped on-premises environments to edge computing scenarios, while maintaining the flexibility to work with any CNCF-certified Kubernetes distribution.

## How it works with Arc

Defender for Containers seamlessly integrates with Azure Arc-enabled Kubernetes to provide security without disrupting your existing operations. Once you connect your cluster to Azure Arc, Defender for Containers:

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
| **Runtime threat protection** | Monitors clusters in real-time for malicious activities and anomalies | • Distribution-agnostic monitoring<br>• Behavioral analytics<br>• Kubernetes-aware detection<br>• Custom alert rules |
| **Security posture management** | Evaluates configurations against security benchmarks and compliance standards | • CIS Kubernetes Benchmark<br>• Custom policy support<br>• Multicluster governance<br>• Automated remediation |
| **Gated deployment** | Prevents vulnerable or misconfigured workloads from reaching production | • Block deployments based on vulnerability severity<br>• Enforce security baselines for configurations<br>• Integration with Azure Policy and admission controllers<br>• DevOps pipeline gates |

## Architecture overview

The Defender for Containers architecture on Arc is flexible and secure:

**Azure Arc agents**: Securely connect your cluster to Azure. You can manage your cluster remotely while keeping local control.

**Defender extension**: Deploys through Arc's extension framework. It includes the security sensor DaemonSet and configuration controllers.

**Security sensor**: Lightweight pods that collect runtime telemetry, monitor system calls, and analyze network traffic without requiring privileged access.

**Policy engine**: Evaluates cluster configurations and workload specifications against security policies. It provides real-time compliance feedback.

**Log collection**: Flexible options for log forwarding. It supports both direct streaming and local aggregation scenarios.

These components work together to provide comprehensive security while respecting network boundaries and compliance requirements.

## Deployment options

Defender for Containers on Arc supports multiple deployment approaches to accommodate different operational requirements:

- **[Azure portal deployment](defender-for-containers-arc-enable-portal.md)** - Visual, guided experience for initial setup and small-scale deployments
- **[Azure CLI and scripts](defender-for-containers-arc-enable-programmatically.md#enable-defender-for-containers)** - Command-line deployment for automation and repeatability
- **[Helm charts](defender-for-containers-arc-enable-programmatically.md#deploy-the-defender-sensor)** - Native Kubernetes deployment method for teams familiar with Helm

Choose the deployment method that aligns with your security requirements, network constraints, and operational practices.

## Prerequisites

Before deploying Defender for Containers on Arc-enabled Kubernetes clusters, make sure you have the following prerequisites:

- CNCF-certified Kubernetes cluster (version 1.19 or later)
- Cluster already connected to Azure Arc and showing as "Connected"
- Outbound HTTPS connectivity to Azure endpoints (or configured proxy)
- Sufficient cluster resources for security components
- Appropriate Azure RBAC permissions for deployment

> [!NOTE]
> For detailed prerequisites including network requirements and supported configurations, see:
>
> - [Enable all components via portal](defender-for-containers-arc-enable-portal.md#prerequisites)
> - [Deploy programmatically](defender-for-containers-arc-enable-programmatically.md#prerequisites)

## Integration benefits

- **Unified security management**: Single dashboard for all Kubernetes clusters regardless of location
- **Consistent security policies**: Apply and enforce policies across hybrid infrastructure
- **Centralized threat intelligence**: Benefit from Microsoft's global threat intelligence
- **Simplified compliance**: Unified reporting for audit and compliance requirements
- **Cost optimization**: Pay only for what you protect with flexible pricing models

## Pricing

For current pricing details, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

Ready to secure your Arc-enabled Kubernetes clusters? Choose your path:

- [Enable all components via portal](defender-for-containers-arc-enable-portal.md) - Recommended for initial setup
- [Deploy programmatically](defender-for-containers-arc-enable-programmatically.md) - For automation and scale
- [Verify deployment](defender-for-containers-arc-verify.md) - Ensure components are working correctly
