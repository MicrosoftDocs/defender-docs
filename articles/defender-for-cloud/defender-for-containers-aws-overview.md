---
title: Defender for Containers on AWS (EKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities, architecture, and deployment options for Amazon Elastic Kubernetes Service (EKS).
ms.topic: overview
ms.date: 12/09/2025
ai-usage: ai-assisted
---

# Defender for Containers on AWS (EKS) - overview

Microsoft Defender for Containers extends enterprise-grade security to Amazon Elastic Kubernetes Service (EKS) clusters, helping security and DevOps teams gain visibility into container image vulnerabilities, runtime activity, and cluster configuration risks through Microsoft Defender for Cloud.

## Integration with AWS

Defender for Containers integrates with AWS through a secure connector that connects your AWS account to Microsoft Defender for Cloud. Once connected, the solution:

- Discovers EKS clusters in your AWS account
- Deploys lightweight security sensors to collect runtime signals
- Integrates with Amazon ECR to assess container images for vulnerabilities
- Generates security recommendations based on observed configuration and posture
- Surfaces alerts for suspicious activity related to EKS workloads

The integration is designed to work alongside existing AWS security services, such as AWS GuardDuty and AWS Security Hub.

## Key capabilities

Defender for Containers provides the following capabilities for Amazon EKS environments:

- **Container image vulnerability assessment** for images stored in Amazon ECR
- **Threat detection, alerting, and response** based on signals collected from EKS nodes, workloads, and Kubernetes audit logs
- **Security posture insights** for Kubernetes clusters and workloads, aligned with security best practices

> [!NOTE]
> Available signals and detections depend on cluster configuration and enabled data sources.

## Architecture for Amazon EKS

The Defender for Containers architecture for Amazon EKS consists of several integrated components:

- **AWS Connector**: Connects your AWS account to Microsoft Defender for Cloud using IAM roles with the required permissions.

- **Azure Arc–enabled Kubernetes**: Establishes a secure, outbound connection between EKS clusters and Azure, and enables Defender for Containers components to be deployed as Arc extensions.

- **Defender Sensor**: Runs as a DaemonSet on each EKS node and collects runtime telemetry and security signals, such as process and network activity.

- **Azure Policy extension for Kubernetes**: Evaluates cluster and workload configurations to generate security posture recommendations.

These components work together to provide visibility into security signals and posture without requiring inbound connectivity to your clusters.

## Deployment options

Enable Defender for Containers for Amazon EKS by using one of the following methods:

- **[Azure portal](defender-for-containers-aws-enable-portal.md)**: Guided setup for enabling Defender for Containers and required components.

- **[Programmatic deployment](defender-for-containers-aws-enable-programmatically.md)**: Automation and infrastructure-as-code scenarios using Azure CLI and REST APIs.

After onboarding, some components, for example, the Defender sensor, can be deployed or managed using **[Helm](deploy-helm.md)** as part of your Kubernetes workflows.

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that help you understand your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) shows which Defender for Cloud plans and components are enabled across your subscriptions and connected environments.

## Pricing

Defender for Containers is billed as part of Microsoft Defender for Cloud. Pricing depends on the enabled components and the number of protected resources.

For detailed pricing information, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Related content

- [Defender for Containers on Azure Kubernetes Service (AKS)](defender-for-containers-gcp-overview.md)
- [Defender for Containers on Google Kubernetes Engine (GKE)](defender-for-containers-azure-overview.md)
- [Deploy the Defender sensor using Helm](deploy-helm.md)