---
title: Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to monitor IoT devices using Microsoft Enterprise Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/25/2024
ms.topic: how-to
---

# Enterprise for IoT in the Defender portal

The number of IoT devices continues to grow exponentially across enterprise networks in many office buildings. Enterprise IoT devices include devices such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices.

While the number of IoT devices continues to grow, they often lack the security safeguards that are common on managed endpoints like laptops and mobile phones. To bad actors, these unmanaged devices can be used as a point of entry for lateral movement or evasion, and too often, the use of such tactics leads to the exfiltration<!-- should this be changed to hacking / exposure/ stealing / leaking --> of sensitive information.

Extend Defender for IoT's agentless<!-- I presume this is different in Defender and does use agents --> security features to include enterprise IoT devices. Add the enterprise IoT security feature to your existing Microsoft Defender for Endpoint (MDE), and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender.

Microsoft Defender for IoT seamlessly integrates with Microsoft Defender XDR and MDE to provide both IoT device discovery and security value for IoT devices, including purpose-built alerts, recommendations, and vulnerability data.
<!-- I dont know if this is still appropriate? -->
:::image type="content" source="media/enterprise-for-iot/eiot-architecture.png" alt-text="The architecture showing the use of Enterprise IoT":::

## Enterprise IoT security in Microsoft Defender XDR

Enterprise IoT security in Microsoft Defender XDR provides IoT-specific security value, including alerts, risk and exposure levels, vulnerabilities, and recommendations in Microsoft Defender XDR.

- If you're a Microsoft 365 E5 (ME5)/ E5 Security and Defender for Endpoint P2 customer, toggle on support for Enterprise IoT Security in the Microsoft Defender Portal.
- If you don't have ME5/E5 Security licenses, but you're a Microsoft Defender for Endpoint customer, start with a free trial or purchase standalone, per-device licenses to gain the same IoT-specific security value.

### Alerts

Most MDE network-based detections are also relevant for Enterprise IoT devices, such as alerts for scans involving managed endpoints. Alerts for Enterprise IoT devices detected by MDE are available in Defender for Endpoint only<!-- where are they now available? -->.

For more information, see Alerts queue in Microsoft 365 Defender. <!-- should this be changed? what alternatives are there? -->
On the Alerts tab, check for any alerts triggered by the device. Simulate alerts in Microsoft 365 Defender for Enterprise IoT using the Raspberry Pi scenario available in the Microsoft 365 Defender Evaluation & Tutorials page.

You can also set up advanced hunting queries to create custom alert rules. For more information, see sample advanced hunting queries for Enterprise IoT monitoring.

### Recommendations

On the Security recommendations tab, check for any recommendations available for the device to reduce risk and maintain a smaller attack surface.

The following Defender for Endpoint security recommendations are supported for Enterprise IoT devices:

- Require authentication for Telnet management interface
- Disable insecure administration protocol – Telnet
- Remove insecure administration protocols SNMP V1 and SNMP V2
- Require authentication for VNC management interface

### Vulnerabilties

On the Discovered vulnerabilities tab, check for any known CVEs associated with the device. Known CVEs can help decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use advanced hunting queries to collect vulnerabilities across all your devices.

To hunt for threats:

On the Device inventory page, select Go hunt to query devices using tables like the DeviceInfo table. On the Advanced hunting page, query data using other schemas.

### Frequently asked questions

This section provides a list of frequently asked questions about securing Enterprise IoT networks with Microsoft Defender for IoT.
What is the difference between OT and Enterprise IoT?

- Operational Technology (OT): OT network sensors use agentless, patented technology to discover, learn, and continuously monitor network devices for a deep visibility into Operational Technology (OT) / Industrial Control System (ICS) risks. Sensors carry out data collection, analysis, and alerting on-site, making them ideal for locations with low bandwidth or high latency.
- Enterprise IoT: Enterprise IoT provides visibility and security for IoT devices in the corporate environment.
Enterprise IoT network protection extends agentless features beyond operational environments, providing coverage for all IoT devices in your environment. For example, an enterprise IoT environment might include printers, cameras, and purpose-built, proprietary, devices.

### Get started with enterprise IoT monitoring in Microsoft Defender XDR

azure/defender-for-iot/organizations/eiot-defender-for-endpoint
How much of this page is relevant, a lot it seems, but probably needs adaptation
Turn on enterprise IoT monitoring
View added security value in Microsoft Defender XDR
Maybe include Sample advanced hunting queries for Enterprise IoT

### Manage enterprise IoT monitoring support with Microsoft Defender for IoT

Manage EIoT monitoring support - Microsoft Defender for IoT | Microsoft Learn

How are licenses to be purchased in XDR? Same as in link above? Belle/Mia? Standalone ? 5 devices per license? How does this work?

For Enterprise IoT networks, use a trial, standalone license for 90 days as an add-on to Microsoft Defender for Endpoint. Trial licenses support 100 devices. For more information, see Securing IoT devices in the enterprise and Enable Enterprise IoT security with Defender for Endpoint.
Enterprise IoT monitoring supports 5 devices per Microsoft 365 E5 (ME5) or E5 Security license, or is available as standalone, per-device licenses for Microsoft Defender for Endpoint P2 customers.

1. E5 customers. for each E5 license  they get 5 eligible devices
1. They can buy EIoT license and get for each licenses one device

Billing – how does this work?
Microsoft Defender for IoT billing - Microsoft Defender for IoT | Microsoft Learn
