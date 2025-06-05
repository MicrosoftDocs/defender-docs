---
title: Defender for Containers on AWS (EKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Amazon Elastic Kubernetes Service (EKS) clusters.
ms.topic: overview
ms.date: 06/04/2025
---

# Defender for Containers on AWS (EKS) - Overview

Microsoft Defender for Containers extends Azure security capabilities to Amazon EKS clusters, providing comprehensive protection for your AWS Kubernetes workloads through a cloud-native integration.

## What is protected?

Defender for Containers on AWS protects:

- **EKS clusters** - Both managed node groups and self-managed nodes
- **Fargate profiles** - Serverless compute for EKS
- **Container images** - In Amazon ECR repositories
- **Runtime workloads** - Running containers and Kubernetes workloads

## Key capabilities

### Multi-cloud security management
- Unified security dashboard across Azure and AWS
- Consistent security policies and compliance
- Centralized threat detection and response

### Container image scanning
- Vulnerability assessment for ECR repositories
- Integration with Amazon Inspector for enhanced scanning
- Support for private ECR repositories

### Runtime protection
- Real-time threat detection for EKS workloads
- Behavioral analytics and anomaly detection
- Kubernetes audit log analysis

### Compliance and hardening
- CIS EKS Benchmark assessments
- AWS security best practices recommendations
- Network security monitoring

## Architecture

Defender for Containers on AWS uses:

- **AWS Connector** - Establishes secure connection to Azure
- **CloudFormation stack** - Deploys required AWS resources
- **Defender sensor** - Kubernetes DaemonSet for runtime protection
- **EventBridge integration** - For real-time event streaming

## Integration with AWS services

- **Amazon ECR** - Container registry scanning
- **AWS CloudTrail** - Audit log collection
- **Amazon CloudWatch** - Metrics and logs
- **AWS Systems Manager** - Secure parameter storage
- **IAM roles** - Cross-account access

## Prerequisites

Before enabling Defender for Containers on EKS:

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

Additionally for AWS:
- AWS account with appropriate permissions
- EKS cluster version 1.19 or later
- AWS CLI configured with credentials
- CloudFormation stack deployment permissions

## Supported EKS configurations

- **Managed node groups** - Full support
- **Self-managed nodes** - Full support
- **Fargate profiles** - Supported with sidecar pattern
- **Bottlerocket OS** - Supported
- **ARM-based instances** - Supported

## Pricing considerations

- Defender for Containers pricing applies per vCore
- AWS infrastructure costs are separate
- No additional charges for ECR scanning

## Next steps

- [Deploy Defender for Containers on AWS (EKS)](defender-for-containers-eks-deploy.md)
- [Connect your AWS account to Microsoft Defender for Cloud](quickstart-onboard-aws.md)
- [Configure ECR vulnerability scanning](defender-for-containers-eks-configure.md)