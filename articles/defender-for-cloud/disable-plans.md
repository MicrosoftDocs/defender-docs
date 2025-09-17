---
title: Disable Defender for Cloud plans
description: Learn how to disable Defender for Cloud plans on your connected environments subscription.
ms.topic: how-to
ms.date: 09/15/2025
#customer intent: As a cloud administrator, I want to disable Defender for Cloud plans so that I can manage my security costs.
---

# Disable Defender for Cloud plans

You can disable Microsoft Defender for Cloud plans on your connected environments to manage your security costs. Disabling a plan stops the associated security features, recommendations, and alerts for that plan from appearing in Defender for Cloud.

Each of Defender for Cloud's plans has different pricing structures that can depend on attached resources or sub plans that are enabled. For additional information, you can review [the Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Disable plans on your environment

When you disable a plan, the associated security features, recommendations, and alerts for that plan stops appearing in Defender for Cloud. Any resources and environments protected by a plan will no longer be protected by that plan. All associated recommendations and alerts stop appearing in Defender for Cloud.

If you created an affiliated resource, such as a Log Analytics workspace or Storage Account, to support a plan, you need to manually delete that resource if it's no longer needed.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure, Amazon Web Services (AWS), or Google Cloud Project (GCP) subscription.

    :::image type="content" source="media/disable-plans/environment-settings-screen.png" alt-text="Screenshot of the environment settings page that shows where the link to the page is located." lightbox="media/disable-plans/environment-settings-screen.png":::

### Disable plans by multicloud environment

To continue the disablement process, select the relevant multicloud environment.

### [Azure](#tab/Azure)
        
1. Locate the plan, or plans you want to disable and toggle the switch to **Off**.
        
    :::image type="content" source="media/disable-plans/plans-disabled.png" alt-text="Screenshot that shows all of the Defender for Cloud plans toggled to off in an Azure environment." lightbox="media/disable-plans/plans-disabled.png":::
    
1. (Optional) If you want to disable the Defender for Databases plan, a pop-up where you are able to close the four sub plans of Defender for Databases.
        
    :::image type="content" source="media/disable-plans/databases-disabled.png" alt-text="Screenshot that shows the individual databases plans toggled to off." lightbox="media/disable-plans/databases-disabled.png":::
    
1. (Optional) Select **Continue**.
        
1. Select **Save**.
    
### [AWS](#tab/AWS)

1. Locate the plan, or plans you want to disable and toggle the switch to **Off**.
    
    :::image type="content" source="media/disable-plans/disable-amazon-plans.png" alt-text="Screenshot that shows the Defender for Cloud plans disabled in a Amazon environment." lightbox="media/disable-plans/disable-amazon-plans.png":::

1. Select **Next: Configure access**.

1. Select a deployment type:
    
    - **Default access**: Allows Defender for Cloud to scan your resources and automatically include future capabilities.
    - **Least privilege access**: Grants Defender for Cloud access only to the current permissions needed for the selected plans. If you select the least privileged permissions, you receive notifications on any new roles and permissions that are required to get full functionality for connector health.
    
1. Select a deployment method: **AWS CloudFormation** or **Terraform**.
    
    :::image type="content" source="media/quickstart-onboard-aws/add-aws-account-configure-access.png" alt-text="Screenshot that shows deployment options and instructions for configuring access." lightbox="media/quickstart-onboard-aws/add-aws-account-configure-access.png":::

1. Follow the on-screen instructions for the selected deployment method to complete the required dependencies on AWS. 
    
1. Put a check in the checkbox, confirming you followed the instructions.

1. Select **Next: Review and generate**.
        
1. Select **Create**.
        
### [GCP](#tab/GCP)

1. Locate the plan, or plans you want to disable and toggle the switch to **Off**.
  
    :::image type="content" source="media/disable-plans/disable-google-plans.png" alt-text="Screenshot that shows the Defender for Cloud plans disabled in a Google environment." lightbox="media/disable-plans/disable-google-plans.png":::

---

