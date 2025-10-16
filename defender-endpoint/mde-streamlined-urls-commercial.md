---
title: Microsoft Defender for Endpoint streamlined connectivity URLs (Commercial) 
description: Get a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US commercial cloud environments.         
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
ms.date: 10/16/2025
appliesto: Microsoft Defender for Endpoint Plan 1, Microsoft Defender for Endpoint Plan 2, Microsoft Defender XDR
---

# Microsoft Defender for Endpoint streamlined connectivity URLs (Commercial)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article includes a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US Government cloud environments (GCC, GCC High, DoD).

## Prerequisites

### Operating systems

- Windows 10 version 1809+
- Windows 11
- Windows Server 2019
- Windows Server 2022
- Windows Server 2012 R2, Server 2016 R2, fully updated running the modern unified solution (installation through MSI) released in 2022
- macOS supported versions with Defender for Endpoint product version 101.24022.*+
- Linux supported versions with Defender for Endpoint product version 101.24022.*+

### Windows Minimum Component Versions

- Defender antimalware client: 4.18.2211.5 (November 2022)
- Defender antimalware engine: 1.1.19900.2
- Defender security intelligence: 1.391.315.0
- Defender detection sensor (Sense) version: >10.8040.*/ March 8th 2022+

### Mac/Linux Minimum Component Versions

App/product version (macOS/Linux): 101.24022.*+

### Notes

- Devices running Defender for Endpoint delivered via the Microsoft Monitoring Agent (MMA, also known as the Log Analytics Agent - specifically, Windows 7 SP1, Windows 8.1, Windows Server 2008 R2 and those Windows Server 2012 R2, 2016 devices not upgraded to the modern unified solution) will continue using the associated legacy method. For the list of additional URLs, refer to the Windows 7, 8.1, 2008R2 (MMA) tab.

- Devices running Windows version 1607, 1703, 1709, 1803 can onboard using the new onboarding package but still require a longer list of URLs. The Windows 1607 to 1803 tab lists the additional URLs required.

## US Gov URLs

### General URLs

> [!NOTE]
> Make sure  your devices meet all component (app/antimalware platform, engine, EDR  sensor) update versions and OS requirements else onboarding may be  unsuccessful. You may re-onboard devices to switch them to streamlined  connectivity if they meet these requirements.

|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|Comments|OS|
|-|-|-|-|-|-|-|
|Core Defender for Endpoint services|443|*.endpoint.security.microsoft.com|Core Defender for Endpoint services. Formerly: MAPS, Malware Sample Submission Storage, AutoIR Sample Storage, Command and Control, Cyber data.|Required|Core MDE services. Prerequisites must be met to successfully connect to the new URL patterns.|All|
|Web & network protection|443|*.smartscreen-prod.microsoft.com *.smartscreen.microsoft.com|Used for Microsoft Defender SmartScreen browsing protection, reporting, notifications and web content filtering. Network/web protection and custom URL/IP indicators.|Required|Optional in disconnected environments where web browsing and connectivity to external destinations is limited. Required for custom URL/IP indicators.|All|
|SmartScreen|443|*.smartscreen.microsoft.com *.checkappexec.microsoft.com *.urs.microsoft.com|Used for Microsoft Defender SmartScreen to check application execution for trusted apps|Optional|Needed for checking reputation/trust for downloaded applications|Windows|

## URLs used for updates 

> [!NOTE]
> Depending on your environment, you may apply updates from a file share or update server and do not need to allow (all) direct connections from devices, or these connections are already required and allowed in your environment for other purposes such as Windows updates.

