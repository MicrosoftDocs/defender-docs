---
title: Microsoft Defender for Endpoint streamlined connectivity URLs - US government environments (Preview)
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
ms.date: 12/25/2025
appliesto: Microsoft Defender for Endpoint Plan 1, Microsoft Defender for Endpoint Plan 2, Microsoft Defender XDR
---

# Microsoft Defender for Endpoint streamlined connectivity URLs - US government environments (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

This article includes a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US Government cloud environments (GCC, GCC High, DoD).

## Prerequisites

See the prerequisites for [streamlined connectivity](configure-device-connectivity.md#prerequisites).

### Notes

- Devices running Defender for Endpoint delivered via the Microsoft Monitoring Agent (MMA, also known as the Log Analytics Agent - specifically, Windows 7 SP1, Windows 8.1, Windows Server 2008 R2 and those Windows Server 2012 R2, 2016 devices not upgraded to the modern unified solution) will continue using the associated legacy method. For the list of additional URLs, refer to the Windows 7, 8.1, 2008R2 (MMA) tab.

- Devices running Windows version 1607, 1703, 1709, 1803 can onboard using the new onboarding package but still require a longer list of URLs. The Windows 1607 to 1803 tab lists the additional URLs required.

## US Gov URLs

### General URLs

> [!NOTE]
> Make sure  your devices meet all component (app/antimalware platform, engine, EDR  sensor) update versions and OS requirements else onboarding might be  unsuccessful. You can re-onboard devices to switch them to streamlined  connectivity if they meet these requirements.

|Service|Geography|Category|Port|Endpoint/URL|Description|Required|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|Mac|Linux|
|--------|---------|--------|----|------------|-----------|--------|-------------------------|--------|------------|---|-----|
|Consolidated Defender for Endpoint services|USGov|Streamlined connectivity URL|443|*.endpoint.security.microsoft.us|Streamlined connectivity URL consolidation and future services|Required|Yes|No|Yes|Yes|Yes||
|Microsoft Defender SmartScreen|GCC|Reporting and Notifications|443|unitedstates4.ss.wd.microsoft.us|SmartScreen protection, reporting, notifications, Network Protection, custom URL indicators|Required|Yes|||Yes|Yes|
|Microsoft Defender SmartScreen|GCC High|Reporting and Notifications|443|unitedstates1.ss.wd.microsoft.us|SmartScreen protection, reporting, notifications, Network Protection, custom URL indicators|Required|Yes|||Yes|Yes|
|Microsoft Defender SmartScreen|DoD|Reporting and Notifications|443|unitedstates2.ss.wd.microsoft.us|SmartScreen protection, reporting, notifications, Network Protection, custom URL indicators|Required|Yes|||Yes|Yes|

> [!NOTE]
> Microsoft Defender SmartScreen reporting and notifications. Network Protection and custom URL indicators

### URLs used for updates

> [!NOTE]
> Depending on your environment, you may apply updates from a file share or update server and don't need to allow (all) direct connections from devices, or these connections are already required and allowed in your environment for other purposes such as Windows updates.

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|Win 7/8.1|Server (MMA)|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|------------|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.update.microsoft.com|Security intelligence and product updates|Optional|Yes|Yes|Yes|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.delivery.mp.microsoft.com|Security intelligence and product updates|Optional|Yes|Yes|Yes|
|Microsoft Defender Antivirus|US Gov|MU/WU|443|*.windowsupdate.com|Security intelligence and product updates|Optional|Yes|Yes|Yes|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.windowsupdate.com|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.microsoft.com|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx|Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|

> [!NOTE]
> Optional if updates are managed internally (WSUS/FileShare/ConfigMgr)

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

|Service|Geography|Category|Port|Endpoint/URL|Description|Required/Optional|Win 11/10/Server (Unified)|
|--------|---------|--------|----|------------|-----------|-----------------|-------------------------|--------|
|Microsoft Defender for Endpoint|US Gov|Common|443|*.wns.windows.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.microsoftonline.us|Windows Push Notification Services (WNS) - Live Response|Required|Yes|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.live.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|

> [!NOTE]
> Required for Live Response Performance (Direct Connection/Proxy bypass required)

## Security center URLs

|Service|Geography|URL|
|-------|---------|---|
|Microsoft Defender for Endpoint|US Gov|*.blob.core.usgovcloudapi.net|
|Microsoft Defender for Endpoint|US Gov|crl.microsoft.com|
|Microsoft Defender for Endpoint|US Gov|https://*.microsoftonline-p.com|
|Microsoft Defender for Endpoint|US Gov|https://secure.aadcdn.microsoftonline-p.com|
|Microsoft Defender for Endpoint|US Gov|https://static2.sharepointonline.com|
|Microsoft Defender for Endpoint|GCC|https://login.microsoftonline.com|
|Microsoft Defender for Endpoint|GCC|https://*.gcc.securitycenter.microsoft.us|
|Microsoft Defender for Endpoint|GCC|https://onboardingpckgsusmvprd.blob.core.usgovcloudapi.net|
|Microsoft Defender for Endpoint|GCC High|https://login.microsoftonline.us|
|Microsoft Defender for Endpoint|GCC High|https://*.securitycenter.microsoft.us|
|Microsoft Defender for Endpoint|GCC High|https://onboardingpckgsusgvprd.blob.core.usgovcloudapi.net|
|Microsoft Defender for Endpoint|DoD|https://login.microsoftonline.us|
|Microsoft Defender for Endpoint|DoD|https://*.securitycenter.microsoft.us|
|Microsoft Defender for Endpoint|DoD|https://onboardingpckgsusgvprd.blob.core.usgovcloudapi.net|

> [!NOTE]
> Microsoft Defender Security Center Portal URL

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