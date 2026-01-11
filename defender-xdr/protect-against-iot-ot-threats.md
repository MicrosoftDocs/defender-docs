---
title: IoT/OT security - protect enterprise IoT and OT assets
description: Learn how Defender for IoT detects and monitors IoT and OT devices to protect your environment against threats raised by IoT and OT devices.
ms.service: defender-xdr
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.topic: article
ms.date: 01/20/2024
appliesto:
    - Microsoft Defender for XDR
    - Microsoft Defender for Endpoint
    - Microsoft Defender for IoT

#Customer intent: As a Defender XDR customer, I want to know what IoT/OT protection is included in my license so that I can better protect my IoT/OT assets.
---

# IoT/OT security - protect enterprise IoT and OT assets

The Internet of Things (IoT) connects billions of smart devices used in homes and businesses, while Operational Technology (OT) focuses on industrial systems like factory equipment and critical infrastructure. Securing OT/IoT environments comes with unique challenges, like unmanaged devices, increased attack surfaces, and the absence of traditional security controls (review [more security challenges](#enterprise-iot-security-challenges)).

To maintain operational reliability and safety, organizations must use [tailored IoT/OT security approaches](/defender-for-iot/microsoft-defender-iot) due to the unique risks in these environments. Microsoft Defender for IoT addresses these unique risks, providing comprehensive OT security, including visibility into OT environments and advanced threat protection.

In this article, you learn about IoT/OT security challenges, and how Defender XDR leverages Defender for IoT to detect and monitor enterprise IoT and OT devices.

> [!NOTE]
> Microsoft E5 and E5 Security customers can enable enterprise IoT security as part of their license. Learn more about the [Enterprise IoT device protection](#enterprise-iot-device-protection-in-defender-for-endpoint-and-defender-xdr) supported for different licenses.

## Enterprise IoT security challenges

When IoT/OT devices can't be protected by traditional security monitoring systems, each new wave of innovation increases the risk and possible attack surfaces across those IoT devices and OT networks.

Specifically, enterprise IoT security challenges include:

- Lack of visibility into unmanaged IoT devices, which create significant blind spots and increase the enterprise attack surface.
- Complex device authentication and identity management, where traditional security models like password-based authentication are often insufficient.
- Large amounts of sensitive data with insufficient data encryption.
- Lack of built-in security controls and security best practices, making enterprise IoT devices easy targets for sophisticated attacks.
- Limited computational capacity, making it difficult to implement standard security measures like encryption, authentication, and firmware updates.

## Enterprise IoT device protection in Defender for Endpoint and Defender XDR

[Enterprise IoT security](/defender-for-iot/enterprise-iot) in Microsoft Defender for Endpoint and Defender XDR provides IoT-specific security value for IoT devices, including risk and exposure levels, vulnerabilities, and recommendations.

While monitoring endpoints on the network, the existing Defender for Endpoint agent detects, identifies, assesses, and secures enterprise IoT assets on the monitored endpoints.

This table describes the supported protection for different licenses.

|License  |Device discovery  |Threat detection - managed/unmanaged devices |VM |Security recommendations |How to enable |
|---------|---------|---------|---------|---------|---------|---------|
|Microsoft Defender for Endpoint P2     |&#x2705;  |&#x2705; |&#10060; |&#10060; |- [Start with a free trial](/defender-for-iot/enterprise-iot-get-started#set-up-a-standalone-trial-license)- Purchase the [standalone full license](/defender-for-iot/enterprise-iot-get-started#set-up-a-standalone-full-license). |
|Enterprise IoT add-on device license (add-on to MDE P2)   |&#x2705;  |&#x2705; |&#x2705; |&#x2705; |[Enable enterprise IoT security](/defender-for-iot/enterprise-iot-get-started#add-enterprise-iot-security-in-the-defender-portal)  |
|E5<sup>1</sup>     |&#x2705;  |&#x2705; |&#x2705; |&#x2705; |[Enable enterprise IoT security](/defender-for-iot/enterprise-iot-get-started#add-enterprise-iot-security-in-the-defender-portal)  |

<sup>1</sup>Includes the MDE P2 license and the enterprise IoT add-on. Each E5 user license supports five enterprise IoT add-on device licenses.

### Supported devices

Enterprise IoT protection includes devices connected to an IT network (for example, Voice over Internet Protocol (VoIP), printers, and smart TVs).

### Main features

|Feature  |Location  |More details  |
|---------|---------|---------|
|Discover enterprise IoT assets for a full enterprise IoT inventory    |**Assets > Devices > IoT devices**         |[Device inventory overview](/defender-endpoint/machines-view-overview)  |
|Review alerts triggered by enterprise IoT assets     |**Device details** page > **Alerts** tab         |- Learn more about [Defender for Endpoint alerts](/defender-endpoint/review-alerts).<br>- Simulate alerts in Microsoft 365 Defender for Enterprise IoT using the Raspberry Pi scenario available in the Microsoft 365 Defender [Evaluation & Tutorials page](https://security.microsoft.com/tutorials/all).         |
|Review security recommendations for enterprise IoT assets     |**Device details** page > **Security recommendations** tab         |[Security recommendations in Defender for Endpoint](/defender-endpoint/device-discovery#vulnerability-assessment-on-discovered-devices)         |
|Discover vulnerabilities associated with enterprise IoT assets     |**Device details** page > **Discovered vulnerabilities** tab        |[Vulnerabilities in your organization](/defender-vulnerability-management/tvm-weaknesses)         |
|Use advanced hunting queries to [create custom alert rules](/defender-for-iot/enterprise-iot-manage#advanced-hunting-queries-for-enterprise-iot) or to [collect vulnerabilities](/defender-for-iot/enterprise-iot-manage#advanced-hunting-queries-for-enterprise-iot) across all your devices |**Advanced hunting** page in the Defender portal | |

## Extend protection to OT devices

To go beyond the protection that the Defender for Endpoint agent provides for enterprise IoT assets, Defender for IoT provides full visibility and security protection into OT assets in relevant internal networks.

For more information:

- [Onboard Defender for IoT](/defender-for-iot/get-started) to enable OT protection.
- Learn about the [OT-specific security use-cases](/defender-for-iot/microsoft-defender-iot#what-are-the-main-defender-for-iot-use-cases) that Defender for IoT addresses.