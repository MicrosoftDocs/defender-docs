---
title: Device discovery frequently asked questions
description: Find answers to frequently asked questions (FAQs) about device discovery
ms.service: defender-endpoint
ms.subservice: onboard
f1.keywords:
- NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: faq
search.appverid: met150
ms.date: 03/04/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Device discovery frequently asked questions


[!include[Prerelease information](../includes/prerelease.md)]

Find answers to frequently asked questions (FAQs) about device discovery.



## Why is there a discrepancy between "can be onboarded" devices in the device inventory, and the number of "devices to onboard" in the dashboard tile?



## Can I onboard unmanaged devices that were found?

Yes. You can onboard unmanaged devices manually. Unmanaged endpoints in your network introduce vulnerabilities and risks to your network. Onboarding them to the service can increase the security visibility on them.

## I've noticed that unmanaged device health state is always "Active". Why is that?

Temporarily, unmanaged device health state is "Active" during the standard retention period of the device inventory, regardless of their actual state.

## Does standard discovery look like malicious network activity?

When considering Standard discovery, you may be wondering about the implications of probing, and specifically whether security tools might suspect such activity as malicious. The following subsection explains why, in almost all cases, organizations should have no concerns around enabling Standard discovery.  

### Probing is distributed across all Windows devices on the network

As opposed to malicious activity, which would typically scan the entire network from a few compromised devices, Microsoft Defender for Endpoint's Standard discovery probing is initiated from all onboarded Windows devices making the activity benign and non-anomalous. The probing is centrally managed from the cloud to balance the probing attempt between all the supported onboarded devices in the network.  

### Active probing generates negligible amount of extra traffic

Unmanaged devices would typically get probed no more than once in a three-week period and generate less than 50KB of traffic. Malicious activity usually includes high repetitive probing attempts and in some cases data exfiltration that generates a significant amount of network traffic that can be identified as an anomaly by network monitoring tools.

### Your Windows device already runs active discovery

Active discovery capabilities have always been embedded in the Windows operating system, to find nearby devices, endpoints, and printers, for easier "plug and play" experiences and file sharing between endpoints in the network. Similar functionality is implemented in mobile devices, network equipment, and inventory applications just to name a few.  

Standard discovery uses the same discovery methods to identify devices and to have a unified visibility for all the devices in your network in the Microsoft Defender XDR Device Inventory. For example – Standard discovery identifies nearby endpoints in the network the same way Windows lists available printers in the network. 

Network security and monitoring tools are indifferent to such activities performed by devices on the network. 

### Only unmanaged devices are being probed

The device discovery capabilities have been built to only discover and identify unmanaged devices on your network. This means that previously discovered devices that are already onboarded with Microsoft Defender for Endpoint won't be probed.

### You can exclude network lures from active probing

Standard discovery supports exclusion of devices or ranges (subnets) from active probing. If you have network lures deployed in place, you can use the Device Discovery settings to define exclusions based on IP addresses or subnets (a range of IP addresses). Defining those exclusions ensure that those devices won't be actively probed and won't be alerted. Those devices are discovered using passive methods only (similar to Basic discovery mode).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

