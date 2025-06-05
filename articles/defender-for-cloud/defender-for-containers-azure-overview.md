---
title: Defender for Containers on Azure (AKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Azure Kubernetes Service (AKS) clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on Azure (AKS) - Overview

Microsoft Defender for Containers provides comprehensive security for Azure Kubernetes Service (AKS) clusters, including vulnerability assessment, runtime protection, and security hardening recommendations.

## What is protected?

Defender for Containers on Azure protects:

- **AKS clusters** - All AKS clusters in your Azure subscriptions
- **Container images** - Images stored in Azure Container Registry (ACR)
- **Runtime workloads** - Running containers and Kubernetes workloads

## Key capabilities

### Vulnerability assessment
- Scans container images in ACR for known vulnerabilities
- Provides detailed vulnerability reports with remediation guidance
- Supports both Linux and Windows container images

### Runtime threat protection
- Detects suspicious activities and potential threats in real-time
- Monitors container behavior and Kubernetes API activities
- Generates security alerts for anomalous activities

### Security posture management
- Provides security recommendations based on CIS Kubernetes Benchmark
- Identifies misconfigurations in AKS clusters
- Offers remediation steps for security issues

## Architecture

Defender for Containers uses the following components on AKS:

- **Defender sensor** - Deployed as a DaemonSet for runtime protection
- **Azure Policy for Kubernetes** - Enforces security policies
- **Log Analytics agent** - Collects security-relevant data

## Integration with Azure services

Defender for Containers seamlessly integrates with:

- **Azure Policy** - For automatic deployment and compliance
- **Azure Container Registry** - For image vulnerability scanning
- **Microsoft Defender for Cloud** - For centralized security management
- **Microsoft Sentinel** - For advanced threat hunting

## Prerequisites

Before enabling Defender for Containers on AKS:

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

Additionally for AKS:
- AKS cluster version 1.19 or later
- Azure CLI or Azure PowerShell for deployment
- Contributor role on the subscription or resource group

## Next steps

- [Deploy Defender for Containers on Azure (AKS)](defender-for-containers-azure-deploy.md)
- [Verify your Defender for Containers deployment](defender-for-containers-azure-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-azure-configure.md)