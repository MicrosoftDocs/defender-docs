---
title: Check the status of your free trial
author: Elazark
ms.author: elkrieger
description: Learn how to check the status of your 30 day free trial of Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 11/27/2025
#customer intent: As a new user, I want to check the status of my free trial of Microsoft Defender for Cloud to understand my usage and remaining trial period.
---

# Check the status of your free trial

When you enable Microsoft Defender for Cloud for the first time on your Azure subscription, you automatically start a 30-day free trial. During this trial period, you can explore the capabilities of Defender for Cloud, foundational Cloud Security Posture Management (CSPM), and access to [Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-defender).

The free trial lasts for 30 days, or until you reach the usage limit for certain plans, whichever comes first. 

Once the usage limit is met or once the 30-day trial ends, charges begin based on the plans enabled in your environment. To learn more about these plans, their usage limits, and associated costs, see the Defender for Cloud [pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

If you have multiple subscriptions, each subscription has its own free trial period. You need to check the status of each subscription's free trial individually. Azure gives you a 30-day free trial every time you activate a new plan. For example, if you activate Defender for Servers, you get 30 days free. If at a later time you activate Defender for Cloud Security Posture Management (DCSPM), you get another 30 days for that plan. Amazon Web Service (AWS) and Google Cloud Project get one trial per account or GCP project, regardless of which plan is enabled or when.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- To check the status of a free trial, you must have a role of Reader or higher on the subscription.

- To enable a plan on your subscription, you must have the **Security Admin** or **Owner** role.

## Check your free trial status with Azure CLI

Azure allows you to check the status of your free trial by using the built-in Azure Command Line Interface (CLI).

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud**.

1. Select **CLI**.

    :::image type="content" source="media/free-trial/select-cli.png" alt-text="Screenshot that shows where the button is located on the Defender for Cloud overview screen to open the Azure CLI." lightbox="media/free-trial/select-cli.png":::

1. Select **PowerShell**.

1. Run the following command to check the status of your free trial:

   ```powershell
   Get-AzSecurityPricing
   ```

The `FreeTrialRemainingTime` field shows the remaining time, if any, of the free trial. If the field shows `“00:00:00”`, it means that the free trial is complete.

## Check your free trial status with Azure Resource Graph Explorer

You can check the status of your free trial by using the Azure Resource Graph Explorer in the Azure portal.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Resource Graph Explorer**.

1. Run the following query:

   ```kusto
    // Total volume
    securityresources
    | where type == "microsoft.security/pricings"
    | extend iso = tostring(properties.freeTrialRemainingTime)
    | extend
    days = extract(@"P(\d+)D", 1, iso),
    hours = extract(@"T(\d+)H", 1, iso),
    minutes = extract(@"H(\d+)M", 1, iso)
    | extend enablementDate = format_datetime(todatetime(properties.enablementTime), "yyyy-MM-dd HH:mm:ss")
    | project
    subscriptionId,
    name,
    pricingTier = properties.pricingTier,
    FreeTrialRemainingTime = strcat(
        coalesce(days, "0"), " days, ",
        coalesce(hours, "0"), " hours, ",
        coalesce(minutes, "0"), " minutes"
    ),
    resourcesCoverageStatus = properties.resourcesCoverageStatus,
    enablementDate
    | sort by subscriptionId asc
   ```

The `FreeTrialRemainingTime` column shows the remaining time, if any, of the free trial. If the column shows `“0 days, 0 hours, 0 minutes”`, it means that the free trial is complete.

## Check your free trial status with Defender for Cloud

You can check the status of your free trial directly within the Microsoft Defender for Cloud portal.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Locate the icon that applies to your subscription:

   :::image type="content" source="media/free-trial/icon-location.png" alt-text="Screenshot that shows where the icon is located on the plans page." lightbox="media/free-trial/icon-location.png":::

    | Icon | Description |
    |--|--|
    | :::image type="icon" source="media/free-trial/full-trial.png" border="false"::: | The full trial is still available. |
    | :::image type="icon" source="media/free-trial/trial-started.png" border="false"::: | The free trial is active. Hover over the icon to see the remaining time. |
    | No icon | The free trial is over. |

## Disable the free trial

If you decide not to continue using Microsoft Defender for Cloud during your free trial, you can disable it.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Disable the relevant plan.

1. Select **Save**.

## Next steps

> [!div class="nextstepaction"]
> [Learn how to enable all paid plans on your subscriptionEnable all paid plans on your subscription](connect-azure-subscription.md#enable-all-paid-plans-on-your-subscription)