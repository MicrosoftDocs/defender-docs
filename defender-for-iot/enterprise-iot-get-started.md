---
title: Get started for Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to set up and start monitoring enterprise IoT devices using Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/25/2024
ms.topic: how-to
---

# Get started with enterprise IoT

Enterprise IoT security improves the monitoring and protection of the IoT devices in your network, such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices.

The security monitoring includes IoT related vulnerabilities and recommendations that are integrated with your existing Microsoft Defender for Endpoint data. To understand more about the integration between Defender for Endpoint and Defender for IoT, see [enterprise IoT overview](enterprise-iot.md).

In this article you'll learn how to add enterprise IoT to your Microsoft Defender portal and use the IoT specific security features to protect your IoT environment.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Prerequisites

Before you start, you need:

- IoT devices in your network, visible in the Microsoft Defender portal **Device inventory**

- Access to the Microsoft Defender Portal as a [Security administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)

- One of the following licenses:

    - A Microsoft 365 E5 (ME5) or E5 Security license. Enterprise IoT security is included in this package and needs to be turned on.

    - Microsoft Defender for Endpoint P2, with an extra, standalone **Microsoft Defender for IoT - EIoT Device License - add-on** license, available for trial or purchase from the Microsoft 365 admin center.

## Add enterprise IoT security in the Defender portal

There are two ways to add enterprise IoT to the Defender portal:

- ME5/ E5 Security customers: Turn on support for enterprise IoT Security in the Defender Portal. For more information, see [turn on enterprise IoT security](#me5-e5-security-customers).

- Defender for Endpoint P2 customers: Start with a free trial or purchase standalone, per-device licenses to gain the same IoT-specific security value. For more information, see [set up a standalone trial license](#set-up-a-standalone-trial-license). To purchase a full license, see [purchase the standalone full license](#set-up-a-standalone-full-license).

## ME5/ E5 Security customers

This procedure describes how to turn on enterprise IoT security in Defender portal for ME5/ E5 Security customers.

If you have extra devices that aren't covered by your ME5/E5 licenses, you can purchase standalone licenses. For more information, see [set up a standalone full license](#set-up-a-standalone-full-license).

**To turn on enterprise IoT security**:

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Settings** > **Device Discovery** > **Enterprise IoT**.

    > [!NOTE]
    >
    > Ensure you have turned on Device Discovery in **Settings** > **Endpoints** > **Advanced Features**.

1. Toggle the Enterprise IoT security option to **On**. For example:

    :::image type="content" source="media/enterprise-iot-get-started/eiot-toggle-on.png" alt-text="Screenshot of enterprise IoT toggled on in Microsoft Defender portal.":::

## Defender for Endpoint P2 customers

Customers with a Microsoft Defender for Endpoint P2 license only can use a trial standalone license for enterprise IoT security.

You can also purchase a license using the Microsoft 365 admin center. Before purchasing the license you need to [calculate the number of monitored devices in your network](#calculate-monitored-devices-for-enterprise-iot-security) to determine how many licenses you need.

### Set up a standalone trial license

**To start an enterprise IoT trial**:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) > **Marketplace**.

1. Search for the **Microsoft Defender for IoT - EIoT Device License - add-on** and filter the results by **Other services**. For example:

    :::image type="content" source="media/enterprise-iot-get-started/eiot-standalone.png" alt-text="Screenshot of the Marketplace search results for the EIoT Device License.":::

    > [!IMPORTANT]
    >
    > The prices shown in this image are for example purposes only and are not intended to reflect actual prices.

1. Under **Microsoft Defender for IoT - EIoT Device License - add-on**, select **Details**.

1. On the **Microsoft Defender for IoT - EIoT Device License - add-on** page, select **Start free trial**. On the **Check out** page, select **Try now**.

> [!TIP]
> Make sure to [assign your licenses to specific users](/microsoft-365/admin/manage/assign-licenses-to-users) to start using them.

### Set up a standalone full license

Before purchasing a license you must calculate the number of devices you're monitoring.

#### Calculate monitored devices for enterprise IoT security

Use the following procedure to calculate how many devices you need to monitor if:

- You're an ME5/E5 Security customer and think you need to monitor more devices than the devices allocated per ME5/E5 Security license
- You're a Defender for Endpoint P2 customer who's purchasing standalone enterprise IoT licenses

**To calculate the number of devices you're monitoring:**

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Assets** > **Devices** to open the **Device inventory** page.

1. Note down the total number of **IoT devices** listed.

    For example:

    :::image type="content" source="media/enterprise-iot-get-started/device-inventory-iot.png" alt-text="Screenshot of network device and IoT devices in the device inventory in Microsoft Defender for Endpoint." lightbox="media/enterprise-iot-get-started/device-inventory-iot.png":::

1. Round your total to a multiple of 100 and compare it against the number of licenses you have. For example:

    - If in Microsoft Defender portal **Device inventory**, you have *1204* IoT devices.
    - Round down to *1200* devices.
    - You have 240 ME5 licenses, which cover **1200** devices.

    You need another **4** standalone devices to cover the gap.

For more information, see the [Defender for Endpoint Device discovery overview](/microsoft-365/security/defender-endpoint/device-discovery).

> [!NOTE]
> Devices listed on the **Computers & Mobile** tab, including those managed by Defender for Endpoint or otherwise, are not included in the number of [devices](device-discovery.md#identified-unique-devices) monitored by Defender for IoT.

#### Purchase the standalone license

To purchase the standalone full license:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

1. Search for the **Microsoft Defender for IoT - EIoT Device License - add-on** and filter the results by **Other services**. For example:

    :::image type="content" source="media/enterprise-iot-get-started/eiot-standalone.png" alt-text="Screenshot of the Marketplace search results for the EIoT Device License.":::

    > [!IMPORTANT]
    > The prices shown in this image are for example purposes only and are not intended to reflect actual prices.

1. On the **Microsoft Defender for IoT - EIoT Device License - add-on** page, enter your selected license quantity, select a billing frequency, and then select **Buy**.

For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

## Next steps

[Manage enterprise IoT](enterprise-iot-manage.md)
