---
title: Get started and set up a license for Microsoft Defender for IoT in the Defender portal
description: This article describes how to get started and set up a license got Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Get started with Microsoft Defender for IoT in the Defender portal

Microsoft Defender for IoT in the Microsoft Defender portal allows you to analyze OT data, generate alerts, and identify network risks. This article explains how to create a trial license for Defender for IoT in the Defender portal using your Microsoft tenant.

One trial license is available per tenant. The trial license is limited to a maximum of 1,000 OT devices. After you set up the trial license, you can access the Defender for IoT security insights available for your network.

When you finish setting up the trial license, you can continue to [set up a site](set-up-sites.md) to monitor your OT devices at the production site level.

[!INCLUDE [defender-iot-license-preview](includes/defender-for-iot-license-notice.md)]

## Add a trial license

To add a trial license for Microsoft Defender for IoT:

1. Open the [Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial wizard](https://signup.microsoft.com/get-started/signup?products=d2bdd05f-4856-4569-8474-2f9ec298923b).

    :::image type="content" source="media/get-started/trial-license-get-started.png" alt-text="Screenshot to get started and set up page for the Microsoft Defender for IoT trial license.":::

1. In the **Email** field, type the email address you want to associate with the trial license, and select **Next**.

1. Confirm that the email address is correct by selecting **Set up account**.

1. In the **Tell us about yourself** page, type your details and select **Next**.

1. Select whether you want the confirmation message to be sent to you via SMS or a phone call. Verify your phone number, and then select **Send verification code**.

1. After receiving the code, type it in the **Enter your verification code** field.

1. In the **How you'll sign in** page, type a username and password and select **Next**.

1. In the **Confirmation details** page, note your order number and username, and select **Start using Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial** to continue.

Once you have a trial license, [set up a new site](set-up-sites.md) so that Microsoft Defender for IoT can begin sending data to the Defender portal.

## Turn on Public preview features

Turn on the public preview features in the Microsoft Defender XDR settings to enable the site security features. Directions to change the settings are available in [Defender portal preview features](/defender-xdr/preview#turn-on-preview-features).

## Upgrade to a permanent license

After assessing the trial version, you can [upgrade to a full license](manage-license.md). For more information, see [license overview](license-overview.md).

## Next steps

Once you have a trial license, [set up the roles and permissions](set-up-rbac.md) needed to access the Defender for IoT site security features in the Defender portal.
