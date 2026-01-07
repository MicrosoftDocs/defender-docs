---
title: Device discovery overview
description: Learn how to use endpoint discovery in Microsoft Defender XDR to find unmanaged devices in your network.
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
- m365initiative-m365-defender
- m365-initiative-defender-endpoint
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: concept-article
search.appverid: met150
ms.date: 05/08/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Device discovery overview

In today's dynamic IT environments, many organizations struggle to get full visibility of all of their devices and assets. Device diversity, shadow IT, remote work, and rapid change create gaps that expose organizations to security risks.

Microsoft Defender for Endpoint device discovery gives you direct insight into unmanaged devices on your network. You can identify risks and act quickly, without extra appliances or complex setup.

Device discovery is designed to reduce blind spots in your environment, making it easier to identify, assess, and secure devices that could otherwise introduce risk. The feature works as an out-of-the-box Defender for Endpoint capability, with advanced configuration available for deeper insights and custom scenarios.

This article explains how device discovery works, describes the supported capabilities, and provides information on scanning and discovered assets.

## How device discovery works

Defender for Endpoint uses onboarded endpoints to passively observe network traffic and actively probe the environment to identify endpoints, network devices, and IoT assets that may not be managed or protected.

Here's a high level flow that describes how device discovery works:

1. Defender for Endpoint scans your environment and identifies unmanaged devices by analyzing network traffic and using active probing techniques.
1. Defender for Endpoint classifies the discovered devices and adds them to the device inventory, which provides visibility for devices that aren't onboarded.
1. You can view devices that aren't onboarded in the device inventory, and onboard these devices to increase your security posture and reduce risk.
1. You can also configure the device discovery capability: Change the scan mode, add exclusions and trusted networks, enable network scans and more. For more information, see [Configure device discovery](configure-device-discovery.md).

Watch this video for a quick overview of how to assess and onboard unmanaged devices that Defender for Endpoint discovered.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=a101261e-87ab-4aa6-a1e1-c1463e797ca2]

With this capability, a security recommendation to onboard devices to Defender for Endpoint is available as part of the existing Microsoft Defender Vulnerability Management experience.

### Discovered assets

Unknown and unmanaged devices introduce significant risks to your network - whether it's an unpatched printer, network devices with weak security configurations, or a server with no security controls.

Defender for Endpoint discovers:

- Enterprise endpoints (workstations, servers, and mobile devices) that aren't yet onboarded to Defender for Endpoint
- Network devices like routers and switches
- IoT devices like printers and cameras 

### Discovery modes and scans

Device discovery uses two main discovery modes. The mode controls the level of visibility you can get for unmanaged devices in your corporate network. You select the device discovery mode in the **System** > **Settings** > **Device discovery** > **Discovery mode** section.

| Mode | Description   | Use cases and recommendations  |
|:------------------|:---------------------------------------------------------------------------|:-------------------------------------------|
| Basic scan   | - Passively collects events in your network and extract device information.<br>- Extracts data from all network traffic seen by an onboarded device.<br>- Uses the **SenseNDR.exe** binary for passive network data collection; no network traffic is initiated.<br>- Provides limited visibility of unmanaged endpoints in your network. | Sensitive/legacy networks, minimal impact. |
| Standard scan (default) | - Actively finds devices in your network to enrich collected data and discover more devices.<br>- Uses common discovery protocols and runs multicast queries in the network to find more devices.<br>- Uses active probing to discover more information about observed devices.<br>- Helps you build a coherent device inventory, enriching existing device information. | Most environments, recommended.  |

#### Authenticated network scans

As an additional layer of discovery, [authenticated network scans](network-devices.md) use designated onboarded devices to perform agentless network scans of preconfigured network devices using supported protocols. These scans are recommended for environments that need deeper visibility into network infrastructure devices.

Network devices aren't managed as standard endpoints, as Defender for Endpoint doesn't have a sensor built into the network devices themselves. These types of devices require an agentless approach where a remote scan obtains the necessary information from the devices. To do this, a designated Defender for Endpoint device is used on each network segment to perform periodic authenticated scans of preconfigured network devices. Defender for Endpoint's vulnerability management capabilities provide integrated workflows to secure discovered switches, routers, WLAN controllers, firewalls, and VPN gateways.

For more information, see [Network devices](network-devices.md).

### Monitored networks

Microsoft Defender for Endpoint analyzes a network and determines if it's a corporate network that needs to be monitored or a non-corporate network that can be ignored. Devices that aren't connected to corporate networks aren't discovered or listed in the device inventory.

