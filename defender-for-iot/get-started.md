---
title: Get started with the setup of Microsoft Defender for IoT in Defender portal
description: This article describes how to set up Microsoft Defender for IoT in Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Get started with Defender for IoT

This article explains how to create a trial license for Microsoft Defender for IoT. Once you have a trial license you can continue to set up a site to monitor the OT devices at that location. The trial license is limited to a maximum of 1,000 OT devices, and when fully set up, shows you the features and security insights available for your network.

## Prerequisites

To sign up for a trial license you need to have a global or billing Admin Entra account. [Is this correct?]

## Add a trial license

To add a trial license with a new tenant, we recommend that you use the Trial wizard. One trial license is available per tenant. If you already have a tenant, use the Microsoft 365 Marketplace to add a trial license to your tenant.
<!-- Change the tabs to h3 headings -->
# [Add a trial with the Trial wizard](#tab/wizard)

**To add a trial license with a new tenant**:

1. In a browser, open the [Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial wizard](https://signup.microsoft.com/get-started/signup?products=d2bdd05f-4856-4569-8474-2f9ec298923b).

1. In the **Email** box, enter the email address you want to associate with the trial license, and select **Next**.

1. Confirm that the email address is correct by selecting **Set up account**.

1. In the **Tell us about yourself** page, enter your details, and then select **Next**.

1. Select whether you want the confirmation message to be sent to you via SMS or a phone call. Verify your phone number, and then select **Send verification code**.

1. After receiving the code, enter it in the **Enter your verification code** box.

1. In the **How you'll sign in** page, enter a username and password and select **Next**.

1. In the **Confirmation details** page, note your order number and username, and then select **Start using Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial** button to continue. We recommend that you copy your full username to the clipboard as you need it to access the Azure portal.

# [Add a trial from the Microsoft 365 Marketplace](#tab/marketplace)

**To add a trial license with an existing tenant**:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

1. Search for **Microsoft Defender for IoT** and locate the **Microsoft Defender for IoT - OT site license - Trial Trial** item.

1. Select **Details** > **Start free trial** > **Try now** to start the trial.

For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

---

Use the Microsoft 365 admin center to manage your users, billing details, and more. For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

>[!NOTE]
>This trial license covers up to 1,000 devices. When moving to a permanent license you will need to know the total number of devices and choose the appropriate license to cover the needs of your network. This might mean choosing a larger or smaller sized license package.
> For more information, see [license admin center ](license-admin.md).

Belle - for a trial version - how can we choose the devices if my site has more than the max of the trial license?

Once you have a trial license, go to [Set up a new site](set-up-sites.md) so that Microsoft Defender for IoT sends data to the XDR portal.

## Next steps

> [!div class="step-by-step"]
> [Set up a new site](set-up-sites.md)<br><br>
> [Buy a permanant license](license-admin.md)<br>
