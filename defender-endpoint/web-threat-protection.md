---
title: Protect your organization against web threats
description: Learn about web protection in Microsoft Defender for Endpoint and how it can protect your organization.
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.date: 07/25/2024
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-asr
ms.topic: how-to
ms.subservice: asr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Protect your organization against web threats


Web threat protection is part of [Web protection](web-protection-overview.md) in Defender for Endpoint. It uses [network protection](network-protection.md) to secure your devices against web threats. By integrating with Microsoft Edge and popular third-party browsers like Chrome and Firefox, web threat protection stops web threats without a web proxy and can protect devices while they're away or on premises. Web threat protection stops access to phishing sites, malware vectors, exploit sites, untrusted or low-reputation sites, and sites that you've blocked because they're in your [custom indicator list](indicators-overview.md).

> [!NOTE]
> It might take up to two hours for devices to receive new custom indicators.

## Prerequisites

Web threat protection uses network protection to provide web browsing security in Edge (excepting Windows devices), non-Microsoft web browsers and nonbrowser processes. On Windows devices, web threat protection in Edge uses Microsoft Defender SmartScreen and network protection isn't required to be enabled. 

To turn on Microsoft Defender SmartScreen in Edge: [Configure Microsoft Defender SmartScreen](/deployedge/microsoft-edge-policies#smartscreenenabled).

To turn on network protection on your devices:

- Edit the Defender for Endpoint security baseline under **Web & Network Protection** to enable network protection before deploying or redeploying it. [Learn about reviewing and assigning the Defender for Endpoint security baseline](configure-machines-security-baseline.md#review-and-assign-the-microsoft-defender-for-endpoint-security-baseline)
- Turn network protection on using Intune device configuration, SCCM, Group Policy, or your MDM solution. [Read more about enabling network protection](enable-network-protection.md)

> [!NOTE]
> If you set network protection to **Audit only**, blocking is unavailable. Also, you are able to detect and log attempts to access malicious and unwanted websites on Microsoft Edge only.

## Configure web threat protection

The legacy **Web protection** policy in Intune has been deprecated and web threat protection will be enabled if the prerequisites are met.


## Related articles

- [Web protection overview](web-protection-overview.md)
- [Web threat protection](web-threat-protection.md)
- [Monitor web security](web-protection-monitoring.md)
- [Respond to web threats](web-protection-response.md)
- [Network protection](network-protection.md)


