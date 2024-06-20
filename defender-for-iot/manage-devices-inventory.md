---
title: Manage the device inventory for Microsoft Defender for IoT in XDR Defender portal
description: This article describes how to manage the device inventory for Microsoft Defender for IoT in XDR Defender portal
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Manage the device inventory

The device inventory helps you identify details about specific OT devices. Gathering details about your devices helps your teams proactively investigate vulnerabilities that can compromise your most critical assets. This article describes how to manage your devices in the device inventory. You can filter data in the inventory, explore the inventory, investigate device details, and more.

[IMAGE]

Learn more about how the helps you [discover IoT/OT devices](device-discovery.md).

## Access the Device inventory page

Access the device inventory page by selecting Devices from the Assets navigation menu in the [Microsoft Defender portal](https://security.microsoft.com/machines).

## Ensure you can view OT device data

If you have a Defender for IoT license, continue to the prerequisites.

If you don't yet have a Defender for IoT license, the Device inventory page shows:

- OT devices with regular device data, and without security data. For example, the device name, IP, and category are visible, while the risk level isn't visible.
- A note at the top of the page that indicates the number of unprotected OT devices.

In this case, [onboard Defender for IoT](get-started.md) to get security value for your OT devices.

## Prerequisites

Review the [Defender for IoT prerequisites](prerequisites.md).

## View OT devices

View OT devices as part of the [device inventory](/defender-endpoint/machines-view-overview.md#device-inventory-overview).

To customize the device inventory views:

- [Use filters](/defender-endpoint/machines-view-overview.md#use-filters-to-customize-the-device-inventory-views)
- [Use columns](/defender-endpoint/machines-view-overview.md#use-columns-to-customize-the-device-inventory-views)

## Manage OT devices

- [Explore the device inventory](/defender-endpoint/machines-view-overview.md#explore-the-device-inventory) including search, export to CSV, and more.
- Select a specific device and [investigate the device details](/defender-endpoint/investigate-machines.md).
- Add, edit, or delete devices.