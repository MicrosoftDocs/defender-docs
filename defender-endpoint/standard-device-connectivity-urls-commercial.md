---
title: Microsoft Defender for Endpoint standard connectivity URLs - commercial 
description: Get a list of the standard connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US commercial cloud environments.         
author: limwainstein
ms.author: lwainstein
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

# Microsoft Defender for Endpoint standard connectivity URLs - commercial

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article includes a list of the standard connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in commercial cloud environments.

## Microsoft Defender URLs

|Service|Geography|Category|Port|Endpoint/URL|Endpoint/URL Description|Required or Optional|Windows 10, 11; Server 2022, 2019, 2016 (Unified Agent); Server 2012 R2 (Unified Agent)|Windows 7, 8.1|Windows Server 2008 R2, 2012 R2, 2016 (MMA Based)|Mac|Linux|Comments|
|---|---|---|---|---|---|---|---|---|---|---|---|---|
|Microsoft Defender for Endpoint|WW|CRL|80|`crl.microsoft.com`|Certificate Revocation Lists - required to validate certificates / Used by Windows when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|WW|CRL|80|`ctldl.windowsupdate.com`|Expands on the existing automatic root update mechanism technology to let certificates that are compromised or untrusted be specifically flagged as untrusted|Required|Yes||||||
|Microsoft Defender for Endpoint|WW|CRL|80|`www.microsoft.com/pkiops/*`|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|WW|CRL|80|`www.microsoft.com/pki/*`|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|WW|Common|443|`events.data.microsoft.com`|Used by the Connected User Experiences and Telemetry component and connects to the Microsoft Data Management service|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|WW|Common|443|`*.wns.windows.com`|Windows Push Notification Services (WNS) - Live Response|Optional|Yes|||||Required for Live Response Performance (Direct Connection or proxy bypass required)|
|Microsoft Defender for Endpoint|WW|Common|443|`login.microsoftonline.com`|Windows Push Notification Services (WNS) - Live Response / Vulnerability assessment for network devices / Security Management for Microsoft Defender for Endpoint - Azure Registration|Optional|Yes|Yes|Yes|||Required for Live Response Performance (Direct Connection or proxy bypass required). Required when using Security Management for Microsoft Defender for Endpoint|
|Microsoft Defender for Endpoint|WW|Common|443|`login.live.com`|Windows Push Notification Services (WNS) - Live Response|Optional|Yes|||||Required for Live Response Performance (Direct Connection or proxy bypass required)|
|Microsoft Defender for Endpoint|WW|Common|443|`settings-win.data.microsoft.com`|Connected User Experiences and Telemetry Channel|Optional|Yes|||||Only required for Windows 10 1703 and below. Not required on Windows Server.|
|Microsoft Defender for Endpoint|WW|Common (Mac/Linux)|443|`x.cp.wd.microsoft.com`|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|WW|Common (Mac/Linux)|443|`cdn.x.cp.wd.microsoft.com`|Microsoft Defender Antivirus Content Delivery Network (CDN) - Security Intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|WW|Common (Mac/Linux)|443|`officecdn-microsoft-com.akamaized.net`|Microsoft Office Content Delivery Network (CDN) - Product Updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|WW|Common (Mac/Linux)|443|Root URLs for public Microsoft CDN endpoints (referred to as ChannelURL) - for the updated URL, see [Using Custom channel and ManifestServer to control updates](/microsoft-365-apps/mac/mau-configure-organization-specific-updates)|Microsoft Office Content Delivery Network (CDN) - Product Updates|Required||||Yes|Yes|New CDN endpoint starting with macOS build 101.26012.0012|
|Microsoft Defender for Endpoint|WW|Common (Linux)|443|`packages.microsoft.com`|Required to download and update the MDE Linux agent|Required|||||Yes||
|Microsoft Defender for Endpoint|WW|Microsoft Defender for Endpoint|443|`login.windows.net`|Microsoft Defender for Endpoint Vulnerability assessment for network devices (network scanner)|Optional|Yes|Yes|Yes|||Supported on Windows 8 and above and Windows Server 2012 and above|
|Microsoft Defender for Endpoint|WW|Microsoft Defender for Endpoint|443|`*.security.microsoft.com`|Microsoft Defender for Endpoint Vulnerability assessment for network devices (network scanner)|Optional|Yes|Yes|Yes|||Supported on Windows 8 and above and Windows Server 2012 and above|
|Microsoft Defender for Endpoint|WW|Microsoft Defender for Endpoint|443|`*.blob.core.windows.net/networkscannerstable/*`|Microsoft Defender for Endpoint Vulnerability assessment for network devices (network scanner)|Optional|Yes|Yes|Yes|||Supported on Windows 8 and above and Windows Server 2012 and above|
|Microsoft Defender for Endpoint|WW|Security Management|443|`enterpriseregistration.windows.net`|Security Management for Microsoft Defender for Endpoint - Azure Registration|Optional|Yes|||||Only required when using Security Management for Microsoft Defender for Endpoint|
|Microsoft Defender for Endpoint|WW|Security Management|443|`*.dm.microsoft.com`|Security Management for Microsoft Defender for Endpoint - Enrollment, check-in, and reporting|Optional|Yes|||||Only required when using Security Management for Microsoft Defender for Endpoint|
|Microsoft Defender for Endpoint|WW|Microsoft Monitoring Agent (MMA)|443|`*.ods.opinsights.azure.com`|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes|Yes|||Required when using MMA, refer to the unified solution for Windows Server 2012 R2 and 2016. Refer to steps at <https://aka.ms/mde_network_requirements> to eliminate wildcards (*)|
|Microsoft Defender for Endpoint|WW|Microsoft Monitoring Agent (MMA)|443|`*.oms.opinsights.azure.com`|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes|Yes|||Required when using MMA, refer to the unified solution for Windows Server 2012 R2 and 2016. Refer to steps at <https://aka.ms/mde_network_requirements> to eliminate wildcards (*)|
|Microsoft Defender for Endpoint|WW|Microsoft Monitoring Agent (MMA)|443|`*.blob.core.windows.net`|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes|Yes|||Required when using MMA, refer to the unified solution for Windows Server 2012 R2 and 2016. Refer to steps at <https://aka.ms/mde_network_requirements> to eliminate wildcards (*)|
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`unitedstates.x.cp.wd.microsoft.com`|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`us.vortex-win.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Yes|||||Not required for Windows 10 1803 (RS4) and above / Windows Server 2019 and above|
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`us-v20.events.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`winatp-gw-cus.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`winatp-gw-eus.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`winatp-gw-cus3.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`winatp-gw-eus3.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`automatedirstrprdcus.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`automatedirstrprdeus.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`automatedirstrprdcus3.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`automatedirstrprdeus3.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus1eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus2eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus3eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus4eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`wsus1eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`wsus2eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus1westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus2westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus3westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`ussus4westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`wsus1westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|`wsus2westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`europe.x.cp.wd.microsoft.com`|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`eu.vortex-win.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Yes|||||Not required for Windows 10 1803 (RS4) and above / Windows Server 2019 and above|
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`eu-v20.events.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`winatp-gw-neu.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`winatp-gw-weu.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`winatp-gw-neu3.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`winatp-gw-weu3.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`automatedirstrprdneu.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`automatedirstrprdweu.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`automatedirstrprdneu3.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`automatedirstrprdweu3.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`usseu1northprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`wseu1northprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`usseu1westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|`wseu1westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`unitedkingdom.x.cp.wd.microsoft.com`|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`uk.vortex-win.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Yes|||||Not required for Windows 10 1803 (RS4) and above / Windows Server 2019 and above|
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`uk-v20.events.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`winatp-gw-uks.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`winatp-gw-ukw.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`automatedirstrprduks.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`automatedirstrprdukw.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`ussuk1southprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`wsuk1southprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`ussuk1westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|`wsuk1westprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`australia.x.cp.wd.microsoft.com`|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required||||Yes|Yes||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`au.vortex-win.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Yes|||||Not required for Windows 10 1803 (RS4) and above / Windows Server 2019 and above|
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`au-v20.events.data.microsoft.com`|Microsoft Defender for Endpoint EDR Cyber Data|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`winatp-gw-aue.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`winatp-gw-aus.microsoft.com`|Microsoft Defender for Endpoint Command and Control|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`automatedirstrprdaue.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`automatedirstrprdaus.blob.core.windows.net`|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`ussau1southeastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|`ussau1eastprod.blob.core.windows.net`|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender Antivirus|WW|UTC|443|`vortex-win.data.microsoft.com`|Used by Windows to send client diagnostic data; Microsoft Defender Antivirus uses this for product quality monitoring purposes|Optional|Yes|||||Not required for Windows 10 1803 (RS4) and above / Windows Server 2019|
|Microsoft Defender Antivirus|WW|MU / WU|443|`*.update.microsoft.com`|MU / WU - Security intelligence and product updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|WW|MU / WU|443|`*.delivery.mp.microsoft.com`|MU / WU - Security intelligence and product updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|WW|MU / WU|443|`*.windowsupdate.com`|MU / WU - Security intelligence and product updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|WW|MU / WU|443|`go.microsoft.com`|MU / WU - Security intelligence and product updates|Required|Yes*|Yes*|Yes*|Yes|Yes|*Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr) <br> Required for Mac and Linux platforms|
|Microsoft Defender Antivirus|WW|MU / WU|443|`definitionupdates.microsoft.com`|MU / WU - Security intelligence and product updates|Required|Yes*|Yes*|Yes*|Yes|Yes|*Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr) <br> Required for Mac and Linux platforms|
|Microsoft Defender Antivirus|WW|MU / WU|443|`https://www.microsoft.com/security/encyclopedia/adlpackages.aspx`|MU / WU - Security intelligence and product updates|Required|Yes*|Yes*|Yes|Yes|Yes|*Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr) <br> Required for Mac and Linux platforms|
|Microsoft Defender Antivirus|WW|MU (ADL)|443|`*.download.windowsupdate.com`|ADL - Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|WW|MU (ADL)|443|`*.download.microsoft.com`|ADL - Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|WW|MU (ADL)|443|`fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx`|ADL - Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|WW|MAPS|443|`*.wdcp.microsoft.com`|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender Antivirus|WW|MAPS|443|`*.wd.microsoft.com`|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required|Yes|Yes|Yes|Yes|Yes||
|Microsoft Defender Antivirus|WW|Common|443|`*.events.data.microsoft.com`|Used by Microsoft Defender Antivirus to send Diagnostic Telemetry for Microsoft Defender Core Service|Required|Yes|No|Yes|No|No|To enhance your endpoint security experience, Microsoft is releasing the Microsoft Defender Core service to help with the stability and performance of Microsoft Defender Antivirus. Alternatively, to wildcard, can allow: us-mobile.events.data.microsoft.com/OneCollector/1.0 eu-mobile.events.data.microsoft.com/OneCollector/1.0 uk-mobile.events.data.microsoft.com/OneCollector/1.0 au-mobile.events.data.microsoft.com/OneCollector/1.0 mobile.events.data.microsoft.com/OneCollector/1.0|
|Microsoft Defender Antivirus|WW|Common|443|`*ecs.office.com/config/v1/MicrosoftWindowsDefenderClient`|Used by Microsoft Defender Antivirus to download internal feature configurations (ECS) for Microsoft Defender Core service|Required|Yes|No|Yes|No|No|Microsoft Defender Core service is used to enhance stability and performance of Microsoft Defender Antivirus for customers.|
|Microsoft Defender SmartScreen|WW|Reporting and Notifications|443|`*.smartscreen-prod.microsoft.com`|Used for Microsoft Defender SmartScreen protection, reporting, and notifications. Microsoft Defender Antivirus Network Protection and custom URL indicators|Required|Yes|||Yes|Yes|Microsoft Defender SmartScreen reporting and notifications. Network Protection and custom URL indicators|
|Microsoft Defender SmartScreen|WW|Reporting and Notifications|443|`*.smartscreen.microsoft.com`|Used for Microsoft Defender SmartScreen protection, reporting, and notifications. Microsoft Defender Antivirus Network Protection and custom URL indicators|Required|Yes|||Yes|Yes|Microsoft Defender SmartScreen reporting and notifications. Network Protection and custom URL indicators|
|Microsoft Defender SmartScreen|WW|Reporting and Notifications|443|`*.checkappexec.microsoft.com`|Used for Microsoft Defender SmartScreen to check application execution for trusted apps|Optional|Yes|||||Microsoft Defender SmartScreen checking application execution for trusted apps|
|Microsoft Defender SmartScreen|WW|Reporting and Notifications|443|`*.urs.microsoft.com`|Used for Microsoft Defender SmartScreen to check application execution for trusted apps|Optional|Yes|||||Microsoft Defender SmartScreen checking application execution for trusted apps|
|Consolidated Defender for Endpoint services|WW|Streamlined connectivity new URL pattern|443|`*.endpoint.security.microsoft.com`|Used for streamlined connectivity URL consolidation as well as for future services|Required|Yes|No|Yes|Yes|Yes|Only required for streamlined connectivity initially. New services also follow this new pattern.|

