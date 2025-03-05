---
title: Containers support matrix in Defender for Cloud
description: Review support requirements for container capabilities in Microsoft Defender for Cloud.
ms.topic: limits-and-quotas
author: dcurwin
ms.author: dacurwin
ms.date: 02/25/2025
ms.custom: references_regions
---

# Containers support matrix in Defender for Cloud

> [!CAUTION]
> This article references CentOS, a Linux distribution that is End Of Service as of June 30, 2024. Please consider your use and planning accordingly. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).

This article summarizes support information for Container capabilities in Microsoft Defender for Cloud.

> [!NOTE]
>
> - Specific features are in preview. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include other legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.
> - Only the versions of AKS, EKS and GKE supported by the cloud vendor are officially supported by Defender for Cloud.

The following are the features provided by Defender for Containers, for the supported cloud environments and container registries.

## Vulnerability assessment features

### [Azure](#tab/azureva)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Container registry | Vulnerability assessments for images in container registries | ACR | GA | GA | Requires **Registry access** (National clouds are automatically enabled and cannot be toggled) | **Defender for Containers** or **Defender CSPM** | Commercial clouds National clouds: Azure Government, Azure operated by 21Vianet |
| Runtime container | Vulnerability assessments of running container images | Agnostic to container registry source | Preview<br/> (Container with ACR images are GA)| - | Requires **Agentless scanning for machines** and either **K8S API access** or **Defender sensor** (National clouds are automatically enabled and cannot be disabled) | **Defender for Containers** or **Defender CSPM** | Commercial clouds and National clouds: Azure Government, Azure operated by 21Vianet |

#### Registries and images support for vulnerability assessment in Azure

