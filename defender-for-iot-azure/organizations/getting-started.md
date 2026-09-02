---
title: Get started with OT monitoring - Microsoft Defender for IoT
description: Learn how to set up an OT plan with Microsoft Defender for IoT and configure your network sensors.
ms.topic: get-started
ms.date: 05/31/2026
#CustomerIntent: As a prospective Defender for IoT customer with OT networks, I want to understand how I can set up Defender for IoT and evaluate its capabilities.
---

# Get started with Microsoft Defender for IoT

This article describes how to set up an OT plan for Microsoft Defender for IoT. Use Defender for IoT to monitor network traffic across your OT networks.

## Prerequisites

Before you start, you need:

1. A Microsoft tenant, with Global or Billing admin access to the tenant.

    For more information, see [Buy or remove licenses for a Microsoft business subscription](/microsoft-365/commerce/licenses/buy-licenses) and [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

1. An Azure subscription linked to your tenant.

For current licensing and onboarding options, see [Defender for IoT licenses overview](license-and-trial-license-extention.md).

## Purchase a Defender for IoT license

To purchase a Defender for IoT license through the Microsoft 365 admin center:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

1. Search for **Defender for IoT**.

1. Choose the license appropriate for the size of your site.

1. Complete the purchasing instructions.

For more information, see [purchase a Defender for IoT license](how-to-manage-subscriptions.md#purchase-a-defender-for-iot-license) and the [Microsoft 365 admin center help](/microsoft-365/admin/).

## Add an OT plan

This procedure describes how to add an OT plan for Defender for IoT in the Azure portal, based on your license.

**To add an OT plan in Defender for IoT**:

1. Open [Defender for IoT](https://portal.azure.com/#view/Microsoft_Azure_IoT_Defender/IoTDefenderDashboard/~/Getting_started) in the Azure portal, select **Plans and pricing**, where you're prompted to create a new subscription.

    :::image type="content" source="media/getting-started/subscriptions.png" alt-text="Screenshot of the Go to subscriptions message for creating a Defender for IoT subscription." lightbox="media/getting-started/subscriptions.png":::

1. Select **Go to subscriptions** to create a new subscription on the [Azure **Subscriptions** page](https://portal.azure.com/?quickstart=True#view/Microsoft_Azure_Billing/SubscriptionsBlade).

1. Back in the Defender for IoT's **Plans and pricing** page, select **Add plan**. In the **Plan settings** pane, select your new subscription.

   The **Price plan** value is updated automatically to read **Microsoft 365**, reflecting your Microsoft 365 license.

    :::image type="content" source="media/getting-started/plan-set-up.png" alt-text="Screenshot of the Plan settings pane for completing the set up of a license and site for Defender for IoT in the Azure portal." lightbox="media/getting-started/plan-set-up.png":::

1. Select **Next** and review the details for your licensed site.

1. Select the terms and conditions, and then select **Save**.

Your new plan is listed under the relevant subscription on the **Plans and pricing** > **Plans** page. For more information, see [Manage your subscriptions](how-to-manage-subscriptions.md).

## Onboard an OT sensor

If you already have a network plan ready, you can onboard the OT sensor and associate it with a plan and the assign the relevant site and zone settings. For more information, see [onboard an OT sensor to the Azure portal](onboard-sensors.md).

## Next steps

> [!div class="step-by-step"]
> [Defender for IoT OT deployment path »](ot-deploy/ot-deploy-path.md)
> [!div class="step-by-step"]
> [Defender for IoT onboard an OT sensor »](onboard-sensors.md)
