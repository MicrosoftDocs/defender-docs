---
title: What is Microsoft Defender for IoT?
description: Microsoft Defender for IoT is a unified security solution built specifically to identify IoT and OT devices, vulnerabilities, and threats.
ms.service: defender-for-iot
ms.author: limwainstein
author: lwainstein
ms.localizationpriority: medium
manager: rayne-wiselman
ms.topic: conceptual
ms.date: 06/11/2024
---

# What is Microsoft Defender for IoT?

Microsoft Defender for IoT is a unified security solution built specifically to identify IoT and OT devices, vulnerabilities, and threats. In this article, you learn how Defender for IoT secures your entire Internet of Things (IoT) and operational technology (OT) environments, the Defender for IoT main scenarios and personas, architecture, and more.

## What is OT security and what are the main OT security challenges?

The Internet of Things (IoT) supports billions of connected devices that use both operational technology (OT) and IoT networks. IoT/OT devices and networks are often built using specialized protocols, and might prioritize operational challenges over security.

Specifically, OT network challenges include: poor visibility into assets and networks, difficulty to create network segmentation, vulnerable legacy systems, dependence on external vendors, and lack of security expertise. When IoT/OT devices can't be protected by traditional security monitoring systems, each new wave of innovation increases the risk and possible attack surfaces across those IoT devices and OT networks.

## How does Defender for IoT protect operational networks?

Defender for IoT monitors IoT networks and devices, and integrates with both industrial equipment and security operation center (SOC) tools, so your organization can identify all IoT and OT devices, vulnerabilities, and threats.

- Use the [**Site security**](site-security-overview.md) dashboard to gain valuable insights into OT risks in production sites, make better-informed security investment decisions​, and streamline communication between IT and OT security stakeholders​.
- [**Discover OT devices**](manage-devices-inventory.md) to gain a full overview of IT, IoT, and OT assets across the entire organization, identify vulnerabilities and mitigate risks, reduce downtime and monitor your top assets, and support regulatory compliance.​
- **Investigate key incidents and alerts** to address OT threats, context and multi-stage IT-OT incidents, without the need for expertise in complex investigation tools.

## Who uses Defender for IoT?

Defender for IoT is intended for:

- **CISOs** or security leaders that want to gain an overview of their organization's IoT network and asset security.
- **OT security admins, industrial engineers, risk managers, and SOC analysts​** that want to gain a high-level view of a site's risks, incidents, and vulnerabilities, get recommendations for remediation actions, manage and discover protected OT devices, and more.

## Architecture

Defender for IoT is built to provide broad coverage and visibility from diverse data sources. Defender for IoT connects to both cloud and on-premises components, and is built for scalability in large and geographically distributed environments.

[TBD - IMAGE]

### Industries and use cases

This table reviews various industries, and for each industry, specifies the unique security challenges, advantages of using Defender for IoT, and relevant architecture and [deployment options](#deployment-options).

|Industry  |Challenges  |Advantages  |Deployment options  |Architecture |
|---------|---------|---------|---------|---------|
|Oil and gas |- Challenge 1<br>- Challenge 2 |- How D4IoT solves challenge 1<br>- How D4IoT solves challenge 2 |- [Hybrid](#deployment-options)<br>- [On-prem](#deployment-options) |- Hybrid – how it works in this industry + diagram<br>- On-prem – how it works in this industry + diagram |

### Deployment options

You can deploy Defender for IoT in one of three verticals:

- **Cloud**. View data from all connected sensors, and integrate with other Microsoft services, like Microsoft Sentinel.
- **Hybrid**. Connect some of your OT sensors to the cloud and view data on the Azure portal, and keep other sensors managed on-premises only.
- **Air-gapped and on-premises**. Connect your OT network sensors to an on-premises management console for central visibility and control.

## Defender for IoT on Azure and Defender for IoT in the Defender portal

See [Compare Defender for IoT in the Azure portal with Defender for IoT in the Defender portal](compare-defender-azure.md)

## Protect enterprise IoT networks

Extend Defender for IoT's agentless security features beyond OT environments to enterprise IoT devices by using enterprise IoT security with Microsoft Defender for Endpoint, and view related alerts, vulnerabilities, and recommendations for IoT devices in Microsoft Defender XDR.

Enterprise IoT devices can include devices such as printers, smart TVs, and conferencing systems and purpose-built, proprietary devices.

For more information, see Securing IoT devices in the enterprise.

## Supported service regions

Defender for IoT routes all traffic from all European regions to the West Europe regional datacenter. It routes traffic from all remaining regions to the East US regional datacenter.

## Next steps

Review the [prerequisites](prerequisites.md) to get started with Defender for IoT.