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

To protect your environment, you need to take inventory of the devices in your network. However, mapping devices in a network can often be expensive, challenging, and time-consuming.

Microsoft Defender for Endpoint device discovery helps you automatically find unmanaged devices connected to your corporate network, without extra appliances or complex setup.

This article explains how device discovery works, describes the supported capabilities, and provides information on scanning and discovered assets.

## How device discovery works

Defender for Endpoint uses onboarded endpoints to passively observe network traffic and actively probe the environment to identify endpoints, network devices, and IoT assets that may not be managed or protected.

Device discovery is designed to reduce blind spots in your environment, making it easier to identify, assess, and secure devices that could otherwise introduce risk. The feature works as an out-of-the-box Defender for Endpoint capability, with advanced configuration available for deeper insights and custom scenarios.

The device discovery capability allows you to discover:

- Enterprise endpoints (workstations, servers, and mobile devices) that aren't yet onboarded to Defender for Endpoint
Network devices like routers and switches
- IoT devices like printers and cameras
- Unknown and unmanaged devices introduce significant risks to your network - whether it's an unpatched printer, network devices with weak security configurations, or a server with no security controls.

Once devices are discovered, you can:

- Onboard unmanaged endpoints to the service, increasing the security visibility on them.
- Reduce the attack surface by identifying and assessing vulnerabilities, and detecting configuration gaps.

Watch this video for a quick overview of how to assess and onboard unmanaged devices that Defender for Endpoint discovered.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=a101261e-87ab-4aa6-a1e1-c1463e797ca2]

With this capability, a security recommendation to onboard devices to Defender for Endpoint is available as part of the existing Microsoft Defender Vulnerability Management experience.

### Discovery modes and scans

Device discovery uses two main discovery modes. The mode controls the level of visibility you can get for unmanaged devices in your corporate network. You select the device discovery mode in the **System** > **Settings** > **Device discovery** > **Discovery mode** section.

| Mode         | Description                                                                | Use cases and recommendations                |
|:------------------|:---------------------------------------------------------------------------|:-------------------------------------------|
| Basic scan   | - Endpoints passively collect events in your network and extract device information from them.<br> - Uses the **SenseNDR.exe** binary for passive network data collection and no network traffic is initiated.<br>- Endpoints extract data from all network traffic seen by an onboarded device.<br> - Limited visibility of unmanaged endpoints in your network. | Sensitive/legacy networks, minimal impact. |
| Standard scan (default) | - Allows endpoints to actively find devices in your network to enrich collected data and discover more devices<br>- Uses common discovery protocols that use multicast queries in the network to find more devices.<br>- Uses smart, active probing to discover additional information about observed devices, and helps you build a coherent device inventory, enriching existing device information. | Most environments, recommended.  |

As an additional layer of discovery, authenticated network scans use designated onboarded devices to perform agentless network scans of preconfigured network devices using supported protocols. These scans are recommended for environments that need deeper visibility into network infrastructure devices.

## Discovered assets

The discovery engine distinguishes between network events that are received in the corporate network versus outside of the corporate network. Devices that aren't connected to corporate networks aren't discovered or listed in the device inventory.

## Capabilities and configuration options

Most organizations benefit from the out-of-the-box active discovery, device inventory integration, and automatic network handling. You can use additional configuration options for more granular control, targeting, and exclusions as needed for your environment.

This table summarizes which capabilities device discovery provides out-of-the-box, what each additional configuration option enables, and where you can change configurable options in the UI.

| Feature/option | Default | What it includes or enables | Additional configuration options/notes    | Where to configure in the Defender portal  |
|----------------------------|:---------------:|-------------------------------------------------------------------------------|--------------------------------------------------------|-----------------------------------------|
| Basic discovery   | No   | Detects unmanaged endpoints, network devices, IoT assets via traffic   | Can be used for sensitive/legacy networks (see [Discovery modes and scans](#discovery-modes-and-scans)) | **System** > **Settings** > **Device discovery** > **Discovery mode** > **Basic**      |
| Standard discovery | Yes  | Adds protocol-based probes for deeper device identification and richer inventory | Can be disabled (switch to **Basic** mode)               | **System** > **Settings** > **Device discovery** > **Discovery mode** > **Standard discovery (recommended)**          |
| Device inventory integration | Yes   | Unified view of onboarded and discovered devices | Filter, assess, and take action in inventory (see [Device discovery and the device inventory](#device-discovery-and-the-device-inventory))  | **Device inventory** |
| Network list management  | Yes | Monitors corporate networks, ignores non-corporate by default  | Can monitor/ignore specific networks | **System** > **Settings** > **Device discovery** > **Monitored networks**   |
| Exclusions  | No  | Exclude IPs or device groups from scanning. |     | **System** > **Settings** > **Device discovery** > **Exclusions** |
| Network scans  | No  | - Discover and classify network infrastructure devices that cannot be onboarded<br>- Schedule scans and define scan targets beyond the default subnet | **System** > **Settings** > **Device discovery** > **Device discovery** > **Authenticated scans**  |

## Device discovery and the device inventory

All discovered devices are displayed in the device inventory.

This unified view allows you to:

- See both managed (onboarded) and unmanaged (discovered) devices in one place
- Filter and assess devices by onboarding status, OS, and other attributes
- Take action to onboard, investigate, or exclude devices as needed

The device inventory experience is central to the device discovery journey, providing visibility, context, and management for all tracked devices. For more information, see [Device inventory](machines-view-overview.md).

:::image type="content" source="media/2b62255cd3a9dd42f3219e437b956fb9.png" alt-text="The device inventory dashboard" lightbox="media/2b62255cd3a9dd42f3219e437b956fb9.png":::

## OT/IoT device discovery

Defender for Endpoint integrates with Microsoft Defender for IoT to provide comprehensive discovery and security for:
- OT devices (e.g., industrial servers, packaging systems)
- Enterprise IoT devices (e.g., VoIP phones, printers, smart TVs)

This integration enables unified visibility and management of both IT and OT/IoT assets in the Microsoft Defender portal.

For more information, see [onboard Defender for IoT in the Defender portal](/defender-for-iot/get-started) and [Get started with Enterprise IoT security](/defender-for-iot/enterprise-iot-get-started).

## Licensing

The following table summarizes device discovery features by license:

| License                        | Device discovery | Network scans | OT/IoT integration | Vulnerability management | Advanced hunting |
|---------------------------------|------------------|---------------|--------------------|-------------------------|------------------|
| Defender for Endpoint Plan 2    | Yes              | Yes           | No                 | Yes                     | Yes              |
| Defender for Endpoint Plan 2 + IoT | Yes           | Yes           | Yes                | Yes                     | Yes              |
| Defender for IoT only           | No               | No            | Yes                | Yes                     | No               |

Some features (such as enterprise IoT vulnerability display) are controlled by toggles and may be off by default, depending on your license. Enabling these features may change the data shown in the inventory and UI.

## Configuration, management, and analysis

You can further configure, manage, and analyze device discovery to fit your organization's needs. Actions include:
- Adjusting discovery modes and scan settings
- Managing exclusions, scanner assignments, and network lists
- Integrating with OT/IoT discovery
- Reviewing and acting on device inventory

For advanced analysis, vulnerability assessment, and hunting queries, see [Configure device discovery](configure-device-discovery.md).

## Next steps

- [Configure device discovery](configure-device-discovery.md)
- [Device discovery FAQs](device-discovery-faq.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

