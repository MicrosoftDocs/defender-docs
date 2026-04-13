---
title: Microsoft Defender for Endpoint streamlined connectivity URLs - commercial 
description: Get a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in US commercial cloud environments.         
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

# Microsoft Defender for Endpoint streamlined connectivity URLs - commercial

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article includes a list of the streamlined connectivity URLs required to onboard and maintain devices in Microsoft Defender for Endpoint in commercial cloud environments.

## Prerequisites

See the [streamlined connectivity prerequisites](configure-device-connectivity.md#prerequisites)

### Notes

- Devices running Defender for Endpoint delivered via the Microsoft Monitoring Agent (MMA, also known as the Log Analytics Agent) continue to use the associated legacy method. Specifically, devices running on Windows 7 SP1, Windows 8.1, Windows Server 2008 R2, and Windows Server 2012 R2, and 2016 devices not upgraded to the modern unified solution. For the list of additional URLs, see [Windows 7, 8.1, 2008R2 (MMA)](#windows-7-81-2008r2-mma).
- Devices running Windows version 1607, 1703, 1709, 1803 can onboard using the new onboarding package but still require a longer list of URLs. The [Windows 1607 to 1803](#windows-1607-to-1803) section lists the other URLs required.

## Common endpoints

### URLs used for core functionality

> [!NOTE]
> To ensure successful onboarding, make sure that your devices meet all component update versions and OS requirements: application or anti-malware platform, engine, and Endpoint detection and response (EDR) sensor. Otherwise onboarding might be unsuccessful. You can onboard devices again to switch them to streamlined connectivity if they meet these requirements.

|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|Comments|OS|
|-|-|-|-|-|-|-|
|Core Defender for Endpoint services|443|*.endpoint.security.microsoft.com|Core Defender for Endpoint services. Formerly: MAPS, Malware Sample Submission Storage, AutoIR Sample Storage, Command and Control, Cyber data.|Required|Core Defender for Endpoint services. Prerequisites must be met to successfully connect to the new URL patterns.|All|
|Web & network protection|443|*.smartscreen-prod.microsoft.com *.smartscreen.microsoft.com|Used for Microsoft Defender SmartScreen browsing protection, reporting, notifications, and web content filtering. Network/web protection and custom URL/IP indicators.|Required|Optional in disconnected environments where web browsing and connectivity to external destinations is limited. Required for custom URL/IP indicators.|All|
|SmartScreen|443|*.smartscreen.microsoft.com *.checkappexec.microsoft.com *.urs.microsoft.com|Used for Microsoft Defender SmartScreen to check application execution for trusted apps|Optional|Needed for checking reputation/trust for downloaded applications|Windows|
|Defender for Endpoint|443|https://config.edge.skype.com/config/v1|Internal configuration management|Required|This URL must be allowed to enable Defender on Linux endpoints to receive internal configurations from the cloud.<br/>**Note**: The "skype" string in this URL is a legacy artifact, unrelated to Skype, and retained solely for backward compatibility.|Linux|

## URLs used for updates

> [!NOTE]
> You can apply updates from a file share or update server, where you don't need to allow all direct connections from devices. Otherwise, these connections are already required and allowed in your environment for other purposes such as Windows updates.

|Service |Port |Endpoint or URLs |Endpoint or URL Description |Type |Comments |OS |
|-|-|-|-|-|-|-|
|Linux app/platform updates|443|packages.microsoft.com|Official Microsoft repository to download and update the Linux product|Required|Optional if distributing or upgrading Linux installations using a different method|Linux|
|Mac app or platform updates|443|officecdn-microsoft-com.akamaized.net|Microsoft Office Content Delivery Network (CDN) - product updates for macOS|Required|Optional if distributing or upgrading macOS installations using a different method. Uses the Microsoft AutoUpdate app also used for updating other Microsoft apps such as Office for Mac.|macOS|
|Windows/Mac/Linux security intelligence updates <br> Windows anti-malware platform updates (alternative download location / direct from Defender cloud)|443|go.microsoft.com <br> definitionupdates.microsoft.com <br>`https://www.microsoft.com/security/encyclopedia/adlpackages.aspx` | Microsoft Defender Antivirus Content Delivery Network (CDN) URLs - Security Intelligence and Windows anti-malware platform updates. Linux and macOS clients use this location as the primary download location.|Required| Optional if updates are downloaded and distributed centrally (WSUS/Mirror/ConfigMgr). Windows clients use this location as an alternative - Microsoft Malware Protection Center (MMPC). Otherwise, Windows client uses the location as a fallback when other configured sources fail. The client then retrieves update packages as determined by the redirection logic.|All|
|Windows security intelligence and anti-malware platform updates, product updates to EDR sensors. This applies when you use the Microsoft or Windows update as the source or method. |443|*.update.microsoft.com <br> *.delivery.mp.microsoft.com <br> *.windowsupdate.com <br> *.download.windowsupdate.com <br>*.download.microsoft.com|Security intelligence and anti-malware platform updates, when the client is configured to download Defender updates from Windows Update, will be downloaded as they become available.|Required|Optional if updates are being downloaded and distributed centrally (WSUS/Mirror/ConfigMgr)  EDR sensor updates always come as part of regular Windows update release cadence/cycle. EDR logic updates come directly from Defender cloud (command and control). For Windows Server 2012 R2 and 2016, KB5005292 is the update package used to perform periodic updates to the EDR sensor stack.|Windows|

## URLs used for certificate validation checks

> [!NOTE]
> Certificate validation is performed through the Windows operating system, helping to prevent abuse of compromised certificates. The operating system must be able to connect to these destinations, or, should be updated with the latest certificate trust lists if they can't retrieve them from Microsoft directly. For more information about management of trusted root certificates in disconnected environments, see [Configure trusted roots and disallowed certificates in Windows](/windows-server/identity/ad-cs/configure-trusted-roots-disallowed-certificates).
>
> Optional if updates to Windows root certificate trust lists are being managed through other methods in the environment. If Cloud-delivered protection is unable to connect to this destination through a proxy, add registry setting "SSLOptions" with value 0. Registry path: *HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet*


|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|OS|
|-|-|-|-|-|-|
|Windows operating system certificate validation checks|80|`www.microsoft.com/pkiops/*`<br>`www.microsoft.com/pki/*` |Used when creating the SSL connection to MAPS for updating the certificate revocation list (CRL)|Required|Windows|
|Windows operating system certificate validation checks|80|`ctldl.windowsupdate.com`|Expands on the existing automatic root update technology. This service flags certificates that are compromised as untrusted.|Required|Windows|
|Windows operating system certificate validation checks|80|`crl.microsoft.com`|Certificate Revocation Lists - required to validate certificates|Required|Windows|


## Other URLs

|Service|Port|Endpoint/URLs|Endpoint/URL Description|Type|Comments|OS|
|-|-|-|-|-|-|-|
|Live response (push notification model only)|443|login.microsoftonline.com<br> *.wns.windows.com login.live.com|Windows Push Notification Services (WNS) for Live Response is used to expedite live response connections to Windows clients. This service can't be used through a proxy.|Optional|Improves the speed of the live response connection initiation, where a direct connection or a proxy bypass is required on Windows client (non-server) operating systems.|Windows|
|Vulnerability management network scanner standalone tool|443|\*.security.microsoft.com<br>\*.blob.core.windows.net/networkscannerstable/*<br>login.windows.net|Required for the vulnerability management assessment tool for network devices (network scanner) downloaded from the portal.|Optional|Tool is supported on Windows 8 and later and Windows Server 2012 and later|Windows|

## IP addresses

The following Defender for Endpoint-dedicated, static IP ranges can be used as an alternative to URLs in certain scenarios without hostname resolution capability.

> [!NOTE]
> Keep connectivity with other required services, like SmartScreen, Windows Update, CRL. Otherwise, use a solution like ConfigMgr, WSUS, or file-share methods to apply updates or to support browsing security. See [Common endpoints](#common-endpoints) for more details, and ensure devices are running an operating system version and client component update level that supports streamlined connectivity.

If you're using Microsoft Defender for Cloud or Intune with the **auto from connector** option to onboard new devices, ensure to toggle on the **Apply streamlined connectivity settings to devices managed by Intune and Defender for Cloud** in advanced settings on security.microsoft.com. Onboarded servers don't automatically switch to the new destinations as defined in the Azure service tags. Ensure the servers can connect to the previous standard destinations, or onboard them again to reconfigure them to be able to use the new service tags or IP addresses.

> [!NOTE]
> The EDR Cyberdata service (OneDsCollector) isn't included under the IP addresses under the MicrosoftDefenderForEndpoint service tag. The IP ranges from both service tags are needed to allow connectivity.

Current IP addresses can be found at [Home Page - Azure IP Ranges](https://azureipranges.azurewebsites.net/).

|Service Tag Name|Defender for Endpoint services included|Comments|
|---|---|---|
|MicrosoftDefenderForEndpoint|MAPS, Malware Sample Submission Storage, AutoIR Sample Storage, Command and Control (response actions), native configuration management.|Core Defender for Endpoint services. Prerequisites must be met to ensure successful connections.|
|OneDsCollector (EDR Cyberdata)|EDR Cyber data (might include diagnostic data for other Microsoft services)|Cyber data channel. Prerequisites must be met to ensure successful connections.|

## Windows 1607 to 1803

This section lists the URL endpoint services required for older Windows devices. See the [Common URLs](#common-endpoints) section for other required URLs. These Windows versions are running an older version of the EDR sensor (Sense). Onboarding again isn't supported for migrations. Devices must first offboard and then onboard to apply the new configuration that allows for URL reduction.

|Service|Geography|Category|Port|Endpoint/URL|Endpoint/URL Description|Required / Optional|Comments|
|---|---|---|---|---|---|---|---|
|Microsoft Defender for Endpoint|All|Common|443|settings-win.data.microsoft.com|Connected User Experiences and Telemetry Channel|Optional|Only required for Windows 10 1703 and below. Not required on Windows Server.|
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus1eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus2eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus3eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus4eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|wsus1eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|wsus2eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus1westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus2westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus3westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|ussus4westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|wsus1westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|wsus2westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|usseu1northprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|wseu1northprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|usseu1westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|wseu1westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|ussuk1southprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|wsuk1southprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|ussuk1westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|wsuk1westprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|ussau1southeastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|ussau1eastprod.blob.core.windows.net|Malware Sample Submission Storage|Required||
|Microsoft Defender Antivirus|All|MAPS|443|*.wdcp.microsoft.com|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required||
|Microsoft Defender Antivirus|All|MAPS|443|*.wd.microsoft.com|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required||
|Microsoft Defender Antivirus|All|MAPS|443|*.wdcpalt.microsoft.com|MAPS - Used by Microsoft Defender Antivirus to provide cloud-delivered protection|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|automatedirstrprdcus.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|automatedirstrprdeus.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|automatedirstrprdcus3.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|automatedirstrprdeus3.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|automatedirstrprdneu.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|automatedirstrprdweu.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|automatedirstrprdneu3.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|automatedirstrprdweu3.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|automatedirstrprduks.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|automatedirstrprdukw.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|automatedirstrprdaue.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|automatedirstrprdaus.blob.core.windows.net|Microsoft Defender for Endpoint AutoIR Sample Storage|Required||
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|au.vortex-win.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Not required for Windows 10 1803 (RS4) and later / Windows Server 2019 and later|
|Microsoft Defender for Endpoint|AU|Microsoft Defender for Endpoint AU|443|au-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Required||
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|us.vortex-win.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Not required for Windows 10 1803 (RS4) and later / Windows Server 2019 and later|
|Microsoft Defender for Endpoint|US|Microsoft Defender for Endpoint US|443|us-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Required||
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|eu.vortex-win.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Not required for Windows 10 1803 (RS4) and later / Windows Server 2019 and later|
|Microsoft Defender for Endpoint|EU|Microsoft Defender for Endpoint EU|443|eu-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Required||
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|uk.vortex-win.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Optional|Not required for Windows 10 1803 (RS4) and later / Windows Server 2019 and later|
|Microsoft Defender for Endpoint|UK|Microsoft Defender for Endpoint UK|443|uk-v20.events.data.microsoft.com|Microsoft Defender for Endpoint EDR Cyber Data|Required||

## Windows 7, 8.1, 2008R2 (MMA)

> [!NOTE]
> The URLs shown in this table are required only for devices onboarded using the MMA or LAA. This URL isn't applicable when using the modern, unified solution for Windows Server 2012 R2 and 2016. For more information see how to [eliminate wildcards (*)](https://aka.ms/mde_network_requirements).

This section applies to URL endpoint services required for devices using Defender for Endpoint via the Microsoft Monitoring Agent. These endpoints run on Windows 7, Windows 8.1, Windows Server 2008 R2. For servers not upgraded to the Unified Agent, see [Updating MMA on Windows devices for Microsoft Defender for Endpoint](update-agent-mma-windows.md).

|Category|Port|Endpoint/URL|Endpoint/URL Description|
|---|---|---|---|
|Microsoft Defender for Endpoint AU|443|winatp-gw-aue.microsoft.com<br>winatp-gw-aus.microsoft.com|Microsoft Defender for Endpoint Command and Control |
|Microsoft Defender for Endpoint EU|443|winatp-gw-neu.microsoft.com<br>winatp-gw-weu.microsoft.com<br>winatp-gw-neu3.microsoft.com<br>winatp-gw-weu3.microsoft.com|Microsoft Defender for Endpoint Command and Control |
|Microsoft Defender for Endpoint UK|443|winatp-gw-uks.microsoft.com<br>winatp-gw-ukw.microsoft.com|Microsoft Defender for Endpoint Command and Control |
|Microsoft Defender for Endpoint US|443|winatp-gw-cus.microsoft.com<br>winatp-gw-eus.microsoft.com<br>winatp-gw-cus3.microsoft.com<br>winatp-gw-eus3.microsoft.com|Microsoft Defender for Endpoint Command and Control |
|Microsoft Monitoring Agent (MMA) / EDR Cyberdata |443 |\*.oms.opinsights.azure.com<br>\*.oms.opinsights.azure.com<br>*.blob.core.windows.net |Microsoft Monitoring Agent (MMA) / Log Analytics Agent (LAA) for Win 7/8.1/2008R2/2012R2/2016 |




## Defender portal URLs

Lists the URL endpoints required for administrative/security operations access the Microsoft Defender Security portals. These endpoints don't need to be accessible to all devices.

|URL|Comment|
|---|---|
|*.blob.core.windows.net|Used for file downloads from the portal, such as onboarding packages - `https://onboardingpackagescusprd.blob.core.windows.net` and files retrieved from devices.|
|https://*.microsoftonline-p.com|Used for signing into the portal with Microsoft Entra ID|
|https://secure.aadcdn.microsoftonline-p.com|Used for signing into the portal with Microsoft Entra ID|
|https://static2.sharepointonline.com|Used for signing into the portal with Microsoft Entra ID|
|https://login.microsoftonline.com|Used for signing into the portal with Microsoft Entra ID|
|https://*.securitycenter.windows.com|Microsoft Defender Security Center portal/APIs|
|https://*.api.security.microsoft.com|Microsoft Defender Security Center portal/APIs|
|https://security.microsoft.com|Microsoft Defender XDR admin portal|

## Client processes

Because these Defender for Endpoint-related processes generate network communications, make sure that communications from these processes are not blocked.

[!INCLUDE [Microsoft Defender for Endpoint processes](includes/streamlined-connectivity-processes.md)]

## Change log

|Date|Change Log|
|---|---|
|03/26/2026|Renamed **Microsoft Defender process exclusions** section to **Client processes**, and aligned the content for all URL lists.|
|03/03/2026|Added Linux URL (`config.edge.skype.com/config/v1`) to [Common endpoints](#common-endpoints).|
|02/25/2026|Added `*.wdcpalt.microsoft.com` to Windows 1607-1803 section.|
|04/07/2025|Removed `dm.microsoft.com`.|
|03/11/2024|Updated Xplat MDE agent version to 101.24022.|
|02/01/2024|Updated prerequisites.|