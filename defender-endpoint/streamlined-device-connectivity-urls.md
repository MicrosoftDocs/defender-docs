---
title: Microsoft Defender for Endpoint streamlined connectivity URLs (US Gov / GCC / GCC High / DoD) 
description: Get a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US Government cloud environments (GCC, GCC High, DoD).         
author: limwainstein
ms.author: lwainstein
manager: bagol
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium 
ms.collection: 
- m365-security
- tier1
ms.reviewer: pahuijbr
search.appverid: MET150
audience: ITPro
ms.date: 08/09/2025
appliesto: Microsoft Defender for Endpoint Plan 1, Microsoft Defender for Endpoint Plan 2, Microsoft Defender XDR
---

# Microsoft Defender for Endpoint - Streamlined connectivity URLs (US Gov / GCC / GCC High / DoD)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article includes a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US Government cloud environments (GCC, GCC High, DoD).

## US Gov URLs

### General URLs

> [!NOTE]
> Make sure  your devices meet all component (app/antimalware platform, engine, EDR  sensor) update versions and OS requirements else onboarding may be  unsuccessful. You may re-onboard devices to switch them to streamlined  connectivity if they meet these requirements.

| Service                                     | Geography | Category                                  | Port | Endpoint/URL                     | Endpoint/URL  Description                                    | Required  / Optional | Windows  11 / Windows 10 / Server 2022 / 2019 /      Server 2016 (Unified Agent) / Server 2012 R2 (Unified Agent) | Windows  7 / 8.1 | Windows  Server 2008 R2 / 2012 R2 / 2016      (MMA Based) | Mac  | Linux | Comments                                                     |
| ------------------------------------------- | --------- | ----------------------------------------- | ---- | -------------------------------- | ------------------------------------------------------------ | -------------------- | ------------------------------------------------------------ | ---------------- | --------------------------------------------------------- | ---- | ----- | ------------------------------------------------------------ |
| Consolidated Defender for Endpoint services | WW        | Streamlined  connectivity new URL pattern | 443  | *.endpoint.security.microsoft.us | Used for  streamlined connectivity URL consolidation as well as for future services | Required             | Yes                                                          | No               | Yes                                                       | Yes  | Yes   |                                                              |
| Microsoft Defender  SmartScreen             | GCC       | Reporting and Notifications               | 443  | unitedstates4.ss.wd.microsoft.us | Used for Microsoft Defender SmartScreen protection,  reporting, and notifications. MDAV Network Protection and custom URL  indicators | Required             | Yes                                                          |                  |                                                           | Yes  | Yes   | Microsoft Defender SmartScreen reporting and notifications.  Network Protection and custom URL indicators |
| Microsoft Defender SmartScreen              | GCC High  | Reporting  and Notifications              | 443  | unitedstates1.ss.wd.microsoft.us | Used for  Microsoft Defender SmartScreen protection, reporting, and notifications. MDAV  Network Protection and custom URL indicators | Required             | Yes                                                          |                  |                                                           | Yes  | Yes   | Microsoft  Defender SmartScreen reporting and notifications. Network Protection and  custom URL indicators |
| Microsoft Defender  SmartScreen             | DoD       | Reporting and Notifications               | 443  | unitedstates2.ss.wd.microsoft.us | Used for Microsoft Defender SmartScreen protection,  reporting, and notifications. MDAV Network Protection and custom URL  indicators | Required             | Yes                                                          |                  |                                                           | Yes  | Yes   | Microsoft Defender SmartScreen reporting and notifications.  Network Protection and custom URL indicators |

### URLs used for updates

> [!NOTE]
> Depending on your environment, you may apply updates from a file share or update server and do not need to allow (all) direct connections from devices, or these connections are already required and allowed in your environment for other purposes such as Windows updates.

| Service                        | Geography | Category | Port | Endpoint/URL                                         | Description                                                                                       |
|--------------------------------|-----------|----------|------|------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Microsoft Defender Antivirus    | US Gov    | MU/WU    | 443  | *.update.microsoft.com                               | Security intelligence and product updates                                                        |
| Microsoft Defender Antivirus    | US Gov    | MU/WU    | 443  | *.delivery.mp.microsoft.com                          | Security intelligence and product updates                                                        |
| Microsoft Defender Antivirus    | US Gov    | MU/WU    | 443  | *.windowsupdate.com                                  | Security intelligence and product updates                                                        |
| Microsoft Defender Antivirus    | US Gov    | MU (ADL) | 443  | *.download.windowsupdate.com                         | Alternate location for Microsoft Defender Antivirus Security intelligence updates                 |
| Microsoft Defender Antivirus    | US Gov    | MU (ADL) | 443  | *.download.microsoft.com                             | Alternate location for Microsoft Defender Antivirus Security intelligence updates                 |
| Microsoft Defender Antivirus    | US Gov    | MU (ADL) | 443  | fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx | Alternate location for Microsoft Defender Antivirus Security intelligence updates         |