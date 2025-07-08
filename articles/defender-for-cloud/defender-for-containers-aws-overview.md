---
title: Defender for Containers on AWS (EKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities, architecture, and deployment options for Amazon Elastic Kubernetes Service (EKS).
ms.topic: conceptual
ms.date: 06/04/2025
---

# Defender for Containers on AWS (EKS) - Overview

Microsoft Defender for Containers provides comprehensive security for your Amazon Elastic Kubernetes Service (EKS) clusters, offering vulnerability assessment, runtime threat detection, and security posture management.

## What is protected

Defender for Containers on AWS protects:

- **EKS clusters**: Runtime protection and security recommendations
- **Container images**: Vulnerability scanning in Amazon Elastic Container Registry (ECR)
- **Kubernetes workloads**: Configuration assessment and threat detection
- **Container hosts**: Security monitoring for EKS nodes

## Key capabilities

### Vulnerability assessment

- Scans container images stored in ECR
- Identifies vulnerabilities using industry-standard CVE databases
- Provides remediation recommendations
- Supports both push-time and continuous scanning

### Runtime threat detection

- Monitors EKS clusters for suspicious activities
- Detects threats at multiple layers (cluster, node, workload)
- Generates security alerts with investigation details
- Covers common attack patterns and MITRE ATT&CK techniques

### Security posture management

- Assesses cluster configurations against security best practices
- Provides actionable security recommendations
- Monitors compliance with standards (CIS, PCI-DSS, etc.)
- Tracks security score improvements over time

## Architecture overview

Defender for Containers on AWS consists of:

1. **AWS connector**: Links your AWS account to Microsoft Defender for Cloud
2. **Defender sensor**: Deployed as a DaemonSet on EKS clusters for runtime protection
3. **Azure Arc for Kubernetes**: Enables Azure services on EKS clusters
4. **Azure Policy extension**: Provides security recommendations and compliance

## Deployment methods

You can deploy Defender for Containers on EKS using:

- **Azure portal**: Graphical interface for setup and configuration
- **AWS CloudFormation**: Infrastructure as code deployment
- **Azure CLI**: Command-line deployment and automation
- **REST API**: Programmatic deployment for integration

## Prerequisites

Before deploying Defender for Containers on EKS:

- AWS account with appropriate permissions
- EKS clusters running version 1.19 or later
- Microsoft Defender for Cloud subscription
- Network connectivity from EKS to Azure endpoints

## Coverage and limitations

### Supported scenarios

- EKS clusters in all AWS regions
- Both managed and self-managed node groups
- Fargate profiles (with limitations)
- Private and public clusters

### Current limitations

- Fargate-only clusters have limited runtime protection
- Some features require specific EKS configurations
- Network policies may affect sensor communication

## Pricing

Defender for Containers pricing is based on:

- Number of vCore hours for protected clusters
- Number of container images scanned
- See [pricing details](https://azure.microsoft.com/pricing/details/defender-for-cloud/)

## Next steps

- [Enable all components via portal](defender-for-containers-aws-enable-all-portal.md) - Recommended for initial setup
- [Deploy components via portal](defender-for-containers-aws-deploy-portal.md) - For selective component deployment
- [Deploy components programmatically](defender-for-containers-aws-deploy.md) - For automation and scale
