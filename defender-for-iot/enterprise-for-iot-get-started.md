---
title: Get started for Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to set up and start monitoring enterprise IoT devices using Microsoft Enterprise Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/25/2024
ms.topic: how-to
---

# Get started with enterprise for IoT

Add enterprise IoT to your Microsoft Defender portal and use the IoT specific security features to protect your IoT environment.

## Prerequisites

Before you start the procedures in this article, read through [enterprise for IoT in the Defender portal](enterprise-for-iot.md) to understand more about the integration between Defender for Endpoint and Defender for IoT.

Make sure that you have:

- IoT devices in your network, visible in the Microsoft Defender portal **Device inventory**

- Access to the Microsoft Defender Portal as a <!-- what is the correct level global or security?-->[Security administrator](../entra/identity/role-based-access-control/permissions-reference#security-administrator)

- One of the following licenses:

    - A Microsoft 365 E5 (ME5) or E5 Security license

    - Microsoft Defender for Endpoint P2, with an extra, standalone **Microsoft Defender for IoT - EIoT Device License - add-on** license, available for purchase or trial from the Microsoft 365 admin center.

## Add enterprise IoT security in the Microsoft Defender portal

There are two ways to add enterprise IoT to the Defender portal:

1. If you're a Microsoft 365 E5 (ME5)/ E5 Security and Defender for Endpoint P2 customer, toggle on support for Enterprise IoT Security in the Defender Portal. For more information, see [turn on enterprise IoT monitoring](#turn-on-enterprise-iot-monitoring).

1. If you don't have ME5/E5 Security licenses, but you're a Defender for Endpoint customer, start with a free trial or purchase standalone, per-device licenses to gain the same IoT-specific security value. For more information, see [standalone trial license](#standalone-enterprise-iot-trial-license).

## Turn on enterprise IoT monitoring

This procedure describes how to turn on enterprise IoT monitoring in Defender portal, and is relevant only for ME5/E5 Security customers.

If you have extra devices that aren't covered by your ME5/E5 licenses, you can purchase standalone licenses. For more information, see [calculate the number of devices for standalone licenses](#calculate-monitored-devices-for-enterprise-iot-monitoring).

**To turn on enterprise IoT monitoring**:

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Settings** > **[Device Discovery](/microsoft-365/security/defender-endpoint/device-discovery)** > **Enterprise IoT**. <!-- does the device discovery need to have a link?-->

> [!NOTE]
> Ensure you have turned on Device Discovery in **Settings** > **Endpoints** > **Advanced Features**.

1. Toggle the Enterprise IoT security option to **On**. For example:

    :::image type="content" source="media/enterprise-for-iot-get-started/eiot-toggle-on.png" alt-text="Screenshot of Enterprise IoT toggled on in Microsoft Defender portal.":::

## Standalone Enterprise IoT trial license

Customers with a Microsoft Defender for Endpoint P2 license only can use a trial standalone license for enterprise IoT monitoring. To purchase a license you need to calculate the number of monitored devices in your network. Then using the Microsoft 365 admin center purchase your licenses.

### Calculate monitored devices for Enterprise IoT monitoring

Use the following procedure to calculate how many devices you need to monitor if:

- You're an ME5/E5 Security customer and think you need to monitor more devices than the devices allocated per ME5/E5 Security license
- You're a Defender for Endpoint P2 customer who's purchasing standalone enterprise IoT licenses

**To calculate the number of devices you're monitoring:**

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Assets** > **Devices** to open the **Device inventory** page.

1. Note down the total number of **IoT devices** listed.

    For example:

    :::image type="content" source="media/enterprise-for-iot-get-started/device-inventory-iot.png" alt-text="Screenshot of network device and IoT devices in the device inventory in Microsoft Defender for Endpoint." lightbox="media/enterprise-for-iot-get-started/device-inventory-iot.png":::

1. Round your total to a multiple of 100 and compare it against the number of licenses you have.

For example:

- If in Microsoft Defender portal **Device inventory**, you have *1204* IoT devices.
- Round down to *1200* devices.
- You have 240 ME5 licenses, which cover **1200** devices

You need another **4** standalone devices to cover the gap.

For more information, see the [Defender for Endpoint Device discovery overview](/microsoft-365/security/defender-endpoint/device-discovery).

> [!NOTE]
> Devices listed on the **Computers & Mobile** tab, including those managed by Defender for Endpoint or otherwise, are not included in the number of [devices](/azure/defender-for-iot/organizations/billing#defender-for-iot-devices) monitored by Defender for IoT. <!-- change the link??-->

### Purchase standalone licenses

Purchase standalone, per-device licenses if you're an ME5/E5 Security customer who needs more than the five devices allocated per license<!-- extra devices monitored-->, or if you're a Defender for Endpoint customer who wants to add enterprise IoT security to your organization.

**To purchase standalone licenses**:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

1. Search for the **Microsoft Defender for IoT - EIoT Device License - add-on** and filter the results by **Other services**. For example:

    :::image type="content" source="media/enterprise-for-iot-get-started/eiot-standalone.png" alt-text="Screenshot of the Marketplace search results for the EIoT Device License.":::

    > [!IMPORTANT]
    > The prices shown in this image are for example purposes only and are not intended to reflect actual prices.

1. On the **Microsoft Defender for IoT - EIoT Device License - add-on** page, enter your selected license quantity, select a billing frequency, and then select **Buy**.

For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

**To start an Enterprise IoT trial**:<!-- is this correct? WHy here? should it be removed? -->

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) > **Marketplace**.

1. Search for the **Microsoft Defender for IoT - EIoT Device License - add-on** and filter the results by **Other services**. For example:

    :::image type="content" source="media/enterprise-for-iot-get-started/eiot-standalone.png" alt-text="Screenshot of the Marketplace search results for the EIoT Device License.":::

    > [!IMPORTANT]
    >
    > The prices shown in this image are for example purposes only and are not intended to reflect actual prices.

1. Under **Microsoft Defender for IoT - EIoT Device License - add-on**, select **Details**.

1. On the **Microsoft Defender for IoT - EIoT Device License - add-on** page, select **Start free trial**. On the **Check out** page, select **Try now**.

> [!TIP]
> Make sure to [assign your licenses to specific users](/microsoft-365/admin/manage/assign-licenses-to-users) to start using them.

For more information, see [Free trial](/azure/defender-for-iot/organizations/billing#free-trial). <!-- is there a different link for this?-->

## View enterprise IoT added security value in the Microsoft Defender portal

With enterprise IoT activated the added security value of alerts, recommendations, and vulnerabilities are shown in the Defender portal.

**To view added security value**:<!-- !!!-->

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Assets** > **Devices** to open the **Device inventory** page.

1. Select the **IoT devices** tab and select a specific device **IP** to drill down for more details. For example:

    :::image type="content" source="media/enterprise-for-iot-get-started/select-a-device.png" alt-text="Screenshot of the IoT devices tab in Microsoft Defender portal." lightbox="media/enterprise-for-iot-get-started/select-a-device.png":::

1. On the device details page, explore the following tabs to view data added by enterprise IoT security for your device:

    - On the **Alerts** tab, check for any alerts triggered by the device. Simulate alerts in Microsoft 365 Defender for Enterprise IoT using the Raspberry Pi scenario available in the Microsoft 365 Defender [Evaluation & Tutorials](https://security.microsoft.com/tutorials/all) page.

        You can also set up advanced hunting queries to create custom alert rules. For more information, see [sample advanced hunting queries for Enterprise IoT monitoring](#sample-advanced-hunting-queries-for-enterprise-iot).

    - On the **Security recommendations** tab, check for any recommendations available for the device to reduce risk and maintain a smaller attack surface.

    - On the **Discovered vulnerabilities** tab, check for any known CVEs associated with the device. Known CVEs can help decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use [advanced hunting queries](#sample-advanced-hunting-queries-for-enterprise-iot) to collect vulnerabilities across all your devices.

### Hunt for threats

On the **Device inventory** page, select **Go hunt** to query devices using tables like the *[DeviceInfo](/microsoft-365/security/defender/advanced-hunting-deviceinfo-table)* table. On the **Advanced hunting** page, query data using other schemas.

## Sample advanced hunting queries for Enterprise IoT

This section lists sample advanced hunting queries that you can use in Microsoft 365 Defender to help you monitor and secure your IoT devices with Enterprise for IoT security.

### Find devices by specific type or subtype

Use the following query to identify devices that exist in your corporate network by type of device, such as routers:  

```kusto
DeviceInfo
| summarize arg_max(Timestamp, *) by DeviceId
| where DeviceType == "NetworkDevice" and DeviceSubtype == "Router"  
```

### Find and export vulnerabilities for your IoT devices

Use the following query to list all vulnerabilities on your IoT devices:

```kusto
DeviceInfo
| where DeviceCategory =~ "iot"
| join kind=inner DeviceTvmSoftwareVulnerabilities on DeviceId
```

For more information, see [Advanced hunting](/microsoft-365/security/defender/advanced-hunting-overview) and [Understand the advanced hunting schema](/microsoft-365/security/defender/advanced-hunting-schema-tables).

## Turn off enterprise IoT security

If you no longer need the **Enterprise IoT security** service, you can turn it off. This is supported only for customers who don't have any standalone, per-device licenses added on to the Defender portal. <!--This doesn't apply to customers with standalone, per-device licenses added to the Defender portal. -->

**To turn off enterprise IoT monitoring**:

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Settings** > **Device discovery** > **Enterprise IoT**.

1. Toggle the option to **Off**.

You stop getting security value in the Defender portal, including purpose-built alerts, vulnerabilities, and recommendations.
