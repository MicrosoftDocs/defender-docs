---
title: Protect resources that report to a Log Analytics workspace
description: Learn how to enable the Defender for Cloud plans that are available on workspaces to protect the resources that report to that workspace.
ms.topic: install-set-up-deploy
ms.date: 09/16/2024
---

# Protect resources that report to a Log Analytics workspace

Defender for Cloud utilizes Log Analytics workspaces, both default and custom, to collect and analyze data from your connected resources. To protect your resources, you can enable specific Defender for Cloud plans on both the subscription level or on specific workspaces that have resources that report to that Log Analytics workspace.

The available plans that you can enable on a Log Analytics workspace level are:

- [Foundational CSPM](concept-cloud-security-posture-management.md) (enabled by default and nonconfigurable)
- [Defender for Servers](plan-defender-for-servers.md)
- [Defender for SQL servers on machines](defender-for-sql-usage.md)

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Connect your [non-Azure machines](quickstart-onboard-machines.md), [AWS account](quickstart-onboard-aws.md) or [GCP projects](quickstart-onboard-gcp.md).

- Review the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Enable plans on a Log Analytics workspace

When you enable a plan on a Log Analytics workspace, you enable the plan for all the resources that report to that workspace.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Environment settings**.

1. Select the relevant workspace.

    :::image type="content" source="media/enable-plan-workspace/select-workspace.png" alt-text="Screenshot that shows the environment settings page, with demo workspaces highlighted. " lightbox="media/enable-plan-workspace/select-workspace.png":::

1. Toggle the switch to **On** for the plan that you want to enable.

    :::image type="content" source="media/enable-plan-workspace/toggle-plan-on.png" alt-text="Screenshot that shows the two available plans that can be enabled and where the toggles are." lightbox="media/enable-plan-workspace/toggle-plan-on.png":::

1. Select **Save**.

Once you enable a plan on a workspace, the plan protects to all of the resources that report to that workspace.

:::image type="content" source="media/enable-plan-workspace/protected-resources.png" alt-text="Screenshot that shows where on the page you can see how many resources are protected." lightbox="media/enable-plan-workspace/protected-resources.png":::

## Related content

- [Defender for Servers](plan-defender-for-servers.md)
- [Defender for SQL servers on machines](defender-for-sql-usage.md)
- [Cloud security posture management (CSPM)](concept-cloud-security-posture-management.md)
