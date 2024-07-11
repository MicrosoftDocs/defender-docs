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

# Enterprise for IoT in the XDR portal

Extend Defender for IoT's agentless security features beyond OT environments to enterprise IoT devices by using enterprise IoT security with Microsoft Defender for Endpoint, and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender XDR.

Enterprise IoT devices can include devices such as printers, smart TVs, and conferencing systems and purpose-built, proprietary devices.
The number of IoT devices continues to grow exponentially across enterprise networks, such as printers, Voice over Internet Protocol (VoIP) devices, smart TVs, and conferencing systems scattered around many office buildings.

While the number of IoT devices continues to grow, they often lack the security safeguards that are common on managed endpoints like laptops and mobile phones. To bad actors, these unmanaged devices can be used as a point of entry for lateral movement or evasion, and too often, the use of such tactics leads to the exfiltration of sensitive information.

Microsoft Defender for IoT seamlessly integrates with Microsoft Defender XDR and Microsoft Defender for Endpoint to provide both IoT device discovery and security value for IoT devices, including purpose-built alerts, recommendations, and vulnerability data.
<!-- I dont know if this is still appropriate? -->
:::image type="content" source="media/enterprise-for-iot-in-xdr/eiot-architecture.png" alt-text="The architecture showing the use of Enterprise IoT":::

## Enterprise IoT security in Microsoft Defender XDR

Enterprise IoT security in Microsoft Defender XDR provides IoT-specific security value, including alerts, risk and exposure levels, vulnerabilities, and recommendations in Microsoft Defender XDR.

- If you're a Microsoft 365 E5 (ME5)/ E5 Security and Defender for Endpoint P2 customer, toggle on support for Enterprise IoT Security in the Microsoft Defender Portal.
- If you don't have ME5/E5 Security licenses, but you're a Microsoft Defender for Endpoint customer, start with a free trial or purchase standalone, per-device licenses to gain the same IoT-specific security value.

### Alerts

Most Microsoft Defender for Endpoint network-based detections are also relevant for Enterprise IoT devices. For example, network-based detections include alerts for scans involving managed endpoints.

If you have Enterprise IoT security turned on in Microsoft Defender XDR, alerts for Enterprise IoT devices detected by Microsoft Defender for Endpoint are available in Defender for Endpoint only.

For more information, see Alerts queue in Microsoft 365 Defender.

Recommendations

The following Defender for Endpoint security recommendations are supported for Enterprise IoT devices:
•	Require authentication for Telnet management interface
•	Disable insecure administration protocol – Telnet
•	Remove insecure administration protocols SNMP V1 and SNMP V2
•	Require authentication for VNC management interface

Frequently asked questions

This section provides a list of frequently asked questions about securing Enterprise IoT networks with Microsoft Defender for IoT.
What is the difference between OT and Enterprise IoT?

- Operational Technology (OT): OT network sensors use agentless, patented technology to discover, learn, and continuously monitor network devices for a deep visibility into Operational Technology (OT) / Industrial Control System (ICS) risks. Sensors carry out data collection, analysis, and alerting on-site, making them ideal for locations with low bandwidth or high latency.
- Enterprise IoT: Enterprise IoT provides visibility and security for IoT devices in the corporate environment.
Enterprise IoT network protection extends agentless features beyond operational environments, providing coverage for all IoT devices in your environment. For example, an enterprise IoT environment might include printers, cameras, and purpose-built, proprietary, devices.

### Get started with enterprise IoT monitoring in Microsoft Defender XDR

How much of this page is relevant, a lot it seems, but probably needs adaptation
Turn on enterprise IoT monitoring
View added security value in Microsoft Defender XDR
Maybe include Sample advanced hunting queries for Enterprise IoT

### Manage enterprise IoT monitoring support with Microsoft Defender for IoT

Manage EIoT monitoring support - Microsoft Defender for IoT | Microsoft Learn

How are licenses to be purchased in XDR? Same as in link above? Mia? Standalone ? 5 devices per license? How does this work?
Billing – how does this work?
Microsoft Defender for IoT billing - Microsoft Defender for IoT | Microsoft Learn
