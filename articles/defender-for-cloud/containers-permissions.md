---
title: Permissions in Defender for Containers
description: This article lists the permissions required to use Defender for Containers.
ms.topic: limits-and-quotas
ms.date: 01/01/2024
---

# Permissions in Defender for Containers

This article lists the permissions required to use Defender for Containers.

## Required permissions

| Capabilities                                                 | Component                                                    | Required Permissions                                         | Allocated Resources                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Runtime threat protection, Runtime vulnerability assessment (optional), Kubernetes data plane hardening | GKE Arc Auto provisioning (for Defender agent and Azure policy agent) | Kubernetes Engine Admin <br/><br />Kubernetes Engine Viewer - if only Agentless threat protection and/or Kubernetes API access extension are enabled | K8s Arc Workspace                                            |
| Runtime threat protection, Runtime vulnerability assessment (optional), Kubernetes data plane hardening | AWS Arc Auto provisioning (for Defender agent and Azure policy agent) | Azure - Azure Lighthouse request subscription <br/>Contributor permissions <br /><br />AWS - TBD-P1 | Kubernetes Arc Workspace                                     |
| Agentless threat protection (control plane)                  | GKE AuditLogs autoprovisioning                               | Custom roles  <br />Containers Data Collection Role <br />Microsoft Defender Containers Custom Role<br />Microsoft organization custom role for onboarding <br />Microsoft Defender for Cloud CSPM custom role  <br /><br />Built-in roles: <br />roles/pubsub.publisher <br />role=roles/iam.workloadIdentityUser \ - links between identity provider to our role <br />--role="roles/container.viewer" <br />roles/pubsub.admin <br />roles/viewer | PubSub, Logging subscriptions, Logging Sinks, sink (Pub/Sub), topic (Pub/Sub) |
| Agentless threat protection (control plane)                  | AWS AuditLogs autoprovisioning                               | See [AWS Agentless threat protection permissions](#aws-agentless-threat-protection-permissions)    | S3, SQS, Kinesis Data Firehose, CloudWatch Log groups Routing |

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

## GCP Agentless threat protection permissions

- Containers Data Collection role
  - pubsub.subscriptions.consume
  - pubsub.subscriptions.get
  
- Microsoft Defender Containers Custom role
  - logging.sinks.list
  - logging.sinks.get
  - logging.sinks.create
  - logging.sinks.update
  - logging.sinks.delete
  - resourcemanager.projects.getIamPolicy
  - resourcemanager.organizations.getIamPolicy
  - iam.serviceAccounts.get
  - iam.workloadIdentityPoolProviders.get (all the logs that go to Pub/Sub)

- Microsoft organization custom role for onboarding
  - resourcemanager.folders.get
  - resourcemanager.folders.list
  - resourcemanager.projects.get
  - resourcemanager.projects.list
  - serviceusage.services.enable
  - iam.roles.create
  - iam.roles.list
  
- Microsoft Defender for Cloud CSPM custom role
  - resourcemanager.folders.getIamPolicy
  - resourcemanager.folders.list
  - resourcemanager.organizations.get
  - resourcemanager.organizations.getIamPolicy

## Permissions granted in cloud environments

Onboarding AWS and GCP cloud environments to Defender for Cloud adds a connector to your desired cloud environment, and grants the required permissions in your cloud environment.

You can choose between two approaches to grant the required permissions: **Default Access** and **Least Privileged Access**.

**Default Access** supports all current and planned future capabilities of the selected Defender plans, while in the **Least Privileged Access** option, only the permissions required to support the current capabilities are granted.
The following tables show the permissions granted within your cloud environment when you run the script created during the onboarding process.

### AWS Default Access

| Role Name                          | Associated Polices / Permissions                             | Capabilities                                                 |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| MDCContainersImageAssessmentRole       | AmazonEC2ContainerRegistryPowerUser [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryPowerUser)<br /><br />AmazonElasticContainerRegistryPublicPowerUser  [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/public/public-security-iam-awsmanpol.html#public-security-iam-awsmanpol-AmazonElasticContainerRegistryPublicPowerUser) | Agentless container vulnerability assessment.                |
| MDCContainersAgentlessDiscoveryK8sRole | eks:DescribeCluster<br/>eks:UpdateClusterConfig<br/>eks:CreateAccessEntry<br/>eks:ListAccessEntries<br/>eks:AssociateAccessPolicy<br/>eks:ListAssociatedAccessPolicies           | Agentless discovery of Kubernetes.<br />Updating EKS clusters to support IP restriction |
|                                    |                                                              |                                                              |
|                                    |                                                              |                                                              |

### AWS Least Privileged Access

| **Role Name**                      | **Associated Polices / Permissions**                         | **Capabilities**                                             |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| MDCContainersImageAssessmentRole       | AmazonEC2ContainerRegistryReadOnly  [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryReadOnly) <br />AmazonElasticContainerRegistryPublicReadOnly [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/public/public-security-iam-awsmanpol.html#public-security-iam-awsmanpol-AmazonElasticContainerRegistryPublicReadOnly) | Agentless container vulnerability assessment.                |
| MDCContainersAgentlessDiscoveryK8sRole | eks:DescribeCluster<br />eks:UpdateClusterConfig             | Agentless discovery of Kubernetes. <br />Updating EKS clusters to support IP restriction |

### GCP Default Access

| Service Account Name           | Associated Roles /  Permissions                              | Capabilities                                                 |
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| mdc-containers-artifact-assess | Roles/storage.objectUser  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#storage.objectUser)<br /><br />Roles/artifactregistry.writer  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.writer) | Agentless container vulnerability assessment..               |
| mdc-containers-k8s-operator    | Roles/container.viewer [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#container.viewer)<br />MDCGkeClusterWriteRole [Custom Role] <br />container.clusters.update | Agentless discovery of Kubernetes<br />Updating GKE clusters to  support IP restriction |

### GCP Least Privileged Access

| **Service Account Name**       | **Associated Roles / Permissions**                           | **Current Capabilities**                                     |
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| mdc-containers-artifact-assess | Roles/artifactregistry.reader  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#artifactregistry.reader) <br> Roles/storage.objectViewer [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#storage.objectViewer) | Agentless container vulnerability assessment.                |
| mdc-containers-k8s-operator    | Roles/container.viewer  [GCP permissions list](https://cloud.google.com/iam/docs/understanding-roles#container.viewer)<br />MDCGkeClusterWriteRole [Custom Role]<br /> container.clusters.update | Agentless discovery of Kubernetes.<br />Updating GKE clusters to support IP restriction |

## Next steps

- [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)