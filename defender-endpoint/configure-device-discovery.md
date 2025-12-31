---
title: Configure device discovery in Defender for Endpoint
description: Learn how to configure device discovery in Microsoft Defender XDR using basic or standard discovery
ms.service: defender-endpoint
ms.subservice: onboard
f1.keywords:
- NOCSH
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
search.appverid: met150
ms.date: 10/20/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Configure device discovery in Defender for Endpoint


Device discovery can be configured to be on standard or basic mode. Use the standard option to actively find devices in your network, which helps improve the discovery of endpoints and provide richer device classification.

You can customize the list of devices that are used to perform standard discovery. You can either enable standard discovery on all the onboarded devices that also support this capability, or you can select a subset of devices by specifying their device tags.

## Prerequisites

### Supported operating systems



## Analyze and hunt on discovered devices

You can assess vulnerabilities and perform advanced analysis on discovered devices using Defender for Endpoint's vulnerability management and advanced hunting capabilities.

### Vulnerability assessment on discovered devices
Vulnerabilities and risks on your devices as well as other discovered unmanaged devices in the network are part of the current Defender Vulnerability Management flows under "Security Recommendations" and represented in entity pages across the portal. Search for "SSH" related security recommendations to find SSH vulnerabilities that are related for unmanaged and managed devices.

:::image type="content" source="media/1156c82ffadd356ce329d1cf551e806c.png" alt-text="The security recommendations dashboard" lightbox="media/1156c82ffadd356ce329d1cf551e806c.png":::

### Use advanced hunting on discovered devices
You can use advanced hunting queries to gain visibility on discovered devices. Find details about discovered devices in the DeviceInfo table, or network-related information about those devices, in the DeviceNetworkInfo table.

:::image type="content" source="media/f48ba1779eddee9872f167453c24e5c9.png" alt-text="The Advanced hunting page on which queries can be used" lightbox="media/f48ba1779eddee9872f167453c24e5c9.png":::

#### Query discovered devices details
Run this query on the DeviceInfo table to return all discovered devices along with the most up-to-date details for each device:

```kusto
DeviceInfo
| summarize arg_max(Timestamp, *) by DeviceId  // Get latest known good per device Id
| where isempty(MergedToDeviceId) // Remove invalidated/merged devices
| where OnboardingStatus != "Onboarded"
```

By invoking the **SeenBy** function, in your advanced hunting query, you can get detail on which onboarded device a discovered device was seen by. This information can help determine the network location of each discovered device and subsequently, help to identify it in the network.

```kusto
DeviceInfo
| where OnboardingStatus != "Onboarded"
| summarize arg_max(Timestamp, *) by DeviceId 
| where isempty(MergedToDeviceId) 
| limit 100
| invoke SeenBy()
| project DeviceId, DeviceName, DeviceType, SeenBy
```

For more information, see the [SeenBy()](/defender-xdr/advanced-hunting-seenby-function) function.

#### Query network related information
Device discovery leverages Defender for Endpoint onboarded devices as a network data source to attribute activities to non-onboarded devices. The network sensor on the Defender for Endpoint onboarded device identifies two new connection types:

- ConnectionAttempt - An attempt to establish a TCP connection (syn)
- ConnectionAcknowledged - An acknowledgment that a TCP connection was accepted (syn\ack)

This means that when a non-onboarded device attempts to communicate with an onboarded Defender for Endpoint device, the attempt generates a DeviceNetworkEvent and the non-onboarded device activities can be seen on the onboarded device timeline, and through the Advanced hunting DeviceNetworkEvents table.

You can try this example query:

```kusto
DeviceNetworkEvents
| where ActionType == "ConnectionAcknowledged" or ActionType == "ConnectionAttempt"
| take 10
```

## Explore devices in the network

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

## Get information on device

You can use the following advanced hunting query to get the latest complete information on a specific device.

```kusto
DeviceInfo
| where DeviceName == "<device name here>" and isnotempty(OSPlatform)
| summarize arg_max(Timestamp, *) by DeviceId
```


## Vulnerability assessment on discovered devices

Vulnerabilities and risks on your devices as well as other discovered unmanaged devices in the network are part of the current Defender Vulnerability Management flows under "Security Recommendations" and represented in entity pages across the portal.
Search for "SSH" related security recommendations to find SSH vulnerabilities that are related for unmanaged and managed devices.

:::image type="content" source="media/1156c82ffadd356ce329d1cf551e806c.png" alt-text="The security recommendations dashboard" lightbox="media/1156c82ffadd356ce329d1cf551e806c.png":::

## Use advanced hunting on discovered devices

You can use advanced hunting queries to gain visibility on discovered devices. Find details about discovered devices in the DeviceInfo table, or network-related information about those devices, in the DeviceNetworkInfo table.

:::image type="content" source="media/f48ba1779eddee9872f167453c24e5c9.png" alt-text="The Advanced hunting page on which queries can be used" lightbox="media/f48ba1779eddee9872f167453c24e5c9.png":::

### Query discovered devices details

Run this query on the DeviceInfo table to return all discovered devices along with the most up-to-date details for each device:

```kusto
DeviceInfo
| summarize arg_max(Timestamp, *) by DeviceId  // Get latest known good per device Id
| where isempty(MergedToDeviceId) // Remove invalidated/merged devices
| where OnboardingStatus != "Onboarded"
```

By invoking the **SeenBy** function, in your advanced hunting query, you can get detail on which onboarded device a discovered device was seen by. This information can help determine the network location of each discovered device and subsequently, help to identify it in the network.

```kusto
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

```kusto
DeviceNetworkEvents
| where ActionType == "ConnectionAcknowledged" or ActionType == "ConnectionAttempt"
| take 10
```

---

- [Device discovery overview](device-discovery.md)
- [Device discovery FAQs](device-discovery-faq.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

