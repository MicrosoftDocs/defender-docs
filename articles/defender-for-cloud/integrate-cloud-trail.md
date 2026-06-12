---
title: Integrate AWS CloudTrail logs
description: Learn how to enable and validate AWS CloudTrail management event ingestion in Microsoft Defender for Cloud to enhance CIEM, configuration insights, and identity risk detection.
ms.topic: how-to
ms.date: 05/28/2026
#customer intent: As a cloud security administrator, I want to integrate AWS CloudTrail logs with Microsoft Defender for Cloud so that I can improve identity and permission risk visibility.
---

# Integrate AWS CloudTrail logs (Preview)

Microsoft Defender for Cloud can collect AWS CloudTrail management events to increase visibility into identity operations, permission changes, and other control-plane activity across your AWS environments.

CloudTrail ingestion adds activity-based signals to Defender for Cloud’s CIEM capabilities, allowing identity and permission risk analysis to be based not only on configured identity entitlements, but also on observed usage.

CloudTrail ingestion enhances Cloud Infrastructure Entitlement Management (CIEM) by helping identify unused permissions, misconfigured roles, dormant identities, and potential privilege escalation paths. It also provides activity context that strengthens configuration drift detection, security recommendations, and attack path analysis.

CloudTrail ingestion is available for single AWS accounts and AWS Organizations that use centralized logging.

## Prerequisites

Before enabling CloudTrail ingestion, ensure that your AWS account has:

- Defender CSPM plan enabled on the Azure subscription. See [Enable the Defender CSPM plan](tutorial-enable-cspm-plan.md).

- Permission to access AWS CloudTrail.

- Access to the Amazon S3 bucket that stores CloudTrail log files.

- Access to the Amazon SQS queue notifications associated with that bucket.

- Access to AWS KMS keys if CloudTrail logs are encrypted. See [Encrypting CloudTrail log files with AWS KMS](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/encrypting-cloudtrail-log-files-with-aws-kms.html).

- Permissions to create or modify CloudTrail trails and required resources if provisioning a new trail.

- CloudTrail configured to log management events. See [Logging management events with CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html).

> [!NOTE]
> **Microsoft Sentinel users:** If you already stream AWS CloudTrail logs to Microsoft Sentinel, enabling CloudTrail ingestion in Defender for Cloud may require updates to your Sentinel configuration. Review the CloudTrail ingestion workflow to avoid ingestion conflicts by following [Connect a Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md).

## Configure CloudTrail ingestion

To enable CloudTrail ingestion for your AWS connector, perform the following steps:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant AWS connector.

1. Under **Monitoring coverage**, open **Settings**.

1. Enable **AWS CloudTrail ingestion (Preview)**. This adds CloudTrail configuration options to the setup workflow.

    :::image type="content" source="media/integrate-cloud-trail/defender-plans-selection.png" alt-text="Screenshot showing the Defender for Cloud plan selection page for an AWS connector." lightbox="media/integrate-cloud-trail/defender-plans-selection.png":::

1. Choose whether to integrate with an existing CloudTrail trail or create a new one:

    - Select **Manually provide trail details** to use an existing CloudTrail trail.
        1. Provide the Amazon S3 bucket ARN and SQS queue ARN associated with the existing trail.
        1. If prompted, deploy or update the CloudFormation stack provided by Defender for Cloud.

        > [!NOTE]
        > When you select an existing trail, Defender for Cloud performs a one-time collection of up to 90 days of historical CloudTrail management events.
        > If CloudTrail ingestion is disabled, the historical data collected during this process is removed. Re-enabling CloudTrail ingestion triggers a new historical data collection.

    - Select **Create a new AWS CloudTrail** to provision a new trail.
        1. Deploy the CloudFormation or Terraform template provided by Defender for Cloud when prompted.
        1. After the deployment completes, locate the SQS queue ARN in the AWS console.
        1. Return to Defender for Cloud and enter the SQS ARN in the **SQS ARN** field.
        
      :::image type="content" source="media/integrate-cloud-trail/ingestion-settings.png" alt-text="Screenshot showing the AWS CloudTrail ingestion settings for an AWS connector in Defender for Cloud." lightbox="media/integrate-cloud-trail/ingestion-settings.png":::

## How Defender for Cloud uses CloudTrail data

After you complete the configuration: 

- AWS CloudTrail records management events from your AWS account.
- Log files are written to an Amazon S3 bucket.
- Amazon SQS sends notifications when new logs are available.
- Defender for Cloud polls the SQS queue to retrieve the log file references.
- Defender for Cloud processes log telemetry and enriches CIEM and posture insights.

You can customize CloudTrail event selectors to change which management events are captured.

## Validate CloudTrail ingestion

To confirm CloudTrail telemetry is flowing into Defender for Cloud:

- Verify that the S3 bucket grants Defender for Cloud permission to read log files.
- Ensure SQS notifications are configured for new log deliveries.
- Confirm IAM roles allow access to CloudTrail artifacts and encrypted objects.
- Review Defender for Cloud recommendations and identity insights after setup.

Signals may take time to appear depending on CloudTrail delivery frequency and event volume.

## Next step

> [!div class="nextstepaction"]
> [Connect a Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md)

