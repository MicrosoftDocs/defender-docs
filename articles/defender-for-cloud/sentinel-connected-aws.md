---
title: Connect a Microsoft Sentinel connected AWS account to Defender for Cloud
description: Troubleshoot deployment issues for your AWS connector withing Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/06/2025
ms.topic: how-to
#customer intent: As a security professional, I want to ensure that my AWS connector is connected to Defender for Cloud correctly and i soperating the way it should be.
author: Elazark
ms.author: elkrieger
---

# Connect a Microsoft Sentinel connected AWS account to Defender for Cloud

Microsoft Defender for Cloud generates a CloudFormation template that includes all of the resources necessary to onboard your Amazon Web Services (AWS) account to Defender for Cloud. However, Defender for Cloud and Microsoft Sentinel use the same authentication mechanism to connect to AWS accounts. When an AWS account is first connected to Microsoft Sentinel, Defender for Cloud can't connect to it as well.

This article guides you through the steps to connect your AWS account to Defender for Cloud and ensure it operates correctly.

## Prerequisites

To complete the procedures in this article, you need:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- Access to an AWS account.

- Contributor level permission for the relevant Azure subscription.

## Connect your AWS account to Defender for Cloud

The CloudFormation template provided by Defender for Cloud is needed to grant permission to Defender for Cloud to access you AWS account and resolve the conflict between the Defender for Cloud and Microsoft Sentinel.

1. Follow the steps in the [Connect AWS accounts to Microsoft Defender for Cloud](quickstart-onboard-aws.md) until step 5b in the [Connect Defender Plans](quickstart-onboard-aws.md#select-defender-plans) section.

1. Select **Copy**.

    :::image type="content" source="media/sentinel-connected-aws/copy-template.png" alt-text="Screenshot that shows where the copy button is located." lightbox="media/sentinel-connected-aws/copy-template.png":::

1. Paste the template into a local text editing tool.

1. Search for the **ASCDefendersOIDCIdentityProvider": {** section of the template, and make a separate copy of the entire **ClientIdList**.

1. Search for the **ASCDefendersOIDCIdentityProvider** section in the template and delete it.

1. Save the file locally.

1. In a separate browser window, sign in to your AWS account.

1. Navigate to **Identity and Access Management (IAM)** > **Identity Providers**.

1. Search for and select **33e01921-4d64-4f8c-a055-5bdaffd5e33d**.

1. Select **Actions** > **Add audience**.

1. Paste the **ClientIdList** section you copied in step 3.

1. Navigate to the Configure access page in Defender for Cloud.

1. Follow the Create a Stack in AWS instructions, and use the template you saved locally.

    :::image type="content" source="media/sentinel-connected-aws/create-stack.png" alt-text="Screenshot that shows where the create stack instructions are located." lightbox="media/sentinel-connected-aws/create-stack.png":::

1. Select **Next**.

1. Select **Create**.

## Next steps

- [Assign access to workload owners](assign-access-to-workload.md).
- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- Set up your [on-premises machines](quickstart-onboard-machines.md) and [Google Cloud Platforms (GCP)](quickstart-onboard-gcp.md).
- Get answers to [common questions](faq-general.yml) about onboarding your AWS account.
- [Troubleshoot your multicloud connectors](troubleshooting-guide.md#troubleshoot-connectors).
