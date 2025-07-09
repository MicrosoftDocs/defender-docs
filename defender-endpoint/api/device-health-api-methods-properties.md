---
title: Microsoft Defender Antivirus export device antivirus health details API methods and properties
description: "Learn how to export a list of Microsoft Defender Antivirus device health details." 
ms.service: defender-endpoint
ms.author: deniseb 
author: denisebmsft
ms.localizationpriority: medium 
ms.date: 03/21/2025
manager: deniseb 
ms.reviewr: mkaminska
audience: ITPro 
ms.collection:
 - m365-security
 - must-keep
 - tier3
ms.topic: reference 
ms.subservice: reference
ms.custom: api 
search.appverid: met150
---

# Export device antivirus health details API methods and properties

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

[!include[Prerelease information](../../includes/prerelease.md)]

## Export device antivirus health details API description

Retrieves a list of Microsoft Defender Antivirus device health details. This API has different API calls (methods) to get different types of data. Because the amount of data can be large, there are two ways it can be retrieved:

- **JSON response**  The API pulls all data in your organization as JSON responses. This method is best for _small organizations with less than 100-K devices_. The response is paginated, so you can use the \@odata.nextLink field from the response to fetch the next results.

- **via files** This API solution enables pulling larger amounts of data faster and more reliably, and is recommended for large organizations who have more than 100,000 devices. This API pulls all data in your organization as download files. The response contains URLs to download all the data from Azure Storage. This API enables you to download all your data from Azure Storage as follows:

   1. Call the API to get a list of download URLs with all your organization data.

   2. Download all the files using the download URLs and process the data as you like.

Data that is collected using either `JSON response` or by using files is a snapshot of the current state. This data doesn't contain historical data. To collect historical data, you must save the data in your own data storage.

> [!IMPORTANT]
> For Windows Server 2012 R2 and Windows Server 2016 to appear in device health reports, these devices must be onboarded using the modern unified solution package. For more information, see [New functionality in the modern unified solution for Windows Server 2012 R2 and 2016](../onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).
>
> For information about using the **Device health and antivirus compliance** reporting tool in the Microsoft Defender portal, see: [Device health and antivirus report in Microsoft Defender for Endpoint](../device-health-reports.md).

### 1.1 Export device antivirus health details API methods

