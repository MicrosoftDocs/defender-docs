---
title: Microsoft Defender for Endpoint device discovery overview
description: Learn how to use endpoint discovery in Microsoft Defender XDR to find unmanaged devices in your network.
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection:
- m365-security
- m365initiative-m365-defender
- m365-initiative-defender-endpoint
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: concept-article
ms.date: 05/08/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Microsoft Defender for Endpoint device discovery overview

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

## Discovered assets

Unknown and unmanaged devices introduce significant risks to your network - whether it's an unpatched printer, network devices with weak security configurations, or a server with no security controls.

Defender for Endpoint discovers:

- Enterprise endpoints (workstations, servers, and mobile devices) that aren't yet onboarded to Defender for Endpoint
- Network devices like routers and switches
- IoT devices like printers and cameras

### Discovered IoT and OT devices

Defender for Endpoint can discover a wide range of Internet of Things (IoT) and Operational Technology (OT) devices in your network, including printers, cameras, medical devices, industrial control systems (ICS), and more. These devices often have unique characteristics and may not support traditional security agents, making them challenging to monitor and protect. To detect these devices, you need to [onboard Defender for IoT in the Defender portal](/defender-for-iot/get-started).

## Discovery modes and scans

Device discovery uses two main discovery modes. The mode controls the level of visibility you can get for unmanaged devices in your corporate network. 

