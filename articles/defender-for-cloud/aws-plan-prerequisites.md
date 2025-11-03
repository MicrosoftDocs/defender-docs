---
title: Prerequisites for Defender for Cloud plans on AWS
description: Review requirements and dependencies for enabling Microsoft Defender for Cloud plans on your AWS accounts.
ms.author: elkrieger
author: Elazark
ms.topic: reference
ms.date: 30/10/2025
---

# Prerequisites for Defender for Cloud plans on AWS

This article lists the prerequisites, configuration requirements, and deployment considerations you should review before enabling Microsoft Defender for Cloud plans on your AWS accounts.

Microsoft Defender for Cloud provides cloud security posture management (CSPM) and threat protection across multicloud environments. The Defender CSPM plan establishes the core connector and trust relationship between Azure and AWS. Additional Defender plans build on this connection and require CSPM to be enabled.

## Defender Cloud Security Posture Management (CSPM)

The Defender CSPM plan creates the onboarding connection and provides agentless security posture assessment across AWS resources.

Requirements:
- A Microsoft Azure subscription with Defender for Cloud enabled.
- AWS account access with permission to deploy the connector.
- Subscription Owner permissions to enable CSPM.
- IAM permissions in AWS to assume the connector monitoring role.

Optional capabilities:
- Cloud Infrastructure Entitlement Management (CIEM), which requires the onboarding identity to have either the **Application Administrator** or **Cloud Application Administrator** Entra ID role.

Learn more: [Enable Defender CSPM](tutorial-enable-cspm-plan.md)

## Defender for Servers

Requires the Defender CSPM plan to be enabled and Microsoft Defender for Servers enabled on your subscription.

The Defender for Servers plan extends threat protection to AWS EC2 instances.

Requirements:
- An active AWS account with EC2 instances.
- AWS Systems Manager (SSM) Agent installed on EC2 instances.
- IAM managed policy: `AmazonSSMManagedInstanceCore`.

To use Defender for Cloud to automatically provision the Azure Arc agent:
- The enabling user needs **Owner** permissions on the relevant Azure subscription.
- AWS Systems Manager must be able to communicate over required network paths.

Removing or blocking the SSM Agent prevents Defender for Cloud from automatically provisioning the Azure Arc agent.

Learn more:
- [Enable enhanced security features](enable-enhanced-security.md)
- [Azure Arc overview](https://learn.microsoft.com/azure/azure-arc/servers/overview)

## Defender for Containers (Amazon EKS)

Requires the Defender CSPM plan to be enabled and Microsoft Defender for Containers enabled on your subscription.

The Defender for Containers plan protects Amazon Elastic Kubernetes Service (EKS) control plane activity and container workloads.

Requirements:
- At least one EKS cluster in the AWS account.
- Permission to access the Kubernetes API server.
- Resource capacity to create:
  - Amazon SQS queue
  - Amazon Kinesis Data Firehose delivery stream
  - Amazon S3 bucket in the cluster's region

Defender for Cloud recommendations install additional components, including:
- Azure Arc-enabled Kubernetes
- The Defender sensor extension
- Azure Policy for Kubernetes

You might incur usage charges for AWS-native services such as Amazon SQS, Amazon Kinesis Data Firehose, and Amazon S3. Review AWS pricing documentation for details.

Learn more:
- [Enable Defender for Containers on Amazon EKS](defender-for-containers-enable.md)

## Defender for SQL (AWS EC2 and Amazon RDS Custom)

Requires the Defender CSPM plan and Microsoft Defender for Servers plan to be enabled, as the Azure Arc agent relies on the Defender for Servers autoprovisioning pipeline. You must also enable the Microsoft Defender for SQL plan on your subscription.

The Defender for SQL plan provides visibility and vulnerability assessment for SQL Servers running on AWS.

Requirements:
- An active AWS account with either:
  - SQL Server running on EC2, or
  - Amazon RDS Custom for SQL Server.
- Azure Arc agent installed on EC2 instances or RDS Custom hosts.
- A vulnerability assessment solution (Microsoft Defender Vulnerability Management or Qualys).
- Microsoft Defender for Endpoint integration for behavioral signals.

Learn more:
- [Enable Defender for SQL](tutorial-enable-databases-plan.md)
- [Usage guidance](defender-for-sql-usage.md)

## Defender for open-source relational databases (Preview)

Requires the Defender CSPM plan to be enabled and the Microsoft Defender for open-source relational databases plan enabled on your subscription.

The Defender for open-source relational databases plan provides security insights for managed workloads such as PostgreSQL and MySQL running in Amazon RDS.

Region availability: All public AWS regions except:
- Tel Aviv
- Milan
- Jakarta
- Spain
- Bahrain

Learn more:
- [Supported platforms and availability](supported-machines-endpoint-solutions-clouds-containers.md)

## Role-based access control (RBAC) considerations

Specific permissions may be required to:
- enable plan autoprovisioning
- dismiss alerts
- apply recommendations

Depending on your scenario, you may need:
- Subscription Owner
- Security Admin
- Application Administrator (for CIEM)
- Cloud Application Administrator (for CIEM)

For roles and definitions, see:
https://learn.microsoft.com/azure/role-based-access-control/built-in-roles

## Network requirements

Some plan components require outbound access to:
- Azure Arc service endpoints
- Container registry endpoints
- AWS Systems Manager endpoints

For detailed guidance, see:
- [Azure Arc network requirements](https://learn.microsoft.com/azure/azure-arc/servers/network-requirements)

## AWS resource dependencies

Depending on enabled plans, Defender for Cloud uses AWS services such as:
- Amazon SQS
- Amazon Kinesis Data Firehose
- Amazon S3

You may incur usage charges based on AWS resource usage and configuration.

Review AWS pricing documentation for details.

## Next steps

- [Connect your AWS account to Microsoft Defender for Cloud](quickstart-onboard-aws.md)
- [Monitor connected AWS resources](monitor-connected-aws-resources.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)