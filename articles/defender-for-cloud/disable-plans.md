---
title: Disable Microsoft Defender for Cloud plans
description: Learn how to disable Microsoft Defender for Cloud plans at subscription and resource levels across Azure, AWS, and GCP to prevent unexpected charges.
ms.topic: how-to
ms.custom: msecd-doc-authoring-1012
author: Elazark
ms.author: elkrieger
ms.date: 05/04/2026
#customer intent: As a cloud administrator, I want to disable Defender for Cloud plans so that I can manage my security costs.
---

# Disable Microsoft Defender for Cloud plans

You can disable Microsoft Defender for Cloud plans on your connected environments to manage your security costs. When you disable a plan, the associated security features, recommendations, and alerts for that plan stop appearing in Defender for Cloud.

Each Defender for Cloud plan has a different pricing structure based on attached resources and enabled subplans. For more information, see [the Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Disable plans on the subscription level

Disabling a plan at the subscription level affects all resources under that subscription unless resource-level overrides are active.

If you created a resource to support a plan, such as a Log Analytics workspace or a Storage Account, delete it manually when it's no longer needed.

To disable plans at the subscription level:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure, Amazon Web Services (AWS), or Google Cloud Project (GCP) subscription.

    :::image type="content" source="media/disable-plans/environment-settings-screen.png" alt-text="Screenshot of the Environment settings page in Defender for Cloud showing Azure, AWS, and GCP subscription entries." lightbox="media/disable-plans/environment-settings-screen.png":::

### Disable plans by multicloud environment

To continue, select the relevant multicloud environment.

### [Azure](#tab/Azure)
        
1. Find the plans you want to disable and toggle the switch to **Off**.
        
    :::image type="content" source="media/disable-plans/plans-disabled.png" alt-text="Screenshot that shows all of the Defender for Cloud plans toggled to off in an Azure environment." lightbox="media/disable-plans/plans-disabled.png":::
    
    1. (Optional) To disable the Defender for Databases plan, use the pop-up to turn off all four Defender for Databases subplans.
        
        :::image type="content" source="media/disable-plans/databases-disabled.png" alt-text="Screenshot that shows the four Defender for Databases subplans toggled to Off." lightbox="media/disable-plans/databases-disabled.png":::

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
    
1. Select the check box to confirm you followed the instructions.

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

1. Follow the on-screen instructions for the selected deployment method to complete the required dependencies on Google Cloud.

    :::image type="content" source="media/disable-plans/disable-google-configuration.png" alt-text="Screenshot that shows the GCP configure access page with Cloud Shell and Terraform deployment options." lightbox="media/disable-plans/disable-google-configuration.png":::

1. Select the check box to confirm you followed the instructions.

1. Select **Next: Review and generate**.
        
1. Select **Create**.

---

> [!IMPORTANT]
> Defender for Cloud stops monitoring and onboarding all your resources after you disable all plans in your environment.

Disabling plans doesn't cancel your subscription. To cancel your subscription, use the Azure subscription cancellation process.

## Ensure plans are fully disabled

Turning off a plan at the subscription level doesn't prevent it from being turned on for a specific resource, which can generate charges. To fully disable a plan for a specific resource, check the resource-level configuration for that plan.

For security purposes, Defender for Cloud has multiple features that can re-enable themselves. Those mechanisms include:

- Autoprovisioning (agents/extensions that get reinstalled)
- Azure Policy assignments that redeploy Defender for Cloud components
- Resource-level settings

> [!NOTE]
> To confirm that charges stop, check your billing meters in Cost Management + Billing.

### [1. Disable autoprovisioning](#tab/disable-auto-provisioning)

Autoprovisioning can silently reinstall agents or extensions after you turn off plans. To prevent reinstallation, disable autoprovisioning for Endpoint protection and Guest Configuration agent in Defender for Cloud settings.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **relevant subscription or resource**.

1. Select **Settings** for the relevant plans.

    :::image type="content" source="media/disable-plans/select-settings.png" alt-text="Screenshot that shows an example of where the settings button is located on the plans page." lightbox="media/disable-plans/select-settings.png":::

1. Toggle Guest configuration agent to **Off**.

1. Toggle Endpoint protection to **Off**.

1. Select **Continue**.

1. Select **Save**.

### [2. Disable Azure Policy assignments](#tab/disable-azure-policy-assignments)

As a security measure, Defender for Cloud includes Azure Policy initiatives that automatically redeploy Defender for Cloud components if you uninstall them. To prevent this automatic redeployment, identify and disable any relevant Azure Policy assignments.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Policy**.

1. Select **Assignments**.

    :::image type="content" source="media/disable-plans/policy-assignments.png" alt-text="Screenshot that shows the Assignments page in Azure Policy." lightbox="media/disable-plans/policy-assignments.png":::

1. Search policies starting with `Deploy Microsoft Defender for Endpoint...`.

    :::image type="content" source="media/disable-plans/search-assignments.png" alt-text="Screenshot that shows search results for policies beginning with 'Deploy Microsoft Defender for Endpoint'." lightbox="media/disable-plans/search-assignments.png":::

1. Select each relevant policy assignment.

1. Select **Delete assignment**.

---

## Check resource-level settings

You can enable Microsoft Defender for Cloud for individual resources, even if you turn off the subscription-level plan. To fully stop charges, check and disable Microsoft Defender for Cloud on each supported resource type.

To check and disable Defender for Cloud at the resource level:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Open the specific Azure resource.

1. Locate and select **Microsoft Defender for Cloud**.

1. Turn Defender for Cloud to **Off**.

1. Select **Save**.

### Resource-specific instructions

The following resource types are the most common where Defender for Cloud stays enabled.

### [App Service](#tab/app-service)

App Service is the most common place where Defender for Cloud stays enabled accidentally. You pay for Defender for App Service per App Service plan. It can stay enabled even when the subscription plan is off.

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

If autoprovisioning or an Azure Policy assignment is still active, agents might be reinstalled. This dependency is why subscription-level cleanup still matters.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Virtual Machines**.

1. Select a virtual machine (VM).

1. Ensure Defender for Servers displays **unknown**.

    :::image type="content" source="media/disable-plans/display-unknown.png" alt-text="Screenshot that shows the status displaying as Unknown." lightbox="media/disable-plans/display-unknown.png":::

1. If Microsoft Defender for Servers displays `On`, go to **Microsoft Defender for Cloud** > **Environment settings** > **relevant subscription or resource**.

1. Toggle Defender for Servers to **Off**.

1. Select **Save**.

### [SQL / Databases](#tab/sql-databases)

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Open the **SQL Server** or **SQL Database** resource.

1. Select **Microsoft Defender for Cloud**.

1. Select **Configure**.

    :::image type="content" source="media/disable-plans/configure.jpg" alt-text="Screenshot that shows where the Configure button is located on the SQL resource's Defender for Cloud page." lightbox="media/disable-plans/configure.jpg":::

1. Toggle Microsoft Defender for SQL to **Off**.

1. Select **Save**.

### [Servers](#tab/servers)

At the resource level, you can enable or disable Defender for Servers plan 1. For plan 2, you can disable it for specific resources only when plan 2 remains enabled at the subscription level.

For example, you can enable Defender for Servers plan 2 at the subscription level and disable it for specific resources within the subscription. However, you can't enable plan 2 only on specific resources. If you're still being billed even after you disable the plan, use the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) to see what resources remain covered.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Environment settings**.

1. Select a relevant subscription or workspace.

1. Toggle **Defender for Servers plan 1** or **plan 2** to **Off**.

1. Select **Save**.

1. Repeat for each relevant subscription or workspace.

---

## Confirm resource-level Defender is off

To confirm that resource-level Defender is truly off, use billing as the source of truth.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Cost Management + Billing** > **Cost analysis**.

1. Filter by **Service name** and **Meter name**.

1. Look for meters such as:

    - `Defender for App Service`
    - `Defender for Storage`
    - `Defender for Servers`
    - `Defender CSPM` (Cloud Security Posture Management)

If charges still appear, there's at least one resource with Defender still enabled, or a policy or autoprovisioning rule is re-enabling it.

## Confirm you're no longer covered

After you disable the plans and confirm that you're no longer billed, use the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) to verify your current coverage.

## Next step

> [!div class="nextstepaction"]
> [What is Microsoft Defender for Cloud?](defender-for-cloud-introduction.md)
