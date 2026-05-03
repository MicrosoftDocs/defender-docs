---
title: Network access and permissions reference for Defender for Containers
description: Reference documentation for network connectivity and permissions required by Microsoft Defender for Containers.
ms.topic: reference
author: Elazark
ms.author: elkrieger
ms.service: defender-for-cloud
ms.date: 04/16/2026
---

# Network access and permissions reference for Defender for Containers

This article describes the network connectivity and permission requirements for Microsoft Defender for Containers.

The requirements in this article depend on the enabled features and the environment in which your container workloads run.

Learn more about [connectivity patterns](defender-for-containers-feature-access-patterns.md) and [plan components](defender-for-containers-architecture.md).

## Microsoft Defender for Cloud to container registries

Microsoft Defender for Cloud connects to container registries to scan container images for vulnerabilities. In some cases, Defender for Containers also publishes vulnerability assessment results back to the registry.

### Azure Container Registry (ACR)

**Network**
- For private ACRs, network access is automatically granted through Azure infrastructure.

**Permissions**
- Role: **Defender Container Registries**
- Permissions:
  - `Microsoft.ContainerRegistry/registries/pull/read`
  - `Microsoft.ContainerRegistry/registries/metadata/read`
  - `Microsoft.ContainerRegistry/registries/read`
  - `Microsoft.ContainerRegistry/registries/repositories/content/read`
  - `Microsoft.ContainerRegistry/registries/repositories/metadata/read`
  - `Microsoft.ContainerRegistry/registries/catalog/read`

### Amazon Elastic Container Registry (ECR)

**Network**
- ECR endpoints are always publicly accessible.

**Permissions**
- Role: **CspmMonitorAws** (part of the existing CSPM role)
  - `ecr:GetRegistryPolicy`
  - `ecr:DescribeImages`
  - `ecr:DescribeRepositories`
  - `ecr:GetRepositoryPolicy`

- Role: **MDCContainersImageAssessmentRole**
  - `ecr:PutImage`
  - `ecr:BatchDeleteImage`
  - `ecr-public:PutImage`
  - `ecr-public:BatchDeleteImage`

> [!NOTE]
> The `MDCContainersImageAssessmentRole` permissions are used only to publish vulnerability assessment results back to the registry for gated deployment. Microsoft Defender for Cloud doesn't modify customer container images.

### Google Artifact Registry (GAR)

**Network**
- GAR endpoints are always publicly accessible.

**Permissions**
- Role: **MDCCspmCustomRole** (part of the existing CSPM role)
  - `artifactregistry.repositories.list`
  - `artifactregistry.repositories.getIamPolicy`
  - `artifactregistry.dockerimages.list`

- Role: **MDCWritingGarAssessmentsRole**
  - `artifactregistry.repositories.uploadArtifacts`
  - `artifactregistry.repositories.deleteArtifacts`

> [!NOTE]
> The `MDCWritingGarAssessmentsRole` permissions are used only to publish vulnerability assessment results back to the registry for gated deployment. Microsoft Defender for Cloud doesn't modify customer container images.

### JFrog Artifactory (SaaS)

**Network**
- The JFrog Artifactory instance must be publicly accessible over the internet.

**Permissions and configuration**
- A dedicated group, such as `mdc-group-{customerTenantId}`
- A permission target with read access to all repositories for the MDC group
- An OpenID Connect (OIDC) provider integrated with Microsoft Entra ID
- OIDC identity mappings that allow authentication by using Entra-issued tokens

**API scopes used**
- Group access: `/access/api/v1/scim/v2/Groups`
- Permission targets: `/access/api/v2/permissions` (READ on ANY LOCAL, REMOTE, DISTRIBUTION)
- OIDC provider and identity mappings:
  - `/access/api/v1/oidc`
  - `/access/api/v1/oidc/{oidcName}/identity_mappings`

### Docker Hub (SaaS)

**Network**
- Docker Hub must be publicly accessible over the internet.

**Permissions**
- Customer-provided access token with read access

## Microsoft Defender for Cloud to Kubernetes clusters

Microsoft Defender for Cloud connects to Kubernetes API endpoints to discover clusters and collect configuration data for posture and risk analysis.

### Azure Kubernetes Service (AKS)

**Network**
- No additional public or restricted public endpoint configuration is required. Microsoft Defender for Containers accesses the Kubernetes API through Azure Trusted Access.

**Permissions**
- Managed identity created in the customer environment
- Built-in role: **Kubernetes Agentless Operator**
  - `Microsoft.ContainerService/managedClusters/read`
  - `Microsoft.ContainerService/managedClusters/trustedAccessRoleBindings/write`
  - `Microsoft.ContainerService/managedClusters/trustedAccessRoleBindings/read`
  - `Microsoft.ContainerService/managedClusters/trustedAccessRoleBindings/delete`

