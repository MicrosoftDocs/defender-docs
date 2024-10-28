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

Defender for Servers provides two plans.

- **Plan 1** provides vulnerability management and endpoint detection and response (EDR) features, based on integration of Defender for Servers with Microsoft Defender for Endpoint and Microsoft Defender Vulnerability Management.
- **Plan 2** provides Plan 1 features and more capabilities, including agentless vulnerabilities scanning, cloud-native protection features, and premium Defender Vulnerability Management features.

> [!NOTE]
> After a plan is enabled, a 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To get the most out of the full 30-day trial, [plan your evaluation goals](plan-defender-for-servers.md).

## Prerequisites

- **Plan your deployment**. Review the [Defender for Servers planning guide](plan-defender-for-servers.md).
- **Review plans**. [Understand and compare](defender-for-servers-overview.md) Defender for Servers plans.
- **Decide on deployment scope**: Decide where you want to enable Defender for Servers. [Learn more](defender-for-servers-overview.md#enabling-deployment-scope).
- **Review pricing**. Review Defender for Servers pricing on the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).
- **Get an Azure subscription**. You need a Microsoft Azure subscription. You can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/) as needed.
- **Turn on Defender for Cloud**: Make sure Defender for Cloud is [enabled on the subscription](connect-azure-subscription.md).
- **Onboard AWS/GCP machines**. To protect AWS and GCP machines, connect [AWS accounts](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md) to Defender for Cloud. By default the connection process onboards multicloud machines as Azure Arc-enabled VMs.
- **Onboard on-premises machines**. For full Defender for Servers functionality, on-premises machines should be [onboarded to the subscription as Azure Arc VMs](quickstart-onboard-machines.md).

    If you onboard on-premises machines by [directly installing the Defender for Endpoint agent](onboard-machines-with-defender-for-endpoint.md) instead of onboarding machines with Azure Arc, Defender for Servers Plan functionality is available. For Defender for Servers Plan 2, in addition to Plan 1 features, only the premium Defender Vulnerability Management features are available.

- **Review support requirements**. Check [Defender for Servers requirements and support](support-matrix-defender-for-servers.md) information.
- **Take advantage of 500 MB free data ingestion**: A benefit of free 500 MB data ingestion (available for [specific data types](faq-defender-for-servers.yml#what-data-types-are-included-in-the-daily-allowance-)) is available in Defender for Servers Plan 2.

- Machines must be running the Azure Monitor agent (AMA), and located in subscriptions with Defender for Servers Plan 2 enabled. 
- You need to specifically enable Defender for Servers Plan 2 on a Log Analytics workspace. The benefit is granted to the Log Analytics workspace to which the machine reports.

- **Integration**: Defender for Endpoint integration is enabled by default in Defender for Cloud. When you enable Defender for Servers, you give consent for the plan to access the Defender for Endpoint data related to vulnerabilities, installed software, and alerts for endpoints.

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

## Enable Plan 2 on a workspace

If you're using a Log Analytics workspace to take advantage of the free data ingestion for machines running the AMA, enable Plan 2 on that workspace.


1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle the servers plan to **On**, and then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::



## Enable Plan 1 at resource level

Although we recommend that you enable the plan for an entire Azure subscription, you can enable Defender for Servers Plan 1 at resource level for specific machines.

### Enable for a specific machine

To turn Plan 1 on for a specific resource, use the Defender for Cloud REST API.[Pricings resource](/rest/api/defenderforcloud/pricings).

### Enable for a resource group or based on resource tags

Enable Plan 1 on a resource group or Azure resource tags as follows:

1. [Download and save this file](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Defender%20for%20Servers%20on%20resource%20level) as a PowerShell file.
1. Run the downloaded file.
1. Customize as needed. Set pricing by **tag** or by **resource group**.
1. Follow the rest of the onscreen instructions.

## Next steps

- If you enabled Defender for Servers Plan 2, [enable file integrity monitoring](file-integrity-monitoring-enable-defender-endpoint.md) 
- [Modify plan settings](configure-servers-coverage.md) as needed.
