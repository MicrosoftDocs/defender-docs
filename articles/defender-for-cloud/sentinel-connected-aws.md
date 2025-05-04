---
title: Connect a Sentinel connected AWS account to Defender for Cloud
description: Troubleshoot deployment issues for your AWS connector withing Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/04/2025
ms.topic: how-to
#customer intent: As a security professional, I want to ensure that my AWS connector is connected to Defender for Cloud correctly and i soperating the way it should be.
author: Elazark
ms.author: elkrieger
---

# Connect a Sentinel connected AWS account to Defender for Cloud

Microsoft Defender for Cloud and Microsoft's Sentinel use the same authentication mechanism when connecting to AWS accounts. If your AWS account is already connected to Microsoft Sentinel, then Defender for Cloud will be unable to connect to it.

This troubleshooting guide will walk you through the steps you need to take to take in order to connect your AWS account to Defender for Cloud and ensure that it is operating correctly.

## Connect your AWS account to Defender for Cloud

Defender for Cloud provides a CloudFormation template (Terraform script) that includes all the resources required for the onboarding process at the same template. You need to use the same CloudFormation template and follow the steps provided in this article to resolve the conflict between the Defender for Cloud and Sentinel.

1. Follow the steps in the [Connect AWS accounts to Microsoft Defender for Cloud](connect-aws-accounts.md) until step 5b in the Connect Defender Plans section.

1. Copy the AWS CloudFormation template to a text editing tool.

1. Search for the **ASCDefendersOIDCIdentityProvider": {** section in the template, and make a separate copy of the entire **ClientIdList** section.

1. Locate the **ASCDefendersOIDCIdentityProvider** section in the template and delete it.

1. Sign in to your AWS account.

1. Navigate to **Identity and Access Management (IAM)** > **Identity Providers**.

1. Search for and select **33e01921-4d64-4f8c-a055-5bdaffd5e33d**.

1. Select **Actions** > **Add audience**.

1. Paste the **ClientIdList** section you copied in step 3.

1. Navigate back to the Configure access section of the CloudFormation template in Defender for Cloud.

1. Select **Next**.

1. Select **Create**.