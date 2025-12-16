---
title: Connect your AWS account
description: Defend your AWS resources with Microsoft Defender for Cloud, a guide to set up and configure Defender for Cloud to protect your workloads in AWS.
author: ElazarK
ms.author: elkrieger
ms.topic: install-set-up-deploy
ms.date: 11/03/2025
---

# Connect AWS accounts to Microsoft Defender for Cloud

Microsoft Defender for Cloud helps protect workloads running in Amazon Web Services (AWS). To assess your AWS resources and surface security recommendations, you must connect your AWS account to Defender for Cloud. The connector collects configuration and security signals from AWS services, allowing Defender for Cloud to analyze posture, generate recommendations, and surface alerts.

You can learn more by watching the [New AWS connector in Defender for Cloud](episode-one.md) video from the *Defender for Cloud in the Field* video series.

:::image type="content" source="./media/quickstart-onboard-aws/aws-account-in-overview.png" alt-text="Screenshot showing AWS accounts listed in the Defender for Cloud overview dashboard." lightbox="./media/quickstart-onboard-aws/aws-account-in-overview.png":::

> [!IMPORTANT]
> If your AWS account is already connected to Microsoft Sentinel, connecting it to Defender for Cloud may require additional configuration to avoid deployment or ingestion issues. Follow the guidance in [Connect a Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md).

## Prerequisites

Before you connect your AWS account, make sure you have:

- A Microsoft Azure subscription. If you don't have one, [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud enabled](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on that subscription.

- Access to an AWS account.

- Permission to create resources in Azure (Contributor or above).