|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|Comments|OS|
|-|-|-|-|-|-|-|
|Linux app/platform updates|443|packages.microsoft.com|Official Microsoft repository to download and update the Linux product|Required|Optional if distributing/upgrading Linux installations using a different method|Linux|
|Mac app/platform updates|443|officecdn-microsoft-com.akamaized.net|Microsoft Office Content Delivery Network (CDN) - product updates for macOS|Required|Optional if distributing/upgrading macOS installations using a different method. Leverages the Microsoft AutoUpdate app also used for updating other Microsoft apps such as Office for Mac.|macOS|
|Windows/Mac/Linux security intelligence updates  Windows antimalware platform updates (alternative download location / direct from Defender cloud)|443|go.microsoft.com definitionupdates.microsoft.com https://www.microsoft.com/security/encyclopedia/adlpackages.aspx|Microsoft Defender Antivirus Content Delivery Network (CDN) URLs - Security Intelligence and Windows antimalware platform updates. Linux and macOS clients use this location as the primary download location.|Required|Optional if updates are being downloaded and distributed centrally (WSUS/Mirror/ConfigMgr)  Windows clients use this location as an alternative ("MMPC") or as a fallback location when other configured sources fail, and retrieves update packages as determined by the redirection logic.|All|
|Windows security intelligence and antimalware platform updates, product updates to EDR sensors.   (when using Microsoft/Windows update as the source/method)|443|*.update.microsoft.com *.delivery.mp.microsoft.com *.windowsupdate.com *.download.windowsupdate.com *.download.microsoft.com|Security intelligence and antimalware platform updates, when the client is configured to download Defender updates from Windows Update, will be downloaded as they become available.|Required|Optional if updates are being downloaded and distributed centrally (WSUS/Mirror/ConfigMgr)  EDR sensor updates always come as part of regular Windows update release cadence/cycle. EDR logic updates come directly from Defender cloud (command and control). For Windows Server 2012 R2 and 2016, KB5005292 is the update package used to perform periodic updates to the EDR sensor stack.|Windows|

## URLs used for certificate validation checks 

> [!NOTE]
> Certificate validation is performed through the Windows operating system, helping to prevent abuse of compromised certificates. This means the operating system must be able to connect to these destinations, or, should be updated with the latest certificate trust lists if they can't retrieve them from Microsoft directly. Read more at https://learn.microsoft.com/windows-server/identity/ad-cs/configure-trusted-roots-disallowed-certificates for more information about management of trusted root certificates in disconnected environments.