## Defender portal URLs

> [!NOTE]
> All URLs in this table are required to have access to the Microsoft Defender Security Center Portal URL.

|Service|Geography|URL|
|---|---|---|
|Microsoft Defender for Endpoint|WW|`*.blob.core.windows.net`|
|Microsoft Defender for Endpoint|WW|`crl.microsoft.com`|
|Microsoft Defender for Endpoint|WW|`https://*.microsoftonline-p.com`|
|Microsoft Defender for Endpoint|WW|`https://secure.aadcdn.microsoftonline-p.com`|
|Microsoft Defender for Endpoint|WW|`https://static2.sharepointonline.com`|
|Microsoft Defender for Endpoint|WW|`https://login.microsoftonline.com`|
|Microsoft Defender for Endpoint|WW|`https://*.securitycenter.windows.com`|
|Microsoft Defender for Endpoint|WW|`https://onboardingpackagescusprd.blob.core.windows.net`|
|Microsoft 365 Defender|WW|`https://security.microsoft.com`|

## Microsoft Defender processes

The processes in this section are exclusively for Microsoft Defender for Endpoint for Windows platforms, including down-level OS. This list doesn't account for any other Windows communications requirements.

For more information on how to manage Windows connections, see [Manage connections from Windows 10 and Windows 11 operating system components to Microsoft services](/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services).