You select the device discovery mode in the **System** > **Settings** > **Device discovery** > **Discovery mode** section. For more information, see [Set up device discovery](configure-device-discovery.md#set-up-device-discovery).

| Mode | Description | How it works | Considerations and actions | Use cases and recommendations |
|:------------------|:------------|:--------------|:--------------|:-----------------------------|
| Standard scan (default) | Active scan that enriches device data and discovers more devices using network protocols and active scanning. | - Uses common discovery protocols and multicast queries to find devices.<br>- Actively scans observed devices for more information.<br>- Scans devices when characteristics change, typically no more than once every three weeks. | - Active scanning can generate up to 50KB of traffic between the onboarded device and the scanned device per attempt.<br>- Standard discovery uses various PowerShell scripts to actively scan devices in the network. These PowerShell scripts are signed by Microsoft, and are executed from the following location: `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\*.ps`. For example, `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\UnicastScannerV1.1.0.ps1`.<br>- To customize which devices perform standard discovery, see [Control which devices perform standard discovery](configure-device-discovery.md#control-which-devices-perform-standard-discovery).<br>- To exclude targets from standard discovery, see [Exclude devices](configure-device-discovery.md#exclude-devices-from-standard-discovery). | - Highly recommended for building a reliable and coherent device inventory.<br>- In almost all cases, organizations should have no security concerns around enabling standard discovery. For more information, see [Security considerations for standard discovery](#security-considerations-for-standard-discovery). |
| Basic scan | Passive scan that collects network events and device information without sending probes. | - Passively collects events and extracts device information from all network traffic seen by onboarded devices.<br>- Uses the **SenseNDR.exe** binary for passive network data collection.<br>- No network traffic is initiated by the scan. |Because device discovery uses passive methods to discover devices in the network, any device that communicates with your onboarded devices in the corporate network can be discovered and listed in the inventory. You can exclude devices from standard (active) scans only. | - Recommended for sensitive/legacy networks.<br>- Provides limited visibility of unmanaged endpoints. |

### Security considerations for standard discovery

When considering standard discovery, you may be wondering about the implications of probing, and specifically whether security tools might suspect such activity as malicious. In almost all cases, organizations should have no concerns around enabling standard discovery.  

- Probing unmanaged devices is infrequent and lightweight: Each unmanaged device is typically scanned no more than once every three weeks, generating less than 50KB of traffic per attempt. In contrast, malicious activity produces much more frequent and voluminous network traffic, which is easily detected by monitoring tools.

- Active discovery is a standard Windows feature: Windows and many other platforms have long included active discovery to find nearby devices for functions like file sharing and printer discovery. Defender for Endpoint leverages these same methods, so network monitoring tools treat this activity as normal.

- Only unmanaged devices are targeted: Device discovery intentionally avoids scanning devices that are already onboarded with Defender for Endpoint. Only unmanaged or unknown devices are subject to active scanning.

- You can exclude specific devices or subnets: If you have network lures or sensitive devices, you can configure exclusions in Device Discovery settings. Excluded devices are not actively scanned and are only discovered passively, similar to basic discovery mode.

### Authenticated network scans

Authenticated network scans provide an agentless way to discover and assess network infrastructure devices, such as switches, routers, WLAN controllers, firewalls, and VPN gateways. Designated onboarded devices in your environment periodically scan preconfigured network devices using supported protocols, offering deeper visibility into your network beyond what standard endpoint sensors can provide.

Because network devices typically do not support onboarded sensors, Defender for Endpoint relies on remote, authenticated scans to gather information. On each network segment, one or more onboarded Windows devices act as scanning devices, performing these scans at regular intervals. Once discovered and classified, network devices are integrated into Defender for Endpoint's vulnerability management workflows, enabling security administrators to receive recommendations and review vulnerabilities.

Authenticated scans use SNMP (read-only) and support both SNMPv2 and SNMPv3. The process requires you to designate which onboarded devices will act as scanners and to specify the network devices you want to scan. This approach ensures that even agentless infrastructure is included in your security and vulnerability management strategy.

Once the network devices are discovered and classified, security administrators can receive the latest security recommendations and review recently discovered vulnerabilities on network devices deployed across their organizations.

> [!NOTE]
> The Windows authenticated scan is deprecated from December 18, 2025. For more information, see [Windows authenticated scan deprecation FAQs](/defender-vulnerability-management/defender-vulnerability-management-faq#windows-authenticated-scan-deprecation-faqs).

For information on how to initiate network scans, see [Set up authenticated network scans](network-devices.md).

## Monitored networks

Microsoft Defender for Endpoint analyzes a network and determines if it's a corporate network that needs to be monitored or a non-corporate network that can be ignored. Devices that aren't connected to corporate networks aren't discovered or listed in the device inventory.

To identify a network as corporate, Defender for Endpoint correlates network identifiers across all of the tenant's clients. If most of the devices in the organization report that they're connected to the same network name, with the same default gateway and DHCP server address, Defender for Endpoint assumes that the network is a corporate network.

Private network devices aren't listed in the inventory and aren't actively scanned.

To override this setting, you can add networks to the monitored list. For more information, see [Select networks to monitor](configure-device-discovery.md#view-and-manage-monitored-networks).

## Supported operating systems and protocols

To address the challenge of gaining enough visibility to locate, identify, and secure your complete OT/IOT asset inventory Defender for Endpoint supports the following integration:

### Supported operating systems

- Windows 10 version 1809 or later
- Windows 11
- Windows Server 2019 and later
- Azure Stack HCI OS, version 23H2 and later

### Supported protocols

The following table shows which protocols are supported by each discovery mode:

| Protocol      | Basic discovery | Standard discovery |
|-------------- |:--------------:|:-----------------:|
| AFP           | No             | Yes               |
| ARP           | Yes            | Yes               |
| CDP           | Yes            | No                |
| DHCP          | Yes            | Yes               |
| DHCPv6        | Yes            | No                |
| FTP           | No             | Yes               |
| HTTP          | No             | Yes               |
| HTTPS         | No             | Yes               |
| ICMP          | No             | Yes               |
| IP (headers)  | Yes            | No                |
| IphoneSync    | No             | Yes               |
| IPP           | No             | Yes               |
| LDAP          | No             | Yes               |
| LLDP          | Yes            | No                |
| LLMNR         | Yes            | Yes               |
| mDNS          | Yes            | Yes               |
| MNDP          | Yes            | No                |
| MSSQL         | Yes            | No                |
| NBNS          | Yes            | Yes               |
| NBSS          | No             | Yes               |
| PJL           | No             | Yes               |
| RDP           | No             | Yes               |
| RPC           | No             | Yes               |
| SIP           | No             | Yes               |
| SLP           | No             | Yes               |
| SMB           | No             | Yes               |
| SMTP          | No             | Yes               |
| SNMP          | No             | Yes               |
| SSDP          | Yes            | No                |
| SSH           | No             | Yes               |
| TCP (SYN headers) | Yes        | No                |
| Telnet        | No             | Yes               |
| UDP (headers) | Yes            | No                |
| UPNP          | No             | Yes               |
| VNC           | No             | Yes               |
| WinRM         | No             | Yes               |
| WSD           | Yes            | Yes               |

Device discovery might also scan other commonly used ports to improve classification accuracy and coverage.

## Capabilities and configuration options

Most organizations benefit from the out-of-the-box active discovery, device inventory integration, and automatic network handling. You can use additional configuration options for more granular control, targeting, and exclusions as needed for your environment.

This table summarizes which capabilities device discovery provides out-of-the-box, what each additional configuration option enables, and where you can change configurable options in the Defender portal.

To manage device discovery options, see [Manage device discovery](configure-device-discovery.md). For advanced analysis, vulnerability assessment, and hunting queries, see [Review and assess devices](configure-device-discovery.md).

| Feature/option | Default | What it includes or enables | Where to configure in the Defender portal  | More information |
|----------------------------|:---------------:|-------------------------------------------------------------------------------|-----------------------------------------|------------------|
| Basic discovery   | No   | Detects unmanaged endpoints, network devices, IoT assets via traffic. Can be used for sensitive/legacy networks. | **System** > **Settings** > **Device discovery** > **Discovery mode** > **Basic**      | [Discovery modes and scans](#discovery-modes-and-scans) |
| Standard discovery | Yes  | Adds protocol-based scans for deeper device identification and richer inventory. Can be disabled (switch to **Basic** mode). | **System** > **Settings** > **Device discovery** > **Discovery mode** > **Standard discovery (recommended)**          |[Discovery modes and scans](#discovery-modes-and-scans)  |
| Device inventory integration | Yes   | Unified view of onboarded and discovered devices. Filter, assess, and take action in inventory. | **Assets** > **Devices** | [Review devices that aren't onboarded](assess-devices.md#monitor-non-onboarded-devices-in-the-device-inventory) |
| Network list management  | Yes | Monitors corporate networks, ignores non-corporate by default. Can monitor/ignore specific networks. | **System** > **Settings** > **Device discovery** > **Monitored networks**   |[Network list management](configure-device-discovery.md#view-and-manage-monitored-networks)  |
| Exclusions  | No  | Exclude IPs or device groups from scans. | **System** > **Settings** > **Device discovery** > **Exclusions** |[Exclude devices](configure-device-discovery.md#exclude-devices-from-standard-discovery)  |
| Authenticated network scans  | No  | - Discover and classify network infrastructure devices that cannot be onboarded.<br>- Schedule scans and define scan targets beyond the default subnet. | **System** > **Settings** > **Device discovery** > **Device discovery** > **Authenticated scans**  |[Set up authenticated network scans](network-devices.md)  |
| OT/IoT device discovery | No | Integrate with Defender for IoT to discover OT and enterprise IoT devices. | **System** > **Settings** > **Device discovery** > **Enterprise IoT** | [Onboard Defender for IoT in the Defender portal](/defender-for-iot/get-started) |
| Vulnerability assessment | Yes | Assess vulnerabilities on discovered devices and get remediation guidance. For example, search for **SSH** to find recommendations on SSH vulnerabilities related to unmanaged devices. | **Exposure management > Recommendations** | [Vulnerability management overview](/defender-vulnerability-management/defender-vulnerability-management) |
| Advanced hunting on discovered devices | Yes | Use advanced hunting queries to investigate discovered devices, their activities, and related threats. | **Advanced hunting** | [Use advanced hunting on discovered devices](assess-devices.md#use-advanced-hunting-on-discovered-devices) |

### Device discovery capabilities and availability

Device discovery enables organizations to identify managed and unmanaged devices across their network, including endpoints, network devices, and IoT/OT devices. All discovered devices appear in the device inventory, regardless of device type.

The core discovery experience, including device visibility and network authenticated scans, is consistent across supported Defender for Endpoint environments. Vulnerability assessment and security recommendations are provided for endpoint devices as part of the defender [vulnerability assessment capabilities](/defender-vulnerability-management/defender-vulnerability-management).

When the Enterprise IoT Security license is enabled (either through Microsoft 365 E5 or via a standalone Enterprise IoT license), vulnerability assessment is available for discovered IoT devices, providing deeper risk visibility beyond basic inventory.

For information about feature availability and licensing, see the [Microsoft Defender service description](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-defender-service-description).

## Next steps

- [Configure device discovery](configure-device-discovery.md)
- [Review and assess devices](assess-devices.md)