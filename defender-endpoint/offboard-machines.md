---
title: Offboard devices
description: Onboard Windows devices, servers, non-Windows devices from the Microsoft Defender for Endpoint service
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.topic: article
ms.subservice: onboard
ms.date: 10/20/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Vulnerability Management
  - Microsoft Defender for Business
---

# Offboard devices

When you offboard a device from Defender for Endpoint, no new detections, vulnerability, or security data are sent to the Microsoft Defender portal. Seven days after offboarding a device, its status changes to [inactive](fix-unhealthy-sensors.md#inactive-devices). Devices that weren't active within the past 30 days are not factored into your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score).

Past data, such as alerts, vulnerabilities, and the device timeline, for an offboarded device is displayed in the Microsoft Defender portal until the [configured retention period](data-storage-privacy.md#data-retention) expires. You also see the device profile (without data) in the device inventory for up to 180 days. To view data for active devices only, you can use filters, such as [sensor health state](machines-view-overview.md#apply-filters), [device tags](machine-tags.md), or [device groups](machine-groups.md).

## Prerequisites

### Supported operating systems

- Windows client devices
- Windows Server 2012 R2 and later
- Azure Stack HCI OS, version 23H2 and later
- Mac devices
- Linux servers

## Offboard Windows client devices

In the [Microsoft Defender portal](https://security.microsoft.com), in the navigation pane, select **Settings** > **Offboard**, and then select an operating system to start the offboarding process.

You can also use other methods, such as:

- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)
- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)

## Offboard servers

In the [Microsoft Defender portal](https://security.microsoft.com), in the navigation pane, select **Settings** > **Offboard**, and then select an operating system to start the offboarding process.

You can also use other methods, such as:

- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using Configuration Manager](configure-endpoints-sccm.md#offboard-devices-using-configuration-manager)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)
- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)

## Offboard Mac devices

In the following procedure, steps 1 and 2 are optional if you do not want to see these devices that are retired in the "Device inventory" for 180 days.

1. Create a [device tag](machine-tags.md), and name the tag `decommissioned`. Assign the tag to the Mac devices that you want to offboard from Defender for Endpoint.

1. Create a [Device group](machine-groups.md) and name it something like, `Decommissioned Mac`. Assign this tag to an appropriate user group.

1. Remove policies for [Tamper Protection](tamperprotection-macos.md). See [Set preferences on Mac: Tamper protection](mac-preferences.md#tamper-protection) or use manual configuration.

1. In the [Microsoft Defender portal](https://security.microsoft.com), in the navigation pane, select **Settings** > **Endpoints** > **Device management** > **Offboarding**, and then select an operating system to start the offboarding process.

   Or, if you're using a non-Microsoft device management solution, disable integration with Defender for Endpoint.

     :::image type="content" source="media/offboard-machines/remove-endpoint.png" alt-text="Screenshot that shows how to offboard endpoints in the Microsoft Defender portal. " lightbox="media/offboard-machines/remove-endpoint.png":::  

1. Uninstall the Defender for Endpoint app on Mac devices.

1. Remove Mac devices from the group for system extension policies if an MDM was used to set them.

## Offboard Android or iOS devices

To offboard an Android or iOS device, uninstall the Microsoft Defender app on the device.
