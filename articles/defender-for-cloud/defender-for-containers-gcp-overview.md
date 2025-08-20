---
title: Defender for Containers on GCP (GKE) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Google Kubernetes Engine (GKE) clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on GCP (GKE) - Overview

Microsoft Defender for Containers extends enterprise-grade security to your Google Kubernetes Engine (GKE) clusters, providing comprehensive protection through vulnerability scanning, runtime threat detection, and security posture management—all while maintaining the flexibility and scale that GCP customers expect.

## What is Defender for Containers on GCP?

Defender for Containers on GCP is a cloud-native security solution that protects your GKE clusters and containerized workloads running in Google Cloud Platform. By connecting your GCP projects to Microsoft Defender for Cloud, you gain visibility and protection across your entire container estate, whether running in Azure, GCP, AWS, or on-premises.

The solution seamlessly integrates with GCP services like Google Container Registry (GCR), Artifact Registry, and GKE's native security features while providing Microsoft's advanced threat intelligence and security capabilities. This enables organizations to maintain consistent security policies and threat detection across their multi-cloud container deployments.

## How it works with GCP

Defender for Containers uses a lightweight architecture that respects GCP's security model while providing comprehensive protection. Once you create a GCP connector in Defender for Cloud, the solution:

- Discovers all GKE clusters in your connected GCP projects automatically
- Connects clusters to Azure Arc for centralized management and monitoring
- Deploys a lightweight sensor as a DaemonSet for runtime protection
- Integrates with GCR and Artifact Registry for vulnerability scanning
- Collects GKE audit logs and metrics for security analysis
- Provides security recommendations based on CIS GKE Benchmark

This architecture ensures minimal performance impact on your workloads while maintaining GCP's security boundaries and compliance requirements.

## Key capabilities

Defender for Containers delivers comprehensive security across three critical areas:

| Capability | Description | Key Features |
|------------|-------------|--------------|
| **Vulnerability assessment** | Scans container images in GCR and Artifact Registry for known vulnerabilities | • Native integration with Google registries<br>• Support for private endpoints<br>• Automated scanning on push<br>• CVSS scoring with remediation guidance |
| **Runtime threat protection** | Monitors GKE clusters in real-time for malicious activities and anomalies | • GKE audit log analysis<br>• Workload behavior monitoring<br>• Network anomaly detection<br>• Integration with Binary Authorization |
| **Security posture management** | Evaluates cluster configurations against security benchmarks and best practices | • CIS GKE Benchmark assessment<br>• GKE-specific recommendations<br>• Workload Identity validation<br>• Pod Security Standards enforcement |

## Architecture overview

The Defender for Containers architecture on GCP is designed for security and efficiency:

**GCP Connector**: Establishes secure connectivity between your GCP projects and Microsoft Defender for Cloud using service account authentication or Workload Identity Federation.

**Azure Arc for Kubernetes**: Provides a control plane for managing GKE clusters from Azure without requiring inbound connectivity.

**Defender Sensor**: Deployed as a DaemonSet on each GKE cluster, collects runtime telemetry and security events with minimal resource consumption.

**Registry Integration**: Native integration with GCR and Artifact Registry enables vulnerability scanning without moving images or exposing credentials.

**Cloud Logging Integration**: Leverages GKE audit logs and Cloud Logging for comprehensive security monitoring without duplicating data.

These components work together to provide end-to-end security while respecting GCP's shared responsibility model and your existing security controls.

## Deployment options

Defender for Containers on GCP supports flexible deployment approaches:

- **[Azure portal deployment](defender-for-containers-gcp-enable-all-portal.md)** - Guided experience with automated setup scripts
- **[CLI and automation](defender-for-containers-gcp-deploy.md)** - gcloud and Azure CLI for programmatic deployment
- **[Selective deployment](defender-for-containers-gcp-deploy-portal.md)** - Deploy to specific clusters or projects
- **[Infrastructure as Code](defender-for-containers-gcp-deploy.md#infrastructure-as-code-examples)** - Terraform or ARM templates for repeatability
- **[Helm](deploy-helm.md)** - Kubernetes-native package management

Choose the deployment method that aligns with your GCP operational practices and security requirements.

## Prerequisites

Before deploying Defender for Containers on GKE:

- Active Azure subscription with Defender for Cloud enabled
- GCP project with Owner or Security Admin role
- GKE clusters running version 1.19 or later
- Enabled GCP APIs: Kubernetes Engine, Container Registry, Cloud Asset
- Network connectivity from GKE to Azure endpoints

> [!NOTE]
> For detailed prerequisites and network requirements, see:
>
> - [Enable all components via portal](defender-for-containers-gcp-enable-all-portal.md#prerequisites)
> - [Deploy programmatically](defender-for-containers-gcp-deploy.md#prerequisites)

## GCP-specific features

### Native GCP integrations

- **Workload Identity**: Secure authentication without managing keys
- **Binary Authorization**: Enforce deployment policies with attestation
- **GKE Autopilot**: Full support for serverless Kubernetes
- **Private GKE clusters**: Support for private endpoint configurations

### Security enhancements

- **CIS GKE Benchmark**: Automated compliance assessment
- **Pod Security Standards**: Enforcement and monitoring
- **Network Policy validation**: Ensure proper segmentation
- **RBAC analysis**: Identify overly permissive access

### Operational benefits

- **No egress charges**: Data processing happens in Azure
- **Resource optimization**: Minimal impact on GKE resources
- **Multi-project support**: Manage multiple GCP projects from one connector
- **Existing tools integration**: Works alongside GCP Security Command Center

## Supported GKE configurations

Defender for Containers supports various GKE deployment models:

**Cluster types**:

- Standard GKE clusters (zonal and regional)
- GKE Autopilot clusters
- Private GKE clusters
- GKE clusters with Workload Identity
- Anthos clusters on GCP

**Registry support**:

- Google Container Registry (GCR)
- Artifact Registry
- Private registries with authentication

**Networking**:

- Public clusters with direct connectivity
- Private clusters with Cloud NAT
- Clusters using Private Google Access
- VPC-native clusters

## Pricing

For current pricing, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

Ready to secure your GKE clusters? Choose your deployment path:

- [Enable all components via portal](defender-for-containers-gcp-enable-all-portal.md) - Recommended for initial setup
- [Deploy specific components](defender-for-containers-gcp-deploy-portal.md) - For selective deployment
- [Deploy programmatically](defender-for-containers-gcp-deploy.md) - For automation and scale
- [Verify deployment](defender-for-containers-gcp-verify.md) - Ensure components are working correctly