| Aspect | Details |
|--|--|
| Registries and images | **Supported**<br> * ACR registries <br> * [ACR registries protected with Azure Private Link](/azure/container-registry/container-registry-private-link) (Private registries requires access to Trusted Services) <br> * Container images in Docker V2 format <br> * Images with [Open Container Initiative (OCI)](https://github.com/opencontainers/image-spec/blob/main/spec.md) image format specification <br> **Unsupported**<br>   * Super-minimalist images such as [Docker scratch](https://hub.docker.com/_/scratch/) images<br> is currently unsupported <br> |
| Operating systems | **Supported** <br> * Alpine Linux 3.12-3.21<br> * Red Hat Enterprise Linux 6-9 <br> * CentOS 6-9. (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)<br> * Oracle Linux 6-9 <br> * Amazon Linux 1, 2 <br> * openSUSE Leap, openSUSE Tumbleweed <br> * SUSE Enterprise Linux 11-15 <br> * Debian GNU/Linux 7-12 <br> * Google Distroless (based on Debian GNU/Linux 7-12) <br> * Ubuntu 12.04-22.04 <br>  * Fedora 31-37<br> * Mariner 1-2<br> * Windows Server 2016, 2019, 2022 |
| Language specific packages <br><br>  | **Supported**<br> * Python <br> * Node.js <br> * PHP <br> * Ruby <br> * Rust <br> * .NET <br> * Java<br> * Go |

### [AWS](#tab/awsva)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Container registry | Vulnerability assessments for images in container registries | ECR | GA | GA | Requires **Registry access** | **Defender for Containers** or **Defender CSPM** | AWS |
| Runtime container | Vulnerability assessments of running container images | Supported container registries | Preview | - | Requires **Agentless scanning for machines** and either **K8S API access** or **Defender sensor** | **Defender for Containers** or **Defender CSPM**  | AWS |

#### Registries and images support for vulnerability assessment in AWS

| Aspect | Details |
|--|--|
| Registries and images | **Supported**<br> * ECR registries <br> * Container images in Docker V2 format  <br> * Images with [Open Container Initiative (OCI)](https://github.com/opencontainers/image-spec/blob/main/spec.md) image format specification <br>  **Unsupported**<br>   * Super-minimalist images such as [Docker scratch](https://hub.docker.com/_/scratch/) images is currently unsupported <br> * Public repositories <br> * Manifest lists <br>|
| Operating systems | **Supported** <br> * Alpine Linux 3.12-3.21<br> * Red Hat Enterprise Linux 6-9 <br> * CentOS 6-9 (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)<br> * Oracle Linux 6-9 <br> * Amazon Linux 1, 2 <br> * openSUSE Leap, openSUSE Tumbleweed <br> * SUSE Enterprise Linux 11-15 <br> * Debian GNU/Linux 7-12 <br> * Google Distroless (based on Debian GNU/Linux 7-12)<br> * Ubuntu 12.04-22.04 <br>  * Fedora 31-37<br> * Mariner 1-2<br> * Windows server 2016, 2019, 2022 |
| Language specific packages <br><br>  | **Supported** <br> * Python <br> * Node.js <br> * PHP <br> * Ruby <br> * Rust <br> * .NET <br> * Java<br> * Go |


### [GCP](#tab/gcpva)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Container registry | Vulnerability assessments for images in container registries | GAR, GCR | GA | GA | Enable **Registry access** toggle | **Defender for Containers** or **Defender CSPM** | AWS |
| Runtime container | Vulnerability assessments of running container images | Supported container registries | Preview | - | Requires **Agentless scanning for machines** and either **K8S API access** or **Defender sensor** | **Defender for Containers** or **Defender CSPM**  | GCP |

#### Registries and images support for vulnerability assessment in GCP

| Aspect | Details |
|--|--|
| Registries and images | **Supported**<br> * Google Registries (GAR, GCR) <br> * Container images in Docker V2 format  <br> * Images with [Open Container Initiative (OCI)](https://github.com/opencontainers/image-spec/blob/main/spec.md) image format specification <br> **Unsupported**<br> * Super-minimalist images such as [Docker scratch](https://hub.docker.com/_/scratch/) images is currently unsupported <br> * Public repositories <br> * Manifest lists <br>|
| Operating systems | **Supported** <br> * Alpine Linux 3.12-3.21<br> * Red Hat Enterprise Linux 6-9 <br> * CentOS 6-9 (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)<br> * Oracle Linux 6-9 <br> * Amazon Linux 1, 2 <br> * openSUSE Leap, openSUSE Tumbleweed <br> * SUSE Enterprise Linux 11-15 <br> * Debian GNU/Linux 7-12 <br> * Google Distroless (based on Debian GNU/Linux 7-12)<br> * Ubuntu 12.04-22.04 <br>  * Fedora 31-37<br> * Mariner 1-2<br> * Windows server 2016, 2019, 2022 |
| Language specific packages <br><br>  | **Supported** <br><br> * Python <br> * Node.js <br> * PHP <br> * Ruby <br> * Rust <br> * .NET <br> * Java<br> * Go |


### [External Registries](#tab/extva)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Container registry | Vulnerability assessments for images in container registries | Docker Hub, JFrog Artifactory | Preview | Preview | Enable **Registry access** toggle | **Defender for Containers** or **Defender CSPM** | NA |

---

## Runtime protection features

### [Azure](#tab/azurert)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Control plane detection | Detection of suspicious activity for Kubernetes based on Kubernetes audit trail | AKS | GA | GA | Enabled with plan | **Defender for Containers** or **Defender CSPM** | Commercial clouds National clouds: Azure Government, Azure operated by 21Vianet |
| Workload detection | Monitors containerized workloads for threats and gives alerts to suspicious activities | AKS | GA | - | Requires **Defender sensor** | **Defender for Containers** | Commercial clouds and National clouds: Azure Government, Azure operated by 21Vianet |
| Binary drift detection | Detects binary of runtime container from container image | AKS | GA | GA | Requires **Defender sensor** | **Defender for Containers** | Commercial clouds |
| Advanced hunting in XDR | View cluster incidents and alerts in Microsoft XDR | AKS | Preview - currently supports audit logs & process events | Preview - currently supports audit logs & process events | Requires **Defender sensor** | **Defender for Containers** | Commercial clouds and National clouds: Azure Government, Azure operated by 21Vianet |
| Response actions in XDR | Provides automated and manual remediation in Microsoft XDR | AKS  | Preview | Preview | Enabled with any Defender for Cloud plan | Any plan | Commercial clouds and National clouds: Azure Government, Azure operated by 21Vianet |
| Malware detection | Detection of malware | AKS nodes | Preview | Preview | Requires **Agentless scanning for machines** | **Defender for Containers** or **Defender for Servers Plan 2** | Commercial clouds |

#### Kubernetes distributions and configurations for runtime threat protection in Azure

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported**<br> * [Azure Kubernetes Service (AKS)](/azure/aks/intro-kubernetes) with [Kubernetes RBAC](/azure/aks/concepts-identity#kubernetes-rbac) <br><br> **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1azrt)</sup> <sup>[2](#footnote2azrt)</sup><br> * [Azure Kubernetes Service hybrid](/azure/aks/hybrid/aks-hybrid-options-overview)<br> * [Kubernetes](https://kubernetes.io/docs/home/)<br> * [AKS Engine](https://github.com/Azure/aks-engine)<br> * [Azure Red Hat OpenShift](https://azure.microsoft.com/services/openshift/)<br /> |

<sup><a name="footnote1azrt"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested on Azure.

<sup><a name="footnote2azrt"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

### [AWS](#tab/awsrt)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Control plane detection | Detection of suspicious activity for Kubernetes based on Kubernetes audit trail | EKS | GA | GA | Enabled with plan | **Defender for Containers** or **Defender CSPM** | AWS |
| Workload detection | Monitors containerized workloads for threats and gives alerts to suspicious activities | EKS | GA | - | Requires **Defender sensor** | **Defender for Containers** | AWS |
| Binary drift detection | Detects binary of runtime container from container image | EKS | GA | GA | Requires **Defender sensor** | **Defender for Containers** | AWS |
| Advanced hunting in XDR | View cluster incidents and alerts in Microsoft XDR | EKS | Preview - currently supports audit logs & process events | Preview - currently supports audit logs & process events | Requires **Defender sensor** | **Defender for Containers** | AWS |
| Response actions in XDR | Provides automated and manual remediation in Microsoft XDR | EKS | Preview | Preview | Requires **Defender sensor** and **K8S access API** | **Defender for Containers** | AWS |
| Malware detection | Detection of malware | - | - | - | - | - | - |

#### Kubernetes distributions/configurations support for runtime threat protection in AWS

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported**<br>*  [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/)<br><br> **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1awsrt)</sup> <sup>[2](#footnote2awsrt)</sup><br> * [Kubernetes](https://kubernetes.io/docs/home/)<br />**Unsupported**<br /> * EKS private clusters |

<sup><a name="footnote1awsrt"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested.

<sup><a name="footnote2awsrt"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

### [GCP](#tab/gcprt)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Control plane detection | Detection of suspicious activity for Kubernetes based on Kubernetes audit trail | GKE | GA | GA | Enabled with plan | **Defender for Containers** | GCP |
| Workload detection | Monitors containerized workloads for threats and gives alerts to suspicious activities | GKE | GA | - | Requires **Defender sensor** | **Defender for Containers** | GCP |
| Binary drift detection | Detects binary of runtime container from container image | GKE | GA | GA | Requires **Defender sensor** | **Defender for Containers** | GCP |
| Advanced hunting in XDR | View cluster incidents and alerts in Microsoft XDR | GKE | Preview - currently supports audit logs & process events | Preview - currently supports audit logs & process events | Requires **Defender sensor** | **Defender for Containers** | GCP |
| Response actions in XDR | Provides automated and manual remediation in Microsoft XDR | GKE | Preview | Preview | Enabled with any Defender for Cloud plan | Any plan | GCP |
| Malware detection | Detection of malware | - | - | - | - | - | - |

#### Kubernetes distributions/configurations support for runtime threat protection in GCP

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported**<br>  * [Google Kubernetes Engine (GKE) Standard](https://cloud.google.com/kubernetes-engine/) <br><br> **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1gcprt)</sup> <sup>[2](#footnote2gcprt)</sup><br> * [Kubernetes](https://kubernetes.io/docs/home/)<br><br />**Unsupported**<br /> * Private network clusters<br /> * GKE autopilot<br /> * GKE AuthorizedNetworksConfig |

<sup><a name="footnote1gcprt"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested.

<sup><a name="footnote2gcprt"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

### [Arc enabled Kubernetes clusters](#tab/arcrt)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Control plane detection | Detection of suspicious activity for Kubernetes based on Kubernetes audit trail | Arc enabled K8s clusters | Preview | Preview | Requires **Defender sensor** | **Defender for Containers** |  |
| Workload detection | Monitors containerized workloads for threats and gives alerts to suspicious activities | Arc enabled Kubernetes clusters | Preview | - | Requires **Defender sensor** | **Defender for Containers** |  |
| Binary drift detection | Detects binary of runtime container from container image |  | - | - | - | - | - |
| Advanced hunting in XDR | View cluster incidents and alerts in Microsoft XDR | Arc enabled Kubernetes clusters | Preview - currently supports audit logs & process events | Preview - currently supports audit logs & process events | Requires **Defender sensor** | **Defender for Containers** |  |
| Response actions in XDR | Provides automated and manual remediation in Microsoft XDR | - | - | - | - | - |  |
| Malware detection | Detection of malware | - | - | - | - | - | - |

#### Kubernetes distributions/configurations for runtime threat protection in Arc enabled Kubernetes

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1arc)</sup> <sup>[2](#footnote2arc)</sup><br>* [Azure Kubernetes Service hybrid](/azure/aks/hybrid/aks-hybrid-options-overview)<br> * [Azure Red Hat OpenShift](https://azure.microsoft.com/services/openshift/)<br> * [Red Hat OpenShift](https://www.openshift.com/learn/topics/kubernetes/) (version 4.6 or newer) |

<sup><a name="footnote1arc"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested.

<sup><a name="footnote2arc"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).


---

## Security posture management

### [Azure](#tab/azurespm)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) <sup>[1](#footnote1spm)</sup> | Provides zero footprint, API-based discovery of Kubernetes clusters, their configurations and deployments. | AKS | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| Comprehensive inventory capabilities | Enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets. | ACR, AKS | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| Attack path analysis | A graph-based algorithm that scans the cloud security graph. The scans  expose exploitable paths that attackers might use to breach your  environment. | ACR, AKS | GA | GA | Activated with plan | Defender CSPM (requires Agentless discovery for Kubernetes to be enabled) | Azure commercial clouds |
| Enhanced risk-hunting | Enables security admins to actively hunt for posture issues in their containerized assets through queries (built-in and custom) and [security insights](attack-path-reference.md#insights) in the [security explorer](how-to-manage-cloud-security-explorer.md). | ACR, AKS | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| [Control plane hardening](defender-for-containers-architecture.md) <sup>[1](#footnote1spm)</sup> | Continuously assesses the configurations of your clusters and compares them with the initiatives applied to your subscriptions. When it finds misconfigurations, Defender for Cloud generates security recommendations that are available on Defender for Cloud's Recommendations page. The recommendations let you investigate and remediate issues. | ACR, AKS | GA | GA | Requires **K8S API access** | Free | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| [Workload hardening](kubernetes-workload-protections.md) <sup>[1](#footnote1spm)</sup> |Protect workloads of your Kubernetes containers with best practice recommendations. |AKS | GA | - | Requires **Azure Policy** | Free | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| CIS Azure Kubernetes Service | CIS Azure Kubernetes Service Benchmark | AKS | GA | - | Assigned as a security standard | Defender for Containers **OR** Defender CSPM | Commercial clouds<br><br> |

<sup><a name="footnote1spm"></a>1</sup> This feature can be enabled for an individual cluster when enabling Defender for Containers at the cluster resource level.

### [AWS](#tab/awsspm)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) | Provides zero footprint, API-based discovery of Kubernetes clusters, their configurations and deployments. | EKS | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| Comprehensive inventory capabilities | Enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets. | ECR, EKS | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | AWS |
| Attack path analysis | A graph-based algorithm that scans the cloud security graph. The scans  expose exploitable paths that attackers might use to breach your  environment. | ECR, EKS | GA | GA | Requires **K8S API access** | Defender CSPM (requires Agentless discovery for Kubernetes to be enabled) | AWS |
| Enhanced risk-hunting | Enables security admins to actively hunt for posture issues in their containerized assets through queries (built-in and custom) and [security insights](attack-path-reference.md#insights) in the [security explorer](how-to-manage-cloud-security-explorer.md). | ECR, EKS | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | AWS |
| [Control plane hardening](defender-for-containers-architecture.md) | Continuously assesses the configurations of your clusters and compares them with the initiatives applied to your subscriptions. When it finds misconfigurations, Defender for Cloud generates security recommendations that are available on Defender for Cloud's Recommendations page. The recommendations let you investigate and remediate issues. | ECR, EKS | GA | GA | Requires **K8S API access** | Free | AWS |
| [Workload hardening](kubernetes-workload-protections.md) |Protect workloads of your Kubernetes containers with best practice recommendations. |EKS | GA | - | Requires **Auto provision Azure Policy extension for Azure Arc** | Free | AWS |
| CIS Azure Kubernetes Service | CIS Azure Kubernetes Service Benchmark | EKS | GA | - | Assigned as a security standard | Defender for Containers **OR** Defender CSPM | AWS |

### [GCP](#tab/gcpspm)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) | Provides zero footprint, API-based discovery of Kubernetes clusters, their configurations and deployments. | GKE | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | GCP |
| Comprehensive inventory capabilities | Enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets. | GCR, GAR, GKE | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | GCP |
| Attack path analysis | A graph-based algorithm that scans the cloud security graph. The scans  expose exploitable paths that attackers might use to breach your  environment. | GCR, GAR, GKE | GA | GA | Requires **K8S API access** | Defender CSPM | GCP |
| Enhanced risk-hunting | Enables security admins to actively hunt for posture issues in their containerized assets through queries (built-in and custom) and [security insights](attack-path-reference.md#insights) in the [security explorer](how-to-manage-cloud-security-explorer.md). | GCR, GAR, GKE | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | GCP |
| [Control plane hardening](defender-for-containers-architecture.md) | Continuously assesses the configurations of your clusters and compares them with the initiatives applied to your subscriptions. When it finds misconfigurations, Defender for Cloud generates security recommendations that are available on Defender for Cloud's Recommendations page. The recommendations let you investigate and remediate issues. | GKE | GA | GA | Activated with plan | Free | GCP |
| [Workload hardening](kubernetes-workload-protections.md) | Protect workloads of your Kubernetes containers with best practice recommendations. | GKE | GA | - | Requires **Auto provision Azure Policy extension for Azure Arc** | Free | GCP |
| CIS Azure Kubernetes Service | CIS Azure Kubernetes Service Benchmark | GKE | GA | - | Assigned as a security standard | Defender for Containers **OR** Defender CSPM | GCP |

### [Arc enabled Kubernetes](#tab/arcspm)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) | Provides zero footprint, API-based discovery of Kubernetes clusters, their configurations and deployments. | Arc enabled Kubernetes cluster | - | - | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Arc enabled Kubernetes cluster |
| Comprehensive inventory capabilities | Enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets. | Arc enabled Kubernetes cluster | - | - | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Arc enabled Kubernetes cluster |
| Attack path analysis | A graph-based algorithm that scans the cloud security graph. The scans  expose exploitable paths that attackers might use to breach your  environment. | Arc enabled Kubernetes cluster | GA | GA | Requires **K8S API access** | Defender CSPM | Arc enabled Kubernetes cluster |
| Enhanced risk-hunting | Enables security admins to actively hunt for posture issues in their containerized assets through queries (built-in and custom) and [security insights](attack-path-reference.md#insights) in the [security explorer](how-to-manage-cloud-security-explorer.md). | Arc enabled Kubernetes cluster | GA | GA | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | Arc enabled Kubernetes cluster |
| [Control plane hardening](defender-for-containers-architecture.md) | Continuously assesses the configurations of your clusters and compares them with the initiatives applied to your subscriptions. When it finds misconfigurations, Defender for Cloud generates security recommendations that are available on Defender for Cloud's Recommendations page. The recommendations let you investigate and remediate issues. | - | - | - | - | - | - |
| [Workload hardening](kubernetes-workload-protections.md) |Protect workloads of your Kubernetes containers with best practice recommendations. | Arc enabled Kubernetes cluster | GA | - | Requires **Auto provision Azure Policy extension for Azure Arc** | Defender for Containers | Arc enabled Kubernetes cluster |
| CIS Azure Kubernetes Service | CIS Azure Kubernetes Service Benchmark | Arc enabled VMs | Preview | - | Assigned as a security standard | Defender for Containers **OR** Defender CSPM | Arc enabled Kubernetes cluster |

### [External registries](#tab/extspm)

| Feature | Description | Supported resources | Linux release state | Windows release state | Enablement method | Plans | Clouds availability |
|--|--|--|--|--|--|--|--|
| Comprehensive inventory capabilities | Enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets. | Docker Hub , JFrog Artifactory | Preview | Preview | Requires **K8S API access** | Defender for Containers **OR** Defender CSPM | - |
| Attack path analysis | A graph-based algorithm that scans the cloud security graph. The scans expose exploitable paths that attackers might use to breach your  environment. | Docker Hub , JFrog Artifactory | Preview | Preview | Requires **K8S API access** | Defender CSPM | - |

---

## Network restrictions

### [AWS](#tab/awsnet)

| Aspect | Details |
|--|--|
| Outbound proxy support | Outbound proxy without authentication and outbound proxy with basic authentication are supported. Outbound proxy that expects trusted certificates is currently not supported. |
| Clusters with IP restrictions | If your Kubernetes cluster in AWS has control plane IP restrictions enabled (see  [Amazon EKS cluster endpoint access control - Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html) ), the control plane's IP restriction configuration is updated to include the CIDR block of Microsoft Defender for Cloud. |

### [GCP](#tab/gcpnet)

| Aspect | Details |
|--|--|
| Outbound proxy support | Outbound proxy without authentication and outbound proxy with basic authentication are supported. Outbound proxy that expects trusted certificates is currently not supported. |
| Clusters with IP restrictions | If your Kubernetes cluster in GCP has control plane IP restrictions enabled (see [GKE - Add authorized networks for control plane access](https://cloud.google.com/kubernetes-engine/docs/how-to/authorized-networks) ), the control plane's IP restriction configuration is updated to include the CIDR block of Microsoft Defender for Cloud. |

### [Arc enabled](#tab/arcnet)

| Aspect | Details |
|--|--|
| Outbound proxy support | Outbound proxy without authentication and outbound proxy with basic authentication are supported. Outbound proxy that expects trusted certificates is currently not supported. |

---

## Supported host operating systems

Defender for Containers relies on the Defender sensor for several features. The Defender sensor is supported only with Linux Kernel 5.4 and above, on the following host operating systems:

- Amazon Linux 2
- CentOS 8  (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)
- Debian 10
- Debian 11
- Google Container-Optimized OS
- Mariner 1.0
- Mariner 2.0
- Red Hat Enterprise Linux 8
- Ubuntu 16.04
- Ubuntu 18.04
- Ubuntu 20.04
- Ubuntu 22.04

Ensure your Kubernetes node is running on one of these verified operating systems. Clusters with unsupported host operating systems don't get the benefits of features relying on Defender sensor.

## Defender sensor limitations

The Defender sensor in AKS V1.28 and below isn't supported on Arm64 nodes.


## Azure

### Security posture management

| Feature | Description | Supported resources | Linux release state | Windows release state   | Enablement method | Sensor | Plans | Azure clouds availability |
|--|--|--|--|--|--|--|--|--|
| [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) <sup>[1](#footnote1spm)</sup> | Provides zero footprint, API-based discovery of Kubernetes clusters, their configurations and deployments. | AKS | GA | GA | Enable **K8S API access** toggle | Agentless  | Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| Comprehensive inventory capabilities | Enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets. | ACR, AKS | GA | GA | Enable **K8S API access** toggle | Agentless| Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| Attack path analysis | A graph-based algorithm that scans the cloud security graph. The scans  expose exploitable paths that attackers might use to breach your  environment. | ACR, AKS | GA | GA | Activated with plan | Agentless | Defender CSPM (requires Agentless discovery for Kubernetes to be enabled) | Azure commercial clouds |
| Enhanced risk-hunting | Enables security admins to actively hunt for posture issues in their containerized assets through queries (built-in and custom) and [security insights](attack-path-reference.md#insights) in the [security explorer](how-to-manage-cloud-security-explorer.md). | ACR, AKS | GA | GA | Enable **K8S API access** toggle | Agentless | Defender for Containers **OR** Defender CSPM | Azure commercial clouds |
| [Control plane hardening](defender-for-containers-architecture.md) <sup>[1](#footnote1spm)</sup> | Continuously assesses the configurations of your clusters and compares them with the initiatives applied to your subscriptions. When it finds misconfigurations, Defender for Cloud generates security recommendations that are available on Defender for Cloud's Recommendations page. The recommendations let you investigate and remediate issues. | ACR, AKS | GA | GA | Activated with plan | Agentless | Free | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| [Kubernetes data plane hardening](kubernetes-workload-protections.md) <sup>[1](#footnote1spm)</sup> |Protect workloads of your Kubernetes containers with best practice recommendations. |AKS | GA | - | Enable **Azure Policy for Kubernetes** toggle | Azure Policy | Free | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| CIS Azure Kubernetes Service | CIS Azure Kubernetes Service Benchmark | AKS | GA | - | Assigned as a security standard | Agentless | Defender for Containers **OR** Defender CSPM | Commercial clouds<br><br> |

<sup><a name="footnote1spm"></a>1</sup> This feature can be enabled for an individual cluster when enabling Defender for Containers at the cluster resource level.

### Vulnerability assessment

| Feature | Description | Supported resources | Linux release state | Windows release state   | Enablement method | Sensor | Plans | Azure clouds availability |
|--|--|--|--|--|--|--|--|--|
| Agentless registry scan (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-azure---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| Vulnerability assessment for images in ACR | ACR, Private ACR | GA | GA | Enable **Agentless container vulnerability assessment** toggle (National clouds are automatically enabled and cannot be toggled) | Agentless | Defender for Containers or Defender CSPM | Commercial clouds<br/><br/> National clouds: Azure Government, Azure operated by 21Vianet |
| Agentless/agent-based runtime (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-azure---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| Vulnerability assessment for running images in AKS | AKS | Preview <br/> (Containers running ACR images supported are GA)  | - | Enable **Agentless container vulnerability assessment** toggle | Agentless (Requires Agentless discovery for Kubernetes) **OR/AND** Defender sensor | Defender for Containers or Defender CSPM | Commercial clouds<br/><br/> |
| Agentless K8s node scanning | [Vulnerability assessment of K8s nodes](kubernetes-nodes-va.md) | AKS| Preview | Preview |Enable **Agentless scanning for machines** | Agentless | Defender for Containers or Defender for Servers P2 or CSPM | Commercial clouds |

### Runtime threat protection

| Feature | Description | Supported resources | Linux release state | Windows release state   | Enablement method | Sensor | Plans | Azure clouds availability |
|--|--|--|--|--|--|--|--|--|
| [Control plane](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters) | Detection of suspicious activity for Kubernetes based on Kubernetes audit trail | AKS | GA | GA | Enabled with plan | Agentless | Defender for Containers | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| Workload | Detection of suspicious activity for Kubernetes for cluster level, node level, and workload level | AKS | GA | - | Enable **Defender Sensor in Azure** toggle **OR** deploy Defender sensors on individual clusters | Defender sensor | Defender for Containers | Commercial clouds<br /><br />National clouds: Azure Government, Azure China 21Vianet |
| Node | [Detection of malware on K8s nodes](kubernetes-nodes-malware.md) | AKS | Preview | Preview | Enable **Agentless scanning for machines**  | Agentless | Defender for Containers or Defender for Servers P2 | Commercial clouds |

### Deployment & monitoring

| Feature | Description | Supported resources | Linux release state | Windows release state   | Enablement method | Sensor | Plans | Azure clouds availability |
|--|--|--|--|--|--|--|--|--|
| Discovery of unprotected clusters <sup>[1](#footnote1dm)</sup> | Discovering Kubernetes clusters missing Defender sensors | AKS | GA | GA | Enabled with plan | Agentless | Free | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| Defender sensor auto provisioning | Automatic deployment of Defender sensor | AKS | GA | - | Enable **Defender Sensor in Azure** toggle | Agentless | Defender for Containers | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |
| Azure Policy for Kubernetes auto provisioning <sup>[1](#footnote1dm)</sup> | Automatic deployment of Azure policy sensor for Kubernetes | AKS | GA | - | Enable **Azure policy for Kubernetes** toggle | Agentless | Free | Commercial clouds<br><br> National clouds: Azure Government, Azure operated by 21Vianet |

<sup><a name="footnote1dm"></a>1</sup> This feature can be enabled for an individual cluster when enabling Defender for Containers at the cluster resource level.

### Registries and images support for Azure - Vulnerability assessment powered by Microsoft Defender Vulnerability Management

| Aspect | Details |
|--|--|
| Registries and images | **Supported**<br> * ACR registries <br> * [ACR registries protected with Azure Private Link](/azure/container-registry/container-registry-private-link) (Private registries requires access to Trusted Services) <br> * Container images in Docker V2 format <br> * Images with [Open Container Initiative (OCI)](https://github.com/opencontainers/image-spec/blob/main/spec.md) image format specification <br> **Unsupported**<br>   * Super-minimalist images such as [Docker scratch](https://hub.docker.com/_/scratch/) images<br> are currently unsupported <br> |
| Operating systems | **Supported** <br> * Alpine Linux 3.12-3.21<br> * Red Hat Enterprise Linux 6-9 <br> * CentOS 6-9. (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)<br> * Oracle Linux 6-9 <br> * Amazon Linux 1, 2 <br> * openSUSE Leap, openSUSE Tumbleweed <br> * SUSE Enterprise Linux 11-15 <br> * Debian GNU/Linux 7-12 <br> * Google Distroless (based on Debian GNU/Linux 7-12) <br> * Ubuntu 12.04-22.04 <br>  * Fedora 31-37<br> * Mariner 1-2<br> * Windows Server 2016, 2019, 2022 |
| Language specific packages <br><br>  | **Supported**<br> * Python <br> * Node.js <br> * PHP <br> * Ruby <br> * Rust <br> * .NET <br> * Java<br> * Go |

### Kubernetes distributions and configurations for Azure - Runtime threat protection

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported**<br> * [Azure Kubernetes Service (AKS)](/azure/aks/intro-kubernetes) with [Kubernetes RBAC](/azure/aks/concepts-identity#kubernetes-rbac) <br><br> **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1azrt)</sup> <sup>[2](#footnote2azrt)</sup><br> * [Azure Kubernetes Service hybrid](/azure/aks/hybrid/aks-hybrid-options-overview)<br> * [Kubernetes](https://kubernetes.io/docs/home/)<br> * [AKS Engine](https://github.com/Azure/aks-engine)<br> * [Azure Red Hat OpenShift](https://azure.microsoft.com/services/openshift/)<br /> |

<sup><a name="footnote1azrt"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested on Azure.

<sup><a name="footnote2azrt"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

## AWS

| Domain | Feature | Supported Resources | Linux release state  | Windows release state   | Agentless/Sensor-based | Pricing tier |
|--|--| -- | -- | -- | -- | --|
| Security posture management  | [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) | EKS | GA | GA | Agentless  | Defender for Containers **OR** Defender CSPM |
| Security posture management  | Comprehensive inventory capabilities | ECR, EKS | GA | GA | Agentless| Defender for Containers **OR** Defender CSPM |
| Security posture management  | Attack path analysis | ECR, EKS | GA | GA | Agentless | Defender CSPM |
| Security posture management  | Enhanced risk-hunting | ECR, EKS | GA | GA | Agentless | Defender for Containers **OR** Defender CSPM |
| Security posture management | CIS Amazon Elastic Kubenretes Service | EKS | GA | - | Agentless | Defender for Containers **OR** Defender CSPM |
| Security posture management | Control plane hardening | - | - | - | - | - |
| Security posture management | Kubernetes data plane hardening | EKS | GA| - | Azure Policy for Kubernetes | Defender for Containers |
| [Vulnerability assessment](agentless-vulnerability-assessment-azure.md) | Agentless registry scan (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-aws---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| ECR | GA | GA | Agentless | Defender for Containers or Defender CSPM |
| [Vulnerability assessment](agentless-vulnerability-assessment-azure.md) | Agentless/sensor-based runtime (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-aws---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| Supported container registries | Preview | - | Agentless **OR/AND** Defender sensor | Defender for Containers or Defender CSPM |
| Agentless K8s node scanning | Vulnerability assessment of K8s nodes | EKS| - | - |- | -| - | - |
| Runtime protection| Control plane | EKS | GA | GA | Agentless | Defender for Containers |
| Runtime protection| Workload | EKS | GA | - | Defender sensor | Defender for Containers |
| Deployment & monitoring | Discovery of unprotected clusters | EKS | GA | GA | Agentless | Defender for Containers |
| Deployment & monitoring | Auto provisioning of Defender sensor | EKS | GA | - | - | - |
| Deployment & monitoring | Auto provisioning of Azure Policy for Kubernetes | EKS | GA | - | - | - |

### Registries and images support for AWS - Vulnerability assessment powered by Microsoft Defender Vulnerability Management

| Aspect | Details |
|--|--|
| Registries and images | **Supported**<br> * ECR registries <br> * Container images in Docker V2 format  <br> * Images with [Open Container Initiative (OCI)](https://github.com/opencontainers/image-spec/blob/main/spec.md) image format specification <br>  **Unsupported**<br>   * Super-minimalist images such as [Docker scratch](https://hub.docker.com/_/scratch/) images is currently unsupported <br> * Public repositories <br> * Manifest lists <br>|
| Operating systems | **Supported** <br> * Alpine Linux 3.12-3.21<br> * Red Hat Enterprise Linux 6-9 <br> * CentOS 6-9 (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)<br> * Oracle Linux 6-9 <br> * Amazon Linux 1, 2 <br> * openSUSE Leap, openSUSE Tumbleweed <br> * SUSE Enterprise Linux 11-15 <br> * Debian GNU/Linux 7-12 <br> * Google Distroless (based on Debian GNU/Linux 7-12)<br> * Ubuntu 12.04-22.04 <br>  * Fedora 31-37<br> * Mariner 1-2<br> * Windows server 2016, 2019, 2022 |
| Language specific packages <br><br>  | **Supported** <br> * Python <br> * Node.js <br> * PHP <br> * Ruby <br> * Rust <br> * .NET <br> * Java<br> * Go |

### Kubernetes distributions/configurations support for AWS - Runtime threat protection

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported**<br>*  [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/)<br><br> **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1awsrt)</sup> <sup>[2](#footnote2awsrt)</sup><br> * [Kubernetes](https://kubernetes.io/docs/home/)<br />**Unsupported**<br /> * EKS private clusters |

<sup><a name="footnote1awsrt"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested.

<sup><a name="footnote2awsrt"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

### Outbound proxy support - AWS

Outbound proxy without authentication and outbound proxy with basic authentication are supported. Outbound proxy that expects trusted certificates is currently not supported.

### Clusters with IP restrictions - AWS

If your Kubernetes cluster in AWS has control plane IP restrictions enabled (see  [Amazon EKS cluster endpoint access control - Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html) ), the control plane's IP restriction configuration is updated to include the CIDR block of Microsoft Defender for Cloud.

## GCP

| Domain | Feature | Supported Resources | Linux release state  | Windows release state  | Agentless/Sensor-based | Pricing tier |
|--|--| -- | -- | -- | -- | --|
| Security posture management  | [Agentless discovery for Kubernetes](defender-for-containers-introduction.md#security-posture-management) | GKE | GA | GA | Agentless  | Defender for Containers **OR** Defender CSPM |
| Security posture management  | Comprehensive inventory capabilities | GAR, GCR, GKE | GA | GA | Agentless| Defender for Containers **OR** Defender CSPM |
| Security posture management  | Attack path analysis | GAR, GCR, GKE | GA | GA | Agentless | Defender CSPM |
| Security posture management  | Enhanced risk-hunting | GAR, GCR, GKE | GA | GA | Agentless | Defender for Containers **OR** Defender CSPM |
| Security posture management | CIS Google Kubernetes Engine | GKE | GA | - | Agentless | Defender for Containers **OR** Defender CSPM |
| Security posture management | Control plane hardening | GKE | GA | GA | Agentless | Free |
| Security posture management | Kubernetes data plane hardening | GKE | GA| - | Azure Policy for Kubernetes | Defender for Containers |
| [Vulnerability assessment](agentless-vulnerability-assessment-azure.md) | Agentless registry scan (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-gcp---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| GAR, GCR | GA | GA | Agentless | Defender for Containers or Defender CSPM |
| [Vulnerability assessment](agentless-vulnerability-assessment-azure.md) | Agentless/sensor-based runtime (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-gcp---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| GKE | GA | GA | Agentless **OR/AND** Defender sensor | Defender for Containers or Defender CSPM |
| Agentless K8s node scanning | Vulnerability assessment of K8s nodes | GKE| - | - |- | -| - | - |
| Runtime protection| Control plane | GKE | GA | GA | Agentless | Defender for Containers |
| Runtime protection| Workload | GKE | GA | - | Defender sensor | Defender for Containers |
| Deployment & monitoring | Discovery of unprotected clusters | GKE | GA | GA | Agentless | Defender for Containers |
| Deployment & monitoring | Auto provisioning of Defender sensor | GKE | GA | - | Agentless | Defender for Containers |
| Deployment & monitoring | Auto provisioning of Azure Policy for Kubernetes | GKE | GA | - | Agentless | Defender for Containers |

### Registries and images support for GCP - Vulnerability assessment powered by Microsoft Defender Vulnerability Management

| Aspect | Details |
|--|--|
| Registries and images | **Supported**<br> * Google Registries (GAR, GCR) <br> * Container images in Docker V2 format  <br> * Images with [Open Container Initiative (OCI)](https://github.com/opencontainers/image-spec/blob/main/spec.md) image format specification <br> **Unsupported**<br> * Super-minimalist images such as [Docker scratch](https://hub.docker.com/_/scratch/) images is currently unsupported <br> * Public repositories <br> * Manifest lists <br>|
| Operating systems | **Supported** <br> * Alpine Linux 3.12-3.21<br> * Red Hat Enterprise Linux 6-9 <br> * CentOS 6-9 (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)<br> * Oracle Linux 6-9 <br> * Amazon Linux 1, 2 <br> * openSUSE Leap, openSUSE Tumbleweed <br> * SUSE Enterprise Linux 11-15 <br> * Debian GNU/Linux 7-12 <br> * Google Distroless (based on Debian GNU/Linux 7-12)<br> * Ubuntu 12.04-22.04 <br>  * Fedora 31-37<br> * Mariner 1-2<br> * Windows server 2016, 2019, 2022 |
| Language specific packages <br><br>  | **Supported** <br><br> * Python <br> * Node.js <br> * PHP <br> * Ruby <br> * Rust <br> * .NET <br> * Java<br> * Go |

### Kubernetes distributions/configurations support for GCP - Runtime threat protection

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported**<br>  * [Google Kubernetes Engine (GKE) Standard](https://cloud.google.com/kubernetes-engine/) <br><br> **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1gcprt)</sup> <sup>[2](#footnote2gcprt)</sup><br> * [Kubernetes](https://kubernetes.io/docs/home/)<br><br />**Unsupported**<br /> * Private network clusters<br /> * GKE autopilot<br /> * GKE AuthorizedNetworksConfig |

<sup><a name="footnote1gcprt"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested.

<sup><a name="footnote2gcprt"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

### Outbound proxy support - GCP

Outbound proxy without authentication and outbound proxy with basic authentication are supported. Outbound proxy that expects trusted certificates is currently not supported.

### Clusters with IP restrictions - GCP

If your Kubernetes cluster in GCP has control plane IP restrictions enabled (see [Add authorized networks for control plane access  |  Google Kubernetes Engine (GKE)  |  Google Cloud](https://cloud.google.com/kubernetes-engine/docs/how-to/authorized-networks) ), the control plane's IP restriction configuration is updated to include the CIDR block of Microsoft Defender for Cloud.

## On-premises, Arc-enabled Kubernetes clusters

| Domain | Feature | Supported Resources | Linux release state  | Windows release state   | Agentless/Sensor-based | Pricing tier |
|--|--| -- | -- | -- | -- | --|
| Security posture management | Docker CIS | Arc enabled VMs | Preview | - | Log Analytics agent | Defender for Servers Plan 2 |
| Security posture management | Control plane hardening | - | - | - | - | - |
| Security posture management | Kubernetes data plane hardening |Arc enabled K8s clusters | GA| - | Azure Policy for Kubernetes | Defender for Containers |
| Runtime protection| Threat protection (control plane)|Arc enabled K8s clusters| Preview | Preview | Defender sensor | Defender for Containers |
| Runtime protection | Threat protection (workload)| Arc enabled K8s clusters| Preview | - | Defender sensor | Defender for Containers |
| Deployment & monitoring | Discovery of unprotected clusters | Arc enabled K8s clusters | Preview | - | Agentless | Free |
| Deployment & monitoring | Auto provisioning of Defender sensor | Arc enabled K8s clusters | Preview | Preview | Agentless | Defender for Containers |
| Deployment & monitoring | Auto provisioning of Azure Policy for Kubernetes | Arc enabled K8s clusters | Preview | - | Agentless | Defender for Containers |

### External container registries

| Domain | Feature | Supported Resources | Linux release state  | Windows release state  | Agentless/Sensor-based | Pricing tier |
|--|--| -- | -- | -- | -- | --|
| Security posture management  | Comprehensive inventory capabilities | Docker Hub , JFrog Artifactory| Preview | Preview | Agentless| Foundational CSPM **OR** Defender for Containers **OR** Defender CSPM |
| Security posture management  | Attack path analysis | Docker Hub , JFrog Artifactory| Preview | Preview | Agentless| Defender CSPM |
| [Vulnerability assessment](agentless-vulnerability-assessment-azure.md) | Agentless registry scan (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-gcp---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| Docker Hub , JfFrog Artifactory| Preview | Preview | Agentless | Defender for Containers **OR** Defender CSPM |
| [Vulnerability assessment](agentless-vulnerability-assessment-azure.md) | Agentless/sensor-based runtime (powered by Microsoft Defender Vulnerability Management) [supported packages](#registries-and-images-support-for-gcp---vulnerability-assessment-powered-by-microsoft-defender-vulnerability-management)| Docker Hub , JFrog Artifactory| Preview | Preview | Agentless **OR/AND** Defender sensor | Defender for Containers **OR** Defender CSPM |

### Kubernetes distributions and configurations

| Aspect | Details |
|--|--|
| Kubernetes distributions and configurations | **Supported via Arc enabled Kubernetes** <sup>[1](#footnote1arc)</sup> <sup>[2](#footnote2arc)</sup><br>* [Azure Kubernetes Service hybrid](/azure/aks/hybrid/aks-hybrid-options-overview)<br> * [Azure Red Hat OpenShift](https://azure.microsoft.com/services/openshift/)<br> * [Red Hat OpenShift](https://www.openshift.com/learn/topics/kubernetes/) (version 4.6 or newer) |

<sup><a name="footnote1arc"></a>1</sup> Any Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters should be supported, but only the specified clusters have been tested.

<sup><a name="footnote2arc"></a>2</sup> To get [Microsoft Defender for Containers](defender-for-containers-introduction.md) protection for your environments, you need to onboard [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview) and enable Defender for Containers as an Arc extension.

> [!NOTE]
> For additional requirements for Kubernetes workload protection, see [existing limitations](/azure/governance/policy/concepts/policy-for-kubernetes#limitations).

### Supported host operating systems

Defender for Containers relies on the Defender sensor for several features. The Defender sensor is supported only with Linux Kernel 5.4 and above, on the following host operating systems:

- Amazon Linux 2
- CentOS 8  (CentOS is End Of Service as of June 30, 2024. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).)
- Debian 10
- Debian 11
- Google Container-Optimized OS
- Mariner 1.0
- Mariner 2.0
- Red Hat Enterprise Linux 8
- Ubuntu 16.04
- Ubuntu 18.04
- Ubuntu 20.04
- Ubuntu 22.04

Ensure your Kubernetes node is running on one of these verified operating systems. Clusters with unsupported host operating systems don't get the benefits of features relying on Defender sensor.

### Defender sensor limitations

The Defender sensor in AKS V1.28 and below isn't supported on Arm64 nodes.

### Network restrictions

#### Outbound proxy support

Outbound proxy without authentication and outbound proxy with basic authentication are supported. Outbound proxy that expects trusted certificates is currently not supported.

## Next steps

- Learn how [Defender for Cloud collects data using the Log Analytics Agent](monitoring-components.md).
- Learn how [Defender for Cloud manages and safeguards data](data-security.md).
- Review the [platforms that support Defender for Cloud](security-center-os-coverage.md).
