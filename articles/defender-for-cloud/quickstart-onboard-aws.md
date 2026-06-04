---
title: Connect your AWS account
description: Defend your AWS resources with Microsoft Defender for Cloud, a guide to set up and configure Defender for Cloud to protect your workloads in AWS.
author: ElazarK
ms.author: elkrieger
ms.topic: install-set-up-deploy
ms.date: 04/19/2026
---

# Connect AWS accounts to Microsoft Defender for Cloud

This article shows you how to connect a single Amazon Web Services (AWS) account or AWS management account to Microsoft Defender for Cloud by using the native AWS connector.

After you connect the account, Defender for Cloud discovers AWS resources, assesses security posture, and surfaces security recommendations and alerts.

The following screenshot shows AWS accounts displayed in the [Defender for Cloud overview dashboard](cloud-infrastructure-dashboard.md?pivots=defender-portal):

:::image type="content" source="./media/quickstart-onboard-aws/aws-account-in-overview.png" alt-text="Screenshot showing AWS accounts listed in the Defender for Cloud overview dashboard." lightbox="./media/quickstart-onboard-aws/aws-account-in-overview.png":::

For more information, watch the [New AWS connector in Defender for Cloud](episode-one.md) video from the *Defender for Cloud in the Field* video series.

> [!NOTE]
> If you have an AWS account that is connected to Microsoft Sentinel, you can't connect it to Defender for Cloud. To ensure the connector works correctly, follow the instructions on [Connect a Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md).

## Authentication architecture

When you connect an AWS account, Microsoft Defender for Cloud authenticates to AWS using federated trust and short-lived credentials, without storing long-lived secrets.

Learn more about [how authentication is established between Microsoft Entra ID and AWS](concept-authentication-architecture-aws.md), including the IAM roles and trust relationships created during onboarding.

## Prerequisites

Before you connect your AWS account, make sure you have:

- A Microsoft Azure subscription. If you don't have one, [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- [Microsoft Defender for Cloud enabled](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Access to an AWS account.

- Contributor level permission for the relevant Azure subscription.

