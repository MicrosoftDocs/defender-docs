---
title: What's new in Microsoft Defender for IoT in the Defender portal
description: This article describes new features available in Microsoft Defender for IoT in the Defender portal, including both OT and Enterprise IoT networks.
ms.topic: whats-new
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 01/08/2025
ms.custom: enterprise-iot
---

# What's new in Microsoft Defender for IoT?

This article describes features available in Microsoft Defender for IoT in the Defender portal, across both OT and Enterprise IoT networks.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## January 2025

|Service area  |Updates  |
|---------|---------|
| **OT networks** | - [Preview and edit the devices list during the site set up process](#preview-and-edit-the-devices-list-during-the-site-set-up-process) <br><br> - [Manually update the site association of a device](#manually-update-the-site-association-of-a-device)|

### Preview and edit the devices list during the site set up process

Before completing the site association process, preview the list of devices you have chosen to associate with the site, and remove any devices that aren't to be included in this site. For more information, see [preview devices](set-up-sites.md#preview-devices).

### Manually update the site association of a device

Manually assign or modify the site location for a specific device or set of devices. For more information, see [manually update device site association](manage-sites.md#manually-update-device-site-association).

## December 2024

|Service area  |Updates  |
|---------|---------|
| **Site security** | - [Site association search in Site security page now supports various device types](#site-association-search-in-site-security-page-now-supports-various-device-types) |

### Site association search in Site security page now supports various device types

To support searching across all relevant sites and device types, the **Site security** > **Associate devices** page now supports searching for various device types, including IT, enterprise IoT, and network devices.

The suggested sites list now shows all relevant sites that match the search criteria across all device types. When you expand each site, you can view all relevant devices under the site, including the device name and type.

:::image type="content" source="media/set-up-sites/site-security-associate-group.png" alt-text="Screenshot showing the associate devices screen and the suggested list of OT devices per location with the Group column in the site set-up page of Microsoft Defender for IoT in the Microsoft Defender portal." lightbox="media/set-up-sites/site-security-associate-group.png":::

For more information, see [Associate devices](set-up-sites.md#associate-devices).

## November 2024

|Service area  |Updates  |
|---------|---------|
| **Devices** | - [Secure site-linked devices in Microsoft Security Exposure Management Initiatives page](#secure-site-linked-devices-in-microsoft-security-exposure-management-initiatives-page) |

### Secure site-linked devices in Microsoft Security Exposure Management Initiatives page

You can now review the new **OT Security** initiative in the Microsoft Security Exposure Management **Initiatives** page. This new initiative provides a metric-driven way of tracking exposure about unmanaged OT devices.

:::image type="content" source="media/review-security-initiatives/ot-security-initiative.png" alt-text="Screenshot showing the OT Security initiative in Microsoft Defender for IoT in the Microsoft Defender portal." lightbox="media/review-security-initiatives/ot-security-initiative.png":::

This new initiative serves as a powerful tool to improve your OT site security posture. The initiative aims to monitor and safeguard OT environments within the organization by employing network layer monitoring. This initiative identifies devices and ensures that systems are working correctly, and data is protected.

For more information, see: 

- [Review security initiatives](review-security-initiatives.md)
- [Microsoft Security Exposure Management release notes](/security-exposure-management/whats-new#ot-security-initiative).

## September 2024

|Service area  |Updates  |
|---------|---------|
| **Devices** | - [Review unmanaged enterprise IoT devices in Microsoft Security Exposure Management Initiatives page](#review-unmanaged-enterprise-iot-devices-in-microsoft-security-exposure-management-initiatives-page)<br>- [New Building Management Systems (BMS) device category](#new-building-management-systems-bms-device-category)|

### Review unmanaged enterprise IoT devices in Microsoft Security Exposure Management Initiatives page

You can now review the new **Enterprise IoT Security** initiative in the Microsoft Security Exposure Management **Initiatives** page. This new initiative provides a metric-driven way of tracking exposure about unmanaged enterprise IoT devices.

For more information, see the [Microsoft Security Exposure Management release notes](/security-exposure-management/whats-new#new-enterprise-iot-security-initiative).

### New Building Management Systems (BMS) device category

We now support the new BMS device category in Defender for IoT that improves BMS device discovery and security. The BMS category includes a subset of Smart Facility and Surveillance devices (previously under the IoT category) such as fire alarms, humidity sensors, security radars, etc. Camera devices remain under the IoT category.

For more information, see [overview of device discovery](device-discovery.md).

## July 2024

|Service area  |Updates  |
|---------|---------|
| **Threat investigation** | - [Site property added DeviceInfo schema](#new-site-property-added-deviceinfo-schema) |

### New Site property added DeviceInfo schema

In the advanced hunting tables, the **Site** property is added to the **DeviceInfo** schema. For more information, see [investigate threats](investigate-threats.md#advanced-hunting).

## Next steps

[Get started with Defender for IoT](get-started.md)
