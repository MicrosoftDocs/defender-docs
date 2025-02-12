---
title: Configure your network environment to ensure connectivity with Defender for Endpoint service
description: Learn how to configure your network environment to connect with the Defender for Endpoint service.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.reviewer: pahuijbr
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: how-to
ms.subservice: onboard
ms.date: 02/04/2025
---

# STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Before you onboard devices to Defender for Endpoint, make sure your network is configured to connect to the service, by allowing outbound connection and bypassings HTTPS inspection for the service URLs. The first step of this process involves adding URLs to the allowed domains list if your proxy server or firewall rules prevent access to Defender for Endpoint. This article also includes information about proxy and firewall requirements for older versions of Windows client and Windows Server.

> [!NOTE]
> - After May 8, 2024, you have the option to keep streamlined connectivity ([consolidated set of URLs](https://aka.ms/MDE-streamlined-urls)) as the default onboarding method, or downgrade to standard connectivity through (**Settings > Endpoints > Advanced Features**). For onboarding through Intune or Microsoft Defender for Cloud, you need to activate the relevant option. Devices already onboarded aren't reonboarded automatically. In such cases, create a new policy in Intune, where it's recommended to first assign the policy to a set of test devices to verify connectivity is successful, and then expand the audience. Devices in Defender for Cloud can be reonboarded using the relevant onboarding script, while newly onboarded devices automatically receive streamlined onboarding.
> - The new *.endpoint.security.microsoft.com consolidated domain needs to be reachable for all devices, for current and future functionality, regardless whether you continue to use Standard connectivity.
> - New regions default to streamlined connectivity and can't downgrade to Standard. Read more at [Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint](configure-device-connectivity.md).

## Enable access to Microsoft Defender for Endpoint service URLs in the proxy server

The following downloadable spreadsheet lists the services and their associated URLs that devices in your network must be able to connect to. Ensure there are no firewall or network filtering rules to deny access for these URLs. Optionally, you might need to create an *allow* rule specifically for them.

|Spreadsheet of domains list| Description|
|--|--|
| Microsoft Defender for Endpoint consolidated URL list (Streamlined) | Spreadsheet of consolidated URLs. <br/>[Download the spreadsheet here](https://aka.ms/MDE-streamlined-urls).<br><br> **Applicable OS:** <br/>For complete list, see [streamlined connectivity](configure-device-connectivity.md#prerequisites). <br>- Windows 10 1809+<br>- Windows 11<br>- Windows Server 2022 or later<br>- Windows Server 2019<br>- Windows Server 2012 R2, Windows Server 2016 running [Defender for Endpoint modern unified solution](configure-server-endpoints.md) (requires installation through MSI). <br>- macOS supported versions running 101.23102.* +  <br/>- Linux supported versions running 101.23102.* + <br><br> **Minimum component versions:**<br/>- anti-malware client: 4.18.2211.5<br/>- Engine: 1.1.19900.2<br/>- Security intelligence: 1.391.345.0<br/> - Xplat version: 101.23102.* +<br/>- Sensor/ KB version: >10.8040.*/ March 8, 2022+<br><br>If you're moving previously onboarded devices to the streamlined approach, see [Migrating device connectivity](migrate-devices-streamlined.md)<br><br>Windows 10 versions 1607, 1703, 1709, 1803 (RS1-RS4) are supported through the streamlined onboarding package but require a longer URL list (see updated URL sheet). These versions don't support reonboarding (must be fully offboarded first). <br><br>Devices running on Windows 7, Windows 8.1, Windows Server 2008 R2 MMA, Servers not upgraded to Unified Agent (MMA) must continue using MMA onboarding method.  
|Microsoft Defender for Endpoint URL list for commercial customers (Standard)| Spreadsheet of specific DNS records for service locations, geographic locations, and OS for commercial customers. <p> [Download the spreadsheet here.](https://aka.ms/MDE-standard-urls) <p> Microsoft Defender for Endpoint Plan 1 and Plan 2 share the same proxy service URLs. In your firewall, open all the URLs where the geography column is WW. For rows where the geography column isn't WW, open the URLs to your specific data location. To verify your data location setting, see [Verify data storage location and update data retention settings for Microsoft Defender for Endpoint](preferences-setup.md). Don't exclude the URL `*.blob.core.windows.net` from any kind of network inspection. Instead, exclude only the blob URLs that are specific to MDE and listed in the spreadsheet of domains list.
| Microsoft Defender for Endpoint URL list for Gov/GCC/DoD | Spreadsheet of specific DNS records for service locations, geographic locations, and OS for Gov/GCC/DoD customers. <br> [Download the spreadsheet here.](https://aka.ms/MDE-gov-urls) |

> [!IMPORTANT]
> - Connections are made from the context of the operating system or the Defender client services and as such, proxies shouldn't require authentication for these destinations or perform inspection (HTTPS scanning / SSL inspection) that breaks the secure channel.
> - Microsoft doesn't provide a proxy server. These URLs are accessible via the proxy server that you configure.
> - In compliance with Defender for Endpoint security and compliance standards, your data is processed in accordance with your tenant's physical location. Based on client location, traffic may flow through any of the associated IP regions (which correspond to Azure datacenter regions). For more information, see [Data storage and privacy](data-storage-privacy.md). 

## Microsoft Monitoring Agent (MMA) - additional proxy and firewall requirements for older versions of Windows client or Windows Server
The following destinations are required to allow Defender for Endpoint communications through the Log Analytics agent (often referred to as Microsoft Monitoring Agent) on Windows 7 SP1, Windows 8.1, and Windows Server 2008 R2.

|Agent Resource|Ports|Direction|Bypass HTTPS inspection|
|--|--|--|--|
|`*.ods.opinsights.azure.com`|Port 443|Outbound|Yes|
|`*.oms.opinsights.azure.com`|Port 443|Outbound|Yes|
|`*.blob.core.windows.net`|Port 443|Outbound|Yes|
|`*.azure-automation.net`|Port 443|Outbound|Yes|

To determine the exact destinations in use for your subscription within the domains listed above, see [Microsoft Monitoring Agent (MMA) Service URL connections](verify-connectivity.md#microsoft-monitoring-agent-mma-service-url-connections).

> [!NOTE]
> Services using MMA-based solutions aren't able to use the new streamlined connectivity solution (consolidated URL and option to use static IPs). For Windows Server 2016 and Windows Server 2012 R2, you'll need to update to the new unified solution. Instructions to onboard these operating systems with the new unified solution are at [Onboard Windows servers](configure-server-endpoints.md), or migrate already onboarded devices to the new unified solution at [Server migration scenarios in Microsoft Defender for Endpoint](server-migration.md).

## For devices without Internet access / without a proxy

For devices with no direct internet connection, the use of a proxy solution is the recommended approach. In specific cases, you can use firewall or gateway devices that allow access to IP ranges. For more information, see: [Streamlined device connectivity](configure-device-connectivity.md).

> [!IMPORTANT]
>
> - Microsoft Defender for Endpoint is a Cloud security solution. "Onboard devices without Internet access" means that Internet access for the endpoints must be configured through a proxy or other network device, and DNS resolution is always required. Microsoft Defender for Endpoint doesn't support endpoints without direct or proxied connectivity to the Defender cloud services. A system wide proxy configuration is recommended.
> - Windows or Windows Server in disconnected environments must be able to update Certificate Trust Lists offline via an internal file or web server.
> - For more information about updating CTLs offline, see [Configure a file or web server to download the CTL files](/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn265983(v=ws.11)#configure-a-file-or-web-server-to-download-the-ctl-files).

## Next step

[STEP 2: Configure your devices to connect to the Defender for Endpoint service using a proxy](configure-proxy-internet.md).
