---
title: Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to monitor IoT devices using Microsoft Enterprise IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 08/19/2024
ms.topic: overview
---

# Enterprise IoT in the Defender portal

The number of IoT devices continues to grow exponentially across enterprise networks in many office buildings. Enterprise IoT devices include devices such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices.

While the number of IoT devices continues to grow, they often lack the security safeguards that are common on managed endpoints like laptops and mobile phones. To bad actors, these unmanaged devices can be used as a point of entry for lateral movement or evasion, and too often, the use of such tactics leads to the exfiltration of sensitive information.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Enterprise IoT monitoring in the Defender portal

Extend Microsoft Defender for IoT's security features to include enterprise IoT devices. Add the enterprise IoT security feature to your existing Microsoft Defender for Endpoint license, and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender.

Defender for IoT seamlessly integrates with the Microsoft Defender portal and Defender for Endpoint to both discover IoT devices and provide security value, including purpose-built alerts, recommendations, and vulnerability data.

:::image type="content" source="media/enterprise-iot/eiot-architecture.png" alt-text="The architecture showing the use of enterprise IoT":::

## What's the difference between OT security and enterprise IoT security? - agentless

- Operational Technology (OT): OT network sensors use agentless, patented technology to discover, learn, and continuously monitor network devices for deep visibility into Operational Technology (OT) / Industrial Control System (ICS) risks. Sensors carry out data collection, analysis, and alerting on-site, making them ideal for locations with low bandwidth or high latency.

- Enterprise IoT: Enterprise IoT provides visibility and security for IoT devices in the corporate environment. Enterprise IoT network protection extends agentless features beyond operational environments, providing coverage for all IoT devices in your environment. For example, an enterprise IoT security environment might include printers, cameras, and purpose-built, proprietary, devices.

## Security values that integrate into the Defender portal

Security values, such as alerts, recommendations and vulnerabilities, from enterprise IoT seemlessly integrate with other data into the Defender portal.

### Alerts

Most Defender for Endpoint alerts are also relevant for enterprise IoT devices, such as alerts for scans involving managed endpoints. Alerts for enterprise IoT devices detected by Defender for Endpoint are only available in Defender for Endpoint.

For more information, see [Alerts queue in Microsoft 365 Defender](/defender-endpoint/alerts-queue).

### Recommendations

The following Defender for Endpoint security recommendations are supported for enterprise IoT devices:

- Require authentication for Telnet management interface
- Disable insecure administration protocol – Telnet
- Remove insecure administration protocols SNMP V1 and SNMP V2
- Require authentication for VNC management interface

### Vulnerabilities

Known CVE vulnerabilities, already detected by the Defender portal, are also detected and displayed associated with the relevant enterprise IoT device in the Defender portal. Known CVEs can help you decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use advanced hunting queries to collect vulnerabilities across all your devices.

<!--
## Licensing and set up of enterprise IoT security

To add enterprise IoT to Defender for Endpoint, there are two options available depending on your existing license:

1. Customers with ME5/E5 Security plans already have enterprise IoT available, but just need to turn on the feature.

    To turn on enterprise for IoT [follow these instructions](enterprise-iot-get-started.md#turn-on-enterprise-iot-monitoring).

1. Customers with a Defender for Endpoint P2 license only can use a trial standalone license for enterprise IoT monitoring. A trial license supports 100 devices.

    Start your enterprise IoT trial using the [Microsoft Defender for IoT - EIoT Device License - add-on wizard](https://signup.microsoft.com/get-started/signup?products=b2f91841-252f-4765-94c3-75802d7c0ddb&ali=1&bac=1) or via the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog).

A permanent enterprise IoT security license supports five devices per Microsoft 365 E5 (ME5) or E5 Security license, or is available as a standalone, per-device license for Defender for Endpoint P2 customers. For more information, see [purchase a standalone license](enterprise-iot-get-started.md#purchase-a-standalone-license).

### Disable enterprise IoT

Customers with ME5/E5 Security plans who no longer need the enterprise IoT security can turn off the feature. For more information, see [Turn off enterprise IoT security](enterprise-iot-get-started.md#turn-off-enterprise-iot-security).

### End of trial period

Customers with a Defender for Endpoint P2 license who don't add a standalone license by the time the trial ends, have the trial automatically canceled, and lose access to enterprise IoT security features.

For more information, see [purchase a standalone license](enterprise-iot-get-started.md#purchase-a-standalone-license).

### Resolve billing issues associated with my enterprise IoT plan

For any billing or technical issues, open a support ticket for Microsoft Defender portal.
-->
## Next steps

[Licenses for enterprise IoT](enterprise-iot-licenses.md)
[Get started with enterprise IoT](enterprise-iot-get-started.md)
