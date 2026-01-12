---
title: Review and assess devices in Defender for Endpoint
description: Learn how to review and assess devices discovered by device discovery.
ms.service: defender-endpoint
ms.subservice: onboard
f1.keywords:
- NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
search.appverid: met150
ms.date: 01/12/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Review and assess devices in Defender for Endpoint

[Device discovery](device-discovery.md) allows you to improve your visibility into unmanaged devices, assess their security posture, and take appropriate actions to secure them.

This article describes how to review and assess devices discovered by device discovery in Microsoft Defender for Endpoint. You also learn how to get data on devices that aren't onboarded to Defender for Endpoint, and how to query data on discovered devices.

## Prerequisites

### Supported operating systems

- Windows 10 and later
- Windows Server 2019 and later.

## Monitor non-onboarded devices in the device inventory

You can review the device inventory for discovered devices that aren't onboarded to Defender for Endpoint.

To assess these devices, navigate to the device inventory, and use the **Onboarding status** filter, with one of the following values:

- **Onboarded**: The endpoint is onboarded to Defender for Endpoint.
- **Can be onboarded**: Defender for Endpoint discovers the device in the network and supports its operating system, but the device isn't onboarded. We highly recommend you onboard such devices.
- **Unsupported**: Defender for Endpoint discovers the endpoint, but doesn't support the device.
- **Insufficient info**: The system couldn't determine the supportability of the device. Enable standard discovery on more devices in the network to enrich the discovered attributes.

:::image type="content" source="media/2b62255cd3a9dd42f3219e437b956fb9.png" alt-text="The device inventory dashboard" lightbox="media/2b62255cd3a9dd42f3219e437b956fb9.png":::

## Use advanced hunting on discovered devices

You can use advanced hunting queries to gain visibility on discovered devices. Find details about discovered devices in the DeviceInfo table, or network-related information about those devices, in the DeviceNetworkInfo table.

:::image type="content" source="media/f48ba1779eddee9872f167453c24e5c9.png" alt-text="The Advanced hunting page on which queries can be used" lightbox="media/f48ba1779eddee9872f167453c24e5c9.png":::

### Explore devices in the network

You can use the following advanced hunting query to get more context about each network name described in the networks list. The query lists all the onboarded devices that were connected to a certain network within the last seven days.

```kusto
DeviceNetworkInfo
| where Timestamp > ago(7d)
| where ConnectedNetworks  != ""
| extend ConnectedNetworksExp = parse_json(ConnectedNetworks)
| mv-expand bagexpansion = array ConnectedNetworks=ConnectedNetworksExp
| extend NetworkName = tostring(ConnectedNetworks ["Name"]), Description = tostring(ConnectedNetworks ["Description"]), NetworkCategory = tostring(ConnectedNetworks ["Category"])
| where NetworkName == "<your network name here>"
| summarize arg_max(Timestamp, *) by DeviceId
```

### Get information on device

You can use the following advanced hunting query to get the latest complete information on a specific device.

```kusto
DeviceInfo
| where DeviceName == "<device name here>" and isnotempty(OSPlatform)
| summarize arg_max(Timestamp, *) by DeviceId
```

### Query discovered devices details

Run this query on the DeviceInfo table to return all discovered devices along with the most up-to-date details for each device:

```query
DeviceInfo
| summarize arg_max(Timestamp, *) by DeviceId  // Get latest known good per device Id
| where isempty(MergedToDeviceId) // Remove invalidated/merged devices
| where OnboardingStatus != "Onboarded"
```

By invoking the **SeenBy** function, in your advanced hunting query, you can get detail on which onboarded device a discovered device was seen by. This information can help determine the network location of each discovered device and subsequently, help to identify it in the network.

```query
DeviceInfo
| where OnboardingStatus != "Onboarded"
| summarize arg_max(Timestamp, *) by DeviceId 
| where isempty(MergedToDeviceId) 
| limit 100
| invoke SeenBy()
| project DeviceId, DeviceName, DeviceType, SeenBy
```

For more information, see the [SeenBy()](/defender-xdr/advanced-hunting-seenby-function) function.

### Query network related information

Device discovery leverages Defender for Endpoint onboarded devices as a network data source to attribute activities to non-onboarded devices. The network sensor on the Defender for Endpoint onboarded device identifies two new connection types:

- ConnectionAttempt - An attempt to establish a TCP connection (syn)
- ConnectionAcknowledged - An acknowledgment that a TCP connection was accepted (syn\ack)

This means that when a non-onboarded device attempts to communicate with an onboarded Defender for Endpoint device, the attempt generates a DeviceNetworkEvent and the  non-onboarded device activities can be seen on the onboarded device timeline, and through the Advanced hunting DeviceNetworkEvents table.

You can try this example query:

```text
DeviceNetworkEvents
| where ActionType == "ConnectionAcknowledged" or ActionType == "ConnectionAttempt"
| take 10
```

## Assess vulnerabilities on discovered devices

Microsoft Defender Vulnerability Management detects risks on your devices and other discovered, unmanaged devices in the network.

To review relevant vulnerabilities, see the **Exposure management** > **Recommendations** page, and other entity pages across the Defender portal.

For example, search for **SSH** in the security recommendations list to find SSH vulnerabilities related to unmanaged and managed devices.

For more information on vulnerability management features, see [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management).

:::image type="content" source="media/1156c82ffadd356ce329d1cf551e806c.png" alt-text="The security recommendations dashboard" lightbox="media/1156c82ffadd356ce329d1cf551e806c.png":::