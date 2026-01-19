---
title: Defender for Containers on Azure (AKS) - Overview
description: Learn about Microsoft Defender for Containers capabilities, architecture, and deployment options for Azure Kubernetes Service (AKS).
ms.topic: overview
ms.date: 12/09/2025
ai-usage: ai-assisted
---

# Defender for Containers on Azure (AKS) – overview

Microsoft Defender for Containers extends security monitoring and protection to Azure Kubernetes Service (AKS) clusters through Microsoft Defender for Cloud. It helps security and DevOps teams gain visibility into container image vulnerabilities, runtime activity, and Kubernetes configuration risks in Azure environments.

## Integration with Azure

Defender for Containers integrates natively with Azure services to protect AKS clusters. When enabled on an Azure subscription, the solution:

- Discovers AKS clusters in the subscription
- Deploys Defender for Containers components by using Azure-managed integrations
- Assesses container images stored in Azure Container Registry (ACR) for vulnerabilities
- Collects runtime security signals from AKS clusters
- Generates security recommendations based on observed configuration and posture
- Surfaces alerts that integrate with Microsoft security tooling

The integration is designed to operate using Azure-native capabilities and does not require inbound connectivity to AKS clusters.

## Key capabilities

Defender for Containers provides the following capabilities for AKS environments:

- **Container image vulnerability assessment** for images stored in Azure Container Registry (ACR)
- **Threat detection and alerting** based on runtime signals collected from AKS nodes, workloads, and Kubernetes audit logs
- **Security posture insights** for Kubernetes clusters and workloads, aligned with Kubernetes and Azure security best practices

> [!NOTE]
> Available signals and detections depend on cluster configuration and enabled components.

## Architecture for AKS

The Defender for Containers architecture for AKS consists of Azure-managed and Kubernetes-native components:

- **Defender Sensor**: Runs as a DaemonSet on AKS nodes and collects runtime telemetry and security signals.
- **Azure Policy for Kubernetes**: Evaluates cluster and workload configurations to generate security posture recommendations.
- **Azure Container Registry integration**: Enables vulnerability assessment for container images stored in ACR.
- **Agentless discovery**: Uses Azure-native capabilities to discover and assess AKS cluster configurations.

These components work together to provide visibility into security signals and posture without requiring inbound access to AKS clusters.

For detailed architecture information, see [Container security architecture](defender-for-containers-architecture.md#architecture-for-each-kubernetes-environment).

## Deployment options

You can enable Defender for Containers for AKS by using one of the following methods:

- **[Azure portal](defender-for-containers-azure-enable-portal.md)**: Guided setup for enabling Defender for Containers and configuring components.
- **[Programmatic deployment](defender-for-containers-azure-enable-programmatically.md)**: Automation scenarios using Azure CLI, REST API, or Azure Policy.

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that help you understand your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) shows which Defender for Cloud plans and components are enabled across your subscriptions and connected environments.

## Pricing

Defender for Containers is billed as part of Microsoft Defender for Cloud. Pricing depends on the enabled components and the number of protected resources.

For pricing details, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Related content

- [Defender for Containers on Amazon EKS](defender-for-containers-aws-overview.md)
- [Defender for Containers on Google Kubernetes Engine (GKE)](defender-for-containers-gcp-overview.md)
- [Enable Defender for Containers on AKS](defender-for-containers-azure-enable-portal.md)
- [Verify Defender for Containers deployment on AKS](defender-for-containers-azure-verify)
