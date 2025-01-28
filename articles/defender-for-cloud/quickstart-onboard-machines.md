---
title: Connect on-premises machines
description: Learn how to connect your non-Azure machines to Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 01/03/2024
ms.custom: mode-other
---

# Connect your non-Azure machines to Microsoft Defender for Cloud

Microsoft Defender for Cloud can monitor the security posture of your non-Azure machines, but first you need to connect them to Azure.

You can connect your non-Azure computers in any of the following ways:

- Onboarding with Azure Arc:
  - By using Azure Arc-enabled servers (recommended)
  - By using the Azure portal
- [Onboarding directly with Microsoft Defender for Endpoint](onboard-machines-with-defender-for-endpoint.md)

This article describes the methods for onboarding with Azure Arc.

If you're connecting machines from other cloud providers, see [Connect your AWS account](quickstart-onboard-aws.md) or [Connect your GCP project](quickstart-onboard-gcp.md). The multicloud connectors for Amazon Web Services (AWS) and Google Cloud Platform (GCP) in Defender for Cloud transparently handle the Azure Arc deployment for you.

## Prerequisites

To complete the procedures in this article, you need:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- Access to an on-premises machine.

## Connect on-premises machines by using Azure Arc

A machine that has [Azure Arc-enabled servers](/azure/azure-arc/servers/overview) becomes an Azure resource. When you install the Log Analytics agent on it, it appears in Defender for Cloud with recommendations, like your other Azure resources.

Azure Arc-enabled servers provide enhanced capabilities, such as enabling guest configuration policies on the machine and simplifying deployment with other Azure services. For an overview of the benefits of Azure Arc-enabled servers, see [Supported cloud operations](/azure/azure-arc/servers/overview#supported-cloud-operations).

To deploy Azure Arc on one machine, follow the instructions in [Quickstart: Connect hybrid machines with Azure Arc-enabled servers](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

To deploy Azure Arc on multiple machines at scale, follow the instructions in [Connect hybrid machines to Azure at scale](/azure/azure-arc/servers/onboard-service-principal).

Defender for Cloud tools for automatically deploying the Log Analytics agent work with machines running Azure Arc. However, this capability is currently in preview. When you connect your machines by using Azure Arc, use the relevant Defender for Cloud recommendation to deploy the agent and benefit from the full range of protections that Defender for Cloud offers:

- [Log Analytics agent should be installed on your Linux-based Azure Arc machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/720a3e77-0b9a-4fa9-98b6-ddf0fd7e32c1)
- [Log Analytics agent should be installed on your Windows-based Azure Arc machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/27ac71b1-75c5-41c2-adc2-858f5db45b08)

## Connect on-premises machines by using the Azure portal

After you connect Defender for Cloud to your Azure subscription, select **Direct onboarding** in the Environment Settings of the Defender for Cloud to [directly enable Defender for Cloud on your on-premises machines](onboard-machines-with-defender-for-endpoint.md#enable-direct-onboarding)

:::image type="content" source="media/quickstart-onboard-machines/environment-settings-direct-onboarding.png" lightbox="media/quickstart-onboard-machines/environment-settings-direct-onboarding.png" alt-text="Screenshot showing the Direct onboarding option to enable Defender for Cloud for on-premises machines.":::

## Microsoft Defender for Endpoint integration or agentless scanning

Defender for Cloud collects data from your non-Azure (including on-premises) machines to monitor for security vulnerabilities and threats. Some Defender plans require monitoring components to collect data from your workloads.

Data collection is required to provide visibility into missing updates, misconfigured OS security settings, endpoint protection status, and health and threat protection.

To ensure your servers are secured, receive all the security content of Defender for Servers, verify [Defender for Endpoint (MDE) integration](integration-defender-for-endpoint.md) and [agentless disk scanning](concept-agentless-data-collection.md) are enabled on your subscriptions. This ensures you'll seamlessly be up to date and receive all the alternative deliverables once they're provided.
## Verify that your machines are connected

Your Azure and on-premises machines are available to view in one location.

To verify that your machines are connected:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. On the Defender for Cloud menu, select **Inventory** to show the [asset inventory](asset-inventory.md).

1. Filter the page to view the relevant resource types. These icons distinguish the types:

   ![Defender for Cloud icon for an on-premises machine.](./media/quickstart-onboard-machines/security-center-monitoring-icon1.png) Non-Azure machine

   ![Defender for Cloud icon for an Azure machine.](./media/quickstart-onboard-machines/security-center-monitoring-icon2.png) Azure VM

   ![Defender for Cloud icon for an Azure Arc-enabled server.](./media/quickstart-onboard-machines/arc-enabled-machine-icon.png) Azure Arc-enabled server

## Integrate with Microsoft Defender XDR

When you enable Defender for Cloud, Defender for Cloud's alerts are automatically integrated into the Microsoft Defender Portal. No further steps are needed.

The integration between Microsoft Defender for Cloud and Microsoft Defender XDR brings your cloud environments into Microsoft Defender XDR. With Defender for Cloud's alerts and cloud correlations integrated into Microsoft Defender XDR, SOC teams can now access all security information from a single interface.

Learn more about Defender for Cloud's [alerts in Microsoft Defender XDR](concept-integration-365.md).

## Clean up resources

There's no need to clean up any resources for this article.

## Next steps

- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- Set up your [AWS account](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md).
