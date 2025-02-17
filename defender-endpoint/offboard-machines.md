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
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 08/23/2024
---

# Offboard devices

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender XDR](/defender-xdr)

**Platforms**
- macOS
- Linux
- Windows Server 2012 R2
- Windows Server 2016

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

When you offboard a device from Defender for Endpoint, no new detections, vulnerability, or security data are sent to the Microsoft Defender portal. Seven days after offboarding a device, its status changes to [inactive](/defender-endpoint/fix-unhealthy-sensors#inactive-devices). Devices that weren't active within the past 30 days are not factored into your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score).

Past data, such as alerts, vulnerablities, and the device timeline, for an offboarded device is displayed in the Microsoft Defender portal until the [configured retention period](/defender-endpoint/data-storage-privacy#how-long-will-microsoft-store-my-data-what-is-microsofts-data-retention-policy) expires. You also see the device profile (without data) in the device inventory for up to 180 days. To view data for active devices only, you can use filters, such as [sensor health state](/defender-endpoint/machines-view-overview#use-filters-to-customize-the-device-inventory-views), [device tags](/defender-endpoint/machine-tags), or [device groups](/defender-endpoint/machine-groups).


## Offboard Windows devices

- [Offboard devices using a local script](configure-endpoints-script.md#offboard-devices-using-a-local-script)
- [Offboard devices using Group Policy](configure-endpoints-gp.md#offboard-devices-using-group-policy)
- [Offboard devices using Mobile Device Management tools](configure-endpoints-mdm.md#offboard-devices-using-mobile-device-management-tools)

## Offboard Servers

- [Offboard servers](configure-server-endpoints.md#offboard-windows-servers)

## Offboard non-Windows devices

- [Offboard non-Windows devices](configure-endpoints-non-windows.md#offboard-non-windows-devices)

## Offboard Android or iOS devices

To offboard an Android or iOS device, uninstall the Microsoft Defender app on the device.


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]


