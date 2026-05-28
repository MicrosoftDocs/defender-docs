---
title: Verify protection for open-source relational databases on AWS
description: Learn how to verify that Microsoft Defender for Cloud is configured to protect open-source relational databases on Amazon RDS and Aurora.
author: ElazarK
ms.author: elkrieger
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 05/27/2026
---

# Verify protection for open-source relational databases on AWS

This article shows you how to verify that Microsoft Defender for Cloud is configured to protect open-source relational databases on Amazon RDS and Amazon Aurora.

Use this article to check plan enablement, connector health, regional configuration, discovery status, and resource-level protection status for supported PostgreSQL, MySQL, MariaDB, Aurora PostgreSQL, and Aurora MySQL resources.

## Verify plan enablement

1. In the Azure portal, go to **Microsoft Defender for Cloud**.

1. Go to **Environment settings**.

1. Select the AWS connector.

1. Verify that the **Databases** plan is set to **On**.

1. Under the Databases plan, verify that **Open-source relational databases** is enabled.

If the plan or component is turned off, turn it on and save the connector configuration.

## Verify connector health

1. In Defender for Cloud, go to **Environment settings**.

1. Select the AWS connector.

1. Review the connector status.

The expected status is **Connected**.

If the connector status is **Not connected** or **Partially connected**, redeploy the AWS CloudFormation template from the connector page to refresh the IAM roles that grant Defender for Cloud access to your AWS environment. After redeployment, wait up to 30 minutes and check the connector status again.

## Verify AWS region configuration

Defender for Cloud protects supported Amazon RDS and Aurora resources only in AWS regions that are configured for the AWS connector.

1. In Defender for Cloud, go to **Environment settings**.

1. Select the AWS connector.

1. Go to the access configuration for the connector.

1. Verify that every AWS region that contains supported RDS or Aurora resources is selected.

1. In AWS, verify that AWS Security Token Service (STS) is active in each selected region.

CloudFormation IAM roles are global, but AWS STS must be active in each region where Defender for Cloud needs to access protected resources.

