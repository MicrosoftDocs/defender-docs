---
title: Configure device discovery in Defender for Endpoint
description: Learn how to configure device discovery in Microsoft Defender XDR using basic or standard discovery
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
# Configure device discovery in Defender for Endpoint

[Device discovery](device-discovery.md) allows you to improve your visibility into unmanaged devices, assess their security posture, and take appropriate actions to secure them.

This article describes how to set up and configure device discovery in Microsoft Defender for Endpoint. 

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

## Control which devices perform standard discovery

To customize the list of devices used to perform standard discovery, do one of the following:

- Enable standard discovery on all onboarded devices that that support device discovery.
- Select a subset or subsets of your devices using device tags (see [Set up device discovery](configure-device-discovery.md#set-up-device-discovery)). In this case, all other devices run basic discovery only.

## Exclude devices from standard discovery

You might want to exclude specific devices in your network from active scans, for example, devices used as honeypots for another security tool.

Excluded devices might still be discovered by basic discovery, or through multicast discovery attempts. Defender for Endpoint passively discovers these devices, but doesn't actively probe them.

To exclude a device:

1. In the device discovery settings, select **Exclusions**.
1. Select **Add exclusion** and in the **Add exclusion** page, add IP addresses or subnets to exclude from standard scans.
1. (Optional)Add a description for the exclusion.
1. Select **Save**.

The exclusion is visible in the **Exclusions** list. You can select an exclusion in the list to view the exclusion details, edit, or delete the exclusion.

> [!NOTE]
>
> - Excluded devices might still reply to multicast discovery attempts in the network. These devices are discovered but aren't actively probed.
> - Because device discovery uses passive methods to discover devices in the network, any device that communicates with your onboarded devices in the corporate network can be discovered and listed in the inventory. You can exclude devices from active discovery only.

## View and manage monitored networks

The **Monitored networks** page shows a list of networks where device discovery is active.

> [!NOTE]
>
> - The list shows networks that were identified as corporate networks. If fewer than 50 networks are identified as corporate networks, then list shows up to 50 networks with the most onboarded devices.
> - The list of monitored networks is sorted based on the total number of devices seen on the network in the last seven days.

By default, Defender for Endpoint automatically monitors networks that are identified as corporate networks, and ignores non-corporate networks.

### Manage monitored networks

You might want to monitor a network, for example, if you have a new corporate office or a remote site that needs to be monitored. For more information, see [Monitored networks](device-discovery.md#monitored-networks).

To manage monitored networks, in the device discovery settings, select **Monitored networks**, select the three dots next to a name of a network, and select one of the following options.

| Option | Description | Notes |
|--------|-------------|-------|
| **Monitor this network** | Monitors a network that Defender for Endpoint doesn't monitor by default. | Monitoring a network not identified as corporate can trigger device discovery outside your corporate network, including home or other noncorporate devices. Ensure you have permission before monitoring non-corporate networks. |
| **Ignore this network from monitoring** | Stops monitoring and discovering devices in the network. | Discovered devices remain in inventory but are no longer updated. Details are retained until the Defender for Endpoint data retention period expires. |
| **Automatically monitor** | Sets the initial discovery classification for the network. |  |

### Filter network list

To filter the network list, select **Filter**, select the **Network monitor state** filter, and select **Apply**. In the network list, select the **Network monitor state** filter, and select a state:

- **Monitored**: Networks where device discovery is active.
- **Ignored**: Networks where device discovery isn't active.
- **All**: Shows both monitored and ignored networks.

## Disable device discovery

You can disable device discovery in the [Advanced features](advanced-features.md) page. When you disable device discovery, Defender for Endpoint doesn't discover devices in your network, but **SenseNDR.exe** still runs on the onboarded devices.

## Troubleshoot device discovery

### Security tool raises alert on UnicastScanner.ps1 / PSScript_{GUID}.ps1 or port scanning activity initiated by the security tool

The active probing scripts are signed by Microsoft and are safe. You can add the following path to your exclusion list:

`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\*.ps1`

## Unmanaged device health state is always "Active".

Temporarily, unmanaged device health state is "Active" during the standard retention period of the device inventory, regardless of their actual state.

## Next steps

- [Review and assess devices](assess-devices.md)