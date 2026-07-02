---
title: Microsoft Defender Antivirus ring deployment appendices for Group Policy and WSUS
description: Supplemental information about security intelligence, engine, and platform updates for Microsoft Defender Antivirus Group Policy and WSUS ring deployments.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.reviewer: yongrhee
ms.localizationpriority: high
ms.collection:
- m365-security
- tier1
- mde-ngp
ms.custom: intro-overview, msecd-doc-authoring-1012
ms.topic: concept-article
ms.subservice: ngp
ms.date: 05/06/2026
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to understand the different Microsoft Defender Antivirus update types so that I can plan my ring deployment schedule.
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
---

# Appendices for Microsoft Defender Antivirus ring deployment using Group Policy and Windows Server Update Services (WSUS)

This article provides supplemental information about security intelligence updates, engine updates, and platform updates for the Microsoft Defender Antivirus ring deployment using Group Policy and Windows Server Update Services (WSUS).

## Prerequisites

### Supported operating systems

- Windows
- Windows Server

## Appendix A - Security Intelligence Updates

Microsoft continually updates security intelligence in antimalware products to cover the latest threats and to constantly tweak detection logic. The updates enhance the ability of Microsoft Defender Antivirus and other Microsoft antimalware solutions to accurately identify threats. This security intelligence works directly with cloud-based protection to deliver fast and powerful AI-enhanced, next-generation protection.

### References

- [Security intelligence updates for Microsoft Defender Antivirus and other Microsoft antimalware](https://www.microsoft.com/wdsi/defenderupdates)

## Appendix B - Engine Updates

Engine updates are updates for the scan engine that's used by security intelligence updates. The scan engine was first released on July 15, 2010.

## Appendix C - Platform Updates

Platform updates are the .exe, .dll, and .sys files for the Microsoft Defender Antivirus service.

|Channel|Version|Revision|Remarks|
|---|---|---|---|
|**Beta Channel - Prerelease**|4.18.2304.4|'23 April, minor rev 4|This channel is the one you want to test for app compatibility, reliability, and performance.|
|**Current Channel (Preview)**|4.18.2303.8|'23 Mar, minor rev 8|Same as for _Beta Channel - Prerelease_.|
|**Current Channel (Staged)**|4.18.2303.7|'23 Mar, minor rev 7|Same as for _Beta Channel - Prerelease_.|
|**Current Channel (Broad)**|4.18.2302.7 <br> see note|'23 Feb, minor rev 7|This channel is the one you want to push out to 90%-100% of your production systems.|

> [!NOTE]
> Where **23** == _2023_, **02** == _February_, and **.7** is the _minor revision_.

## Related content

[Microsoft Defender Antivirus pilot ring deployment using Group Policy and Windows Server Update Services](microsoft-defender-antivirus-pilot-ring-deployment-group-policy-wsus.md)