|Method|Data type|Description|
|---|---|---|
|**(JSON response)**|Microsoft Defender Antivirus health per device collection. See: [1.2 Export device antivirus health details API properties (JSON response)](#13-export-device-antivirus-health-details-api-properties-json-response)|Returns a table with an entry for every unique combination of DeviceId, ConfigurationId. <br/><br/> The API pulls all data in your organization as JSON responses. This method is best for small organizations with less than 100-K devices. The response is paginated, so you can use the @odata.nextLink field from the response to fetch the next results.|
|**(via files)**|Microsoft Defender Antivirus health per device collection. See: [1.3 Export device antivirus health details API properties \(via files\)](#14-export-device-antivirus-health-details-api-properties-via-files)|Returns a table with an entry for every unique combination of DeviceId, ConfigurationId. <br/><br/> This API solution enables pulling larger amounts of data faster and more reliably. So, it's recommended for large organizations, with more than 100-K devices. This API pulls all data in your organization as download files. The response contains URLs to download all the data from Azure Storage. This API enables you to download all your data from Azure Storage as follows: <ol><li>Call the API to get a list of download URLs with all your organization data.</li><li>Download all the files using the download URLs and process the data as you like.</li></ol>|

### 1.2 Limitations

- Maximum page size: 200,000
- Rate limitations for this API: 30 calls per minute and 1,000 calls per hour

### 1.3 Export device antivirus health details API properties (JSON response)

- The properties defined in the following table are listed alphabetically, by property ID. When you use this API, the resulting output won't necessarily be returned in the same order listed in this table.
- Note that **rbacgroupname** and **Id** aren't supported filter operators.
- Some more columns might be returned in the response. These columns can be temporary and might be removed; use only the documented columns.

| Property (ID) | Data type | Description | Example of a returned value |
|---|---|---|---|
| `avEngineUpdateTime` | DateTimeOffset | Datetime when the antivirus engine was last updated on device | "2022-08-04T12:44:02Z" |
| `avEngineVersion` | String | Antivirus engine version | `1.1.19400.3` |
| `avIsEngineUpToDate` | String | Up-to-date status of antivirus engine | `True`, `False`, or `Unknown` |
| `avIsPlatformUpToDate` | String | Up-to-date status of antivirus platform | `True`, `False`, or `Unknown` |
| `avIsSignatureUpToDate` | String | Up-to-date status of antivirus signature | `True`, `False`, or `Unknown` |
| `avMode` | String | Antivirus mode. | Each mode is a string typed integer value ranging from 0 to 5. <br/>`''` = `Other`<br/>`0` = `Active`<br/>`1` = `Passive`<br/>`2` = `Disabled`<br/>`3` = `Other`<br/>`4` = `EDRBlocked`<br/>`5` = `PassiveAudit` |
| `avPlatformUpdateTime` | DateTimeOffset | Datetime when antivirus platform was last updated on device | "2022-08-04T12:44:02Z" |
| `avPlatformVersion` | String | Antivirus platform version | `4.18.2203.5` |
| `avSignaturePublishTime` | DateTimeOffset | Datetime when antivirus security intelligence build was released | "2022-08-04T12:44:02Z" |
| `avSignatureUpdateTime` | DateTimeOffset | Datetime when antivirus security intelligence was last updated on device | "2022-08-04T12:44:02Z" |
| `avSignatureVersion` | String | Antivirus security intelligence version | `1.371.1323.0` |
| `computerDnsName` | String | DNS name | `SampleDns` |
| `dataRefreshTimestamp` | DateTimeOffset | Datetime when data is refreshed for this report | `2022-08-04T12:44:02Z` |
| `fullScanError` | String | Error codes from the full scan | "0x80508023" |
| `fullScanResult` | String | Full scan result of the device | `Completed`, `Canceled`, or `Failed` |
| `fullScanTime` | DateTimeOffset | Datetime when the full scan completed | `2022-08-04T12:44:02Z` |
| `id` | String | Machine GUID | `30a8fa2826abf24d24379b23f8a44d471f00feab` |
| `lastSeenTime` | DateTimeOffset | Last seen datetime of this machine | `2022-08-04T12:44:02Z` |
| `machineId` | String | Machine GUID | `30a8fa2826abf24d24379b23f8a44d471f00feab` |
| `osKind` | String | Operating system kind | `windows`, `mac`, or `linux` |
| `osPlatform` | String | Operating system major version name | `Windows 10` or `macOS` |
| `osVersion` | String | Operating system version | `10.0.18363.1440, 12.4.0.0` |
| `quickScanError` | String | Error codes from quick scan | `0x80508023` |
| `quickScanResult` | String | Quick scan result of this device | `Completed`, `Canceled`, or `Failed` |
| `quickScanTime` | DateTimeOffset | Datetime when quick scan completed | `2022-08-04T12:44:02Z` |
| `rbacGroupId` | Long | Device group ID that this machine belongs to | `712` |
| `rbacGroupName` | String | Name of device group that this machine belongs to | `SampleGroup` |

### 1.4 Export device antivirus health details API properties (via files)

> [!IMPORTANT]
> Information in this section relates to prereleased product which can be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

> [!NOTE]
> - The files are gzip-compressed and in multiline `.json` format.
> - The download URLs are only valid for 3 hours; otherwise you can use the parameter.
> - For maximum download speed of your data, you can make sure you're downloading from the same Azure region that your data resides.
> - Each record uses approximately 1KB of data. You should take this into account when choosing the correct `pageSize` parameter.
> - More columns might be returned in the response. These columns are temporary and might be removed, so use only the documented columns.

| Property (ID) | Data type | Description | Example of a returned value |
|---|---|---|---|
| Export files | array[string] | A list of download URLs for files holding the current snapshot of the organization. | ["https://tvmexportstrstgeus.blob.core.windows.net/tvm-export...1", "https://tvmexportstrstgeus.blob.core.windows.net/tvm-export...2"] |
| GeneratedTime | String | The time that the export was generated. | 2022-05-20T08:00:00Z |

> [!NOTE]
> In each of the export files, there's a property called `DeviceGatheredInfo`, which contains antivirus data. Each of its attributes can provide you with information on the device's health and its status.

## See also

[Export device antivirus health report](device-health-export-antivirus-health-report-api.md)

[Device health and compliance reporting](../device-health-reports.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
