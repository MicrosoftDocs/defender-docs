---
title: Integrate AWS CloudTrail logs with Microsoft Defender for Cloud (Preview)
description: Learn how to enable and validate AWS CloudTrail management event ingestion in Microsoft Defender for Cloud to enhance CIEM, configuration insights, and identity risk detection.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 12/09/2025
---

# Integrate AWS CloudTrail logs with Microsoft Defender for Cloud (Preview)

Microsoft Defender for Cloud can ingest AWS CloudTrail management events to increase visibility into identity operations, configuration changes, and other control-plane activity across your AWS environments.

CloudTrail ingestion enhances Cloud Infrastructure Entitlement Management (CIEM) by helping identify unused permissions, misconfigured roles, dormant identities, and potential privilege escalation paths. It also provides activity context that strengthens configuration drift detection, security recommendations, and attack path analysis.

CloudTrail ingestion is available for single AWS accounts and AWS Organizations that use centralized logging.

## Prerequisites

Before enabling CloudTrail ingestion, ensure that your AWS account has:

- Defender CSPM plan enabled on the Azure subscription.
- Permission to access AWS CloudTrail.
- Access to the Amazon S3 bucket that stores CloudTrail log files.
- Access to Amazon SQS queue notifications associated with that bucket.
- Access to AWS KMS keys if CloudTrail logs are encrypted.
- Permissions to create or modify CloudTrail trails and required resources if provisioning a new trail.

CloudTrail must record management events to provide identity and configuration telemetry.

> [!NOTE]
> **Microsoft Sentinel users:** If you already stream AWS CloudTrail logs to Microsoft Sentinel, enabling CloudTrail ingestion in Defender for Cloud may require updates to your Sentinel configuration. Review the updated workflow to avoid ingestion conflicts by following [Connect a Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md).

## Configure CloudTrail ingestion in Microsoft Defender for Cloud

After your AWS account is connected:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your AWS connector.

1. Under **Monitoring coverage**, open **Settings**.

1. Enable **AWS CloudTrail ingestion (Preview)**.

1. Choose whether to integrate with an existing CloudTrail trail or create a new one during setup.

1. Provide the required Amazon S3 bucket and SQS queue details if using an existing trail.

1. If prompted, deploy or update the CloudFormation stack. 

> [!NOTE]
> If you are connecting an existing trail, you must paste the SQS ARN into the CloudFormation parameter field when requested by the AWS console.

You might be prompted to deploy a CloudFormation template to establish IAM permissions, trust relationships, and resource access needed for Defender for Cloud to retrieve CloudTrail logs.

## How Defender for Cloud uses CloudTrail data

After configuration:

- AWS CloudTrail records management events.
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

## Troubleshoot CloudTrail ingestion

If data isn’t populating:

- Check Amazon SQS queue notifications for new log files.
- Confirm IAM roles and trust policies are applied as expected.
- If using encryption, verify KMS key permissions.
- Validate that CloudTrail is recording **management events** and not limited to data events.

Learn more about [troubleshooting multicloud connectors](troubleshoot-connectors.md).

## Next steps

- Learn more about [monitoring connected AWS resources](monitor-connected-aws-resources.md).