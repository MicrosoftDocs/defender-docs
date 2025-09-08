---
title: Container security architecture
description: Learn about the architecture of Microsoft Defender for Containers for the Azure, AWS, GCP, and on-premises container platform
author: dcurwin
ms.author: dacurwin
ms.topic: conceptual
ms.date: 07/15/2025
# customer intent: As a developer, I want to understand the container security architecture of Microsoft Defender for Containers so that I can implement it effectively.
---

# Defender for Containers architecture

Defender for Containers is designed differently for each Kubernetes environment, depending on whether they're running in:

- **Azure Kubernetes Service (AKS)** - Microsoft's managed service for developing, deploying, and managing containerized applications.

- **Amazon Elastic Kubernetes Service (EKS) in a connected Amazon Web Services (AWS) account** - Amazon's managed service for running Kubernetes on AWS without needing to install, operate, and maintain your own Kubernetes control plane or nodes.

- **Google Kubernetes Engine (GKE) in a connected Google Cloud Platform (GCP) project** - Google’s managed environment for deploying, managing, and scaling applications using GCP infrastructure.

- **An unmanaged Kubernetes distribution** (using Azure Arc-enabled Kubernetes) - Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters hosted on-premises or on IaaS.

> [!NOTE]
> Defender for Containers support for Arc-enabled Kubernetes clusters (AWS EKS and GCP GKE) is a preview feature.

To protect your Kubernetes containers, Defender for Containers receives and analyzes:

- Audit logs and security events from the API server
- Cluster configuration information from the control plane
- Workload configuration from Azure Policy
- Security signals and events from the node level

To learn more about implementation details such as supported operating systems, feature availability, outbound proxy, see [Defender for Containers feature availability](supported-machines-endpoint-solutions-clouds-containers.md).

## Architecture for each Kubernetes environment

## [**Azure (AKS)**](#tab/defender-for-container-arch-aks)

### Architecture diagram of Defender for Cloud and AKS clusters

When Defender for Cloud protects a cluster hosted in Azure Kubernetes Service, the collection of audit log data is agentless and automatic through Azure infrastructure with no extra cost or configuration considerations. To get the full protection offered by Microsoft Defender for Containers, you need these components:

