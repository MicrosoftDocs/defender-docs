---
title: Defender for Containers on AWS (EKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities, architecture, and deployment options for Amazon Elastic Kubernetes Service (EKS).
ms.topic: conceptual
ms.date: 06/04/2025
---

# Defender for Containers on AWS (EKS) - Overview

Microsoft Defender for Containers extends Azure's cloud security capabilities to your Amazon Elastic Kubernetes Service (EKS) clusters. It provides enterprise-grade security for containerized workloads running on AWS.

## What is Defender for Containers?

Defender for Containers is a cloud-native security solution that protects your Kubernetes clusters wherever they run. For AWS environments, it provides comprehensive threat protection by combining vulnerability scanning, runtime threat detection, and security posture management into a unified platform managed through Microsoft Defender for Cloud.

> [!TIP]
> For a comprehensive overview of Defender for Containers capabilities across all environments, see [Overview of Microsoft Defender for Containers](defender-for-containers-introduction.md).

The solution helps security and DevOps teams identify vulnerabilities before deployment, detect and respond to runtime threats, and maintain security compliance across their container infrastructure.

## How it works with AWS

Defender for Containers integrates with AWS services through a secure connector that bridges your AWS account with Microsoft Defender for Cloud. Once connected, the solution:

- Automatically discovers all EKS clusters in your AWS account
- Deploys lightweight security sensors to monitor runtime behavior
- Connects to Amazon ECR to scan container images for vulnerabilities
- Provides security recommendations based on AWS best practices
- Generates alerts for suspicious activities specific to EKS environments

This integration requires minimal configuration and works with existing AWS security tools. It complements services like AWS GuardDuty and AWS Security Hub.

## Key capabilities

Defender for Containers provides comprehensive security coverage through three core protection areas:

| Capability | Description | Key Features |
|------------|-------------|--------------|
| **Vulnerability assessment** | Continuously scans container images in Amazon ECR | • Scan on push and periodic rescanning<br>• CVSS scoring and prioritization<br>• Detailed remediation guidance<br>• Integration with CI/CD pipelines |
| **Runtime threat detection** | Monitors EKS clusters in real-time for malicious activities | • Kubernetes audit log analysis<br>• Container behavior monitoring<br>• Network anomaly detection<br>• Automated threat response |
| **Security posture management** | Evaluates cluster configurations against best practices | • CIS Kubernetes Benchmark<br>• AWS security best practices<br>• Custom compliance policies<br>• Actionable recommendations |

## Architecture overview

The Defender for Containers architecture on AWS includes several integrated components:

- **AWS Connector**: Connects your AWS account to Microsoft Defender for Cloud by using IAM roles with minimal required permissions.

- **Defender Sensor**: Runs as a DaemonSet on each EKS cluster. It collects runtime telemetry and security events without affecting application performance.

- **Azure Arc for Kubernetes**: Enables Azure services on your EKS clusters by creating a secure, outbound connection to Azure.

- **Azure Policy Extension**: Checks cluster configurations and workload settings to generate security recommendations.

These components work together to provide continuous security monitoring without needing inbound connections to your clusters or storing sensitive data outside your control.

## Deployment options

Defender for Containers supports flexible deployment approaches to match your operational preferences:

- **[Azure portal deployment](defender-for-containers-aws-enable-all-portal.md)** - Guided, visual experience that's ideal for initial setup and smaller environments.
- **[Infrastructure as Code](defender-for-containers-aws-deploy.md#deploy-using-infrastructure-as-code)** - CloudFormation, Terraform, or ARM templates for repeatable, automated deployments.
- **[Command-line tools](defender-for-containers-aws-deploy.md)** - Azure CLI and AWS CLI for scripting and CI/CD pipeline integration.
- **[REST APIs](defender-for-containers-aws-deploy.md)** - Custom integrations and programmatic management at scale.
- **[Helm](deploy-helm.md)** - Kubernetes package manager for sensor deployment.

Choose the approach that best fits your organization's deployment standards and automation requirements.

## Prerequisites

Before deploying Defender for Containers on EKS, ensure you meet these requirements:

- Microsoft Defender for Cloud with appropriate permissions
- AWS account with IAM permissions to create roles
- EKS clusters running Kubernetes 1.19 or later
- Network connectivity from EKS to Azure endpoints (outbound HTTPS)

> [!NOTE]
> For detailed prerequisites and setup instructions, see the deployment guides:
>
> - [Enable via portal](defender-for-containers-aws-enable-all-portal.md#prerequisites)
> - [Deploy programmatically](defender-for-containers-aws-deploy.md#prerequisites)

## Pricing

For detailed pricing information and cost optimization strategies, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

Ready to secure your EKS clusters? Choose your deployment approach:

- [Enable all components via portal](defender-for-containers-aws-enable-all-portal.md) - Recommended for initial setup with step-by-step guidance
- [Deploy specific components via portal](defender-for-containers-aws-deploy-portal.md) - For selective deployment or troubleshooting
- [Deploy programmatically](defender-for-containers-aws-deploy.md) - For automation and infrastructure as code scenarios