|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|Comments|OS|
|-|-|-|-|-|-|-|
|Windows operating system certificate validation checks|80|www.microsoft.com/pkiops/* www.microsoft.com/pki/*|Used when creating the SSL connection to MAPS for updating the CRL|Required|Optional if updates to Windows root certificate trust lists are being managed through other methods in the environment. If Cloud-delivered protection is unable to connect to this destination through a proxy, add registry setting "SSLOptions" with value 0. Registry path:"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"|Windows|
|||ctldl.windowsupdate.com|Expands on the existing automatic root update mechanism technology to let certificates that are compromised or untrusted be specifically flagged as untrusted|Required|Optional if updates to Windows root certificate trust lists are being managed through other methods in the environment. If Cloud-delivered protection is unable to connect to this destination through a proxy, add registry setting "SSLOptions" with value 0. Registry path:"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"|
|||crl.microsoft.com|Certificate Revocation Lists - required to validate certificates|Required|Optional if updates to Windows root certificate trust lists are being managed through other methods in the environment. If Cloud-delivered protection is unable to connect to this destination through a proxy, add registry setting "SSLOptions" with value 0. Registry path:"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"|

## Other URLs

|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|Comments|OS|
|-|-|-|-|-|-|-|
|Live response (push notification model only)|443|login.microsoftonline.com *.wns.windows.com login.live.com|Windows Push Notification Services (WNS) for Live Response is used to expedite live response connections to Windows clients. This service cannot be used through a proxy.|Optional|Improves live response connection initiation speed (Direct Connection/Proxy bypass required) on Windows client (non-server) operating systems|Windows|
|Vulnerability management network scanner standalone tool|443|*.security.microsoft.com *.blob.core.windows.net/networkscannerstable/* login.windows.net|Required for the vulnerability management assessment tool for network devices (network scanner) downloaded from the portal.|Optional|Tool is supported on Windows 8 and above and Windows Server 2012 and above|Windows|

### URLs used for updates

> [!NOTE]
> Depending on your environment, you may apply updates from a file share or update server and do not need to allow (all) direct connections from devices, or these connections are already required and allowed in your environment for other purposes such as Windows updates.

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Comments|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|------------|--------|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.update.microsoft.com|Security intelligence and product updates|Optional|Yes|Yes|Yes|Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.delivery.mp.microsoft.com|Security intelligence and product updates|Optional|Yes|Yes|Yes|Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.windowsupdate.com|Security intelligence and product updates|Optional|Yes|Yes|Yes|Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.windowsupdate.com|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.microsoft.com|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)|

## URLs used for certificate validation checks

> [!NOTE]
> Certificate validation is performed through the Windows operating system, helping to prevent abuse of compromised certificates. This means the operating system must be able to connect to these destinations, or, should be updated with the latest certificate trust lists if they can't retrieve them from Microsoft directly. For more information, see [Configure trusted roots and disallowed certificates in Windows](/windows-server/identity/ad-cs/configure-trusted-roots-disallowed-certificates).

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Mac|Linux|Comments|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|------------|---|-----|--------|
|Microsoft Defender for Endpoint|US Gov|CRL|80|crl.microsoft.com/pki/crl/*|Certificate Revocation Lists - required to validate certificates / Used by Windows when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|CRL|80|ctldl.windowsupdate.com|Expands on the existing automatic root update mechanism technology to let certificates that are compromised or untrusted be specifically flagged as untrusted|Required|Yes||||||
|Microsoft Defender for Endpoint|US Gov|CRL|80|www.microsoft.com/pkiops/*|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|CRL|80|http://www.microsoft.com/pki/certs|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||

### Other URLs

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Comments|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|
|Microsoft Defender for Endpoint|US Gov|Common|443|*.wns.windows.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.microsoftonline.us|Windows Push Notification Services (WNS) - Live Response|Required|Yes|Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.live.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|Required for Live Response Performance (Direct Connection/Proxy bypass required)|

## Security center URLs

|Service|Geography|URL|Comment|
|-------|---------|---|-------|
|Microsoft Defender for Endpoint|US Gov|*.blob.core.usgovcloudapi.net|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|US Gov|crl.microsoft.com|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|US Gov|https://*.microsoftonline-p.com|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|US Gov|https://secure.aadcdn.microsoftonline-p.com|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|US Gov|https://static2.sharepointonline.com|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|GCC|https://login.microsoftonline.com|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|GCC|https://*.gcc.securitycenter.microsoft.us|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|GCC|https://onboardingpckgsusmvprd.blob.core.usgovcloudapi.net|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|GCC High|https://login.microsoftonline.us|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|GCC High|https://*.securitycenter.microsoft.us|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|GCC High|https://onboardingpckgsusgvprd.blob.core.usgovcloudapi.net|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|DoD|https://login.microsoftonline.us|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|DoD|https://*.securitycenter.microsoft.us|Microsoft Defender Security Center Portal URL|
|Microsoft Defender for Endpoint|DoD|https://onboardingpckgsusgvprd.blob.core.usgovcloudapi.net|Microsoft Defender Security Center Portal URL|

## Microsoft Defender processes

### Windows 11, Windows 10, Windows Server 2022 and Windows Server 2019

|Process|Path|Comment|
|-------|----|-------|
|MpCmdRun.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus command-line utility|
|MpDlpCmd.exe|C:\Program Files\Windows Defender|Microsoft Endpoint DLP command-line utility|
|MsMpEng.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus service executable|
|ConfigSecurityPolicy.exe|C:\Program Files\Windows Defender|Microsoft Security Client Policy Configuration Tool|
|NisSrv.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Network Realtime Inspection|
|MsSense.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint service executable|
|SenseCnCProxy.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint communication module|
|SenseIR.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense IR (Incident Response) module|
|SenseCE.exe|C:\Program Files\Windows Defender Advanced Threat Protection\Classification|Microsoft Defender for Endpoint Sense CE (Classification Engine) module|
|SenseSampleUploader.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sample Upload module|
|SenseNdr.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense NDR (Network Detection and Response) module|
|SenseSC.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense SC (Screenshot Capture) module|
|SenseCM.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense CM (Configuration Management)|

### Windows Server 2016 and Windows Server 2012 R2 (Unified Agent)

|Process|Path|Comment|
|-------|----|-------|
|MsSense.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint service executable|
|SenseCnCProxy.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint communication module|
|SenseIR.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense IR (Incident Response) module|
|SenseSampleUploader.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sample Upload module|
|SenseCM.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense CM (Configuration Management)|
|MpCmdRun.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus command-line utility|
|MsMpEng.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus service executable|
|ConfigSecurityPolicy.exe|C:\Program Files\Windows Defender|Microsoft Security Client Policy Configuration Tool|
|NisSrv.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Network Realtime Inspection|
|SenseTVM.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense TVM (Threat Vulnerability Management)|

### Windows 7 SP1, Windows Server 2012 R2 and Windows Server 2008 R2 (MMA Based)

|Process|Path|Comment|
|-------|----|-------|
|MonitoringHost.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service Host Process|
|HealthService.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service|
|TestCloudConnection.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Cloud Connection Test utility|
|MpCmdRun.exe|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus command-line utility (SCEP)|
|MsMpEng.exe|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus service executable (SCEP)|
|ConfigSecurityPolicy.exe|C:\Program Files\Microsoft Security Client|Microsoft Security Client Policy Configuration Tool (SCEP)|
|NisSrv.exe|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus Network Realtime Inspection (SCEP)|