While this list continues to be updated, Microsoft can't provide any guarantees on it being up-to-date with the latest product or OS changes. Customers should use this list as a baseline and conduct their testing before using it directly in production.

## Windows 11, Windows 10, Windows Server 2022, and Windows Server 2019

|Process|Path|Comment|
|---|---|---|
|MpCmdRun.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus command-line utility|
|MpDlpCmd.exe|C:\Program Files\Windows Defender|Microsoft Endpoint Data Loss Prevention (DLP) command-line utility|
|MsMpEng.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus service executable|
|ConfigSecurityPolicy.exe|C:\Program Files\Windows Defender|Microsoft Security Client Policy Configuration Tool|
|MpDefenderCoreService.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Core Service|
|MpDlpService.exe|C:\Program Files\Windows Defender|Microsoft Purview Data Loss Prevention Service|
|NisSrv.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Network real-time Inspection|
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
|---|---|---|
|MsSense.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint service executable|
|SenseCnCProxy.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint communication module|
|SenseIR.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense IR (Incident Response) module|
|SenseSampleUploader.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sample Upload module|
|SenseCM.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense CM (Configuration Management)|
|MpCmdRun.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus command-line utility|
|MsMpEng.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus service executable|
|ConfigSecurityPolicy.exe|C:\Program Files\Windows Defender|Microsoft Security Client Policy Configuration Tool|
|NisSrv.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Network real-time Inspection|
|SenseTVM.exe|C:\Program Files\Windows Defender Advanced Threat Protection|Microsoft Defender for Endpoint Sense TVM (Threat Vulnerability Management)|

