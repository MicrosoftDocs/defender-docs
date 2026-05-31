---
title: Access patterns and private cluster support for Defender for Containers features
description: Reference which Microsoft Defender for Containers features require registry access, Kubernetes API access, cloud-provider access, or sensor outbound connectivity, and whether they support private clusters.
ms.topic: reference
author: Elazark
ms.author: elkrieger
ms.service: defender-for-cloud
ms.date: 05/31/2026
---

# Access patterns and private cluster support for Defender for Containers features

This page summarizes the access patterns used by Microsoft Defender for Containers features, the required enablement method, the applicable plan, and private cluster support. 

View the [network access and permissions reference](defender-for-containers-network-access.md) for detailed network and permission requirements for each access pattern.

> [!NOTE]
> The **Private cluster support** column includes support requirements and related prerequisites for some features.
> - **Supported by enabling a restricted public API endpoint** means the feature supports private clusters when the Kubernetes API is exposed through a restricted public endpoint.
> - **Requires outbound HTTPS access** means the cluster must allow outbound HTTPS connectivity to Microsoft Defender for Cloud.
> - Some entries describe feature prerequisites instead of private cluster support behavior.

## Connectivity patterns used by Defender for Containers

Microsoft Defender for Containers uses multiple connectivity patterns to collect security signals and provide protection across your environment, including:

- **Registry access**: Connections from Microsoft Defender for Cloud to container registries to scan images for vulnerabilities and, in some cases, publish assessment results back to the registry.
- **Kubernetes API access**: Connections from Microsoft Defender for Cloud to Kubernetes API endpoints for cluster discovery, posture assessment, and risk analysis.
- **Sensor outbound connectivity**: Runtime telemetry sent from Kubernetes worker nodes to Microsoft Defender for Cloud for threat detection.
- **Cloud-native audit log ingestion**: Ingestion of Kubernetes audit logs from cloud-native logging services for control plane threat detection.
- **Cloud-provider access**: Connections from Microsoft Defender for Cloud to cloud-provider APIs for resource discovery, posture assessment, inventory, and risk analysis.

## Vulnerability assessment features

The following table summarizes vulnerability assessment features and their access patterns.

| Feature | Supported resources | Enablement method | Defender plans | Access pattern | Private cluster support and prerequisites |
|---|---|---|---|---|---|
| Container registry vulnerability assessment | ACR, ECR, GAR, GCR, Docker Hub, JFrog Artifactory | Registry access | Containers; CSPM | Registry access | Supported |
| Runtime container vulnerability assessment (registry scan-based) | ACR, ECR, GAR, GCR, Docker Hub, JFrog Artifactory | Agentless scanning for machines and Kubernetes API access or Defender sensor | Containers; CSPM | Registry access and Kubernetes API access | Supported by enabling a restricted public API endpoint |
| Runtime container vulnerability assessment (registry-agnostic) | AKS | Agentless scanning for machines and Kubernetes API access or Defender sensor | Containers; CSPM | Cloud-provider access and Kubernetes API access | Supported by enabling a restricted public API endpoint |
| Gated deployment | AKS, EKS, GKE | Defender sensor, security findings, and registry access | Containers | Kubernetes API access and sensor outbound connectivity | Supported by enabling a restricted public API endpoint or by using Defender Sensor private clusters version (Preview) |

## Runtime protection features

The following table summarizes runtime protection features and their access patterns.

| Feature | Supported resources | Enablement method | Defender plans | Access pattern | Private cluster support and prerequisites |
|---|---|---|---|---|---|
| Control plane detection | AKS, EKS, GKE | Enabled with Containers plan | Containers | Cloud-native audit log ingestion | Supported |
| Workload detection | AKS, EKS, GKE | Defender sensor | Containers | Sensor outbound connectivity | Requires outbound HTTPS access |
| Binary drift detection | AKS, EKS, GKE | Defender sensor | Containers | Kubernetes API access and sensor outbound connectivity | Policy definitions require enabling a restricted public API endpoint or by using Defender Sensor private clusters version (Preview). Requires outbound HTTPS access. |
| DNS detection | AKS, EKS, GKE | Defender sensor installed by using Helm | Containers | Sensor outbound connectivity | Requires outbound HTTPS access |
| Advanced hunting in XDR | AKS, EKS, GKE | Defender sensor | Containers | Sensor outbound connectivity | Requires outbound HTTPS access |
| Response actions in XDR | AKS, EKS, GKE | Defender sensor and Kubernetes API access | Containers | Kubernetes API access | Supported by enabling a restricted public API endpoint |
| Malware detection | AKS, EKS (Preview), GKE (Preview) nodes | Agentless scanning for machines | Containers; Servers P2 | Kubernetes API access and sensor outbound connectivity | Supported by enabling a restricted public API endpoint or by using Defender Sensor private clusters version (Preview). Requires outbound HTTPS access. |

## Posture management features

The following table summarizes posture management features and their access patterns.

| Feature | Supported resources | Enablement method | Defender plans | Access pattern | Private cluster support and prerequisites |
|---|---|---|---|---|---|
| Agentless discovery for Kubernetes | AKS, EKS, GKE | Kubernetes API access | Containers; CSPM | Cloud-provider access | Supported |
| Comprehensive inventory capabilities | Registries: ACR, ECR, GAR, GCR, Docker Hub, JFrog Artifactory. Clusters: AKS, EKS, GKE | Kubernetes API access | Containers; CSPM | Kubernetes API access and cloud-provider access | Supported by enabling a restricted public API endpoint or by using Defender Sensor private clusters version (Preview) |
| Attack path analysis | Registries: ACR, ECR, GAR, GCR, Docker Hub, JFrog Artifactory. Clusters: AKS, EKS, GKE | Kubernetes API access | Defender CSPM | Kubernetes API access and cloud-provider access | Inventory capabilities are a prerequisite |
| Enhanced risk-hunting | Registries: ACR, ECR, GAR, GCR, Docker Hub, JFrog Artifactory. Clusters: AKS, EKS, GKE | Kubernetes API access | Containers; CSPM | Kubernetes API access and cloud-provider access | Inventory capabilities are a prerequisite |
| Control plane hardening | Registries: ACR. Clusters: AKS, EKS, GKE | Enabled with Containers plan | Free | Cloud-provider access | Supported |
| Workload hardening | AKS, EKS, GKE | Azure Policy for Kubernetes | Free | Kubernetes API access | Supported by enabling a restricted public API endpoint or by using Defender Sensor private clusters version (Preview) |
| CIS Kubernetes Service | AKS, EKS, GKE | Assigned as a security standard | Containers; CSPM | Kubernetes API access | Supported by enabling a restricted public API endpoint or by using Defender Sensor private clusters version (Preview) |

## Next step

> [!div class="nextstepaction"]
> [Network access and permissions reference for Defender for Containers](defender-for-containers-network-access.md)
