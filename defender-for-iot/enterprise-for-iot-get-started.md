---
title: Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to monitor IoT devices using Microsoft Enterprise Defender for IoT in the Microsoft Defender portal.
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

Before you start the procedures in this article, read through [Secure IoT devices in the enterprise](concept-enterprise.md) to understand more about the integration between Defender for Endpoint and Defender for IoT.

Make sure that you have:

- IoT devices in your network, visible in the Microsoft Defender XDR **Device inventory**

- Access to the Microsoft Defender Portal as a [Security administrator](../../active-directory/roles/permissions-reference.md#security-administrator)

- One of the following licenses:

    - A Microsoft 365 E5 (ME5) or E5 Security license

    - Microsoft Defender for Endpoint P2, with an extra, standalone **Microsoft Defender for IoT - EIoT Device License - add-on** license, available for purchase or trial from the Microsoft 365 admin center.

    > [!TIP]
    > If you have a standalone license, you don't need to toggle on **Enterprise IoT Security** and can skip directly to [View added security value in Microsoft Defender XDR](#view-added-security-value-in-microsoft-defender-xdr).
    >

    For more information, see [Enterprise IoT security in Microsoft Defender XDR](concept-enterprise.md#enterprise-iot-security-in-microsoft-defender-xdr).

## Add enterprise IoT security in Microsoft Defender XDR

There are two ways to add enterprise IoT to the Microsoft Defender portal:

1. If you're a Microsoft 365 E5 (ME5)/ E5 Security and Defender for Endpoint P2 customer, toggle on support for Enterprise IoT Security in the Defender Portal.
1. If you don't have ME5/E5 Security licenses, but you're a Defender for Endpoint customer, start with a free trial or purchase standalone, per-device licenses to gain the same IoT-specific security value.

## View added security value in Microsoft Defender XDR

This procedure describes how to view related alerts, recommendations, and vulnerabilities for a specific device in Microsoft Defender XDR, when the **Enterprise IoT security** option is turned on.

**To view added security value**:

1. In [Microsoft Defender XDR](https://security.microsoft.com/), select **Assets** \> **Devices** to open the **Device inventory** page.

1. Select the **IoT devices** tab and select a specific device **IP** to drill down for more details. For example:

    :::image type="content" source="media/enterprise-iot/select-a-device.png" alt-text="Screenshot of the IoT devices tab in Microsoft Defender XDR." lightbox="media/enterprise-iot/select-a-device.png":::

1. On the device details page, explore the following tabs to view data added by the enterprise IoT security for your device:

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

