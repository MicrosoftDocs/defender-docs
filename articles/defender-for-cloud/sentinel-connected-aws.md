---
title: Connect a Microsoft Sentinel connected AWS account to Defender for Cloud
description: Troubleshoot AWS connector deployment issues in Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 12/10/2025
ms.topic: how-to
#customer intent: As a security professional, I want to ensure that my AWS connector is connected to Defender for Cloud correctly and is operating the way it should be.
author: Elazark
ms.author: elkrieger
---

# Connect a Microsoft Sentinel connected AWS account to Defender for Cloud

Microsoft Defender for Cloud generates a CloudFormation template that includes the resources required to onboard your Amazon Web Services (AWS) account. Microsoft Defender for Cloud and Microsoft Sentinel can both ingest AWS CloudTrail events. By default, the Microsoft Sentinel connector receives CloudTrail notifications directly from Amazon S3 through an Amazon SQS queue. Because an Amazon SQS queue supports only one consumer, enabling CloudTrail ingestion for Defender for Cloud requires configuring an Amazon SNS fan-out pattern so both services can receive CloudTrail events in parallel.

This article explains how to enable CloudTrail ingestion for Defender for Cloud when your AWS account is already connected to Microsoft Sentinel.

## Prerequisites

To complete the procedures in this article, you need:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- Access to an AWS account.

- Contributor level permission for the relevant Azure subscription.

- **SNS fan-out method only:** 
    - AWS CloudTrail configured to deliver logs to an Amazon S3 bucket.
    - An existing Microsoft Sentinel AWS connector that ingests CloudTrail logs from that bucket.


## Enable CloudTrail ingestion using SNS fan-out

If your AWS CloudTrail logs already stream to Microsoft Sentinel, you can enable CloudTrail ingestion for Defender for Cloud by using Amazon SNS as a fan-out mechanism. This configuration allows both services to receive CloudTrail events in parallel.

> [!IMPORTANT]
> These steps configure AWS resources for shared CloudTrail ingestion. To finalize Defender for Cloud setup, [integrate AWS CloudTrail logs with Microsoft Defender for Cloud](integrate-cloudtrail-defender-for-cloud.md).

### Create an Amazon SNS topic for CloudTrail

1. In the AWS Management Console, open **Amazon SNS**.

1. Select **Create topic** and choose **Standard**.

1. Enter a descriptive name (for example, `CloudTrail-SNS`) and select **Create topic**.

1. Copy the **Topic ARN** for later use.

1. On the topic details page, select **Edit**, and then expand **Access policy**.

