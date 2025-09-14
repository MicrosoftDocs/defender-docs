---
title: Disable Defender for Cloud plans
description: Learn how to disable Defender for Cloud plans on your connected environments subscription.
ms.topic: how-to
ms.date: 09/09/2025
#customer intent: As a cloud administrator, I want to disable Defender for Cloud plans so that I can manage my security costs.
---

# Disable Defender for Cloud plans

You can disable Microsoft Defender for Cloud plans on your connected environments to manage your security costs. Disabling a plan stops the associated security features, recommendations and alerts for that plan from appearing in Defender for Cloud.

Each of Defender for Cloud's plans have different pricing structures which can depend on attached resources or sub plans that are enabled. For additional information you can review [the Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Disable plans on your environment

When you disable a plan, the associated security features, recommendations and alerts for that plan will stop appearing in Defender for Cloud. Any resources and environments protected by a plan will no longer be protected by that plan. All associated recommendations and alerts will stop appearing in Defender for Cloud.

If you created an affiliated resource, such as a Log Analytics workspace or Storage Account, to support a plan, you will need to manually delete that resource if it is no longer needed.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure, Amazon Web Services (AWS), or Google Cloud Project (GCP) subscription.

    :::image type="content" source="media/disable-plans/environment-settings-screen.png" alt-text="Screenshot of the environment settings page that shows where the link to the page is located." lightbox="media/disable-plans/environment-settings-screen.png":::

    ### [Azure](#tab/Azure)
        
        1. Locate the plan you want to disable and toggle the switch to **Off**.
        
            :::image type="content" source="media/disable-plans/plans-disabled.png" alt-text="Screenshot that shows all of the Defender for Cloud plans toggled to off." lightbox="media/disable-plans/plans-disabled.png":::
    
        1. (Optional) If you want to disable the Defender for Databases plan, a pop-up where you will be able to close the 4 sub plans of Defender for Databases.
        
            :::image type="content" source="media/disable-plans/databases-disabled.png" alt-text="Screenshot that shows the individual databases plans toggled to off." lightbox="media/disable-plans/databases-disabled.png":::
    
        1. (Optional) Select **Continue**.
        
        1. Select **Save**.
    
    ### [AWS](#tab/AWS)
        
    ### [GCP](#tab/GCP)
        
    ---

