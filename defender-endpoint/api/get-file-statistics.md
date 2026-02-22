---
title: Get file statistics API
description: Learn how to use the Get file statistics API to retrieve the statistics for the given file in Microsoft Defender for Endpoint.
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
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get file statistics API

## API description

Retrieves the statistics for the given file.

## Limitations

- Rate limitations for this API are 100 calls per minute and 1500 calls per hour.
- The maximum value for `lookbackhours` is 720 Hours(30 days).

## Permissions

When obtaining a token using user credentials:

- The user needs to have at least the following role permission: 'View Data'. For more information, see [Create and manage roles](../user-roles.md).

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|File.Read.All|'Read file profiles'|
|Delegated (work or school account)|File.Read.All|'Read file profiles'|

## HTTP request

```http
GET /api/files/{id}/stats
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}. **Required**.|

## Request URI parameters

|Name|Type|Description|
|---|---|---|
|lookBackHours|Int32|Defines the hours we search back to get the statistics. Defaults to 30 days. **Optional**.|

## Request body

Empty

## Response

If successful and file exists - 200 OK with statistical data in the body. If file does not exist - 404 Not Found.

## Example

### Request example

Here's an example of the request.

```http
GET https://api.security.microsoft.com/api/files/0991a395da64e1c5fbe8732ed11e6be064081d9f/stats?lookBackHours=48
```

### Response example

Here's an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#microsoft.windowsDefenderATP.api.InOrgFileStats",
    "sha1": "0991a395da64e1c5fbe8732ed11e6be064081d9f",
    "organizationPrevalence": 14850,
    "orgFirstSeen": "2019-12-07T13:44:16Z",
    "orgLastSeen": "2020-01-06T13:39:36Z",
    "globallyPrevalence": 705012,
    "globalFirstObserved": "2015-03-19T12:20:07.3432441Z",
    "globalLastObserved": "2020-01-06T13:39:36Z",
    "topFileNames": [
        "MREC.exe"
    ]
}
```
