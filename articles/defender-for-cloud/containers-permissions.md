---
title: Permissions in Defender for Containers
description: This article lists the permissions required to use Defender for Containers.
ms.topic: limits-and-quotas
ms.date: 01/01/2024
---

# Permissions in Defender for Containers

This article lists the permissions required to use Defender for Containers.

## Required permissions

| Capabilities                                                 | Component                                                    | Required Permissions                                         | Related Quota                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Runtime threat protection, Runtime vulnerability assessment (optional), Kubernetes data plane hardening | GKE Arc Auto provisioning (for Defender agent and Azure policy agent) | Azure - Azure lighthouse request subscription Contributor permissions <br /><br /> GCP - Kubernetes Engine Admin <br />If the **Containers** plan isn't selected: Kubernetes Engine Viewer | K8s Arc Workspace                                            |
| Runtime threat protection, Runtime vulnerability assessment (optional), Kubernetes data plane hardening | AWS Arc Auto provisioning (for Defender agent and Azure policy agent) | Azure - Azure lighthouse request subscription Contributor permissions <br /><br />AWS - TBD-P1 | Kubernetes Arc Workspace                                     |
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
  - s3:*
  - application-autoscaling:DeleteScalingPolicy
  - application-autoscaling:DeregisterScalableTarget
  - application-autoscaling:DescribeScalableTargets
  - application-autoscaling:DescribeScalingActivities
  - application-autoscaling:DescribeScalingPolicies
  - application-autoscaling:PutScalingPolicy
  - application-autoscaling:RegisterScalableTarget
  - appmesh:DescribeVirtualGateway
  - appmesh:DescribeVirtualNode
  - appmesh:ListMeshes
  - appmesh:ListVirtualGateways
  - appmesh:ListVirtualNodes
  - autoscaling:CreateAutoScalingGroup
  - autoscaling:CreateLaunchConfiguration
  - autoscaling:DeleteAutoScalingGroup
  - autoscaling:DeleteLaunchConfiguration
  - autoscaling:Describe*
  - autoscaling:UpdateAutoScalingGroup
  - cloudformation:CreateStack
  - cloudformation:DeleteStack
  - cloudformation:DescribeStack*
  - cloudformation:UpdateStack
  - cloudwatch:DeleteAlarms
  - cloudwatch:DescribeAlarms
  - cloudwatch:GetMetricStatistics
  - cloudwatch:PutMetricAlarm
  - codedeploy:BatchGetApplicationRevisions
  - codedeploy:BatchGetApplications
  - codedeploy:BatchGetDeploymentGroups
  - codedeploy:BatchGetDeployments
  - codedeploy:ContinueDeployment
  - codedeploy:CreateApplication
  - codedeploy:CreateDeployment
  - codedeploy:CreateDeploymentGroup
  - codedeploy:GetApplication
  - codedeploy:GetApplicationRevision
  - codedeploy:GetDeployment
  - codedeploy:GetDeploymentConfig
  - codedeploy:GetDeploymentGroup
  - codedeploy:GetDeploymentTarget
  - codedeploy:ListApplicationRevisions
  - codedeploy:ListApplications
  - codedeploy:ListDeploymentConfigs
  - codedeploy:ListDeploymentGroups
  - codedeploy:ListDeployments
  - codedeploy:ListDeploymentTargets
  - codedeploy:RegisterApplicationRevision
  - codedeploy:StopDeployment
  - ec2:AssociateRouteTable
  - ec2:AttachInternetGateway
  - ec2:AuthorizeSecurityGroupIngress
  - ec2:CancelSpotFleetRequests
  - ec2:CreateInternetGateway
  - ec2:CreateLaunchTemplate
  - ec2:CreateRoute
  - ec2:CreateRouteTable
  - ec2:CreateSecurityGroup
  - ec2:CreateSubnet
  - ec2:CreateVpc
  - ec2:CreateTags
  - ec2:AttachVpnGateway
  - ec2:DeleteLaunchTemplate
  - ec2:DeleteSubnet
  - ec2:DeleteVpc
  - ec2:Describe*
  - ec2:DetachInternetGateway
  - ec2:DisassociateRouteTable
  - ec2:ModifySubnetAttribute
  - ec2:ModifyVpcAttribute
  - ec2:RequestSpotFleet
  - ec2:RunInstances
  - ecs:*
  - elasticfilesystem:DescribeAccessPoints
  - elasticfilesystem:DescribeFileSystems
  - elasticloadbalancing:CreateListener
  - elasticloadbalancing:CreateLoadBalancer
  - elasticloadbalancing:CreateRule
  - elasticloadbalancing:CreateTargetGroup
  - elasticloadbalancing:DeleteListener
  - elasticloadbalancing:DeleteLoadBalancer
  - elasticloadbalancing:DeleteRule
  - elasticloadbalancing:DeleteTargetGroup
  - elasticloadbalancing:DescribeListeners
  - elasticloadbalancing:DescribeLoadBalancers
  - elasticloadbalancing:DescribeRules
  - elasticloadbalancing:DescribeTargetGroups
  - events:DeleteRule
  - events:DescribeRule
  - events:ListRuleNamesByTarget
  - events:ListTargetsByRule
  - events:PutRule
  - events:PutTargets
  - events:RemoveTargets
  - fsx:DescribeFileSystems
  - iam:ListAttachedRolePolicies
  - iam:ListInstanceProfiles
  - iam:ListRoles
  - lambda:ListFunctions
  - logs:CreateLogGroup
  - logs:DescribeLogGroups
  - logs:FilterLogEvents
  - route53:CreateHostedZone
  - route53:DeleteHostedZone
  - route53:GetHealthCheck
  - route53:GetHostedZone
  - route53:ListHostedZonesByName
  - servicediscovery:CreatePrivateDnsNamespace
  - servicediscovery:CreateService
  - servicediscovery:DeleteService
  - servicediscovery:GetNamespace
  - servicediscovery:GetOperation
  - servicediscovery:GetService
  - servicediscovery:ListNamespaces
  - servicediscovery:ListServices
  - servicediscovery:UpdateService
  - sns:ListTopics
  - ssm:GetParameter
  - ssm:GetParameters
  - ssm:GetParametersByPath
  - ec2:DeleteInternetGateway
  - ec2:DeleteRoute
  - ec2:DeleteRouteTable
  - ec2:DeleteSecurityGroup
  - iam:CreateServiceLinkedRole

