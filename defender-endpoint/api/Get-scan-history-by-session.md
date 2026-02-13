---
title: Get scan history by session
description: Learn how to use the get scan history by session api.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 11/10/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender Vulnerability Management
  - Microsoft Defender for Business
---

# Get scan history by session

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## API description

Retrieves a list of the scan history by session.

## Limitations

Rate limitations for this API are 100 calls per minute and 1,500 calls per hour.

## Permissions

When obtaining a token using user credentials:

- To view data the user needs to have at least the following role permission: `ViewData` or `TvmViewData`. For more information, see [Create and manage roles](../user-roles.md).

- One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md).

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Machine.Read.All| Read all scan information.|
|Delegated (work or school account)|Machine.Read.All|Read all scan information.|

## HTTP request

```http
POST /api/DeviceAuthenticatedScanDefinitions/GetScanHistoryBySessionId
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|string|Bearer {token}. **Required**.|
|Content-Type|string|application/json. **Required**.|

## Request body

In the request body, supply a JSON object with the following parameters:

|Parameter|Type|Description|
|---|---|---|
|SessionIds|String|The session Id. **Required**.|

## Response

If successful, this method returns 200 - OK response code with a list of the scan history for a session.

## Example request

Here's an example of the request.

```http
POST https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/GetScanHistoryBySessionId
```

```json
{
    "SessionIds": ["01decc497f4b4ec49a5fc4e12597f8c8"]
}
```

## Response example

```json
{
 "@odata.context": "https://api.security.microsoft.com/api/DeviceAuthenticatedScanDefinitions/GetScanHistoryBySessionId",
    "value": [
    {
     "orgId": "asdf781a0c-792d-46d3-bbea-a93dbc0bfcaa",
     "ScanDefinitionIds": "4ad8d463-6b3a-4894-b42a-a2de9ea0a8ae",
     "SessionIds": "01decc497f4b4ec49a5fc4e12597f8c8",
     "NumberOfSuccessfullyScannedTargets": 3,
     "NumberOfTargets": 3,
     "ScanStatus": "Success",
     "LastScanned": "2022-12-19T15:14:24.5561791Z",
     "ListScannedTargets": {
         "Ip": "127.0.0.1",
         "Hostname": "DESKTOP-Test",
         "ScannedDeviceDescription": "Network device",
         "ErrorMessage": "",
         "ScanStatus": "Success",
         "ScanDuration": "00:08:30",
        },
        {
         "Ip": "127.0.0.2",
         "Hostname": "DESKTOP-Test2",
         "ScannedDeviceDescription": "Network device 2",
         "ErrorMessage": "",
         "ScanStatus": "Success",
         "ScanDuration": "00:08:00",
        },
{
         "Ip": "127.0.0.3",
         "Hostname": "DESKTOP-Test3",
         "ScannedDeviceDescription": "Network device 3",
         "ErrorMessage": "",
         "ScanStatus": "Success",
         "ScanDuration": "00:08:50",
        },
    }
  ]
}
```
