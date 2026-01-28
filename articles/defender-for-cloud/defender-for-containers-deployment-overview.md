---
title: Defender for Containers deployment overview
description: Learn about Microsoft Defender for Containers capabilities, architecture, and deployment options for Kubernetes environments across Azure, AWS, and Google Cloud.
ms.topic: overview
ms.author: elkrieger
author: Elazark
ms.date: 12/09/2025
---

# Defender for Containers deployment overview

Microsoft Defender for Containers provides threat protection, vulnerability assessment, and security posture management for Kubernetes clusters across cloud environments through Microsoft Defender for Cloud.

Defender for Containers is enabled and deployed differently depending on the Kubernetes environment. Azure Kubernetes Service (AKS) uses Azure-native integrations, while Amazon EKS and Google Kubernetes Engine (GKE) rely on multicloud connectors, Azure Arc–enabled Kubernetes, and environment-specific components.

# [Azure Kubernetes Service (AKS)](#tab/aks)

Microsoft Defender for Containers extends security monitoring and protection to Azure Kubernetes Service (AKS) clusters through Microsoft Defender for Cloud. It helps security and DevOps teams gain visibility into container image vulnerabilities, runtime activity, and Kubernetes configuration risks in Azure environments.

## Integration with Azure

Defender for Containers integrates natively with Azure services to protect AKS clusters. When enabled on an Azure subscription, the solution:

- Discovers AKS clusters in the subscription
- Deploys Defender for Containers components by using Azure-managed integrations
- Assesses container images stored in Azure Container Registry (ACR) for vulnerabilities
- Collects runtime security signals from AKS clusters
- Generates security recommendations based on observed configuration and posture
- Surfaces alerts that integrate with Microsoft security tooling

The integration is designed to operate using Azure-native capabilities and doesn't require inbound connectivity to AKS clusters.

## Key capabilities

Defender for Containers provides the following capabilities for AKS environments:

- **Container image vulnerability assessment** for images stored in Azure Container Registry (ACR)
- **Threat detection and alerting** based on runtime signals collected from AKS nodes, workloads, and Kubernetes audit logs
- **Security posture insights** for Kubernetes clusters and workloads, aligned with Kubernetes and Azure security best practices

> [!NOTE]
> Available signals and detections depend on cluster configuration and enabled components.

## Architecture for AKS

The Defender for Containers architecture for AKS consists of Azure-managed and Kubernetes-native components:

- **Defender Sensor**
- **Azure Policy for Kubernetes**
- **Azure Container Registry integration**
- **Agentless discovery**

These components work together to provide visibility into security signals and posture without requiring inbound access to AKS clusters.

Learn more about [container security architecture](defender-for-containers-architecture.md#architecture-for-each-kubernetes-environment).

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

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
- **Threat detection, alerting, and response** based on runtime signals
- **Security posture insights** aligned with security best practices

> [!NOTE]
> Available signals and detections depend on cluster configuration and enabled data sources.

## Architecture for Amazon EKS

The Defender for Containers architecture for Amazon EKS consists of:

- **AWS Connector**
- **Azure Arc–enabled Kubernetes**
- **Defender Sensor**
- **Azure Policy extension for Kubernetes**

These components work together to provide visibility into security signals and posture without requiring inbound connectivity.

Learn more about [container security architecture](defender-for-containers-architecture.md#architecture-for-each-kubernetes-environment).

# [Google Kubernetes Engine (GKE)](#tab/gke)

Microsoft Defender for Containers extends security monitoring and protection to Google Kubernetes Engine (GKE) clusters by integrating with Microsoft Defender for Cloud.

## Integration with GCP

Defender for Containers integrates with Google Cloud through a secure GCP connector that connects your GCP projects to Microsoft Defender for Cloud. Once connected, the solution:

- Discovers GKE clusters in connected GCP projects
- Connects selected clusters to Azure Arc
- Deploys a Defender sensor
- Integrates with Google Container Registry and Artifact Registry
- Generates security recommendations
- Surfaces alerts for suspicious activity

The integration is designed to work alongside native GCP security features and doesn't require inbound connectivity.

## Key capabilities

Defender for Containers provides the following capabilities for GKE environments:

- **Container image vulnerability assessment** for GCR and Artifact Registry
- **Threat detection and alerting** based on runtime signals
- **Security posture insights** aligned with Kubernetes and GKE best practices

> [!NOTE]
> Available signals and detections depend on cluster configuration and enabled data sources.

## Architecture for GKE

The Defender for Containers architecture for GKE consists of:

- **GCP Connector**
- **Azure Arc–enabled Kubernetes**
- **Defender Sensor**
- **Azure Policy extension for Kubernetes**

These components work together to provide visibility into security signals and posture without requiring inbound access to GKE clusters.

Learn more about [container security architecture](defender-for-containers-architecture.md#architecture-for-each-kubernetes-environment).

# [Arc-enabled Kubernetes](#tab/arc)

Microsoft Defender for Containers provides security monitoring and protection for Kubernetes clusters that are connected to Azure through Azure Arc. This includes Kubernetes clusters running on-premises, at the edge, or in other non-Azure environments.

Defender for Containers on Arc-enabled Kubernetes is managed through Microsoft Defender for Cloud and relies on Azure Arc–enabled Kubernetes for cluster connectivity and component deployment.

## Integration with Azure Arc

Defender for Containers integrates with Arc-enabled Kubernetes clusters by using Azure Arc as the control plane. After a cluster is connected to Azure Arc and the Containers plan is enabled, Defender for Containers:

- Discovers Arc-enabled Kubernetes clusters in the subscription
- Deploys Defender components by using Azure Arc extensions
- Collects runtime security signals from Kubernetes nodes and workloads
- Evaluates cluster and workload configurations
- Generates security recommendations and alerts in Defender for Cloud

The integration doesn't require inbound connectivity to the Kubernetes cluster. Communication is initiated from the cluster to Azure through the Azure Arc agents.

> [!NOTE]
> Arc-enabled Kubernetes is required to deploy Defender for Containers components to Kubernetes clusters that aren’t running in Azure.

## Key capabilities

Defender for Containers provides the following capabilities for Arc-enabled Kubernetes environments:

- **Threat detection and alerting** based on runtime signals collected from Kubernetes nodes, workloads, and audit logs
- **Security posture insights** for Kubernetes clusters and workloads
- **Policy-based configuration assessment** through Azure Policy for Kubernetes

> [!NOTE]
> Available signals, detections, and posture assessments depend on enabled components and cluster configuration.

## Architecture for Arc-enabled Kubernetes

The Defender for Containers architecture for Arc-enabled Kubernetes consists of:

- **Azure Arc agents**
- **Defender extension for Kubernetes**
- **Defender sensor (DaemonSet)**
- **Azure Policy extension for Kubernetes**

These components are deployed and managed through Azure Arc and are scoped to the Arc-enabled cluster.

Learn more about [container security architecture](defender-for-containers-architecture.md#architecture-for-each-kubernetes-environment).

---

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that help you understand your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) shows which Defender for Cloud plans and components are enabled across your subscriptions and connected environments.

## Pricing

Defender for Containers is billed as part of Microsoft Defender for Cloud. Pricing depends on the enabled components and the number of protected resources.

For pricing details, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Next steps

- [Enable Defender for Containers using the Azure portal](defender-for-containers-enable-portal.md)

- [Enable Defender for Containers using the Azure CLI](defender-for-containers-enable-azure-cli.md)