Learn more about [activating and deactivating AWS STS in a region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html#sts-regions-activate-deactivate).

## Allow time for discovery

After the Databases plan is enabled and the AWS connector is healthy, Defender for Cloud discovers supported RDS and Aurora resources.

- New RDS and Aurora resources can take up to six hours to appear in Defender for Cloud.
- Discovery scans run every 12 hours after the initial discovery.

If a supported resource doesn't appear after one full discovery cycle, verify that the resource is in a configured AWS region and that the connector is healthy.

## Verify resource support

Defender for Cloud protection applies only to supported database engines and configurations.

### Supported database engines

| Engine | Supported |
|---|---|
| PostgreSQL | Yes |
| MySQL | Yes |
| MariaDB | Yes |
| Aurora PostgreSQL | Yes, cluster-level monitoring |
| Aurora MySQL | Yes, cluster-level monitoring |
| Oracle | No |
| SQL Server | No |

### Supported configurations

| Configuration | Supported | Notes |
|---|---|---|
| Single-AZ | Yes | Standard deployment. |
| Multi-AZ failover | Yes | The primary instance is monitored. |
| Multi-AZ readable standbys | No | Not supported. |
| Read replicas | Partial | Read replicas are monitored as independent instances. |
| Stopped instances | No | Stopped instances are skipped until they're started. |

If the database engine, region, or configuration isn't supported, Defender for Cloud protection doesn't apply to that resource.

## Verify recommendations

Defender for Cloud surfaces protection status through security recommendations.

1. In Defender for Cloud, go to **Recommendations**.

1. Search for **The status of open-source relational databases on AWS RDS should be protected**.

1. Open the recommendation.

1. Review the affected resources and their status.

If the recommendation doesn't appear, verify that:

- The Databases plan is enabled for the Azure subscription associated with the AWS connector. The plan must be enabled at the subscription level, not only in the connector configuration.
- The AWS connector is healthy.
- The resource is supported.
- Enough time passed for discovery and recommendation refresh.

After configuration changes, allow up to one hour for the recommendation status to refresh.

## Review resource-level protection status

The recommendation **The status of open-source relational databases on AWS RDS should be protected** lists resources that aren't fully protected. Each unhealthy resource includes a reason that explains what needs to be fixed.

Use the following tables to review the reason and required action.

### Open-source relational database protection errors

| Unhealthy reason | Description | Recommended action |
|---|---|---|
| **Defender for open-source relational databases isn't authorized** | Defender for open-source relational databases isn't authorized because the onboarding configuration is incomplete. This can happen if the role's web identity configuration is missing the required service identity, the OpenID Connect (OIDC) provider is missing, or an explicit deny or missing permission is blocking the required action. | Rerun the AWS CloudFormation template for the connector and follow the [AWS onboarding troubleshooting guide](quickstart-onboard-aws.md?tabs=Defender-for-SQL) to complete onboarding. |
| **Defender for open-source relational databases isn't authorized because a service control policy has an explicit deny** | Defender for open-source relational databases isn't authorized because an AWS service control policy (SCP) has an explicit deny. | Review the SCP applied to the AWS account. For steps, see [Review service control policies](#review-service-control-policies). |
| **STS isn't turned on in this region** | Defender for open-source relational databases is failing because AWS Security Token Service (STS) isn't turned on in this region. | Turn on AWS STS in the affected region. For steps, see [Turn on AWS STS in a region](#turn-on-aws-sts-in-a-region). |
| **This region isn't supported for Defender for open-source relational databases** | Defender for open-source relational databases isn't currently deployed in the region where this resource is located. | Review the [list of supported regions](quickstart-onboard-aws.md?tabs=Defender-for-open-source-databases-Preview). If the region is listed as supported and the issue persists, contact Microsoft support. |
| **Amazon RDS instance or cluster is stopped and can't be protected** | Defender for open-source relational databases can't provide protection when your Amazon RDS instance or cluster is stopped. Start the database to restore threat protection. | Start the affected RDS instance or Aurora cluster. For steps, see [Start a stopped RDS instance or Aurora cluster](#start-a-stopped-rds-instance-or-aurora-cluster). |
| **RDS instance or cluster is pending restart after parameter group configuration** | The RDS instance or RDS cluster has a pending restart after a parameter group change. Defender can't complete protection setup until the restart is applied. | Restart the affected RDS instance or Aurora cluster. For steps, see [Restart an RDS instance or Aurora cluster](#restart-an-rds-instance-or-aurora-cluster). |
| **Defender failed to create a parameter group** | The parameter group quota limit was reached in this region. | Review parameter groups in the affected region. For steps, see [Review parameter groups](#review-parameter-groups). |
| **Defender failed to create an option group** | The option group quota limit was reached in this region. | Review option groups in the affected region. For steps, see [Review option groups](#review-option-groups). |
| **Defender encountered an internal error** | Defender for open-source relational databases encountered an internal service error while processing this operation. This error wasn't caused by your current configuration. | Contact Microsoft support if this issue persists. |

### Sensitive data discovery errors

Sensitive data discovery for Amazon RDS is also available through Defender CSPM.

| Unhealthy reason | Description | Recommended action |
|---|---|---|
| **RDS Data Sensitivity Scan isn't authorized** | The onboarding configuration is incomplete or misconfigured. This can happen if the role's web identity configuration is missing the required service identity, an identity-based policy has an explicit deny, the OpenID Connect (OIDC) provider is missing or misconfigured, required permissions are missing, or a permissions boundary prevents the service from performing the required actions. | Rerun the AWS CloudFormation template for the connector and follow the [AWS onboarding troubleshooting guide](quickstart-onboard-aws.md?tabs=Defender-for-SQL) to complete onboarding. |
| **RDS Data Sensitivity Scan isn't authorized because a service control policy has an explicit deny** | RDS Data Sensitivity Scan isn't authorized because an AWS service control policy (SCP) has an explicit deny. | Review the SCP applied to the AWS account. For steps, see [Review service control policies](#review-service-control-policies). |
| **STS isn't turned on in this region** | RDS Data Sensitivity Scan is failing because AWS Security Token Service (STS) isn't turned on in the selected region. | Turn on AWS STS in the affected region. For steps, see [Turn on AWS STS in a region](#turn-on-aws-sts-in-a-region). |
| **This region isn't supported for RDS Data Sensitivity Scan** | RDS Data Sensitivity Scan isn't currently deployed in the region where this resource is located. | Review the [list of supported regions](quickstart-onboard-aws.md?tabs=Defender-for-open-source-databases-Preview). If the region is listed as supported and the issue persists, contact Microsoft support. |

After you resolve a resource-level issue, allow up to one hour for the recommendation status to refresh.

## Resolve common resource-level issues

Use the following steps to resolve common resource-level issues that appear in recommendations.

### Review service control policies

Review the service control policy (SCP) applied to the AWS account.

1. Sign in to the AWS Management Console.

1. Go to **AWS Organizations**.

1. In the navigation pane, select **Accounts** or **Organizational Units (OUs)**.

1. Select the relevant account.

1. Open the **Policies** tab.

1. Identify the SCPs attached to the account or parent OU.

1. Review explicit deny statements that might block required actions, such as STS, IAM, or RDS.

1. Update the SCP to remove or adjust deny rules so Defender for Cloud can perform the required actions.

Learn more about [AWS service control policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html).

### Turn on AWS STS in a region

Turn on AWS STS in the required region by using the IAM console.

1. Sign in to the AWS Management Console.

1. Go to **IAM**.

1. In the navigation pane, select **Account settings**.

1. Locate **Security Token Service (STS) regions**.

1. Find the relevant region and verify its status.

1. If STS is turned off, select the region and turn it on.

1. Retry Defender onboarding or scan.

Learn more about [activating and deactivating AWS STS in a region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html#sts-regions-activate-deactivate).

### Start a stopped RDS instance or Aurora cluster

Start the affected RDS instance or Aurora cluster.

1. Go to **AWS Management Console** > **RDS** > **Databases**.

1. Select the affected RDS instance or cluster.

1. Select **Instance State** > **Start database**.

   For Aurora clusters, select **Start cluster**.

1. Wait for the RDS instance or Aurora cluster to reach **Available** status.

1. Verify that threat protection resumed.

### Restart an RDS instance or Aurora cluster

If the RDS instance or Aurora cluster has a pending restart after a parameter group change, restart the resource to apply the pending configuration.

1. Go to **AWS Management Console** > **RDS** > **Databases**.

1. Select the affected RDS instance or cluster.

1. Restart the resource.

1. Wait for the RDS instance or Aurora cluster to reach **Available** status.

1. Verify that protection resumed.

### Review parameter groups

Review parameter groups in the affected region.

1. In the AWS console, review the parameter groups defined in the affected region.

1. Remove any parameter groups that aren't assigned to an RDS instance.

1. If unassigned parameter groups with the `defenderfordatabases` prefix remain after cleanup, contact Microsoft support.

### Review option groups

Review option groups in the affected region.

1. In the AWS console, review the option groups defined in the affected region.

1. Remove any option groups that aren't assigned to an RDS instance.

1. If unassigned option groups with the `defenderfordatabases` prefix remain after cleanup, contact Microsoft support.

## Common verification results

### The plan is enabled, but the resource shows as not applicable or has no data

Verify that the resource uses a supported engine, configuration, and region. Then verify that the AWS connector is healthy and that one full discovery cycle completed.

### Some AWS regions are protected, but others aren't

Verify that all required AWS regions are selected in the connector configuration. Then verify that AWS STS is active in each affected region.

If you recently added regions to the connector, redeploy the AWS CloudFormation template and allow time for discovery.

### The resource is discovered, but the recommendation doesn't appear

Verify that the Databases plan is enabled for the Azure subscription associated with the AWS connector. The plan must be enabled at the subscription level, not only in the connector configuration.

Then allow up to one hour for the recommendation status to refresh.