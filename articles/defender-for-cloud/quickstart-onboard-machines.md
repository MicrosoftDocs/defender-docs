---
title: Connect on-premises machines
description: Learn how to connect your non-Azure machines to Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 01/29/2025
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

> [!NOTE]
> The instructions on this page focus on connecting on-premises machines to Microsoft Defender for Cloud. The same guidance applies to machines in Azure VMware Solution (AVS). 
> Learn more about [integrating Azure VMware Solution machines with Microsoft Defender for Cloud](/azure/azure-vmware/azure-security-integration).

## Prerequisites

To complete the procedures in this article, you need:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- Access to an on-premises machine.

## Connect on-premises machines by using Azure Arc

A machine with [Azure Arc-enabled servers](/azure/azure-arc/servers/overview) becomes an Azure resource. Once connected to an Azure subscription with Defender for Servers enabled, it appears in Defender for Cloud, like your other Azure resources.

Azure Arc-enabled servers provide enhanced capabilities, such as enabling guest configuration policies on the machine and simplifying deployment with other Azure services. For an overview of the benefits of Azure Arc-enabled servers, see [Supported cloud operations](/azure/azure-arc/servers/overview#supported-cloud-operations).

To deploy Azure Arc on one machine, follow the instructions in [Quickstart: Connect hybrid machines with Azure Arc-enabled servers](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

To deploy Azure Arc on multiple machines at scale, follow the instructions in [Connect hybrid machines to Azure at scale](/azure/azure-arc/servers/onboard-service-principal).

## Microsoft Defender for Endpoint integration

Defender for Servers uses an [integration with Microsoft Defender for Endpoint](integration-defender-for-endpoint.md) to provide real-time threat detection, automated response capabilities, vulnerability assessments, software inventory, and more. To ensure your servers are secure and receive all the security benefits of Defender for Servers, verify that the [Defender for Endpoint integration](enable-defender-for-endpoint.md) is enabled on your subscriptions.

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

When you enable Defender for Cloud, Defender for Cloud's alerts are automatically integrated into the Microsoft Defender Portal.

The integration between Microsoft Defender for Cloud and Microsoft Defender XDR brings your cloud environments into Microsoft Defender XDR. With Defender for Cloud's alerts and cloud correlations integrated into Microsoft Defender XDR, SOC teams can now access all security information from a single interface.

Learn more about Defender for Cloud's [alerts in Microsoft Defender XDR](concept-integration-365.md).

## Clean up resources

There's no need to clean up any resources for this article.

## Next steps

- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- Set up your [AWS account](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md).
