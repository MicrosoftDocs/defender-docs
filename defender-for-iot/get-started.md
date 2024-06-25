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

This article explains how to create a trial license for Microsoft Defender for IoT using your XDR tenant. One trial license is available per tenant. Defender for IoT allows you to analyze OT data, generate alerts, identify network risks, and more.

Once you have a trial license, you can continue to set up a site to monitor the OT devices at that location. The trial license is limited to a maximum of 1,000 OT devices, and once set up, shows you the Defender for IoT security insights available for your network.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Add a trial license

To add a trial license for Microsoft Defender for IoT:

1. In a browser, open the [Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial wizard](https://signup.microsoft.com/get-started/signup?products=d2bdd05f-4856-4569-8474-2f9ec298923b).

    :::image type="content" source="media/get-started/trial-license-get-started.png" alt-text="Screenshot of the set up page for the Microsoft Defender for IoT trial license.":::

1. In the **Email** box, enter the email address you want to associate with the trial license, and select **Next**.

1. Confirm that the email address is correct by selecting **Set up account**.

1. In the **Tell us about yourself** page, enter your details, and then select **Next**.

1. Select whether you want the confirmation message to be sent to you via SMS or a phone call. Verify your phone number, and then select **Send verification code**.

1. After receiving the code, enter it in the **Enter your verification code** box.

1. In the **How you'll sign in** page, enter a username and password and select **Next**.

1. In the **Confirmation details** page, note your order number and username, and then select **Start using Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial** button to continue.

To purchase a full license, without a trial license, go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

Use the Microsoft 365 admin center to upgrade to a full license, manage your users, billing details, and more. For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

>[!NOTE]
>This trial license covers up to 1,000 devices. When moving to a permanent license you need to know the total number of OT devices in your network and choose the appropriate license to cover the needs of your network. This might mean choosing a larger or smaller sized license package.
> For more information, see [upgrade to a full license](license-admin.md).

Once you have a trial license, go to [Set up a new site](set-up-sites.md) so that Microsoft Defender for IoT sends data to the Defender portal.
