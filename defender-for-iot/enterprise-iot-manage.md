---
title: Manage enterprise IoT security for Microsoft Defender for IoT in the Defender portal
description: Learn how to manage enterprise IoT devices using Microsoft Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/25/2024
ms.topic: how-to
---

# Manage enterprise IoT security

Enterprise IoT security improves the monitoring and protection of the IoT devices in your network, such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices.

When enterprise IoT is activated, the data for recommendations and vulnerabilities is shown in the Microsoft Defender portal.

## View enterprise IoT data in the Defender portal

To view enterprise IoT security data:

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Assets** > **Devices** to open the **Device inventory** page.

1. Select the **IoT devices** tab and select a specific device **IP** to drill down for more details. For example:

    :::image type="content" source="media/enterprise-iot-manage/select-a-device.png" alt-text="Screenshot of the IoT devices tab in Microsoft Defender portal." lightbox="media/enterprise-iot-manage/select-a-device.png":::

1. When you select a specific device, the device details page opens. Explore the following tabs to view data added by enterprise IoT security for your device:

    - On the **Alerts** tab, check for any alerts triggered by the device. Simulate alerts in Microsoft 365 Defender for Enterprise IoT using the Raspberry Pi scenario available in the Microsoft 365 Defender [Evaluation & Tutorials](https://security.microsoft.com/tutorials/all) page.

        You can also set up advanced hunting queries to create custom alert rules. For more information, see [advanced hunting queries for enterprise IoT security](#advanced-hunting-queries-for-enterprise-iot).

    - On the **Security recommendations** tab, check for any recommendations available for the device to reduce risk and maintain a smaller attack surface.

    - On the **Discovered vulnerabilities** tab, check for any known CVEs associated with the device. Known CVEs can help decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use [advanced hunting queries](#advanced-hunting-queries-for-enterprise-iot) to collect vulnerabilities across all your devices.

## Hunt for threats on the Device inventory page

On the **Device inventory** page, select **Go hunt** to query devices using tables like the *[DeviceInfo](/microsoft-365/security/defender/advanced-hunting-deviceinfo-table)* table. On the **Advanced hunting** page, query data using other schemas.

## Advanced hunting queries for enterprise IoT

This section lists sample advanced hunting queries that you can use in Microsoft 365 Defender to help you monitor and secure your IoT devices with enterprise IoT security.

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

Customers with ME5/E5 Security plans who no longer need the **enterprise IoT security** service, can turn off the feature.

**To turn off enterprise IoT security**:

1. In [Microsoft Defender portal](https://security.microsoft.com/), select **Settings** > **Device discovery** > **Enterprise IoT**.

1. Toggle the option to **Off**.

You stop getting security value in the Defender portal, including purpose-built alerts, vulnerabilities, and recommendations.

Customers with a Microsoft Defender for Endpoint P2 license who don't add a standalone license by the time the trial ends, have the trial automatically canceled, and lose access to enterprise IoT security features. For more information, see [purchase a standalone license](enterprise-iot-get-started.md#purchase-the-standalone-license).
