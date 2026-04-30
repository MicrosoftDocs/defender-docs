---
title: Connect your AWS account
description: Defend your AWS resources with Microsoft Defender for Cloud, a guide to set up and configure Defender for Cloud to protect your workloads in AWS.
author: ElazarK
ms.author: elkrieger
ms.topic: install-set-up-deploy
ms.date: 04/19/2026
---

# Connect AWS accounts to Microsoft Defender for Cloud

Workloads often span multiple cloud platforms, so cloud security services must do the same. Microsoft Defender for Cloud helps protect workloads in Amazon Web Services (AWS), but you need to set up the connection between them and Defender for Cloud. 

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

- A Microsoft Azure subscription. If you don't have one, [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud enabled](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Access to an AWS account.

- Contributor level permission for the relevant Azure subscription.

- If CIEM is enabled as part of Defender for CSPM the user enabling the connector will also need [Security Admin role and Application.ReadWrite.All permission](enable-permissions-management#before-you-start) for your tenant. 

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

### [Defender for open-source databases (Preview)](#tab/Defender-for-open-source-databases-Preview)

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
> Use only the management account for onboarding. Delegated accounts aren't supported.

To connect your AWS to Defender for Cloud by using a native connector: 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Select **Add environment** > **Amazon Web Services**.

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-environment-settings.png" alt-text="Screenshot that shows connecting an AWS account to an Azure subscription." lightbox="media/quickstart-onboard-aws/add-aws-account-environment-settings.png":::

1. Enter a **Name** for your connector.

1. For the **Onboard** field:
    - Select **Management account** to create a connector to a management account. Auto provisioning mechanism will create connectors for each member account discovered under the specified management account and newly created accounts, enabling Defender for Cloud to operate. 
    - Select **Single account** to create a connector to a single account. 

1. Select the regions in which the customer has resources that should be protected by Defender for Cloud is rolled out .. All regions are selected by default.

1. Select the **Subscription** in which the security connector will be created.

1. Select the **resource group** in which the security connector will be created.

1. Select the **Location** where the security connector will be created. 

1. Select an Interval to scan the AWS environment every 4, 6, 12, or 24 hours. Some data collectors run with fixed scan intervals and aren't affected by custom interval configurations. 

1. Enter your AWS account ID 

1. **Management account only:** If needed, enter accounts ID to exclude, separated by commas (“,”).

    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-details.png" alt-text="Screenshot that shows the tab for entering account details for an AWS account." lightbox="media/quickstart-onboard-aws/add-aws-account-details.png":::

1. Select **Next: Select plans**.

1. Choose the Defender plans you want to enable. 

   > [!NOTE]
   > Each plan might incur charges. Learn more about [Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud).

   :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-plans-selection.png" alt-text="Screenshot showing the plan selection step for an AWS account." lightbox="media/quickstart-onboard-aws/add-aws-account-plans-selection.png":::

   > [!IMPORTANT]
   > To present the current status of your recommendations, the Microsoft Defender Cloud Security Posture Management plan queries the AWS resource APIs several times a day. These read-only API calls incur no charges, but they're registered in CloudTrail if you enable a trail for read events. 
   >
   > AWS's documentation explains that there are no extra charges for keeping one trail. If you're exporting the data out of AWS (for example, to an external SIEM system), this increased volume of calls might also increase ingestion costs. In such cases, we recommend filtering out the read-only calls from the Defender for Cloud user or ARN role: `arn:aws:iam::[accountId]:role/CspmMonitorAws` (This is the default role name. Confirm the role name configured on your account.) 

1. Select **Configure access**.

1. Select the permissions type:

    - **Default access**: Grants permissions required for current and future capabilities.
    - **Least privilege access**: Grants only the permissions required today. You might receive notifications if additional access is needed later.

1. Select a deployment method: 

    - **AWS CloudFormation**
    - **Terraform**.

   :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-configure-access.png" alt-text="Screenshot showing deployment method configuration." lightbox="media/quickstart-onboard-aws/add-aws-account-configure-access.png":::

   > [!NOTE]
   > When onboarding a **management account**, Defender for Cloud uses AWS StackSets and automatically creates connectors for child accounts. Autoprovisioning is enabled for newly discovered accounts.

    > [!NOTE]
    > If you select **Management account** to create a connector to a management account, the tab for onboarding by using Terraform isn't visible in the UI. Terraform onboarding is still supported. For guidance, see [Onboarding your AWS/GCP environment to Microsoft Defender for Cloud with Terraform](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/onboarding-your-aws-gcp-environment-to-microsoft-defender-for/ba-p/3798664).

1. Follow the on-screen instructions for the selected deployment method to complete the required dependencies on AWS. 
    1. For management account: 
        1. If you plan to onboard using Terraform please review: Onboarding your AWS/GCP environment to [Microsoft Defender for Cloud with Terraform - Microsoft Community Hub](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/onboarding-your-awsgcp-environment-to-microsoft-defender-for-cloud-with-terrafor/3798664). 
        1. If you prefer the AWS CloudFormation deployment method follow the on-screen instructions to complete the required dependencies on AWS. If you're onboarding a management account, Yyou need to run the CloudFormation template both as Stack and as StackSet. Connectors are created for the member accounts up to 24 hours after the onboarding. 
    1. For a regular account:
        1. 
1. Select **Next: Review and generate**.

1. Select **Create**.

Defender for Cloud starts scanning your AWS resources. Security recommendations appear within a few hours. After onboarding, you can monitor AWS posture, alerts, and resource inventory in Defender for Cloud.

## Deploy a CloudFormation template to your AWS account

As part of onboarding, deploy the generated CloudFormation template:

- As a **Stack** (single account)
- As a **StackSet** (management account)

:::image type="content" source="media/quickstart-onboard-aws/cloudformation-template.png" alt-text="Screenshot showing the CloudFormation template deployment wizard." lightbox="media/quickstart-onboard-aws/cloudformation-template.png":::

### Template deployment options

- **Amazon S3 URL**: Upload the downloaded CloudFormation template to your own S3 bucket with your own security configurations. Provide the S3 URL in the AWS deployment wizard.

- **Upload a template file**: AWS automatically creates an S3 bucket to store the template. This configuration might trigger the `S3 buckets should require requests to use Secure Socket Layer` recommendation. You can fix it by applying the following bucket policy:

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
> This error message indicates that you didn't enable [the trusted access for AWS Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html).
>
> To fix this error, the CloudFormation StackSets page has a prompt with a button that you can select to enable trusted access. After trusted access is enabled, run the CloudFormation Stack again.

### Do you need to update the CloudFormation template? (ask where this needs to go)

This table helps you determine whether you need to update the CloudFormation template deployed in your AWS account.

- if you  enabled a new Defender plan (for example, CSPM, Databases, Defender for Containers)? 
-if you are modifying plan configuration (for example, enabling autoprovisioning or changing region)? 
- if icrosoft released a new version of the template? (For example, support new features, fix bugs, or update runtime) 
-- if youre you experiencing deployment errors<sup>[1](#footnote1)</sup> (for example, Access Denied error, Entity already exist, Lambda runtime)? 

<sup><a name="footnote1"></a>1</sup> If you're receiving specific errors, or errors with the CloudFormation template deployment, refer to the [CloudFormation error resolution table](troubleshoot-connectors.md#cloudformation-error-resolution-table).

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