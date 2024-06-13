---
title: Get started with the set up of Microsoft Defender for IoT in Defender portal
description: This article describes how to set up Microsoft Defender for IoT in Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Get started with Defender for IoT

## Add trial license/permanent license
<!-- where do we talk about permanent licenses? not here yet? What does that include doing? -->
This procedure describes how to add a trial license for Defender for IoT [to your Azure subscription - CHANGE to the Defender portal?]. One trial license is available per tenant.

To add a trial license with a new tenant, we recommend that you use the Trial wizard. If you already have a tenant, use the Microsoft 365 Marketplace to add a trial license to your tenant.
<!-- Limor, we can remove the tabs and present as two options? -->
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

Use the Microsoft 365 admin center manage your users, billing details, and more. For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

## Calculate number of devices

waiting for Belle feedback

You now know the number of devices you need to protect in your network.

## Select license type (size) in admin center

Purchase the license for your network from the Microsoft 365 admin center, by ensuring it covers enough devices for your site needs.

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purcahse services**. If you don't have this option select **Marcketplace** instead.
1. Search for **Defender for IoT**.
1. Choose the license approriate for the size of your site. There are 5 sized licenses ranging from *Extra-large* for up to 5000 devices, to *extra-small* covering a maximum of 100 devices.

    Make sure to select the number of licenses you want to purchase, based on the number of sites you are monitoring. You might need to select various licenses of different sizes if the number of divices at each site is significantly different.
    [Question: Do we document a situation where a company has eg 12000 devices, for 1 site. How should they be advised to purchase?]

1. Complete the purchasing instructions.

:::image type="content" source="media/365-center-iot-license.png" alt-text="Screenshot showing the license choices for Microsoft Defender for IoT.":::

## What next

[Set up a new site](set-up-site.md).
