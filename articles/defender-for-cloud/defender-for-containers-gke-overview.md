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

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

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

- [Deploy Defender for Containers on GCP (GKE)](defender-for-containers-gke-deploy.md)
- [Verify your Defender for Containers deployment](defender-for-containers-gke-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gke-configure.md)