- To enable CIEM as part of Defender CSPM, you need the required [Security Admin role and Application.ReadWrite.All permission](enable-permissions-management.md#before-you-start) for the tenant.

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
- AWS SSM Agent installed with the [AmazonSSMManagedInstanceCore](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonSSMManagedInstanceCore.html) policy. If the SSM Agent isn't preinstalled, follow the [AWS installation instructions](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-win.html).
- The following extensions enabled on your Arc-connected machines:
    - Microsoft Defender for Endpoint  
    - A vulnerability assessment solution (TVM or Qualys)  
    - [Defender for SQL extension](defender-for-sql-usage.md)

Learn more about [monitoring components](monitoring-components.md).

### [Defender for open-source databases](#tab/Defender-for-open-source-databases)

- An active Azure subscription with [Defender for Cloud enabled](get-started.md#enable-defender-for-cloud-on-your-azure-subscription).  
- A connected account in Azure or AWS.  

Region availability: All public AWS regions except Tel Aviv, Milan, Jakarta, Spain, and Bahrain.

### [Defender for Servers](#tab/Defender-for-Servers)

- [Microsoft Defender for Servers enabled](connect-azure-subscription.md) on your subscription.  
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

> [!IMPORTANT]
> For management account onboarding, use only the AWS management account. Delegated administrator accounts aren't supported.

To connect your AWS environment to Defender for Cloud by using a native connector:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-environment-settings.png" alt-text="Screenshot that shows connecting an AWS account to an Azure subscription." lightbox="media/quickstart-onboard-aws/add-aws-account-environment-settings.png":::

1. Enter a **Name** for your connector.

1. For **Onboard**, select the account type:

    - **Management account**: Creates a connector for the AWS management account. Auto provisioning creates connectors for discovered member accounts and newly created accounts under the management account.
    - **Single account**: Creates a connector for a single AWS account.

1. Select the **AWS regions** that contain resources you want Defender for Cloud to protect. All regions are selected by default.

1. Select the **Subscription** in which the security connector will be created.

1. Select the **Resource group** in which the security connector will be created.

1. Select the **Location** where the security connector will be created.

1. Select an interval to scan the AWS environment every 4, 6, 12, or 24 hours. Some data collectors run with fixed scan intervals and aren't affected by custom interval configurations.

1. Enter your **AWS account ID**.

1. **Management account only:** If needed, enter AWS account IDs to exclude, separated by commas.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-details.png" alt-text="Screenshot that shows the tab for entering account details for an AWS account." lightbox="media/quickstart-onboard-aws/add-aws-account-details.png":::

1. Select **Next: Select plans**.

1. Choose the Defender plans you want to enable. 

   > [!NOTE]
   > Each plan might incur charges. Learn more about [Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud).

   :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-plans-selection.png" alt-text="Screenshot showing the plan selection step for an AWS account." lightbox="media/quickstart-onboard-aws/add-aws-account-plans-selection.png":::

   > [!IMPORTANT]
   > To present the current status of your recommendations, the Microsoft Defender Cloud Security Posture Management plan queries the AWS resource APIs several times a day. These read-only API calls incur no charges, but they're registered in CloudTrail if you enable a trail for read events.
   >
   > AWS documentation explains that there are no extra charges for keeping one trail. If you're exporting the data out of AWS, for example to an external SIEM system, this increased volume of calls might also increase ingestion costs. In such cases, we recommend filtering out the read-only calls from the Defender for Cloud user or ARN role: `arn:aws:iam::[accountId]:role/CspmMonitorAws`. This is the default role name. Confirm the role name configured on your account.

1. (Optional) Configure the different plan configurations.

    ### [Defender CSPM](#tab/Defender-for-CSPM)

    Defender CSPM has two plan option, Foundational CSPM which is included with you Defender for Cloud subscription and enabled by default, and Defender CSPM which is the paid plan for CSPM. To enable or disable specific features of the plan, select **Settings** > toggle the feature(s) to **On** and select **Save**.

    :::image type="content" source="media/quickstart-onboard-aws/posture-plan-features.png" alt-text="Screenshot of the available features of the Defender CSPM plan." lightbox="media/quickstart-onboard-aws/posture-plan-features-zoom.png":::

    Learn more about the [Defender CSPM's plan availability and features](concept-cloud-security-posture-management.md#plan-availability).

    ### [Defender for Servers](#tab/Defender-for-Servers)

    Defender for Servers reduces security risk and exposure for your machines. It protects Windows and Linux machines across AWS, Azure, GCP, and on-premises environments, and provides recommendations, posture insights, and threat protection.

    :::image type="content" source="media/quickstart-onboard-aws/enable-servers-plan.png" alt-text="Screenshot of the Defender for Servers plan settings in Microsoft Defender for Cloud." lightbox="media/quickstart-onboard-aws/enable-servers-plan.png":::

    Learn more about [Defender for Servers](defender-for-servers-overview.md).

    ### [Defender for databases](#tab/Defender-for-databases)

    Defender for databases helps you protect SQL Server workloads on EC2 instances and RDS Custom for SQL Server, and open-source relational databases hosted on AWS RDS. It adds threat protection and security insights for supported database engines in your AWS environment.

    :::image type="content" source="media/quickstart-onboard-aws/databases-settings.png" alt-text="Screenshot of the Defender for databases settings for an AWS environment." lightbox="media/quickstart-onboard-aws/databases-settings.png":::

    Learn more about [enabling Defender for databases on AWS](enable-defender-for-databases-aws.md).

    ### [Defender for Containers](#tab/Defender-for-Containers)

    Defender for Containers is a cloud-native solution that secures your containerized assets, including Kubernetes clusters, nodes, workloads, registries, and images, across multicloud and on-premises environments.

    :::image type="content" source="media/quickstart-onboard-aws/containers-features.png" alt-text="Screenshot of the Defender for Containers plan selection for an AWS environment." lightbox="media/quickstart-onboard-aws/containers-features-zoom.png":::

    Learn more about [Microsoft Defender for Containers](defender-for-containers-introduction.md).

---

1. Select **Configure access**.

1. Select the permissions type:

    - **Default access**: Grants permissions required for current and future capabilities.
    - **Least privilege access**: Grants only the permissions required today. You might receive notifications if additional access is needed later.

1. Select a deployment method:

    - **AWS CloudFormation**
    - **Terraform**

   :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-configure-access.png" alt-text="Screenshot showing deployment method configuration." lightbox="media/quickstart-onboard-aws/add-aws-account-configure-access.png":::

1. Follow the on-screen instructions for the selected deployment method to complete the required dependencies in AWS.

   > [!NOTE]
   > If you select **Management account**, the tab for onboarding by using Terraform isn't visible in the UI. Terraform onboarding is still supported. For guidance, see [Onboarding your AWS/GCP environment to Microsoft Defender for Cloud with Terraform](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/onboarding-your-aws-gcp-environment-to-microsoft-defender-for/ba-p/3798664).

   If you deploy by using CloudFormation, choose one of the following template options:

   - **Amazon S3 URL**: Upload the downloaded CloudFormation template to your own S3 bucket with your own security configurations. Provide the S3 URL in the AWS deployment wizard.
   - **Upload a template file**: AWS automatically creates an S3 bucket to store the template. This configuration might trigger the `S3 buckets should require requests to use Secure Socket Layer` recommendation. You can fix it by applying the following bucket policy:

     ```json
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

   > [!IMPORTANT]
   > When you run the CloudFormation StackSet for an AWS management account, you might encounter the following error message:
   >
   > `You must enable organizations access to operate a service managed stack set`
   >
   > This error means that trusted access for AWS Organizations isn't enabled.
   >
   > To fix this error, go to the CloudFormation StackSets page and select the prompt to enable trusted access. After trusted access is enabled, run the CloudFormation template again.

1. Select **Next: Review and generate**.

1. Select **Create**.

Defender for Cloud starts scanning your AWS resources. Security recommendations appear within a few hours. After onboarding, you can monitor AWS posture, alerts, and resource inventory in Defender for Cloud.

## Update the CloudFormation template

Update the CloudFormation template deployed in your AWS account when the permissions or resources required by Defender for Cloud change.

### When to update the template

Update the template in the following cases:

- You enabled a new Defender plan, such as Defender CSPM, Defender for Databases, or Defender for Containers.
- You modified plan configuration, such as enabling auto provisioning or changing the selected regions.
- Microsoft released a new version of the template, such as a version that supports new features, fixes bugs, or updates the runtime.
- You experience deployment errors, such as `AccessDenied`, `EntityAlreadyExists`, or Lambda runtime errors. For specific errors or CloudFormation template deployment errors, see the [CloudFormation error resolution table](troubleshoot-connectors.md#cloudformation-error-resolution-table).

### Update the template

1. In Defender for Cloud, generate or download the latest CloudFormation template for the AWS connector.

1. In AWS CloudFormation, update the existing stack that was created for the Defender for Cloud connector.

1. Replace the existing template with the updated template file or with the Amazon S3 URL for the updated template.

1. Keep the existing stack details and parameters unless Defender for Cloud provides updated values.

1. Review the changes, acknowledge IAM resource changes if prompted, and update the stack.

Learn how to [update stacks directly](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-direct.html) in AWS CloudFormation.

## Validate connector health

To confirm that your AWS connector is operating correctly:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Locate the AWS account and review the **Connectivity status** column to see whether the connection is healthy or has issues.

1. Select the value shown in the **Connectivity status** column to view more details.

The Environment details page lists any detected configuration or permission issues affecting the connection to the AWS account.

:::image type="content" source="media/quickstart-onboard-aws/environment-details-connector-health.png" alt-text="Screenshot of the environment details page in Microsoft Defender for Cloud showing the connectivity status for a connected Amazon Web Services account." lightbox="media/quickstart-onboard-aws/environment-details-connector-health.png":::

If an issue is present, you can select it to view a description of the problem and the recommended remediation steps. In some cases, a remediation script is provided to help resolve the issue.

Learn more about [troubleshooting multicloud connectors](troubleshoot-connectors.md).

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that provide insights into your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) helps you understand your current coverage by showing which plans are enabled on your subscriptions and resources.

## Enable AWS CloudTrail log ingestion (Preview)

AWS CloudTrail management event ingestion can enhance identity and configuration insights by adding context for CIEM assessments, activity-based risk indicators, and configuration change detection.

Learn more about [integrating AWS CloudTrail logs with Microsoft Defender for Cloud (Preview)](integrate-cloud-trail.md).

## Learn more

Check out the following blogs:

- [Ignite 2021: Microsoft Defender for Cloud news](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/ignite-2021-microsoft-defender-for-cloud-news/ba-p/2882807)
- [Security posture management and server protection for AWS and GCP](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/security-posture-management-and-server-protection-for-aws-and/ba-p/3271388)

## Next steps

- [Assign access to workload owners](assign-access-to-workload.md).
- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- Set up your [on-premises machines](quickstart-onboard-machines.md) and [GCP projects](quickstart-onboard-gcp.md).
- Get answers to [common questions](faq-general.yml) about onboarding your AWS account.
- [Troubleshoot your multicloud connectors](troubleshoot-connectors.md).