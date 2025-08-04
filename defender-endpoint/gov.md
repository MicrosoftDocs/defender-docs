---
title: Microsoft Defender for Endpoint for US Government customers
description: Learn about the Microsoft Defender for Endpoint for US Government customers requirements and capabilities available
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.reviewer: jesquive
ms.localizationpriority: medium
ms.date: 05/30/2025
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: get-started
---

# Microsoft Defender for Endpoint for US Government customers

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Microsoft Defender for Endpoint for US Government customers, built in the Azure US Government environment, uses the same underlying technologies as Defender for Endpoint in Azure Commercial.

This offering is available to GCC, GCC High, and DoD customers and is based on the same prevention, detection, investigation, and remediation as the commercial version. However, there are some differences in the availability of capabilities for this offering.

> [!NOTE]
> If you're a GCC customer using Defender for Endpoint in Commercial, see the [Defender for Endpoint documentation](/defender-endpoint/).

## Licensing requirements

Microsoft Defender for Endpoint for US Government customers requires one of the Microsoft volume licensing offers listed in this article for desktop and server licensing.

### Desktop licensing

|GCC|GCC High|DoD|
|---|---|---|
|Microsoft 365 GCC G5|Microsoft 365 E5 for GCC High|Microsoft 365 G5 for DOD|
|Microsoft 365 G5 Security GCC|Microsoft 365 G5 Security for GCC High|Microsoft 365 G5 Security for DOD|
|Microsoft Defender for Endpoint - GCC|Microsoft Defender for Endpoint for GCC High|Microsoft Defender for Endpoint for DOD|
|Windows 10 Enterprise E5 GCC|Windows 10 Enterprise E5 for GCC High|Windows 10 Enterprise E5 for DOD|

- *G3 includes Microsoft Defender for Endpoint Plan 1

### Server licensing

|GCC|GCC High|DoD|
|---|---|---|
|Microsoft Defender for Endpoint Server GCC|Microsoft Defender for Endpoint Server for GCC High|Microsoft Defender for Endpoint Server for DOD|
|Microsoft Defender for servers|Microsoft Defender for servers - Government|Microsoft Defender for servers - Government|

## Portal URLs

The following are the Microsoft Defender for Endpoint portal URLs for US Government customers:

|Customer type|Portal URL|
|---|---|
|GCC|<https://security.microsoft.com>|
|GCC High|<https://security.microsoft.us>|
|DoD|<https://security.apps.mil>|

> [!NOTE]
> If you're a GCC customer and in the process of moving from Microsoft Defender for Endpoint commercial to GCC, use <https://transition.security.microsoft.com> to access your Microsoft Defender for Endpoint commercial data.

## Endpoint versions

### Standalone OS versions

The following OS versions are supported:

