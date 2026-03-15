---
title: Disable Defender for Cloud plans
description: Learn how to disable Defender for Cloud plans on your connected environments subscription.
ms.topic: how-to
ms.date: 03/15/2026
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

## Ensure plans are fully disabled

Even if a Defender plan is turned off at the subscription level, it can still be turned back on for a specific resource which can generate charges. Therefore, if you want to make sure that a plan is fully disabled for a specific resource, you should also check the resource level configuration for that plan.

For security purposed Defender for Cloud also has multiple features that can re-enable themselves. Those mechanisms include:

- Auto‑provisioning (agents/extensions that get reinstalled)
- Azure Policy assignments that redeploy Defender for Cloud components
- Resource‑level settings
- Billing meters that reveal what’s actually charging

### [1. Disable auto-provisioning](#tab/disable-auto-provisioning)

Auto‑provisioning can silently reinstall Defender for Cloud's agents or extensions, even after plans are turned off. To prevent this, you need to disable auto‑provisioning in Defender for Cloud's settings. It's important to find the plans that contain Endpoint protection and Guest Configuration agent, and disable them to make sure that the agents/extensions don't get reinstalled.

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **relevant subscription or resource**.

1. Select **Settings** for the relevant plans.

    :::image type="content" source="media/disable-plans/select-settings.png" alt-text="Screenshot that shows an example of where the settings button is located on the plans page." lightbox="media/disable-plans/select-settings.png":::

1. Toggle Guest configuration agent to **Off**.

1. Toggle Endpoint protection to **Off**.

1. Select **Continue**.

1. Select **Save**.

### [2. Disable Azure Policy assignments](#tab/disable-azure-policy-assignements)

As a security measure, Defender for Cloud has Azure Policy initiatives that can automatically redeploy Defender for Cloud components if they are uninstalled. To prevent this, you need to identify and disable any relevant Azure Policy assignments.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Serach for and select **Policy**.

1. Select **Assignments**.

    :::image type="content" source="media/disable-plans/policy-assignments.png" alt-text="Screenshot that shows where the assignments for policy is located in Azure." lightbox="media/disable-plans/policy-assignments.png":::

1. Search policies starting with `Deploy Microsoft Defender for Endpoint...`.

    :::image type="content" source="media/disable-plans/search-assignments.png" alt-text="Screenshot that shows the results of searching for the policy." lightbox="media/disable-plans/search-assignments.png":::

1. Select each relevant policy assignment.

1.  Select **Delete assignment**.

---

## Check resource level settings

Defender for Cloud can be enabled per individual resource, even if the subscription‑level plan is turned off. To fully stop charges, you must check and disable Defender on each supported resource type.

1. Open the specific Azure resource.

1. Locate and select **Microsoft Defender for Cloud**.

1. Turn Defender for Cloud to **Off**.

1. Save.

### Resource specific instructions

The following are the most common resource types where Defender can remain enabled.

### [App Service](#tab/app-service)

App Service is the most common place Defender stays enabled accidentally. Defender for App Service is billed per App Service plan and can remain enabled even when the subscription plan is off.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Open the **App Service plan** (not the individual app).

1. Select **Microsoft Defender for Cloud**.

1. Set **Defender for App Service** to **Off**.

1. Select **Save**.

### [Storage Accounts](#tab/storage-accounts)

The resource-level setting overrides the subscription setting. Charges stop for that storage account only.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Open the **Storage Account**.

1. Select **Microsoft Defender for Cloud**.

1. Toggle **Defender for Storage** to **Off**.

1. Select **Save**.

### [Virtual Machines](#tab/virtual-machines)

If auto-provisioning or Azure Policy is still enabled, agents might come back. This is why subscription-level cleanup still matters.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Virtual Machines**.

1. Select a VM.

1. Ensure Defender for Servers displays **unknown**.

    :::image type="content" source="media/disable-plans/unknown.png" alt-text="Screenshot that shows the status of Defender for Servers as "Unknown"." lightbox="media/disable-plans/unknown.png":::

1. If Microsoft Defender for Servers display `On`, go to **Microsoft Defender for Cloud** > **Environment settings** > **relevant subscription or resource**.

1. Toggle Defender for Servers to **Off**.

1. Select **Save**.

### [SQL / Databases](#tab/sql-databases)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Open the **SQL Server** or **SQL Database**.

1. Select **Microsoft Defender for Cloud**.

1. Select **Configure**.

    :::image type="content" source="media/disable-plans/configure.jpg" alt-text="Screenshot that shows where teh configure button is located for your SQL." lightbox="media/disable-plans/configure.jpg":::

1. Toggle Microsoft Defender for SQL to **Off**.

1. Select **Save**.

### [Servers](#tab/servers)

On the resource level, you can enable or disable Defender for Servers plan 1. Plan 2 can only be disabled at the resource level.

For example, it’s possible to enable Defender for Servers plan 2 at the subscription level and disable specific resources within the subscription. However, you can't enable plan 2 only on specific resources. If you are still being billed even with the plan disabled, you should see what is still being covered using the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Environment settings**.

1. Select a relevant subscription or workspace.

1. Toggle **Defender for Servers plan 1** or **plan 2** to **Off**.

1. Select **Save**.

1. Repeat for each relevant subscription or workspace.

---

## Confirm resource-level Defender is off

Use billing as the source of truth to confirm that resource-level Defender is truly off.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Cost Management + Billing** > **Cost analysis**.

1. Filter by **Service name** and **Meter name**.

1. Look for meters such as:

    - `Defender for App Service`
    - `Defender for Storage`
    - `Defender for Servers`
    - `Defender CSPM`

If charges still appear, there's at least one resource with Defender still enabled, or a policy or auto-provisioning rule is re-enabling it.

## Confirm you are no longer covered

Once you have disabled the plans and confirmed that you are no longer being billed, you can also check that you are no longer covered by checking your current coverage using the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook).

## Next step

> [!div class="nextstepaction"]
> [What is Microsoft Defender for Cloud?](defender-for-cloud-introduction.md)