- **Defender sensor**: A lightweight DaemonSet deployed on AKS nodes that collects runtime telemetry (Kubernetes events, process, and network data) by using [eBPF technology](https://ebpf.io/). It sends the telemetry securely to Defender for Cloud for runtime threat protection. The sensor registers with a Log Analytics workspace and acts as a data pipeline. However, the audit log data isn't stored in the Log Analytics workspace. The Defender sensor is deployed as an AKS Security profile, natively integrated in AKS Resource Provider (RP).

> [!NOTE]
> When you configure the Defender sensor on an AKS cluster, it triggers a reconciliation process. This process happens as part of the Defender for Containers plan and is expected behavior.

- **Azure Policy for Kubernetes**: A pod that extends the open-source [Gatekeeper v3](https://github.com/open-policy-agent/gatekeeper) and registers as a web hook to Kubernetes admission control. With this pod, you can apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner. The Azure Policy for Kubernetes pod is deployed as an AKS add-on and you only need to install it on one node in the cluster. It provides the option to enforce configuration rules. For more information, see [Protect your Kubernetes workloads](kubernetes-workload-protections.md) and [Understand Azure Policy for Kubernetes clusters](/azure/governance/policy/concepts/policy-for-kubernetes).

- **ACR integration**: Push-triggered and periodic image scanning for Azure Container Registry, providing vulnerability assessment without requiring extra components.

- **Agentless discovery**: Provides visibility into your Kubernetes clusters without requiring any agents, by using Azure native capabilities to discover and assess cluster configurations.

- **Agentless scanning for machines**: Periodic disk snapshots of Kubernetes nodes for an out-of-band, deep analysis of the operating system configuration and file system. This feature doesn't need any installed agents or network connectivity, and it doesn't affect machine performance.

- **Microsoft XDR integration**: Seamlessly integrates with Microsoft's extended detection and response platform for unified security operations and incident response.

:::image type="content" source="./media/defender-for-containers/architecture-aks-cluster.png" alt-text="Diagram of high-level architecture of the interaction between Microsoft Defender for Containers, Azure Kubernetes Service, and Azure Policy." lightbox="./media/defender-for-containers/architecture-aks-cluster.png":::

> [!NOTE]
> These components work together seamlessly. They require no inbound connections to your clusters and use Azure's native security infrastructure. All components use outbound-only connectivity (no inbound access required).

### Defender sensor component details

| Pod name | Namespace | Kind | Short description | Capabilities | Resource limits | Egress required |
|--|--|--|--|--|--|--|
| microsoft-defender-collector-ds-* | kube-system | [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) | Collects runtime telemetry (Kubernetes events, process, and network data) from nodes by using eBPF technology and sends it securely to Defender for Cloud. | SYS_ADMIN, <br>SYS_RESOURCE, <br>SYS_PTRACE | memory: 296Mi<br> <br> cpu: 360m | No |
| microsoft-defender-collector-misc-* | kube-system | [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) | Collects cluster-level inventory and security events that aren't bound to specific nodes. | N/A | memory: 64Mi <br> <br>Cpu: 60m | No |
| microsoft-defender-publisher-ds-* | kube-system | [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) | Publishes collected telemetry to Microsoft Defender for Containers backend service for processing and analysis. | N/A | memory: 200Mi <br> <br> Cpu: 60m | Https 443 <br> <br> Learn more about the [outbound access prerequisites](/azure/aks/outbound-rules-control-egress#microsoft-defender-for-containers) |

\* You can't configure resource limits. Learn more about [Kubernetes resources limits](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#resource-units-in-kubernetes).

### How does agentless discovery for Kubernetes in Azure work?

The discovery process uses snapshots taken at intervals:

:::image type="content" source="media/concept-agentless-containers/diagram-permissions-architecture.png" alt-text="Diagram of the permissions architecture." lightbox="media/concept-agentless-containers/diagram-permissions-architecture.png":::

When you enable the agentless discovery for Kubernetes extension, the following process occurs:

- **Create**:
  - If you enable the extension from Defender CSPM, Defender for Cloud creates an identity in your environment called `CloudPosture/securityOperator/DefenderCSPMSecurityOperator`.
  - If you enable the extension from Defender for Containers, Defender for Cloud creates an identity in your environment called `CloudPosture/securityOperator/DefenderForContainersSecurityOperator`.
- **Assign**: Defender for Cloud assigns a built-in role called **Kubernetes Agentless Operator** to that identity on subscription scope. The role contains the following permissions:

  - AKS read (Microsoft.ContainerService/managedClusters/read)
  - AKS Trusted Access with the following permissions:
  - Microsoft.ContainerService/managedClusters/trustedAccessRoleBindings/write
  - Microsoft.ContainerService/managedClusters/trustedAccessRoleBindings/read
  - Microsoft.ContainerService/managedClusters/trustedAccessRoleBindings/delete

   Learn more about [AKS Trusted Access](/azure/aks/trusted-access-feature).

- **Discover**: Using the system assigned identity, Defender for Cloud discovers the AKS clusters in your environment by making API calls to the API server of AKS.
- **Bind**: After discovering an AKS cluster, Defender for Cloud performs an AKS bind operation by creating a `ClusterRoleBinding` between the created identity and the Kubernetes `ClusterRole` *aks:trustedaccessrole:defender-containers:microsoft-defender-operator*. The `ClusterRole` is visible through the API and gives Defender for Cloud data plane read permission inside the cluster.

> [!NOTE]
> The copied snapshot stays in the same region as the cluster.

## [**On-premises / IaaS (Arc)**](#tab/defender-for-container-arch-arc)

### Architecture diagram of Defender for Cloud and Arc-enabled Kubernetes clusters

To get the full protection from Microsoft Defender for Containers, you need these components:

- **[Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview)** - Connects your clusters to Azure and lets Defender for Cloud deploy security components as [Arc extensions](/azure/azure-arc/kubernetes/extensions).

- **Defender sensor**: A lightweight DaemonSet deployed on each node that collects runtime telemetry (Kubernetes events, process, and network data) by using [eBPF technology](https://ebpf.io/) and Kubernetes audit logs for runtime threat protection. The sensor registers with a Log Analytics workspace and acts as a data pipeline. However, the audit log data isn't stored in the Log Analytics workspace. You deploy the Defender sensor as an Arc-enabled Kubernetes extension.

- **Azure Policy for Kubernetes**: A pod that extends the open-source [Gatekeeper v3](https://github.com/open-policy-agent/gatekeeper) and registers as a web hook to Kubernetes admission control. With this pod, you can apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner. You only need to install it on one node in the cluster. It provides the option to enforce configuration rules. For more information, see [Protect your Kubernetes workloads](kubernetes-workload-protections.md) and [Understand Azure Policy for Kubernetes clusters](/azure/governance/policy/concepts/policy-for-kubernetes).

> [!NOTE]
> Defender for Containers support for Arc-enabled Kubernetes clusters is a preview feature.

:::image type="content" source="./media/defender-for-containers/architecture-arc-cluster.png" alt-text="Diagram of high-level architecture of the interaction between Microsoft Defender for Containers, Azure Kubernetes Service, Azure Arc-enabled Kubernetes, and Azure Policy." lightbox="./media/defender-for-containers/architecture-arc-cluster.png":::

## [**AWS (EKS)**](#tab/defender-for-container-arch-eks)

### Architecture diagram of Defender for Cloud and EKS clusters

When Defender for Cloud protects a cluster hosted in Elastic Kubernetes Service, the collection of audit log data is agentless. To get the full protection offered by Microsoft Defender for Containers, you need these components:

- **[Kubernetes audit logs](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/)** – [AWS account's CloudWatch](https://aws.amazon.com/cloudwatch/) enables and collects audit log data through an agentless collector, and sends the collected information to the Microsoft Defender for Cloud backend for further analysis.

- **[Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview)** - Connects your EKS clusters to Azure and enables Defender for Cloud to deploy security components as [Arc extensions](/azure/azure-arc/kubernetes/extensions).

- **Defender sensor**: A lightweight DaemonSet deployed on each node that collects runtime telemetry (Kubernetes events, process, and network data) using [eBPF technology](https://ebpf.io/) for runtime threat protection. The sensor registers with a Log Analytics workspace and acts as a data pipeline. However, the audit log data isn't stored in the Log Analytics workspace. The Defender sensor is deployed as an Arc-enabled Kubernetes extension.

- **Azure Policy for Kubernetes**: A pod that extends the open-source [Gatekeeper v3](https://github.com/open-policy-agent/gatekeeper) and registers as a web hook to Kubernetes admission control, making it possible to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner. The Azure Policy for Kubernetes pod is deployed as an Arc-enabled Kubernetes extension and only needs to be installed on one node in the cluster. It provides the option to enforce configuration rules. For more information, see [Protect your Kubernetes workloads](kubernetes-workload-protections.md) and [Understand Azure Policy for Kubernetes clusters](/azure/governance/policy/concepts/policy-for-kubernetes).

:::image type="content" source="./media/defender-for-containers/architecture-eks-cluster.png" alt-text="Diagram of high-level architecture of the interaction between Microsoft Defender for Containers, Amazon Web Services' EKS clusters, Azure Arc-enabled Kubernetes, and Azure Policy." lightbox="./media/defender-for-containers/architecture-eks-cluster.png":::

### How does agentless discovery for Kubernetes in AWS work?

The discovery process uses snapshots taken at intervals:

When you enable the agentless discovery for Kubernetes extension, the following process occurs:

- **Create**:
  - Add the Defender for Cloud role *MDCContainersAgentlessDiscoveryK8sRole* to the *aws-auth ConfigMap* of the EKS clusters. You can customize the name.

- **Assign**: Defender for Cloud assigns the *MDCContainersAgentlessDiscoveryK8sRole* role the following permissions:

  - `eks:UpdateClusterConfig`
  - `eks:DescribeCluster`

- **Discover**: Using the system assigned identity, Defender for Cloud discovers the EKS clusters in your environment by making API calls to the API server of EKS.

> [!NOTE]
> The copied snapshot stays in the same region as the cluster.

## [**GCP (GKE)**](#tab/defender-for-container-gke)

### Architecture diagram of Defender for Cloud and GKE clusters

When Defender for Cloud protects a cluster hosted in Google Kubernetes Engine, it collects audit log data without using an agent. To get the full protection from Microsoft Defender for Containers, you need these components:

- **[Kubernetes audit logs](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/)** – [GCP Cloud Logging](https://cloud.google.com/logging/) enables and collects audit log data through an agentless collector, and sends the collected information to the Microsoft Defender for Cloud backend for further analysis.

- **[Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview)** - Connects your GKE clusters to Azure and enables Defender for Cloud to deploy security components as [Arc extensions](/azure/azure-arc/kubernetes/extensions).

- **Defender sensor**: A lightweight DaemonSet deployed on each node that collects runtime telemetry (Kubernetes events, process, and network data) using [eBPF technology](https://ebpf.io/) for runtime threat protection. The sensor registers with a Log Analytics workspace and acts as a data pipeline. However, the audit log data isn't stored in the Log Analytics workspace. The Defender sensor is deployed as an Arc-enabled Kubernetes extension.

- **Azure Policy for Kubernetes**: A pod that extends the open-source [Gatekeeper v3](https://github.com/open-policy-agent/gatekeeper) and registers as a web hook to Kubernetes admission control, making it possible to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner. The Azure Policy for Kubernetes pod is deployed as an Arc-enabled Kubernetes extension and only needs to be installed on one node in the cluster. It provides the option to enforce configuration rules. For more information, see [Protect your Kubernetes workloads](kubernetes-workload-protections.md) and [Understand Azure Policy for Kubernetes clusters](/azure/governance/policy/concepts/policy-for-kubernetes).

:::image type="content" source="./media/defender-for-containers/architecture-gke.png" alt-text="Diagram of high-level architecture of the interaction between Microsoft Defender for Containers, Google GKE clusters, Azure Arc-enabled Kubernetes, and Azure Policy." lightbox="./media/defender-for-containers/architecture-gke.png":::

### How does agentless discovery for Kubernetes in GCP work?

The discovery process uses snapshots taken at intervals:

When you enable the agentless discovery for Kubernetes extension, the following process occurs:

- **Create**:
  - The service account *mdc-containers-k8s-operator* is created. You can customize the name.

- **Assign**: Defender for Cloud attaches the following roles to the service account *mdc-containers-k8s-operator*:

  - The custom role `MDCGkeClusterWriteRole`, which has the `container.clusters.update` permission
  - The built-in role `container.viewer`

- **Discover**: Using the system assigned identity, Defender for Cloud discovers the GKE clusters in your environment by making API calls to the API server of GKE.

> [!NOTE]
> The copied snapshot stays in the same region as the cluster.

---

## Next steps

In this overview, you learned about the architecture of container security in Microsoft Defender for Cloud. To enable the plan, see [Defender for Containers deployment overview](defender-for-containers-deployment-overview.md).
