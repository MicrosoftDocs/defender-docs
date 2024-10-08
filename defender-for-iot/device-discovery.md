---
title: Device discovery for Microsoft Defender for IoT in the Defender portal
description: This article describes device discovery for Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/19/2024
ms.topic: conceptual
---

# Overview of device discovery

To protect your environment, you need to take inventory of the devices in your network. However, mapping these devices can often be expensive, challenging, and time-consuming.

Microsoft Defender for IoT in the Microsoft Defender portal integrates with [Microsoft Defender for Endpoint device discovery](/defender-endpoint/machines-view-overview#device-inventory-overview), allowing you to discover devices connected to your operational technologies (OT) network without using extra appliances or complex process changes. Defender for IoT uses onboarded endpoints to collect, probe, or scan your network to discover devices.

This article describes the benefits and capabilities of device discovery in Defender for IoT.

Learn how to [discover and manage your IoT/OT devices](manage-devices-inventory.md) in the device inventory.

[!INCLUDE [defender-iot-preview](../includes/defender-for-iot-defender-public-preview.md)]

## Device inventory: initial view

If you don't yet have a Defender for IoT license, the **Device inventory** page detects your OT devices and lists them with regular device data, but without security data. For example, the device name, IP, and category are visible, while the risk level isn't visible. The device inventory also displays a note at the top of the page that indicates the number of unprotected OT devices.

In this case, [onboard Defender for IoT](get-started.md) to get security value for your OT devices.

If you're seeing the message that indicates the number of unprotected OT devices, and you've already set up Defender for IoT, [set up a site](set-up-sites.md) and associate the relevant devices with it.

## Device inventory page

The **Device inventory** page helps you identify details about specific devices, such as manufacturer, type, serial number, firmware, and more. Using these details, you can track your devices, dive into device information, and identify potential threats or incompatibilities.

Learn how to [discover and manage your IoT/OT devices](manage-devices-inventory.md) in the device inventory.

Learn more about the [device inventory in Microsoft Defender for Endpoint](/defender-endpoint/machines-view-overview#device-inventory-overview).

## Device discovery capabilities

The key device discovery capabilities are:

|Capability|Description|
|---|---|
|OT device management|[Manage OT devices](manage-devices-inventory.md):<br>- Build an up-to-date inventory that includes all your managed and unmanaged devices.<br>- Discover your organization Building Management Systems (BMS) devices such as **Motion detector**, **Fire Alarm**, and **Elevators**.<br>- Classify critical devices to ensure that the most important assets in your organization are protected.<br>- Add organization-specific information to emphasize your organization preferences.|
|Device protection with risk-based approach|Identify risks such as missing patches, vulnerabilities and prioritize fixes based on risk scoring and automated threat modeling.|
|Device alignment with physical sites|Allows contextual security monitoring. Use the **Site** filter to manage each site separately. Learn more about [filters](/defender-endpoint/machines-view-overview#use-filters-to-customize-the-device-inventory-views).|
|Device groups|Allows different teams in your organization to monitor and manage relevant assets only. Learn more about [creating a device group](/defender-endpoint/machine-groups#create-a-device-group).|
|Device criticality|Reflects how critical a device is for your organization and allows you to identify a device as a business critical asset. Learn more about [device criticality](/defender-endpoint/machines-view-overview#device-inventory-overview).|

## Supported devices

Defender for IoT's device inventory supports the following device categories:

|Devices|Example|
|---|---|
|**Manufacturing**|Industrial and operational devices, such as pneumatic devices,  packaging systems, industrial packaging systems, industrial robots|
|**Building**|Access panels,  surveillance devices, HVAC systems, elevators, smart lighting systems|
|**Health care**|Glucose meters, monitors|
|**Transportation / Utilities**|Turnstiles, people counters, motion sensors, fire and safety systems, intercoms|
|**Energy and resources**|DCS controllers, PLCs, historian devices, HMIs|
|**Retail**|Barcode scanners, humidity sensor, punch clocks|

For Enterprise device discovery information, see [Enterprise device discovery](/defender-for-iot/enterprise-iot).

For Endpoint device discovery information, see [Endpoint device discovery](/defender-endpoint/device-discovery).

### Identified, unique devices

Defender for IoT can discover all devices, of any type, across all environments. Devices are listed in the Defender for IoT **Device inventory** pages based on a unique IP and MAC address coupling.

Defender for IoT identifies single and unique devices as follows:

|Type  |Description  |
|---------|---------|
|**Identified as individual devices**     |    Devices identified as *individual* devices include:<br>**OT or BMS unmanaged devices with one or more NICs**, including network infrastructure devices such as switches and routers<br><br>**Note**: A device with modules or backplane components, such as racks or slots, is counted as a single device, including all modules or backplane components.|
|**Not identified as individual devices**     | The following items *aren't* considered as individual devices, and don't count against your license:<br><br>- **Public internet IP addresses** <br>- **Multi-cast groups**<br>- **Broadcast groups**<br>- **Inactive devices**<br><br> Network-monitored devices are marked as *inactive* when there's no network activity detected within a specified time:<br><br> - **OT networks**: No network activity detected for more than 60 days<br><br>**Note**: Endpoints already managed by Defender for Endpoint aren't considered as separate devices by Defender for IoT.  |

## Next steps

[Discover and manage devices](manage-devices-inventory.md)
