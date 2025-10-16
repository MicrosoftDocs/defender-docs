---
title: Microsoft Defender for Endpoint standard connectivity URLs - US government 
description: Get a list of the standard connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US government cloud environments.         
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

# Microsoft Defender for Endpoint standard connectivity URLs - US government

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article includes a list of the standard connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US government cloud environments.

## Prerequisites

## Microsoft Defender URLs

|Service|Geography|Category|Port|Endpoint/URL|Endpoint/URL Description|Required / Optional|Windows 11 / Windows 10 / Server 2022 / 2019 / Server 2016 (Unified Agent) / Server 2012 R2 (Unified Agent)|Windows 7 / 8.1|Windows Server 2008 R2 / 2012 R2 / 2016 (MMA Based)|Mac|Linux|Comments|
|-|-|-|-|-|-|-|-|-|-|-|-|-|
|Microsoft Defender for Endpoint|US Gov|CRL|80|crl.microsoft.com/pki/crl/*|Certificate Revocation Lists - required to validate certificates / Used by Windows when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|CRL|80|ctldl.windowsupdate.com|Expands on the existing automatic root update mechanism technology to let certificates that are compromised or untrusted be specifically flagged as untrusted|Required|Yes||||||
|Microsoft Defender for Endpoint|US Gov|CRL|80|www.microsoft.com/pkiops/*|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|CRL|80|http://www.microsoft.com/pki/certs|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|Common|443|events.data.microsoft.com|Used by the Connected User Experiences and Telemetry component and connects to the Microsoft Data Management service|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|Common|443|*.wns.windows.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|||||Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.microsoftonline.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|||||Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.live.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|||||Required for Live Response Performance (Direct Connection/Proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|settings-win.data.microsoft.com|Connected User Experiences and Telemetry Channel|Optional|Yes|||||Not required for Windows 10 1809 (RS5) and above / Windows 2019|
|Microsoft Defender for Endpoint|US Gov|Common (Mac) (Linux)|443|cdn.x.cp.wd.microsoft.com|Microsoft Defender Antivirus Content Delivery Network (CDN) - Security Intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|Common (Mac)|443|officecdn-microsoft-com.akamaized.net|Microsoft Office Content Delivery Network (CDN) -  Product Updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|US Gov|Microsoft Monitoring Agent (MMA)|443|*.ods.opinsights.azure.us|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes|Yes|||

## Security center URLs

|Service|Geography|URL|Comment|
|---|---|---|---|
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

The processes in this section are exclusively for Microsoft Defender for Endpoint for Windows platforms, including down-level OS. This list does not account for any other Windows communications requirements. 

For more information on how to manage Windows connections, see [Manage connections from Windows 10 and Windows 11 operating system components to Microsoft services](/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services).

While this list will continue to be updated, Microsoft cannot provide any guarantees on it being up-to-date with the latest product or OS changes. Customers should use this list as a baseline and conduct their testing before using it directly in production.

## Windows 11, Windows 10, Windows Server 2022 and Windows Server 2019

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
|SenseTVM.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense TVM (Threat Vulnerability Management)|


## Windows Server 2016 and Windows Server 2012 R2 (Unified Agent)

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

## Windows 8.1 and Windows Server 2016 (MMA Based)

|Path|Comment|
|-|-|
|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service Host Process|
|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service|
|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Cloud Connection Test utility|
|C:\Program Files\Windows Defender|Microsoft Defender Antivirus command-line utility|
|C:\Program Files\Windows Defender|Microsoft Defender Antivirus service executable|
|C:\Program Files\Windows Defender|Microsoft Security Client Policy Configuration Tool|
|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Network Realtime Inspection|

## Windows 7 SP1, Windows Server 2012 R2 and Windows Server 2008 R2 (MMA Based)

|Path|Comment|
|-|-|
|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service Host Process|
|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service|
|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Cloud Connection Test utility|
|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus command-line utility (SCEP)|
|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus service executable (SCEP)|
|C:\Program Files\Microsoft Security Client|Microsoft Security Client Policy Configuration Tool (SCEP)|
|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus Network Realtime Inspection (SCEP)|