Additional requirements apply when enabling specific Defender plans. Review the [native connector plan requirements](#native-connector-plan-requirements).

> [!NOTE]
> The AWS connector isn't available on the national government clouds (Azure Government, Microsoft Azure operated by 21Vianet).

## Native connector plan requirements

Each Defender plan has specific setup requirements.

### [Defender for Containers](#tab/Defender-for-Containers)

- At least one Amazon EKS cluster with access to the Kubernetes API server. If you don't have one, [create a new EKS cluster](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html).  
- Capacity to create an Amazon SQS queue, Kinesis Data Firehose delivery stream, and Amazon S3 bucket in the same region as the cluster.

### [Defender for SQL](#tab/Defender-for-SQL)

- [Microsoft Defender for SQL enabled](tutorial-enable-databases-plan.md) on your subscription.  
- An active AWS account with EC2 instances or RDS Custom for SQL Server.  
- Azure Arc for servers installed on your EC2 instances or RDS Custom for SQL Server. Autoprovisioning is recommended. To enable it, you must have the **Owner** role on the Azure subscription.  
- AWS SSM Agent installed with the [AmazonSSMManagedInstanceCore](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonSSMManagedInstanceCore.html) policy. If the SSM Agent isn’t preinstalled, follow the [AWS installation instructions](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-win.html).
- The following extensions enabled on your Arc-connected machines:
    - Microsoft Defender for Endpoint  
    - A vulnerability assessment solution (TVM or Qualys)  
    - [Defender for SQL extension](defender-for-sql-usage.md)

Learn more about [monitoring components](monitoring-components.md).

### [Defender for open-source databases (Preview)](#tab/Defender-for-open-source-databases-Preview)

- An active Azure subscription with [Defender for Cloud enabled](get-started.md#enable-defender-for-cloud-on-your-azure-subscription).  
- A connected account in Azure or AWS.  

Region availability: All public AWS regions except Tel Aviv, Milan, Jakarta, Spain, and Bahrain.

### [Defender for Servers](#tab/Defender-for-Servers)

- [Microsoft Defender for Servers enabled](enable-enhanced-security.md) on your subscription.  
- An active AWS account with EC2 instances.  
- Azure Arc for servers installed on your EC2 instances. Autoprovisioning is recommended and requires the **Owner** role on the Azure subscription.  
  Ensure that you fulfilled the [network requirements for Azure Arc](/azure/azure-arc/servers/network-requirements?tabs=azure-cloud).
- AWS SSM Agent installed with the [AmazonSSMManagedInstanceCore](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonSSMManagedInstanceCore.html) policy. If it isn’t preinstalled, install it for [Windows](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-win.html) or [Linux](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-linux.html).

> [!NOTE]
> If the SSM Agent is missing or removed, Arc autoprovisioning can’t proceed.  
> The onboarding CloudFormation template also creates a 30-day automation scan that verifies each EC2 instance has the required IAM profile.

- The following extensions enabled on your Arc-connected machines:
    - Microsoft Defender for Endpoint  
    - A vulnerability assessment solution (TVM or Qualys)

> [!NOTE]
> The Log Analytics agent retired in [August 2024](https://azure.microsoft.com/updates/were-retiring-the-log-analytics-agent-in-azure-monitor-on-31-august-2024/). Features that depend on it are transitioning to [Defender for Endpoint integration](integration-defender-for-endpoint.md) or [agentless scanning](concept-agentless-data-collection.md).  
> Learn more about [upcoming changes](upcoming-changes.md#defender-for-cloud-plan-and-strategy-for-the-log-analytics-agent-deprecation).

Defender for Servers assigns resource tags (`AccountId`, `Cloud`, `InstanceId`, `MDFCSecurityConnector`) to manage the autoprovisioning process.

> [!NOTE]
> The respective Azure Arc servers for EC2 instances or GCP virtual machines that no longer exist (and the respective Azure Arc servers with a status of Disconnected or Expired) are removed after seven days. This cleanup ensures that only active Arc-enabled servers continue to appear in Defender for Cloud.

### [Defender CSPM](#tab/Defender-for-CSPM)

- Subscription **Owner** permissions.  
- AWS IAM permissions to assume the monitoring role.  
- To enable Cloud Infrastructure Entitlement Management (CIEM), the user must have the **Application Administrator** or **Cloud Application Administrator** role in Microsoft Entra ID.  

Learn more about [enabling Defender CSPM](tutorial-enable-cspm-plan.md).

---

## Connect your AWS account

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-environment-settings.png" alt-text="Screenshot that shows connecting an AWS account to an Azure subscription." lightbox="media/quickstart-onboard-aws/add-aws-account-environment-settings.png":::

1. Enter the AWS account details, including the Azure region where the connector resource will be created.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-details.png" alt-text="Screenshot that shows the tab for entering account details for an AWS account." lightbox="media/quickstart-onboard-aws/add-aws-account-details.png":::

    Use the **AWS regions** dropdown to select the regions Defender for Cloud monitors. Regions you deselect won’t receive API calls from Defender for Cloud.

1. Select a scan interval (4, 6, 12, or 24 hours). 

   This selection defines the standard interval for most posture checks. Some data collectors with fixed intervals run more frequently, regardless of this setting:

   | Scan interval | Data collectors |
   |--|--|
   | 1 hour | EC2Instance, ECRImage, ECRRepository, RDSDBInstance, S3Bucket, S3BucketTags, S3Region, EKSCluster, EKSClusterName, EKSNodegroup, EKSNodegroupName, AutoScalingAutoScalingGroup |
   | 12 hours | EcsClusterArn, EcsService, EcsServiceArn, EcsTaskDefinition, EcsTaskDefinitionArn, EcsTaskDefinitionTags, AwsPolicyVersion, LocalPolicyVersion, AwsEntitiesForPolicy, LocalEntitiesForPolicy, BucketEncryption, BucketPolicy, S3PublicAccessBlockConfiguration, BucketVersioning, S3LifecycleConfiguration, BucketPolicyStatus, S3ReplicationConfiguration, S3AccessControlList, S3BucketLoggingConfig, PublicAccessBlockConfiguration |

1. Select **Next: Select plans**, and choose the Defender plans you want to enable.

Review the default plan selections, as some plans may be enabled automatically depending on your configuration. For example, the Databases plan extends Defender for SQL coverage to AWS EC2, RDS Custom for SQL Server, and open-source relational databases on RDS.

   :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-plans-selection.png" alt-text="Screenshot showing the plan selection step for an AWS account." lightbox="media/quickstart-onboard-aws/add-aws-account-plans-selection.png":::

   Each plan may incur charges. Learn more about [Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud).

   > [!IMPORTANT]
   > To present up-to-date recommendations, Defender CSPM queries AWS resource APIs several times a day. These read-only API calls incur no AWS charges. However, CloudTrail may record them if you enable read-event logging. Exporting this data to external SIEM systems may increase ingestion costs. If required, filter read-only calls from:
   >
   > `arn:aws:iam::<accountId>:role/CspmMonitorAws`

1. Select **Configure access**, and choose:

    - **Default access**: Grants permissions required for current and future capabilities.
    - **Least privilege access**: Grants only the permissions required today. You may receive notifications if additional access is needed later.

1. Select a deployment method: 

    - **AWS CloudFormation**
    - **Terraform**.

   :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-configure-access.png" alt-text="Screenshot showing deployment method configuration." lightbox="media/quickstart-onboard-aws/add-aws-account-configure-access.png":::

   > [!NOTE]
   > When onboarding a **management account**, Defender for Cloud uses AWS StackSets and automatically creates connectors for child accounts. Autoprovisioning is enabled for newly discovered accounts.

    > [!NOTE]
    > If you select **Management account** to create a connector to a management account, the tab for onboarding with Terraform isn’t visible in the UI. Terraform onboarding is still supported. For guidance, see [Onboarding your AWS/GCP environment to Microsoft Defender for Cloud with Terraform](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/onboarding-your-aws-gcp-environment-to-microsoft-defender-for/ba-p/3798664).

1. Follow the on-screen instructions to deploy the CloudFormation template. If you select Terraform, follow the equivalent deployment instructions provided in the portal.

1. Select **Next: Review and generate**.

1. Select **Create**.

Defender for Cloud begins scanning your AWS resources. Security recommendations appear within a few hours. You can monitor AWS posture, alerts, and resource inventory in Defender for Cloud after onboarding. Learn more about [monitoring connected AWS resources](monitor-connected-aws-resources.md).

## Deploy a CloudFormation template to your AWS account

As part of onboarding, deploy the generated CloudFormation template:

- As a **Stack** (single account)
- As a **StackSet** (management account)

:::image type="content" source="media/quickstart-onboard-aws/cloudformation-template.png" alt-text="Screenshot showing the CloudFormation template deployment wizard." lightbox="media/quickstart-onboard-aws/cloudformation-template.png":::

### Template deployment options

- **Amazon S3 URL**: Upload the downloaded CloudFormation template to your own S3 bucket with your own security configurations. Provide the S3 URL in the AWS deployment wizard.

- **Upload a template file**: AWS automatically creates an S3 bucket to store the template. This configuration may trigger the `S3 buckets should require requests to use Secure Socket Layer` recommendation. You can remediate it by applying the following bucket policy:

```bash
{
  "Id": "ExamplePolicy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowSSLRequestsOnly",
      "Action": "s3:*",
      "Effect": "Deny",
      "Resource": [
        "<S3_Bucket_ARN>",
        "<S3_Bucket_ARN>/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    }
  ]
}
```

> [!NOTE]
> When running the CloudFormation StackSets when onboarding an AWS management account, you might encounter the following error message:
> `You must enable organizations access to operate a service managed stack set`
>
> This error indicates that you haven't enabled [the trusted access for AWS Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html).
>
> To remediate this error message, your CloudFormation StackSets page has a prompt with a button that you can select to enable trusted access. After trusted access is enabled, the CloudFormation Stack must be run again.

## Enable AWS CloudTrail log ingestion (Preview)

AWS CloudTrail management event ingestion can enhance identity and configuration insights by adding context for CIEM assessments, activity-based risk indicators, and configuration change detection.

Learn more about [integrating AWS CloudTrail logs with Microsoft Defender for Cloud (Preview)](integrate-cloudtrail-defender-for-cloud.md).

## Learn more

Check out the following blogs:

- [Ignite 2021: Microsoft Defender for Cloud news](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/ignite-2021-microsoft-defender-for-cloud-news/ba-p/2882807)
- [Security posture management and server protection for AWS and GCP](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/security-posture-management-and-server-protection-for-aws-and/ba-p/3271388)

## Next steps

- [Assign access to workload owners](assign-access-to-workload.md).
- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- [Monitor connected AWS resources](monitor-connected-aws-resources.md)
- Set up your [on-premises machines](quickstart-onboard-machines.md) and [GCP projects](quickstart-onboard-gcp.md).
- Get answers to [common questions](faq-general.yml) about onboarding your AWS account.
- [Troubleshoot your multicloud connectors](troubleshoot-connectors.md).


