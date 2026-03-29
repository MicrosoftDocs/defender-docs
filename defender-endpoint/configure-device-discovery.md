---
title: Configure device discovery in Microsoft Defender for Endpoint
description: Learn how to configure device discovery in Microsoft Defender XDR using basic or standard discovery
ms.service: defender-endpoint
ms.subservice: onboard
f1.keywords:
- NOCSH
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
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
# Manage device discovery in Microsoft Defender for Endpoint

[Device discovery](device-discovery.md) allows you to improve your visibility into unmanaged devices, assess their security posture, and take appropriate actions to secure them.

This article describes how to set up and configure device discovery in Microsoft Defender for Endpoint.

Learn about the [Supported operating systems](device-discovery.md#supported-operating-systems) for this feature.

## Set up device discovery

To set up device discovery:

1. In the Microsoft Defender portal, navigate to **Settings** > **Device discovery**.

1. If you've selected to use standard discovery, select which devices to use for active scanning:
    - Select **all devices (recommended)** to scan all devices.
    - Select **Select tags** to scan by device tags, and in the **Tags** page, select the tags. This option is useful to scan devices on a specific subnet.

    > [!TIP] 
    > While standard is the recommended mode, you can change to the basic mode if needed. For more information, see [Discovery modes and scans](device-discovery.md#discovery-modes-and-scans).

1. Select **Save**.

## Control which devices perform standard discovery

To customize the list of devices used to perform standard discovery, do one of the following:

- Enable standard discovery on all onboarded devices that support device discovery.
- Select a subset or subsets of your devices using device tags (see [Set up device discovery](configure-device-discovery.md#set-up-device-discovery)). In this case, all other devices run basic discovery only.

## Exclude devices from standard discovery

You might want to exclude specific devices in your network from active scans, for example, devices used as honeypots for another security tool.

Excluded devices might still be discovered by basic discovery, or through multicast discovery attempts. Defender for Endpoint passively discovers these devices, but doesn't actively scan them.

To exclude a device:

1. In the device discovery settings, select **Exclusions**.
1. Select **Add exclusion** and in the **Add exclusion** page, add IP addresses or subnets to exclude from standard scans.
1. Add a description for the exclusion.
1. Select **Save**.

The exclusion is visible in the **Exclusions** list. You can select an exclusion in the list to view the exclusion details, edit, or delete the exclusion.

> [!NOTE]
>
> - Excluded devices might still reply to multicast discovery attempts in the network. These devices are discovered but aren't actively scanned.
> - Because device discovery uses passive methods to discover devices in the network, any device that communicates with your onboarded devices in the corporate network can be discovered and listed in the inventory. You can exclude devices from active discovery only.

## View and manage monitored networks

The **Monitored networks** page shows a list of networks where device discovery is active.

By default, Defender for Endpoint automatically monitors networks that are identified as corporate networks, and ignores non-corporate networks.

The list sorts networks based on the total number of devices seen on the network in the last seven days. If fewer than 50 networks are identified as corporate networks, then list shows up to 50 networks with the most onboarded devices.

### Manage monitored networks

You might want to monitor a network, for example, if you have a new corporate office or a remote site that needs to be monitored. For more information, see [Monitored networks](device-discovery.md#monitored-networks).

To manage monitored networks, in the device discovery settings, select **Monitored networks**, select the three dots next to a name of a network, and select one of the following options.

| Option | Description | Notes |
|--------|-------------|-------|
| **Monitor this network** | Monitors a network that Defender for Endpoint doesn't monitor by default. | Monitoring a network not identified as corporate can trigger device discovery outside your corporate network, including home or other noncorporate devices. Ensure you have permission before monitoring non-corporate networks. |
| **Ignore this network from monitoring** | Stops monitoring and discovering devices in the network. | Discovered devices remain in inventory but are no longer updated. Details are retained until the Defender for Endpoint data retention period expires. |
| **Automatically monitor** | Automatically monitors a network that is identified as corporate. |  |

> [!IMPORTANT]
>
> - Choosing to monitor a network that wasn't identified by Microsoft Defender for Endpoint as a corporate network can cause device discovery outside of your corporate network, and can, therefore, detect home or other noncorporate devices.
> - Choosing to ignore a network stops monitoring and discovering devices in that network. Devices that were already discovered won't be removed from the inventory, but are no longer updated, and details are retained until the data retention period of the Defender for Endpoint expires.
> - Before choosing to monitor non-corporate networks, you must ensure you have permission to do so.

### Filter network list

To filter the network list, select **Filter**, select the **Network monitor state** filter, and select **Apply**. In the network list, select the **Network monitor state** filter, and select a state:

- **Monitored**: Networks where device discovery is active.
- **Ignored**: Networks where device discovery isn't active.
- **All**: Shows both monitored and ignored networks.

## Review and assess devices

To review and assess non-onboarded devices, and to find other device details, see [Review and assess devices](assess-devices.md).

## Disable device discovery

You can disable device discovery in the [Advanced features](advanced-features.md) page. When you disable device discovery, Defender for Endpoint doesn't discover devices in your network, but **SenseNDR.exe** still runs on the onboarded devices.

## Troubleshoot

If you encounter issues with device discovery or authenticated network scans, see [Troubleshoot device discovery and authenticated network scans](troubleshoot-device-discovery-network-scans.md).

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

### Get information on device

You can use the following advanced hunting query to get the latest complete information on a specific device.

```kusto
DeviceInfo
| where DeviceName == "<device name here>" and isnotempty(OSPlatform)
| summarize arg_max(Timestamp, *) by DeviceId
```

## See also

- [Device discovery overview](device-discovery.md)
- [Device discovery FAQs](device-discovery-faq.md)
- [Review and assess devices](assess-devices.md)