---
title: Defender for Containers on GCP (GKE) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Google Kubernetes Engine (GKE) clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on GCP (GKE) - Overview

Microsoft Defender for Containers provides comprehensive security for Google Kubernetes Engine (GKE) clusters, including vulnerability assessment, runtime protection, and security hardening recommendations.

## What is protected?

Defender for Containers on GCP protects:

- **GKE clusters** - All GKE clusters connected through the GCP connector
- **Container images** - Images in Google Container Registry (GCR) and Artifact Registry
- **Runtime workloads** - Running containers and Kubernetes workloads

## Key capabilities

### Vulnerability assessment
- Scans container images in GCR and Artifact Registry
- Provides detailed vulnerability reports with remediation guidance
- Supports both OS and application vulnerabilities

### Runtime threat protection
- Detects suspicious activities and potential threats in real-time
- Monitors container behavior and Kubernetes API activities
- Generates security alerts for anomalous activities

### Security posture management
- Provides security recommendations based on CIS Kubernetes Benchmark
- Identifies misconfigurations in GKE clusters
- Offers remediation steps for security issues

## Architecture

Defender for Containers uses the following components on GKE:

- **Defender sensor** - Deployed as a DaemonSet for runtime protection
- **Cloud connector** - Manages the connection between GCP and Azure
- **Agentless scanning** - Scans container images without requiring agents

## Integration with GCP services

Defender for Containers integrates with:

- **Google Container Registry (GCR)** - For image vulnerability scanning
- **Google Artifact Registry** - For enhanced container image management
- **GKE Workload Identity** - For secure authentication
- **Cloud Logging** - For audit and diagnostic data

## Prerequisites

Before enabling Defender for Containers on GKE:

- An Azure subscription. If you don't have an Azure subscription, [create a free account](https://azure.microsoft.com/free/) before you begin.
- Microsoft Defender for Cloud on your Azure subscription. Learn how to [set up Microsoft Defender for Cloud](get-started.md).
- Contributor access to the relevant Azure subscription.
- Contributor permission on the relevant GCP project.

### Network requirements

The Defender sensor requires access to these endpoints:

| Domain | Port | Description |
|--------|------|-------------|
| *.ods.opinsights.azure.com | 443 | Log Analytics data ingestion |
| *.oms.opinsights.azure.com | 443 | Log Analytics communication |
| *.blob.core.windows.net | 443 | Storage account access |
| *.servicebus.windows.net | 443 | Event Hub for real-time data |
| login.microsoftonline.com | 443 | Azure Active Directory authentication |
| *.security.azure.com | 443 | Defender for Cloud communication |

For Arc-enabled clusters, see [Azure Arc network requirements](/azure/azure-arc/kubernetes/network-requirements).

Additionally for GKE:
- GKE cluster version 1.19 or later
- GCP project with appropriate APIs enabled
- Owner or Security Admin role on the GCP project
- Network connectivity between GKE and Azure

## Supported GKE configurations

- **Standard GKE clusters** - Full support
- **Autopilot clusters** - Supported with some limitations
- **Private clusters** - Supported with proper network configuration
- **Regional clusters** - Full support

## Next steps

- [Enable all components via portal](defender-for-containers-gcp-enable-all-portal.md) - Recommended for initial setup
- [Deploy components via portal](defender-for-containers-gcp-deploy-portal.md) - For selective component deployment
- [Deploy components programmatically](defender-for-containers-gcp-deploy.md) - For automation and scale