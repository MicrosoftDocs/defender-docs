---
title: List exposure score by device group
description: Retrieves a list of exposure scores by device group.
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
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# List exposure score by device group

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

Retrieves the exposure score for each machine group.

## Permissions

One of the following permissions is required to call this API. To learn more, including how to choose permissions, see [Use Microsoft Defender for Endpoint APIs](apis-intro.md)

|Permission type|Permission|Permission display name|
|---|---|---|
|Application|Score.Read.All|'Read Threat and Vulnerability Management score'|
|Delegated (work or school account)|Score.Read|'Read Threat and Vulnerability Management score'|

## HTTP request

```http
GET /api/exposureScore/ByMachineGroups
```

## Request headers

|Name|Type|Description|
|---|---|---|
|Authorization|String|Bearer {token}.**Required**.|

## Request body

Empty

## Response

If successful, this method returns 200 OK, with a list of exposure score per device group data in the response body.

## Example

### Example request

Here is an example of the request.

```http
GET https://api.security.microsoft.com/api/exposureScore/ByMachineGroups
```

### Example response

Here is an example of the response.

```json
{
    "@odata.context": "https://api.security.microsoft.com/api/$metadata#ExposureScore",
    "value": [
        {
            "time": "2019-12-03T09:51:28.214338Z",
            "score": 41.38041766305988,
            "rbacGroupName": "GroupOne"
        },
        {
            "time": "2019-12-03T09:51:28.2143399Z",
            "score": 37.403726933165366,
            "rbacGroupName": "GroupTwo"
        }
        ...
    ]
}
```
