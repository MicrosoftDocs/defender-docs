---
title: Protect against IoT/OT threats with Microsoft Defender XDR
description: Learn how Defender XDR detects and monitors IoT and OT devices to protect your environment against threats raised by IoT and OT devices.
ms.service: defender-xdr
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: raynew
audience: ITPro
ms.topic: conceptual
ms.date: 01/20/2024
---

# Protect enterprise IoT assets

As the Internet of Things (IoT) and Operational Technology (OT) security landscape becomes more complex and attacks become more sophisticated, organizations must [secure their IoT/OT environments](../defender-for-iot/microsoft-defender-iot.md) efficiently to maintain operational reliability and safety. Microsoft Defender for IoT is designed to secure these environments, protecting networks and devices from unique IoT/OT vulnerabilities and threats.  

In this article, you learn about IoT/OT security challenges, which protection is included with Defender XDR, how Defender XDR detects and monitors enterprise IoT devices, and how to extend this protection to OT devices and environments.

> [!NOTE]
> Defender for Endpoint customers can [enable enterprise IoT security](/defender-for-iot/enterprise-iot-get-started#add-enterprise-iot-security-in-the-defender-portal) as part of their Microsoft 365 E5 (ME5) / E5 Security license. For more information, see [how it works](#how-defender-xdr-detects-and-monitors-enterprise-iot-devices).

## Enterprise IoT security challenges

The Internet of Things (IoT) supports billions of connected devices that use both operational technology (OT) and IoT networks. IoT/OT devices and networks are often built using specialized protocols, and might prioritize operational challenges over security.

When IoT/OT devices can't be protected by traditional security monitoring systems, each new wave of innovation increases the risk and possible attack surfaces across those IoT devices and OT networks. 

Specific challenges for enterprise IoT assets include:

- Complex device authentication and identity management, and traditional security models like password-based authentication are often insufficient.
- IoT devices commonly collect large amounts of sensitive data, but they don’t encrypt data properly.
- IoT device creators do not always follow development security best practices, including the use of reputable and updated libraries.
- Many IoT devices have limited computational capacity, making it difficult to implement standard security measures like encryption, authentication, and firmware updates.
- Unmanaged IoT devices increase enterprise attack surfaces. There is often a lack of visibility into IoT assets and limited options for vulnerability management.

## How Defender XDR protects enterprise IoT devices

[Enterprise IoT security](/defender-for-iot/enterprise-iot) in Microsoft Defender XDR provides IoT-specific security value for IoT devices, including risk and exposure levels, vulnerabilities, and recommendations.

The existing Defender for Endpoint agent runs on enterprise IoT assets and identifies, assesses, and secures them like any other organizational endpoint.

|How to enable  |Supported devices  |Main capabilities  |
|---------|---------|---------|
|Defender for Endpoint customers can [enable enterprise IoT security](/defender-for-iot/enterprise-iot-get-started#add-enterprise-iot-security-in-the-defender-portal) as part of their Microsoft 365 E5 (ME5) / E5 Security license.     |[Supported devices](../defender-for-iot/organizations/billing#defender-for-iot-devices) include an extensive range of hardware models and vendors, spanning corporate IoT devices such as printers, cameras, and VoIP phones, among others.         |- **Discover assets** for a full enterprise IoT inventory.<br>- Get a **unified site view** to group enterprise IoT assets. You can monitor, manage, and investigate security insights at site level.<br>- Run a **vulnerability assessment** to identify and fix asset vulnerabilities, assess asset configuration, and get actionable security recommendations.<br>- Use Microsoft Security Exposure Management to **review security initiatives**.<br>- **Detect, investigate, and respond to security threats** against IoT assets across the enterprise. |

## Extend protection to OT devices

To go beyond the protection that the Defender for Endpoint agent provides for OT/IoT assets, Defender for IoT provides full visibility and security protection with OT sensors that monitor traffic in relevant internal networks. Learn more about [Defender for IoT features and use cases](/defender-for-iot/microsoft-defender-iot).

To enable OT protection, you need to enable the Defender for IoT license. Learn how to [onboard Defender for IoT](/defender-for-iot/get-started).