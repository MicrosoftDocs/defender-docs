---
title: Deploy Defender for Servers in Microsoft Defender for Cloud
description: Learn how to enable the Defender for Servers plan in Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.author: elkrieger
author: elazark
ms.date: 10/28/2024
# customer intent: I want to deploy the Defender for Servers plan in Defender for Cloud so that I can protect connected machines and reduce security risk.

---

# Deploy Defender for Servers

The Defender for Servers plan in Microsoft Defender for Cloud protects Windows and Linux virtual machines (VMs) that run in Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and in on-premises environments. Defender for Servers provides recommendations to improve the security posture of machines, and protects machines against security threats.

This article helps you to deploy a Defender for Servers plan.

> [!NOTE]
> After a plan is enabled, a 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To get the most out of the full 30-day trial, [plan your evaluation goals](plan-defender-for-servers.md).

## Prerequisites

**Requirement** | **Details**
--- | ---
**Plan your deployment** | Review the [Defender for Servers planning guide](plan-defender-for-servers.md).<br/><br/>[Check permissions needed](plan-defender-for-servers-roles.md) to deploy and work with the plan, [choose a plan and deployment scope](plan-defender-for-servers-select-plan.md), and [understand how data is collected and stored](plan-defender-for-servers-data-workspace.md).
**Compare plan features** | [Understand and compare](defender-for-servers-overview.md) Defender for Servers plan features.
**Review pricing** | Review Defender for Servers pricing on the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).
**Get an Azure subscription** | You need a Microsoft Azure subscription. [Sign up for a free one](https://azure.microsoft.com/pricing/free-trial/) if you need to.
**Turn on Defender for Cloud** | Make sure Defender for Cloud is [available in the subscription](connect-azure-subscription.md).
**Onboard AWS/GCP machines** | To protect AWS and GCP machines, connect [AWS accounts](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md) to Defender for Cloud.<br/><br/>By default the connection process onboards machines as Azure Arc-enabled VMs.
**Onboard on-premises machines** | [Onboard on-premises machines as Azure Arc VMs](quickstart-onboard-machines.md) for full functionality in Defender for Servers.<br/><br> If you onboard on-premises machines by [directly installing the Defender for Endpoint agent](onboard-machines-with-defender-for-endpoint.md) instead of onboarding Azure Arc, only Plan 1 functionality is available. In Defender for Servers Plan 2, you get only the premium Defender Vulnerability Management features in addition to Plan 1 functionality.
**Review support requirements** | Check [Defender for Servers requirements and support](support-matrix-defender-for-servers.md) information.
**Take advantage of 500 MB free data ingestion** | When Defender for Servers Plan 2 is enabled, a benefit of free 500 MB data ingestion is available for specific data types. [Learn about requirements and set up free data ingestion](data-ingestion-benefit.md)
**Defender integration** | Defender for Endpoint and Defender for Vulnerability Management are integrated by default in Defender for Cloud.<br/><br/> When you enable Defender for Servers, you give consent for the Defender for Servers plan to access Defender for Endpoint data related to vulnerabilities, installed software, and endpoint alerts.
**Enable at resource level** | Although we recommend enabling Defender for Servers for a subscription, you can [enable Defender for Servers at resource level](#enable-defender-for-servers-at-resource-level) if needed, for Azure VMs, Azure Arc-enabled servers, and Azure Virtual Machine Scale Sets.<br/><br/> You can enable Plan 1 at the resource level.<br/><br/> You can disable Plan 1 and Plan 2 at the resource level.

## Enable on Azure, AWS, or GCP

You can enable a Defender for Servers plan for an Azure subscription, AWS account, or GCP project.

1. Sign in to the [Azure portal](https://portal.azure.com)

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant Azure subscription, AWS account, or GCP project.

1. On the Defender plans page, toggle the Servers switch to **On**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-servers-plan.png" alt-text="Screenshot that shows you how to toggle the Defender for Servers plan to on." lightbox="media/tutorial-enable-servers-plan/enable-servers-plan.png":::

1. By default this turns on Defender for Servers Plan 2. If you want to switch the plan, select **Change plans**.

    :::image type="content" source="./media/tutorial-enable-servers-plan/servers-change-plan.png" alt-text="Screenshot that shows you where on the environment settings page to select change plans." lightbox="media/tutorial-enable-servers-plan/servers-change-plan.png":::

1. In the popup window, select **Plan 2** or **Plan 1**.

    :::image type="content" source="./media/tutorial-enable-servers-plan/servers-plan-selection.png" alt-text="Screenshot of the popup where you can select plan 1 or plan 2." lightbox="media/tutorial-enable-servers-plan/servers-plan-selection.png":::

1. Select **Confirm**.

1. Select **Save**.

After enabling the plan, you have the ability to [configure the features of the plan](configure-servers-coverage.md) to suit your needs.


## Disable on a subscription

1. In Defender for Cloud, select **Environment settings**.
1. Toggle the plan switch to **Off**.


> [!Note]
> If you enabled Defender for Servers Plan 2 on a Log Analytics workspace, you need to disable it explicitly.
> To do that, navigate to the plans page for the workspace and toggle the switch to **Off**.


## Enable Defender for Servers at resource level

Although we recommend that you enable the plan for an entire Azure subscription, you might need to mix plans, exclude specific resources, or enable Defender for Servers on specific machines only. To do this, you can enable or disable Defender for Servers at the resource level.  Review [deployment scope options](plan-defender-for-servers-select-plan.md#decide-on-deployment-scope) before you start.

## Configure on individual machines

Enable and disable the plan on specific machines.

### Enable Plan 1 on a machine with the REST API

1. To enable Plan 1 for the machine, in [Update Pricings](/rest/api/defenderforcloud/pricings/update?tabs=HTTP#update-pricing-on-resource-(example-for-virtualmachines-plan)), create a PUT request with the endpoint.
1. In the PUT request, replace the subscriptionId, resourceGroupName, and machineName in the endpoint URL with your own settings.

    ```rest
        PUT
        https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachines/{machineName}/providers/Microsoft.Security/pricings/virtualMachines?api-version=2024-01-01
    ```


1. Add this request body.

    ```json
    {
     "properties": {
    "pricingTier": "Standard",
    "subPlan": "P1"
      }
    }
    ```

### Disable the plan on a machine with the REST API

1. To disable Defender for Servers at the machine level, create a PUT request with the endpoint.
1. In the PUT request, replace the subscriptionId, resourceGroupName, and machineName in the endpoint URL with your own settings.

    ```rest
        PUT
        https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachines/{machineName}/providers/Microsoft.Security/pricings/virtualMachines?api-version=2024-01-01
    ```
1. Add this request body.

    ```json
    {
     "properties": {
    "pricingTier": "Free",
      }
    }
    ```

### Remove the resource-level configuration with the REST API

1. To remove the machine-level configuration using the REST API, create a DELETE request with the endpoint.
1. In the DELETE request, replace the subscriptionId, resourceGroupName, and machineName in the endpoint URL with your own settings.

    ```rest
        DELETE
        https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachines/{machineName}/providers/Microsoft.Security/pricings/virtualMachines?api-version=2024-01-01
    ```




## Configure multiple machines at scale

### Enable Plan 1 with a script

1. [Download and save this file](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Defender%20for%20Servers%20on%20resource%20level) as a PowerShell file.
1. Run the downloaded file.
1. Customize as needed. Select resources by **tag** or by **resource group**.
1. Follow the rest of the onscreen instructions.


### Enable Plan 1 with Azure Policy (on resource group)

1. Sign in to Azure portal and navigate to the **Policy** dashboard.
1. In the Policy dashboard, select **Definitions** from the left-side menu.
1. In the **Security Center – Granular Pricing** category, search for and then select [Configure Azure Defender for Servers to be enabled (with 'P1' subplan) for all resources (resource level)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2Fproviders%2FMicrosoft.Authorization%2FpolicyDefinitions%2F1b8c0040-b224-4ea1-be6a-47254dd5a207). This policy enables Defender for Servers Plan 1 on all resources (Azure VMs, VMSS and Azure Arc-enabled servers) under the assignment scope.
1. Select the policy and review it.
1. Select **Assign** and edit the assignment details according to your needs. In the **Basics** tab, as **Scope**, select your relevant resource group.
1. In the **Remediation** tab, select **Create a remediation task**.
1. Once you edited all details, select **Review + create. Then select **Create**.

### Enable Plan 1 with Azure Policy (on resource tag)

1. Sign in to Azure portal and navigate to the **Policy** dashboard.
1. In the Policy dashboard, select **Definitions** from the left-side menu.
1. In the **Security Center – Granular Pricing** category, search for and then select [Configure Azure Defender for Servers to be enabled (with 'P1' subplan) for all resources with the selected tag](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2Fproviders%2FMicrosoft.Authorization%2FpolicyDefinitions%2F9e4879d9-c2a0-4e40-8017-1a5a5327c843). This policy enables Defender for Servers Plan 1 on all resources (Azure VMs, VMSS and Azure Arc-enabled servers) under the assignment scope.
1. Select the policy and review it.
1. Select **Assign** and edit the assignment details according to your needs. 
1. In the **Parameters** tab, clear **Only show parameters that need input or review**
1. In **Inclusion Tag Name**, enter the custom tag name. Enter the tag's value in **Inclusion Tag Values** array.
1. In the **Remediation** tab, select **Create a remediation task**.
1. Once you edited all details, select **Review + create. Then select **Create**.


### Disable the plan with a script

1. [Download and save this file](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Defender%20for%20Servers%20on%20resource%20level) as a PowerShell file.
1. Run the downloaded file.
1. Customize as needed. Select resources by tag or by resource group.
1. Follow the rest of the onscreen instructions.



### Disable the plan with Azure Policy (for resource group)


1. Sign in to Azure portal and navigate to the **Policy** dashboard.
1. In the Policy dashboard, select **Definitions** from the left-side menu.
1. In the **Security Center – Granular Pricing** category, search for and then select [Configure Azure Defender for Servers to be disabled for all resources (resource level)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2Fproviders%2FMicrosoft.Authorization%2FpolicyDefinitions%2Ff6ff485a-7630-4730-854d-cd3ad855435e). This policy disables Defender for Servers on all resources (Azure VMs, VMSS and Azure Arc-enabled servers) under the assignment scope.
1. Select the policy and review it.
1. Select **Assign** and edit the assignment details according to your needs. In the **Basics** tab, as **Scope**, select your relevant resource group.
1. In the **Remediation** tab, select **Create a remediation task**.
1. Once you edited all details, select **Review + create. Then select **Create**.


### Disable the plan with Azure Policy (for resource tag)

1. Sign in to Azure portal and navigate to the **Policy** dashboard.
1. In the Policy dashboard, select **Definitions** from the left-side menu.
1. In the **Security Center – Granular Pricing** category, search for and then select [Configure Azure Defender for Servers to be disabled for resources (resource level) with the selected tag](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2Fproviders%2FMicrosoft.Authorization%2FpolicyDefinitions%2F080fedce-9d4a-4d07-abf0-9f036afbc9c8). This policy disables Defender for Servers on all resources (Azure VMs, VMSS and Azure Arc-enabled servers) under the assignment scope based on the tag you defined.
1. Select the policy and review it.
1. Select **Assign** and edit the assignment details according to your needs. 
1. In the **Parameters** tab, clear **Only show parameters that need input or review**
1. In **Inclusion Tag Name**, enter the custom tag name. Enter the tag's value in **Inclusion Tag Values** array.
1. In the **Remediation** tab, select **Create a remediation task**.
1. Once you edited all details, select **Review + create. Then select **Create**.


### Remove the per resource configuration with a script (resource group or tag)

1. [Download and save this file](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Defender%20for%20Servers%20on%20resource%20level) as a PowerShell file.
1. Run the downloaded file.
1. Customize as needed. Select resources by **tag** or by **resource group**.
1. Follow the rest of the onscreen instructions.


## Next steps

- If you enabled Defender for Servers Plan 2, [take advantage of the free data ingestion benefit](data-ingestion-benefit.md).
- After enabling Defender for Servers Plan 2, [enable file integrity monitoring](file-integrity-monitoring-enable-defender-endpoint.md) 
- [Modify plan settings](configure-servers-coverage.md) as needed.
