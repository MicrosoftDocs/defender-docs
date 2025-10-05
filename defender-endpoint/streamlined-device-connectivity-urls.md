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

|Service|Geography|Category|Port|Endpoint/URL|Description|Required|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Mac|Linux|Comments|
|--------|---------|--------|----|------------|-----------|--------|-------------------------|--------|------------|---|-----|--------|
|Consolidated Defender for Endpoint services|WW|Streamlined connectivity URL|443|*.endpoint.security.microsoft.us|Streamlined connectivity URL consolidation and future services|Required|Yes|No|Yes|Yes|Yes||
|Microsoft Defender SmartScreen|GCC|Reporting and Notifications|443|unitedstates4.ss.wd.microsoft.us|SmartScreen protection, reporting, notifications, Network Protection, custom URL indicators|Required|Yes|||Yes|Yes||
|Microsoft Defender SmartScreen|GCC High|Reporting and Notifications|443|unitedstates1.ss.wd.microsoft.us|SmartScreen protection, reporting, notifications, Network Protection, custom URL indicators|Required|Yes|||Yes|Yes||
|Microsoft Defender SmartScreen|DoD|Reporting and Notifications|443|unitedstates2.ss.wd.microsoft.us|SmartScreen protection, reporting, notifications, Network Protection, custom URL indicators|Required|Yes|||Yes|Yes||

### URLs used for updates

> [!NOTE]
> Depending on your environment, you may apply updates from a file share or update server and do not need to allow (all) direct connections from devices, or these connections are already required and allowed in your environment for other purposes such as Windows updates.

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Mac|Linux|Comments|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|------------|---|-----|--------|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.update.microsoft.com|Security intelligence and product updates|Optional|Yes|Yes|Yes||||Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.delivery.mp.microsoft.com|Security intelligence and product updates|Optional|Yes|Yes|Yes||||Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.windowsupdate.com|Security intelligence and product updates|Optional|Yes|Yes|Yes||||Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.windowsupdate.com|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes||||Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.microsoft.com|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes||||Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes||||Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|

## URLs used for certificate validation checks

> [!NOTE]
> Certificate validation is performed through the Windows operating system, helping to prevent abuse of compromised certificates. This means the operating system must be able to connect to these destinations, or, should be updated with the latest certificate trust lists if they can't retrieve them from Microsoft directly. Read more at https://learn.microsoft.com/windows-server/identity/ad-cs/configure-trusted-roots-disallowed-certificates for more information about management of trusted root certificates in disconnected environments.

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Mac|Linux|Comments|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|------------|---|-----|--------|
|Microsoft Defender for Endpoint|US Gov|CRL|80|crl.microsoft.com/pki/crl/*|Certificate Revocation Lists - required to validate certificates / Used by Windows when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|CRL|80|ctldl.windowsupdate.com|Expands on the existing automatic root update mechanism technology to let certificates that are compromised or untrusted be specifically flagged as untrusted|Required|Yes||||||
|Microsoft Defender for Endpoint|US Gov|CRL|80|www.microsoft.com/pkiops/*|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|CRL|80|http://www.microsoft.com/pki/certs|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||

### Other URLs

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Mac|Linux|Comments|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|------------|---|-----|--------|
|Microsoft Defender for Endpoint|US Gov|Common|443|*.wns.windows.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes||||||Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.microsoftonline.us|Windows Push Notification Services (WNS) - Live Response|Required|Yes||||||Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.live.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes||||||Required for Live Response Performance (Direct Connection/Proxy bypass required)|