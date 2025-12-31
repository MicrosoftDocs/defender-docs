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



Microsoft Defender for Endpoint device discovery helps you automatically find unmanaged devices connected to your corporate network—without extra appliances or complex setup. By leveraging onboarded endpoints, Defender for Endpoint can passively observe network traffic and actively probe the environment to identify endpoints, network devices, and IoT assets that may not be managed or protected.

Device discovery is designed to reduce blind spots in your environment, making it easier to identify, assess, and secure devices that could otherwise introduce risk. The feature works out-of-the-box for most organizations, with advanced configuration available for deeper insights and custom scenarios.


## What you get out-of-the-box and further configuration

Device discovery is enabled by default for all customers. Most organizations will immediately benefit from passive discovery, which identifies devices based on observed network traffic. For deeper insights, you can enable active (standard) discovery, which uses protocol-based probes to gather more information about devices—especially those without agents installed.

Out-of-the-box, you get:
- Automatic detection of unmanaged endpoints, network devices, and IoT assets
- Visibility into devices seen by onboarded endpoints
- Integration with device inventory for unified management

Further configuration options include:
- Switching between passive (basic) and active (standard) discovery modes
- Defining scan targets (IP ranges) and scan frequency
- Excluding specific IPs or device groups from scanning
- Assigning scanners per subnet or segment
- Enabling authenticated scanning for advanced scenarios (deprecated)

Unknown and unmanaged devices introduce significant risks to your network—such as unpatched printers, misconfigured network devices, or servers with no security controls. Device discovery enables you to:

- Build a complete inventory of all devices, including those not yet onboarded to Defender for Endpoint
- Identify and onboard unmanaged endpoints to increase security visibility
- Reduce the attack surface by detecting vulnerabilities and configuration gaps
- Monitor for rogue or unauthorized devices that could be used for lateral movement or attacks


## How device discovery works and discovery modes

Device discovery uses two main mechanisms, which map directly to the available discovery modes:

| Mode (UI)         | Mechanism         | Default | Description                                                                 | Use cases / Recommendations                |
|-------------------|-------------------|---------|-----------------------------------------------------------------------------|--------------------------------------------|
| Basic (Passive)   | Passive           | No      | Listens to network traffic, no probes sent.                                 | Sensitive/legacy networks, minimal impact. |
| Standard (Active) | Passive + Active  | Yes     | Listens to traffic and sends protocol-based probes for deeper identification.| Most environments, recommended.            |

**Passive discovery** is always enabled and non-intrusive. **Active discovery** (standard mode) adds protocol-based probes for more detailed device identification. You can switch between modes and further customize scan targets, frequency, and exclusions.

> [!IMPORTANT]
> Standard (active) discovery is the default for all customers. You can change to basic (passive) mode in settings if needed.

Authentication configuration is only required for advanced scenarios, such as enabling authenticated scanning (deprecated) or restricting certain device functionalities.

For more information, see [Configure device discovery](configure-device-discovery.md).

The discovery engine distinguishes between network events that are received in the corporate network versus outside of the corporate network. Devices that aren't connected to corporate networks won't be discovered or listed in the device inventory.


## Device discovery and device inventory in the user journey

All devices discovered—whether onboarded or not—are surfaced in the device inventory. This unified view allows you to:
- See both managed (onboarded) and unmanaged (discovered) devices in one place
- Filter and assess devices by onboarding status, OS, and other attributes
- Take action to onboard, investigate, or exclude devices as needed

The inventory experience is central to the device discovery journey, providing visibility, context, and management for all tracked devices. For more information, see [Device inventory](machines-view-overview.md).

:::image type="content" source="media/2b62255cd3a9dd42f3219e437b956fb9.png" alt-text="The device inventory dashboard" lightbox="media/2b62255cd3a9dd42f3219e437b956fb9.png":::


## Network scans and advanced discovery

In addition to out-of-the-box passive and active discovery, Defender for Endpoint supports network scans for deeper visibility into network devices (such as switches, routers, firewalls, and IoT assets). These scans are agentless and use a designated onboarded device to periodically probe preconfigured network devices using supported protocols.

Network scans allow you to:
- Discover and classify network infrastructure devices that cannot be onboarded
- Perform authenticated scans (using credentials) for more detailed information (feature being deprecated)
- Schedule scans and define scan targets beyond the default subnet

This additional layer of scanning helps ensure that critical network infrastructure is visible and included in your asset inventory, supporting vulnerability management and security workflows.



## Capabilities

The following table summarizes key device discovery capabilities and where to configure them:

| Capability                | Description                                                                 | Where to configure                |
|---------------------------|-----------------------------------------------------------------------------|-----------------------------------|
| Exclusions                | Exclude specific IPs or device groups from scanning                         | Device discovery settings         |
| Scanner assignment        | Assign scanners per subnet or segment                                       | Device discovery settings         |
| Segmentation              | Align scanner deployment with VLANs/subnets                                 | Device discovery settings         |
| Network list management   | Monitor or ignore specific networks (e.g., home/public Wi-Fi)               | Device discovery settings         |
| Automatic network handling| New networks are auto-detected and set to ignore by default                 | Device discovery (auto)           |


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

