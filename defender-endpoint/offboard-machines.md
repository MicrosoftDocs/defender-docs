---
title: Offboard devices
description: Onboard Windows devices, servers, non-Windows devices from the Microsoft Defender for Endpoint service
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: article
ms.subservice: onboard
search.appverid: met150
ms.date: 03/17/2025
---

# Offboard devices

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**

- Microsoft Defender for Endpoint Plan 1 and 2
- Microsoft Defender for Endpoint for servers Plan 1 or Plan 2
- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender for Business
- Microsoft Defender Vulnerability Management
- Microsoft Defender XDR

**Platforms**

- Windows client devices
- Windows Server 2025
- Windows Server 2022
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 R2
- Mac devices
- Linux servers

When you offboard a device from Defender for Endpoint, no new detections, vulnerability, or security data are sent to the Microsoft Defender portal. Seven days after offboarding a device, its status changes to [inactive](/defender-endpoint/fix-unhealthy-sensors#inactive-devices). Devices that weren't active within the past 30 days are not factored into your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score).

Past data, such as alerts, vulnerabilities, and the device timeline, for an offboarded device is displayed in the Microsoft Defender portal until the [configured retention period](/defender-endpoint/data-storage-privacy#how-long-will-microsoft-store-my-data-what-is-microsofts-data-retention-policy) expires. You also see the device profile (without data) in the device inventory for up to 180 days. To view data for active devices only, you can use filters, such as [sensor health state](/defender-endpoint/machines-view-overview#use-filters-to-customize-the-device-inventory-views), [device tags](/defender-endpoint/machine-tags), or [device groups](/defender-endpoint/machine-groups).

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

1. Create a [device tag](/defender-endpoint/machine-tags), and name the tag `decommissioned`. Assign the tag to the Mac devices that you want to offboard from Defender for Endpoint.

2. Create a [Device group](/defender-endpoint/machine-groups) and name it something like, `Decommissioned Mac`. Assign this tag to an appropriate user group.
   
3. Remove policies for [Tamper Protection](/defender-endpoint/tamperprotection-macos). See [Set preferences on Mac: Tamper protection](/defender-endpoint/mac-preferences#tamper-protection) or use manual configuration.

4. In the [Microsoft Defender portal](https://security.microsoft.com), in the navigation pane, select **Settings** > **Offboard**, and then select an operating system to start the offboarding process. 

   Or, if you're using a non-Microsoft device management solution, disable integration with Defender for Endpoint.

5. Uninstall the Defender for Endpoint app on Mac devices.

6. Remove Mac devices from the group for system extension policies if an MDM was used to set them.

## Offboard Android or iOS devices

To offboard an Android or iOS device, uninstall the Microsoft Defender app on the device.


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
