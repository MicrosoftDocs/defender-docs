---
title: Microsoft Defender for Endpoint standard connectivity URLs - US government 
description: Get a list of the standard connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US government cloud environments.         
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

# Microsoft Defender for Endpoint standard connectivity URLs - US government


This article includes a list of the standard connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US government cloud environments.

## Microsoft Defender URLs

|Service|Geography|Category|Port|Endpoint/URL|Endpoint/URL Description|Required / Optional|Windows 10/11 / Server 2019 -2022 / Server 2012 R2/Server 2016 (Unified Agent)|Windows 7 / 8.1|Windows Server 2008 R2 / 2012 R2 / 2016 (MMA Based)|Mac|Linux|Comments|
|-|-|-|-|-|-|-|-|-|-|-|-|-|
|Microsoft Defender for Endpoint|US Gov|CRL|80|	crl.microsoft.com/pki/crl/*|Certificate Revocation Lists - required to validate certificates / Used by Windows when creating the SSL connection to MAPS for updating the CRL| Required | Yes ||| Yes |Yes|
|Microsoft Defender for Endpoint|US Gov|CRL|80|	ctldl.windowsupdate.com|Expands on the existing automatic root update mechanism technology to let certificates that are compromised or untrusted be specifically flagged as untrusted|Required|	Yes||||||
|Microsoft Defender for Endpoint|US Gov|CRL|80|www.microsoft.com/pkiops/*|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|US Gov|CRL|80|http://www.microsoft.com/pki/certs|Used when creating the SSL connection to MAPS for updating the CRL|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|US Gov|Common|	443|events.data.microsoft.com|Used by the Connected User Experiences and Telemetry component and connects to the Microsoft Data Management service|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|US Gov|Common|443|*.wns.windows.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|||||Required for Live Response Performance (Direct Connection or proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.microsoftonline.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|||||Required for Live Response Performance (Direct Connection or proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|login.live.com|Windows Push Notification Services (WNS) - Live Response|Required|Yes|||||Required for Live Response Performance (Direct Connection or proxy bypass required)|
|Microsoft Defender for Endpoint|US Gov|Common|443|settings-win.data.microsoft.com|Connected User Experiences and Telemetry Channel|Optional|Yes|||||Not required for Windows 10 1809 (RS5) and above / Windows 2019|
|Microsoft Defender for Endpoint |US Gov|Common (Mac) (Linux)|443|cdn.x.cp.wd.microsoft.com|Microsoft Defender Antivirus Content Delivery Network (CDN) - Security Intelligence updates|Required||| Yes|Yes|
|Microsoft Defender for Endpoint |US Gov|Common (Mac)|443|officecdn-microsoft-com.akamaized.net|Microsoft Office Content Delivery Network (CDN) -  Product Updates|Required|||Yes|Yes|
|Microsoft Defender for Endpoint |US Gov|Microsoft Monitoring Agent (MMA)|443|*.ods.opinsights.azure.us|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes |Yes|||Refer to steps at https://aka.ms/mde_network_requirements to eliminate wildcards (*)|
|Microsoft Defender for Endpoint |US Gov|Microsoft Monitoring Agent (MMA)|443|*.oms.opinsights.azure.us|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes|Yes|||Refer to steps at https://aka.ms/mde_network_requirements to eliminate wildcards (*)|
|Microsoft Defender for Endpoint |US Gov|Microsoft Monitoring Agent (MMA)|443|*.blob.core.usgovcloudapi.net|MMA for Win 7/8.1/2008R2/2012R2/2016|Optional||Yes|Yes|||Refer to steps at https://aka.ms/mde_network_requirements to eliminate wildcards (*)|
|Microsoft Defender for Endpoint|Government Community Cloud|Microsoft Defender for Endpoint GCC|443|unitedstates4.x.cp.wd.microsoft.us|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required|||Yes|Yes||
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|us4-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data |Required|Yes|||Yes|Yes||
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|winatp-gw-usmt.microsoft.com|Microsoft Defender for Endpoint Command and Control |Required|Yes|Yes|Yes|Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|winatp-gw-usmv.microsoft.com|Microsoft Defender for Endpoint Command and Control |Required|Yes|Yes|Yes|Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|automatedirstrfmusmt.blob.core.usgovcloudapi.net|Microsoft Defender for Endpoint AutoIR Sample Storage	Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|automatedirstrfmusmv.blob.core.usgovcloudapi.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|ussusg1virginiaff4.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|	
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|ussusg2virginiaff4.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|wsusg1virginiaff4.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|ussusg1texasff4.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|ussusg2texasff4.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC|Microsoft Defender for Endpoint GCC|443|wsusg1texasff4.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|unitedstates1.x.cp.wd.microsoft.us|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|us4-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data |Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|winatp-gw-usgt.microsoft.com|Microsoft Defender for Endpoint Command and Control |Required|Yes|Yes|Yes|Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|automatedirstrffusgv.blob.core.usgovcloudapi.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|	Yes|Yes	|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|ussusg1virginiaff0.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|ussusg2virginiaff0.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|wsusg1virginiaff0.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|ussusg1texasff0.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|ussusg2texasff0.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|GCC High|Microsoft Defender for Endpoint GCC High|443|wsusg1texasff0.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes||||||
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|unitedstates2.x.cp.wd.microsoft.us|Used by Microsoft Defender Antivirus to provide cloud-delivered protection and security intelligence updates|Required|Yes|||Yes|Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|us4-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data |Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|winatp-gw-usgt.microsoft.com|Microsoft Defender for Endpoint Command and Control |Required|Yes|Yes|Yes|Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|winatp-gw-usgv.microsoft.com|Microsoft Defender for Endpoint Command and Control |Required|Yes|Yes|Yes|Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|automatedirstrffusgt.blob.core.usgovcloudapi.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|automatedirstrffusgv.blob.core.usgovcloudapi.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|ussusd1centralff5.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|ussusd2centralff5.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||||
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|wsusd1centralff5.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|ussusd1eastff5.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|ussusd2eastff5.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||Yes|Yes|
|Microsoft Defender for Endpoint|DoD|Microsoft Defender for Endpoint DoD|443|wsusd1eastff5.blob.core.usgovcloudapi.net|Malware Sample Submission Storage|Required|Yes|||||
|Microsoft Defender Antivirus|US Gov|MU / WU|443|*.update.microsoft.com|MU / WU - Security intelligence and product updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU / WU|443|*.delivery.mp.microsoft.com|MU / WU - Security intelligence and product updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU / WU|443|*.windowsupdate.com|MU / WU - Security intelligence and product updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.windowsupdate.com|ADL - Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|US Gov|MU (ADL)|443|*.download.microsoft.com|ADL - Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|	US Gov|	MU (ADL)|443|fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx|ADL - Alternate location for Microsoft Defender Antivirus Security intelligence updates|Optional|Yes|Yes|Yes|||Optional if updates are being managed internally (WSUS/FileShare/ConfigMgr)|
|Microsoft Defender Antivirus|GCC|MAPS|	443|unitedstates4.cp.wd.microsoft.us|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required|Yes|||||
|Microsoft Defender Antivirus|GCC High|	MAPS|443|unitedstates1.cp.wd.microsoft.us|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required|Yes|||||
|Microsoft Defender Antivirus|DoD|MAPS|	443|unitedstates2.cp.wd.microsoft.us|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|	Required|Yes|||||
|Microsoft Defender SmartScreen|GCC|Reporting and Notifications|443|unitedstates4.ss.wd.microsoft.us|Used for Microsoft Defender SmartScreen protection, reporting, and notifications. Microsoft Defender Antivirus Network Protection and custom URL indicators|Required|Yes|||Yes|Yes|Microsoft Defender SmartScreen reporting and notifications. Network Protection and custom URL indicators|
|Microsoft Defender SmartScreen|GCC High|Reporting and Notifications|443|unitedstates1.ss.wd.microsoft.us|Used for Microsoft Defender SmartScreen protection, reporting, and notifications. Microsoft Defender Antivirus Network Protection and custom URL indicators|Required|	Yes|||Yes|Yes|Microsoft Defender SmartScreen reporting and notifications. Network Protection and custom URL indicators|
|Microsoft Defender SmartScreen|DoD|Reporting and Notifications|443|unitedstates2.ss.wd.microsoft.us|Used for Microsoft Defender SmartScreen protection, reporting, and notifications. Microsoft Defender Antivirus Network Protection and custom URL indicators|Required|Yes|||Yes|Yes|Microsoft Defender SmartScreen reporting and notifications. Network Protection and custom URL indicators|
|Consolidated Defender for Endpoint services|WW|Streamlined connectivity new URL pattern|443|*.endpoint.security.microsoft.com|	Used for streamlined connectivity URL consolidation as well as for future services|	Required|Yes|No|Yes|Yes|Yes|Only required for streamlined connectivity initially. New services also follow this new pattern.|


## Security center URLs

> [!NOTE]
> All URLs in this table are required to have access to the Microsoft Defender Security Center Portal URL.

|Service|Geography|URL|
|---|---|---|
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
|Microsoft Defender for Endpoint|DoD|https://onboardingpckgsusgvprd.blob.core.usgovcloudapi.net|

## Client processes

[!INCLUDE [Microsoft Defender for Endpoint processes](includes/streamlined-connectivity-processes.md)]

## Change log

|Date|Change log|
|---|---|
|03/23/2026|Added client processes section|
|15/08/2023|Removed URL:<br>Removed: <https://msdl.microsoft.com/download/symbols>|
|05/12/2022|URL details updated:<br>Updated line 58: Updated from required to optional.<br>Updated line 62: Changed from optional to required. Guidance text updated. Added Mac and Linux.<br>Updated line 63: Changed from optional to required. Guidance text updated. Added Mac and Linux.<br>Updated line 64: Changed from optional to required. Guidance text updated. Added Mac and Linux.|
|27/05/2022|Removed preview status from Server 2012 R2 and Server 2016 Unified Agent references.<br>Updated line 4: URL required for Mac and Linux platforms.<br>Updated line 5: URL required for Mac and Linux platforms.|
|25/01/2022|Duplicate URLs consolidated.<br>Optional field added.<br>US Gov, GCC, and GCC High guidance moved to separate spreadsheet.<br>URLs removed:<br>eu-cdn.x.cp.wd.microsoft.com; wu-cdn.x.cp.wd.microsoft.com; *.azure-automation.net; *.notify.windows.com|
