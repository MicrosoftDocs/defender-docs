---
title: Check the status of your free trial
author: Elazark
ms.author: elkrieger
description: Learn how to check the status of your 30 day free trial of Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 10/21/2025
#customer intent: As a new user, I want to check the status of my free trial of Microsoft Defender for Cloud to understand my usage and remaining trial period.
---

# Check the status of your free trial

When you enable Microsoft Defender for Cloud for the first time on your Azure subscription, you automatically start a 30-day free trial. During this trial period, you can explore the capabilities of Defender for Cloud, foundational CSPM, and access to [Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-defender).

Once you activate the free trial it lasts for 30 days, or until the usage limit for certain plans is reached, whichever comes first. 

After reaching the usage limit or once the 30-day trial ends, charges begin based on the plans enabled in your environment. To learn more about these plans, their usage limits, and associated costs, see the Defender for Cloud [pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Prequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- You must have a role of Reader or higher on the subscription.

## Check your free trial status with Azure CLI

Azure provides the ability to check the status of your free trial using the built in Azure Command Line Interface (CLI).

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud**.

1. Select CLI.

    :::image type="content" source="media/free-trial/select-cli.png" alt-text="Screenshot that shows where the button is located on the Defender for Cloud overview screen to open the Azure CLI." lightbox="media/free-trial/select-cli.png":::

1. Select **PowerShell**.

1. Run the following command to check the status of your free trial:

   ```powershell
   Get-AzSecurityPricing
   ```

The `FreeTrialRemainingTime` field presents the remaining time, if any, of the free trial. If the field presents `“00:00:00”` it means that the free trial is complete.