> [!NOTE]
> For AKS, Defender for Cloud uses AKS Trusted Access. Defender for Cloud creates a managed identity and a trusted access role binding. After the cluster is discovered, Defender for Cloud creates a Kubernetes `ClusterRoleBinding` to the built-in AKS ClusterRole `aks:trustedaccessrole:defender-containers:microsoft-defender-operator`, which grants read permissions inside the cluster.

### Amazon Elastic Kubernetes Service (EKS)

**Network**
- Kubernetes API server must allow access from:
  - `172.212.245.192/28`
  - `48.209.1.192/28`
- For private API endpoints, a restricted public endpoint must be enabled with the IP ranges above.

For private EKS clusters, the Kubernetes API server must expose a restricted public endpoint that allows access from the approved Microsoft Defender for Containers IP ranges.

**Permissions**
- Role: **MDCContainersAgentlessDiscoveryK8sRole**
  - `eks:UpdateClusterConfig`
  - `eks:DescribeCluster`
  - `eks:CreateAccessEntry`
  - `eks:ListAccessEntries`
  - `eks:AssociateAccessPolicy`
  - `eks:ListAssociatedAccessPolicies`

> [!NOTE]
> `eks:UpdateClusterConfig` is used to apply required cluster configuration for supported scenarios, such as enabling a restricted public API endpoint for private clusters.

### Google Kubernetes Engine (GKE)

**Network**
- Kubernetes API server must allow access from:
  - `172.212.245.192/28`
  - `48.209.1.192/28`
- For private API endpoints, a restricted public endpoint must be enabled with the IP ranges above.

For private GKE clusters, the Kubernetes API server must expose a restricted public endpoint that allows access from the approved Microsoft Defender for Containers IP ranges.

**Permissions**
- Role: **MDCGkeClusterWriteRole**
  - `container.clusters.update`
  - `container.viewer`

- Role: **MDCGkeContainerResponseActionsRole**
  - `container.pods.update`
  - `container.pods.delete`
  - `container.networkPolicies.create`
  - `container.networkPolicies.update`
  - `container.networkPolicies.delete`

- Role: **MDCGkeContainerInventoryCollectionRole**
  - `container.nodes.proxy`
  - `container.secrets.list`

## Kubernetes clusters to Microsoft Defender for Cloud

Kubernetes clusters send runtime security data to Microsoft Defender for Cloud.

**Outbound network requirements**
- Protocol: HTTPS
- Port: 443
- Domains:
  - `*.ods.opinsights.azure.com`
  - `*.oms.opinsights.azure.com`
  - `login.microsoftonline.com`
  - `*.cloud.defender.microsoft.com`

### Kubernetes permissions created by the Defender sensor

The Defender sensor creates Kubernetes roles with the following permissions:

| API group | Resources | Verbs |
|---------|-----------|-------|
| core (`""`) | pods, nodes, services, events, configmaps | get, list, watch, patch |
| apps | daemonsets, replicasets, statefulsets, deployments | get, list, watch |
| batch | jobs, cronjobs | get, list, watch |
| networking.k8s.io | ingresses | get, list, watch |
| apiextensions.k8s.io | customresourcedefinitions | get, list, watch, create, update, delete |
| defender.microsoft.com | * | get, list, watch, create, update, delete |

## Cloud infrastructure to Microsoft Defender for Cloud (Kubernetes audit logs)

Defender for Containers requires Kubernetes audit logs for control plane threat detection.

### Azure Kubernetes Service (AKS)

- Audit logs are collected agentlessly through Azure infrastructure.
- No additional network or permission requirements apply, including for private AKS clusters.

### Amazon Elastic Kubernetes Service (EKS)

- Audit logs are collected through AWS CloudWatch.
- Defender for Cloud creates the following resources in the customer account:
  - Amazon SQS queue
  - Amazon Kinesis Data Firehose delivery stream
  - Amazon S3 bucket

**Required roles**
- `MDCContainersK8sCloudWatchToKinesisRole`
- `MDCContainersK8sKinesisToS3Role`

### Google Kubernetes Engine (GKE)

- Audit logs are collected at the project level through GCP Cloud Logging.
- Defender for Cloud creates Pub/Sub resources in the customer project to forward logs.

## Related content

- Learn more about [Microsoft Defender for Containers](defender-for-containers-introduction.md)

- Review the [Defender for Containers architecture](defender-for-containers-architecture.md)

- [Enable Microsoft Defender for Containers](defender-for-containers-enable-plan.md)