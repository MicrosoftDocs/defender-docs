---
title: Manage licenses for Microsoft Defender for IoT in the Microsoft Defender portal
description: Learn how to size, purchase, and update Defender for IoT licenses in the Microsoft Defender portal, including upgrading from a trial to a permanent license.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 07/02/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Manage your Microsoft Defender for IoT license

After setting up a license for Microsoft Defender for IoT, you can manage and update it as needed. To purchase the correct license, you need to know the total number of devices within your network so that you can choose the correct sized license for your network.

This article shows how to make changes to your license, including the steps to choose the best size license to purchase.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

<a name="calculate-number-of-devices"></a>
## Calculate the number of IoT devices for licensing

To calculate the number of devices in your network:

1. In the [Microsoft Defender portal](https://security.microsoft.com/machines) menu, select **Assets > Devices**. The device inventory opens.
1. Select the **IoT/OT devices** tab. Note down the total number of devices listed. In this example there are 816 IoT/OT devices detected.

    :::image type="content" source="media/manage-licenses/calculate-ot-devices.png" alt-text="Screenshot showing the list of OT devices in the device inventory for caluculating the total number of devices at the site." lightbox="media/manage-licenses/calculate-ot-devices.png":::

<a name="select-license-size-in-the-admin-center"></a>
## Select a Defender for IoT license size in the Microsoft 365 admin center

Purchase the license for your network from the [Microsoft 365 admin center](/microsoft-365/commerce/licenses/buy-licenses), ensuring it covers enough devices for your site needs.

1. Go to the Microsoft 365 admin center **Billing > Purchase services**. If **Purchase services** isn't available, select **Marketplace** instead.

1. Search for Defender for IoT.

1. Choose the license appropriate for the size of your site. There are five different sized licenses ranging from Extra-large for up to 5,000 devices, to extra-small covering a maximum of 100 devices.

    Make sure to select the number of licenses you want to purchase based on the number of sites you're monitoring. You might need to select licenses of different sizes if the number of devices at each site is different.

1. Complete the purchasing instructions.
