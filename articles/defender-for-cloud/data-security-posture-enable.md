---
title: Enable data security posture management for Azure datastores
description: Learn how to enable data security posture management in Microsoft Defender for Cloud for Azure and AWS resources.
author: ElazarK
ms.author: elkrieger
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 05/25/2026
ms.custom: template-how-to-pattern
#customer intent: As a security professional, I want to enable data security posture management so that I can discover sensitive data and prioritize remediation across supported datastores.
---

# Enable data security posture management for Azure datastores

This article explains how to enable data security posture management in Microsoft Defender for Cloud.
Data security posture management helps you discover and classify sensitive data, identify risks, and prioritize remediation.
Before you begin, review the prerequisites in this article.

## Before you start

Review the following prerequisites before you enable data security posture management:

- Before you enable data security posture management, [review support and prerequisites](concept-data-security-posture-prepare.md).
- When you enable Defender CSPM or Defender for Storage plans, the sensitive data discovery extension is automatically enabled. You can disable this setting if you don't want to use data security posture management, but we recommend that you use the feature to get the most value from Defender for Cloud.
- Sensitive data is identified based on the data sensitivity settings in Defender for Cloud. You can [customize the data sensitivity settings](data-sensitivity-settings.md) to identify the data that your organization considers sensitive.
- It takes up to 24 hours to see the results of a first discovery after enabling the feature.

## Enable in Defender CSPM (Azure)

Follow these steps to enable data security posture management. Don't forget to review [required permissions](concept-data-security-posture-prepare.md#whats-supported) before you start.

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select the relevant Azure subscription.
1. For the Defender CSPM plan, select the **On** status.

    If Defender CSPM is already on, select **Settings** in the Monitoring coverage column of the Defender CSPM plan and make sure that the **Sensitive data discovery** component is set to **On** status.

1. Once sensitive data discovery is turned **On** in Defender CSPM, it will automatically incorporate support for additional resource types as the range of supported resource types expands.

## Enable in Defender CSPM (AWS)

### Before you start in AWS

Complete the following checks before you enable data security posture management for Amazon Web Services (AWS):

- Don't forget to: [review the requirements](concept-data-security-posture-prepare.md#discovery) for AWS discovery, and [required permissions](concept-data-security-posture-prepare.md#whats-supported).
- Check that there's no policy that blocks the connection to your Amazon S3 buckets.
- For Amazon Relational Database Service (RDS) instances, cross-account AWS Key Management Service (KMS) encryption is supported, but additional KMS access policies might prevent access.

### Enable for AWS resources

#### Configure S3 buckets and RDS instances

To enable scanning for S3 buckets and RDS instances:

1. In Defender for Cloud, go to **Environment settings** and select your AWS connector.
1. Turn on Defender CSPM with **Sensitive data discovery**.
1. Proceed with the instructions to download the CloudFormation template and to run it in AWS.

Automatic discovery of S3 buckets in the AWS account starts automatically.

For S3 buckets, the Defender for Cloud scanner runs in your AWS account and connects to your S3 buckets.

For RDS instances, discovery will be triggered once **Sensitive Data Discovery** is turned on. The scanner will take the latest automated snapshot for an instance, create a manual snapshot within the source account, and copy it to an isolated Microsoft-owned environment within the same region.

The snapshot is used to create a live instance that is spun up, scanned and then immediately destroyed (together with the copied snapshot).

Only scan findings are reported by the scanning platform.

:::image type="content" source="media/data-security-posture-enable/rds-scanning-platform.png" alt-text="Diagram explaining the RDS scanning platform." lightbox="media/data-security-posture-enable/rds-scanning-platform.png":::

### Check for S3 blocking policies

If the enable process didn't work because of a blocked policy, check the following:

- Make sure that the S3 bucket policy doesn't block the connection. In the AWS S3 bucket, select the **Permissions** tab > Bucket policy. Check the policy details to make sure the Microsoft Defender for Cloud scanner service running in the Microsoft account in AWS isn't blocked.
- Make sure that there's no SCP policy that blocks the connection to the S3 bucket. For example, your SCP policy might block read API calls to the AWS Region where your S3 bucket is hosted.
- Check that these required API calls are allowed by your SCP policy: AssumeRole, GetBucketLocation, GetObject, ListBucket, GetBucketPublicAccessBlock
- Check that your SCP policy allows calls to the us-east-1 AWS Region, which is the default region for API calls.

## Enable data-aware monitoring in Defender for Storage

Sensitive data threat detection is enabled by default when the sensitive data discovery component is enabled in the Defender for Storage plan. For details, see [Sensitive data threat detection in Defender for Storage](defender-for-storage-data-sensitivity.md).

> [!NOTE]
> If you turn off Defender CSPM, only Azure Storage resources are scanned.

## Next step

> [!div class="nextstepaction"]
> [Review security risks in your data](data-security-review-risks.md)