|OS version|GCC|GCC High|DoD|
|:---|:---:|:---:|:---:|
|Windows 11|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 10, version 21H1 and later|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 10, version 20H2 (with [KB4586853](https://support.microsoft.com/help/4586853)) <br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 10, version 2004 (with [KB4586853](https://support.microsoft.com/help/4586853))<br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-version-2004-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-version-2004-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-version-2004-end-of-servicing); upgrade now|
|Windows 10, version 1909 (with [KB4586819](https://support.microsoft.com/help/4586819))<br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1909-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1909-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1909-end-of-servicing); upgrade now|
|Windows 10, version 1903 (with [KB4586819](https://support.microsoft.com/help/4586819))<br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1903-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1903-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1903-end-of-servicing); upgrade now|
|Windows 10, version 1809 (with [KB4586839](https://support.microsoft.com/help/4586839))<br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1803-1809-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1803-1809-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1803-1809-end-of-servicing); upgrade now|
|Windows 10, version 1803 (with [KB4598245](https://support.microsoft.com/help/4598245))<br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1803-1809-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1803-1809-end-of-servicing); upgrade now|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> [Deprecated](/lifecycle/announcements/windows-10-1803-1809-end-of-servicing); upgrade now|
|Windows 10, version 1709|:::image type="icon" source="media/svg/check-no.svg" border="false"::: <br/> Not supported|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: With [KB4499147](https://support.microsoft.com/help/4499147)<br/>See note 1 following this table<br/>[Deprecated](/lifecycle/announcements/revised-end-of-service-windows-10-1709); upgrade now|:::image type="icon" source="media/svg/check-no.svg" border="false"::: <br/> Not supported|
|Windows 10, version 1703 and earlier|:::image type="icon" source="media/svg/check-no.svg" border="false"::: <br/> Not supported|:::image type="icon" source="media/svg/check-no.svg" border="false"::: <br/> Not supported|:::image type="icon" source="media/svg/check-no.svg" border="false"::: <br/> Not supported|
|Windows Server 2022 and later|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2019 (with [KB4586839](https://support.microsoft.com/help/4586839))<br/>See note 1 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2016 (Modern)<br/>See note 2 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2012 R2 (Modern)<br/>See note 2 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2016 (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2012 R2 (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2008 R2 SP1 (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 8.1 Enterprise (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 8 Pro (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 7 SP1 Enterprise (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows 7 SP1 Pro (Legacy) <br/>See note 3 following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Linux|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|macOS|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Android|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> |:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> |:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/>|
|iOS|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> |:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/> |:::image type="icon" source="media/svg/check-yes.svg" border="false"::: <br/>|

> [!NOTE]
>
> 1. The patch must be deployed before device onboarding in order to configure Defender for Endpoint to the correct environment.
> 2. Learn about the [unified modern solution for Windows 2016 and 2012 R2](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2). If you previously onboarded your servers using MMA, follow the guidance provided in [Server migration](server-migration.md) to migrate to the new solution.
> 3. When using the [Microsoft Monitoring Agent](onboard-downlevel.md#install-and-configure-microsoft-monitoring-agent-mma) make sure to choose `Azure US Government` under **Azure Cloud** if using the [setup wizard](/azure/log-analytics/log-analytics-windows-agents#install-agent-using-setup-wizard). If you're using a [command line](/azure/log-analytics/log-analytics-windows-agents#install-agent-using-command-line) or a [script](/azure/log-analytics/log-analytics-windows-agents#install-agent-using-dsc-in-azure-automation), set the `OPINSIGHTS_WORKSPACE_AZURE_CLOUD_TYPE` parameter to `1`. The minimum MMA supported version is `10.20.18029` (March 2020).

### OS versions when using Microsoft Defender for servers

The following OS versions are supported when using [Microsoft Defender for servers](/azure/security-center/security-center-wdatp):


|OS version|GCC|GCC High|DoD|
|:---|:---:|:---:|:---:|
|Windows Server 2022 and later|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2019|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2016|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2012 R2|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Windows Server 2008 R2 SP1|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|

## Required connectivity settings

If a proxy or firewall is blocking all traffic by default and allowing only specific domains through, add the domains listed in the downloadable sheet to the allowed domains list.

The following downloadable spreadsheet lists the services and their associated URLs your network must be able to connect to. Verify there are no firewall or network-filtering rules that would deny access to these URLs, or create an *allow* rule specifically for them.


| Spreadsheet of domains list  | Description  |
|---------|---------|
| Microsoft Defender for Endpoint URL list for Gov/GCC/DoD | Spreadsheet of specific DNS records for service locations, geographic locations, and OS for Gov/GCC/DoD customers. <br/><br/> [Download the spreadsheet here.](https://aka.ms/MDE-gov-urls) |

For more information, see [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md).

> [!NOTE]
> The spreadsheet contains commercial URLs as well, make sure you check the "US Gov" tabs.
>
> When filtering, look for the records labeled as "US Gov" and your specific cloud under the geography column.

## API

Instead of the public URIs listed in our [API documentation](/defender-vulnerability-management/tvm-supported-os), you need to use the following URIs:


|Endpoint type|GCC|GCC High & DoD|
|---|---|---|
|Sign in|`https://login.microsoftonline.com`|`https://login.microsoftonline.us`|
|Defender for Endpoint API|`https://api-gcc.securitycenter.microsoft.us`|`https://api-gov.securitycenter.microsoft.us`|

## Feature parity with commercial

Defender for Endpoint for US Government customers doesn't have complete parity with the commercial offering. While our goal is to deliver all commercial features and functionality to our US Government customers, there are some capabilities not yet available we want to highlight.

These are the known gaps:

|Feature name|GCC|GCC High|DoD|
|---|:---:|:---:|:---:|
|Microsoft Secure Score|:::image type="icon" source="media/svg/check-yes.svg" border="false":::<br/>See note following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Microsoft Threat Experts|:::image type="icon" source="media/svg/check-no.svg" border="false":::|:::image type="icon" source="media/svg/check-no.svg" border="false":::|:::image type="icon" source="media/svg/check-no.svg" border="false":::|
|Microsoft Defender for Endpoint Security Configuration Management|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Microsoft Defender for IoT enterprise IoT security|:::image type="icon" source="media/svg/check-no.svg" border="false":::|:::image type="icon" source="media/svg/check-no.svg" border="false":::|:::image type="icon" source="media/svg/check-no.svg" border="false":::|

> [!NOTE]
> While Microsoft Secure Score is available for GCC, GCC High and DoD customers, there are some security recommendations that aren't available.

These are the features and known gaps for [Mobile Threat Defense (Microsoft Defender for Endpoint on Android & iOS)](mtd.md):

|Feature name|GCC|GCC High|DoD|
|---|:---:|:---:|:---:|
|Reports: Web content filtering|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Reports: Device health|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Web Protection (Anti-Phishing and custom indicators)|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Malware Protection (Android-Only)|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Jailbreak Detection (iOS-Only)|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Conditional Access/Conditional Launch|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Support for MAM|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Privacy Controls|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Microsoft Defender Vulnerability Management core capabilities <br/> (included in Defender for Endpoint Plan 2) <br/>See note following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|
|Microsoft Defender Vulnerability Management premium capabilities <br/>See note following this table|:::image type="icon" source="media/svg/check-yes.svg" border="false"::: |:::image type="icon" source="media/svg/check-yes.svg" border="false":::|:::image type="icon" source="media/svg/check-yes.svg" border="false":::|

> [!NOTE]
> The following Defender Vulnerability Management functionality isn't available for GCC, GCC High, and DoD customers:
>
> - Report inaccuracy
> - Request CVE support

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