## GCP Agentless threat protection permissions

1. Create Containers Data Collection role
    - permissions=pubsub.subscriptions.consume
    - pubsub.subscriptions.get
1. Microsoft Defender Containers Custom role
    - `permissions=logging.sinks.list,logging.sinks.get,logging.sinks.create,logging.sinks.update,logging.sinks.delete,resourcemanager.projects.getIamPolicy,resourcemanager.organizations.getIamPolicy,iam.serviceAccounts.get,iam.workloadIdentityPoolProviders.get` (all the logs that go to Pub/Sub)
1. Microsoft organization custom role for onboarding
   - resourcemanager.folders.get,\
   - resourcemanager.folders.list,\
   - resourcemanager.projects.get,\
   - resourcemanager.projects.list,\
   - serviceusage.services.enable,\
   - iam.roles.create,\
   - iam.roles.list
1. Microsoft Defender for Cloud CSPM custom role
   - permissions=resourcemanager.folders.getIamPolicy,\
   - resourcemanager.folders.list,\
   - resourcemanager.organizations.get,\
   - resourcemanager.organizations.getIamPolicy

## Permissions granted in cloud environments

Onboarding AWS and GCP cloud environments to Defender for Cloud adds a connector to your desired cloud environment, and grants the required permissions in your cloud environment.

You can choose between two approaches to grant the required permissions: **Default Access** and **Least Privileged Access**.

**Default Access** supports all current and planned future capabilities of the selected Defender plans, while in the **Least Privileged Access** option, only the permissions required to support the current capabilities are granted.
The following tables show the permissions granted within your cloud environment when you run the script created during the onboarding process.

### AWS Default Access

| Role Name                          | Associated Polices / Permissions                             | Capabilities                                                 |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| mdcContainersImageAssessment       | AmazonEC2ContainerRegistryPowerUser [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryPowerUser)<br /><br />AmazonElasticContainerRegistryPublicPowerUser  [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/public/public-security-iam-awsmanpol.html#public-security-iam-awsmanpol-AmazonElasticContainerRegistryPublicPowerUser) | Agentless container vulnerability assessment.                |
| mdcContainersAgentlessDiscoveryK8s | eks:DescribeCluster<br />eks:UpdateClusterConfig *           | Agentless discovery of Kubernetes.<br />Updating EKS clusters to support IP restriction |
|                                    |                                                              |                                                              |
|                                    |                                                              |                                                              |

### AWS Least Privileged Access

| **Role Name**                      | **Associated Polices / Permissions**                         | **Capabilities**                                             |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| mdcContainersImageAssessment       | AmazonEC2ContainerRegistryReadOnly  [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AmazonEC2ContainerRegistryReadOnly) <br />AmazonElasticContainerRegistryPublicReadOnly [AWS permissions list](https://docs.aws.amazon.com/AmazonECR/latest/public/public-security-iam-awsmanpol.html#public-security-iam-awsmanpol-AmazonElasticContainerRegistryPublicReadOnly) | Agentless container vulnerability assessment.                |
| mdcContainersAgentlessDiscoveryK8s | eks:DescribeCluster<br />eks:UpdateClusterConfig             | Agentless discovery of Kubernetes. <br />Updating EKS clusters to support IP restriction |

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