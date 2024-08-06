---
title: Enterprise IoT for Microsoft Defender for IoT in the Defender portal
description: Learn how to monitor IoT devices using Microsoft Enterprise Defender for IoT in the Microsoft Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/25/2024
ms.topic: overview
---

# Enterprise for IoT in the Defender portal

The number of IoT devices continues to grow exponentially across enterprise networks in many office buildings. Enterprise IoT devices include devices such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices.

While the number of IoT devices continues to grow, they often lack the security safeguards that are common on managed endpoints like laptops and mobile phones. To bad actors, these unmanaged devices can be used as a point of entry for lateral movement or evasion, and too often, the use of such tactics leads to the exfiltration<!-- should this be changed to hacking / exposure/ stealing / leaking LW --> of sensitive information.

Extend Defender for IoT's agentless security features to include enterprise IoT devices. Add the enterprise IoT security feature to your existing Microsoft Defender for Endpoint license, and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender.

Microsoft Defender for IoT seamlessly integrates with Microsoft Defender portal and Defender for Endpoint to both discover IoT devices and provide security value, including purpose-built alerts, recommendations, and vulnerability data.

:::image type="content" source="media/enterprise-for-iot/eiot-architecture.png" alt-text="The architecture showing the use of Enterprise IoT":::

## What is the difference between OT and Enterprise IoT?

- Operational Technology (OT): OT network sensors use agentless, patented technology to discover, learn, and continuously monitor network devices for deep visibility into Operational Technology (OT) / Industrial Control System (ICS) risks. Sensors carry out data collection, analysis, and alerting on-site, making them ideal for locations with low bandwidth or high latency.

- Enterprise IoT: Enterprise IoT provides visibility and security for IoT devices in the corporate environment.
Enterprise IoT network protection extends agentless features beyond operational environments, providing coverage for all IoT devices in your environment. For example, an enterprise IoT environment might include printers, cameras, and purpose-built, proprietary, devices.
<!-- include the types of devices considered individual or not here as well. how much of this is specific for this article? -->
### Identified, unique devices

Defender for IoT can discover all devices, of all types, across all environments. Devices are listed in the Defender for IoT **Device inventory** pages based on a unique IP and MAC address coupling.

Defender for IoT identifies single and unique devices as follows:

|Type  |Description  |
|---------|---------|
|**Identified as individual devices**     |    Devices identified as *individual* devices include:<br>**IT, OT, or IoT devices with one or more NICs**, including network infrastructure devices such as switches and routers<br><br>**Note**: A device with modules or backplane components, such as racks or slots, is counted as a single device, including all modules or backplane components.|
|**Not identified as individual devices**     | The following items *aren't* considered as individual devices, and do not count against your license:<br><br>- **Public internet IP addresses** <br>- **Multi-cast groups**<br>- **Broadcast groups**<br>- **Inactive devices**<br><br> Network-monitored devices are marked as *inactive* when there's no network activity detected within a specified time:<br><br> - **OT networks**: No network activity detected for more than 60 days<br> - **Enterprise IoT networks**: No network activity detected for more than 30 days<br><br>**Note**: Endpoints already managed by Defender for Endpoint are not considered as separate devices by Defender for IoT.  |

## Alerts

Most Defender for Endpoint alerts are also relevant for enterprise IoT devices, such as alerts for scans involving managed endpoints. Alerts for enterprise IoT devices detected by Defender for Endpoint are only available in Defender for Endpoint only.

For more information, see [Alerts queue in Microsoft 365 Defender](/defender-endpoint/alerts-queue).

## Recommendations

The following Defender for Endpoint security recommendations are supported for Enterprise IoT devices:

- Require authentication for Telnet management interface
- Disable insecure administration protocol – Telnet
- Remove insecure administration protocols SNMP V1 and SNMP V2
- Require authentication for VNC management interface

## Vulnerabilities

Known CVEs vulnerabilities are detected and showing in the Defender portal associated with the relevant device. Known CVEs can help you decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use advanced hunting queries to collect vulnerabilities across all your devices.

## Manage enterprise IoT monitoring support with Microsoft Defender for IoT

For Enterprise IoT networks, use a trial license as an add-on to Microsoft Defender for Endpoint. A trial license supports 100 devices. There are two options available depending on your existing license:

1. Customers with ME5/E5 Security plans have support for enterprise IoT monitoring available, and don't need to start a trial.

    To turn on Enterprise for IoT [follow these instructions](enterprise-for-iot-get-started.md#turn-on-enterprise-iot-monitoring).

1. Customers with a Microsoft Defender for Endpoint P2 license only can use a trial standalone license for enterprise IoT monitoring.

    Start your enterprise IoT trial using the [Microsoft Defender for IoT - EIoT Device License - add-on wizard](https://signup.microsoft.com/get-started/signup?products=b2f91841-252f-4765-94c3-75802d7c0ddb&ali=1&bac=1) or via the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog).

A permanent Enterprise IoT monitoring license supports five devices per Microsoft 365 E5 (ME5) or E5 Security license, or is available as a standalone, per-device license for Microsoft Defender for Endpoint P2 customers.

### Disable Enterprise IoT

For more information, see [Turn off enterprise IoT security](enterprise-for-iot-get-started.md#turn-off-enterprise-iot-security).

### End of trial period

If you haven't added a standalone license by the time your trial ends, your trial is automatically canceled, and you lose access to Enterprise IoT security features.

For more information, see [purchase a standalone license](enterprise-for-iot-get-started.md#purchase-a-standalone-license).

### Resolve billing issues associated with my Enterprise IoT plan

For any billing or technical issues, open a support ticket for Microsoft Defender portal.

## Next steps
