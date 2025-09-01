---
title: Defender for Containers on Azure (AKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Azure Kubernetes Service (AKS) clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on Azure (AKS) - Overview

Microsoft Defender for Containers provides enterprise-grade security for Azure Kubernetes Service (AKS) clusters. It offers comprehensive protection through vulnerability scanning, runtime threat detection, and security posture management—all natively integrated with Azure services.

## What is Defender for Containers?

Defender for Containers is a cloud-native security solution that protects containerized applications throughout their lifecycle. For Azure environments, it provides seamless integration with AKS to deliver real-time protection, continuous security assessments, and actionable recommendations without requiring complex configurations or third-party tools.

> [!TIP]
> For a comprehensive overview of Defender for Containers capabilities across all environments, see [Overview of Microsoft Defender for Containers](defender-for-containers-introduction.md).

The solution helps security and platform teams prevent vulnerabilities from reaching production, detect and respond to runtime threats, and maintain compliance with security standards—all through a unified experience in Microsoft Defender for Cloud.

## How it works with Azure

Defender for Containers leverages native Azure integrations to provide security without complexity. Once you enable it on your subscription, the solution:

- Automatically discovers all AKS clusters and container registries in your Azure subscriptions
- Deploys a lightweight security sensor, natively integrated in AKS Resource Provider (RP), used for runtime threat protection and AKS deployment gating
- Scans container images in Azure Container Registry (ACR) for vulnerabilities
- Monitors runtime behavior by using Azure-native telemetry
- Provides security recommendations aligned with Azure security and industry best practices
- Generates alerts that integrate with Microsoft XDR and Microsoft Sentinel

This deep integration means you get comprehensive security without managing extra infrastructure, complex network configurations, or separate security tools.

## Key capabilities

Defender for Containers provides security across three critical areas:

| Capability | Description | Key Features |
|------------|-------------|--------------|
| **Vulnerability assessment** | Scans container images throughout their lifecycle - in registries, runtime environments, and CI/CD pipelines | • Registry scanning (ACR push and periodic)<br>• Runtime vulnerability discovery<br>• CLI tool for pipeline integration<br>• Support for Linux and Windows images<br>• CVSS scoring and detailed remediation |
| **Runtime threat protection** | Monitors AKS clusters in real-time for malicious activities and anomalies | • Kubernetes audit log analysis<br>• Container behavior monitoring<br>• Network anomaly detection<br>• Integration with Microsoft Sentinel |
| **Security posture management** | Evaluates cluster configurations against security benchmarks | • CIS Kubernetes Benchmark<br>• Azure Security Benchmark<br>• Custom compliance policies<br>• Automated remediation options |
| **Gated deployment** | Prevents vulnerable or misconfigured workloads from reaching production | • Block deployments based on vulnerability severity<br>• Enforce security baselines for configurations<br>• Integration with Azure Policy and admission controllers<br>• DevOps pipeline gates |

## Architecture overview

For detailed architecture information, see [Container security architecture](defender-for-containers-architecture.md#architecture-for-each-kubernetes-environment).

Defender for Containers on AKS uses lightweight, Azure-managed components with outbound-only connectivity (no inbound access required):

- **Defender sensor (DaemonSet):** Runs on AKS nodes, collects runtime telemetry (Kubernetes events, process, network) and sends it securely to Defender for Cloud.
- **Azure Policy:** Deploys and updates the sensor at scale and enforces configuration baselines. Optional admission control can gate deployments.
- **ACR integration:** Push-triggered and periodic image scanning for Azure Container Registry. Optional pipeline and CLI scanning before images reach ACR.
- **Agentless discovery:** Provides visibility into your Kubernetes clusters without requiring any agents, using Azure native capabilities to discover and assess cluster configurations.
- **Microsoft XDR integration:** Seamlessly integrates with Microsoft's extended detection and response platform for unified security operations and incident response.

These components work together seamlessly, requiring no inbound connections to your clusters and leveraging Azure's native security infrastructure. Defender for Cloud supports Continuous Export to Microsoft Sentinel, Event Hubs, or Log Analytics for extended monitoring and analysis.

## Deployment options

Defender for Containers supports flexible deployment approaches to match your operational preferences:

- **[Azure portal deployment](defender-for-containers-azure-enable-portal.md)** - Guided, visual experience ideal for initial setup and management
- **[Azure programmatic deployment](defender-for-containers-azure-enable-programmatically.md)** - Script-based deployment for automation scenarios

Choose the approach that best aligns with your organization's DevOps practices and governance requirements.

## Prerequisites

Before deploying Defender for Containers on AKS, ensure you meet these requirements:

- AKS clusters running Kubernetes 1.19 or later
- Network connectivity for outbound HTTPS to Azure endpoints

> [!NOTE]
> For detailed prerequisites and setup instructions, see:
>
> - [Enable all components via portal](defender-for-containers-azure-enable-portal.md#prerequisites)
> - [Deploy programmatically](defender-for-containers-azure-enable-programmatically.md#prerequisites)

## Pricing

For current pricing and cost estimation, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

Ready to secure your AKS clusters? Choose your deployment path:

- [Enable all components via portal](defender-for-containers-azure-enable-portal.md) - Recommended for comprehensive protection
- [Deploy programmatically](defender-for-containers-azure-enable-programmatically.md) - For automation and DevOps scenarios
- [Verify deployment](defender-for-containers-azure-verify.md) - Ensure all components are functioning correctly
