---
title: Defender for Containers on GCP (GKE) - Overview
description: Learn about Microsoft Defender for Containers capabilities for Google Kubernetes Engine (GKE) clusters.
ms.topic: overview
ms.date: 12/09/2025
ai-usage: ai-assisted
---

# Defender for Containers on GCP (GKE) - overview

Microsoft Defender for Containers extends security monitoring and protection to Google Kubernetes Engine (GKE) clusters by integrating with Microsoft Defender for Cloud. It helps security and DevOps teams gain visibility into container image vulnerabilities, runtime activity, and Kubernetes configuration risks in GCP environments.

## Integration with GCP

Defender for Containers integrates with Google Cloud through a secure GCP connector that connects your GCP projects to Microsoft Defender for Cloud. Once connected, the solution:

- Discovers GKE clusters in connected GCP projects
- Connects selected clusters to Azure Arc to enable Defender components
- Deploys a Defender sensor to collect runtime security signals
- Integrates with Google Container Registry (GCR) and Artifact Registry for container image vulnerability assessment
- Generates security recommendations based on observed configuration and posture
- Surfaces alerts for suspicious activity related to GKE workloads

The integration is designed to work alongside native GCP security features and does not require inbound connectivity to your clusters.

## Key capabilities

Defender for Containers provides the following capabilities for GKE environments:

- **Container image vulnerability assessment** for images stored in GCR and Artifact Registry
- **Threat detection and alerting** based on runtime signals collected from GKE nodes, workloads, and Kubernetes audit logs
- **Security posture insights** for Kubernetes clusters and workloads, aligned with Kubernetes and GKE security best practices

> [!NOTE]
> Available signals and detections depend on cluster configuration and enabled data sources.

## Architecture for GKE

The Defender for Containers architecture for GKE consists of several integrated components:

- **GCP Connector**: Connects GCP projects to Microsoft Defender for Cloud by using service account authentication and workload identity federation.
- **Azure Arc–enabled Kubernetes**: Establishes a secure, outbound connection between GKE clusters and Azure and enables Defender components to be deployed as Arc extensions.
- **Defender Sensor**: Runs as a DaemonSet on GKE nodes and collects runtime telemetry and security signals.
- **Azure Policy extension for Kubernetes**: Evaluates cluster and workload configurations to generate security posture recommendations.

These components work together to provide visibility into security signals and posture without requiring inbound access to GKE clusters.

## Deployment options

You can enable Defender for Containers for GKE by using one of the following methods:

- **[Azure portal](defender-for-containers-gcp-enable-portal.md)**: Guided setup that allows you to enable all components or deploy specific components selectively.
- **[Programmatic deployment](defender-for-containers-gcp-enable-programmatically.md)**: Automation scenarios using command-line tools and scripts.

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that help you understand your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) shows which Defender for Cloud plans and components are enabled across your subscriptions and connected environments.

## Pricing

Defender for Containers is billed as part of Microsoft Defender for Cloud. Pricing depends on the enabled components and the number of protected resources.

For pricing details, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Related content

- [Defender for Containers on Azure Kubernetes Service (AKS)](defender-for-containers-azure-overview.md)
- [Defender for Containers on Amazon EKS](defender-for-containers-aws-overview.md)
- [Enable Defender for Containers on GCP via portal](defender-for-containers-gcp-enable-portal.md)
- [Deploy the Defender sensor using Helm](deploy-helm.md)