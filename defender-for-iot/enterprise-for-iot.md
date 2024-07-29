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
<!-- this should probably be divided into 2 articles - 1 overview, 2 how to -->
The number of IoT devices continues to grow exponentially across enterprise networks in many office buildings. Enterprise IoT devices include devices such as printers, smart TVs, Voice over Internet Protocol (VoIP) devices, conferencing systems and purpose-built, proprietary devices. For more information, see [Defender for IoT devices](billing#defender-for-iot-devices) <!-- do we have an equivalent to this?-->

While the number of IoT devices continues to grow, they often lack the security safeguards that are common on managed endpoints like laptops and mobile phones. To bad actors, these unmanaged devices can be used as a point of entry for lateral movement or evasion, and too often, the use of such tactics leads to the exfiltration<!-- should this be changed to hacking / exposure/ stealing / leaking --> of sensitive information.

Extend Defender for IoT's agentless<!-- I presume this is different in Defender and does use agents --> security features to include enterprise IoT devices. Add the enterprise IoT security feature to your existing Microsoft Defender for Endpoint <!-- license? or remove to your?-->, and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender.

Microsoft Defender for IoT seamlessly integrates with Microsoft Defender XDR<!-- remove XDR?--> and Defender for Endpoint to both discover IoT devices and provide security value, including purpose-built alerts, recommendations, and vulnerability data.
<!-- I dont know if this image is still appropriate? -->
:::image type="content" source="media/enterprise-for-iot/eiot-architecture.png" alt-text="The architecture showing the use of Enterprise IoT":::

## What is the difference between OT and Enterprise IoT?

- Operational Technology (OT): OT network sensors use agentless, patented technology to discover, learn, and continuously monitor network devices for a deep visibility into Operational Technology (OT) / Industrial Control System (ICS) risks. Sensors carry out data collection, analysis, and alerting on-site, making them ideal for locations with low bandwidth or high latency.
- Enterprise IoT: Enterprise IoT provides visibility and security for IoT devices in the corporate environment.
Enterprise IoT network protection extends agentless features beyond operational environments, providing coverage for all IoT devices in your environment. For example, an enterprise IoT environment might include printers, cameras, and purpose-built, proprietary, devices.

## Manage enterprise IoT monitoring support with Microsoft Defender for IoT

For Enterprise IoT networks, use a trial, standalone license for 90 days as an add-on to Microsoft Defender for Endpoint<!--?-->. Trial licenses support 100 devices. For more information, see Securing IoT devices in the enterprise and Enable Enterprise IoT security with Defender for Endpoint.
Enterprise IoT monitoring supports 5 devices per Microsoft 365 E5 (ME5) or E5 Security license, or is available as standalone, per-device licenses for Microsoft Defender for Endpoint P2 customers.

1. E5 customers. for each E5 license  they get 5 eligible devices
1. They can buy EIoT license and get for each licenses one device

Billing – how does this work?
Microsoft Defender for IoT billing - Microsoft Defender for IoT | Microsoft Learn

## Obtain a standalone, Enterprise IoT trial license

This procedure describes how to start using a trial, standalone license for enterprise IoT monitoring, for customers who have a Microsoft Defender for Endpoint P2 license only.

Customers with ME5/E5 Security plans have support for enterprise IoT monitoring available on by default, and don't need to start a trial. For more information, see [Get started with enterprise IoT monitoring in Microsoft Defender XDR](eiot-defender-for-endpoint.md).

Start your enterprise IoT trial using the [Microsoft Defender for IoT - EIoT Device License - add-on wizard](https://signup.microsoft.com/get-started/signup?products=b2f91841-252f-4765-94c3-75802d7c0ddb&ali=1&bac=1) or via the Microsoft 365 admin center.

**To start an Enterprise IoT trial**:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) > **Marketplace**.

1. Search for the **Microsoft Defender for IoT - EIoT Device License - add-on** and filter the results by **Other services**. For example:

    :::image type="content" source="media/enterprise-iot/eiot-standalone.png" alt-text="Screenshot of the Marketplace search results for the EIoT Device License.":::

    > [!IMPORTANT]
    > The prices shown in this image are for example purposes only and are not intended to reflect actual prices.
    >

1. Under **Microsoft Defender for IoT - EIoT Device License - add-on**, select **Details**.

1. On the **Microsoft Defender for IoT - EIoT Device License - add-on** page, select **Start free trial**. On the **Check out** page, select **Try now**.

> [!TIP]
> Make sure to [assign your licenses to specific users](/microsoft-365/admin/manage/assign-licenses-to-users) to start using them.
>

For more information, see [Free trial](billing.md#free-trial).

## Calculate monitored devices for Enterprise IoT monitoring

Use the following procedure to calculate how many devices you need to monitor if:

- You're an ME5/E5 Security customer and thinks you need to monitor more devices than the devices allocated per ME5/E5 Security license
- You're a Defender for Endpoint P2 customer who's purchasing standalone enterprise IoT licenses

**To calculate the number of devices you're monitoring:**:

1. In [Microsoft Defender XDR](https://security.microsoft.com/), select **Assets** \> **Devices** to open the **Device inventory** page.

1. Note down the total number of **IoT devices** listed.

    For example:

    :::image type="content" source="media/how-to-manage-subscriptions/device-inventory-iot.png" alt-text="Screenshot of network device and IoT devices in the device inventory in Microsoft Defender for Endpoint." lightbox="media/how-to-manage-subscriptions/device-inventory-iot.png":::

1. Round your total to a multiple of 100 and compare it against the number of licenses you have.

For example:

- If in Microsoft Defender XDR **Device inventory**, you have *1204* IoT devices.
- Round down to *1200* devices.
- You have 240 ME5 licenses, which cover **1200** devices

You need another **4** standalone devices to cover the gap.

For more information, see the [Defender for Endpoint Device discovery overview](/microsoft-365/security/defender-endpoint/device-discovery).

> [!NOTE]
> Devices listed on the **Computers & Mobile** tab, including those managed by Defender for Endpoint or otherwise, are not included in the number of [devices](billing.md#defender-for-iot-devices) monitored by Defender for IoT.

## Purchase standalone licenses

Purchase standalone, per-device licenses if you're an ME5/E5 Security customer who needs more than the five devices allocated per license, or if you're a Defender for Endpoint customer who wants to add enterprise IoT security to your organization.

**To purchase standalone licenses**:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

1. Search for the **Microsoft Defender for IoT - EIoT Device License - add-on** and filter the results by **Other services**. For example:

    :::image type="content" source="media/enterprise-iot/eiot-standalone.png" alt-text="Screenshot of the Marketplace search results for the EIoT Device License.":::

    > [!IMPORTANT]
    > The prices shown in this image are for example purposes only and are not intended to reflect actual prices.
    >

1. On the **Microsoft Defender for IoT - EIoT Device License - add-on** page, enter your selected license quantity, select a billing frequency, and then select **Buy**.

For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

## Turn off enterprise IoT security

This procedure describes how to turn off enterprise IoT monitoring in Microsoft Defender XDR, and is supported only for customers who don't have any standalone, per-device licenses added on to Microsoft Defender XDR.

Turn off the **Enterprise IoT security** option if you're no longer using the service. 

**To turn off enterprise IoT monitoring**:

1. In [Microsoft Defender XDR](https://security.microsoft.com/), select **Settings** \> **Device discovery** \> **Enterprise IoT**.

1. Toggle the option to **Off**.

You stop getting security value in Microsoft Defender XDR, including purpose-built alerts, vulnerabilities, and recommendations.

## Alerts
<!-- here Enterprise was written with a capital and I have lowered that-->
Most Defender for Endpoint network-based detections are also relevant for enterprise IoT devices, such as alerts for scans involving managed endpoints. Alerts for enterprise IoT devices detected by Defender for Endpoint are only available in Defender for Endpoint only<!-- where are they now available? -->.

For more information, see [Alerts queue in Microsoft 365 Defender](defender-endpoint/alerts-queue). <!-- should this be changed? what alternatives are there? also change to in Microsoft Defender portal? Amit-->
<!-- remove -->On the **Alerts** tab, check for any alerts triggered by the device. Simulate alerts in Microsoft 365<!--?--> Defender for Enterprise IoT using the Raspberry Pi scenario available in the [Microsoft 365 Defender Evaluation & Tutorials](https://security.microsoft.com/tutorials/all) page.

<!-- remove -->You can also set up advanced hunting queries to create custom alert rules. For more information, see [sample advanced hunting queries for Enterprise IoT monitoring](eiot-defender-for-endpoint#sample-advanced-hunting-queries-for-enterprise-iot).

## Recommendations

The following Defender for Endpoint security recommendations are supported for Enterprise IoT devices:

- Require authentication for Telnet management interface
- Disable insecure administration protocol – Telnet
- Remove insecure administration protocols SNMP V1 and SNMP V2
- Require authentication for VNC management interface

## Vulnerabilties

Check for any known CVEs associated with the device. Known CVEs can help you decide whether to patch, remove, or contain the device and mitigate risk to your network. Alternatively, use advanced hunting queries to collect vulnerabilities across all your devices.

## Next steps
