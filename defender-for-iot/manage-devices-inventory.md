---
title: Discover and manage devices in the device inventory for Microsoft Defender for IoT in the Defender portal
description: This article describes how to discover and manage devices in the device inventory for Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Discover and manage devices

Microsoft Defender for IoT in the Microsoft Defender portal includes the device inventory, which helps you identify details about specific OT devices. Gathering details about your devices helps your teams proactively investigate vulnerabilities that can compromise your most critical assets. This article describes how to discover and manage your devices in the device inventory. You can filter data in the inventory, explore the inventory, investigate device details, and more.

Learn more about the benefits of OT [device discovery](device-discovery.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Access the Device inventory page

Access the **Device inventory** page by selecting **Devices** from the **Assets** navigation menu in the [Microsoft Defender portal](https://security.microsoft.com/machines).

## Prerequisites

Review the [Defender for IoT prerequisites](prerequisites.md).

> [!NOTE]
>
> If you don't yet have a Defender for IoT license, the **Device inventory** page lists OT devices without security data. For example, the device name, IP, and category are visible, while the risk level isn't visible. The device inventory also displays a note at the top of the page that indicates the number of unprotected OT devices.
>
> In this case, [onboard Defender for IoT](get-started.md) to get security value for your OT devices.

## View OT devices

View OT devices as part of the [device inventory](/defender-endpoint/machines-view-overview#device-inventory-overview).

To customize the device inventory views:

- [Use filters](/defender-endpoint/machines-view-overview#use-filters-to-customize-the-device-inventory-views)
- [Use columns](/defender-endpoint/machines-view-overview#use-columns-to-customize-the-device-inventory-views)

[!INCLUDE [defender-iot-site-association](includes/site-association.md)]

## Manage OT devices

- [Explore the device inventory](/defender-endpoint/machines-view-overview#explore-the-device-inventory) including search, export to CSV, and more.
- [Onboard devices](/defender-endpoint/onboarding#onboard-devices-using-any-of-the-supported-management-tools).
- [Offboard devices](/defender-endpoint/offboard-machines).
- [Investigate the device details](/defender-endpoint/investigate-machines) to identify behaviors or events that might be related to the alert.
- In the device details pane, select the ellipsis on the top right to [take response actions on a device](/defender-endpoint/respond-machine-alerts).
- [Manually update the site associated with a device](manage-sites.md#manually-update-device-site-association) to maintain accurate monitoring of the network traffic.<!-- Devices can be manually updated[Update the site associated with a device.-->

## Next steps

[Prioritize and remediate vulnerabilities](prioritize-vulnerabilities.md)
