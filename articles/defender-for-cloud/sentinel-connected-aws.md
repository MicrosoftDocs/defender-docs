---
title: Connect a Microsoft Sentinel connected AWS account to Defender for Cloud
description: Troubleshoot deployment issues for your AWS connector withing Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/04/2025
ms.topic: how-to
#customer intent: As a security professional, I want to ensure that my AWS connector is connected to Defender for Cloud correctly and i soperating the way it should be.
author: Elazark
ms.author: elkrieger
---

# Connect a Microsoft Sentinel connected AWS account to Defender for Cloud

Microsoft Defender for Cloud generates a CloudFormation template (Terraform script) that includes all of the resources necessary to onboard your Amazon Web Services (AWS) account to Defender for Cloud. However, Defender for Cloud and Microsoft Sentinel use the same authentication mechanism to connect to AWS accounts. When an AWS account is first connected to Microsoft Sentinel, Defender for Cloud can't connect to it as well.

This article guides you through the steps to connect your AWS account to Defender for Cloud and ensure it operates correctly.

## Prerequisites

To complete the procedures in this article, you need:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- Access to an AWS account.

- Contributor level permission for the relevant Azure subscription.
  
- If CIEM is enabled as part of Defender for CSPM the user enabling the connector will also need [Security Admin role and Application.ReadWrite.All permission](enable-permissions-management.md#before-you-start) for your tenant.

## Connect your AWS account to Defender for Cloud

 You need access to the CloudFormation template provided by Defender for Cloud and to follow the steps provided in this article to resolve the conflict between the Defender for Cloud and Microsoft Sentinel.

1. Follow the steps in the [Connect AWS accounts to Microsoft Defender for Cloud](quickstart-onboard-aws.md) until step 5b in the [Connect Defender Plans](quickstart-onboard-aws.md#select-defender-plans) section.

1. On the Configure access page, search for the **ASCDefendersOIDCIdentityProvider": {** section in the template, and make a separate copy of the entire **ClientIdList** section in a text editing tool.

1. On the Configure access page, locate the **ASCDefendersOIDCIdentityProvider** section in the template and delete it.

1. In a separate browser window, sign in to your AWS account.

1. Navigate to **Identity and Access Management (IAM)** > **Identity Providers**.

1. Search for and select **33e01921-4d64-4f8c-a055-5bdaffd5e33d**.

1. Select **Actions** > **Add audience**.

1. Paste the **ClientIdList** section you copied in step 3.

1. Navigate to the CloudFormation template on the Configure access page in Defender for Cloud.

1. Select **Next**.

1. Select **Create**.