---
title: Defender for Containers on Arc-enabled Kubernetes - Overview
description: Learn about Microsoft Defender for Containers capabilities for Arc-enabled Kubernetes clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on Arc-enabled Kubernetes - Overview

Microsoft Defender for Containers extends comprehensive security capabilities to your on-premises and IaaS Kubernetes clusters through Azure Arc, providing vulnerability assessment, runtime protection, and security recommendations.

## What is protected?

Defender for Containers on Arc protects:

- **Arc-enabled Kubernetes clusters** - Any CNCF-certified Kubernetes cluster connected to Azure Arc
- **Container images** - Images in connected container registries
- **Runtime workloads** - Running containers and Kubernetes workloads

## Supported distributions

Defender for Containers supports any CNCF-certified Kubernetes distribution connected through Azure Arc, including:

- **On-premises distributions**
  - Red Hat OpenShift
  - Rancher Kubernetes Engine (RKE)
  - Canonical Kubernetes
  - VMware Tanzu

- **IaaS distributions**
  - Azure Stack HCI
  - Kubernetes on VMs
  - Self-managed clusters on any cloud provider

## Key capabilities

### Vulnerability assessment
- Scans container images for known vulnerabilities
- Supports images from various container registries
- Provides detailed remediation guidance

### Runtime threat protection
- Real-time detection of threats and anomalous behavior
- Monitors container runtime and Kubernetes API activities
- Generates security alerts for suspicious activities

### Security posture management
- Provides recommendations based on CIS Kubernetes Benchmark
- Identifies misconfigurations in Arc-enabled clusters
- Offers remediation guidance for security issues

## Architecture

Defender for Containers on Arc uses:

- **Azure Arc agents** - Connects and manages the cluster
- **Defender sensor** - Deployed as a DaemonSet for runtime protection
- **Azure Policy extension** - Enforces security policies
- **Log Analytics agent** - Collects security-relevant data

## Integration benefits

- **Unified management** - Single pane of glass for all Kubernetes clusters
- **Hybrid security** - Consistent security across cloud and on-premises
- **Centralized alerts** - All security alerts in Microsoft Defender for Cloud
- **Compliance reporting** - Unified compliance across environments

## Prerequisites

Before enabling Defender for Containers on Arc-enabled Kubernetes:

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

Additionally for Arc:
- Kubernetes cluster already connected to Azure Arc
- Azure Arc agents running and healthy
- Outbound connectivity to Azure endpoints
- Sufficient cluster resources for additional agents

## Networking requirements

Arc-enabled clusters require connectivity to:
- Azure Arc endpoints
- Microsoft Defender for Cloud endpoints
- Microsoft Container Registry (MCR)
- Log Analytics workspace endpoints

## Next steps

- [Deploy Defender for Containers on Arc-enabled Kubernetes](defender-for-containers-arc-deploy.md)
- [Verify your Defender for Containers deployment](defender-for-containers-arc-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-arc-configure.md)