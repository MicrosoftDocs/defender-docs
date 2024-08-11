---
title: Deploy Defender for Servers
description: Learn how to enable the Defender for Servers on your Azure subscription for Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 02/05/2024
---

# Deploy Defender for Servers

The Defender for Servers plan in Microsoft Defender for Cloud protects Windows and Linux machines that run in Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and on-premises environments.

Defender for Servers provides two plans.

- Plan 1 provides endpoint detection and response features based on Microsoft Defender for Endpoint integration with Defender for Servers.
- Plan 2 provides the same features, along with addition vulnerability assessment and response capabilities, agentless vulnerabilities scanning, cloud-native protection features and threat protection, and more.

Learn more about:

- [Defender for Servers plans](defender-for-servers-overview.md).
- Defender for Servers pricing on the [the Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

> [!NOTE]
> After a plan is enabled, a 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To enjoy the full 30-day trial, plan ahead to meet your evaluation goals using the [Defender for Servers planning guide](plan-defender-for-servers.md).

## Prerequisites

- **Azure subscription**. You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).
- Defender for Cloud should [be connected to your Azure subscription](connect-azure-subscription.md).
- **Multicloud machines**. If you want to protect multicloud (AWS/GCP machines) or on-premises machines, you should:
    - Connect [AWS accounts](quickstart-onboard-aws.md) to Defender for Cloud
    - Connect [GCP projects](quickstart-onboard-gcp.md) to Defender for Cloud
    - Onboard [on-premises machines](onboard-machines-with-defender-for-endpoint.md) to Defender for Cloud.
- **Review support**. Check [Defender for Servers requirements](support-matrix-defender-for-server.md), including network requirements, machine operating system support, and AWS/GCP support.
- **Deployment scope**
    - Defender for Servers Plan 1 can be enabled at the subscription level, or at the resource level for Azure VMs, for on-premises machines that are onboarded as Azure Arc VMs, and Azure VM Scale Sets Flex.
    - Defender for Servers Plan 2 can be enabled at the subscription level only. You can however, disable protection for specific machines.
- **Custom Log Analytics workspace**. 
    - When you enable a Defender for Servers plan, by default it uses the Log Analytics workspace that was set up when you enabled Defender for Cloud in an Azure subscription.
    - Using a custom workspace is supported in Defender for Servers Plan 2.
    - If you don't use the default workspace, you need to specifically enable Defender for Servers Plan 2 in the custom workspace. [Learn more](plan-defender-for-servers-data-workspace.md) about workspace planning.
    - If you enable the plan on a workspace, all machines connected to the workspace will have Plan 2 enabled, regardless of their connected subscription settings.

## Enable on Azure, AWS, or GCP

You can enable a Defender for Servers plan for an Azure subscription, AWS account, or GCP project.


1. Sign in to the [Azure portal](https://portal.azure.com)

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant Azure subscription, AWS account, or GCP project.

1. On the Defender plans page, toggle the Servers switch to **On**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-servers-plan.png" alt-text="Screenshot that shows you how to toggle the Defender for Servers plan to on." lightbox="media/tutorial-enable-servers-plan/enable-servers-plan.png":::

1. By default this turns on Defender for Servers Plan 2. If you want to switch the plan, select **Change plans**.

    :::image type="content" source="media/tutorial-enable-servers-plan/servers-change-plan.png" alt-text="Screenshot that shows you where on the environment settings page to select change plans." lightbox="media/tutorial-enable-servers-plan/servers-change-plan.png":::

1. In the popup window, select **Plan 2** or **Plan 1**.

    :::image type="content" source="media/tutorial-enable-servers-plan/servers-plan-selection.png" alt-text="Screenshot of the popup where you can select plan 1 or plan 2." lightbox="media/tutorial-enable-servers-plan/servers-plan-selection.png":::

1. Select **Confirm**.

1. Select **Save**.

After enabling the plan, you have the ability to [configure the features of the plan](configure-servers-coverage.md) to suit your needs.

## Enable the plan for specific Azure resources

Although we recommend that you enable the plan for an entire Azure subscription, you can turn on Plan 1 for a specific resource.

- To turn on for a specific resource, use the Defender for Cloud REST API.[Pricings resource](/rest/api/defenderforcloud/pricings).
- To enable the plan on machines based on a resource group or Azure resource tags, use the PowerShell script provided below in the instructions.

### Enable with PowerShell

Customize the provided script as needed.

1. [Download and save this file](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Defender%20for%20Servers%20on%20resource%20level) as a PowerShell file.

1. Run the downloaded file.

1. Set pricing by **tag** or by **resource group**.

1. Follow the rest of the onscreen instructions.


## Enable Plan 2 for a custom workspace

If you aren't using Defender for Cloud's default Log Analytics workspace, you must enable Defender for Servers Plan 1 on your custom workspace. 

1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle the servers plan to **On**, and then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::



## Next steps

Learn about [plan settings that can be modified](configure-servers-coverage.md).
