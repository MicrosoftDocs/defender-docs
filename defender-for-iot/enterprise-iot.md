---
title: Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to monitor IoT devices using Microsoft Enterprise IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/25/2024
ms.topic: overview
---

# Enterprise IoT in the Defender portal

The number of IoT devices continues to grow exponentially across enterprise networks in many office buildings. Enterprise IoT devices include devices such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices.

While the number of IoT devices continues to grow, they often lack the security safeguards that are common on managed endpoints like laptops and mobile phones. To bad actors, these unmanaged devices can be used as a point of entry for lateral movement or evasion, and too often, the use of such tactics leads to the exfiltration of sensitive information.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Enterprise IoT monitoring in the Defender portal

Extend Microsoft Defender for IoT's security features to include enterprise IoT devices. Add the enterprise IoT security feature to your existing Microsoft Defender for Endpoint license, and view related vulnerabilities and recommendations for IoT devices that are seemlessly integrated into the Microsoft Defender portal.

:::image type="content" source="media/enterprise-iot/eiot-architecture.png" alt-text="The architecture showing the use of enterprise IoT":::

## What's the difference between OT security and enterprise IoT security?

- Operational Technology (OT): OT network sensors use agentless, patented technology to discover, learn, and continuously monitor network devices for deep visibility into OT / Industrial Control System (ICS) risks. Sensors carry out data collection, analysis, and alerting on-site, making them ideal for locations with low bandwidth or high latency.

- Enterprise IoT: Enterprise IoT provides visibility and security for IoT devices in the corporate environment. Enterprise IoT network protection extends agentless features beyond operational environments, providing coverage for all IoT devices in your environment, such as printers, cameras, and purpose-built, proprietary, devices.

## Enterprise IoT data in the Defender portal

Enterprise IoT data for features such as recommendations and vulnerabilities, seamlessly integrates with other data in the Defender portal.

### Recommendations

The following Defender for Endpoint security recommendations are supported for enterprise IoT devices:

- Require authentication for Telnet management interface
- Disable insecure administration protocol – Telnet
- Remove insecure administration protocols SNMP V1 and SNMP V2
- Require authentication for VNC management interface

### Vulnerabilities

Known CVE vulnerabilities, already detected by the Defender portal, are also detected and displayed associated with the relevant enterprise IoT device in the Defender portal. Known CVEs can help you decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use advanced hunting queries to collect vulnerabilities across all your devices.

## Next steps

[Licenses for enterprise IoT](enterprise-iot-licenses.md)

[Get started with enterprise IoT](enterprise-iot-get-started.md)