## Windows 8.1 and Windows Server 2016 (MMA Based)

|Process|Path|Comment|
|---|---|---|
|MonitoringHost.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service Host Process|
|HealthService.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service|
|TestCloudConnection.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Cloud Connection Test utility|
|MpCmdRun.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus command-line utility (SCEP)|
|MsMpEng.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus service executable (SCEP)|
|ConfigSecurityPolicy.exe|C:\Program Files\Windows Defender|Microsoft Security Client Policy Configuration Tool (SCEP)|
|NisSrv.exe|C:\Program Files\Windows Defender|Microsoft Defender Antivirus Network real-time Inspection (SCEP)|

## Windows 7 SP1, Windows Server 2012 R2, and Windows Server 2008 R2 (MMA Based)

|Process|Path|Comment|
|---|---|---|
|MonitoringHost.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service Host Process|
|HealthService.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Service|
|TestCloudConnection.exe|C:\Program Files\Microsoft Monitoring Agent\Agent|Microsoft Monitoring Agent Cloud Connection Test utility|
|MpCmdRun.exe|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus command-line utility (SCEP)|
|MsMpEng.exe|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus service executable (SCEP)|
|ConfigSecurityPolicy.exe|C:\Program Files\Microsoft Security Client|Microsoft Security Client Policy Configuration Tool (SCEP)|
|NisSrv.exe|C:\Program Files\Microsoft Security Client|Microsoft Defender Antivirus Network real-time Inspection (SCEP)|
