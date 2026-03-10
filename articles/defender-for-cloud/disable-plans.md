---
title: Disable Defender for Cloud plans
description: Learn how to disable Defender for Cloud plans on your connected environments subscription.
ms.topic: how-to
ms.date: 12/16/2025
#customer intent: As a cloud administrator, I want to disable Defender for Cloud plans so that I can manage my security costs.
---

# Disable Defender for Cloud plans

You can disable Microsoft Defender for Cloud plans on your connected environments to manage your security costs. When you disable a plan, it stops the associated security features, recommendations, and alerts for that plan from appearing in Defender for Cloud.

Each of Defender for Cloud's plans has different pricing structures that can depend on attached resources or sub plans that are enabled. For more information, see [the Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Disable plans on the subscription level

When you disable a plan, Defender for Cloud stops showing the associated security features, recommendations, and alerts. The plan stops protecting any resources and environments. Defender for Cloud stops showing all associated recommendations and alerts.

If you created a resource to support a plan, such as a Log Analytics workspace or a Storage Account, delete it manually when it's no longer needed.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure, Amazon Web Services (AWS), or Google Cloud Project (GCP) subscription.

    :::image type="content" source="media/disable-plans/environment-settings-screen.png" alt-text="Screenshot of the environment settings page that shows where the link to the page is located." lightbox="media/disable-plans/environment-settings-screen.png":::

### Disable plans by multicloud environment

To continue the disablement process, select the relevant multicloud environment.

### [Azure](#tab/Azure)
        
1. Find the plans you want to disable and toggle the switch to **Off**.
        
    :::image type="content" source="media/disable-plans/plans-disabled.png" alt-text="Screenshot that shows all of the Defender for Cloud plans toggled to off in an Azure environment." lightbox="media/disable-plans/plans-disabled.png":::
    
    1. (Optional) If you want to disable the Defender for Databases plan, a pop-up where you can close the four sub plans of Defender for Databases.
        
        :::image type="content" source="media/disable-plans/databases-disabled.png" alt-text="Screenshot that shows the individual databases plans toggled to off." lightbox="media/disable-plans/databases-disabled.png":::
    
    1. Select **Continue**.
        
1. Select **Save**.
    
### [AWS](#tab/AWS)

1. Find the plans you want to disable and toggle the switch to **Off**.
    
    :::image type="content" source="media/disable-plans/disable-amazon-plans.png" alt-text="Screenshot that shows the Defender for Cloud plans disabled in an Amazon environment." lightbox="media/disable-plans/disable-amazon-plans.png":::

1. Select **Next: Configure access**.

1. Select a deployment type:
    
    - **Default access**: Allows Defender for Cloud to scan your resources and automatically include future capabilities.
    - **Least privilege access**: Grants Defender for Cloud access only to the current permissions needed for the selected plans. If you select the least privileged permissions, you receive notifications on any new roles and permissions that are required to get full functionality for connector health.
    
1. Select a deployment method: **AWS CloudFormation** or **Terraform**.
    
    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-configure-access.png" alt-text="Screenshot that shows deployment options and instructions for configuring access." lightbox="media/quickstart-onboard-aws/add-aws-account-configure-access.png":::

1. Follow the on-screen instructions for the selected deployment method to complete the required dependencies on AWS. 
    
1. Select the checkbox to confirm you followed the instructions.

1. Select **Next: Review and generate**.
        
1. Select **Create**.
        
### [GCP](#tab/GCP)

1. Find the plans you want to disable and toggle the switch to **Off**.
  
    :::image type="content" source="media/disable-plans/disable-google-plans.png" alt-text="Screenshot that shows the Defender for Cloud plans disabled in a Google environment." lightbox="media/disable-plans/disable-google-plans.png":::

1. Select **Next: Configure access**.

1. Select a deployment type:
    
    - **Default access**: Allows Defender for Cloud to scan your resources and automatically include future capabilities.
    - **Least privilege access**: Grants Defender for Cloud access only to the current permissions needed for the selected plans. If you select the least privileged permissions, you receive notifications on any new roles and permissions that are required to get full functionality for connector health.

1. Select a deployment method: **GCP Cloud shell** or **Terraform**.

1. Follow the on-screen instructions for the selected deployment method to complete the required dependencies on AWS. 

    :::image type="content" source="media/disable-plans/disable-google-configuration.png" alt-text="Screenshot that shows the Google configure access screen." lightbox="media/disable-plans/disable-google-configuration.png":::

1. Select the checkbox to confirm you followed the instructions.

1. Select **Next: Review and generate**.
        
1. Select **Create**.

---

Defender for Cloud stops monitoring and onboarding all your resources after you disable all plans in your environment.

If you want to cancel your Microsoft Defender for Cloud subscription, you need to go through the subscription cancellation process in addition to disabling the plans.

## Additional 

Even if a Defender plan is turned off at the subscription level, it can still be turned back on for a specific resource which can generate charges. Therefore, if you want to make sure that a plan is fully disabled for a specific resource, you should also check the resource level configuration for that plan.

For security purposed Defender for Cloud also has multiple features that can re-enable themselves. Those mechanisms include:

- Auto‑provisioning (agents/extensions that get reinstalled)
- Azure Policy assignments that redeploy Defender for Cloud components
- Resource‑level settings
- Billing meters that reveal what’s actually charging

### [Disable auto-provisioning](#tab/disable-auto-provisioning)

Auto‑provisioning can silently reinstall Defender for Cloud's agents or extensions, even after plans are turned off. To prevent this, you need to disable auto‑provisioning in Defender for Cloud's settings. It's important to find the plans that contain Endpoint protection and Guest Configuration agent, and disable them to make sure that the agents/extensions don't get reinstalled.

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **relevant subscription or resource**.

1. Select **Settings** for the relevant plans.

    :::image type="content" source="media/disable-plans/select-settings.png" alt-text="Screenshot that shows an example of where the settings button is located on the plans page." lightbox="media/disable-plans/select-settings.png":::

1. Toggle Guest configuration agent to **Off**.

1. Toggle Endpoint protection to **Off**. 

---

## Next step

> [!div class="nextstepaction"]
> [What is Microsoft Defender for Cloud?](defender-for-cloud-introduction.md)