1. Add a policy statement that allows the CloudTrail S3 bucket to publish events to the topic.

   Replace `<region>`, `<accountid>`, and `<S3_BUCKET_ARN>` with your values:

   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "AllowS3ToPublish",
         "Effect": "Allow",
         "Principal": {
           "Service": "s3.amazonaws.com"
         },
         "Action": "SNS:Publish",
         "Resource": "arn:aws:sns:<region>:<accountid>:CloudTrail-SNS",
         "Condition": {
           "StringEquals": {
             "aws:SourceArn": "<S3_BUCKET_ARN>"
           }
         }
       }
     ]
   }
   ```

### Create an SQS queue for Defender for Cloud

1. In **Amazon SQS**, select **Create queue** and choose **Standard**.

1. Enter a name (for example, `DefenderForCloud-SQS`) and create the queue.

1. Update the SQS queue access policy to allow the SNS topic ARN to perform the `SQS:SendMessage` action for this queue.

   Use the following policy statement as a reference when updating the SQS queue access policy.

   Apply this policy to each SQS queue that subscribes to the CloudTrail SNS topic. This typically includes:
   - The SQS queue used by Microsoft Sentinel
   - The SQS queue created for Defender for Cloud

   ```json
   {
     "Sid": "AllowCloudTrailSnsToSendMessage",
     "Effect": "Allow",
     "Principal": {
       "Service": "sns.amazonaws.com"
     },
     "Action": "SQS:SendMessage",
     "Resource": "arn:aws:sqs:<region>:<accountid>:<QUEUE_NAME>",
     "Condition": {
       "ArnLike": {
         "aws:SourceArn": "arn:aws:sns:<region>:<accountid>:CloudTrail-SNS"
       }
     }
   }
    ```

### Subscribe both SQS queues to the SNS topic

1. In **Amazon SNS**, open the topic you created.

1. Create subscriptions to the SNS topic for both:

   - Your existing **Microsoft Sentinel SQS queue**
   - The new **Defender for Cloud SQS queue**

1. When creating each subscription:

   - Select **Amazon SQS** as the protocol.
   - Paste the **Queue ARN**.
   - Enable **Raw message delivery**.

### Update the Microsoft Sentinel SQS queue access policy

If your AWS account was already connected to Microsoft Sentinel, you must also update the existing Sentinel SQS queue to allow the SNS topic to send messages.

1. In **Amazon SQS**, open the SQS queue used by Microsoft Sentinel.

1. Edit the **Access policy**.

1. Add the same `SQS:SendMessage` statement used for the Defender for Cloud queue, referencing the CloudTrail SNS topic ARN.

1. Save the policy.

If this step is skipped, Microsoft Sentinel will stop receiving CloudTrail notifications after you switch to the SNS fan-out configuration.

### Update S3 event notifications to publish CloudTrail logs to SNS

1. In **Amazon S3**, open your CloudTrail bucket and go to **Event notifications**.

1. Delete the existing S3 → SQS event notification used by Microsoft Sentinel.

1. Create a new event notification to publish to the SNS topic.

1. Set the event type to **Object created (PUT)**.

1. Configure a **prefix filter** so that only CloudTrail log files generate notifications.

   Use the full CloudTrail log path format:

   `AWSLogs/<AccountID>/CloudTrail/`

1. Save the configuration.

After these changes, both Microsoft Sentinel and Defender for Cloud receive CloudTrail event notifications using the SNS fan-out pattern.

## Resolve OIDC identity provider conflicts

1. Follow the steps in the [Connect AWS accounts to Microsoft Defender for Cloud](quickstart-onboard-aws.md) until step 8 in the [Connect your AWS Account](quickstart-onboard-aws.md#connect-your-aws-account) section.

1. Select **Copy**.

    :::image type="content" source="media/sentinel-connected-aws/copy-template.png" alt-text="Screenshot that shows where the copy button is located." lightbox="media/sentinel-connected-aws/copy-template.png":::

1. Paste the template into a local text editing tool.

1. Search for the **"ASCDefendersOIDCIdentityProvider": {** section of the template, and make a separate copy of the entire **ClientIdList**.

1. Search for the **ASCDefendersOIDCIdentityProvider** section in the template and delete it.

1. Save the file locally.

1. In a separate browser window, sign in to your AWS account.

1. Navigate to **Identity and Access Management (IAM)** > **Identity Providers**.

1. Search for and select **33e01921-4d64-4f8c-a055-5bdaffd5e33d**.

1. Select **Actions** > **Add audience**.

1. Paste the **ClientIdList** section you copied in step 4.
 
1. Navigate to the Configure access page in Defender for Cloud.

1. Follow the Create a Stack in AWS instructions, and use the template you saved locally.

    :::image type="content" source="media/sentinel-connected-aws/create-stack.png" alt-text="Screenshot that shows where the create stack instructions are located." lightbox="media/sentinel-connected-aws/create-stack.png":::

1. Select **Next**.

1. Select **Create**.

## Next steps

- [Integrate AWS CloudTrail logs with Microsoft Defender for Cloud](integrate-cloudtrail-defender-for-cloud.md).
- [Assign access to workload owners](assign-access-to-workload.md).
- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- Set up your [on-premises machines](quickstart-onboard-machines.md) and [Google Cloud Platform (GCP) environments](quickstart-onboard-gcp.md).
- Get answers to [common questions](faq-general.yml) about onboarding your AWS account.
- [Troubleshoot your multicloud connectors](troubleshoot-connectors.md).
