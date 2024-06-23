---
title: What is Microsoft Defender for IoT?
description: Microsoft Defender for IoT is a unified security solution built specifically to identify IoT and OT devices, vulnerabilities, and threats.
ms.service: defender-for-iot
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: rayne-wiselman
ms.topic: conceptual
ms.date: 06/11/2024
---

# What is Microsoft Defender for IoT?

Microsoft Defender for IoT is a unified security solution built specifically to identify Internet of Things (IoT) and operational technology (OT) devices, vulnerabilities, and threats. In this article, you learn how Defender for IoT secures your IoT and OT environments, main scenarios and personas, architecture, and more.

[IMAGE]

## What is OT security and what are the main OT security challenges?

The Internet of Things (IoT) supports billions of connected devices that use both operational technology (OT) and IoT networks. IoT/OT devices and networks are often built using specialized protocols, and might prioritize operational challenges over security.

Specifically, OT network challenges include: poor visibility into assets and networks, difficulty to create network segmentation, vulnerable legacy systems, dependence on external vendors, and lack of security expertise. When IoT/OT devices can't be protected by traditional security monitoring systems, each new wave of innovation increases the risk and possible attack surfaces across those IoT devices and OT networks.

## What is agent-based discovery for OT?

If your IoT and OT devices don't have embedded security agents, they might remain unpatched, misconfigured, and invisible to IT and security teams. Unmonitored devices can be soft targets for threat actors looking to pivot deeper into corporate networks.

Defender for IoT uses agent-based monitoring to provide visibility and security across your network, and identifies specialized protocols, devices, or machine-to-machine (M2M) behaviors.

- **[**Discover OT devices**](manage-devices-inventory.md)** to gain a full overview of IT, IoT, and OT assets across the entire organization.
 
    - Discover device details, and how devices communicate.
    - Identify device vulnerabilities and mitigate risks.
    - Reduce downtime and monitor your top assets.
    - Support regulatory compliance.​
    - Gather data from Microsoft Defender for Endpoint and third-party sources.

- Monitor you [**site security**](site-security-overview.md): 

    - Gain valuable insights into OT risks in production sites
    - Make better-informed security investment decisions​
    - Streamline communication between IT and OT security stakeholders​.

- **Assess risks and manage vulnerabilities** using machine learning, threat intelligence, and behavioral analytics. For example:

    - Identify unpatched devices, open ports, unauthorized applications, unauthorized connections, changes to device configurations, PLC code, firmware, and more.
    - Run searches in historical traffic across all relevant dimensions and protocols. Access full-fidelity PCAPs to drill down further.
    - Detect advanced threats that you might have missed by static indicators of compromise (IOCs), such as zero-day malware, fileless malware, and living-off-the-land tactics.

- **Respond to threats** by integrating with Microsoft services such as Microsoft Sentinel, other partner systems, and APIs. Integrate with security information and event management (SIEM) services, security operations and response (SOAR) services, extended detection and response (XDR) services, and more.

Defender for IoT's centralized user experience in the Defender portal lets the security and OT monitoring teams visualize and secure all their IT, IoT, and OT devices regardless of where the devices are located.

## Who uses Defender for IoT?

Defender for IoT is intended for:

- **CISOs** or security leaders that want to gain an overview of their organization's IoT network and asset security.
- **OT security admins, industrial engineers, risk managers, and SOC analysts​** that want to gain a high-level view of a site's risks, incidents, and vulnerabilities, get recommendations for remediation actions, manage and discover protected OT devices, and more.

### How do I deploy Defender for IoT?

With Defender for IoT cloud-based deployment, you can view data from all connected sensors, and integrate with other Microsoft services, like Microsoft Sentinel.

## What's the difference between Defender for IoT in the Defender portal and Defender for IoT on Azure?

Microsoft Defender for IoT in the Defender portal (Preview) is designed for customers who want to extend their XDR/EDR protection to OT, and want to gain a unified security solution for IT and OT.

Microsoft Defender for IoT on Azure is the standalone OT security portal. Existing customers can continue working on Azure as usual.

## How do I protect my enterprise IoT devices?

Extend Defender for IoT's security features beyond OT environments to enterprise IoT devices by using enterprise IoT security with Microsoft Defender for Endpoint, and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender XDR.

Enterprise IoT devices can include devices such as printers, smart TVs, and conferencing systems and purpose-built, proprietary devices.

For more information, see [Securing IoT devices in the enterprise](/azure/defender-for-iot/organizations/eiot-sensor).

## Which regions does Defender for IoT support?

See [TBD - link to MDE supported regions].

## Next steps

Review the [prerequisites](prerequisites.md) to get started with Defender for IoT.