To identify a network as corporate, Defender for Endpoint correlates network identifiers across all of the tenant's clients. If most of the devices in the organization report that they're connected to the same network name, with the same default gateway and DHCP server address, Defender for Endpoint assumes that the network is a corporate network. 

To override this setting, you can add networks to the monitored list. For more information, see [Select networks to monitor](configure-device-discovery.md#select-networks-to-monitor).

## Capabilities and configuration options

Most organizations benefit from the out-of-the-box active discovery, device inventory integration, and automatic network handling. You can use additional configuration options for more granular control, targeting, and exclusions as needed for your environment.

This table summarizes which capabilities device discovery provides out-of-the-box, what each additional configuration option enables, and where you can change configurable options in the UI.

For advanced analysis, vulnerability assessment, and hunting queries, see [Configure device discovery](configure-device-discovery.md).

| Feature/option | Default | What it includes or enables | Where to configure in the Defender portal  | More information |
|----------------------------|:---------------:|-------------------------------------------------------------------------------|-----------------------------------------|------------------|
| Basic discovery   | No   | Detects unmanaged endpoints, network devices, IoT assets via traffic. Can be used for sensitive/legacy networks. | **System** > **Settings** > **Device discovery** > **Discovery mode** > **Basic**      | [Discovery modes and scans](#discovery-modes-and-scans) |
| Standard discovery | Yes  | Adds protocol-based probes for deeper device identification and richer inventory. Can be disabled (switch to **Basic** mode). | **System** > **Settings** > **Device discovery** > **Discovery mode** > **Standard discovery (recommended)**          |[Discovery modes and scans](#discovery-modes-and-scans)  |
| Device inventory integration | Yes   | Unified view of onboarded and discovered devices. Filter, assess, and take action in inventory. | **Assets** > **Devices** | [Review devices that aren't onboarded](configure-device-discovery.md#review-devices-that-arent-onboarded-to-defender-for-endpoint) |
| Network list management  | Yes | Monitors corporate networks, ignores non-corporate by default. Can monitor/ignore specific networks. | **System** > **Settings** > **Device discovery** > **Monitored networks**   |[Network list management](configure-device-discovery.md#select-networks-to-monitor)  |
| Exclusions  | No  | Exclude IPs or device groups from scans. | **System** > **Settings** > **Device discovery** > **Exclusions** |[Exclude devices](configure-device-discovery.md#exclude-devices-from-being-actively-probed-in-standard-discovery)  |
| Network scans  | No  | - Discover and classify network infrastructure devices that cannot be onboarded.<br>- Schedule scans and define scan targets beyond the default subnet. | **System** > **Settings** > **Device discovery** > **Device discovery** > **Authenticated scans**  |[Network device discovery and vulnerability management](network-devices.md)  |
| OT/IoT device discovery | No | Integrate with Defender for IoT to discover OT and enterprise IoT devices. | **System** > **Settings** > **Device discovery** > **Enterprise IoT** | [Onboard Defender for IoT in the Defender portal](/defender-for-iot/get-started) |
| Vulnerability assessment | Yes | Assess vulnerabilities on discovered devices and get remediation guidance. For example, search for **SSH** to find recommendations on SSH vulnerabilities related to unmanaged devices. | **Exposure management > Recommendations** | [Vulnerability management overview](/defender-vulnerability-management/vulnerability-management-overview) |
| Advanced hunting on discovered devices | Yes | Use advanced hunting queries to investigate discovered devices, their activities, and related threats. | **Advanced hunting** | [Use advanced hunting on discovered devices](configure-device-discovery.md#use-advanced-hunting-on-discovered-devices) |

## Device discovery capabilities by license

The following table summarizes device discovery capabilities by license:

| License                        | Device discovery | Network scans | Enterprise IoT/OT integration | Vulnerability management | Advanced hunting |
|---------------------------------|------------------|---------------|--------------------|-------------------------|------------------|
| Defender for Endpoint Plan 2    | Yes              | Yes           | No                 | Yes                     | Yes              |
| Defender for Endpoint Plan 2 + IoT | Yes           | Yes           | Yes                | Yes                     | Yes              |
| Defender for IoT only           | No               | No            | Yes                | Yes                     | No               |

Some features (such as enterprise IoT vulnerability display) are controlled by toggles and may be off by default, depending on your license. Enabling these features may change the data shown in the inventory and UI.

## Next steps

- [Configure device discovery](configure-device-discovery.md)
- [Device discovery FAQs](device-discovery-faq.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

