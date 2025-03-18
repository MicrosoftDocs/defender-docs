---
title: Permissions required by Defender for Containers for EKS and GKE support.
description: This article lists the permissions required to use Defender for Containers extensions for EKS and GKE.
ms.topic: limits-and-quotas
ms.date: 03/06/2025
---

# Permissions to install Defender for Containers components in AWS and GCP

This article lists the roles and permissions required to install Defender for Containers components in the AWS Elastic Kubernetes Service (EKS) and GCP Google Kubernetes Engine (GKE) environments.

## Required permissions

| Defender for Container feature                                                 | Component                                                    | Required Role                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [GKE runtime protection](support-matrix-defender-for-containers.md?tabs=gcprt#runtime-protection-features)<br/><br/> [GKE workload hardening](support-matrix-defender-for-containers.md?gcpspm#security-posture-management-features)<br/><br/> [Runtime vulnerability assessment (optional)](support-matrix-defender-for-containers.md?tabs=gcpva#vulnerability-assessment-va-features) | GKE Arc provisioning (for Defender agent and Azure policy agent) | Azure Arc role: [**Defender Kubernetes Agent Operator**](#azure-arc-provisioning-role-for-eks-and-gke)<br/><br/> GCP predefined role: [**Kubernetes Engine Admin**](https://cloud.google.com/iam/docs/understanding-roles#container.admin) <br/>OR<br/>[**Kubernetes Engine Viewer**](https://cloud.google.com/iam/docs/understanding-roles#container.viewer) (if only Agentless threat protection and/or Kubernetes API access extension are enabled) |
| [EKS runtime protection](support-matrix-defender-for-containers.md?tabs=awsrt#runtime-protection-features)<br/><br/> [GKE workload hardening](support-matrix-defender-for-containers.md?awsspm#security-posture-management-features)<br/><br/> [Runtime vulnerability assessment (optional)](support-matrix-defender-for-containers.md?tabs=awsva#vulnerability-assessment-va-features) | AWS Arc provisioning (for Defender agent and Azure policy agent) | Azure Arc role: [**Defender Kubernetes Agent Operator**](#azure-arc-provisioning-role-for-eks-and-gke)<br/><br/> AWS role: [**AzureDefenderKubernetesRole**](#aws-agentless-threat-protection-permissions) |
| [GKE control plane hardening - Agentless threat protection](support-matrix-defender-for-containers.md?tabs=gcpspm#security-posture-management-features) | GKE AuditLogs provisioning                               | See [GCP Agentless threat protection permissions](#gcp-agentless-threat-protection-permissions) |
| [EKS control plane hardening - Agentless threat protection](support-matrix-defender-for-containers.md?tabs=awsspm#security-posture-management-features) | AWS AuditLogs provisioning                               | See [AWS Agentless threat protection permissions](#aws-agentless-threat-protection-permissions)    |

### Azure Arc provisioning role for EKS and GKE

The Azure Arc built-in role **Defender Kubernetes Agent Operator** to provision the Defender agent and Azure policy agent has the following permissions:

- Microsoft.Authorization/*/read
- Microsoft.Insights/alertRules/*
- Microsoft.Resources/deployments/*
- Microsoft.Resources/subscriptions/resourceGroups/read
- Microsoft.Resources/subscriptions/resourceGroups/write
- Microsoft.Resources/subscriptions/operationresults/read
- Microsoft.Resources/subscriptions/read
- Microsoft.KubernetesConfiguration/extensions/write
- Microsoft.KubernetesConfiguration/extensions/read
- Microsoft.KubernetesConfiguration/extensions/delete
- Microsoft.KubernetesConfiguration/extensions/operations/read
- Microsoft.Kubernetes/connectedClusters/Write
- Microsoft.Kubernetes/connectedClusters/read
- Microsoft.OperationalInsights/workspaces/write
- Microsoft.OperationalInsights/workspaces/read
- Microsoft.OperationalInsights/workspaces/listKeys/action
- Microsoft.OperationalInsights/workspaces/sharedkeys/action
- Microsoft.Kubernetes/register/action
- Microsoft.KubernetesConfiguration/register/action

## AWS Agentless threat protection permissions

- AzureDefenderKubernetesRole:
  - sts:AssumeRole
  - sts:AssumeRoleWithWebIdentity
  - logs:PutSubscriptionFilter
  - logs:DescribeSubscriptionFilters
  - logs:DescribeLogGroups
  - logs:PutRetentionPolicy
  - firehose:*
  - iam:PassRole
  - eks:UpdateClusterConfig
  - eks:DescribeCluster
  - eks:CreateAccessEntry
  - eks:ListAccessEntries
  - eks:AssociateAccessPolicy
  - eks:ListAssociatedAccessPolicies
  - sqs:*
  - s3:*

- AzureDefenderKubernetesScubaReaderRole:
  - sts:AssumeRole
  - sts:AssumeRoleWithWebIdentity
  - sqs:ReceiveMessage
  - sqs:DeleteMessage
  - s3:GetObject
  - s3:GetBucketLocation

- AzureDefenderCloudWatchToKinesisRole:
  - sts:AssumeRole
  - firehose:*

- AzureDefenderKinesisToS3Role:
  - sts:AssumeRole
  - s3:AbortMultipartUpload
  - s3:GetBucketLocation
  - s3:GetObject
  - s3:ListBucket
  - s3:ListBucketMultipartUploads
  - s3:PutObject

- MDCContainersAgentlessDiscoveryK8sRole
  - sts:AssumeRoleWithWebIdentity
  - eks:UpdateClusterConfig
  - eks:DescribeCluster
  - eks:CreateAccessEntry
  - eks:ListAccessEntries
  - eks:AssociateAccessPolicy
  - eks:ListAssociatedAccessPolicies

- MDCContainersImageAssessmentRole
  - sts:AssumeRoleWithWebIdentity
  - The permissions of these assumed roles: [AmazonEC2ContainerRegistryPowerUser](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol#security-iam-awsmanpol-AmazonEC2ContainerRegistryPowerUser) & [AmazonElasticContainerRegistryPublicPowerUser](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonElasticContainerRegistryPublicPowerUser)

## GCP Agentless threat protection permissions

- MicrosoftDefenderContainersDataCollectionRole
  - pubsub.subscriptions.consume
  - pubsub.subscriptions.get
  
- MicrosoftDefenderContainersRole
  - logging.sinks.list
  - logging.sinks.get
  - logging.sinks.create
  - logging.sinks.update
  - logging.sinks.delete
  - resourcemanager.projects.getIamPolicy
  - resourcemanager.organizations.getIamPolicy
  - iam.serviceAccounts.get
  - iam.workloadIdentityPoolProviders.get (all the logs that go to Pub/Sub)

- MDCCustomRole
  - resourcemanager.folders.get
  - resourcemanager.folders.list
  - resourcemanager.projects.get
  - resourcemanager.projects.list
  - serviceusage.services.enable
  - iam.roles.create
  - iam.roles.list
  - compute.projects.get
  - compute.projects.setCommonInstanceMetadata
  
- MDCCspmCustomRole
  - resourcemanager.folders.getIamPolicy
  - resourcemanager.folders.list
  - resourcemanager.organizations.get
  - resourcemanager.organizations.getIamPolicy
  - storage.buckets.getIamPolicy

## Permissions granted in cloud environments

Onboarding AWS and GCP cloud environments to Defender for Cloud through the Azure portal creates a connector to your desired cloud environment, and generates a script for you to run in the cloud environment to create the required roles and permissions. The script is created based on the settings you choose when going through the onboarding process.

As part of the onboarding process, you choose between two permission types: **Default Access** and **Least Privileged Access**:

- **Default Access** supports all current and future extensions of the selected Defender plans.

- **Least Privileged Access** option only grants the permissions necessary to support the current extensions.

The following tables show the permissions granted to certain Defender for Containers roles, depending on the permission type you choose.

### AWS default access

| Role Name                          | Associated Polices / Permissions                             | Capabilities                                                 |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| MDCContainersImageAssessmentRole       | AmazonEC2ContainerRegistryPowerUser [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryPowerUser)<br /><br />AmazonElasticContainerRegistryPublicPowerUser  [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/public/public-security-iam-awsmanpol.html#public-security-iam-awsmanpol-AmazonElasticContainerRegistryPublicPowerUser) | Agentless container vulnerability assessment.                |
| MDCContainersAgentlessDiscoveryK8sRole | eks:DescribeCluster<br/>eks:UpdateClusterConfig<br/>eks:CreateAccessEntry<br/>eks:ListAccessEntries<br/>eks:AssociateAccessPolicy<br/>eks:ListAssociatedAccessPolicies           | Agentless discovery of Kubernetes.<br />Updating EKS clusters to support IP restriction |
|                                    |                                                              |                                                              |
|                                    |                                                              |                                                              |

### AWS least privileged access

| **Role Name**                      | **Associated Polices / Permissions**                         | **Capabilities**                                             |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| MDCContainersImageAssessmentRole       | AmazonEC2ContainerRegistryReadOnly  [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryReadOnly) <br />AmazonElasticContainerRegistryPublicReadOnly [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/public/public-security-iam-awsmanpol.html#public-security-iam-awsmanpol-AmazonElasticContainerRegistryPublicReadOnly) | Agentless container vulnerability assessment.                |
| MDCContainersAgentlessDiscoveryK8sRole | eks:DescribeCluster<br />eks:UpdateClusterConfig             | Agentless discovery of Kubernetes. <br />Updating EKS clusters to support IP restriction |

### GCP default access

| Service Account Name           | Associated Roles /  Permissions                              | Capabilities                                                 |
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| mdc-containers-artifact-assess | Roles/storage.objectUser  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#storage.objectUser)<br /><br />Roles/artifactregistry.writer  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.writer) | Agentless container vulnerability assessment.               |
| mdc-containers-k8s-operator    | Roles/container.viewer [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#container.viewer)<br />Custom role MDCGkeClusterWriteRole [Custom Role] with permission container.clusters.update | Agentless discovery of Kubernetes<br />Updating GKE clusters to  support IP restriction |

### GCP least privileged access

| **Service Account Name**       | **Associated Roles / Permissions**                           | **Current Capabilities**                                     |
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| mdc-containers-artifact-assess | Roles/artifactregistry.reader  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.reader) <br> Roles/storage.objectViewer [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#storage.objectViewer) | Agentless container vulnerability assessment.                |
| mdc-containers-k8s-operator    | Roles/container.viewer  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#container.viewer)<br /><br/>Custom role MDCGkeClusterWriteRole with permission container.clusters.update | Agentless discovery of Kubernetes.<br />Updating GKE clusters to support IP restriction |

## Next steps

- [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)