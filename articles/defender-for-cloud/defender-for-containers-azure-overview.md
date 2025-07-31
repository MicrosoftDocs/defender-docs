---
title: Defender for Containers on Azure (AKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Azure Kubernetes Service (AKS) clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on Azure (AKS) - Overview

Microsoft Defender for Containers provides enterprise-grade security for Azure Kubernetes Service (AKS) clusters, offering comprehensive protection through vulnerability scanning, runtime threat detection, and security posture management—all natively integrated with Azure services.

## What is Defender for Containers?

Defender for Containers is a cloud-native security solution that protects containerized applications throughout their lifecycle. For Azure environments, it provides seamless integration with AKS to deliver real-time protection, continuous security assessments, and actionable recommendations without requiring complex configurations or third-party tools.

> [!TIP]
> For a comprehensive overview of Defender for Containers capabilities across all environments, see [Overview of Microsoft Defender for Containers](defender-for-containers-introduction.md).

The solution helps security and DevOps teams prevent vulnerabilities from reaching production, detect and respond to runtime threats, and maintain compliance with security standards—all through a unified experience in Microsoft Defender for Cloud.

## How it works with Azure

Defender for Containers leverages native Azure integrations to provide security without complexity. Once enabled on your subscription, the solution:

- Automatically discovers all AKS clusters and container registries in your Azure subscriptions
- Deploys lightweight security sensors using Azure Policy for consistent coverage
- Scans container images in Azure Container Registry (ACR) for vulnerabilities
- Monitors runtime behavior using Azure-native telemetry
- Provides security recommendations aligned with Azure best practices
- Generates alerts that integrate with Azure Security Center and Microsoft Sentinel

This deep integration means you get comprehensive security without managing additional infrastructure, complex network configurations, or separate security tools.

## Key capabilities

Defender for Containers delivers security across three critical areas:

| Capability | Description | Key Features |
|------------|-------------|--------------|
| **Vulnerability assessment** | Continuously scans container images in ACR for known vulnerabilities | • Scan on push and periodic rescanning<br>• Support for Linux and Windows images<br>• CVSS scoring and detailed remediation<br>• Integration with Azure DevOps pipelines |
| **Runtime threat protection** | Monitors AKS clusters in real-time for malicious activities and anomalies | • Kubernetes audit log analysis<br>• Container behavior monitoring<br>• Network anomaly detection<br>• Integration with Microsoft Sentinel |
| **Security posture management** | Evaluates cluster configurations against security benchmarks | • CIS Kubernetes Benchmark<br>• Azure Security Benchmark<br>• Custom compliance policies<br>• Automated remediation options |

## Architecture overview

The Defender for Containers architecture on Azure is designed for simplicity and effectiveness:

**Defender Sensor**: Deployed as a DaemonSet on each AKS cluster, collects runtime telemetry and security events with minimal performance impact.

**Azure Policy for Kubernetes**: Continuously evaluates cluster configurations and enforces security policies across all clusters.

**ACR Integration**: Native integration with Azure Container Registry provides automatic vulnerability scanning without additional configuration.

**Log Analytics**: Centralized logging and analytics enable advanced threat hunting and compliance reporting.

These components work together seamlessly, requiring no inbound connections to your clusters and leveraging Azure's native security infrastructure.

## Deployment options

Defender for Containers supports flexible deployment approaches to match your operational preferences:

- **[Azure portal deployment](defender-for-containers-azure-enable-all-portal.md)** - Guided, visual experience ideal for initial setup and management
- **[Azure CLI and PowerShell](defender-for-containers-azure-deploy.md#enable-defender-for-containers)** - Script-based deployment for automation scenarios
- **[Infrastructure as Code](defender-for-containers-azure-deploy.md#infrastructure-as-code-examples)** - Terraform, Bicep, or ARM templates for repeatable deployments
- **[Azure Policy](defender-for-containers-azure-deploy.md#batch-deployment-script)** - At-scale deployment and compliance enforcement
- **[Helm](deploy-helm.md)** - Kubernetes package manager deployment

Choose the approach that best aligns with your organization's DevOps practices and governance requirements.

## Prerequisites

Before deploying Defender for Containers on AKS, ensure you meet these requirements:

- Microsoft Defender for Cloud with appropriate permissions
- AKS clusters running Kubernetes 1.19 or later
- Azure Container Registry for image vulnerability scanning
- Network connectivity for outbound HTTPS to Azure endpoints

> [!NOTE]
> For detailed prerequisites and setup instructions, see:
>
> - [Enable all components via portal](defender-for-containers-azure-enable-all-portal.md#prerequisites)
> - [Deploy programmatically](defender-for-containers-azure-deploy.md#prerequisites)

## Coverage and features

### Supported scenarios

Defender for Containers on Azure supports:

- All AKS cluster configurations (public, private, Arc-enabled)
- Both Linux and Windows node pools
- Managed and user-assigned identities
- Integration with Azure Policy and Microsoft Sentinel
- Multi-subscription deployments through management groups

### Azure-specific features

- **Native ACR integration**: Automatic scanning without registry credentials
- **Azure Policy enforcement**: Consistent security policies across all clusters
- **Managed identity support**: Simplified authentication and authorization

## Pricing

Defender for Containers uses Azure's consumption-based pricing model:

- **Core protection**: Charged per vCore hour for monitored AKS clusters
- **Container image scanning**: Charged per image scanned in ACR
- **No additional charges** for recommendations, alerts, or Azure Policy

For current pricing and cost estimation, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

Ready to secure your AKS clusters? Choose your deployment path:

- [Enable all components via portal](defender-for-containers-azure-enable-all-portal.md) - Recommended for comprehensive protection
- [Deploy specific components via portal](defender-for-containers-azure-deploy-portal.md) - For selective deployment or troubleshooting
- [Deploy programmatically](defender-for-containers-azure-deploy.md) - For automation and DevOps scenarios
- [Verify deployment](defender-for-containers-azure-verify.md) - Ensure all components are functioning correctly
