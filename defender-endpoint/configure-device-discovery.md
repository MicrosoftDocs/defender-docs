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

[Device discovery](device-discovery.md) allows you to improve your visibility into unmanaged devices, assess their security posture, and take appropriate actions to secure them.

This article describes how to set up and configure device discovery in Microsoft Defender for Endpoint. You also learn how to get data on devices that aren't onboarded to Defender for Endpoint, and how to query data on discovered devices.

## Prerequisites

### Supported operating systems

- Windows 10 and later
- Windows Server 2019 and later.

## Set up device discovery

To set up device discovery:

1. In the Microsoft Defender portal, navigate to **Settings** > **Device discovery**.

1. If you've selected to use standard discovery, select which devices to use for active probing:
    - Select **all devices (recommended)** to scan all devices.
    - Select **Select tags** to scan by device tags, and in the **Tags** page, select the tags. This option is useful to scan devices on a specific subnet.

> [!TIP] 
> While standard is the recommended mode, you can change to the basic mode if needed. For more information, see [Discovery modes and scans](device-discovery.md#discovery-modes-and-scans).

1. Select **Save**.

> [!NOTE]
> Standard discovery uses various PowerShell scripts to actively probe devices in the network. These PowerShell scripts are signed by Microsoft, and are executed from the following location: `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\*.ps`. For example, `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\UnicastScannerV1.1.0.ps1`.

## Exclude devices from standard discovery

You might want to exclude specific devices in your network from active scans, for example, devices used as honeypots for another security tool.

Excluded devices might still be discovered by basic discovery, or through multicast discovery attempts. Defender for Endpoint passively discovers these devices, but doesn't actively probe them.

To exclude a device:

1. In the device discovery settings, select **Exclusions**.
1. Select **Add exclusion** and in the **Add exclusion** page, add IP addresses or subnets to exclude from standard scans.
1. (Optional)Add a description for the exclusion.
1. Select **Save**.

The exclusion is visible in the **Exclusions** list. You can select an exclusion in the list to view the exclusion details, edit, or delete the exclusion.

## Select networks to monitor

The **Monitored networks** page shows a list of networks where device discovery is active.

> [!NOTE]
>
> - The list shows networks that were identified as corporate networks. If fewer than 50 networks are identified as corporate networks, then list shows up to 50 networks with the most onboarded devices.
> - The list of monitored networks is sorted based on the total number of devices seen on the network in the last seven days.

You might want to add a network to the list, for example, if you have a new corporate office or a remote site that needs to be monitored. For more information, see [Monitored networks](device-discovery.md#monitored-networks).

To manage monitored networks, in the device discovery settings, select **Monitored networks**.

- To monitor a network, select the three dots next to the name of the network you want to monitor, and select **Monitor this network**.
- To ignore a monitored network, select the three dots next to the name of the network you want to ignore, and select **Ignore this network from monitoring**.
- To automatically monitor a network, select the three dots next to the name of the network you want to set to initial discovery classification, and select **Automatically monitor**.
- To filter the view, select **Filter**, add the **Network monitor state** filter, and select one of the states:
    - **Monitored networks** - Networks where device discovery is performed.
    - **Ignored networks** - This network is ignored and device discovery isn't performed on it.
    - **All** - Both monitored and ignored networks are displayed.

### Configure the network monitor state

You control where device discovery takes place. Monitored networks are where device discovery is performed and are typically corporate networks. You can also choose to ignore networks or select the initial discovery classification after modifying a state.

Choosing the initial discovery classification means to apply the default system-made network monitor state. Selecting the default system-made network monitor state means that networks that were identified to be corporate, are monitored, and ones identified as noncorporate, are ignored automatically.

1. Select **Settings > Device discovery**.

1. Select **Monitored networks**.

1. View the list of networks.

1. Select the three dots next to the network name.

1. Choose whether you want to monitor, ignore, or use the initial discovery classification.

   > [!WARNING]
   >
   > - Choosing to monitor a network that wasn't identified by Microsoft Defender for Endpoint as a corporate network can cause device discovery outside of your corporate network, and can, therefore, detect home or other noncorporate devices.
   > - Choosing to ignore a network stops monitoring and discovering devices in that network. Devices that were already discovered won't be removed from the inventory, but are no longer updated, and details are retained until the data retention period of the Defender for Endpoint expires.
   > - Before choosing to monitor non-corporate networks, you must ensure you have permission to do so. <br>

1. Confirm that you want to make the change.

## Review devices that aren't onboarded to Defender for Endpoint

Devices that were discovered but aren't onboarded to and secured by Defender for Endpoint are listed in the device inventory.

To assess these devices, you can use a filter in the device inventory list named **Onboarding status**, which can have any of the following values:

- **Onboarded**: The endpoint is onboarded to Defender for Endpoint.
- **Can be onboarded**: The endpoint was discovered in the network and the Operating System was identified as one that is supported by Defender for Endpoint, but it isn't currently onboarded. We highly recommend onboarding these devices.
- **Unsupported**: The endpoint was discovered in the network but isn't supported by Defender for Endpoint.
- **Insufficient info**: The system couldn't determine the supportability of the device. Enabling standard discovery on more devices in the network can enrich the discovered attributes.

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

## Vulnerability assessment on discovered devices

Vulnerabilities and risks on your devices as well as other discovered unmanaged devices in the network are part of the current Defender Vulnerability Management flows under "Security Recommendations" and represented in entity pages across the portal.
Search for "SSH" related security recommendations to find SSH vulnerabilities that are related for unmanaged and managed devices.

:::image type="content" source="media/1156c82ffadd356ce329d1cf551e806c.png" alt-text="The security recommendations dashboard" lightbox="media/1156c82ffadd356ce329d1cf551e806c.png":::

## See also

- [Device discovery overview](device-discovery.md)
- [Device discovery FAQs](device-discovery-faq.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

